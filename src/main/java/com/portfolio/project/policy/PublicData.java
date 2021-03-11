package com.portfolio.project.policy;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;

@WebServlet("/PublicData.do")
public class PublicData extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public PublicData() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	 
	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        request.setCharacterEncoding("UTF-8");
	        //response.setContentType("text/html; charset=utf-8");
	        response.setContentType("text/html;charset=UTF-8"); 

	        String addr = "https://openapi.gg.go.kr/JobFndtnSportPolocy?ServiceKey=";
	        String serviceKey = "067717d2bbcb47afa3cbd676d6ebe0d3";
	        String parameter = "";
//	        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
	        PrintWriter out = response.getWriter();
	        parameter = parameter + "&" + "pIndex=1";
	        parameter = parameter + "&" + "pSize=10";
	        parameter = parameter + "&" + "Type=json";
	        
	        addr = addr + serviceKey + parameter;
	        URL url = new URL(addr);
	        
	        InputStream in = url.openStream(); 
	        CachedOutputStream bos = new CachedOutputStream();
	        IOUtils.copy(in, bos);
	        in.close();
	        bos.close();
	        
//	        out.println(addr);
	        
	        String data = bos.getOut().toString();        
	        out.println(data);
	        
	        JSONObject json = new JSONObject();
	        json.put("data", data);
	        
	    }
	 
	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	    	request.setCharacterEncoding("UTF-8");
	    	response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");
	        
	        String addr = "https://openapi.gg.go.kr/JobFndtnSportPolocy?Key=";
	        String serviceKey = "c44bf33f48334906a53b2585cb621256";
	        String parameter = "";
//	        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
	        PrintWriter out = response.getWriter();
	        parameter = parameter + "&" + URLEncoder.encode("pIndex", "UTF-8")+"="+URLEncoder.encode("1", "UTF-8");
	        parameter = parameter + "&" + URLEncoder.encode("pSize", "UTF-8")+"="+URLEncoder.encode("34", "UTF-8");
	        parameter = parameter + "&" + URLEncoder.encode("Type", "UTF-8")+"="+URLEncoder.encode("json", "UTF-8");
	        
	        addr = addr + serviceKey + parameter;
	        URL url = new URL(addr);
	        System.out.println(url);
	        InputStream in = url.openStream(); 
	        CachedOutputStream bos = new CachedOutputStream();
	        IOUtils.copy(in, bos);
	        in.close();
	        bos.close();
	        
//	        out.println(addr);
	        
	        String data = bos.getOut().toString();        
	        out.println(data);
	        URLEncoder.encode(data, "UTF-8");
	        JSONObject json = new JSONObject();
	        //response.getWriter().print(data);

	        json.put("data",data);
	        System.out.println(data);


	    }
	}

package com.portfolio.project.policy;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONObject;

@WebServlet("/JobFndActData.do")
public class JobFndActData extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public JobFndActData() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	 
	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        request.setCharacterEncoding("UTF-8");

	        response.setContentType("text/html;charset=UTF-8"); 

	        String addr = "https://openapi.gg.go.kr/JobFndtnTosAct?KEY=";
	        String serviceKey = "c44bf33f48334906a53b2585cb621256";
	        String parameter = "";

	        PrintWriter out = response.getWriter();
	        parameter = parameter + "&" + "pIndex=1";
	        parameter = parameter + "&" + "pSize=150";
	        parameter = parameter + "&" + "Type=json";
	        
	        addr = addr + serviceKey + parameter;
	        URL url = new URL(addr);
	        System.out.println(url);
	        InputStream in = url.openStream(); 
	        CachedOutputStream bos = new CachedOutputStream();
	        IOUtils.copy(in, bos);
	        in.close();
	        bos.close();
	        String data = bos.getOut().toString();        
	        out.println(data);
	        
	        JSONObject json = new JSONObject();
	        json.put("data", data);
	        
	        System.out.println(data);
	    }

}

package com.portfolio.project.policy;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * xml 파일 읽기 예시용
 * @author hmin
 *
 */
public class XmlReader {
	public static void main(String argv[]) {
		 
		try {
			File file = new File("C:/Users/hmin/Desktop/youthcenter.xml");
			DocumentBuilderFactory docBuildFact = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuild = docBuildFact.newDocumentBuilder();
			Document doc = docBuild.parse(file);
			doc.getDocumentElement().normalize();
 
			System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
			System.out.println();
 
			// person엘리먼트 리스트
			NodeList emplist = doc.getElementsByTagName("emp");
 
			for (int i = 0; i < emplist.getLength(); i++) {
 
				System.out.println("---------- personNode "+ i + "번째 ------------------");
 
				Node emp = emplist.item(i);
 
				if (emp.getNodeType() == Node.ELEMENT_NODE) {
					// person엘리먼트 
					Element empElmt = (Element) emp;
 
					// name 태그
					NodeList nameList= empElmt.getElementsByTagName("polyBizSjnm");
					Element nameElmnt = (Element) nameList.item(0);
					Node polyBizSjnm = nameElmnt.getFirstChild();
					System.out.println("polyBizSjnm    : " + polyBizSjnm.getNodeValue());
 
					// tel 태그
					NodeList telList= empElmt.getElementsByTagName("polyBizSecd");
					Element telElmnt = (Element) telList.item(0);
					Node polyBizSecd = telElmnt.getFirstChild();
					System.out.println("tel     : " + polyBizSecd.getNodeValue());
 
					// address 태그
					NodeList addressList= empElmt.getElementsByTagName("polyItcnCn");
					Element addressElmnt = (Element) addressList.item(0);
					Node polyItcnCn = addressElmnt.getFirstChild();
					System.out.println("polyItcnCn : " + polyItcnCn.getNodeValue());
				}
 
				System.out.println("---------------------------------------------");
				System.out.println();
			}
 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

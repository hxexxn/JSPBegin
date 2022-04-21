<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="service.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="service.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   Enumeration files = null;
   int maxSize = 1024 * 1024 * 100;
   String uploadDir = "/home/he/eclipse-workspace/JSPBegin/WebContent/img";
   String encoding = "UTF-8";
   MultipartRequest multipartRequest
   = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
   files = multipartRequest.getFileNames();
   String name = (String)files.nextElement();
   File test = multipartRequest.getFile(name);
   BoardDAO dao = new BoardDAO();
   dao.upload(test);	
%>
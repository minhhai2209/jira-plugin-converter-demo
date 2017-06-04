package minhhai2209.jirapluginconverterdemo;

import com.google.common.base.Charsets;
import com.google.common.io.Resources;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ApplicationController {

  @RequestMapping(value = "descriptor", produces = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public String atlassianConnectJson() throws IOException {
    URL url = Resources.getResource("atlassian-connect.json");
    String content = Resources.toString(url, Charsets.UTF_8);
    return content;
  }

  @RequestMapping(value = "condition/{path}", produces = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public Map<String, Object> condition(HttpServletRequest request) {
    Enumeration<String> headerNames = request.getHeaderNames();
    while (headerNames.hasMoreElements()) {
      String headerName = headerNames.nextElement();
      String value = request.getHeader(headerName);
      System.out.println(headerName + " " + value);
    }
    return new HashMap<String, Object>() {{

      put("shouldDisplay", true);
    }};
  }

  @RequestMapping(value = {"{path}", "{path}/{path}"})
  public String content(
      HttpServletRequest request,
      Model model,
      @PathVariable("path") String path,
      @RequestParam(value = "xdm_e", required = false) String baseUrl,
      @RequestParam(value = "cp", required = false) String cp,
      @RequestHeader Map<String, String> headers,
      @RequestParam Map<String, String> parameters,
      @RequestBody(required=false) String body) {

    System.out.println(request.getRequestURL() + "?" + request.getQueryString());
    System.out.println(path);
    System.out.println(headers);
    System.out.println(parameters);
    System.out.println(body);
    String scriptUrl =  baseUrl + cp + "/atlassian-connect/all.js";
    String cssUrl =  baseUrl + cp + "/atlassian-connect/all.css";
    model.addAttribute("scriptUrl", scriptUrl);
    model.addAttribute("path", path);
    model.addAttribute("parameters", parameters);
    model.addAttribute("cssUrl", cssUrl);
    return "content";
  }
}

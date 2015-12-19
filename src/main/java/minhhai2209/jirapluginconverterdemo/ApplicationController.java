package minhhai2209.jirapluginconverterdemo;

import java.io.IOException;
import java.net.URL;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Charsets;
import com.google.common.io.Resources;

@Controller
public class ApplicationController {

  @RequestMapping(value = "descriptor", produces = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public String atlassianConnectJson() throws IOException {
    URL url = Resources.getResource("atlassian-connect.json");
    String content = Resources.toString(url, Charsets.UTF_8);
    return content;
  }

  @RequestMapping(value = "{path}")
  public String content(
      Model model,
      @PathVariable("path") String path,
      @RequestParam(value = "xdm_e", required = false) String baseUrl,
      @RequestParam(value = "cp", required = false) String cp,
      @RequestHeader Map<String, String> headers,
      @RequestParam Map<String, String> parameters,
      @RequestBody(required=false) String body) {

    System.out.println(path);
    System.out.println(headers);
    System.out.println(parameters);
    System.out.println(body);
    String scriptUrl =  baseUrl + cp + "/atlassian-connect/all.js";
    model.addAttribute("scriptUrl", scriptUrl);
    model.addAttribute("path", path);
    model.addAttribute("parameters", parameters);
    return "content";
  }
}

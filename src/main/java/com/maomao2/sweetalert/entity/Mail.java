package com.maomao2.sweetalert.entity;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class Mail {
  @Email
  @NotEmpty
  private String to;
  @NotEmpty
  private String subject;
  @NotEmpty
  private String body;

  public String getTo() {
    return to;
  }

  public void setTo(String to) {
    this.to = to;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getBody() {
    return body;
  }

  public void setBody(String body) {
    this.body = body;
  }
}

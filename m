Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD939676D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:49:50 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnm2v-0000M0-T9
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lnlzV-0006dK-9g
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:46:17 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lnlzT-0004Ej-P7
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:46:17 -0400
Received: by mail-il1-x131.google.com with SMTP id x9so5533771ilp.4
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 10:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bvugVqyI6/K9yfOh2XLO2F+ApJqiPnh8J1+e4XYUxzE=;
 b=vC2GuukIBThlEB0oqksnYSI1HvBZZgjpM2wcvzXm0qj/Sn3zNpzdVjOVxR0jvBDd14
 vTG1dk9lDo+ykzDy1yjAYWCpW6ndW0MpZMYBuEkd3EYu8EjbI+/ja2KXjDioHJ83edNU
 JtLfNJ9Q5/R0orl6BZtZNthndNRe5GUKIhkBIMBlzyAzxp383xXNo5uFJHfkOp4J+Urb
 BMlGWOWNwpHKPLkK8BLx8/h/h+1iU/9uMhKpNnA7cu2W4qiBZ2BjSER9PhS+lN9S46xA
 Zh5qOeKilXwhYYPdmOwbsGHfSWX+E3UXc16NPy+NztCtCgIbfM+M3cwa2GPBSZhPgqGR
 KK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvugVqyI6/K9yfOh2XLO2F+ApJqiPnh8J1+e4XYUxzE=;
 b=mpSzcBYTrITjJfbooPtTvaxL0hVHXSQrCqtSdU0ly4cFbv/ZaAdh7w3cAxFNHb+QZ2
 HFUyJVUm7lY/8zVZs7cY7JxA6T4WobIYtF5aPtIluvaqqFJUDybFp8KE5o8TLSUE+G3s
 oxgupp9VqjlswFTmEReJJKy8wOEfDHFU8xZl/TLUu4IIAjTI0mqvLaH2cRIIVKp8JST1
 itHcZ2esWckAJDRIpE4FgtZ1zIYSG9sBEI+3ZDq+AGz0JNRg/mcC2d1gvMSJGNUR0GCJ
 mDLpI9VXbsErY/6H/eV86Qgfut8Y0cH4oIg62kODmgrR+kDYcJkPxU4nY82X/kHYH901
 bKkA==
X-Gm-Message-State: AOAM531ES89w3ydDta+irDYCCh1Jbemcdq7T3ZUGinp71aqXBXvyCKzD
 wL01qLYtUVxX8iFopbi1+CNW4aQFa71+qr+bg70=
X-Google-Smtp-Source: ABdhPJxnIDgd+pXImF6DejX4TjSv7PN2OhYgbxROSn3atkrIORyfTFXPiE9CM/Wel7eKZsOEPZ5mM749pnUSWNQOlUo=
X-Received: by 2002:a92:cd4b:: with SMTP id v11mr3695084ilq.80.1622483174321; 
 Mon, 31 May 2021 10:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6ztm-8A5Dt4xnzO7RM1rSGgsKyy9yB0AwrqQzCK1HVr0Z0Yg@mail.gmail.com>
 <YLTy8CoIchkUr4aU@stefanha-x1.localdomain>
In-Reply-To: <YLTy8CoIchkUr4aU@stefanha-x1.localdomain>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Mon, 31 May 2021 23:15:48 +0530
Message-ID: <CAN6ztm9wZH50FKj+A+tSOAHM+tQ9WfjcMX30++X00wtAX5Hr2w@mail.gmail.com>
Subject: Re: GSoC 2021: Request for WIKI account to update project details
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004271b305c3a3cdff"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004271b305c3a3cdff
Content-Type: text/plain; charset="UTF-8"

Hello Stefan,

Thank you.


On Mon, May 31, 2021 at 8:00 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, May 27, 2021 at 12:35:48AM +0530, Niteesh G. S. wrote:
> > I kindly request the admin to grant me access to the wiki through the
> below
> > credentials
>
> Hi Niteesh,
> I have created an account for you and sent you the details privately.
>
> Stefan
>

--0000000000004271b305c3a3cdff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo Stefan,</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Thank you.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
May 31, 2021 at 8:00 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redh=
at.com">stefanha@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, May 27, 2021 at 12:35:48AM +0530, Nitees=
h G. S. wrote:<br>
&gt; I kindly request the admin to grant me access to the wiki through the =
below<br>
&gt; credentials<br>
<br>
Hi Niteesh,<br>
I have created an account for you and sent you the details privately.<br>
<br>
Stefan<br>
</blockquote></div>

--0000000000004271b305c3a3cdff--


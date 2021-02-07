Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2231262B
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 18:08:05 +0100 (CET)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8nXX-0000F6-Tg
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 12:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1l8nRV-0003aN-9d
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 12:01:51 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1l8nRH-0002Qo-VQ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 12:01:48 -0500
Received: by mail-io1-xd2c.google.com with SMTP id n2so12581625iom.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 09:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SCRaNmJINmAWMlZvSEHfCLRMrMO1qfhY3KdgN4Kyt+w=;
 b=Gt8qDT3JCYtuWGEVcrtyRnRM09POPOdHMq6tjHS2lbsjFVdA2KJsrXB+ImV1v1rBsw
 N7dh3GDrkr8Y94YndyMdifrJbA/eFrj3JVBakuNb8ImLfpD5iva7ofoTHTzl0qdmlLKI
 Z6/7hTxncpOMXg/Sm5XqtZVUm0vp+z7NSuGvPSRsBayErfbITv3fLlqDII2uxFPyLKvJ
 lW3hfT+XhKnbBh0S5GKFgCNRnwOCMKeKuApOS9BKgdR0nvvVuRroM+ixVPIayPF/qU5R
 GROmAPhoOLlfHCZjHaznOaRFpiGQc3CvDhWAsuJCnEHgUaZvPxdX8SyrIxLSudCNuGQe
 tYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SCRaNmJINmAWMlZvSEHfCLRMrMO1qfhY3KdgN4Kyt+w=;
 b=CJyFrK/V0TpRFhO92hU6TmcrQh9kzPTeDOesZ8jdbj24dO5LR4OdMapum7WkAblF4x
 c/S1TJqNLRvstRyTH9OMK7TCw+GqxViwawkfL49VLfAP3SDW0IOhrsMB3K7g2nhUcb/u
 FzXEgeOtwFi3BKmncPANWY81blz9+0nQSOOn7fW1Ptza2NG/vsI/3qAmoLXkW0vqVM9Y
 NboeHD3E6z6IThNMgvEVJqz6gB6OF7wT30+nZ2g7/v8vlG+na4oMczlbpCTUE8V2gg1e
 HXJF2BuxtVOB4NvMENdQ5+3WjegOWKncNna4jOaRWQcGrLOAwc2SkF78pb9mQ1HgiY99
 OodA==
X-Gm-Message-State: AOAM53181eeEhOPbihyFlrA5cq5B5WVs4/igXdJPmGAKwfUAZqMcYH2W
 T8EN2L/qSphpIlPvb7fxMwHGFhy5oF/6H9fqxG7sqE/iLLL40w==
X-Google-Smtp-Source: ABdhPJykvpUcgCEbV99t1Jmu97sKgLRiuO3Ng5Kv8j6pF5v4krlwKH8tZrXTl216o3af2nIfG3JF39Vt4InUaHNcllw=
X-Received: by 2002:a6b:144c:: with SMTP id 73mr12318967iou.69.1612717288746; 
 Sun, 07 Feb 2021 09:01:28 -0800 (PST)
MIME-Version: 1.0
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Sun, 7 Feb 2021 22:31:02 +0530
Message-ID: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
Subject: Interested in contributing to QEMU
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001e70a205bac20178"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2c.google.com
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
Cc: me@xcancerberox.com.ar, jsnow@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001e70a205bac20178
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am Niteesh, a junior student(3rd year) pursuing Electronics and
Communication
engineering. I was also a GSoC student for RTEMS last year. My main area of
interest is low-level development (OS, Emulators, Hardware design, etc).

I wanted to start contributing from last year itself but was occupied with
academic
work. I have started working on small patches. My ultimate goal is to learn
about
how QEMU works, contribute and learn as much as possible.

I tried going through the Arduino emulation code. I was able to understand
it from
a high level but couldn't understand underlying details. I went through few
blog
posts related to QEMU internals but they didn't help much. I plan to step
through
the code but the sheer size of the codebase is scary(Tips regarding
debugging are
very much welcomed). AFAIK the source code is mostly the documentation for
QEMU. If someone knows any docs or articles that will help a beginner get
started
it would be great.

I would also like to take part in GSoC this year. I find the below two
projects interesting
1)
https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visualizer
This one is from last year AFAIK no one has worked on it. If so I would like
to work on it. I have CC'ed the mentors of this project to share some more
details
regarding it. Have you guys decided on the netlist parser lib, UI lib? Is
there something
that I could work on or read to get myself familiarized with the JSON event
IO stuff?

2)
https://wiki.qemu.org/Google_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.28TUI.29
This is something that I don't know much about. I have a basic idea about
what
QMP is but I never used it. The docs say that the Async QMP library is a
work
in progress. If someone can hook me up with some small tasks in this
library it would
be really helpful in improving my understanding.

I would like to work on these projects even outside of GSoC if someone is
ready to
mentor in their free time :).

Thanks
Niteesh.

--0000000000001e70a205bac20178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I am Niteesh, a j=
unior student(3rd year) pursuing Electronics and Communication</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">engineering. I was also a G=
SoC student for RTEMS last year. My main area of</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">interest is low-level development (OS, Em=
ulators, Hardware design, etc).</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">I wanted to start contributing from last year itself but was occupie=
d with academic</div><div class=3D"gmail_default" style=3D"font-size:small"=
>work. I have started working on small patches. My ultimate goal is to lear=
n about</div><div class=3D"gmail_default" style=3D"font-size:small">how QEM=
U works, contribute=C2=A0and learn as much as possible.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I tried going through the Arduino emulation =
code. I was able to understand it from</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">a high level but couldn&#39;t understand underlying=
 details. I went through few blog</div><div class=3D"gmail_default" style=
=3D"font-size:small">posts related to QEMU internals but they didn&#39;t he=
lp much. I plan to step through</div><div class=3D"gmail_default" style=3D"=
font-size:small">the=C2=A0code but the=C2=A0sheer size of the codebase is s=
cary(Tips regarding debugging are</div><div class=3D"gmail_default" style=
=3D"font-size:small">very much welcomed). AFAIK the source code is mostly t=
he documentation for</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">QEMU. If someone knows any docs or articles that will help a beginner=
 get started</div><div class=3D"gmail_default" style=3D"font-size:small">it=
 would be great.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I would =
also like to take part in GSoC this year. I find the below two projects=C2=
=A0interesting</div><div class=3D"gmail_default" style=3D"font-size:small">=
1)=C2=A0<a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_em=
ulated_Arduino_board_visualizer" target=3D"_blank">https://wiki.qemu.org/Go=
ogle_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visualizer</a></div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><div class=3D"gmail_de=
fault">This one is from last year AFAIK no one has worked on it. If so I wo=
uld like</div><div class=3D"gmail_default">to work on it. I have CC&#39;ed =
the mentors of this project to share some more details</div><div class=3D"g=
mail_default">regarding it. Have you guys decided on the netlist parser lib=
, UI lib? Is there something</div><div class=3D"gmail_default">that I could=
 work on=C2=A0or read to get myself familiarized with the JSON event IO stu=
ff?</div><div class=3D"gmail_default"></div></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">2)=C2=A0<a href=3D"https://wiki.qemu.org/Google_Summer=
_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_t=
ext_user_interface_.28TUI.29" target=3D"_blank">https://wiki.qemu.org/Googl=
e_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28=
QMP.29_text_user_interface_.28TUI.29</a></div><div class=3D"gmail_default" =
style=3D"font-size:small">This is something that I don&#39;t know much abou=
t. I have a basic idea about what</div><div class=3D"gmail_default" style=
=3D"font-size:small">QMP is but I never used it. The docs say=C2=A0that the=
 Async QMP library is a work</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">in progress. If someone can hook me up with some small tasks =
in this library it would</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">be really helpful in improving my understanding.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I would like to work on these projects e=
ven outside of GSoC if someone is ready to</div><div class=3D"gmail_default=
" style=3D"font-size:small">mentor in their free time :).=C2=A0</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Thanks</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Niteesh.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div></div>

--0000000000001e70a205bac20178--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCC33A3B6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 10:05:47 +0100 (CET)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLMh0-000470-5n
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 05:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lLMfZ-0003GY-UA
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 05:04:17 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:40741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lLMfW-0008Rw-V0
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 05:04:17 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 j20-20020a4ad6d40000b02901b66fe8acd6so2620237oot.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 01:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stonybrook.edu; s=sbu-gmail;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bb9noCtEXbMPIUObjusLVxB/QQ6V9J9rH4h9RqvOHyM=;
 b=ssNfuQroZ+XkDHpzRt7W4zSJ6qJ4mPGptx8cUsFeNXQVn83Pdm4gFFFmyxAigqlVHO
 QFkru2boOeM8aeiJ67uO6PYcstHKvHv+fy6MoUruzqpJEm1YXnR6k64Hpf1gNBs00Fgx
 eaJ9wchnrUE7eAl+hh1fdgFSIzTej1mSLZwus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bb9noCtEXbMPIUObjusLVxB/QQ6V9J9rH4h9RqvOHyM=;
 b=lrz5ebLcQIZLK8YF16OCWt19Fl7pr0PO6m965dfb1Ss5CmyM5MABiYAzL9irOu5sId
 RelNPRYLoMAAMZL2yv/WwB0oQXKKlKPobEnMihSPHtp47UL9EfD21/TD9qAvoltfY5sY
 wpiiq5eIsWXQbsC5fbLATwoTJrSSdgWZm3MuHwgEzWTfgcFmaObXGSoQvqo1A/9P+VDv
 nbxz7gw0ski0ZXYFYCy/aMRGdyTWxlT6Josz6qhnr+xAhJIZ19ivJwBxy/ERZH6qpfRC
 4KoO4Uxaf/3W/R9PdHm4xVT4yIr20zchSlrfFsi4/ys3hBuf3uMQqBIItcBVe9lj8Y8W
 glPA==
X-Gm-Message-State: AOAM531bboMwUg2iFNWfFznS14vK2ZCghA+3SKYtjfBC9kBZ71bUGDoe
 W+co//jv/kCMNC+6rQ3nQHOvFv85Xlxiz2iwzCPhqQ==
X-Google-Smtp-Source: ABdhPJytaSMtRyE6mgkdiJ7iXU7oMxuikBE4Ecg7uLfAUJEVZjam8VXZiZnf1r5brlNl2s+uV6JUhIpxa5+jZYoKSQI=
X-Received: by 2002:a4a:e093:: with SMTP id w19mr9584807oos.53.1615712652746; 
 Sun, 14 Mar 2021 01:04:12 -0800 (PST)
MIME-Version: 1.0
From: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>
Date: Sun, 14 Mar 2021 14:34:01 +0530
Message-ID: <CAJGDS+FGbOseggf6PnYFdq+-SLKKUkWB7FAhy8Oe3b3r43PBiw@mail.gmail.com>
Subject: Questions about timer interrupt handling in QEMU
To: qemu-discuss <qemu-discuss@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b9f60f05bd7b6ae3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=akalita@cs.stonybrook.edu; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b9f60f05bd7b6ae3
Content-Type: text/plain; charset="UTF-8"

Hello all,

This is a continuation of some of the questions I had about the clock
record-replay handling process in QEMU. My previous post is here -

https://www.mail-archive.com/qemu-discuss@nongnu.org/msg06231.html


My experiment involves two steps. In the first step, I start QEMU in KVM
mode, save the QEMU state and record the host clock values for some time.
In the second step, I load the guest while starting QEMU in TCG mode. I
replay the host clock values as and when they are accessed. By definition,
the host clock is used by device models that simulate real time sources and
is a source of non-determinism. Below are some of the questions I have -


- How do I ensure that the CPU configuration is exactly the same in KVM vs
TCG modes? Can we use a generic CPU model, like "qemu64" and that ensures
it? Will different CPU flags in both the modes affect it ?

- I continuously see that the contents of memory are different when the
guest tries to run a timer interrupt handler after it is loaded. Basically
what happens is that I keep getting page faults when the hander tries to
erase a timer from the rbtree. I seem to be replaying the host clock
correctly, what else, might be wrong?

- Given the minimal replay requirements I have, is it enough if I only
record the host clock timer ? Or do I need to record the other clock timer
types in addition to it to make the guest behave correctly ?


Thanks for reading and answering.

Best Regards,
Arnab

--000000000000b9f60f05bd7b6ae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,<br></div><div><br></div><div><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" id=3D"gmail-d=
ocs-internal-guid-41ae5a0c-7fff-65e8-0596-b9e1726ac0e6"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre-wrap">This is a continuation of som=
e of the questions I had about the clock record-replay handling process in =
QEMU. My previous post is here -</span></p><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre-wrap"><a href=3D"https://www.mail-archive.co=
m/qemu-discuss@nongnu.org/msg06231.html">https://www.mail-archive.com/qemu-=
discuss@nongnu.org/msg06231.html</a></span></p><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre-wrap"><br></span></p><p style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre-wrap">My experiment involves two steps. In the firs=
t step, I start QEMU in KVM mode, save the QEMU state and record the host c=
lock values for some time. In the second step, I load the guest while start=
ing QEMU in TCG mode. I replay the host clock values as and when they are a=
ccessed. By definition, the host clock is used by device models that simula=
te real time sources and is a source of non-determinism. Below are some of =
the questions I have -</span></p><p style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><br><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre-wrap"></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt" id=3D"gmail-docs-internal-guid-dc001e66-7fff-3767=
-2cce-13d2ca9650a7"><span style=3D"font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre-wrap">- How do I ensure that the CPU configuration is exactly the same =
in KVM vs TCG modes? Can we use a generic CPU model, like &quot;qemu64&quot=
; and that ensures it? Will different CPU flags in both the modes affect it=
 ?</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">- I continuously see that the contents of memory are different when =
the guest tries to run a timer interrupt handler after it is loaded. Basica=
lly what happens is that I keep getting page faults when the hander tries t=
o erase a timer from the rbtree. I seem to be replaying the host clock corr=
ectly, what else, might be wrong?</span></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:none;vertical=
-align:baseline;white-space:pre-wrap">- Given the minimal replay requiremen=
ts I have, is it enough if I only record the host clock timer ? Or do I nee=
d to record the other clock timer types in addition to it to make the guest=
 behave correctly ?</span></p><p style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap"></span></p></div><div><br></div><div>Thanks for reading and answeri=
ng.<br><br></div><div>Best Regards,<br></div><div>Arnab<br></div><div><br><=
/div><div><br></div><div><br></div><div><br></div><div><br></div><div><br><=
/div><div><br></div></div>

--000000000000b9f60f05bd7b6ae3--


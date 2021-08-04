Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F3E3E020C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:32:10 +0200 (CEST)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBH0D-0003iI-Gq
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mr.zleo10@gmail.com>)
 id 1mBB7B-000111-Ob
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 03:14:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mr.zleo10@gmail.com>)
 id 1mBB7A-0002gr-44
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 03:14:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id a8so1662177pjk.4
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:cc:to;
 bh=SoI4EKA1PBOT8zjgUwJdWznG3uuZye7jQngva+bo2FE=;
 b=nm8ogr1XSAwJ7PlGKeL6Z+yP78K0k81Mh7pRzoNWdelPCTQ3qo8c1s8uPJtmzcd2Ee
 qWBQ96v8JYXkABkahU73TFFGhZHt9dEOegw7geusTSwAtLVMF9i1Xtp3cp/tdPaoVhla
 ShQYX96Xkym6sc5ZBhg9aIom50zqm55yylHWKipzAsi/1X3Jl1U74waSpRUNpQbjYISo
 elTGondFdX2DtEfdAMUMfQSRayA0FZ3b7Du5VCJVgdaEn6zqLABSwBJiM52lzMry3qI0
 I2HkgsaZclLS8qBaI2N4NRPwWw6w+1kOUi+rY1gFwGPXeBCB3HlfSnqgfCWS/FeBaxQA
 P2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
 bh=SoI4EKA1PBOT8zjgUwJdWznG3uuZye7jQngva+bo2FE=;
 b=XPI3H845slhYWLPGWTAJdGieAzdMpuRWMYjZRKXNW9W0AotcFbwMPY1ZV+dTAnFIlF
 615iUOvKN94q6tXCWXSB4SUI2OFal4IO7R8oPUuJMldlB8GPwOBY+O/uQ22JGod09ANu
 ZhLt6juqW7xU4f6Bd3QdmaBcxnq3bY7Bh0RHRgHJyDZW4IpSVZ0xLna4r2Dys/Co1izb
 M51uGmYZYKOiiXs6NV1T1KuBX1bU6I3lWXIRNXLAIuGLPBqqzYLPhyIovYq0NShmdN/+
 ydkTD/Hf7j7UW583i6ArwP3/aERzrTpLXzqrYU0VXZnNW/U7TCDOAWMh2/Vm2ulU8mRD
 k1eg==
X-Gm-Message-State: AOAM530DxMPeVXhk+TKh2SO5wKhF8cfRnU7bytFMDMOQVpQtpTQcMm0T
 xu8yc3ZzlhaQ+BNcqRJcDYxcTveDX8z3O7JwIuw=
X-Google-Smtp-Source: ABdhPJy2bYyh3Crj+rx1Ut9AFfezJJND0cgh6r/46RWZ8jV89HBpTsAJQoFFreXz4OhPOaqsUJiODA==
X-Received: by 2002:a17:90a:64c1:: with SMTP id
 i1mr8460436pjm.217.1628061293022; 
 Wed, 04 Aug 2021 00:14:53 -0700 (PDT)
Received: from smtpclient.apple ([202.131.71.236])
 by smtp.gmail.com with ESMTPSA id p3sm5001295pjt.0.2021.08.04.00.14.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Aug 2021 00:14:52 -0700 (PDT)
From: Jing Zhang <mr.zleo10@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_BC81FC87-8591-46FB-B3E9-55A6FD2F3490"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Question about "QEMU Internals: Event loops"
Message-Id: <DDC776C9-D0E1-4BD4-8AC4-9EA7EB1EEF91@gmail.com>
Date: Wed, 4 Aug 2021 15:14:49 +0800
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=mr.zleo10@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 Aug 2021 09:22:26 -0400
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
Cc: stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_BC81FC87-8591-46FB-B3E9-55A6FD2F3490
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Stefan,

I have read your article =E2=80=9CQEMU Internals: Event loops=E2=80=9D =
in your blog, which helps me a lot to understand how QEMU=E2=80=99s =
thread model works. However, I still have a few questions here.

Firstly, I have done some research in QEMU=E2=80=99s thread model and I =
know that QEMU use glib GMainContext and AioContext to achieve event =
loop, which is responsible for IO event and other events like timer or =
BH. Also, I know QEMU use vCPU thread to emulate real CPU which do the =
calculation. Our guest OS works on these vCPU thread. If there=E2=80=99s =
no IO or other event, vCPU will keep doing its job and guest OS runs as =
a host OS.

But when I am trying to figure out how these things connects, problems =
occurred. As far as I am concerned, once guest OS start to work, vCPU =
thread will act as a real CPU controlled by kvm and if there=E2=80=99s a =
IO event happens, we should exit guest mode and back to user mode(i.e. =
QEMU). When this happen, we back to vCPU thread and handle different =
event by checking run->exit_reason. For examples, if guest OS sends a =
disk request(like store a file into disk), kvm exit, vCPU thread handles =
it and dispatch the write request to a MemoryRegion. This procedure is =
reasonable but it do not use event loop. That means event loop do =
nothing in this procedure.

Therefore, what I am confused is, when and how vCPU thread dispatch =
these IO event to main-loop or IO thread? In detail, what kinds of =
function in QEMU changes the fd that main-loops(in detail, system call =
select/poll/epoll) are listening?

In the article, I see =E2=80=9CSome devices perform the guest device =
register access in the main loop thread or an IOThread thanks to =
ioeventfd=E2=80=9D, so I learn about the knowledge about eventfd. After =
that, I successfully detected a behavior that QEMU uses this mechanism =
to change fds(event_notifier_set()) and main-loop runs this IO event =
while virtio is used. In other situation, for instance, if we don=E2=80=99=
t use virtio (use a pure emulation of hardware), what=E2=80=99s the =
way(in detail, what=E2=80=99s the function) that change the fd and =
how(in detail, what=E2=80=99s the function backtrace)?

I cares about this because I think if IO event happen, if vm exit, vCPU =
thread must take the responsibility to determine what kinds of IO event =
can be done by blocking IO(i.e. doing IO in vCPU thread) and what kinds =
of IO event should dispatch to an event loop.  But in fact, in the code, =
I can=E2=80=99t find this logic except ioeventfd(and it should use =
virtio as well). Hence, this question sounds like asking how CPU =
communicate with hardware, although all of them aren=E2=80=99t real.

I am looking forward to your reply! Thanks.


--Apple-Mail=_BC81FC87-8591-46FB-B3E9-55A6FD2F3490
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><span =
style=3D"font-size: 14px;" class=3D""><font face=3D"Arial" class=3D"">Hi =
Stefan,</font></span><div class=3D""><font face=3D"Arial" class=3D""><span=
 style=3D"font-size: 14px;" class=3D""><br class=3D""></span></font><div =
class=3D""><span style=3D"font-size: 14px;" class=3D""><font =
face=3D"Arial" class=3D"">I have read your article =E2=80=9CQEMU =
Internals: Event loops=E2=80=9D in your blog, which helps me a lot to =
understand how QEMU=E2=80=99s thread model works. However, I still have =
a few questions here.</font></span></div><div class=3D""><font =
face=3D"Arial" style=3D"font-size: 14px;" class=3D""><br =
class=3D""></font></div></div><div class=3D""><font face=3D"Arial" =
style=3D"font-size: 14px;" class=3D"">Firstly, I have done some research =
in QEMU=E2=80=99s thread model and I know that QEMU use glib =
GMainContext and AioContext to achieve event loop, which is responsible =
for IO event and other events like timer or BH. Also, I know QEMU use =
vCPU thread to emulate real CPU which do the calculation. Our guest OS =
works on these vCPU thread. If there=E2=80=99s no IO or other event, =
vCPU will keep doing its job and guest OS runs as a host =
OS.</font></div><div class=3D""><font face=3D"Arial" style=3D"font-size: =
14px;" class=3D""><br class=3D""></font></div><div class=3D""><font =
face=3D"Arial" style=3D"font-size: 14px;" class=3D"">But when I am =
trying to figure out how these things connects, =
problems&nbsp;</font><font face=3D"Arial" class=3D""><span =
style=3D"font-size: 14px;" class=3D"">occurred. As far as I am =
concerned, once guest OS start to work, vCPU thread will&nbsp;act as a =
real CPU controlled by kvm and if there=E2=80=99s a IO&nbsp;event =
happens, we should exit guest mode and back to user mode(i.e. QEMU). =
When this happen, we back to vCPU thread and handle different =
event&nbsp;by checking&nbsp;</span></font><span style=3D"font-family: =
&quot;JetBrains Mono&quot;, monospace; font-size: 11.3pt;" =
class=3D"">run-&gt;exit_reason. </span><font face=3D"Arial" =
class=3D""><span style=3D"font-size: 14px;" class=3D"">For examples, =
if&nbsp;guest OS sends a disk request(like store a file into disk), kvm =
exit, vCPU thread handles it and dispatch the write request to a =
MemoryRegion. This procedure is reasonable but it do not use event loop. =
That means event loop do nothing in this =
procedure.</span></font></div><div class=3D""><font face=3D"Arial" =
class=3D""><span style=3D"font-size: 14px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font face=3D"Arial" =
class=3D""><span style=3D"font-size: 14px;" class=3D"">Therefore, what I =
am confused is, <i class=3D""><b class=3D"">when and how vCPU thread =
dispatch these IO event to main-loop or IO thread?</b></i> In detail, =
what kinds of&nbsp;function in QEMU changes the fd that main-loops(in =
detail, system call select/poll/epoll) are =
listening?</span></font></div><div class=3D""><font face=3D"Arial" =
class=3D""><span style=3D"font-size: 14px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font face=3D"Arial" =
class=3D""><span style=3D"font-size: 14px;" class=3D"">In the article, I =
see&nbsp;=E2=80=9C</span></font><span style=3D"caret-color: rgb(204, =
204, 204); font-size: 14px;" class=3D""><font face=3D"Arial, Tahoma, =
Helvetica, FreeSans, sans-serif" class=3D"">Some devices perform the =
guest device register access in the main loop thread or an IOThread =
thanks to ioeventfd=E2=80=9D, so I learn&nbsp;about the&nbsp;knowledge =
about eventfd. After that, I successfully detected a behavior that =
QEMU&nbsp;uses this mechanism to change fds(</font><font =
face=3D"JetBrainsMono-Regular" class=3D""><span style=3D"font-style: =
normal;" class=3D"">event_notifier_set()</span></font></span><span =
style=3D"font-family: Arial, Tahoma, Helvetica, FreeSans, sans-serif; =
caret-color: rgb(204, 204, 204); font-size: 14px;" class=3D"">) and =
main-loop runs this IO event while&nbsp;</span><b style=3D"font-family: =
Arial, Tahoma, Helvetica, FreeSans, sans-serif; caret-color: rgb(204, =
204, 204); font-size: 14px;" class=3D""><u class=3D"">virtio</u></b><span =
style=3D"font-family: Arial, Tahoma, Helvetica, FreeSans, sans-serif; =
caret-color: rgb(204, 204, 204); font-size: 14px;" class=3D""> is used. =
In other situation, for instance, if we don=E2=80=99t use&nbsp;virtio =
(use a pure emulation of hardware), what=E2=80=99s the =
way(in&nbsp;detail, what=E2=80=99s the function) that change the fd and =
how(in detail, what=E2=80=99s the function backtrace)?</span></div><div =
class=3D""><font face=3D"Arial, Tahoma, Helvetica, FreeSans, sans-serif" =
class=3D""><span style=3D"caret-color: rgb(204, 204, 204); font-size: =
14px;" class=3D""><br class=3D""></span></font></div><div class=3D""><font=
 face=3D"Arial, Tahoma, Helvetica, FreeSans, sans-serif" class=3D""><span =
style=3D"caret-color: rgb(204, 204, 204); font-size: 14px;" class=3D"">I =
cares about this&nbsp;because I think if IO event happen, if vm exit, =
vCPU thread must take the responsibility to determine what kinds of =
IO&nbsp;event can be&nbsp;done by blocking IO(i.e. doing IO in vCPU =
thread) and what kinds of IO&nbsp;event should dispatch to an event =
loop. &nbsp;But in fact, in the code, I can=E2=80=99t find this logic =
except ioeventfd(and it should use virtio as well). Hence, this question =
sounds like asking how CPU communicate with hardware, although all of =
them aren=E2=80=99t real.</span></font></div><div class=3D""><font =
face=3D"Arial, Tahoma, Helvetica, FreeSans, sans-serif" class=3D""><span =
style=3D"caret-color: rgb(204, 204, 204); font-size: 14px;" class=3D""><br=
 class=3D""></span></font></div><div class=3D""><font face=3D"Arial, =
Tahoma, Helvetica, FreeSans, sans-serif" class=3D""><span =
style=3D"caret-color: rgb(204, 204, 204); font-size: 14px;" class=3D"">I =
am looking forward to your reply! Thanks.</span></font></div><div =
class=3D""><br class=3D""></div></div></div></div></body></html>=

--Apple-Mail=_BC81FC87-8591-46FB-B3E9-55A6FD2F3490--


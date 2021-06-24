Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC33B3479
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 19:10:53 +0200 (CEST)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwSsO-0007Z6-P1
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 13:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lwSql-0006Pu-NK
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:09:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lwSqi-0000Kc-Jn
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:09:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j2so7463818wrs.12
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 10:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=68aU5uuRxZ/dAPjMBOoXREa6XPHLLInqOw+GUl3JOtc=;
 b=k7zhNFaNrWM5v8gG2eywqYmXrEOqyTtas3smd7nD5HjwxM/t790Hg4mDO8eCfVhFEX
 IDykFm9lq1OhCVjW7lkaEBbLi+qLIwQkHC58Jm3SmJoKp2YPxCUZskLcUpsfCkcZkiFn
 59wSiWqngA5yvA5BCJpcDYyBEu/flXMqmfcmQ/hz2DUYMGBFHkPxn1QSn6AlY/fNAzoU
 V9qSIeY26CVQcpbeCW6ix0uZh24/rhqe/60JlRSwVthByvkpej2JlTDTR/bys4+RWBm0
 HkCb6EhZuqisMKR7fM3g3XURyOXCesFIhuz3A9CKcIESNBWRfa3kcDV3EaucOjZWj6QY
 12Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=68aU5uuRxZ/dAPjMBOoXREa6XPHLLInqOw+GUl3JOtc=;
 b=NhEu3iMF+dWJfVk92YHrFJPLQ8Jtf6ot96cDq1HAMYv2qCsUmqhiTotPJkU45Shhl/
 jE1ogWhULoDLCjnlSGnjBHYEV5YbmGV3pIjeGXW0WoKaEawZb4wh2Vt37rci6QpWbcp6
 9ggwRqNy9tcS2Iy3YC8dRdYbJXFSSDczcHUn8pzfmuu3gKEi+c97SlWx71oI3Lr0qqQA
 gwm8n1USnQGzWk+mHGl0sc9Z7HUZprkfQlY81J3fHOM6MywYHCjn/cowbABZ9CpDMbv7
 toxSjmiuDRiC6B119eMx7ISr1GSokVrifzpgqLXGeRIkAQunsMuYIQaYBoyXkosDiQDN
 L5Yw==
X-Gm-Message-State: AOAM530RnZFKdCu9oiC3rtK1Oapk0DerrJEAnbRRqbQZhHjzWcp8POnv
 KjPl8G9yfwty9w40Y4J9/CZX501EwX7nA95PeUo=
X-Google-Smtp-Source: ABdhPJwdqfPjxmulr5I4UlL8FCDo/qnjJlLquAr+1KcXd+uH82+TBecDbSQEy1MOvPLwFftveCz69m1mnqQooGYLf4s=
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr5581822wrm.178.1624554545674; 
 Thu, 24 Jun 2021 10:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
 <CAFEAcA8eADzVVMVZHaHBC9Lm09aVvC5Wwj-q7nLkKoRUn3vS5A@mail.gmail.com>
In-Reply-To: <CAFEAcA8eADzVVMVZHaHBC9Lm09aVvC5Wwj-q7nLkKoRUn3vS5A@mail.gmail.com>
From: Steven Raasch <sraasch@gmail.com>
Date: Thu, 24 Jun 2021 12:08:49 -0500
Message-ID: <CA+5M2MDnOEvpmAn3Vhc_crj7prR6pDymTgtkFYgyh1HXJvyddA@mail.gmail.com>
Subject: Re: Extracting PC information from QEMU/KVM during single-step
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009cfc2305c5861457"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=sraasch@gmail.com; helo=mail-wr1-x42a.google.com
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
Reply-To: sraasch@gmail.com
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009cfc2305c5861457
Content-Type: text/plain; charset="UTF-8"

Understood with your KVM/TCG snapshot comment. I thought it was worth a try.

NOTE: I do not yet understand how gdb interacts with the virtual machine. I
have experience with GDB, but only at a linux app-debug level. I don't grok
how gdb on a linux host works with QEMU running a windows guest.
My *assumption* is that the VM continues to run while an app is being
debugged with GDB can be stopped, stepped, etc. If this is the case, I
would expect that the VM's sense of time will continue to move forward
while the app is paused. This would be an issue for my time-sensitive app.

If I slow down the entire QEMU system with my hacks, then my expectation is
that the time for both the VM and the app will slow down similarly (if I
decouple the VM time from real-world time using the -rtc command-line
argument).

So...
   1) Are my assumptions close?
   2) Can someone point me to information on using gdb with QEMU/KVM?

Thanks!
-S




On Thu, Jun 24, 2021 at 11:23 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 23 Jun 2021 at 22:10, Steven Raasch <sraasch@gmail.com> wrote:
> > I have used KVM to create a snapshot of a windows-10 guest running a
> graphics-intensive app. The *original* issue is that the app does not
> execute correctly when re-started from the snapshot using TCG (it doesn't
> crash, but it doesn't run correctly, either).
>
> I'm not sure that taking a snapshot with KVM and then resuming under TCG
> is really tested. So I'm not very surprised that it doesn't work.
>
> > I'm setting DEBUG & single-step modes by calling cpu_single_step() from
> the top of kvm_vcpu_thread_fn().
> > in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG signal before
> logging the instruction.
>
> If your app can cope with the slowdown involved in taking a VM exit
> after every instruction (which will be massive), then it can probably
> also handle the extra overhead on top of that of the gdbstub communication
> protocol. So it's probably simplest just to connect to QEMU's gdbstub and
> do the single-stepping that way.
>
> The other approach to this would be to see if intel's perf monitor
> stuff (which I know nothing about) has some kind of execution-trace
> capture support and if that works when passing through the PMU to a
> KVM guest.
>
> thanks
> -- PMM
>

--0000000000009cfc2305c5861457
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Understood with your KVM/TCG snapshot comment. I =
thought it was worth a try.</div><div><br></div><div>NOTE: I do not yet und=
erstand how gdb interacts with the virtual machine. I have experience with =
GDB, but only at a linux app-debug level. I don&#39;t grok how gdb on a lin=
ux host works with QEMU running a windows guest.</div><div>My *assumption* =
is that the VM continues to run while an app is being debugged with GDB can=
 be stopped, stepped, etc. If this is the case, I would expect that the VM&=
#39;s sense of time will continue to move forward while the app is paused. =
This would be an issue for my time-sensitive app.</div><div><br></div><div>=
If I slow down the entire QEMU system with my hacks, then my expectation is=
 that the time for both the VM and the app will slow down similarly (if I d=
ecouple the VM time from real-world time using the -rtc command-line argume=
nt).</div><div><br></div><div>So...</div><div>=C2=A0 =C2=A01) Are my assump=
tions close?</div><div>=C2=A0 =C2=A02) Can someone point me to information =
on using gdb with QEMU/KVM?</div><div><br></div><div>Thanks!</div><div>-S</=
div><div><br></div><div><br></div><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 24, 2021 at 11=
:23 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.=
maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, 23 Jun 2021 at 22:10, Steven Raasch &lt;<a href=
=3D"mailto:sraasch@gmail.com" target=3D"_blank">sraasch@gmail.com</a>&gt; w=
rote:<br>
&gt; I have used KVM to create a snapshot of a windows-10 guest running a g=
raphics-intensive app. The *original* issue is that the app does not execut=
e correctly when re-started from the snapshot using TCG (it doesn&#39;t cra=
sh, but it doesn&#39;t run correctly, either).<br>
<br>
I&#39;m not sure that taking a snapshot with KVM and then resuming under TC=
G<br>
is really tested. So I&#39;m not very surprised that it doesn&#39;t work.<b=
r>
<br>
&gt; I&#39;m setting DEBUG &amp; single-step modes by calling cpu_single_st=
ep() from the top of kvm_vcpu_thread_fn().<br>
&gt; in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG signal before lo=
gging the instruction.<br>
<br>
If your app can cope with the slowdown involved in taking a VM exit<br>
after every instruction (which will be massive), then it can probably<br>
also handle the extra overhead on top of that of the gdbstub communication<=
br>
protocol. So it&#39;s probably simplest just to connect to QEMU&#39;s gdbst=
ub and<br>
do the single-stepping that way.<br>
<br>
The other approach to this would be to see if intel&#39;s perf monitor<br>
stuff (which I know nothing about) has some kind of execution-trace<br>
capture support and if that works when passing through the PMU to a<br>
KVM guest.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000009cfc2305c5861457--


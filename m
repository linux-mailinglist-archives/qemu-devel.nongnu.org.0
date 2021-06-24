Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC03B307E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 15:51:12 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwPl9-0004Em-Cc
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 09:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lwPk8-0003Jh-WC
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 09:50:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lwPk3-0008P0-Ai
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 09:50:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id j1so6745157wrn.9
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=2RwRQ7vKuZ5u2aGgiuBc+H/luTrMHx5elPOe5w5D04o=;
 b=GH8wjIJTF6Sf7N64ybQo8yaMilQiMHD6+QI1heWsDRGh0zeb3tjIPa/+I6IyBBaLeS
 RF5i+X07zoTPuq916IFpYkfCMv+SYEfsj8tHhfRFi+N+RaByaOWmX4vKZesR5yhvALS4
 AMSAWraBQJ8LbVL6GM91Tz9xLr9L0dLti+d0KzIEZgclhzZVUY2V1N+4Br+xssdcTDfb
 I2iGd6MxLC4rVFY4EENLLqS/W4FXz0gpACfuaOZx8gkX1Iqk0SFDw+71cSxAY5bl5OnD
 zpsPRlARLh6TVKCzOjXtZ2HL1jHLMNU7Tpb7JCMIX9vjiLQtofQWsGam9yLW5Ulz4OYY
 4KKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=2RwRQ7vKuZ5u2aGgiuBc+H/luTrMHx5elPOe5w5D04o=;
 b=NwomCqQ7xD/h/h8LXWmyF6CyDCbGQv+BrGKMJYUZi4+VoK+eqgJdWOlwSwwAFHaHr9
 vYbeavqBHXmbd0PZHsuJuxRnNzq5NTY7YrZAcCuRcZLbA2mmZUCo97ICysRBQQWzPRnp
 /RJH/nAr7FGtl1KDqeRj9a5vQWBT6dMvo8Z9xZMcR2uSxcecTWffBKEcTgnFkqKBlAl2
 WSZIYQ2BpiCmK85qSJCR4LWGbpFAPFdHTGXjcRxLRY6qm2vpOhN0agZGS85y9RXZFs00
 qDYhyKBCNb7/w+P1a8IdtG3YA1lIOr8yHRien0M4/F+ti/EmXw0KM2TAhsbnjvP4BBew
 kC5A==
X-Gm-Message-State: AOAM531ajAqW1ODtvYEDnsn3d6xML9KSxJkTw8kMicEkr77J1s6j3tmB
 n/u5gUbi4D60dzql+TJLmbKjGsZv9nN6yPESbgE=
X-Google-Smtp-Source: ABdhPJz9Dxe2hBy1voU8A6fqcK2g4FeMfgOQLyMSBG8CocuipqwVzB61pb6qc9R9/UUFn7z432GE939Q4byllguT8wA=
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr4479955wro.276.1624542601916; 
 Thu, 24 Jun 2021 06:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
 <20210624014538.6osoiuj5l4llor7v@mozz.bu.edu>
In-Reply-To: <20210624014538.6osoiuj5l4llor7v@mozz.bu.edu>
From: Steven Raasch <sraasch@gmail.com>
Date: Thu, 24 Jun 2021 08:49:45 -0500
Message-ID: <CA+5M2MCNJP=EEz4hfWy4ougMz0Uon2-=9WmunWKqih3_e_DNYA@mail.gmail.com>
Subject: Re: Extracting PC information from QEMU/KVM during single-step
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: multipart/alternative; boundary="000000000000b5b33b05c5834c74"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=sraasch@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5b33b05c5834c74
Content-Type: text/plain; charset="UTF-8"

Alex -

Our application is similar to a high-end game in that it adjusts it's
code-path depending on how "fast" it is running. Our previous attempts to
trace it's execution have run into issues due to the overhead of the trace
collection.

My hope had been that by using QEMU, I could control the "hardware" that
the app is running on such that the app doesn't know that it's not running
at full speed. In my mind, this means instrumenting the VM itself.

Using GDB is my second choice, as I'm not sure that I can gather the trace
w/out slowing down the app's execution. I haven't dug into how GDB
interacts with QEMU and GDB-scripting as of yet.

-Steve


On Wed, Jun 23, 2021 at 8:46 PM Alexander Bulekov <alxndr@bu.edu> wrote:

> On 210623 1514, Steven Raasch wrote:
> > Hi -
> >
> > I'm trying to create a hack that will allow me to extract an instruction
> > trace from QEMU/KVM (i386). The KVM part is important (see below).
> >
> > Background:
> >
> >    - I have used KVM to create a snapshot of a windows-10 guest running a
> >    graphics-intensive app. The *original* issue is that the app does not
> >    execute correctly when re-started from the snapshot using TCG (it
> doesn't
> >    crash, but it doesn't run correctly, either). So, using the existing
> "-d
> >    in_asm" won't work. It seemed to me that hacking in tracing to KVM
> should
> >    be easier than figuring out why the app doesn't work.
> >    - I've poked around the tracing mechanism in the TCG, and extracted
> what
> >    I need to dump instructions and then added that to kvm_cpu_exec().
> >    - I'm setting DEBUG & single-step modes by calling cpu_single_step()
> >    from the top of kvm_vcpu_thread_fn().
> >    - in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG signal before
> >    logging the instruction.
> >
> > I have the output of TCG "-d in_asm" from the beginning of the execution,
> > and I'm comparing the KVM output with that.
> >
> > What I don't have right is the PC of the instruction that's been
> executed.
> > The TCG is clearly sane, but the KVM output is not.
> >
> > My best thought was to extract the PC from kvm_run (run->debug.arch.pc)
> > after the KVM_RUN ioctl, but that doesn't match up. I also tried
> > kvm_vcpu_ioctl() with KVM_GET_REGS, and grabbing the rip from
> cpu->env.rip.
> > I didn't expect any of these to be *exactly* right, but I thought they
> > would lead me to something sane.
> >
> > Using run->debug.arch.pc gives me the right address for the first
> > instruction, but nothing makes sense after that.
> >
> > Can anyone help me get onto the right track?
> >
> > Thanks!
> >
> > -Steve
>
> Is there some reason you can't do this using qemu's gdbstub and gdb? It
> supports single-stepping under KVM.
>
> -Alex
>

--000000000000b5b33b05c5834c74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alex -<div><br></div><div>Our application is similar to a =
high-end game in that it adjusts it&#39;s code-path depending on how &quot;=
fast&quot; it is running. Our previous attempts to trace it&#39;s execution=
 have run into issues due to the overhead of the trace collection.</div><di=
v><br></div><div>My hope had been that by using QEMU, I could control the &=
quot;hardware&quot; that the app is running on such that the app doesn&#39;=
t know that it&#39;s not running at full speed. In my mind, this means inst=
rumenting the VM itself.</div><div><br></div><div>Using GDB is my second ch=
oice, as I&#39;m not sure that I can gather the trace w/out slowing down th=
e app&#39;s execution. I haven&#39;t dug into how GDB interacts with QEMU a=
nd GDB-scripting as of yet.</div><div><br></div><div>-Steve</div><div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jun 23, 2021 at 8:46 PM Alexander Bulekov &lt;<a href=3D"mailt=
o:alxndr@bu.edu" target=3D"_blank">alxndr@bu.edu</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 210623 1514, Steven Raas=
ch wrote:<br>
&gt; Hi -<br>
&gt; <br>
&gt; I&#39;m trying to create a hack that will allow me to extract an instr=
uction<br>
&gt; trace from QEMU/KVM (i386). The KVM part is important (see below).<br>
&gt; <br>
&gt; Background:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - I have used KVM to create a snapshot of a windows-10 gu=
est running a<br>
&gt;=C2=A0 =C2=A0 graphics-intensive app. The *original* issue is that the =
app does not<br>
&gt;=C2=A0 =C2=A0 execute correctly when re-started from the snapshot using=
 TCG (it doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 crash, but it doesn&#39;t run correctly, either). So, usi=
ng the existing &quot;-d<br>
&gt;=C2=A0 =C2=A0 in_asm&quot; won&#39;t work. It seemed to me that hacking=
 in tracing to KVM should<br>
&gt;=C2=A0 =C2=A0 be easier than figuring out why the app doesn&#39;t work.=
<br>
&gt;=C2=A0 =C2=A0 - I&#39;ve poked around the tracing mechanism in the TCG,=
 and extracted what<br>
&gt;=C2=A0 =C2=A0 I need to dump instructions and then added that to kvm_cp=
u_exec().<br>
&gt;=C2=A0 =C2=A0 - I&#39;m setting DEBUG &amp; single-step modes by callin=
g cpu_single_step()<br>
&gt;=C2=A0 =C2=A0 from the top of kvm_vcpu_thread_fn().<br>
&gt;=C2=A0 =C2=A0 - in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG s=
ignal before<br>
&gt;=C2=A0 =C2=A0 logging the instruction.<br>
&gt; <br>
&gt; I have the output of TCG &quot;-d in_asm&quot; from the beginning of t=
he execution,<br>
&gt; and I&#39;m comparing the KVM output with that.<br>
&gt; <br>
&gt; What I don&#39;t have right is the PC of the instruction that&#39;s be=
en executed.<br>
&gt; The TCG is clearly sane, but the KVM output is not.<br>
&gt; <br>
&gt; My best thought was to extract the PC from kvm_run (run-&gt;debug.arch=
.pc)<br>
&gt; after the KVM_RUN ioctl, but that doesn&#39;t match up. I also tried<b=
r>
&gt; kvm_vcpu_ioctl() with KVM_GET_REGS, and grabbing the rip from cpu-&gt;=
env.rip.<br>
&gt; I didn&#39;t expect any of these to be *exactly* right, but I thought =
they<br>
&gt; would lead me to something sane.<br>
&gt; <br>
&gt; Using run-&gt;debug.arch.pc gives me the right address for the first<b=
r>
&gt; instruction, but nothing makes sense after that.<br>
&gt; <br>
&gt; Can anyone help me get onto the right track?<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; -Steve<br>
<br>
Is there some reason you can&#39;t do this using qemu&#39;s gdbstub and gdb=
? It<br>
supports single-stepping under KVM. <br>
<br>
-Alex<br>
</blockquote></div>

--000000000000b5b33b05c5834c74--


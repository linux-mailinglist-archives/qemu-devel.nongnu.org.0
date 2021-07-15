Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE933CA23E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 18:26:21 +0200 (CEST)
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m44Bo-0006C9-EU
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 12:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m44Au-0004yA-3I
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:25:24 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m44As-0008I4-7M
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:25:23 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so6733855otq.11
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 09:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vOl6I74TbhlPXRXmtghXO6cIhezXczW2CNiY3sAG1HE=;
 b=QGaAFGmWjfP3or0XRbs6e8lHBJue4zG5FB2NhOeFmyUfr7NQedSxk6uEEMg/zGH8Qa
 4FYsawoIVTIMzH9YSfZ6aXx+Lk7/EACYyX7XS+q4hJ/m29nSx/j49TRbkyrAVatl2vEc
 N2cdY8yOa6q6Twh+WgeGooT+T+zjvANy0+3Pjh4GQ0bs+MYdddeSxzWzEOhZoNjM2nlX
 6csPtZr2r15MhmxFl6P0/2kFuE2WxuSyDrxKyajv6s7hz2Fe11ryHNMb1Xv0YXX4D8Mi
 fDoiRCW8+i06NOcmylWhH8aHMWHdF2FW2KmXF2RX3luLe7NT9tF7Q9xZKKCdp/xkhHwj
 EUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vOl6I74TbhlPXRXmtghXO6cIhezXczW2CNiY3sAG1HE=;
 b=hgcOOqQjnTZ/eEqSiS0dXKD5CfcLh5lpOJlvN89JnYb3u9MhVfnMQZrC1PlpUqniqi
 jCZZPrQEfCH0irNNK8zcoTlNrLU5IxD8ls2D1R/1O3GhpvjmfKEIKOMoG2R8CKOSPinc
 8lp89dHN4rneefHmUcL9px8G0VRpDHYa/CmzuJCUzonaTKp0JT0cdlaFr3vg9ET6E3YP
 usP+J0P0vD0drdEE7asIfJ/Fst6QtV5Bmwb/A/ENUT2aHWW0M6oWWSm14li/PfVjgpV5
 Iw9eM9MDxFhG29QBzglcBHp8HIeQvhN4f57DwRu50QvOW7doVFkeTCttieDzVeLnfjmR
 rQ8A==
X-Gm-Message-State: AOAM533NfqRpaQ/VgYYYNlWdZ7pOOEUxca0lSZJ4/wRlqTa6jWtNvBGo
 2pDSQ7W+8Ctinnf6s9xn4jIun87wjzO5IY3y8RE=
X-Google-Smtp-Source: ABdhPJysqpITA1VdNHaKVpkJc18gtoBuqORoJ3lpnDnmkcXg7IOXtpmEArn5ZRu2hcKFQz9KW0a/jbQIfO5YWjD+P0E=
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr4453279ota.343.1626366320791; 
 Thu, 15 Jul 2021 09:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Thu, 15 Jul 2021 11:25:09 -0500
Message-ID: <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d353ba05c72bea0e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x336.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d353ba05c72bea0e
Content-Type: text/plain; charset="UTF-8"

Well certainly, I know they are different executables. I'm just trying to
understand how the different targets work.

By subsumes, I mean that just looking at the meson.build for i386, you can
see that there are files added to the i386_ss, but not visibly added to the
softmmu target. But the softmmu target has those files built whenever you
configure and build it.

And right that's what I thought. What I'm thinking is that the i386_ss is
compiled with a different implementation for those call backs based on the
target and the user emulation.

On Thu, Jul 15, 2021 at 11:17 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 15 Jul 2021 at 16:59, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> >
> > If I am right, the softmmu/system build target for each architecture
> subsumes the source of the user target.
>
> I'm not sure what you mean by "subsumes" here. Some code in
> QEMU is compiled into both the system and usermode emulators
> (eg most of the CPU emulation code). Some is system mode only
> (eg the device models). Some is usermode only (eg the emulation
> of various system calls).
>
> > What I was wondering is, if the user layer of qemu is used by the
> > user target, and by user layer I mean the using contents of linux-user,
> > then how does the system target receive the user programs instead
> > of the qemu user emulation layer even within a guest that is an
> > entire OS?
>
> qemu-i386 and qemu-system-i386 are different executables.
> They're built differently, and what happens when a usermode
> program running inside a Linux guest inside qemu-system-i386
> executes a syscall instruction is completely different from
> what happens when a program running on qemu-i386 executes that
> instruction. Specifically, there are different versions of the
> x86_cpu_do_interrupt() function: the one for system emulation does
> "update the guest CPU state in the way that the real CPU does when
> an int 0x80 is executed", and the one for usermode emulation does
> "raise a fake exception that will cause execution to return from
> the call to cpu_exec() in linux-user/i386/cpu_loop.c:cpu_loop()
> so it can emulate a syscall".
>
> thanks
> -- PMM
>

--000000000000d353ba05c72bea0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well certainly, I know they are different executables. I&#=
39;m just trying to understand how the different targets work.<br><br>By su=
bsumes, I mean that just looking at the meson.build for i386, you can see t=
hat there are files added to the i386_ss, but not visibly added to the soft=
mmu target. But the softmmu target has those files built whenever you confi=
gure and build it.<br><br>And right that&#39;s what I thought. What I&#39;m=
 thinking is that the i386_ss is compiled with a different implementation f=
or those call backs based on the target and the user emulation.</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul =
15, 2021 at 11:17 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lina=
ro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 15 Jul 2021 at 16:59, Kenneth Adam=
 Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; If I am right, the softmmu/system build target for each architecture s=
ubsumes the source of the user target.<br>
<br>
I&#39;m not sure what you mean by &quot;subsumes&quot; here. Some code in<b=
r>
QEMU is compiled into both the system and usermode emulators<br>
(eg most of the CPU emulation code). Some is system mode only<br>
(eg the device models). Some is usermode only (eg the emulation<br>
of various system calls).<br>
<br>
&gt; What I was wondering is, if the user layer of qemu is used by the<br>
&gt; user target, and by user layer I mean the using contents of linux-user=
,<br>
&gt; then how does the system target receive the user programs instead<br>
&gt; of the qemu user emulation layer even within a guest that is an<br>
&gt; entire OS?<br>
<br>
qemu-i386 and qemu-system-i386 are different executables.<br>
They&#39;re built differently, and what happens when a usermode<br>
program running inside a Linux guest inside qemu-system-i386<br>
executes a syscall instruction is completely different from<br>
what happens when a program running on qemu-i386 executes that<br>
instruction. Specifically, there are different versions of the<br>
x86_cpu_do_interrupt() function: the one for system emulation does<br>
&quot;update the guest CPU state in the way that the real CPU does when<br>
an int 0x80 is executed&quot;, and the one for usermode emulation does<br>
&quot;raise a fake exception that will cause execution to return from<br>
the call to cpu_exec() in linux-user/i386/cpu_loop.c:cpu_loop()<br>
so it can emulate a syscall&quot;.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000d353ba05c72bea0e--


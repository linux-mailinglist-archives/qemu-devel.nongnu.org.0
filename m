Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF72425B6A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:15:51 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYYru-0006qK-W9
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mYYqC-0005zG-I3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:14:05 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mYYq7-0003ei-CE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:14:03 -0400
Received: by mail-vs1-xe31.google.com with SMTP id o15so3087354vsr.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLO8+pn561TQaEFUhic8fW50Ob4vja96RRtossVKiUk=;
 b=JdLVYmslqizrUlqvWgCQA375NWi5CyJq2TBDPNdPufwZtLsjK6dlCseDleP7fE3jvE
 aFWXwArZU+jUJ+rX3Y4KO540CcTmevR7mgoNPcqkjyp84L3hQDL6QDrBea20g9KuVJ10
 M8bxlKAj9rX/m0+U/rCj34l48dgyKcCq5LVNcIdJVN8VvOuK+x22rAr4Cqbp2UL2KmSG
 JBCuQPJtWNPE/3ZzRA2cLpQbtLP06EIiJQL7U6haX1CcGGsbtRuqQVf4ScYLwjsPEB/z
 Q6LFLdL3soIXwWNYlaSJjzWkC4fWpehlqraersaId6rVKYp/2mc97WqpZEy9R00iiNRK
 hZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLO8+pn561TQaEFUhic8fW50Ob4vja96RRtossVKiUk=;
 b=Pk1Fdwe8ceNuqCbkWy3keVYWcuf69fHGXx3qvYhbPqM40k0ens1OssQXZQPmLGVrud
 BKUg+92OI3y/hg6KtvxU3JFTkYRIg+rWUjbDEJNiLm8Gh+qut+fd2pssH9FZa2/TrJ3Z
 H4OAa3zrB8rZpIZBGEtS21vUUgRDV1Yp7uOpYXZf24UIXhTV1A0LyPohWr/ielJNuqY3
 M8lKFusfXoniB9V8BxqayxzsKeou0Lt/Yn6suebqduP5azMHWXp9KROtn/jC1cPe+4Mm
 TMGmwjAmk5poETCvONjQBpnFeg+4Zmb3fmxvLJNDY8/Og7pytL2WNvK0qbE3Rczxi8mR
 7yLA==
X-Gm-Message-State: AOAM532S427angtbtaMNlqMsMjTn/mnxJ4bt8tuT5+a78nNXN4zsT13m
 UH3nAxGnAcBy+IU6793eZDrMhxn48xH0SMMp/976xw==
X-Google-Smtp-Source: ABdhPJyCkXVSSAGRs2B3ROhMT7MkS82ZWuvmhC+79vkWPXFdXGeGRzQWbr0d9ssL10g/IJw519UtmC31BXd6bybXf50=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr6447930vsh.30.1633634035004;
 Thu, 07 Oct 2021 12:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
In-Reply-To: <877deoevj8.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 7 Oct 2021 13:13:44 -0600
Message-ID: <CANCZdfoZ55XfNy9dnhgRrzi=QM5SqLgHrioqTK6J7R=jju-E6g@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005a563305cdc8102a"
Received-SPF: none client-ip=2607:f8b0:4864:20::e31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: assad.hashmi@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005a563305cdc8102a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 8:56 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> Hi,
>
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
>
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.
>
> There are some hacks you can apply at a local level like tweaking the
> elf header of the binaries you want to run under emulation and adjusting
> the binfmt_mask appropriately. This works but is messy and a faff to
> set-up.
>
> An ideal setup would be would be for the kernel to catch a SIGILL from a
> failing user space program and then to re-launch the process using QEMU
> with the old processes maps and execution state so it could continue.
> However I suspect there are enough moving parts to make this very
> fragile (e.g. what happens to the results of library feature probing
> code). So two approaches I can think of are:
>

32-bit arm had an 'eabi' section in ELF binaries. There it would have been
possible
to look at that and make a decision before the binary starts executing to
see whether
it should just run, or fork the linux-user binary. It would take kernel
changes, though.


> Trap execve in QEMU linux-user
> ------------------------------
>
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.
>

The bsd-user code differs a little from linux-user in that it looks at the
binary being exec'd to determine what to do. It works OK, but isn't really
for this situation (we use it to optimize our package builds with additiona=
l
path processing for our mixed binary situation where we have native binarie=
s
execing emulated binaries that then exec native binaries again. It is a bit
of a hack, though, and I'm not completely happy with it.

Add path mask to binfmt_misc
> ----------------------------
>
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).
>
> Are there any other approaches you could take? Which do you think has
> the most merit?
>

In by-gone times, brandelf has bene used for situations where you wanted
to run an ELF binary with one emulation that looks like another. But that's
also
kernel hacks and also touching the local binary.

There's also the option of doing a VM86-like thing that allowed people to
run 16-bit x86 binaries on 32-bit processors. There the system calls would
SEGV
and you'd decode them inline, execute the emulation and move the IP to
execute
the next instruction after the INT XX system call. You could create a
loader that
knows how to load load the binaries and catch SIGILL and then emulate the
new
instructions on the old processor, but that's somewhat different than how
qemu
user-mode works today. But knowing you'd need to do this is hard,
potentially.
But one could expand the kernel to load in SIGILL handlers on-demand for
programs that do this, but that wouldn't work with old kernels and just
feels
weird...

Warner

--0000000000005a563305cdc8102a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 8:56 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">=
alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi,<br>
<br>
I came across a use-case this week for ARM although this may be also<br>
applicable to architectures where QEMU&#39;s emulation is ahead of the<br>
hardware currently widely available - for example if you want to<br>
exercise SVE code on AArch64. When the linux-user architecture is not<br>
the same as the host architecture then binfmt_misc works perfectly fine.<br=
>
<br>
However in the case you are running same-on-same you can&#39;t use<br>
binfmt_misc to redirect execution to using QEMU because any attempt to<br>
trap native binaries will cause your userspace to hang as binfmt_misc<br>
will be invoked to run the QEMU binary needed to run your application<br>
and a deadlock ensues.<br>
<br>
There are some hacks you can apply at a local level like tweaking the<br>
elf header of the binaries you want to run under emulation and adjusting<br=
>
the binfmt_mask appropriately. This works but is messy and a faff to<br>
set-up.<br>
<br>
An ideal setup would be would be for the kernel to catch a SIGILL from a<br=
>
failing user space program and then to re-launch the process using QEMU<br>
with the old processes maps and execution state so it could continue.<br>
However I suspect there are enough moving parts to make this very<br>
fragile (e.g. what happens to the results of library feature probing<br>
code). So two approaches I can think of are:<br></blockquote><div><br></div=
><div>32-bit arm had an &#39;eabi&#39; section in ELF binaries. There it wo=
uld have been possible</div><div>to look at that and make a decision before=
 the binary starts executing to see whether</div><div>it should just run, o=
r fork the linux-user binary. It would take kernel changes, though.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Trap execve in QEMU linux-user<br>
------------------------------<br>
<br>
We could add a flag to QEMU so at the point of execve it manually<br>
invokes the new process with QEMU, passing on the flag to persist this<br>
behaviour.<br></blockquote><div><br></div><div>The bsd-user code differs a =
little from linux-user in that it looks at the</div><div>binary being exec&=
#39;d to determine what to do. It works OK, but isn&#39;t really</div><div>=
for this situation (we use it to optimize our package builds with additiona=
l</div><div>path processing for our mixed binary situation where we have na=
tive binaries</div><div>execing emulated binaries that then exec native bin=
aries again. It is a bit</div><div>of a hack, though, and I&#39;m not compl=
etely happy with it.</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Add path mask to binfmt_misc<br>
----------------------------<br>
<br>
The other option would be to extend binfmt_misc to have a path mask so<br>
it only applies it&#39;s alternative execution scheme to binaries in a<br>
particular section of the file-system (or maybe some sort of pattern?).<br>
<br>
Are there any other approaches you could take? Which do you think has<br>
the most merit?<br></blockquote><div><br></div><div>In by-gone times, brand=
elf has bene used for situations where you wanted</div><div>to run an ELF b=
inary with one emulation that looks like another. But that&#39;s also</div>=
<div>kernel hacks and also touching the local binary.</div><div><br></div><=
div>There&#39;s also the option of doing a VM86-like thing that allowed peo=
ple to</div><div>run 16-bit x86 binaries on 32-bit processors. There the sy=
stem calls would SEGV</div><div>and you&#39;d decode them inline, execute t=
he=C2=A0emulation and move the=C2=A0IP to execute</div><div>the next instru=
ction after the INT XX system call. You could create a loader that</div><di=
v>knows how to load load the binaries and catch SIGILL and then emulate the=
 new</div><div>instructions on the old processor, but that&#39;s somewhat d=
ifferent than how qemu</div><div>user-mode works today. But knowing you&#39=
;d need to do this is hard, potentially.</div><div>But one could expand the=
 kernel to load in SIGILL handlers on-demand for</div><div>programs that do=
 this, but that wouldn&#39;t work with old kernels and just feels</div><div=
>weird...</div><div><br></div><div>Warner</div></div></div>

--0000000000005a563305cdc8102a--


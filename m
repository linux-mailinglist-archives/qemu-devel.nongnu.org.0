Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317AD449A0B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:41:31 +0100 (CET)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7i3-0005jG-Bx
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mk7ge-0004wV-FL
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:40:00 -0500
Received: from [2607:f8b0:4864:20::929] (port=43740
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mk7gc-0005Xs-Mc
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:40:00 -0500
Received: by mail-ua1-x929.google.com with SMTP id v3so32595638uam.10
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BU0OP2kjYPueiJFRcf28uxewh1ERmxS7SBRzmQobnzo=;
 b=7G//i9F4QU7Vzx/udD6dtjTbHndLVXGKJ7gETyGmsse+5m8XTg+qNim0Hva2co3W9F
 CkahZw6S3iKU8wA7XG6/ZgHL29uN3sd43SIMVw9fdz/G+NuJuxbFLqV+DCeoCLNCWC56
 LJXJqEo2hTQn09ZMnkJIzAfYQcYkZfGhlq1Yl1xkoVHDrzh4DfMaVDBA5C49ET8YfNOm
 LmyAu4+/QO32rv/RlCx92BAzYRbGPr6RTYVEe6os+pW+F4pynAmE0PjlOxka7xp3iSFW
 GShGLqM+tAERxNispI6WoIuOYw37jBfxswTwOvx2AxIRSpIE+7HQyaBAulwyM4rlAabT
 bk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BU0OP2kjYPueiJFRcf28uxewh1ERmxS7SBRzmQobnzo=;
 b=Xz3ndLDclUlDQA5z9QaO4mR6dW/UmsaeIWrXVBLfIvOpLDct5Y4PlJEgMO0vzeYqld
 uPXOGZPHUK9tdil/0dEQ9artb6O73uEjbqCVfBwmjmvrTJhyJKfXTYbkteG+G58++gK4
 h40rM4MzkZuXRrLStvS/0pphFDR7R/j8TjqJjxZUK+hiJhizLbN4TgtsO3vgMeYUoxV9
 B66Zf/6Cnr8EcttpGrZRKLkP9a60D79Ghhk/BbP84RYnFyK73MgHblY484XOmp1OPh9j
 iDhfGi57ltMEzKQBevoYWCNOjWLPvsuCt0tn85OX5d36gWsUkdGRoJFmDA7ODos1krWM
 vBZw==
X-Gm-Message-State: AOAM531pXTHQSOQZw0Rzndc40lJCgdU1MlPvMlcyEFhMtz/qVj2Blp34
 Wys6gSW2u1uJpiI5ZDi/HyAKrEyJpRYIvyNNL03J5Q==
X-Google-Smtp-Source: ABdhPJxMQ5KtqE9Uq7sP1zl+C4Qo74mvGvr4YWa0uKDveGYqEdgoRtzjZVBS1JSp9PLGSF0T5iFHioHAM2SlS4DeqSM=
X-Received: by 2002:a05:6102:5f2:: with SMTP id w18mr549686vsf.6.1636389597536; 
 Mon, 08 Nov 2021 08:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-3-imp@bsdimp.com>
 <fa216460-3fa2-a5bc-f974-ea2c8cf6430e@linaro.org>
In-Reply-To: <fa216460-3fa2-a5bc-f974-ea2c8cf6430e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Nov 2021 09:39:46 -0700
Message-ID: <CANCZdfq5SbUE8Wq8MKsHHJdWuu++suZNuL490E7gqEjGHY+V0g@mail.gmail.com>
Subject: Re: [RFC 2/4] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000acf96705d049a418"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000acf96705d049a418
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 8, 2021 at 8:07 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/8/21 3:37 AM, Warner Losh wrote:
> > All instances of rewind_if_in_safe_syscall are the same, differing only
> > in how the instruction point is fetched from the ucontext and the size
> > of the registers. Use host_signal_pc and new host_signal_set_pc
> > interfaces to fetch the pointer to the PC and adjust if needed. Delete
> > all the old copies of rewind_if_in_safe_syscall.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   linux-user/host/aarch64/hostdep.h | 20 --------------------
> >   linux-user/host/arm/hostdep.h     | 20 --------------------
> >   linux-user/host/i386/hostdep.h    | 20 --------------------
> >   linux-user/host/ppc64/hostdep.h   | 20 --------------------
> >   linux-user/host/riscv/hostdep.h   | 20 --------------------
> >   linux-user/host/s390x/hostdep.h   | 20 --------------------
> >   linux-user/host/x86_64/hostdep.h  | 20 --------------------
> >   linux-user/signal.c               | 18 +++++++++++++++++-
> >   8 files changed, 17 insertions(+), 141 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Although I think we can fairly safely drop HAVE_SAFE_SYSCALL.  It is
> required for proper
> operation.  As with host-signal.h, really.
>

Yes. The only possible use I can see for it is to allow people to bring up
new platforms more easily by deferring the signal-safe system call details
until later in that process.

Warner

--000000000000acf96705d049a418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 8:07 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/8/21 3:37 AM, Warner Losh wrote:<br>
&gt; All instances of rewind_if_in_safe_syscall are the same, differing onl=
y<br>
&gt; in how the instruction point is fetched from the ucontext and the size=
<br>
&gt; of the registers. Use host_signal_pc and new host_signal_set_pc<br>
&gt; interfaces to fetch the pointer to the PC and adjust if needed. Delete=
<br>
&gt; all the old copies of rewind_if_in_safe_syscall.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0linux-user/host/aarch64/hostdep.h | 20 -------------------=
-<br>
&gt;=C2=A0 =C2=A0linux-user/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=A0| 20 ----=
----------------<br>
&gt;=C2=A0 =C2=A0linux-user/host/i386/hostdep.h=C2=A0 =C2=A0 | 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/ppc64/hostdep.h=C2=A0 =C2=A0| 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/riscv/hostdep.h=C2=A0 =C2=A0| 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/s390x/hostdep.h=C2=A0 =C2=A0| 20 ---------=
-----------<br>
&gt;=C2=A0 =C2=A0linux-user/host/x86_64/hostdep.h=C2=A0 | 20 --------------=
------<br>
&gt;=C2=A0 =C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 +++++++++++++++++-<br>
&gt;=C2=A0 =C2=A08 files changed, 17 insertions(+), 141 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
Although I think we can fairly safely drop HAVE_SAFE_SYSCALL.=C2=A0 It is r=
equired for proper <br>
operation.=C2=A0 As with host-signal.h, really.<br></blockquote><div><br></=
div><div>Yes. The only possible use I can see for it is to allow people to =
bring up new platforms more easily by deferring the signal-safe system call=
 details until later in that process.</div><div><br></div><div>Warner</div>=
</div></div>

--000000000000acf96705d049a418--


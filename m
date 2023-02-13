Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65C695513
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 00:56:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRifO-0000H8-10; Mon, 13 Feb 2023 18:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRifM-0000Gz-Nr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:55:24 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRifK-0003Wt-Jw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:55:24 -0500
Received: by mail-ed1-x52f.google.com with SMTP id w3so8176215edc.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QoVB6FfBDeAVhl+wS/GzSpO6aYVrICp4Uu5CXdw5R0Q=;
 b=Pi2pO/TMan8j4c5afN91eEPwoANRE7lLPv/uWzsepcVnAGOxGW/7AF95yIaHXEiV29
 XYH31nPtDz92l5PsWOW0UjTojEIishZf194UMRkxIDIytbAdCzutUtRPxeTJmShqWfS5
 KGhdpj+nw5fE0qPJxH4qeZLJ7DRusmDPPol0x/EujMrKDyPR4Py2muTJsl8JDn057Oje
 VC8SYVtzl4hHuGe/z6zbHOfUlTRuB0CSEk1igch8qI3eVID8QN8V+KlE8NUEcz8eOp2+
 Be7gabwMTt2q9dALr1kteUKYG0W2lJ2NBzsIChXgkDYb53u1+i7tLxL5Vy87RK8RzsBC
 oFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QoVB6FfBDeAVhl+wS/GzSpO6aYVrICp4Uu5CXdw5R0Q=;
 b=Wf4F6eRslU6YM8ckdRIBOe7L4XNzudlGS6CJw9pYcRbx9zW9+XP/TNLbDEQKfn9yrP
 xvLydBPS3X93jzxNAtTHQxFccfVKZnqpigT9UY2aeBySgthTPc/f/0RkgJXreaFbN0eg
 I6cQvLwGGWcAJT1VebqPrk5hhd+fhnZjX31GaRquJCANfEObBkHJc7uMZTB7dHWuucvk
 RaQ/c7oVgLcSqNyPSjABWQXlSOaI3IGOPkiCa0WDl+FaNxCKEP/uT+uG0CfV42UZKJGl
 4rPbOch1pfmWFmNCLW2hX9vRtjm04V6A7vANcYmfTXWBp3r1rrXFcOZFwu5jUis4PaDJ
 dwUQ==
X-Gm-Message-State: AO0yUKUc4wXq7NhcQ2yGQfJ7+DBw5YFJ0aBLnS0HfC89eCJZC0WAD0fF
 ILlz/mVjkvkynmi8VCqvqQDhRX3EYHF5ukvLHbQ7Og==
X-Google-Smtp-Source: AK7set8ZSABpDCL9iYFFvJ08FDO3vcriFXoV/7GpQi3Xm831ZINUAqWzSkxarYRYHm0U1JzdAPTHxdAM1/5EDCvGcog=
X-Received: by 2002:a50:cdcf:0:b0:4ac:b4b3:b788 with SMTP id
 h15-20020a50cdcf000000b004acb4b3b788mr247668edj.0.1676332520053; Mon, 13 Feb
 2023 15:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-10-imp@bsdimp.com>
 <714e259e-06e0-2f34-ad6e-a6316625d1c2@linaro.org>
In-Reply-To: <714e259e-06e0-2f34-ad6e-a6316625d1c2@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 13 Feb 2023 16:55:09 -0700
Message-ID: <CANCZdfrNZoB0Dwr+OeHrHkp2=r4OkBsSZNvvH3U5Zs74O+G9sg@mail.gmail.com>
Subject: Re: [PATCH 9/9] bsd-user: Add -strict
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006236c005f49d9435"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006236c005f49d9435
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 4:19 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/10/23 13:18, Warner Losh wrote:
> > Most of the time, it's useful to make our best effort, but sometimes we
> > want to know right away when we don't implement something. First place
> > we use it is for unknown syscalls.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/os-syscall.c | 4 ++++
> >   bsd-user/main.c               | 5 ++++-
> >   bsd-user/qemu.h               | 1 +
> >   3 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/bsd-user/freebsd/os-syscall.c
> b/bsd-user/freebsd/os-syscall.c
> > index 179a20c304b..e2b26ecb8dd 100644
> > --- a/bsd-user/freebsd/os-syscall.c
> > +++ b/bsd-user/freebsd/os-syscall.c
> > @@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, int
> num, abi_long arg1,
> >
> >       default:
> >           qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> > +        if (bsd_user_strict) {
> > +            printf("Unimplemented system call %d\n", num);
> > +            abort();
> > +        }
>
> I don't like the raw printf, even if you did write to stderr.
> Perhaps just the abort, letting the error message be handled by qemu_log?
>
> > @@ -396,6 +397,8 @@ int main(int argc, char **argv)
> >               trace_opt_parse(optarg);
> >           } else if (!strcmp(r, "0")) {
> >               argv0 = argv[optind++];
> > +        } else if (!strcmp(r, "strict")) {
> > +            bsd_user_strict = true;
>
> Perhaps force LOG_UNIMP?  Without -D, you'll get the qemu_log above to
> stderr.
>

Given the number of other changes in the other bits, I'm going to defer
this feedback until round 3, since
the number of changes I've made for round 2 means there will  almost
certainly result in a round 3...

Warner

--0000000000006236c005f49d9435
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 4:19 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; Most of the time, it&#39;s useful to make our best effort, but sometim=
es we<br>
&gt; want to know right away when we don&#39;t implement something. First p=
lace<br>
&gt; we use it is for unknown syscalls.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.c | 4 ++++<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 5 ++++-<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A03 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-sysca=
ll.c<br>
&gt; index 179a20c304b..e2b26ecb8dd 100644<br>
&gt; --- a/bsd-user/freebsd/os-syscall.c<br>
&gt; +++ b/bsd-user/freebsd/os-syscall.c<br>
&gt; @@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, in=
t num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot=
;Unsupported syscall: %d\n&quot;, num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsd_user_strict) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Unimplemented =
system call %d\n&quot;, num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
I don&#39;t like the raw printf, even if you did write to stderr.<br>
Perhaps just the abort, letting the error message be handled by qemu_log?<b=
r>
<br>
&gt; @@ -396,6 +397,8 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_opt_parse(=
optarg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!strcmp(r, &quot;0&=
quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv0 =3D argv[o=
ptind++];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(r, &quot;strict&quot;)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bsd_user_strict =3D true;<b=
r>
<br>
Perhaps force LOG_UNIMP?=C2=A0 Without -D, you&#39;ll get the qemu_log abov=
e to stderr.<br></blockquote><div><br></div><div>Given the number of other =
changes in the other bits, I&#39;m going to defer this feedback until round=
 3, since</div><div>the number of changes I&#39;ve made for round 2 means t=
here will=C2=A0 almost certainly result in a round 3...</div><div><br></div=
><div>Warner</div></div></div>

--0000000000006236c005f49d9435--


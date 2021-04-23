Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F274B369D8B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:46:59 +0200 (CEST)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5Vj-0008RY-3a
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la5TB-0007Na-Tx
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:44:21 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la5TA-0003Y0-0S
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:44:21 -0400
Received: by mail-qk1-x72b.google.com with SMTP id o5so51336862qkb.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OL+IVLpmaGKY9FpTep00bTy6UagxZdwEs9g4XolmFhw=;
 b=QbXMvz47ZnijZMPI6bHAxatiPq4GpsalP+ogSwJT+sB9xduINvj36s2uzTqTiTB8hF
 4yVdVsk8tmfXcIsRW6TnB04HY1cbvZaC72DLlMyecjsMrQ0iGVCefgOc7VKdKVnCvJN7
 S5Dbt+HIvjJaNIYOgUu2isA6xuTPdVMWaKBLzigbhN4eKhJdBiIu0LgTLwCP6CABkovw
 A/4n6GU4Ly0YCpWckyOewY16H177VLMFQ1chPNm1ue/bcWHopaYVefFZBMCaTN0FMtcL
 MbZ2UAEHrReqklVqgFXzq/InTy+kEBP5DvltBSqC7R2anF9bzVZFZ3x8rnIUm7hWE3xB
 cl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OL+IVLpmaGKY9FpTep00bTy6UagxZdwEs9g4XolmFhw=;
 b=RZZMUMTANDj8D+iOYSnxeILPg1iwmQGQ48fWg5QIwrzNEfixPKiLTf2dniI26FJAyh
 NXkCv5YTvu69v06EVaZK6sa8Du6zgLLkt4VK4qtmmc3AVUo4cHow0kkERQTIIsZ4QCAQ
 A+r/T3oKjmXTW7ZUFGCIfXfGDu/N+kYhfEwu89Smgj8L21LRefRQDYEJHmY6hFYhw+pI
 Td3htAfVyjRdtzyiES1evzmHbG9IED7OJYTjC+NlfzVvZS2ha6mo4UvGS+Xr3jAAt3RE
 GkuyHSbFTm84C95njKVnmKYVYo9c2jf7hHInOVQLrWtsLyeY5S2utplZzS0qmXFfTkON
 gjKQ==
X-Gm-Message-State: AOAM532FTpKYU3ESlDQDH0dKODx1iGC/hNnhwslCqwyAOx1VuT7MoKBk
 ekVsBOsYpQRtqI8UZpfpFTXujy13woM5Ho083mtt1A==
X-Google-Smtp-Source: ABdhPJyb0QpCIhnt77DXpWOZ08GOudTUruvKNYV8kEDnBJmEBJJi11oXFRaH2fUflhuhx1f+8NRvh8dQRTjr3SUdm34=
X-Received: by 2002:a37:aa54:: with SMTP id t81mr6460414qke.44.1619221458857; 
 Fri, 23 Apr 2021 16:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210423203959.78275-1-imp@bsdimp.com>
 <b54527b4-8b6f-17fa-8acd-a580c065b75b@linaro.org>
In-Reply-To: <b54527b4-8b6f-17fa-8acd-a580c065b75b@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 23 Apr 2021 17:44:07 -0600
Message-ID: <CANCZdfrTXWffdEsUhBAe+XdfZbvQW+wPei9+-GTdQjMRQuzKEA@mail.gmail.com>
Subject: Re: [PULL 10/24] bsd-user: style tweak: use C not C++ comments
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000de417d05c0ac5f0a"
Received-SPF: none client-ip=2607:f8b0:4864:20::72b;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000de417d05c0ac5f0a
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 5:06 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> > From: Warner Losh <imp@bsdimp.com>
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index b836b603af..3480db890d 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -71,7 +71,7 @@ struct image_info {
> >
> >   struct sigqueue {
> >       struct sigqueue *next;
> > -    //target_siginfo_t info;
> > +    /* target_siginfo_t info; */
> >   };
>
> Ack.
>
> > @@ -193,9 +193,11 @@ extern int do_strace;
> >   /* signal.c */
> >   void process_pending_signals(CPUArchState *cpu_env);
> >   void signal_init(void);
> > -//int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
> > -//void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t
> *info);
> > -//void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t
> *tinfo);
> > +/*
> > + * int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
> > + * void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t
> *info);
> > + * void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t
> *tinfo);
> > + */
>
> These should probably be deleted with the #if 0 code that references them.
>

OK. Sold.

Warner


>
> r~
>

--000000000000de417d05c0ac5f0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 5:06 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 4/23/21 1:39 PM, <a href=3D"mailto:imp@bsdimp.com" tar=
get=3D"_blank">imp@bsdimp.com</a> wrote:<br>
&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h | 10 ++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index b836b603af..3480db890d 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -71,7 +71,7 @@ struct image_info {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct sigqueue {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sigqueue *next;<br>
&gt; -=C2=A0 =C2=A0 //target_siginfo_t info;<br>
&gt; +=C2=A0 =C2=A0 /* target_siginfo_t info; */<br>
&gt;=C2=A0 =C2=A0};<br>
<br>
Ack.<br>
<br>
&gt; @@ -193,9 +193,11 @@ extern int do_strace;<br>
&gt;=C2=A0 =C2=A0/* signal.c */<br>
&gt;=C2=A0 =C2=A0void process_pending_signals(CPUArchState *cpu_env);<br>
&gt;=C2=A0 =C2=A0void signal_init(void);<br>
&gt; -//int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info=
);<br>
&gt; -//void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_=
t *info);<br>
&gt; -//void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t=
 *tinfo);<br>
&gt; +/*<br>
&gt; + * int queue_signal(CPUArchState *env, int sig, target_siginfo_t *inf=
o);<br>
&gt; + * void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo=
_t *info);<br>
&gt; + * void target_to_host_siginfo(siginfo_t *info, const target_siginfo_=
t *tinfo);<br>
&gt; + */<br>
<br>
These should probably be deleted with the #if 0 code that references them.<=
br></blockquote><div><br></div><div>OK. Sold.</div><div><br></div><div>Warn=
er</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000de417d05c0ac5f0a--


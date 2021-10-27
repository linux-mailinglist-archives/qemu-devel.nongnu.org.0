Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9C43CF0D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:53:30 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmB7-0006Oy-MC
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mflAp-0003xd-TI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:49:07 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mflAl-0004t6-V1
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:49:06 -0400
Received: by mail-lj1-x230.google.com with SMTP id e2so5373801ljg.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vo5PwOt0XaAnxsOglA7SUtv5RMaO3DPpUz2z13Z4c7o=;
 b=2ucGDX2r+WuMQ9mfq5I5wCJREnICQBRVgZ21vwQ3ZOc58jhD0AG/F4rg7QGjDFMH/Q
 W8Pqugxqp2BXwJrlCfwwdvrOmBIfu0sXPX8ZC3qBSJDUEcaYi1UL0+vJrU2a6kzToSR8
 1TVGpeFuaMgjkWjZEnRwFizsXb2wdBv1ZY59TcUqx171jH8bx622aqWNpWT1x5iB9TvA
 mUOCOxJryhLoOCC+5NFVbOpjDGuahbxkbRROjzNtSTuJoa76mNugyqLj++lbwUhh83DM
 EbfeITSEBgHsnZvVs+tUuLMMKQYMcgB++dhJwqRjRGgLe5uKB1mjoY6jSjg5X2B6wGpE
 RpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vo5PwOt0XaAnxsOglA7SUtv5RMaO3DPpUz2z13Z4c7o=;
 b=f9xQQNoL1f+OT5SjgRK9evYrpPjV848YcK2Uv4gCkQzI5ZY8FnSUCIEet3eqOY9yyT
 ffNXKbE8xBfcgfm+wXeoqmS03rF+kluRLI42LbOZMduadG7ShzMix0qxfvMxjInxg0jm
 BH2/sHYzomgjZiOCtbefrn9akNpHvF+XeCLMrJdxwh2joj8ppPeQQzitjnEifRpVHNiY
 01D5hWGLN3TE5wqyFQ/nLH+NKgliRzsa8do9JtF9mjm/z/aieqSRxrUhmRufrxVegg+5
 jAxcawjzFD0fldk/+hAbr2HEW6SsN8STnBO4rdxKt1G/ccALsFMCXChBQrMTC45gwBNW
 5mVg==
X-Gm-Message-State: AOAM531Tw6Kkm/N/7Qo0EnVSPyCBwe3dotIZs/eo6b3My4j4egb12NY8
 3ytI0rlgvpZVicZ4zMKT9xhqpBaPVYIj5AXcNWnAjA==
X-Google-Smtp-Source: ABdhPJwFkYslUUADEF0Zcle2na8PRrwPr2a0VCo5eEsSiQOXTC2TPkMByWkgsNsAkeuuAOgbEXn5x/rIc+qu8Cx1QQU=
X-Received: by 2002:a2e:bc16:: with SMTP id b22mr32596134ljf.223.1635349740963; 
 Wed, 27 Oct 2021 08:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-20-imp@bsdimp.com>
 <CACNAnaH1pNrHjxUOsuP2ZLj2hdJKKw2WJubS7sdsKL6TeHFCsw@mail.gmail.com>
In-Reply-To: <CACNAnaH1pNrHjxUOsuP2ZLj2hdJKKw2WJubS7sdsKL6TeHFCsw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 27 Oct 2021 09:48:49 -0600
Message-ID: <CANCZdfr5raNXVDtaLb3ffasKEvG8Wv4_rrQWxPRkKTT197bgHw@mail.gmail.com>
Subject: Re: [PATCH 19/24] bsd-user/arm/target_arch_signal.h: arm user context
 and trapframe for signals
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000064de8d05cf57883a"
Received-SPF: none client-ip=2a00:1450:4864:20::230;
 envelope-from=wlosh@bsdimp.com; helo=mail-lj1-x230.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stacey Son <sson@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000064de8d05cf57883a
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 12:07 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
> >
> > Arm specific user context structures for signal handling and the closely
> > related trap frame.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/bsd-user/arm/target_arch_signal.h
> b/bsd-user/arm/target_arch_signal.h
> > index 9fee58ca9c..67355ff28f 100644
> > --- a/bsd-user/arm/target_arch_signal.h
> > +++ b/bsd-user/arm/target_arch_signal.h
> > @@ -90,4 +90,42 @@ typedef struct target_mcontext {
> >      } __fpu;
> >  } target_mcontext_t;
> >
> > +typedef struct target_ucontext {
> > +    target_sigset_t     uc_sigmask;
> > +    target_mcontext_t   uc_mcontext;
> > +    abi_ulong           uc_link;
> > +    target_stack_t      uc_stack;
> > +    int32_t             uc_flags;
> > +    int32_t             __spare__[4];
> > +} target_ucontext_t;
> > +
> > +struct target_sigframe {
> > +    target_siginfo_t    sf_si;  /* saved siginfo */
> > +    target_ucontext_t   sf_uc;  /* saved ucontext */
> > +};
> > +
> > +
>
> We might be able to kill this extra newline? I'm not familiar enough
> with qemu's style preferences here...
>

done.


> > +/* compare to sys/arm/include/frame.h */
> > +struct target_trapframe {
> > +    abi_ulong tf_spsr; /* Zero on arm26 */
> > +    abi_ulong tf_r0;
> > +    abi_ulong tf_r1;
> > +    abi_ulong tf_r2;
> > +    abi_ulong tf_r3;
> > +    abi_ulong tf_r4;
> > +    abi_ulong tf_r5;
> > +    abi_ulong tf_r6;
> > +    abi_ulong tf_r7;
> > +    abi_ulong tf_r8;
> > +    abi_ulong tf_r9;
> > +    abi_ulong tf_r10;
> > +    abi_ulong tf_r11;
> > +    abi_ulong tf_r12;
> > +    abi_ulong tf_usr_sp;
> > +    abi_ulong tf_usr_lr;
> > +    abi_ulong tf_svc_sp; /* Not used on arm26 */
> > +    abi_ulong tf_svc_lr; /* Not used on arm26 */
> > +    abi_ulong tf_pc;
> > +};
> > +
> >  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> > --
> > 2.32.0
> >
>
> I didn't think we actually supported arm26, but I see those comments
> also exist verbatim in machine/frame.h; no objection to reflecting
> them here, as well.
>

Removed. I'll prep a commit for the fork too and remove them from FreeBSD
since they have never been relevant.


> Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
>

Thanks!

--00000000000064de8d05cf57883a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 12:07 AM Kyle=
 Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
Oct 19, 2021 at 11:45 AM Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" =
target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Arm specific user context structures for signal handling and the close=
ly<br>
&gt; related trap frame.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 38 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_a=
rch_signal.h<br>
&gt; index 9fee58ca9c..67355ff28f 100644<br>
&gt; --- a/bsd-user/arm/target_arch_signal.h<br>
&gt; +++ b/bsd-user/arm/target_arch_signal.h<br>
&gt; @@ -90,4 +90,42 @@ typedef struct target_mcontext {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } __fpu;<br>
&gt;=C2=A0 } target_mcontext_t;<br>
&gt;<br>
&gt; +typedef struct target_ucontext {<br>
&gt; +=C2=A0 =C2=A0 target_sigset_t=C2=A0 =C2=A0 =C2=A0uc_sigmask;<br>
&gt; +=C2=A0 =C2=A0 target_mcontext_t=C2=A0 =C2=A0uc_mcontext;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uc_li=
nk;<br>
&gt; +=C2=A0 =C2=A0 target_stack_t=C2=A0 =C2=A0 =C2=A0 uc_stack;<br>
&gt; +=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
uc_flags;<br>
&gt; +=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
__spare__[4];<br>
&gt; +} target_ucontext_t;<br>
&gt; +<br>
&gt; +struct target_sigframe {<br>
&gt; +=C2=A0 =C2=A0 target_siginfo_t=C2=A0 =C2=A0 sf_si;=C2=A0 /* saved sig=
info */<br>
&gt; +=C2=A0 =C2=A0 target_ucontext_t=C2=A0 =C2=A0sf_uc;=C2=A0 /* saved uco=
ntext */<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
<br>
We might be able to kill this extra newline? I&#39;m not familiar enough<br=
>
with qemu&#39;s style preferences here...<br></blockquote><div><br></div><d=
iv>done.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
&gt; +/* compare to sys/arm/include/frame.h */<br>
&gt; +struct target_trapframe {<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_spsr; /* Zero on arm26 */<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r0;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r1;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r2;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r3;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r4;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r5;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r6;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r7;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r8;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r9;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r10;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r11;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r12;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_usr_sp;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_usr_lr;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_svc_sp; /* Not used on arm26 */<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_svc_lr; /* Not used on arm26 */<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_pc;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 #endif /* !_TARGET_ARCH_SIGNAL_H_ */<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
<br>
I didn&#39;t think we actually supported arm26, but I see those comments<br=
>
also exist verbatim in machine/frame.h; no objection to reflecting<br>
them here, as well.<br></blockquote><div><br></div><div>Removed. I&#39;ll p=
rep a commit for the fork too and remove them from FreeBSD</div><div>since =
they have never been relevant.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Reviewed-by: Kyle Evans &lt;kevans@FreeBSD.org&gt;<br></blockquote><div><br=
></div><div>Thanks!=C2=A0</div></div></div>

--00000000000064de8d05cf57883a--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB743F2B5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 00:24:27 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDov-000231-D2
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 18:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgDnf-0000qX-DD
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 18:23:07 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgDnc-0006rU-Mz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 18:23:06 -0400
Received: by mail-ua1-x935.google.com with SMTP id i6so289021uae.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QnOE0dZ9XP4k5qtjrAhDoxkDYkgNQ1pnZpuVm1RstEo=;
 b=IuO9fgzWsxVGzX98+tlqpoRjDAWRVU538G5MZ6Fln0xHvvsSItAP83P8Vgrdql+66g
 FzBMPGMkSB72DNeA4Y0/5bVzwcvP6B8fs1cKuWXebEw+/0hV+N8Det2OV6iubxlN1oaU
 o1tWfU2Sf/jF88VCRcM7+t3YmmgxkYThKGMk1CvRrEg8Rfdjch0HikRM5NNl5IH4vswf
 WU5FllWsYHzj0uKHSGGsmdWScbq5zDFvu8ZYYJAwThP9e5sBEPqtwYHDw7pkp7qIxS0d
 hXj28C7/GLnqBa7D3H2e4bFvgw5x5aUX5GvMjlL/pp8QLMjGnwnSL/N/OuEr7t3L6u0l
 k6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnOE0dZ9XP4k5qtjrAhDoxkDYkgNQ1pnZpuVm1RstEo=;
 b=Oqp330CbcpWmCOnDM0ezrO27B0CirIdDxoIGONFfzHU3dm3ZKz3omcJO4I5KQcI4qt
 6HG3SXqAWeJyPA1exootioQ0flqOQP5T7uPinPd6W+0RNISa2Kt7g7XRHJSMl10EzGl7
 N24xHTbS1dn5bX1N+PzQhyKfsVR6vdXCZGm/pP/4hDsdOnouM+Caf/r/qc9h8IEs3QM4
 ciTAJWUu4sU6f6SAlmRST60CU6yZagbYmV7vPe3msPB5VeXE/ZJbOakQWQwFf6osn5Jc
 Z8J8xSQyC2PesB9FrmkDf33iwu2iIQu9tPtBImbY2T/z2VckGnyiMIT55JF5/XoGKHFC
 Y7qQ==
X-Gm-Message-State: AOAM532YsYm2jqR5O345Mu+wmwKC9l0VLFXI7SZU4MCy3ORM7QhZly4c
 UaUMM4lkmLwzOMGSJAgg3iVlDUAguFxB2d8Yq1FzWQ==
X-Google-Smtp-Source: ABdhPJx2eDbAXCbLv2fUuyof1f1L3N5MvYkddi7fShYSJpLRXIGi5tUWxxBlZC2sHjHfxumgMsx8lkfYOwubbBLSn1M=
X-Received: by 2002:a05:6102:5494:: with SMTP id
 bk20mr8633685vsb.6.1635459783380; 
 Thu, 28 Oct 2021 15:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
 <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
 <CACNAnaFr1Mg5OTivWMLhN=fNy8MB284aRRGBub9vA=-1bHbFeQ@mail.gmail.com>
In-Reply-To: <CACNAnaFr1Mg5OTivWMLhN=fNy8MB284aRRGBub9vA=-1bHbFeQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 16:22:52 -0600
Message-ID: <CANCZdfq7BovMCbQ6c2kQ3j2P7Aacj-tJjxayPrggMD00i4Xhcw@mail.gmail.com>
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000006ee70d05cf712797"
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006ee70d05cf712797
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 11:35 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Thu, Oct 28, 2021 at 12:25 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 10/19/21 9:44 AM, Warner Losh wrote:
> > > +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
> >
> > Surely there should be some handling of thumb addresses here.
> >
>
> Honestly, this wouldn't surprise me- we're kind of a thumb landmine.
> The other thumb-ish support is relatively recent as we hit something
> that had an entry point on a thumb instruction; but we don't typically
> build/run binaries including thumb instructions.
>

Yes. We don't have good, extensive test cases for this. We likely should.

Warner

--0000000000006ee70d05cf712797
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:35 AM Kyle=
 Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
Oct 28, 2021 at 12:25 PM Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;regs[TARGET_REG_PC] =3D ka-&gt;_sa_handle=
r;<br>
&gt;<br>
&gt; Surely there should be some handling of thumb addresses here.<br>
&gt;<br>
<br>
Honestly, this wouldn&#39;t surprise me- we&#39;re kind of a thumb landmine=
.<br>
The other thumb-ish support is relatively recent as we hit something<br>
that had an entry point on a thumb instruction; but we don&#39;t typically<=
br>
build/run binaries including thumb instructions.<br></blockquote><div><br><=
/div><div>Yes. We don&#39;t have good, extensive test cases for this. We li=
kely should.</div><div><br></div><div>Warner</div></div></div>

--0000000000006ee70d05cf712797--


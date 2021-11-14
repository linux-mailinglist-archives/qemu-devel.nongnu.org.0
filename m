Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CC44F767
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:16:36 +0100 (CET)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmCYt-0004kz-GH
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:16:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mmCXu-0003rl-RE; Sun, 14 Nov 2021 05:15:34 -0500
Received: from [2607:f8b0:4864:20::92d] (port=44635
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mmCXt-0006bd-Bc; Sun, 14 Nov 2021 05:15:34 -0500
Received: by mail-ua1-x92d.google.com with SMTP id p2so28317084uad.11;
 Sun, 14 Nov 2021 02:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=YW2cOITpy4D1kAh47chpsTtHyFf7E4Jqgxlxdztfy5o=;
 b=a6nW9tnxOdFnAGDKh37QSr0ocaHmEDpQ1bkPtXjPz6oOkWpeNWOPDEe3Oe8np/nhMt
 DhRQ3Vi2FPyF556LfqGC2Iyf07HI7lVpaRJKgrkjKJgqmxzFkad4AKrKNHmjlvuUBZ+d
 AQKcjJU/2DtNiuumFWRoAmuM2MkU0BZdoqv1WxhVQCo4eATxNCwVKOgb7dC5sjA2Rnmm
 mrqQ9nindLk1uqmr1Ibi86Jm6NO8/Omad9+aXQ5TNED1DZ7jQnh/EhC0NRZOlJR8dOKT
 aFNFc5vY4rAp0C0BpFTazLm+fvsBEs+I/PUWVdh44BHDMLqIyj2iLMRUsv51pfPyUo/R
 f9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=YW2cOITpy4D1kAh47chpsTtHyFf7E4Jqgxlxdztfy5o=;
 b=eGSrQAHzYUGOUn0gDjoKdzx1Tv4Occ7TyAKnstytx9MWrkG/lNFYgYlXSuEqOYM35o
 wNBFg8CKKrx3LRIYpe7z78li1OCfsVPqdw2DPyO4U7J6A37t8eeMgm8eV4G8ERL7Gn6s
 fZyC72gD3Y1ea3YbsKTzyW6vkaP7FYTAeWY5B6wDnYX2CzsYYrVPFfLDsqwC7FlOoPou
 Okl4F9x/o8soptLGzxVKcBdJjbVKo4NW141o8d0dz/o88RS4FoX8aoO/j3i8h2Q8NIak
 lkrSMNvfsveWYwZSXhb8IiZSuWT0EHy/RRQRJb64a73SE4G/9gyxiWKaFxKUk5St4xry
 UFYg==
X-Gm-Message-State: AOAM531Jn+hqVMHnZDtLSH1PQbSmjBLrSdNbI9bkCH5T8CbLUCzzuMLa
 GAuMvXqSKxnUyTGFd8UAVVCV6AjOoT9HsAbOqqXrcUJuo7g9gg==
X-Google-Smtp-Source: ABdhPJwRyeLLIlITrW2nJQ3Frf6fPgjhKO5AIErd9LXYnzjKuoeg8+uV/5mnGBazl/+9dCwXInNZwy1sEWqS2M7aJao=
X-Received: by 2002:a05:6102:2924:: with SMTP id
 cz36mr30216896vsb.33.1636884931651; 
 Sun, 14 Nov 2021 02:15:31 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE_1ajznMKob+r3OEHKztPueiqWxSAOE+PKF_hNS6nktjg@mail.gmail.com>
 <77cac06d-f68f-ec30-5c7e-0d32a49a162d@linaro.org>
In-Reply-To: <77cac06d-f68f-ec30-5c7e-0d32a49a162d@linaro.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 14 Nov 2021 18:15:22 +0800
Message-ID: <CAE2XoE8sNeMqx7xMVzArVzyU_n-G4-ZXh15gMMnf3PbmfcebXA@mail.gmail.com>
Subject: Re: ppc/fpu_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e3ac7705d0bcf8b6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Cc: qemu-ppc@nongnu.org, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e3ac7705d0bcf8b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 14, 2021 at 5:07 PM Richard Henderson <
richard.henderson@linaro.org> wrote:
>
> On 11/13/21 11:07 AM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> > I've seen nothing in fpu_helper.c to update
> > the fpscr to FP_FR,
> > that is there is no code with `fpscr |=3D FP_FR`,
> > is that valid for PowerPC? or it's just because this is hard
> > to implement and then the FP_FR  are always not set  for  fpscr
>
> It is unimplemented, yes.  I think that no one has spent the time; I
don't think that it
> should be hard, necessarily.

Thanks, I also have a question, where is the complete PowerPC floating
point instrunctions tests case?
I wanna improve the performance of powerpc floating point calculation and
don't lost the accuracy of it
So I need a complete testsuite for it.


>
>
> r~



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000e3ac7705d0bcf8b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sun, Nov 14, 2021 at 5:07 PM Richard Henderson =
&lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linar=
o.org</a>&gt; wrote:<br>&gt;<br>&gt; On 11/13/21 11:07 AM, =E7=BD=97=E5=8B=
=87=E5=88=9A(Yonggang Luo) wrote:<br>&gt; &gt; I&#39;ve seen nothing in fpu=
_helper.c to update<br>&gt; &gt; the fpscr to FP_FR,<br>&gt; &gt; that is t=
here is no code with `fpscr |=3D FP_FR`,<br>&gt; &gt; is that valid for Pow=
erPC? or it&#39;s just because this is hard<br>&gt; &gt; to implement and t=
hen the FP_FR =C2=A0are always not set =C2=A0for =C2=A0fpscr<br>&gt;<br>&gt=
; It is unimplemented, yes.=C2=A0 I think that no one has spent the time; I=
 don&#39;t think that it<br>&gt; should be hard, necessarily.<div><br></div=
><div>Thanks, I also have a question, where is the complete PowerPC floatin=
g point instrunctions tests case?</div><div>I wanna improve the performance=
 of powerpc floating point calculation and don&#39;t lost the accuracy of i=
t=C2=A0=C2=A0</div><div>So I need a complete testsuite for it.</div><div><b=
r></div><div><br>&gt;<br>&gt;<br>&gt; r~<br><br><br><br>--<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000e3ac7705d0bcf8b6--


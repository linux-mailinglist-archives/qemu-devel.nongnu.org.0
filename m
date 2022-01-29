Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179764A2ADB
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 02:06:28 +0100 (CET)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDcCA-0006z9-Sq
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 20:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nDbyh-0002BC-3L
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 19:52:31 -0500
Received: from [2a00:1450:4864:20::529] (port=35650
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nDbyW-0003ue-6K
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 19:52:23 -0500
Received: by mail-ed1-x529.google.com with SMTP id n10so13247996edv.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PZJ3vMVqdeVQZhcQtBsuE+DS8y2K0C8rMEdCP0zaBlE=;
 b=mX9OWIsGAuj9Dep5Q82R4bLPZpYXCu3E1Ecnixh48Jorgu8MZBMz+wOsfVnJAB2syo
 W5XEDdD3f2jPKcJoAdsrqM26RRe+ePsYdyJLI+yG+dHmttf4mobtJD8253ZiFVxXOGsI
 TVmIkReQsiyJH+TSJtgLwVYk61JFJiQrY6+iP3jFl0V+iw4/+/ec8Z2XsXbmm5KFoib1
 dRIVPEKqcnh2wFUoKyrsqr35siFd4nl1lc7kiH04PGCYJdnDsam5mJ/MUVWJxL3+ZAxe
 vtNxsL/fX7CB42tLC2JuTNNUUu+57n3miZaNK2lm/G1QvPKpOPjXoqQFZI3LYFJKhO8Q
 8YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZJ3vMVqdeVQZhcQtBsuE+DS8y2K0C8rMEdCP0zaBlE=;
 b=OqSKby6Uq2JD5gobITj0ThlE1nVp4M0jzYQABgX9Aw7yfJtx8ZKegdCUMaI15QLdSl
 +6XyndRekeZgfkmSJujRuEK0DC7gmRrkhi62DsSVE8CLifA1h1JCVrkA9D9lWjR6/R09
 aYOLFW3ky3qhaaKXd2oxyvD+Dm70uT/bIO8OD+gtaRXk/meI0Y8w1I5gRaXO/lBWUqlN
 p5ahO+YCztIyZUbin3ACX5LsaTcNra9t6wkgfsCFDw/P6haZeGqJ3PYdCJvLb6WJAv+b
 ByxaMgzcS9DpMdzfE9xwUxBdxDx//McBB9WeYkuonB0dXpjwgenFkx8ZM91kPpZswSvx
 XZAA==
X-Gm-Message-State: AOAM533OPch+Vb1AQp+Id2JOhOYhbS2j78d5+ZWlKvZSL7WB7HHX48KF
 jFBKW5+mqXvPvOIcmUNaxLpydK4rLW4x41smk8ATLw==
X-Google-Smtp-Source: ABdhPJw2T3NeoVSdElTrH1MPS9297k6xdToUPoGDtfhq6gTTm7LqcQ0kSWcXJ8gfPvYREolOKJH8Y5H497E/njzFR7E=
X-Received: by 2002:a50:ed8e:: with SMTP id h14mr10492318edr.398.1643417537488; 
 Fri, 28 Jan 2022 16:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-2-atishp@rivosinc.com>
 <fc833a66-c0fe-931a-ab7e-e81917a8d786@linaro.org>
In-Reply-To: <fc833a66-c0fe-931a-ab7e-e81917a8d786@linaro.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 28 Jan 2022 16:52:06 -0800
Message-ID: <CAHBxVyGOuLWPs1-10GTAtz6=QMDybOq4h5dXLq7NcDYOTn9nuA@mail.gmail.com>
Subject: Re: [RFC 1/5] target/riscv: Add the privileged spec version 1.12.0
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008a397d05d6adf601"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=atishp@rivosinc.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a397d05d6adf601
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 23, 2022 at 11:59 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/21/22 7:07 AM, Atish Patra wrote:
> > Add the definition for ratified privileged specification version v1.12
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.h | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 4d630867650a..671f65100b1a 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -82,6 +82,7 @@ enum {
> >
> >   #define PRIV_VERSION_1_10_0 0x00011000
> >   #define PRIV_VERSION_1_11_0 0x00011100
> > +#define PRIV_VERSION_1_12_0 0x00011200
>
> Is there any good reason for defining things this way, as opposed to a
> simple enumeration?
> A simple enum would eliminate the need for
>
>
Agreed. A simple enum would be much nicer. I was just following the
previous definition of
PRIV_VERSION_1_10_0 & PRIV_VERSION_1_11_0.

I am not sure about the reason behind this scheme.

@Alistair Francis <alistair.francis@wdc.com> Is there any history behind
this scheme ?
or Are you okay if I change it ?


> > +    /* The default privilege specification version supported is 1.10 */
> > +    if (!csr_min_priv) {
> > +        csr_min_priv = PRIV_VERSION_1_10_0;
> > +    }
>
> in patch 5.
>
>
> r~
>

--0000000000008a397d05d6adf601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 23, 2022 at 11:59 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/21/22 7:07 AM, Atish Patra wrote:<br>
&gt; Add the definition for ratified privileged specification version v1.12=
<br>
&gt; <br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 4d630867650a..671f65100b1a 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -82,6 +82,7 @@ enum {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define PRIV_VERSION_1_10_0 0x00011000<br>
&gt;=C2=A0 =C2=A0#define PRIV_VERSION_1_11_0 0x00011100<br>
&gt; +#define PRIV_VERSION_1_12_0 0x00011200<br>
<br>
Is there any good reason for defining things this way, as opposed to a simp=
le enumeration?<br>
A simple enum would eliminate the need for<br>
<br></blockquote><div><br></div><div>Agreed. A simple enum would be much ni=
cer. I was just following the previous definition of=C2=A0 <br>PRIV_VERSION=
_1_10_0 &amp; PRIV_VERSION_1_11_0.</div><div><br></div><div>I am not sure a=
bout the reason behind this scheme.</div><div><br></div><div><a class=3D"gm=
ail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:alistair.francis@wdc.c=
om" tabindex=3D"-1">@Alistair Francis</a>=C2=A0Is there any history behind =
this scheme ?<br></div><div>or Are you okay if I change it ?</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 /* The default privilege specification version supporte=
d is 1.10 */<br>
&gt; +=C2=A0 =C2=A0 if (!csr_min_priv) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 csr_min_priv =3D PRIV_VERSION_1_10_0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
in patch 5.<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000008a397d05d6adf601--


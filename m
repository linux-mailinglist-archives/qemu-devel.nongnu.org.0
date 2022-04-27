Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39749511CC6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 20:18:25 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njmF6-0006Xv-8w
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 14:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1njmC0-0004nq-Bn
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 14:15:12 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1njmBy-0000Rk-19
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 14:15:12 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u9so1652389plf.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpxlhtXzKqBOTstQwgFuZfegdfi8Onvs8pdV/aietiQ=;
 b=dpAn0H2WKTez3Lgl+YILXNhHRL9cktXIWOUKSyB//zlyOSdGQBTShuOXKDVns4bmb0
 268UG0jsc8m1qPQC3CRCMKXFY+tgG1vNBS5hm6hQfFYjJjra9YfRnmFyKkLRWU6jRI2X
 QpG6m9TRLTg3jrMeY/58PM4Gz4Nm7NWEdjMEiTQGkZmUpmkCST/+JSgew5/cwFr8Z3eg
 NxkYtGox301F8GgxDOKr82Ydz6utpQ+Zs2S0NT7eCUeE10YMctWFWC2TXK1QnNeVTSQr
 Qx0QTquyZ/8WgW1QctDDDFTYT3YczRqSgTGng94AbxoTNtY8fq9gRkM8TCJmiJ2IiEUC
 ghjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpxlhtXzKqBOTstQwgFuZfegdfi8Onvs8pdV/aietiQ=;
 b=MJZSsyYt8PgB0ctSRSnQfqFNeP15kk42bXwHw8tq6MHNzuLDJFJR7U6K5tRsfH3/m2
 FPzyh0G0GB9d8GjNuOzP4LBVICOnN8zweYRJVx9XevsL+zKugEtsE1yRpzLzF0Zhnv/S
 YQS1jP6GXRf683eBa3WsP2bBRXtbwQEX1IYfN17yRzLoTKCqSn2wNQURjfakVM1HZkuL
 KBb2CMOHBs4j3qgvgJrIGVD7B6JfXMelsq1TXQaXHvSzYrkIwFtiKxN9KTV5uZno2crP
 XSuvHcql0xAw83s+Vjbtu2I0+ZXgtOObCthkvZzzi3r4N7qw5wmVaXXhbDLQgJspZH15
 okwQ==
X-Gm-Message-State: AOAM531XW9P48bnpa27IoxjFXmvZ53MXFk3RNM5u84rY5NaAYLiz6fzh
 OgCf+8dSq4KtOW8dqCE7evJWComLMymnExMpRLsrDQ==
X-Google-Smtp-Source: ABdhPJy6lLq5aAtbi+Clel4mqtV3Mxptogj1kI5wUqWN6PoATgMjUwHutrEtwbJTLnkbug3fyfE2SiCkWjwDZ8rB4XM=
X-Received: by 2002:a17:90b:d91:b0:1da:35d7:a0c with SMTP id
 bg17-20020a17090b0d9100b001da35d70a0cmr5277778pjb.92.1651083307813; Wed, 27
 Apr 2022 11:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220427181335.26613-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220427181335.26613-1-quic_llindhol@quicinc.com>
From: Leif Lindholm <leif@nuviainc.com>
Date: Wed, 27 Apr 2022 19:14:56 +0100
Message-ID: <CALDovBvSq8K0BOQGE=W8uWynXTtxoPYDgzXF_rA6CPWg-1-cgg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS/.mailmap: update email for Leif Lindholm
To: Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: multipart/alternative; boundary="0000000000000ea21b05dda6cae8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=leif@nuviainc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000ea21b05dda6cae8
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 7:13 PM Leif Lindholm <quic_llindhol@quicinc.com>
wrote:
>
> NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
> separate infrastructure for a transitional period. We've now switched
> over to contributing as Qualcomm Innocation Center (quicinc), so update
> my email address to reflect this.
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Leif Lindholm <leif@nuviainc.com>

> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 2976a675ea..6b28c98a90 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -63,6 +63,7 @@ Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>  Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>  Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> +Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
>  Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
>  Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
>  Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 294c88ace9..02042a7955 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -890,7 +890,7 @@ F: include/hw/ssi/imx_spi.h
>  SBSA-REF
>  M: Radoslaw Biernacki <rad@semihalf.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> -R: Leif Lindholm <leif@nuviainc.com>
> +R: Leif Lindholm <quic_llindhol@quicinc.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
> --
> 2.30.2

--0000000000000ea21b05dda6cae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Apr 27, 2022 at 7:13 PM Leif Lindholm &lt;<a href=
=3D"mailto:quic_llindhol@quicinc.com">quic_llindhol@quicinc.com</a>&gt; wro=
te:<br>&gt;<br>&gt; NUVIA was acquired by Qualcomm in March 2021, but kept =
functioning on<br>&gt; separate infrastructure for a transitional period. W=
e&#39;ve now switched<br>&gt; over to contributing as Qualcomm Innocation C=
enter (quicinc), so update<br>&gt; my email address to reflect this.<br>&gt=
;<br>&gt; Signed-off-by: Leif Lindholm &lt;<a href=3D"mailto:quic_llindhol@=
quicinc.com">quic_llindhol@quicinc.com</a>&gt;<br>&gt; Cc: Leif Lindholm &l=
t;<a href=3D"mailto:leif@nuviainc.com">leif@nuviainc.com</a>&gt;<br>&gt; Cc=
: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt;<br><br>Reviewed-by: Leif Lindholm &lt;<a href=3D"mail=
to:leif@nuviainc.com">leif@nuviainc.com</a>&gt;<br><div><br></div><div>&gt;=
 ---<br>&gt; =C2=A0.mailmap =C2=A0 =C2=A0| 1 +<br>&gt; =C2=A0MAINTAINERS | =
2 +-<br>&gt; =C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>&gt;<=
br>&gt; diff --git a/.mailmap b/.mailmap<br>&gt; index 2976a675ea..6b28c98a=
90 100644<br>&gt; --- a/.mailmap<br>&gt; +++ b/.mailmap<br>&gt; @@ -63,6 +6=
3,7 @@ Huacai Chen &lt;<a href=3D"mailto:chenhuacai@kernel.org">chenhuacai@=
kernel.org</a>&gt; &lt;<a href=3D"mailto:chenhc@lemote.com">chenhc@lemote.c=
om</a>&gt;<br>&gt; =C2=A0Huacai Chen &lt;<a href=3D"mailto:chenhuacai@kerne=
l.org">chenhuacai@kernel.org</a>&gt; &lt;<a href=3D"mailto:chenhuacai@loong=
son.cn">chenhuacai@loongson.cn</a>&gt;<br>&gt; =C2=A0James Hogan &lt;<a hre=
f=3D"mailto:jhogan@kernel.org">jhogan@kernel.org</a>&gt; &lt;<a href=3D"mai=
lto:james.hogan@imgtec.com">james.hogan@imgtec.com</a>&gt;<br>&gt; =C2=A0Le=
if Lindholm &lt;<a href=3D"mailto:leif@nuviainc.com">leif@nuviainc.com</a>&=
gt; &lt;<a href=3D"mailto:leif.lindholm@linaro.org">leif.lindholm@linaro.or=
g</a>&gt;<br>&gt; +Leif Lindholm &lt;<a href=3D"mailto:quic_llindhol@quicin=
c.com">quic_llindhol@quicinc.com</a>&gt; &lt;<a href=3D"mailto:leif@nuviain=
c.com">leif@nuviainc.com</a>&gt;<br>&gt; =C2=A0Radoslaw Biernacki &lt;<a hr=
ef=3D"mailto:rad@semihalf.com">rad@semihalf.com</a>&gt; &lt;<a href=3D"mail=
to:radoslaw.biernacki@linaro.org">radoslaw.biernacki@linaro.org</a>&gt;<br>=
&gt; =C2=A0Paul Burton &lt;<a href=3D"mailto:paulburton@kernel.org">paulbur=
ton@kernel.org</a>&gt; &lt;<a href=3D"mailto:paul.burton@mips.com">paul.bur=
ton@mips.com</a>&gt;<br>&gt; =C2=A0Paul Burton &lt;<a href=3D"mailto:paulbu=
rton@kernel.org">paulburton@kernel.org</a>&gt; &lt;<a href=3D"mailto:paul.b=
urton@imgtec.com">paul.burton@imgtec.com</a>&gt;<br>&gt; diff --git a/MAINT=
AINERS b/MAINTAINERS<br>&gt; index 294c88ace9..02042a7955 100644<br>&gt; --=
- a/MAINTAINERS<br>&gt; +++ b/MAINTAINERS<br>&gt; @@ -890,7 +890,7 @@ F: in=
clude/hw/ssi/imx_spi.h<br>&gt; =C2=A0SBSA-REF<br>&gt; =C2=A0M: Radoslaw Bie=
rnacki &lt;<a href=3D"mailto:rad@semihalf.com">rad@semihalf.com</a>&gt;<br>=
&gt; =C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
>peter.maydell@linaro.org</a>&gt;<br>&gt; -R: Leif Lindholm &lt;<a href=3D"=
mailto:leif@nuviainc.com">leif@nuviainc.com</a>&gt;<br>&gt; +R: Leif Lindho=
lm &lt;<a href=3D"mailto:quic_llindhol@quicinc.com">quic_llindhol@quicinc.c=
om</a>&gt;<br>&gt; =C2=A0L: <a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm=
@nongnu.org</a><br>&gt; =C2=A0S: Maintained<br>&gt; =C2=A0F: hw/arm/sbsa-re=
f.c<br>&gt; --<br>&gt; 2.30.2</div></div>

--0000000000000ea21b05dda6cae8--


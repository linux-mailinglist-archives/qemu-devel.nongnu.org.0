Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A065927
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 16:40:01 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlaEr-0003P0-21
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 10:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaE4-0002qQ-Rd
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaE3-0006yR-Km
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:39:12 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlaE3-0006w0-DF
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:39:11 -0400
Received: by mail-ot1-x344.google.com with SMTP id n5so6107790otk.1
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BYOEYw35xlqaw1o7LBjte74j1xHji7u5iShs1xXWefQ=;
 b=EcaEfFB/nfr8zMoxkiMotiFkTx/0yZ9hMoz+D6BIWKVNUqolvZcjtWmgyYbRvABupO
 Ow9HQN+zcVO+HnUJ87eC66k4e2c4xHVFDIWcENkBNq4bH/1t2HM9bS5aAIJh3V8TwVsB
 AJgPlAntPEgAsLfgntLhQdj6APa2Nw11IgQJI0KIzyIrWq7/nBy0kVGepllhx6JclH5r
 4YyxJOcw00++rJEQ7qjWHSuj3bQFKsk9aDzjLPCv6hpE0NlzObwvSaHNxbL39Wgex2OD
 xN3On5Qqd4TuuF42PKPj+hOlaN2ddggMmLX7pL1X5hlO3vLsf/RI5KmLNOzHolF4DiaK
 av2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BYOEYw35xlqaw1o7LBjte74j1xHji7u5iShs1xXWefQ=;
 b=JsKfS1iEyJ0EAnKRFdqae1JJqEVDZZNCJV3rzpeJ5H2jIGagDsSZzPuaUl5i/O0By4
 Xe70pfgoyq0RSqNpBi+pjSSt6LeGnNlu9dWSYeannTmRMF/5GbcxS5ZJP+0p59qNZ+vX
 mJ14FGnkU2IYyBg18KZDeUTuXoYTHrx0zLVcN8ehXyCE2xToCpxM8w8PCdeiUDf+q8nt
 gGbr5J9xYTeRIvS9oF6yqp5jrJMRO8Sf1UTZpWh2J+/ibN8znipFcZrH0n9ANh4wJqcb
 y30FiqztdGWXr+PSF7IoJQwjbdrcSX+AJAhUSXvO/5Oo2hPXSeVlFbXFSC8ej+QwwwH6
 qLHg==
X-Gm-Message-State: APjAAAW1DHmYqZjS6sxmmsBqseyGzRdYnfT9ypt8DDlKyOdLFBrQptdS
 7gkGnEipHZxzwFIrOnVQ39C8E19nvVYcJCyXlee+gA==
X-Google-Smtp-Source: APXvYqyrmvsKMGyjQFlEAAp1a4kK3k+UUWb4MeuLqjsPCHK2f77Ir/fxoWCHXalGd9TIe1490sIeUE1ERHT3dFEb72M=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3796751oti.91.1562855949933; 
 Thu, 11 Jul 2019 07:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190711103737.10017-1-alex.bennee@linaro.org>
In-Reply-To: <20190711103737.10017-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 15:38:58 +0100
Message-ID: <CAFEAcA-mJ5qcA-iS8BxfoVVMkAt13k11bYOT_eELw-WzcSEvRQ@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 for 4.1] target/arm: report ARMv8-A FP
 support for AArch32 -cpu max
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 1836078@bugs.launchpad.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Jul 2019 at 11:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When we converted to using feature bits in 602f6e42cfbf we missed out
> the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
> -cpu max configurations. This caused a regression in the GCC test
> suite. Fix this by setting the appropriate bits in mvfr1.FPHP to
> report ARMv8-A with FP support (but not ARMv8.2-FP16).
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e75a64a25a..ad164a773b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
>              t =3D FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>              cpu->isar.id_isar6 =3D t;
>
> +            t =3D cpu->isar.mvfr1;
> +            t =3D FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support =
*/
> +            cpu->isar.mvfr1 =3D t;
> +
>              t =3D cpu->isar.mvfr2;
>              t =3D FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
>              t =3D FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
> --
> 2.20.1



Applied to target-arm.next, thanks.

-- PMM


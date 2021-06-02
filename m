Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA6398873
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:37:13 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPBP-0008Fu-Kl
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loPAN-00075l-RV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:36:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loPAI-0002bC-5z
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:36:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id h8so1933714wrz.8
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CBKjB2xcpedHpGaJqlGe2j/jW6xHHiFdiu7QRPw+uvY=;
 b=Ad+SHNX1kKT4ukCzXUsxzDypDfz6xnhIYsGPEqMTUBzfu5SXpktxr25jNHOcCYe0wN
 sVInWYyVCuJzjCeqWDiY9zMw2AOIp8FuRB/s0uSOx6mymops4vFTRPuUvON/JruRnDwN
 IW6DgaxzIPENBu8MyM5dFlzU0WN22gPUaknDHuEHdAOUaW5yU559doEvwwVx3gb4IX/b
 sovJCkghugMIwk0gwcwY00q7Gt0Mm4JHMPfoYA6oidlW9bseK58qeAVry1kEACPXddEp
 mKlwRnFY66x/TAfzG7NMLdusjnxthMD89bIAUk8CkW04YN71j3NWoHxOd0edVZAUEE1m
 bq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CBKjB2xcpedHpGaJqlGe2j/jW6xHHiFdiu7QRPw+uvY=;
 b=W/YQCJN94/V2REkGCfy1g/WD67re7su+BoQAFZrDWAZiME0k1e5iH/N4azBJmkd6Tr
 biBAvRUbbjUHMPUTgTVrQBKRioagbiK5pyBJYIE9b7WMZ+L+IONflC7orEmzpRVEqAvD
 M/8U7pjcwy5/nXJ92Vu3asvwi312FMnMZkAst6mp3kgqVGOTEEBpI7QE+S7HkkPe7u5v
 JvGpfM4jS9xtSS/5QavZu60GQf6Wpn1x+ArkA7agU4HZ07Od76F06hL4eHIHOadhsKga
 NGOJeba8WSxjYiamFy+b6soK2A2IFD22y02yMenVy5cG8BRJCQaiWhgvgfhCaUELnQls
 qroQ==
X-Gm-Message-State: AOAM533ORRn4A5IdUSNXdGa7pvyLu6MHJTzZ+59kQUL/vX5Uarw6DyjX
 O1wNjHodoEZQDyCiu0kGlAbxdg==
X-Google-Smtp-Source: ABdhPJwHA+TJvRMLGfTad9wP0kXp4q0wbK7ip35RK3Ns3qgy9JgVz467yBA8nxNILlsAVlcVKLfWHg==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr21994070wrx.144.1622633760043; 
 Wed, 02 Jun 2021 04:36:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm7066055wru.56.2021.06.02.04.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:35:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27C7B1FF7E;
 Wed,  2 Jun 2021 12:35:58 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/28] softfloat: Move uint_to_float to
 softfloat-parts.c.inc
Date: Wed, 02 Jun 2021 12:31:51 +0100
In-reply-to: <20210525150706.294968-4-richard.henderson@linaro.org>
Message-ID: <8735u0bish.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_uint_to_float.
> Reimplement uint64_to_float128 with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c           | 83 ++++++++++++++++-----------------------
>  fpu/softfloat-parts.c.inc | 23 +++++++++++
>  2 files changed, 56 insertions(+), 50 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 6404a2997f..db14bd09aa 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -857,6 +857,14 @@ static void parts128_sint_to_float(FloatParts128 *p,=
 int64_t a,
>  #define parts_sint_to_float(P, I, Z, S) \
>      PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
>=20=20
> +static void parts64_uint_to_float(FloatParts64 *p, uint64_t a,
> +                                  int scale, float_status *s);
> +static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
> +                                   int scale, float_status *s);
> +
> +#define parts_uint_to_float(P, I, Z, S) \
> +    PARTS_GENERIC_64_128(uint_to_float, P)(P, I, Z, S)
> +
>  /*
>   * Helper functions for softfloat-parts.c.inc, per-size operations.
>   */
> @@ -3102,35 +3110,15 @@ float128 int32_to_float128(int32_t a, float_statu=
s *status)
>  }
>=20=20
>  /*
> - * Unsigned Integer to float conversions
> - *
> - * Returns the result of converting the unsigned integer `a' to the
> - * floating-point format. The conversion is performed according to the
> - * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> + * Unsigned Integer to floating-point conversions
>   */
>=20=20
> -static FloatParts64 uint_to_float(uint64_t a, int scale, float_status *s=
tatus)
> -{
> -    FloatParts64 r =3D { .sign =3D false };
> -    int shift;
> -
> -    if (a =3D=3D 0) {
> -        r.cls =3D float_class_zero;
> -    } else {
> -        scale =3D MIN(MAX(scale, -0x10000), 0x10000);

I realise this is translated to:

> +
> +/*
> + * Unsigned Integer to float conversions
> + *
> + * Returns the result of converting the unsigned integer `a' to the
> + * floating-point format. The conversion is performed according to the
> + * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> + */
> +static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
> +                                  int scale, float_status *status)
> +{
> +    memset(p, 0, sizeof(*p));
> +
> +    if (a =3D=3D 0) {
> +        p->cls =3D float_class_zero;
> +    } else {
> +        int shift =3D clz64(a);
> +        scale =3D MIN(MAX(scale, -0x10000), 0x10000);

here but it does seem weird to have an arbitrary limit here=20

> +        p->cls =3D float_class_normal;
> +        p->exp =3D DECOMPOSED_BINARY_POINT - shift + scale;

where it's really a limit on fmt->exp_max. Are we just limiting it to
something sane and relying on the eventual repack to detect and overflow
condition?

> +        p->frac_hi =3D a << shift;
> +    }
> +}

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


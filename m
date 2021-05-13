Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED337F5F5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:52:40 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8xM-00060Q-2m
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8u3-00039Q-SK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:49:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8u0-0003sX-5O
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:49:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id d11so26449493wrw.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+md7Vy1hkpVMfjxkYAU6a9eKM3x8ViDOVK8R6W7HJK8=;
 b=NrpMwqBpFvx1OYGCVhuVN9jiP2NVlMY77r0XNGcqarqU4Bp0dBOYt5OQKc/X6566HE
 gYvV927WFVSf+x5zrdw5riZcVX8Pqf5nfYrbnLIEeFxkoU2cod1TD1/0f7HdyehbCSnw
 rfz+vIQg9w0gHdIqqmR+VQqdCPbAYNqSvz4PrlNhdPF9iL1ER5wzBao6xBikF7iL7NQY
 Y/fTnMbFWC6Mn0DrXkUTcldGwKb8XIwSt3XbJJxJ2mm9hTuwk1BpIwK7dMZP5BAE63ya
 v7Quz+qMCqDr92qk7m4jFsinxVNl9X9efx8K7HTIVGu2hhhj8/QaOjpAvsaH3hXk2Nos
 e/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+md7Vy1hkpVMfjxkYAU6a9eKM3x8ViDOVK8R6W7HJK8=;
 b=P04I5kx0e56+4Dda/QrKt4kWHlMtTIWOCmHdO3GWm48Pajp3EdiGh9G/Obzzorxi1a
 dKC43zG3KWnSiWVh+h5br9UM1FYQtTQsS/bYdi6IscUv/8sBWnDkeTU/eeafIY9jeMOv
 bDwbD662K39JupJmpw1OBrWenXsOqK4yvYjuI43eTriokKHiAxMfQQvdaOaq3HP7L9yf
 CwsWpXP1mkNsjCfm58U3kP3LHhhreG9xg8AJqYE6+FfK7kDJ7WdPzqR0x5nD8RhKD0/e
 pTQ+d11KDLQq8L1NhMlDx9q3JN7fmNEVC2KGgCSbhOusoS8naQME7Cu9C6nKK+WVOWgJ
 55Gg==
X-Gm-Message-State: AOAM533h3tPMYuJBkDq6HO+RBt9fhQ8JzNvUkOt+CzfDKf9EuUsCN1Ym
 T3ZgsaNbIpCmhU3i7NZxF7koSQ==
X-Google-Smtp-Source: ABdhPJzHY+fu0S0Jr3waPC+Dz5yTVU0xtaTK6JDlf7YZRUErdXdAc4x12fR72csiwlWbUFKDitJ7Nw==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr50326290wrm.392.1620902949881; 
 Thu, 13 May 2021 03:49:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q13sm303545wrw.56.2021.05.13.03.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:49:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 307D91FF7E;
 Thu, 13 May 2021 11:49:08 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-40-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 39/72] softfloat: Use add192 in mul128To256
Date: Thu, 13 May 2021 11:49:01 +0100
In-reply-to: <20210508014802.892561-40-richard.henderson@linaro.org>
Message-ID: <87a6oyewnv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> We can perform the operation in 6 total adds instead of 8.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/fpu/softfloat-macros.h | 37 +++++++++++-----------------------
>  1 file changed, 12 insertions(+), 25 deletions(-)
>
> diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macro=
s.h
> index f6dfbe108d..76327d844d 100644
> --- a/include/fpu/softfloat-macros.h
> +++ b/include/fpu/softfloat-macros.h
> @@ -511,34 +511,21 @@ static inline void
>  | the locations pointed to by `z0Ptr', `z1Ptr', `z2Ptr', and `z3Ptr'.
>  *-----------------------------------------------------------------------=
-----*/
>=20=20
> -static inline void
> - mul128To256(
> -     uint64_t a0,
> -     uint64_t a1,
> -     uint64_t b0,
> -     uint64_t b1,
> -     uint64_t *z0Ptr,
> -     uint64_t *z1Ptr,
> -     uint64_t *z2Ptr,
> -     uint64_t *z3Ptr
> - )
> +static inline void mul128To256(uint64_t a0, uint64_t a1,
> +                               uint64_t b0, uint64_t b1,
> +                               uint64_t *z0Ptr, uint64_t *z1Ptr,
> +                               uint64_t *z2Ptr, uint64_t *z3Ptr)
>  {
> -    uint64_t z0, z1, z2, z3;
> -    uint64_t more1, more2;
> +    uint64_t z0, z1, z2;
> +    uint64_t m0, m1, m2, n1, n2;
>=20=20
> -    mul64To128( a1, b1, &z2, &z3 );
> -    mul64To128( a1, b0, &z1, &more2 );
> -    add128( z1, more2, 0, z2, &z1, &z2 );
> -    mul64To128( a0, b0, &z0, &more1 );
> -    add128( z0, more1, 0, z1, &z0, &z1 );
> -    mul64To128( a0, b1, &more1, &more2 );
> -    add128( more1, more2, 0, z2, &more1, &z2 );
> -    add128( z0, z1, 0, more1, &z0, &z1 );
> -    *z3Ptr =3D z3;
> -    *z2Ptr =3D z2;
> -    *z1Ptr =3D z1;
> -    *z0Ptr =3D z0;
> +    mul64To128(a1, b0, &m1, &m2);
> +    mul64To128(a0, b1, &n1, &n2);
> +    mul64To128(a1, b1, &z2, z3Ptr);
> +    mul64To128(a0, b0, &z0, &z1);
>=20=20
> +    add192( 0, m1, m2,  0, n1, n2, &m0, &m1, &m2);
> +    add192(m0, m1, m2, z0, z1, z2, z0Ptr, z1Ptr, z2Ptr);
>  }
>=20=20
>  /*----------------------------------------------------------------------=
------


--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D137F63E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:03:14 +0200 (CEST)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh97Z-0007fj-SL
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh956-00065D-Ft
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:00:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh94y-000258-QE
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:00:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id v12so26471273wrq.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HlgdAcspRyfIevAZ7cfgD18aAhrRDAKPoY+070NTuro=;
 b=hiG5mPA03WX6MiQMmoodC5aZeG5bOV5PEgchJWkYJFYu3tVcZfW5S8HiUkLfse/6Ic
 WDNYDVCf9qAL1ONtaFhvtTh1kUMWby358z52klL6s7DqkW5lp0Xs274pprP92AcLg4VG
 nfYb/6MCilfN79coyP+yMpQi6hRNDMjtTROxPiz8YQLjnydk6RvX5tYVdv15fVSWsJf9
 LxazyJ6Xx1SlC+WDXgjakfgV7X5v2c4PDTJBtkNwchaWmolCBIvZSkynRwCymgLOSyou
 Iz2S+jS3ccK9oFSKJsdpis3eAGfaEriMGQaPGr2k3hFTiBI9oQ+UzTkjzZzp/5s9U1AR
 7Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HlgdAcspRyfIevAZ7cfgD18aAhrRDAKPoY+070NTuro=;
 b=DGJzFbzf18L+PQpfh34G6gTvYGByAjCA1DCwqk/E6fZ5HNnrL/cx8Z3GXM6B2pIzaj
 RSmsvrS4uOAAR/VMoTv3SjF7Nyxpzva2KSe78UWV/EPycPMpG1G/dOITjMfneP7woseb
 qRnTri85KtDYIUbdlDTam9t65wvjlRfEj2yjl3EdbRpEqY4F04Mvz1EJGhdWkwd+Apie
 Pk+poXEGWAHVngaVsP73IChJ+ZbZFCVhzlzDmjvYtr48mY3O3jvfJl/BhI+DHjeA4Dta
 2vRZsDMix8YbkKtHP2P8nNTowQoyBx1oYC3lTVXvhLL35DHN3hoSFRSSUj7JIcXqdrHR
 e0LA==
X-Gm-Message-State: AOAM530MUJbjTiGg1oNLrqFVKkcLg6uyj659fUiTYRy4aZiaLN4pg+n1
 jmAV0q+N+prtlEMqhcU2Ut11aA==
X-Google-Smtp-Source: ABdhPJzjlAL5HtwVqPaxIomiBydl4kMUp2PiNKgATuWDeeFf8dPDDh3D0tefsAGd+NaPfhSfjmfTow==
X-Received: by 2002:adf:e404:: with SMTP id g4mr51128974wrm.240.1620903630699; 
 Thu, 13 May 2021 04:00:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm2503838wrq.78.2021.05.13.04.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:00:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39BE61FF7E;
 Thu, 13 May 2021 12:00:29 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-42-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 41/72] softfloat: Introduce sh[lr]_double primitives
Date: Thu, 13 May 2021 11:59:42 +0100
In-reply-to: <20210508014802.892561-42-richard.henderson@linaro.org>
Message-ID: <874kf6ew4y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Have x86_64 assembly for them, with a fallback.
> This avoids shuffling values through %cl in the x86 case.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-macros.h |  36 ++++++++++++
>  fpu/softfloat.c                | 102 +++++++++++++++++++++++++--------
>  2 files changed, 115 insertions(+), 23 deletions(-)
>
> diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macro=
s.h
> index 672c1db555..ec4e27a595 100644
> --- a/include/fpu/softfloat-macros.h
> +++ b/include/fpu/softfloat-macros.h
> @@ -85,6 +85,42 @@ this code that are retained.
>  #include "fpu/softfloat-types.h"
>  #include "qemu/host-utils.h"
>=20=20
> +/**
> + * shl_double: double-word merging left shift
> + * @l: left or most-significant word
> + * @r: right or least-significant word
> + * @c: shift count
> + *
> + * Shift @l left by @c bits, shifting in bits from @r.
> + */
> +static inline uint64_t shl_double(uint64_t l, uint64_t r, int c)
> +{
> +#if defined(__x86_64__)
> +    asm("shld %b2, %1, %0" : "+r"(l) : "r"(r), "ci"(c));
> +    return l;
> +#else
> +    return c ? (l << c) | (r >> (64 - c)) : l;
> +#endif
> +}
> +
> +/**
> + * shr_double: double-word merging right shift
> + * @l: left or most-significant word
> + * @r: right or least-significant word
> + * @c: shift count
> + *
> + * Shift @r right by @c bits, shifting in bits from @l.
> + */
> +static inline uint64_t shr_double(uint64_t l, uint64_t r, int c)
> +{
> +#if defined(__x86_64__)
> +    asm("shrd %b2, %1, %0" : "+r"(r) : "r"(l), "ci"(c));
> +    return r;
> +#else
> +    return c ? (r >> c) | (l << (64 - c)) : r;
> +#endif
> +}
> +

I was pondering if these deserve to live in bitops but given they are
softfloat only for the time being and we don't do arch specific hacks in
there:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


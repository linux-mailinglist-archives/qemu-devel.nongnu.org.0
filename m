Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337B6378241
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:32:36 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3DG-0006Lz-LT
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg3BV-0005cA-HV
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:30:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg3BT-0001ZE-Pm
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:30:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i128so8858106wma.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kjPEa6cVfIdPtndP8N5dDWsONc8vrJ2Q3mCSj+oJaTM=;
 b=VUpWg5HH5F4cw6bHXneuDx+/zwrRjZ5VHtGP/3108p1KIuQLXY3t4SPOowbiVLcc5D
 PuSBl7F8FsfBlx2pQmB5A+t+SPMcNNsgwFW8AZFWSdK4p3KvKkfNjlqcyyg6fsmvuH5y
 9wECjsQHrihV13o9Xej28n5IJq4FS12GO+efHOQj29oOyZ+ti+4Nfom94TvJ4vM2PYd7
 NilsHeGZE3KtSpAADTOPUNLnl0zvtIfglV52P1uKhtU4A7/9lLksZ/ok9Jvh/tpfxD7Z
 IxfN2shkje9ebFWwTP/grpKp/ta8l1SD3o8QCicKM9LNWTh1mUEy3pT5q2CZL9aXug+d
 RtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kjPEa6cVfIdPtndP8N5dDWsONc8vrJ2Q3mCSj+oJaTM=;
 b=kE1/MZEgnNcjZjFM12xoVcGxCFaTZKzivHJLU6fhNVruX+5DnL6JRqBzQsINxERIEX
 J2jzHAq/QYX2tlIOrJhowOR8b6BPG566UMQcFJsO8xpqFIWIQEem0p1ujqa6U4W9oQ54
 0j+0/Qt9G21Adsyp15OBrZqNmQjMfzTrJ1OMgldJTj+yvp1OJyiZXuE7aqAYJQFXgAcw
 lYz3pTosJWeBwrz/aASIple8Tm+oFKCZO1sq8Gv75ucN5sS6njVqPouymnBJOj8/9TD0
 3Dytxu8HVe3WIU2WzeygHjz7JPnr6ErY9c+SWDmUgVmT/k76tv5y9RcgI6SnVaOMUQ0e
 x+0g==
X-Gm-Message-State: AOAM530KzyoDTCTO2G+dRkvz1alPdsCa1NkvgOnexrAEGFT0JJx75EZf
 5cNKZTSetUVgw/48w1bF/4bBHg==
X-Google-Smtp-Source: ABdhPJyQOaXPX0M4P2X8A6AuIpVxFF4VB+fdXiLPFTR0gMFoDnNsJprrPWjgtCyLLiRjKtQTD3DDAA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr2418497wmi.61.1620642642355; 
 Mon, 10 May 2021 03:30:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l129sm20811wmf.32.2021.05.10.03.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 03:30:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F35041FF7E;
 Mon, 10 May 2021 11:30:40 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 02/72] qemu/host-utils: Add wrappers for overflow builtins
Date: Mon, 10 May 2021 11:22:02 +0100
In-reply-to: <20210508014802.892561-3-richard.henderson@linaro.org>
Message-ID: <87mtt2yj73.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

> These builtins came in with gcc 5 and clang 3.8, which are
> slightly newer than our supported minimum compiler versions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/host-utils.h | 225 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
>
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index f1e52851e0..fd76f0cbd3 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -356,6 +356,231 @@ static inline uint64_t revbit64(uint64_t x)
>  #endif
>  }
>=20=20
> +/**
> + * sadd32_overflow - addition with overflow indication
> + * @x, @y: addends
> + * @ret: Output for sum
> + *
> + * Computes *@ret =3D @x + @y, and returns true if and only if that
> + * value has been truncated.
> + */
> +static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
> +{
> +#if __has_builtin(__builtin_add_overflow) || __GNUC__ >=3D 5

I was wondering if having multiple compiler tests means we should move
this test into compiler.h but it doesn't seem we've done it in any other
case except libvixl's GCC_VERSION_OR_NEWER helper.

> +/**
> + * smul64_overflow - multiplication with overflow indication
> + * @x, @y: Input multipliers
> + * @ret: Output for product
> + *
> + * Computes *@ret =3D @x * @y, and returns true if and only if that
> + * value has been truncated.
> + */
> +static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
> +{
> +#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >=3D 5
> +    return __builtin_mul_overflow(x, y, ret);
> +#else
> +    uint64_t hi, lo;
> +    muls64(&lo, &hi, x, y);
> +    *ret =3D lo;
> +    return hi !=3D ((int64_t)lo >> 63);
> +#endif
> +}
> +
> +/**
> + * umul32_overflow - multiplication with overflow indication
> + * @x, @y: Input multipliers
> + * @ret: Output for product
> + *
> + * Computes *@ret =3D @x * @y, and returns true if and only if that
> + * value has been truncated.
> + */
> +static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
> +{
> +#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >=3D 5
> +    return __builtin_mul_overflow(x, y, ret);
> +#else
> +    uint64_t z =3D (uint64_t)x * y;
> +    *ret =3D z;
> +    return z > UINT32_MAX;
> +#endif
> +}
> +
> +/**
> + * smul64_overflow - multiplication with overflow indication

c&p error.

> + * @x, @y: Input multipliers
> + * @ret: Output for product
> + *
> + * Computes *@ret =3D @x * @y, and returns true if and only if that
> + * value has been truncated.
> + */
> +static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
> +{
> +#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >=3D 5
> +    return __builtin_mul_overflow(x, y, ret);
> +#else
> +    uint64_t hi;
> +    mulu64(ret, &hi, x, y);
> +    return hi !=3D 0;
> +#endif
> +}
> +
>  /* Host type specific sizes of these routines.  */
>=20=20
>  #if ULONG_MAX =3D=3D UINT32_MAX

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5194589F55
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:23:26 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdd7-0000MU-CF
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJdXr-0003ku-Ey
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:17:59 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJdXo-0007A8-Au
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:17:59 -0400
Received: by mail-lj1-x22c.google.com with SMTP id y23so335328ljh.12
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/kC3brX+KWDKBFNwHtRwIUMUfUfHCvGSwA8HznxW5EY=;
 b=bEWCQOoYE/y0VBEAxYsMY94eSHgVXcuIqv1DMxWuwydf1E43urWk8I6QETevV4gsTN
 5r0xmtdQrx882xe1dCpJTHEbUFB9bToPTXFfTZekJscjSsLvpSSLV3VZ4R7o+M3ZDY1R
 anQ3ihCEZwAqJqol38VV/460PE34Yy6ZISKVdw48qkXL0fNQ2QcnUfG+30PN6/N23Cnq
 DqPyLnO1GX84X0TNTDaonTfRLA3pj/s7RDmyPkPK8K27ldKbovdgCHj3iiAkhL5CKeZF
 rn8tq9cvSUXoBo6QOUtYgnxDvcbwDjnIc38riGUZ2yssXa7JXZ5hAZ//eRjC9BfKEujk
 rWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/kC3brX+KWDKBFNwHtRwIUMUfUfHCvGSwA8HznxW5EY=;
 b=zCeVpjkIXWOu9N2Sk/N0U034kjiQrTpx2FpxKOIEXicGfJFMviMJyuiAL9w/AvQfHj
 4MwA2mw5jGk1CGE2tJ6tkk3aimeSR4KojwyF2Lnf/PSqdYsyURgTLdrJZlUKjuqDp3Ix
 MtAV+uJh6+nrZA4OgBrlz3TBWc+Tuuuc5Vqp8ErhqDU+YupV3w72YueX2kiDgVFLXEAN
 aDF9jxTVnO0ri4E/ZJ+q32zcKFo9iY9oxds9qo3oTacaoueiTBGYKNsV8+5YhorqDp8Z
 VS1gIXyCF9rL+o31JPx/fMvjCLqiQ0lr7hSIfOH8FYFYw7e8VfaITYL990E3Cw/AJNMI
 06PQ==
X-Gm-Message-State: ACgBeo06Zok2fTmPTHp5eSLyUw9dxXXR+nuMe4adK+zl2s0r5dIBlJCY
 JFXXnB1YhJpjpZ44GJKoFoL/4QA0JVTwWrpHgT9xEbcMvJs=
X-Google-Smtp-Source: AA6agR4cRkfRW0vCTl82clnkel9pjvnnczkHtNC7orrk6DJw2uych0xC8enRbIOUpBKGt0LGumqhUTC12tCZLBUs3Pg=
X-Received: by 2002:a2e:b88a:0:b0:25d:aa7b:e6ec with SMTP id
 r10-20020a2eb88a000000b0025daa7be6ecmr768234ljp.67.1659629871799; Thu, 04 Aug
 2022 09:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-10-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 4 Aug 2022 20:17:40 +0400
Message-ID: <CAJ+F1C++5KSWioj9Tq=0phFkY1W7zpa-qyAmD1KsonRhA5Kycw@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] util: move 256-by-128 division helpers to int128
To: qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f7a33705e56cb0f1"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f7a33705e56cb0f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


On Tue, Jul 12, 2022 at 1:49 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Break a cyclic dependency between int128 and host-utils.
>

Anyone to approve that change? (This will allow us to more easily move
host-utils & int128 units to a subproject)
thanks


>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/host-utils.h |   3 -
>  include/qemu/int128.h     |   3 +
>  util/host-utils.c         | 180 --------------------------------------
>  util/int128.c             | 180 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 183 insertions(+), 183 deletions(-)
>
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index 29f3a9987880..fa228a4a86e2 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -32,7 +32,6 @@
>
>  #include "qemu/compiler.h"
>  #include "qemu/bswap.h"
> -#include "qemu/int128.h"
>
>  #ifdef CONFIG_INT128
>  static inline void mulu64(uint64_t *plow, uint64_t *phigh,
> @@ -785,6 +784,4 @@ static inline uint64_t udiv_qrnnd(uint64_t *r,
> uint64_t n1,
>  #endif
>  }
>
> -Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
> -Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
>  #endif
> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
> index d2b76ca6acdc..823c61edb0fd 100644
> --- a/include/qemu/int128.h
> +++ b/include/qemu/int128.h
> @@ -472,4 +472,7 @@ static inline void bswap128s(Int128 *s)
>  #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
>  #define INT128_MIN int128_make128(0, INT64_MIN)
>
> +Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
> +Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
> +
>  #endif /* INT128_H */
> diff --git a/util/host-utils.c b/util/host-utils.c
> index fb91bcba823d..96d5dc0bed25 100644
> --- a/util/host-utils.c
> +++ b/util/host-utils.c
> @@ -266,183 +266,3 @@ void ulshift(uint64_t *plow, uint64_t *phigh,
> int32_t shift, bool *overflow)
>          *plow =3D *plow << shift;
>      }
>  }
> -
> -/*
> - * Unsigned 256-by-128 division.
> - * Returns the remainder via r.
> - * Returns lower 128 bit of quotient.
> - * Needs a normalized divisor (most significant bit set to 1).
> - *
> - * Adapted from include/qemu/host-utils.h udiv_qrnnd,
> - * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
> - * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
> - *
> - * Licensed under the GPLv2/LGPLv3
> - */
> -static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
> -{
> -    Int128 d0, d1, q0, q1, r1, r0, m;
> -    uint64_t mp0, mp1;
> -
> -    d0 =3D int128_make64(int128_getlo(d));
> -    d1 =3D int128_make64(int128_gethi(d));
> -
> -    r1 =3D int128_remu(n1, d1);
> -    q1 =3D int128_divu(n1, d1);
> -    mp0 =3D int128_getlo(q1);
> -    mp1 =3D int128_gethi(q1);
> -    mulu128(&mp0, &mp1, int128_getlo(d0));
> -    m =3D int128_make128(mp0, mp1);
> -    r1 =3D int128_make128(int128_gethi(n0), int128_getlo(r1));
> -    if (int128_ult(r1, m)) {
> -        q1 =3D int128_sub(q1, int128_one());
> -        r1 =3D int128_add(r1, d);
> -        if (int128_uge(r1, d)) {
> -            if (int128_ult(r1, m)) {
> -                q1 =3D int128_sub(q1, int128_one());
> -                r1 =3D int128_add(r1, d);
> -            }
> -        }
> -    }
> -    r1 =3D int128_sub(r1, m);
> -
> -    r0 =3D int128_remu(r1, d1);
> -    q0 =3D int128_divu(r1, d1);
> -    mp0 =3D int128_getlo(q0);
> -    mp1 =3D int128_gethi(q0);
> -    mulu128(&mp0, &mp1, int128_getlo(d0));
> -    m =3D int128_make128(mp0, mp1);
> -    r0 =3D int128_make128(int128_getlo(n0), int128_getlo(r0));
> -    if (int128_ult(r0, m)) {
> -        q0 =3D int128_sub(q0, int128_one());
> -        r0 =3D int128_add(r0, d);
> -        if (int128_uge(r0, d)) {
> -            if (int128_ult(r0, m)) {
> -                q0 =3D int128_sub(q0, int128_one());
> -                r0 =3D int128_add(r0, d);
> -            }
> -        }
> -    }
> -    r0 =3D int128_sub(r0, m);
> -
> -    *r =3D r0;
> -    return int128_or(int128_lshift(q1, 64), q0);
> -}
> -
> -/*
> - * Unsigned 256-by-128 division.
> - * Returns the remainder.
> - * Returns quotient via plow and phigh.
> - * Also returns the remainder via the function return value.
> - */
> -Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
> -{
> -    Int128 dhi =3D *phigh;
> -    Int128 dlo =3D *plow;
> -    Int128 rem, dhighest;
> -    int sh;
> -
> -    if (!int128_nz(divisor) || !int128_nz(dhi)) {
> -        *plow  =3D int128_divu(dlo, divisor);
> -        *phigh =3D int128_zero();
> -        return int128_remu(dlo, divisor);
> -    } else {
> -        sh =3D clz128(divisor);
> -
> -        if (int128_ult(dhi, divisor)) {
> -            if (sh !=3D 0) {
> -                /* normalize the divisor, shifting the dividend
> accordingly */
> -                divisor =3D int128_lshift(divisor, sh);
> -                dhi =3D int128_or(int128_lshift(dhi, sh),
> -                                int128_urshift(dlo, (128 - sh)));
> -                dlo =3D int128_lshift(dlo, sh);
> -            }
> -
> -            *phigh =3D int128_zero();
> -            *plow =3D udiv256_qrnnd(&rem, dhi, dlo, divisor);
> -        } else {
> -            if (sh !=3D 0) {
> -                /* normalize the divisor, shifting the dividend
> accordingly */
> -                divisor =3D int128_lshift(divisor, sh);
> -                dhighest =3D int128_rshift(dhi, (128 - sh));
> -                dhi =3D int128_or(int128_lshift(dhi, sh),
> -                                int128_urshift(dlo, (128 - sh)));
> -                dlo =3D int128_lshift(dlo, sh);
> -
> -                *phigh =3D udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
> -            } else {
> -                /*
> -                 * dhi >=3D divisor
> -                 * Since the MSB of divisor is set (sh =3D=3D 0),
> -                 * (dhi - divisor) < divisor
> -                 *
> -                 * Thus, the high part of the quotient is 1, and we can
> -                 * calculate the low part with a single call to udiv_qrn=
nd
> -                 * after subtracting divisor from dhi
> -                 */
> -                dhi =3D int128_sub(dhi, divisor);
> -                *phigh =3D int128_one();
> -            }
> -
> -            *plow =3D udiv256_qrnnd(&rem, dhi, dlo, divisor);
> -        }
> -
> -        /*
> -         * since the dividend/divisor might have been normalized,
> -         * the remainder might also have to be shifted back
> -         */
> -        rem =3D int128_urshift(rem, sh);
> -        return rem;
> -    }
> -}
> -
> -/*
> - * Signed 256-by-128 division.
> - * Returns quotient via plow and phigh.
> - * Also returns the remainder via the function return value.
> - */
> -Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
> -{
> -    bool neg_quotient =3D false, neg_remainder =3D false;
> -    Int128 unsig_hi =3D *phigh, unsig_lo =3D *plow;
> -    Int128 rem;
> -
> -    if (!int128_nonneg(*phigh)) {
> -        neg_quotient =3D !neg_quotient;
> -        neg_remainder =3D !neg_remainder;
> -
> -        if (!int128_nz(unsig_lo)) {
> -            unsig_hi =3D int128_neg(unsig_hi);
> -        } else {
> -            unsig_hi =3D int128_not(unsig_hi);
> -            unsig_lo =3D int128_neg(unsig_lo);
> -        }
> -    }
> -
> -    if (!int128_nonneg(divisor)) {
> -        neg_quotient =3D !neg_quotient;
> -
> -        divisor =3D int128_neg(divisor);
> -    }
> -
> -    rem =3D divu256(&unsig_lo, &unsig_hi, divisor);
> -
> -    if (neg_quotient) {
> -        if (!int128_nz(unsig_lo)) {
> -            *phigh =3D int128_neg(unsig_hi);
> -            *plow =3D int128_zero();
> -        } else {
> -            *phigh =3D int128_not(unsig_hi);
> -            *plow =3D int128_neg(unsig_lo);
> -        }
> -    } else {
> -        *phigh =3D unsig_hi;
> -        *plow =3D unsig_lo;
> -    }
> -
> -    if (neg_remainder) {
> -        return int128_neg(rem);
> -    } else {
> -        return rem;
> -    }
> -}
> diff --git a/util/int128.c b/util/int128.c
> index ed8f25fef161..482c63b6551e 100644
> --- a/util/int128.c
> +++ b/util/int128.c
> @@ -145,3 +145,183 @@ Int128 int128_rems(Int128 a, Int128 b)
>  }
>
>  #endif
> +
> +/*
> + * Unsigned 256-by-128 division.
> + * Returns the remainder via r.
> + * Returns lower 128 bit of quotient.
> + * Needs a normalized divisor (most significant bit set to 1).
> + *
> + * Adapted from include/qemu/host-utils.h udiv_qrnnd,
> + * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
> + * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
> + *
> + * Licensed under the GPLv2/LGPLv3
> + */
> +static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
> +{
> +    Int128 d0, d1, q0, q1, r1, r0, m;
> +    uint64_t mp0, mp1;
> +
> +    d0 =3D int128_make64(int128_getlo(d));
> +    d1 =3D int128_make64(int128_gethi(d));
> +
> +    r1 =3D int128_remu(n1, d1);
> +    q1 =3D int128_divu(n1, d1);
> +    mp0 =3D int128_getlo(q1);
> +    mp1 =3D int128_gethi(q1);
> +    mulu128(&mp0, &mp1, int128_getlo(d0));
> +    m =3D int128_make128(mp0, mp1);
> +    r1 =3D int128_make128(int128_gethi(n0), int128_getlo(r1));
> +    if (int128_ult(r1, m)) {
> +        q1 =3D int128_sub(q1, int128_one());
> +        r1 =3D int128_add(r1, d);
> +        if (int128_uge(r1, d)) {
> +            if (int128_ult(r1, m)) {
> +                q1 =3D int128_sub(q1, int128_one());
> +                r1 =3D int128_add(r1, d);
> +            }
> +        }
> +    }
> +    r1 =3D int128_sub(r1, m);
> +
> +    r0 =3D int128_remu(r1, d1);
> +    q0 =3D int128_divu(r1, d1);
> +    mp0 =3D int128_getlo(q0);
> +    mp1 =3D int128_gethi(q0);
> +    mulu128(&mp0, &mp1, int128_getlo(d0));
> +    m =3D int128_make128(mp0, mp1);
> +    r0 =3D int128_make128(int128_getlo(n0), int128_getlo(r0));
> +    if (int128_ult(r0, m)) {
> +        q0 =3D int128_sub(q0, int128_one());
> +        r0 =3D int128_add(r0, d);
> +        if (int128_uge(r0, d)) {
> +            if (int128_ult(r0, m)) {
> +                q0 =3D int128_sub(q0, int128_one());
> +                r0 =3D int128_add(r0, d);
> +            }
> +        }
> +    }
> +    r0 =3D int128_sub(r0, m);
> +
> +    *r =3D r0;
> +    return int128_or(int128_lshift(q1, 64), q0);
> +}
> +
> +/*
> + * Unsigned 256-by-128 division.
> + * Returns the remainder.
> + * Returns quotient via plow and phigh.
> + * Also returns the remainder via the function return value.
> + */
> +Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
> +{
> +    Int128 dhi =3D *phigh;
> +    Int128 dlo =3D *plow;
> +    Int128 rem, dhighest;
> +    int sh;
> +
> +    if (!int128_nz(divisor) || !int128_nz(dhi)) {
> +        *plow  =3D int128_divu(dlo, divisor);
> +        *phigh =3D int128_zero();
> +        return int128_remu(dlo, divisor);
> +    } else {
> +        sh =3D clz128(divisor);
> +
> +        if (int128_ult(dhi, divisor)) {
> +            if (sh !=3D 0) {
> +                /* normalize the divisor, shifting the dividend
> accordingly */
> +                divisor =3D int128_lshift(divisor, sh);
> +                dhi =3D int128_or(int128_lshift(dhi, sh),
> +                                int128_urshift(dlo, (128 - sh)));
> +                dlo =3D int128_lshift(dlo, sh);
> +            }
> +
> +            *phigh =3D int128_zero();
> +            *plow =3D udiv256_qrnnd(&rem, dhi, dlo, divisor);
> +        } else {
> +            if (sh !=3D 0) {
> +                /* normalize the divisor, shifting the dividend
> accordingly */
> +                divisor =3D int128_lshift(divisor, sh);
> +                dhighest =3D int128_rshift(dhi, (128 - sh));
> +                dhi =3D int128_or(int128_lshift(dhi, sh),
> +                                int128_urshift(dlo, (128 - sh)));
> +                dlo =3D int128_lshift(dlo, sh);
> +
> +                *phigh =3D udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
> +            } else {
> +                /*
> +                 * dhi >=3D divisor
> +                 * Since the MSB of divisor is set (sh =3D=3D 0),
> +                 * (dhi - divisor) < divisor
> +                 *
> +                 * Thus, the high part of the quotient is 1, and we can
> +                 * calculate the low part with a single call to udiv_qrn=
nd
> +                 * after subtracting divisor from dhi
> +                 */
> +                dhi =3D int128_sub(dhi, divisor);
> +                *phigh =3D int128_one();
> +            }
> +
> +            *plow =3D udiv256_qrnnd(&rem, dhi, dlo, divisor);
> +        }
> +
> +        /*
> +         * since the dividend/divisor might have been normalized,
> +         * the remainder might also have to be shifted back
> +         */
> +        rem =3D int128_urshift(rem, sh);
> +        return rem;
> +    }
> +}
> +
> +/*
> + * Signed 256-by-128 division.
> + * Returns quotient via plow and phigh.
> + * Also returns the remainder via the function return value.
> + */
> +Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
> +{
> +    bool neg_quotient =3D false, neg_remainder =3D false;
> +    Int128 unsig_hi =3D *phigh, unsig_lo =3D *plow;
> +    Int128 rem;
> +
> +    if (!int128_nonneg(*phigh)) {
> +        neg_quotient =3D !neg_quotient;
> +        neg_remainder =3D !neg_remainder;
> +
> +        if (!int128_nz(unsig_lo)) {
> +            unsig_hi =3D int128_neg(unsig_hi);
> +        } else {
> +            unsig_hi =3D int128_not(unsig_hi);
> +            unsig_lo =3D int128_neg(unsig_lo);
> +        }
> +    }
> +
> +    if (!int128_nonneg(divisor)) {
> +        neg_quotient =3D !neg_quotient;
> +
> +        divisor =3D int128_neg(divisor);
> +    }
> +
> +    rem =3D divu256(&unsig_lo, &unsig_hi, divisor);
> +
> +    if (neg_quotient) {
> +        if (!int128_nz(unsig_lo)) {
> +            *phigh =3D int128_neg(unsig_hi);
> +            *plow =3D int128_zero();
> +        } else {
> +            *phigh =3D int128_not(unsig_hi);
> +            *plow =3D int128_neg(unsig_lo);
> +        }
> +    } else {
> +        *phigh =3D unsig_hi;
> +        *plow =3D unsig_lo;
> +    }
> +
> +    if (neg_remainder) {
> +        return int128_neg(rem);
> +    } else {
> +        return rem;
> +    }
> +}
> --
> 2.37.0.rc0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f7a33705e56cb0f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 1:49 PM &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Break a cyclic dependency between int128 and host-utils.<br></blockquote><d=
iv><br></div><div>Anyone to approve that change? (This will allow us to mor=
e easily move host-utils &amp; int128 units to a subproject)<br></div><div>=
thanks</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/host-utils.h |=C2=A0 =C2=A03 -<br>
=C2=A0include/qemu/int128.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0util/host-utils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 180 ------------=
--------------------------<br>
=C2=A0util/int128.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 180 ++=
++++++++++++++++++++++++++++++++++++<br>
=C2=A04 files changed, 183 insertions(+), 183 deletions(-)<br>
<br>
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h<br>
index 29f3a9987880..fa228a4a86e2 100644<br>
--- a/include/qemu/host-utils.h<br>
+++ b/include/qemu/host-utils.h<br>
@@ -32,7 +32,6 @@<br>
<br>
=C2=A0#include &quot;qemu/compiler.h&quot;<br>
=C2=A0#include &quot;qemu/bswap.h&quot;<br>
-#include &quot;qemu/int128.h&quot;<br>
<br>
=C2=A0#ifdef CONFIG_INT128<br>
=C2=A0static inline void mulu64(uint64_t *plow, uint64_t *phigh,<br>
@@ -785,6 +784,4 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t=
 n1,<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
-Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);<br>
-Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);<br>
=C2=A0#endif<br>
diff --git a/include/qemu/int128.h b/include/qemu/int128.h<br>
index d2b76ca6acdc..823c61edb0fd 100644<br>
--- a/include/qemu/int128.h<br>
+++ b/include/qemu/int128.h<br>
@@ -472,4 +472,7 @@ static inline void bswap128s(Int128 *s)<br>
=C2=A0#define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)<br>
=C2=A0#define INT128_MIN int128_make128(0, INT64_MIN)<br>
<br>
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);<br>
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);<br>
+<br>
=C2=A0#endif /* INT128_H */<br>
diff --git a/util/host-utils.c b/util/host-utils.c<br>
index fb91bcba823d..96d5dc0bed25 100644<br>
--- a/util/host-utils.c<br>
+++ b/util/host-utils.c<br>
@@ -266,183 +266,3 @@ void ulshift(uint64_t *plow, uint64_t *phigh, int32_t=
 shift, bool *overflow)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*plow =3D *plow &lt;&lt; shift;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-<br>
-/*<br>
- * Unsigned 256-by-128 division.<br>
- * Returns the remainder via r.<br>
- * Returns lower 128 bit of quotient.<br>
- * Needs a normalized divisor (most significant bit set to 1).<br>
- *<br>
- * Adapted from include/qemu/host-utils.h udiv_qrnnd,<br>
- * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd<br>
- * (<a href=3D"https://gmplib.org/repo/gmp/file/tip/longlong.h" rel=3D"nor=
eferrer" target=3D"_blank">https://gmplib.org/repo/gmp/file/tip/longlong.h<=
/a>)<br>
- *<br>
- * Licensed under the GPLv2/LGPLv3<br>
- */<br>
-static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)<br>
-{<br>
-=C2=A0 =C2=A0 Int128 d0, d1, q0, q1, r1, r0, m;<br>
-=C2=A0 =C2=A0 uint64_t mp0, mp1;<br>
-<br>
-=C2=A0 =C2=A0 d0 =3D int128_make64(int128_getlo(d));<br>
-=C2=A0 =C2=A0 d1 =3D int128_make64(int128_gethi(d));<br>
-<br>
-=C2=A0 =C2=A0 r1 =3D int128_remu(n1, d1);<br>
-=C2=A0 =C2=A0 q1 =3D int128_divu(n1, d1);<br>
-=C2=A0 =C2=A0 mp0 =3D int128_getlo(q1);<br>
-=C2=A0 =C2=A0 mp1 =3D int128_gethi(q1);<br>
-=C2=A0 =C2=A0 mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));<br>
-=C2=A0 =C2=A0 m =3D int128_make128(mp0, mp1);<br>
-=C2=A0 =C2=A0 r1 =3D int128_make128(int128_gethi(n0), int128_getlo(r1));<b=
r>
-=C2=A0 =C2=A0 if (int128_ult(r1, m)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q1 =3D int128_sub(q1, int128_one());<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D int128_add(r1, d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_uge(r1, d)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_ult(r1, m)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q1 =3D int128_sub(=
q1, int128_one());<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D int128_add(=
r1, d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 r1 =3D int128_sub(r1, m);<br>
-<br>
-=C2=A0 =C2=A0 r0 =3D int128_remu(r1, d1);<br>
-=C2=A0 =C2=A0 q0 =3D int128_divu(r1, d1);<br>
-=C2=A0 =C2=A0 mp0 =3D int128_getlo(q0);<br>
-=C2=A0 =C2=A0 mp1 =3D int128_gethi(q0);<br>
-=C2=A0 =C2=A0 mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));<br>
-=C2=A0 =C2=A0 m =3D int128_make128(mp0, mp1);<br>
-=C2=A0 =C2=A0 r0 =3D int128_make128(int128_getlo(n0), int128_getlo(r0));<b=
r>
-=C2=A0 =C2=A0 if (int128_ult(r0, m)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q0 =3D int128_sub(q0, int128_one());<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0 =3D int128_add(r0, d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_uge(r0, d)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_ult(r0, m)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q0 =3D int128_sub(=
q0, int128_one());<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r0 =3D int128_add(=
r0, d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 r0 =3D int128_sub(r0, m);<br>
-<br>
-=C2=A0 =C2=A0 *r =3D r0;<br>
-=C2=A0 =C2=A0 return int128_or(int128_lshift(q1, 64), q0);<br>
-}<br>
-<br>
-/*<br>
- * Unsigned 256-by-128 division.<br>
- * Returns the remainder.<br>
- * Returns quotient via plow and phigh.<br>
- * Also returns the remainder via the function return value.<br>
- */<br>
-Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)<br>
-{<br>
-=C2=A0 =C2=A0 Int128 dhi =3D *phigh;<br>
-=C2=A0 =C2=A0 Int128 dlo =3D *plow;<br>
-=C2=A0 =C2=A0 Int128 rem, dhighest;<br>
-=C2=A0 =C2=A0 int sh;<br>
-<br>
-=C2=A0 =C2=A0 if (!int128_nz(divisor) || !int128_nz(dhi)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow=C2=A0 =3D int128_divu(dlo, divisor);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_zero();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return int128_remu(dlo, divisor);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh =3D clz128(divisor);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_ult(dhi, divisor)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sh !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* normalize the d=
ivisor, shifting the dividend accordingly */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 divisor =3D int128=
_lshift(divisor, sh);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhi =3D int128_or(=
int128_lshift(dhi, sh),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_urshift(dlo, (128 - sh)));<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlo =3D int128_lsh=
ift(dlo, sh);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_zero();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D udiv256_qrnnd(&amp;rem=
, dhi, dlo, divisor);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sh !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* normalize the d=
ivisor, shifting the dividend accordingly */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 divisor =3D int128=
_lshift(divisor, sh);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhighest =3D int12=
8_rshift(dhi, (128 - sh));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhi =3D int128_or(=
int128_lshift(dhi, sh),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_urshift(dlo, (128 - sh)));<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlo =3D int128_lsh=
ift(dlo, sh);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D udiv256=
_qrnnd(&amp;dhi, dhighest, dhi, divisor);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* dhi &gt;=
=3D divisor<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since the =
MSB of divisor is set (sh =3D=3D 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (dhi - div=
isor) &lt; divisor<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Thus, the =
high part of the quotient is 1, and we can<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* calculate =
the low part with a single call to udiv_qrnnd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after subt=
racting divisor from dhi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhi =3D int128_sub=
(dhi, divisor);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_=
one();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D udiv256_qrnnd(&amp;rem=
, dhi, dlo, divisor);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since the dividend/divisor might have =
been normalized,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the remainder might also have to be sh=
ifted back<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rem =3D int128_urshift(rem, sh);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rem;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-/*<br>
- * Signed 256-by-128 division.<br>
- * Returns quotient via plow and phigh.<br>
- * Also returns the remainder via the function return value.<br>
- */<br>
-Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)<br>
-{<br>
-=C2=A0 =C2=A0 bool neg_quotient =3D false, neg_remainder =3D false;<br>
-=C2=A0 =C2=A0 Int128 unsig_hi =3D *phigh, unsig_lo =3D *plow;<br>
-=C2=A0 =C2=A0 Int128 rem;<br>
-<br>
-=C2=A0 =C2=A0 if (!int128_nonneg(*phigh)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg_quotient =3D !neg_quotient;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg_remainder =3D !neg_remainder;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!int128_nz(unsig_lo)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig_hi =3D int128_neg(unsig_hi=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig_hi =3D int128_not(unsig_hi=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig_lo =3D int128_neg(unsig_lo=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (!int128_nonneg(divisor)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg_quotient =3D !neg_quotient;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 divisor =3D int128_neg(divisor);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 rem =3D divu256(&amp;unsig_lo, &amp;unsig_hi, divisor);<br>
-<br>
-=C2=A0 =C2=A0 if (neg_quotient) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!int128_nz(unsig_lo)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_neg(unsig_hi);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D int128_zero();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_not(unsig_hi);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D int128_neg(unsig_lo);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D unsig_hi;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D unsig_lo;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (neg_remainder) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return int128_neg(rem);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rem;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
diff --git a/util/int128.c b/util/int128.c<br>
index ed8f25fef161..482c63b6551e 100644<br>
--- a/util/int128.c<br>
+++ b/util/int128.c<br>
@@ -145,3 +145,183 @@ Int128 int128_rems(Int128 a, Int128 b)<br>
=C2=A0}<br>
<br>
=C2=A0#endif<br>
+<br>
+/*<br>
+ * Unsigned 256-by-128 division.<br>
+ * Returns the remainder via r.<br>
+ * Returns lower 128 bit of quotient.<br>
+ * Needs a normalized divisor (most significant bit set to 1).<br>
+ *<br>
+ * Adapted from include/qemu/host-utils.h udiv_qrnnd,<br>
+ * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd<br>
+ * (<a href=3D"https://gmplib.org/repo/gmp/file/tip/longlong.h" rel=3D"nor=
eferrer" target=3D"_blank">https://gmplib.org/repo/gmp/file/tip/longlong.h<=
/a>)<br>
+ *<br>
+ * Licensed under the GPLv2/LGPLv3<br>
+ */<br>
+static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)<br>
+{<br>
+=C2=A0 =C2=A0 Int128 d0, d1, q0, q1, r1, r0, m;<br>
+=C2=A0 =C2=A0 uint64_t mp0, mp1;<br>
+<br>
+=C2=A0 =C2=A0 d0 =3D int128_make64(int128_getlo(d));<br>
+=C2=A0 =C2=A0 d1 =3D int128_make64(int128_gethi(d));<br>
+<br>
+=C2=A0 =C2=A0 r1 =3D int128_remu(n1, d1);<br>
+=C2=A0 =C2=A0 q1 =3D int128_divu(n1, d1);<br>
+=C2=A0 =C2=A0 mp0 =3D int128_getlo(q1);<br>
+=C2=A0 =C2=A0 mp1 =3D int128_gethi(q1);<br>
+=C2=A0 =C2=A0 mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));<br>
+=C2=A0 =C2=A0 m =3D int128_make128(mp0, mp1);<br>
+=C2=A0 =C2=A0 r1 =3D int128_make128(int128_gethi(n0), int128_getlo(r1));<b=
r>
+=C2=A0 =C2=A0 if (int128_ult(r1, m)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 q1 =3D int128_sub(q1, int128_one());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D int128_add(r1, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_uge(r1, d)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_ult(r1, m)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q1 =3D int128_sub(=
q1, int128_one());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D int128_add(=
r1, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 r1 =3D int128_sub(r1, m);<br>
+<br>
+=C2=A0 =C2=A0 r0 =3D int128_remu(r1, d1);<br>
+=C2=A0 =C2=A0 q0 =3D int128_divu(r1, d1);<br>
+=C2=A0 =C2=A0 mp0 =3D int128_getlo(q0);<br>
+=C2=A0 =C2=A0 mp1 =3D int128_gethi(q0);<br>
+=C2=A0 =C2=A0 mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));<br>
+=C2=A0 =C2=A0 m =3D int128_make128(mp0, mp1);<br>
+=C2=A0 =C2=A0 r0 =3D int128_make128(int128_getlo(n0), int128_getlo(r0));<b=
r>
+=C2=A0 =C2=A0 if (int128_ult(r0, m)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 q0 =3D int128_sub(q0, int128_one());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0 =3D int128_add(r0, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_uge(r0, d)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_ult(r0, m)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q0 =3D int128_sub(=
q0, int128_one());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r0 =3D int128_add(=
r0, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 r0 =3D int128_sub(r0, m);<br>
+<br>
+=C2=A0 =C2=A0 *r =3D r0;<br>
+=C2=A0 =C2=A0 return int128_or(int128_lshift(q1, 64), q0);<br>
+}<br>
+<br>
+/*<br>
+ * Unsigned 256-by-128 division.<br>
+ * Returns the remainder.<br>
+ * Returns quotient via plow and phigh.<br>
+ * Also returns the remainder via the function return value.<br>
+ */<br>
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)<br>
+{<br>
+=C2=A0 =C2=A0 Int128 dhi =3D *phigh;<br>
+=C2=A0 =C2=A0 Int128 dlo =3D *plow;<br>
+=C2=A0 =C2=A0 Int128 rem, dhighest;<br>
+=C2=A0 =C2=A0 int sh;<br>
+<br>
+=C2=A0 =C2=A0 if (!int128_nz(divisor) || !int128_nz(dhi)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow=C2=A0 =3D int128_divu(dlo, divisor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_zero();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return int128_remu(dlo, divisor);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh =3D clz128(divisor);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int128_ult(dhi, divisor)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sh !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* normalize the d=
ivisor, shifting the dividend accordingly */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 divisor =3D int128=
_lshift(divisor, sh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhi =3D int128_or(=
int128_lshift(dhi, sh),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_urshift(dlo, (128 - sh)));<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlo =3D int128_lsh=
ift(dlo, sh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_zero();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D udiv256_qrnnd(&amp;rem=
, dhi, dlo, divisor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sh !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* normalize the d=
ivisor, shifting the dividend accordingly */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 divisor =3D int128=
_lshift(divisor, sh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhighest =3D int12=
8_rshift(dhi, (128 - sh));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhi =3D int128_or(=
int128_lshift(dhi, sh),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_urshift(dlo, (128 - sh)));<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlo =3D int128_lsh=
ift(dlo, sh);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D udiv256=
_qrnnd(&amp;dhi, dhighest, dhi, divisor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* dhi &gt;=
=3D divisor<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since the =
MSB of divisor is set (sh =3D=3D 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (dhi - div=
isor) &lt; divisor<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Thus, the =
high part of the quotient is 1, and we can<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* calculate =
the low part with a single call to udiv_qrnnd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after subt=
racting divisor from dhi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dhi =3D int128_sub=
(dhi, divisor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_=
one();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D udiv256_qrnnd(&amp;rem=
, dhi, dlo, divisor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since the dividend/divisor might have =
been normalized,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the remainder might also have to be sh=
ifted back<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rem =3D int128_urshift(rem, sh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rem;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/*<br>
+ * Signed 256-by-128 division.<br>
+ * Returns quotient via plow and phigh.<br>
+ * Also returns the remainder via the function return value.<br>
+ */<br>
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)<br>
+{<br>
+=C2=A0 =C2=A0 bool neg_quotient =3D false, neg_remainder =3D false;<br>
+=C2=A0 =C2=A0 Int128 unsig_hi =3D *phigh, unsig_lo =3D *plow;<br>
+=C2=A0 =C2=A0 Int128 rem;<br>
+<br>
+=C2=A0 =C2=A0 if (!int128_nonneg(*phigh)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg_quotient =3D !neg_quotient;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg_remainder =3D !neg_remainder;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!int128_nz(unsig_lo)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig_hi =3D int128_neg(unsig_hi=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig_hi =3D int128_not(unsig_hi=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig_lo =3D int128_neg(unsig_lo=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!int128_nonneg(divisor)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg_quotient =3D !neg_quotient;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 divisor =3D int128_neg(divisor);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 rem =3D divu256(&amp;unsig_lo, &amp;unsig_hi, divisor);<br>
+<br>
+=C2=A0 =C2=A0 if (neg_quotient) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!int128_nz(unsig_lo)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_neg(unsig_hi);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D int128_zero();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D int128_not(unsig_hi);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D int128_neg(unsig_lo);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *phigh =3D unsig_hi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *plow =3D unsig_lo;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (neg_remainder) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return int128_neg(rem);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rem;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
-- <br>
2.37.0.rc0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f7a33705e56cb0f1--


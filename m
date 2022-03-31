Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A90A4ED7F0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:49:16 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsMd-0003fP-Du
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:49:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZsKH-0001HY-Ew
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:46:49 -0400
Received: from [2607:f8b0:4864:20::b36] (port=43919
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZsKF-00056S-Gb
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:46:48 -0400
Received: by mail-yb1-xb36.google.com with SMTP id v35so41565036ybi.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tTB5Z9R8V/KIfI1mfAGG8QqH1ON7VXaJ24NEcrdFJSs=;
 b=CWmnlj4zGz46N7wM5m8CaBDzbL1wHzj4DMuQQVK3iOJdPLfztu3qozg7O6Mgxu5hu3
 A+gxUhASykifqKM1e/O8UeXy6df7BB8DcXe0y3CKuQbb1AEMgheD3oRwA6P+Lve0bDhY
 WEUQPHAiUO13dNKbMPxQkwIiqT6J4UkcTveQtp2ZdhNTZ0+rGGTQXJ3oMbjUG4DtI5K3
 rRkynMOxuFCVEcT+wgdwRb/Egmw3pRrlUPLgPxdfXof/TdpJC3XkYor+lyUErFI7EPkJ
 i2SkF9tGcS4CULJM7LNq4hfPym1repIE8vKMp1ejJiE4aZ3VIbpXnVD+irXggmuXUMXn
 29Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tTB5Z9R8V/KIfI1mfAGG8QqH1ON7VXaJ24NEcrdFJSs=;
 b=7nF5PpZxVhsOSdeZQ/JKd1ps0MSojk/+Nf5lJsdS+iXgOSYB+FXVjEwaPoOPnSZCeZ
 iEK2dAgpWGa1nHR+qO7ZxB10kZ2U74VIUXOO6bsZ2dsR+X1p2iHrJvdHOPwg0l+74OfM
 OraUu2Mhau2OVwDBP8KGOEnqEDwNdzmUrHRng9kviwB4Dsu/Hj98eyT39gWAqjmyqdI/
 lklmx1cb/a5UKMZIZ8/bkVXes7ybDAtmLg/m0xUw7Z4wXrWPHKSG51l6SUSgxZY/dTV/
 exFziluspigNCsO8zsuCZScqzG0k7zZiaYkJux6K8uqz10yCgBlpP0IuAEgCCIu8PiQZ
 tL4g==
X-Gm-Message-State: AOAM532OZgfQ8sZX5L4YDjhgGgpCmyh0GmABmQR3ccq5x8yHp9HtWzdE
 /kAWf654OsYPft4ysRqqw6Pg+8OtmNjoahv6qbhAuA==
X-Google-Smtp-Source: ABdhPJyMdXo0FBxe6hljhnVbSYg65GxhdmysTHgBDvM0Ian5gUFl7D+qqvFBafw6U3RkXexUPL4q/y8nS4uZlnT/uFA=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr280713ybu.140.1648723606449; Thu, 31 Mar
 2022 03:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210603214131.629841-1-richard.henderson@linaro.org>
 <20210603214131.629841-7-richard.henderson@linaro.org>
In-Reply-To: <20210603214131.629841-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 11:46:35 +0100
Message-ID: <CAFEAcA9tV_3VMwgAgN4BKc1GW9w59kwHB-xFhn1pi4pBH2YxrQ@mail.gmail.com>
Subject: Re: [PULL 06/29] softfloat: Move compare_floats to
 softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 22:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to parts$N_compare.  Rename all of the intermediate
> functions to ftype_do_compare.  Rename the hard-float functions
> to ftype_hs_compare.  Convert float128 to FloatParts128.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I was wading through some of this code trying to figure out
whether some of Coverity's new issues are false positives, and
noticed something odd about this old commit:

> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 4fee5a6cb7..6f1bbbe6cf 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -882,6 +882,14 @@ static FloatParts128 *parts128_minmax(FloatParts128 =
*a, FloatParts128 *b,
>  #define parts_minmax(A, B, S, F) \
>      PARTS_GENERIC_64_128(minmax, A)(A, B, S, F)
>
> +static int parts64_compare(FloatParts64 *a, FloatParts64 *b,
> +                           float_status *s, bool q);
> +static int parts128_compare(FloatParts128 *a, FloatParts128 *b,
> +                            float_status *s, bool q);

Here we define these two functions as returning "int"...

> +static FloatRelation QEMU_FLATTEN
> +float16_do_compare(float16 a, float16 b, float_status *s, bool is_quiet)
>  {


> +    float16_unpack_canonical(&pa, a, s);
> +    float16_unpack_canonical(&pb, b, s);
> +    return parts_compare(&pa, &pb, s, is_quiet);
>  }

...but here we use the return value directly in a function
that returns a FloatRelation...

> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index b9094768db..3dacb5b4f0 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -1018,3 +1018,60 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a,=
 FloatPartsN *b,
>      }
>      return cmp < 0 ? b : a;
>  }
> +
> +/*
> + * Floating point compare
> + */
> +static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
> +                                     float_status *s, bool is_quiet)
> +{

...and unless I'm getting confused by the macro usage here,
the actual definition of the functions returns a FloatRelation.
(I'm not sure why the compiler doesn't complain about the mismatch.)

> +    int ab_mask =3D float_cmask(a->cls) | float_cmask(b->cls);
> +    int cmp;
> +
> +    if (likely(ab_mask =3D=3D float_cmask_normal)) {
> +        if (a->sign !=3D b->sign) {
> +            goto a_sign;
> +        }
> +        if (a->exp !=3D b->exp) {
> +            cmp =3D a->exp < b->exp ? -1 : 1;
> +        } else {
> +            cmp =3D frac_cmp(a, b);
> +        }
> +        if (a->sign) {
> +            cmp =3D -cmp;
> +        }
> +        return cmp;

This code path seems to be written to assume an
integer -1 or 1 return value...

> +    }
> +
> +    if (unlikely(ab_mask & float_cmask_anynan)) {
> +        if (!is_quiet || (ab_mask & float_cmask_snan)) {
> +            float_raise(float_flag_invalid, s);
> +        }
> +        return float_relation_unordered;
> +    }
> +
> +    if (ab_mask & float_cmask_zero) {
> +        if (ab_mask =3D=3D float_cmask_zero) {
> +            return float_relation_equal;
> +        } else if (a->cls =3D=3D float_class_zero) {
> +            goto b_sign;
> +        } else {
> +            goto a_sign;
> +        }
> +    }
> +
> +    if (ab_mask =3D=3D float_cmask_inf) {
> +        if (a->sign =3D=3D b->sign) {
> +            return float_relation_equal;

...but code later in the function works with and returns the
float_relation_* enumeration values.

> +        }
> +    } else if (b->cls =3D=3D float_class_inf) {
> +        goto b_sign;
> +    } else {
> +        g_assert(a->cls =3D=3D float_class_inf);
> +    }
> +
> + a_sign:
> +    return a->sign ? float_relation_less : float_relation_greater;
> + b_sign:
> +    return b->sign ? float_relation_greater : float_relation_less;
> +}

FWIW, the Coverity issues are CID 1487134, 1487139, 1487151, 1487184,
where for some reason it thinks that floatx80_compare() and
floatx80_compare_quiet() can return 3 and thus that there is a
potential array overrun. (I've marked these all as false positives
in the UI, anyway.)

thanks
-- PMM


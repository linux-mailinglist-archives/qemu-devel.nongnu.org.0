Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E437A508
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:52:08 +0200 (CEST)
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPzj-0006DM-8J
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPXd-00035Z-6I
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPXY-0007lo-Lo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620728576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7olOPCSRPXLqU41i95O63Kl8XOWGfantaeo94ENIDDg=;
 b=XEZINSHksPSUM+8md4gSRpB/excaUVugypuSHwmDNWqciTjJ4unMUWFbMMX0ZvUGRyJOaL
 e9zvfLuFU2KN602TLsEhVAJ0WAztxjAJkGbOhZaRytLmF8B5KhpQYNXERPsgxESdla93jj
 9MdBmtLsPMFr2IF94kbnDSlCiRKkEDw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-NMmVrSckMuG8mgNW5szUjg-1; Tue, 11 May 2021 06:22:55 -0400
X-MC-Unique: NMmVrSckMuG8mgNW5szUjg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so8559900wre.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7olOPCSRPXLqU41i95O63Kl8XOWGfantaeo94ENIDDg=;
 b=gF8HErl7HpSNTiPHaaQx30nSlEA+2tXIfuhgp5uYikQxzLstizRtwDbG77fpFtomU8
 ij8h9k8hn9U3y4JKNKMNN/TwTYVs4XplglVimQr2K3cU1ZBmWw1NtuY/F0J2Kfp7KKX5
 nZAvlHzBiMdcYxfiCHVdgNHOyb0HRxhjjJzs5NfeDB/pN9h5zoqO1PJkqH3fLNVd4rGW
 EUfAcw/TRqFqFnnbCXfHA5vhAYnEZU2gTGQpz9JLYAzYmEWbV4+ZQbyFtmLSEhdCva/U
 khqRu5o03dLgDUKYXGfeJLs0nXYlizmRO8+hPVXWadsUwZc+LFhjiGt7TX1md2Tk13LW
 gSew==
X-Gm-Message-State: AOAM530sv9y7DW7GeKsE+qM6HUn3Lcjb3EhUCqJsCEjogby2wsPC8LFi
 jydCOB3ehGr72AJovYdGGtmZSLv/XVFRldgkyfJ6s7EZl78wpKkSvd31krZtSXxDo+4eMj/4Y3P
 ynGV1MqYj6TTNHNk=
X-Received: by 2002:a7b:c101:: with SMTP id w1mr4653228wmi.164.1620728574071; 
 Tue, 11 May 2021 03:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDjd6qeRN0sU+YO1kNwC19B42oFmbLEPTt6DZMUd+LrJ6Qr7/WGaZQELlH8V0lmsa06tEMsQ==
X-Received: by 2002:a7b:c101:: with SMTP id w1mr4653199wmi.164.1620728573693; 
 Tue, 11 May 2021 03:22:53 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 r2sm28311534wrv.39.2021.05.11.03.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:22:53 -0700 (PDT)
Subject: Re: [PATCH 17/72] softfloat: Use pointers with parts_default_nan
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-18-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <bb440bc3-b75e-cc5c-7a2c-d44dabc98118@redhat.com>
Date: Tue, 11 May 2021 12:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-18-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:47, Richard Henderson wrote:
> At the same time, rename to parts64_default_nan and define
> a macro for parts_default_nan using QEMU_GENERIC.

All I can spot is "#define parts_default_nan  parts64_default_nan" -- 
what am I missing?

apart from that

Reviewed-by: David Hildenbrand <david@redhat.com>

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c                | 47 +++++++++++++++++++++++-----------
>   fpu/softfloat-specialize.c.inc |  4 +--
>   2 files changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 398a068b58..c7f95961cf 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -650,6 +650,8 @@ static inline float64 float64_pack_raw(FloatParts64 p)
>   *----------------------------------------------------------------------------*/
>   #include "softfloat-specialize.c.inc"
>   
> +#define parts_default_nan  parts64_default_nan
> +
>   /* Canonicalize EXP and FRAC, setting CLS.  */
>   static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
>                                     float_status *status)
> @@ -848,7 +850,8 @@ static FloatParts64 return_nan(FloatParts64 a, float_status *s)
>       } else if (!s->default_nan_mode) {
>           return a;
>       }
> -    return parts_default_nan(s);
> +    parts_default_nan(&a, s);
> +    return a;
>   }
>   
>   static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
> @@ -858,7 +861,7 @@ static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
>       }
>   
>       if (s->default_nan_mode) {
> -        return parts_default_nan(s);
> +        parts_default_nan(&a, s);
>       } else {
>           if (pickNaN(a.cls, b.cls,
>                       a.frac > b.frac ||
> @@ -900,7 +903,8 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
>           a = c;
>           break;
>       case 3:
> -        return parts_default_nan(s);
> +        parts_default_nan(&a, s);
> +        break;
>       default:
>           g_assert_not_reached();
>       }
> @@ -1011,7 +1015,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
>           if (a.cls == float_class_inf) {
>               if (b.cls == float_class_inf) {
>                   float_raise(float_flag_invalid, s);
> -                return parts_default_nan(s);
> +                parts_default_nan(&a, s);
>               }
>               return a;
>           }
> @@ -1254,7 +1258,8 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
>       if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
>           (a.cls == float_class_zero && b.cls == float_class_inf)) {
>           float_raise(float_flag_invalid, s);
> -        return parts_default_nan(s);
> +        parts_default_nan(&a, s);
> +        return a;
>       }
>       /* Multiply by 0 or Inf */
>       if (a.cls == float_class_inf || a.cls == float_class_zero) {
> @@ -1372,7 +1377,8 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
>   
>       if (inf_zero) {
>           float_raise(float_flag_invalid, s);
> -        return parts_default_nan(s);
> +        parts_default_nan(&a, s);
> +        return a;
>       }
>   
>       if (flags & float_muladd_negate_c) {
> @@ -1396,11 +1402,11 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
>       if (c.cls == float_class_inf) {
>           if (p_class == float_class_inf && p_sign != c.sign) {
>               float_raise(float_flag_invalid, s);
> -            return parts_default_nan(s);
> +            parts_default_nan(&c, s);
>           } else {
>               c.sign ^= sign_flip;
> -            return c;
>           }
> +        return c;
>       }
>   
>       if (p_class == float_class_inf) {
> @@ -1764,7 +1770,8 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
>           &&
>           (a.cls == float_class_inf || a.cls == float_class_zero)) {
>           float_raise(float_flag_invalid, s);
> -        return parts_default_nan(s);
> +        parts_default_nan(&a, s);
> +        return a;
>       }
>       /* Inf / x or 0 / x */
>       if (a.cls == float_class_inf || a.cls == float_class_zero) {
> @@ -3438,7 +3445,8 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
>       }
>       if (a.sign) {
>           float_raise(float_flag_invalid, s);
> -        return parts_default_nan(s);
> +        parts_default_nan(&a, s);
> +        return a;
>       }
>       if (a.cls == float_class_inf) {
>           return a;  /* sqrt(+inf) = +inf */
> @@ -3573,30 +3581,37 @@ bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
>   
>   float16 float16_default_nan(float_status *status)
>   {
> -    FloatParts64 p = parts_default_nan(status);
> +    FloatParts64 p;
> +
> +    parts_default_nan(&p, status);
>       p.frac >>= float16_params.frac_shift;
>       return float16_pack_raw(p);
>   }
>   
>   float32 float32_default_nan(float_status *status)
>   {
> -    FloatParts64 p = parts_default_nan(status);
> +    FloatParts64 p;
> +
> +    parts_default_nan(&p, status);
>       p.frac >>= float32_params.frac_shift;
>       return float32_pack_raw(p);
>   }
>   
>   float64 float64_default_nan(float_status *status)
>   {
> -    FloatParts64 p = parts_default_nan(status);
> +    FloatParts64 p;
> +
> +    parts_default_nan(&p, status);
>       p.frac >>= float64_params.frac_shift;
>       return float64_pack_raw(p);
>   }
>   
>   float128 float128_default_nan(float_status *status)
>   {
> -    FloatParts64 p = parts_default_nan(status);
> +    FloatParts64 p;
>       float128 r;
>   
> +    parts_default_nan(&p, status);
>       /* Extrapolate from the choices made by parts_default_nan to fill
>        * in the quad-floating format.  If the low bit is set, assume we
>        * want to set all non-snan bits.
> @@ -3611,7 +3626,9 @@ float128 float128_default_nan(float_status *status)
>   
>   bfloat16 bfloat16_default_nan(float_status *status)
>   {
> -    FloatParts64 p = parts_default_nan(status);
> +    FloatParts64 p;
> +
> +    parts_default_nan(&p, status);
>       p.frac >>= bfloat16_params.frac_shift;
>       return bfloat16_pack_raw(p);
>   }
> diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
> index 52fc76d800..085ddea62b 100644
> --- a/fpu/softfloat-specialize.c.inc
> +++ b/fpu/softfloat-specialize.c.inc
> @@ -129,7 +129,7 @@ static bool parts_is_snan_frac(uint64_t frac, float_status *status)
>   | The pattern for a default generated deconstructed floating-point NaN.
>   *----------------------------------------------------------------------------*/
>   
> -static FloatParts64 parts_default_nan(float_status *status)
> +static void parts64_default_nan(FloatParts64 *p, float_status *status)
>   {
>       bool sign = 0;
>       uint64_t frac;
> @@ -164,7 +164,7 @@ static FloatParts64 parts_default_nan(float_status *status)
>       }
>   #endif
>   
> -    return (FloatParts64) {
> +    *p = (FloatParts64) {
>           .cls = float_class_qnan,
>           .sign = sign,
>           .exp = INT_MAX,
> 


-- 
Thanks,

David / dhildenb



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2746737A487
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:25:10 +0200 (CEST)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPZd-00078x-0q
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPSZ-0005Uf-II
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPSW-0005De-PP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620728268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juqvrtikHBsa2TFH/zP8gXBIN4Qnovs/08ngFRuj3yE=;
 b=EVL8B63D2ldpU16n7Cwvnb5MH8lAfRkOG5B1Z5bkDVg/Ga1OwVsPOWbkMl/+HhEZQGR+h9
 lT54C83Wznf0x1H30YZzMoEgkiANADtEcuvnjpeA6gK7gcGdqsUZyDgtACSXwxO2RJzzPE
 xe6Z0j8XspiDviAHnA26IwTvnFUD61Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-ejGm-tsYOuCAJ5RZ69yVEw-1; Tue, 11 May 2021 06:17:46 -0400
X-MC-Unique: ejGm-tsYOuCAJ5RZ69yVEw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y129-20020a1c32870000b029016920cc7087so133565wmy.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=juqvrtikHBsa2TFH/zP8gXBIN4Qnovs/08ngFRuj3yE=;
 b=uY3b5OOI18CmfN29UDNh61SjjcwnBPmNFs13vN6De4XJJpz6gwhJ4a8YZnl8rfwE5p
 WCUVIugBuTPJDsXAyOy7KXJr/cq8/EjA5rDpIRaNI1ErEpUVDOWRH5csn16GbhWMXsDk
 jnYMQNEygV0gr1symBTLx2/mV5ia252JI7F3+YRQR+k2X0ZrrQ6n5pFB7OsqzQe07eVx
 M6dQJGci+RTVod2gYy67spCI7hEkJ9IKKcdu3oafN32Caneywc1WrjU/Qrvqp8o4KlA/
 hBwaXy3jLet+9QkF5WFoBebvHEzKKwpjCsD1I8WkfC0CiwC7mRtB40d+kyL8gZ7AuWY7
 8Bxg==
X-Gm-Message-State: AOAM5321c8qZKwCDIfZAD67CApRZoXYUbFreVPU0a4H5IDx4tZ85RCxZ
 sI39CN46s6tcvDoCFhSBeuKpehR8V0Dqel1a3VCuhKrfSLUfpnZojgebsH9xmnLLLGHT/qHevId
 1EED1KSPUNhVijus=
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr37137671wrr.305.1620728265401; 
 Tue, 11 May 2021 03:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXb7Sy8cSpizytf55bp+He/VFGsxCLIeQXyicTP0hj1xZamdN+yeQpg3mbBRWdMJVWzC1K9w==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr37137656wrr.305.1620728265204; 
 Tue, 11 May 2021 03:17:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 n6sm27593094wro.23.2021.05.11.03.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:17:44 -0700 (PDT)
Subject: Re: [PATCH 16/72] softfloat: Move type-specific pack/unpack routines
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-17-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <33d51d05-aba5-91e7-0745-09ac14a73686@redhat.com>
Date: Tue, 11 May 2021 12:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-17-richard.henderson@linaro.org>
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
> In preparation from moving sf_canonicalize.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 109 +++++++++++++++++++++++++-----------------------
>   1 file changed, 56 insertions(+), 53 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 27b51659c9..398a068b58 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -837,59 +837,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
>       return p;
>   }
>   
> -/* Explicit FloatFmt version */
> -static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
> -                                            const FloatFmt *params)
> -{
> -    return sf_canonicalize(float16_unpack_raw(f), params, s);
> -}
> -
> -static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
> -{
> -    return float16a_unpack_canonical(f, s, &float16_params);
> -}
> -
> -static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
> -{
> -    return sf_canonicalize(bfloat16_unpack_raw(f), &bfloat16_params, s);
> -}
> -
> -static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
> -                                             const FloatFmt *params)
> -{
> -    return float16_pack_raw(round_canonical(p, s, params));
> -}
> -
> -static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
> -{
> -    return float16a_round_pack_canonical(p, s, &float16_params);
> -}
> -
> -static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
> -{
> -    return bfloat16_pack_raw(round_canonical(p, s, &bfloat16_params));
> -}
> -
> -static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
> -{
> -    return sf_canonicalize(float32_unpack_raw(f), &float32_params, s);
> -}
> -
> -static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
> -{
> -    return float32_pack_raw(round_canonical(p, s, &float32_params));
> -}
> -
> -static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
> -{
> -    return sf_canonicalize(float64_unpack_raw(f), &float64_params, s);
> -}
> -
> -static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
> -{
> -    return float64_pack_raw(round_canonical(p, s, &float64_params));
> -}
> -
>   static FloatParts64 return_nan(FloatParts64 a, float_status *s)
>   {
>       g_assert(is_nan(a.cls));
> @@ -964,6 +911,62 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
>       return a;
>   }
>   
> +/*
> + * Pack/unpack routines with a specific FloatFmt.
> + */
> +
> +static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
> +                                            const FloatFmt *params)
> +{
> +    return sf_canonicalize(float16_unpack_raw(f), params, s);
> +}
> +
> +static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
> +{
> +    return float16a_unpack_canonical(f, s, &float16_params);
> +}
> +
> +static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
> +{
> +    return sf_canonicalize(bfloat16_unpack_raw(f), &bfloat16_params, s);
> +}
> +
> +static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
> +                                             const FloatFmt *params)
> +{
> +    return float16_pack_raw(round_canonical(p, s, params));
> +}
> +
> +static float16 float16_round_pack_canonical(FloatParts64 p, float_status *s)
> +{
> +    return float16a_round_pack_canonical(p, s, &float16_params);
> +}
> +
> +static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
> +{
> +    return bfloat16_pack_raw(round_canonical(p, s, &bfloat16_params));
> +}
> +
> +static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
> +{
> +    return sf_canonicalize(float32_unpack_raw(f), &float32_params, s);
> +}
> +
> +static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
> +{
> +    return float32_pack_raw(round_canonical(p, s, &float32_params));
> +}
> +
> +static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
> +{
> +    return sf_canonicalize(float64_unpack_raw(f), &float64_params, s);
> +}
> +
> +static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
> +{
> +    return float64_pack_raw(round_canonical(p, s, &float64_params));
> +}
> +
>   /*
>    * Returns the result of adding or subtracting the values of the
>    * floating-point values `a' and `b'. The operation is performed
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96537A444
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:06:32 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPHb-0005ll-Lk
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPFn-0004HZ-HS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPFl-0005ny-Vm
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdL9UKdW2vt0FKQcRzfsMwPk1TbosnBS46TnYaXzEMM=;
 b=W5ugmm0fnqFTxTWz909AenjiYzA9+IRqtGOOc7OxLA9vvF1JbibwTS6ieFBSqgnytzcMcY
 JGt3/4+DEFnSqHoKs19H6am4ISAcXn8k+MUxIfujeFei90pmNBZo66XwRWzurpOPLrmDTt
 fxt36lUzyYp/pBN0qf0JFfBWMBWj/fs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-wxHY7h2eOFao63NFZU_6-Q-1; Tue, 11 May 2021 06:04:36 -0400
X-MC-Unique: wxHY7h2eOFao63NFZU_6-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso840826wml.6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NdL9UKdW2vt0FKQcRzfsMwPk1TbosnBS46TnYaXzEMM=;
 b=YZ3k8+j4ZhCWGA9m7HEPSb2xcfxtt/1Q9oH7yPsGQGJFu/cEHdccMl4luN0kCr4CCy
 2mwrdn29ioBoWdDNiJWDg0yzY8jLuVhTxBzdQNI+g4biuKjfljF+OB5HwvAppBiuEZ59
 MlW0Y450dveHIJoRl8hKW3tRSJvXaNldUU+f/jhwPeferSyYkaaqHVOpHPFwxLe0eLkt
 h0doCjtMQ019/B7rfMByxzA829tSXnTqkkj2IJdELVYUcJRkz2hZC3zszKpYfP+kmfHp
 Pa6AVbzdG1ZZEu1woX+7fzFVOr7YWsoT1v6la0WqQ3l2GwE4YamP9asM8CAZNcSBdx98
 VPNQ==
X-Gm-Message-State: AOAM532kZSglgutRwcxR75oNiZE0WNZNvfcWCodnn4l0lwXnc0femR8s
 eISAhXbFj5y1AfkjwuaS1G+f1n3T8F/f7buA0E3uDlwb9Qon48T+jhZCTVLAcNY2SQYmH5t0eYC
 8eZ1f/hXq9syRYYg=
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr4533221wmq.133.1620727474820; 
 Tue, 11 May 2021 03:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb5SE63AAoevoL3OdUpaF226CS52HBHuJ7izqgBz5eM4b5x8n/41SBApIx1+sAo9AHJRxi5g==
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr4533205wmq.133.1620727474592; 
 Tue, 11 May 2021 03:04:34 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 r5sm26057263wmh.23.2021.05.11.03.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:04:34 -0700 (PDT)
Subject: Re: [PATCH 07/72] softfloat: Inline float_raise
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-8-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <63e5a5d0-d549-6ede-4b98-dd326f451dd9@redhat.com>
Date: Tue, 11 May 2021 12:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-8-richard.henderson@linaro.org>
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

On 08.05.21 03:46, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/fpu/softfloat.h        |  5 ++++-
>   fpu/softfloat-specialize.c.inc | 12 ------------
>   2 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index 78ad5ca738..019c2ec66d 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -100,7 +100,10 @@ typedef enum {
>   | Routine to raise any or all of the software IEC/IEEE floating-point
>   | exception flags.
>   *----------------------------------------------------------------------------*/
> -void float_raise(uint8_t flags, float_status *status);
> +static inline void float_raise(uint8_t flags, float_status *status)
> +{
> +    status->float_exception_flags |= flags;
> +}
>   
>   /*----------------------------------------------------------------------------
>   | If `a' is denormal and we are in flush-to-zero mode then set the
> diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
> index 9ea318f3e2..487b29155c 100644
> --- a/fpu/softfloat-specialize.c.inc
> +++ b/fpu/softfloat-specialize.c.inc
> @@ -228,18 +228,6 @@ floatx80 floatx80_default_nan(float_status *status)
>   const floatx80 floatx80_infinity
>       = make_floatx80_init(floatx80_infinity_high, floatx80_infinity_low);
>   
> -/*----------------------------------------------------------------------------
> -| Raises the exceptions specified by `flags'.  Floating-point traps can be
> -| defined here if desired.  It is currently not possible for such a trap
> -| to substitute a result value.  If traps are not implemented, this routine
> -| should be simply `float_exception_flags |= flags;'.
> -*----------------------------------------------------------------------------*/
> -
> -void float_raise(uint8_t flags, float_status *status)
> -{
> -    status->float_exception_flags |= flags;
> -}
> -
>   /*----------------------------------------------------------------------------
>   | Internal canonical NaN format.
>   *----------------------------------------------------------------------------*/
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



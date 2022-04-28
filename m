Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E53512ECF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 10:42:02 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njzio-0004XQ-Vs
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 04:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njzet-0002Zf-L5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njzeq-0004cl-8f
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651135070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL8xtjjxjT5aAa5osjDjJHX/L8SyN+iosLKJc7qiRec=;
 b=OrVhQUCZBk+U3H8L5BjxkEchm7T6tKgkzD8wj5fGC5goegM5D5CBETzalF1uaqcvPHL4Qm
 YQ2pEdf+XNDPOhRo8Ro6m8/MuNyoyZU8DCUhBvGTB7hk/HwShtuZSN9VZC/Xz/k9OBGm3G
 a7ZjJ5cLkgUjJr13rAJVunByWkgFPCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-pwZ5RB9RPJiDhu89QLq4NQ-1; Thu, 28 Apr 2022 04:37:49 -0400
X-MC-Unique: pwZ5RB9RPJiDhu89QLq4NQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh11-20020a05600c3d0b00b003928fe7ba07so1268000wmb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 01:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VL8xtjjxjT5aAa5osjDjJHX/L8SyN+iosLKJc7qiRec=;
 b=2JZH7gEZ8EvcBLtvQOeMDEppDUuT4OXnL0QWjOyANAv+F0SDKeoVif4nY21+VD88CI
 82wjMYie34Q8lZITu3GwSpa4Mygkk8UusXasx0v3S4bAW0GS6bnJN5cWAvbuU3QgSN2a
 8qURcEKKTvSZAv3yuBayOVctrRka2kZHDuKmWd2XAbc7iqV7xHD+khBV5okgcPxPvb8J
 NWho+J5Y6uSFXzsIuDGPcO0LYklZzWPQFgfwspYcU/veZtGW6y6bop/d3aH4BSEhDEdI
 LE2hpy7rNi2zFQHFfIFmVF0gsmVis8q9/RtdxMDQBTP/yFMKH8cGm5FnESMHSfWM2Eoq
 qR0Q==
X-Gm-Message-State: AOAM532AJ0X5UfHSq1e2jaWu4MLaJr2NedDP7m5AEvO8j1embVSjxbUE
 NQ6DXMNyYjXbVwtxwwktuOut4r0BYoOnFwkzJtU/FvLwTl7tuEYg0aZiD2sUHgvB1XffvFwHpY5
 Je7NzmKhU6khDXds=
X-Received: by 2002:adf:ded0:0:b0:20a:f070:6bb0 with SMTP id
 i16-20020adfded0000000b0020af0706bb0mr5630892wrn.208.1651135068059; 
 Thu, 28 Apr 2022 01:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2/oPpnGIuf3Q6ho7ioM+KsjaOBZWmL7s0ujvkkDlhmDmRBVGkZp0u6v57MNj0n4/7HGqXYw==
X-Received: by 2002:adf:ded0:0:b0:20a:f070:6bb0 with SMTP id
 i16-20020adfded0000000b0020af0706bb0mr5630866wrn.208.1651135067659; 
 Thu, 28 Apr 2022 01:37:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t4-20020adfe104000000b00205b50f04f0sm15129669wrz.86.2022.04.28.01.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 01:37:47 -0700 (PDT)
Message-ID: <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
Date: Thu, 28 Apr 2022 10:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
 <20220426160422.2353158-4-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220426160422.2353158-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/26/22 18:04, Peter Maydell wrote:
> The Arm SMMUv3 includes an optional feature equivalent to the CPU
> FEAT_BBM, which permits an OS to switch a range of memory between
> "covered by a huge page" and "covered by a sequence of normal pages"
> without having to engage in the traditional 'break-before-make'
> dance. (This is particularly important for the SMMU, because devices
> performing I/O through an SMMU are less likely to be able to cope with
> the window in the sequence where an access results in a translation
> fault.)  The SMMU spec explicitly notes that one of the valid ways to
> be a BBM level 2 compliant implementation is:
>  * if there are multiple entries in the TLB for an address,
>    choose one of them and use it, ignoring the others
>
> Our SMMU TLB implementation (unlike our CPU TLB) does allow multiple
> TLB entries for an address, because the translation table level is
> part of the SMMUIOTLBKey, and so our IOTLB hashtable can include
> entries for the same address where the leaf was at different levels
> (i.e. both hugepage and normal page). Our TLB lookup implementation in
> smmu_iotlb_lookup() will always find the entry with the lowest level
> (i.e. it prefers the hugepage over the normal page) and ignore any
> others. TLB invalidation correctly removes all TLB entries matching
> the specified address or address range (unless the guest specifies the
> leaf level explicitly, in which case it gets what it asked for). So we
"

unless the guest specifies the
leaf level explicitly, in which case it gets what it asked for

"
This is the less obvious part as the spec says:

"A TLB invalidation operation removes all matching TLB entries even if
overlapping entries exist for a given
address."

I failed to find further precisions about the range invalidation & BBML.

If you are confident about this, it looks good to me.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric




> can validly advertise support for BBML level 2.
>
> Note that we still can't yet advertise ourselves as an SMMU v3.2,
> because v3.2 requires support for the S2FWB feature, which we don't
> yet implement.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3-internal.h | 1 +
>  hw/arm/smmuv3.c          | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d1885ae3f25..e9150a6ff33 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -56,6 +56,7 @@ REG32(IDR2,                0x8)
>  REG32(IDR3,                0xc)
>       FIELD(IDR3, HAD,         2, 1);
>       FIELD(IDR3, RIL,        10, 1);
> +     FIELD(IDR3, BBML,       11, 2);
>  REG32(IDR4,                0x10)
>  REG32(IDR5,                0x14)
>       FIELD(IDR5, OAS,         0, 3);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 707eb430c23..74bc2e85ee4 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -259,6 +259,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>  
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>  
>      /* 4K, 16K and 64K granule support */
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);



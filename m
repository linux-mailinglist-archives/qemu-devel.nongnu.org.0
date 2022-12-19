Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7B96508A2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BgL-0003Ia-Pu; Mon, 19 Dec 2022 03:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgJ-0003I6-AT
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgH-0006Tb-4j
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439167;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG0rO08Fx7LbBxHdq3/mbT068NXJDt5+pp7TEPRnHZ8=;
 b=DP1fYE8J8ZFPJW2TSjEq1c/Vm10erRosF4cfDe4bYYhnmAchHaqXKjxhmuS/MhihGbxm8v
 lcuihB+97FJM4r7KV9zeXGiKH3n6wfQI4ob6PTujyavS0eNls/qcN+rOp0eGMkY0JSVTAn
 1x67k+qGdTm1RO+3iz3JaYc5id0mkw4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-mHxXOUj8OpOl_CPP0M_zXw-1; Mon, 19 Dec 2022 03:39:25 -0500
X-MC-Unique: mHxXOUj8OpOl_CPP0M_zXw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso3356050wms.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 00:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oG0rO08Fx7LbBxHdq3/mbT068NXJDt5+pp7TEPRnHZ8=;
 b=Or3FPoBypiYfBYKRPsMMSboitglaXKF4tP76/C+DRG2j1wuYsHXg+pyPWdS8Nm3Eux
 PfBvVQc2i+Hqc9Hb5qOCQMEEc5tYPWWA0g4+BPykg/WQ3SDxfYjH0zxxtt4AmdYvf1G9
 f/H2rrWOaMEbvjA/ZTzAOqyZcfJmUJqQ5DD+NqXPlFBwbwFzLJgQVQFyrh0G+JaCDuNF
 aPOrudCYaEJLxXH89tU5sn3sDMo5UuPjKRk/30/RmOkTfL8Y6nb36S3xhhZ+MMX+nje9
 dEYjN48I6mEEajrnKXluR5qZKFEt/6WF7r4nVJnxmrkvAvZ2iYO9lJzfCJnhI2shhFCg
 uw2A==
X-Gm-Message-State: AFqh2koQVazOkxfGNwEDRJeYP5hxJBEFiUWgIXrYq0GS9NqrfPToIeW6
 NTph7gMoV5kKpHDFWWYnDzyqfWUHhTxlWBTmEQo2+934eq6GEhgSuFzXpG26gNVY58ZJ1f7Ikam
 T2REnDdMwW9lhwZ0=
X-Received: by 2002:a05:600c:492a:b0:3d3:4007:9c88 with SMTP id
 f42-20020a05600c492a00b003d340079c88mr9573018wmp.18.1671439164873; 
 Mon, 19 Dec 2022 00:39:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtph62QiIwUH9NE27Q1zaid/X0iVvg1TSfsVYCKt/xSeXtx80tCB0mwXnBaGLYMHG+JJcSDmg==
X-Received: by 2002:a05:600c:492a:b0:3d3:4007:9c88 with SMTP id
 f42-20020a05600c492a00b003d340079c88mr9572997wmp.18.1671439164539; 
 Mon, 19 Dec 2022 00:39:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm20579860wmq.2.2022.12.19.00.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:39:23 -0800 (PST)
Message-ID: <7476b4b3-aceb-3694-520d-ae83430577c7@redhat.com>
Date: Mon, 19 Dec 2022 09:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] hw/arm/smmu-common: Avoid using inlined functions
 with external linkage
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-3-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221216214924.4711-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/16/22 22:49, Philippe Mathieu-Daudé wrote:
> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
> and building with -Wall we get:
>
>   hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
>   hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
>     void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>     ^
>     static
>
> None of our code base require / use inlined functions with external
> linkage. Some places use internal inlining in the hot path. These
> two functions are certainly not in any hot path and don't justify
> any inlining, so these are likely oversights rather than intentional.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/smmu-common.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 9f196625a2..54186f31cb 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -116,7 +116,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
>      g_hash_table_insert(bs->iotlb, key, new);
>  }
>  
> -inline void smmu_iotlb_inv_all(SMMUState *s)
> +void smmu_iotlb_inv_all(SMMUState *s)
>  {
>      trace_smmu_iotlb_inv_all();
>      g_hash_table_remove_all(s->iotlb);
> @@ -146,9 +146,8 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
>             ((entry->iova & ~info->mask) == info->iova);
>  }
>  
> -inline void
> -smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> -                    uint8_t tg, uint64_t num_pages, uint8_t ttl)
> +void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> +                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
>      /* if tg is not set we use 4KB range invalidation */
>      uint8_t granule = tg ? tg * 2 + 10 : 12;
> @@ -174,7 +173,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                                  &info);
>  }
>  
> -inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> @@ -374,8 +373,8 @@ error:
>   *
>   * return 0 on success
>   */
> -inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -                    SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
>      if (!cfg->aa64) {
>          /*



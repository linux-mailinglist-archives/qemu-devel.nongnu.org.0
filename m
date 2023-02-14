Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87D696D12
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0BM-0002Uz-O3; Tue, 14 Feb 2023 13:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0BA-0002OY-6d
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:37:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0B5-0004Z3-7e
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676399838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB9WaVMBaH/HInGJ4VloOO6TJMJoHR8SjqJsf0ukbfQ=;
 b=B+bS7U+z/CWy3owk2ZXzyM552XyE6AO3Lj+VM5sgKjeWmbFJjflxRXuK2nG1Kagj4pr4bx
 p/gJKXhJqeY6PYtoloGqZLrVd8ClMHkR4Kw3VdrC0K3/QFbYnW8JXdD6ZNpDstsEP1LpyH
 rsHeE4OtWUEYTVVI34maEUeMDTsLsJM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-vR6WbE7fM2WllirwGkbpXQ-1; Tue, 14 Feb 2023 13:37:17 -0500
X-MC-Unique: vR6WbE7fM2WllirwGkbpXQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso9116843qvu.12
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LB9WaVMBaH/HInGJ4VloOO6TJMJoHR8SjqJsf0ukbfQ=;
 b=2LiHUSGFf+++D5rZrFQXd0bLPezHwTjjx5LoiZTE5PQ1vPONE2aSAlZ3DofFOPxMCb
 CwVjiIVThLL3GFAdYgkOyDHsXbCj3rN7kltP9mx2krk1aiIlGbzqo0mAVvPUVx3huWto
 KkJIp3mgOO/a56QzIk85JxfJXVbfNXkkvWwFu7JVzoEwSBR5S5YqS3pPGsH7mAVrSOFz
 6B3gUjUZlNEZT9wMlZd8M58AABKOPuwZy3WiU2rcA2QKTt8T0CgRYg9uDPGYtfcgrZBn
 VhRTkqf/wV7Em+XzMq11hpExZPCmtTY7zIjQDyAdRFrydpBeLIVmoIspbl/gTETRmAM/
 s/lw==
X-Gm-Message-State: AO0yUKWZGTYRpBBlMXHWROx1C6ldX//dr2h3QTmwxFoOMygvYETicXSk
 PQveGFxIEnTlBQHDRyInGWEiO9RacObT7rjPwYEbtrUPv9jZnhMLfvaxKo+xQw+5Qd2w5rWdXJC
 n4ezI5S+9At1GoUE=
X-Received: by 2002:a05:6214:246a:b0:56e:b690:9bc5 with SMTP id
 im10-20020a056214246a00b0056eb6909bc5mr7860827qvb.19.1676399836499; 
 Tue, 14 Feb 2023 10:37:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+KIPh5okvOGF5JVNpCN9Ju9Od+w3bIIcARIGO+9GBZJsymd/VjDmFAsnJI+b0h+eqBOubJ8g==
X-Received: by 2002:a05:6214:246a:b0:56e:b690:9bc5 with SMTP id
 im10-20020a056214246a00b0056eb6909bc5mr7860792qvb.19.1676399836240; 
 Tue, 14 Feb 2023 10:37:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j64-20020a378743000000b0073b275607f0sm7218758qkd.65.2023.02.14.10.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:37:15 -0800 (PST)
Message-ID: <3354c941-a109-c67d-865b-7a6fea7c6cac@redhat.com>
Date: Tue, 14 Feb 2023 19:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] hw/arm/smmu-common: Support 64-bit addresses
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
 <20230214171921.1917916-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230214171921.1917916-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Jean,

On 2/14/23 18:19, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set. Ensure the IOMMU region covers all 64 bits.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  include/hw/arm/smmu-common.h | 2 --
>  hw/arm/smmu-common.c         | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index c5683af07d..9fcff26357 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -27,8 +27,6 @@
>  #define SMMU_PCI_DEVFN_MAX    256
>  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>  
> -#define SMMU_MAX_VA_BITS      48
> -
>  /*
>   * Page table walk error types
>   */
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 733c964778..2b8c67b9a1 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -439,7 +439,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>  
>          memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
>                                   s->mrtypename,
> -                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
> +                                 OBJECT(s), name, UINT64_MAX);
>          address_space_init(&sdev->as,
>                             MEMORY_REGION(&sdev->iommu), name);
>          trace_smmu_add_mr(name);



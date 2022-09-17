Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0D5BBAB2
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:39:01 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfWf-0000vc-0Q
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfVD-0007z7-JM
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:37:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfVB-000814-ER
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:37:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e16so41352181wrx.7
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=VcRnA81evSOLiIhi5KYKgAbZPu1jKqgIhJG/y9uJQKo=;
 b=qEKWLzgP40rNtrOSi7bsla0uVsZtZP4cp76A7RMiyiDYfhu90Xddo5CcHlvjRuCjOs
 IWq+lQz4TeNn1SmcRI8ydwkDzLRF8EMCpceh98LIQZDLtEBmU3xmhRxorovinu63d6MS
 6PADIsfYgmeN9ppfKfIxjj+wjxkKrSQZ4/yZS9+AV++hTxjR94hcI0nb3raeJ8QKp2G0
 XxtvqpVv4Y6CYXjnxS3vq3x38AalUT2RrrmNrpcFpDPRWsIAXFpBFHZcGpVxBYltFitZ
 IgldS5M/MZWC0I7E2pa6R+vsEhjh+gXoDaHMLRjX/HdKdMnAcRRFipUZNpEQAb8fYoRd
 7sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=VcRnA81evSOLiIhi5KYKgAbZPu1jKqgIhJG/y9uJQKo=;
 b=U4md6SuQwucmmSehTL+qypL66G3rTSL5v48Bde9lHak6VnNw8UCJpjaFme7aQK7cdG
 h7HoI3SwP4lYyQm+9t8XGb8onz/XoP/yjII8cgr2bdTAU2Gg0oNFpE7aHjAfKufw3b3v
 C8pR8X/KSoD5sPqgsESQMZJPaBOu+eLMN0VNbTl+8J6eGKtNny26WfH/D3tqmh+oWOQy
 7cDfiSOSeYaes7DWKRvSJA+3E7ktzTLnw/9iNwAI4pKY435VpXkza91i7BmexFJ9x2fe
 E6TIerowwbXCMdsJjORWDltjW4TbpF/irN4hXUTwNSSIwPBZoZHq6K7tlVd1t7/1z/T4
 O1PA==
X-Gm-Message-State: ACrzQf0U3SxVDlobxV0u72cEyvc2vHfA7pMqfLlan/fW9aiZ9eLMYGse
 puorHPAwKWZuLGQ3Jo2AlUg=
X-Google-Smtp-Source: AMsMyM6CXVIIFTDHZ8f6nD66uYgI7OcgmdRBx50uBbOYGYX5KXLPMYlckAq03hX4CuxwD4DwZCDzFA==
X-Received: by 2002:a5d:500e:0:b0:22a:44ea:dee2 with SMTP id
 e14-20020a5d500e000000b0022a44eadee2mr6422283wrt.325.1663450647826; 
 Sat, 17 Sep 2022 14:37:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm7451776wmq.13.2022.09.17.14.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:37:27 -0700 (PDT)
Message-ID: <344ad5a1-e4c6-4495-3ffd-841909b274a4@amsat.org>
Date: Sat, 17 Sep 2022 23:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] vfio/common: Fix vfio_iommu_type1_info use after free
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: nicolinc@nvidia.com, cohuck@redhat.com, Alberto Faria
 <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <166326219630.3388898.12882473157184946072.stgit@omen>
In-Reply-To: <166326219630.3388898.12882473157184946072.stgit@omen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/9/22 19:18, Alex Williamson wrote:
> On error, vfio_get_iommu_info() frees and clears *info, but
> vfio_connect_container() continues to use the pointer regardless
> of the return value.  Restructure the code such that a failure
> of this function triggers an error and clean up the remainder of
> the function, including updating an outdated comment that had
> drifted from its relevant line of code and using host page size
> for a default for better compatibility on non-4KB systems.
> 
> Reported-by: Nicolin Chen <nicolinc@nvidia.com>
> Link: https://lore.kernel.org/all/20220910004245.2878-1-nicolinc@nvidia.com/
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>   hw/vfio/common.c |   36 +++++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
> 
> Turns out I had the errno vs ret correct the first time from the
> thread in the above Link, vfio_get_iommu_info() returns -errno.
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9ba1..6b5d8c0bf694 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -2111,29 +2111,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>       {
>           struct vfio_iommu_type1_info *info;
>   
> -        /*
> -         * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
> -         * IOVA whatsoever.  That's not actually true, but the current
> -         * kernel interface doesn't tell us what it can map, and the
> -         * existing Type1 IOMMUs generally support any IOVA we're
> -         * going to actually try in practice.
> -         */
>           ret = vfio_get_iommu_info(container, &info);
> +        if (ret) {
> +            error_setg_errno(errp, -ret, "Failed to get VFIO IOMMU info");
> +            goto enable_discards_exit;
> +        }
>   
> -        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
> -            /* Assume 4k IOVA page size */
> -            info->iova_pgsizes = 4096;
> +        if (info->flags & VFIO_IOMMU_INFO_PGSIZES) {
> +            container->pgsizes = info->iova_pgsizes;
> +        } else {
> +            container->pgsizes = qemu_real_host_page_size();
>           }
> -        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
> -        container->pgsizes = info->iova_pgsizes;
>   
> -        /* The default in the kernel ("dma_entry_limit") is 65535. */
> -        container->dma_max_mappings = 65535;
> -        if (!ret) {
> -            vfio_get_info_dma_avail(info, &container->dma_max_mappings);
> -            vfio_get_iommu_info_migration(container, info);
> +        if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
> +            container->dma_max_mappings = 65535;
>           }
> +        vfio_get_iommu_info_migration(container, info);
>           g_free(info);
> +
> +        /*
> +         * FIXME: We should parse VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
> +         * information to get the actual window extent rather than assume
> +         * a 64-bit IOVA address space.
> +         */
> +        vfio_host_win_add(container, 0, (hwaddr)-1, container->pgsizes);
> +
>           break;
>       }
>       case VFIO_SPAPR_TCE_v2_IOMMU:
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>




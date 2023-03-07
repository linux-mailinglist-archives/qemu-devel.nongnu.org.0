Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B16AE040
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:20:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXEL-0007UL-4I; Tue, 07 Mar 2023 08:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZXEE-0007Nb-FT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZXEC-0001LM-U6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678195176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTpIV1Z/WF9EsPj/oDCvYj8AfwzgjxeszHmcKe3Ps2E=;
 b=c5gO8VZ3oxIq4FXva+PRl8/OwU/5AaaTOAT9+HpJGlWS3LmocIdi+vcraPZvuZlNhujtFe
 gWMpXmewMgzo97LyjXbU4UJzI+WtM/EQoWR/OUDf+vco1Nwu365wiu/7a61YMK1aO2J7WU
 ae8GalwWS1LYzDEIMEXKdaiCpWGFybU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-YS50vz4YNXyp4or5L5-8oA-1; Tue, 07 Mar 2023 08:19:32 -0500
X-MC-Unique: YS50vz4YNXyp4or5L5-8oA-1
Received: by mail-wr1-f70.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so2188846wrz.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTpIV1Z/WF9EsPj/oDCvYj8AfwzgjxeszHmcKe3Ps2E=;
 b=UXqwk7Iht6Dt2MRDgv0Q4ZbDE32ojsAhQbcj4XNvnKUht4/yeeJfpY1aw+d/715p4l
 jTiVEOrOyZ26SZMvaOaO+Bkm4NqwTd4qeCssafu+0kwoe6iAwY+lMe0gpFfvpPUczuXh
 vH7x4lPQKZe8y73XUo8oGcZo1uTKS3Z9iNNBX689OpRmF5U4wPKO4XMYipECQfCYeqKA
 Jr0BpNuadZIK8uyQ7rd0rXl0QgOcAWDs+Ilf6SiwMN+PjZ5avRCCazZ9efgPtHEWxyf+
 i5PcJdDiECeCCsLZi8I3PXyqschRmvt7WsTmr6ReJ7ITPRRKnDDP5cmu4yQraADfaiwJ
 Luzg==
X-Gm-Message-State: AO0yUKX/1pRsGJEBqhktuaTxhPaqFdqsmzmIr/Jn4QN3b6lfOmCNPK8Q
 rOc9/IFBkS+bKw3fVt5rphtW0BN8XUx3ByWpvEVvCZLhK/2ZG4z7lreJn2peN6prHJl0qOTMDdw
 zFAjS+rdO6RYyY+U=
X-Received: by 2002:a05:600c:a46:b0:3ea:dc1b:90c with SMTP id
 c6-20020a05600c0a4600b003eadc1b090cmr12411194wmq.20.1678195171923; 
 Tue, 07 Mar 2023 05:19:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+mXLbSVfAJK3WK2QeQce8SpsEjC59IfQBmB+vhAv55oKG9RA7l0n/2RVXrY85ha1RNs4QNHQ==
X-Received: by 2002:a05:600c:a46:b0:3ea:dc1b:90c with SMTP id
 c6-20020a05600c0a4600b003eadc1b090cmr12411177wmq.20.1678195171660; 
 Tue, 07 Mar 2023 05:19:31 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-96.web.vodafone.de.
 [109.43.177.96]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c2e8800b003e2066a6339sm13181260wmn.5.2023.03.07.05.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:19:31 -0800 (PST)
Message-ID: <06dc5ec1-9ccc-50a0-d80f-1c67f6147f0b@redhat.com>
Date: Tue, 7 Mar 2023 14:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2 3/5] memory: introduce
 memory_region_unmap_iommu_notifier_range()
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 lvivier@redhat.com
References: <20230223065924.42503-1-jasowang@redhat.com>
 <20230223065924.42503-4-jasowang@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230223065924.42503-4-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/02/2023 07.59, Jason Wang wrote:
> This patch introduces a new helper to unmap the range of a specific
> IOMMU notifier.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   include/exec/memory.h | 10 ++++++++++
>   softmmu/memory.c      | 13 +++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 2e602a2fad..6fa0b071f0 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1731,6 +1731,16 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
>   void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>                                       IOMMUTLBEvent *event);
>   
> +/**
> + * memory_region_unmap_iommu_notifier_range: notify a unmap for an IOMMU
> + *                                           translation that covers the
> + *                                           range of a notifier
> + *
> + * @notifier: the notifier to be notified
> + */
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);

FWIW, this causes warning during the build process for me now:

../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'

  Thomas



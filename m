Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC548C0CD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:15:52 +0100 (CET)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZjT-0006UD-2S
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:15:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZeV-0002xa-AZ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZeR-0008Si-7J
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641978636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jt02sQiMWYtXrdZqZ2Xpfh3RtJY9fEWO+w2k7xLWZVw=;
 b=ARhr6rD/L4OIhBRUDnWhJK5cBKeEtU2TS+e/DAc59UuOEGBp+O64bMoJz3fvR5nibt2N6h
 iOlM7N3cXdQYnbWCREZh3dz/g0c4X8DZF0bgAdEjbcYkAvR1FWgwv6STJaH8uViEsuzHg6
 w90OTYvcSQ+7KPVlpbVNcYHy8hccw+E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-4wrp1S--N6KREBUjUYB6XA-1; Wed, 12 Jan 2022 04:10:35 -0500
X-MC-Unique: 4wrp1S--N6KREBUjUYB6XA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o20-20020a056402439400b003f83cf1e472so1668812edc.18
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 01:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Jt02sQiMWYtXrdZqZ2Xpfh3RtJY9fEWO+w2k7xLWZVw=;
 b=wOFrhP8sZXY8o34tF/G1+XegLE7aiqGuiFmk0uWseQkOu0nW4g+eRQkXYedZKn4cNy
 sW4NXjSbO8aSxRCofh7yyPNPfX7gjMDn0dMbUkiMpeCA4B+6b4WZLjRp8tMCJJZ95WSS
 B+ZkXOko2iU59YZRxudVXzoB04LiAgCUHcMjWRXGpBoqcNKc8kLWbWbCbXk5WyOtg9Kt
 vqHkwikmg9iDn/DGgNPXEnj7KvVC4nF1ngdqf8nvmFigbNPSqyy7u4ArLzCOcRyzkxC+
 nqZY8402fdB7q880IRrjxhqJch+hArLgMCU7MU7eTTySDiiFgrPUFars7xSmArfbSWwJ
 lc6w==
X-Gm-Message-State: AOAM531hdobNo2uTMTJgKjM2pcrK2jOQluOHMhMhrc2th6FPpP+UIpDG
 ofQuC4cPoF4FJjtvK6DCaWfDuwqtf/NyF6dzx28i6YtA87Vml57DOT59zxGpOl1jpJS+h/S6ZuO
 SdHrjyeTQPwu+Tz8=
X-Received: by 2002:a17:906:c155:: with SMTP id
 dp21mr4042769ejc.716.1641978634509; 
 Wed, 12 Jan 2022 01:10:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEg2OGGbPu8+3mRcZWCk5qD5GaHpmcLbc3ZkVwUsX+6g0mL2DO8gJ4PJoaNBT10r04IlgtMw==
X-Received: by 2002:a17:906:c155:: with SMTP id
 dp21mr4042752ejc.716.1641978634309; 
 Wed, 12 Jan 2022 01:10:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id 18sm4294093ejo.8.2022.01.12.01.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 01:10:33 -0800 (PST)
Message-ID: <4637307d-1a54-e51c-8da5-835b7d728ddb@redhat.com>
Date: Wed, 12 Jan 2022 10:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 09/10] hw/dma: Move ScatterGatherEntry / QEMUSGList
 declarations around
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-10-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220111184309.28637-10-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.01.22 19:43, Philippe Mathieu-Daudé wrote:
> In the next commit we will use the dma_addr_t type in the QEMUSGList
> structure. Since currently dma_addr_t is defined after QEMUSGList,
> move the declarations to have dma_addr_t defined first. This is a
> pure code-movement patch.

Oh, that was the underlying reason for the movement. Anyhow, this
certainly makes the next patch easier to review

Reviewed-by: David Hildenbrand <david@redhat.com>

> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/dma.h | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index 0db2478a506..c992d9d5d6b 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -15,22 +15,11 @@
>  #include "block/block.h"
>  #include "block/accounting.h"
>  
> -typedef struct ScatterGatherEntry ScatterGatherEntry;
> -
>  typedef enum {
>      DMA_DIRECTION_TO_DEVICE = 0,
>      DMA_DIRECTION_FROM_DEVICE = 1,
>  } DMADirection;
>  
> -struct QEMUSGList {
> -    ScatterGatherEntry *sg;
> -    int nsg;
> -    int nalloc;
> -    size_t size;
> -    DeviceState *dev;
> -    AddressSpace *as;
> -};
> -
>  /*
>   * When an IOMMU is present, bus addresses become distinct from
>   * CPU/memory physical addresses and may be a different size.  Because
> @@ -43,6 +32,17 @@ typedef uint64_t dma_addr_t;
>  #define DMA_ADDR_BITS 64
>  #define DMA_ADDR_FMT "%" PRIx64
>  
> +typedef struct ScatterGatherEntry ScatterGatherEntry;
> +
> +struct QEMUSGList {
> +    ScatterGatherEntry *sg;
> +    int nsg;
> +    int nalloc;
> +    size_t size;
> +    DeviceState *dev;
> +    AddressSpace *as;
> +};
> +
>  static inline void dma_barrier(AddressSpace *as, DMADirection dir)
>  {
>      /*


-- 
Thanks,

David / dhildenb



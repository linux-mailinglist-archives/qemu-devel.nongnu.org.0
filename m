Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAEF489470
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:56:59 +0100 (CET)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qU6-0004qr-8K
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:56:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qMt-0006Nc-8x
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qMr-0006p0-PV
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mie9Z1LK8q6fk8q/ki1382WqRaqKFAay0xmoDmHaznQ=;
 b=GX4u072VHTQnsKNkNg0+MAmCCrJ8xErfHaSOFllUFUj2rTKxRATozHOgxr85h1o+tT+eJB
 BT0l6HxET1EpLD2oqBAvvA5WTFip7cmp07WAffuDYPny+oIjDH25ajqYUI3eHV8LJErl0c
 LYePSdv61n0vGjc1PpgtiwTxV1H3RoY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-PVvztcccNrai91dbTKeZYg-1; Mon, 10 Jan 2022 03:49:28 -0500
X-MC-Unique: PVvztcccNrai91dbTKeZYg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so9577176edc.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mie9Z1LK8q6fk8q/ki1382WqRaqKFAay0xmoDmHaznQ=;
 b=0yLQFeuDWaZHoavoIObVW6YYZOXcGtzr6QqYsRgBCuX6ds0jfPsGg1qJSV+EvCGFv4
 Q4pmGeZRRgNSknBZWihC4GSK6+EXHTnowIqvTEJf0seVGxLMWixiVQ59J7sEf6g20DZ1
 oqD+m3cNwSDFhXn4GPF3b8KiRpxWI8cMSKWax0f8lePwebetphHbQMBxZHjrbL+gOzcZ
 kLxI0u1XQ9u9z2Am9NFzTPiZAhMeosresx0QESvNHpjR+yCTPJ8bp/XvYRBgzKRDudgV
 sxJW+qP8RaeOjpafB2eKw8WIAVjs8TZv4HpiL5F+S8uOlYxneOwpwwjfn4WcwGmWP7r7
 6ciA==
X-Gm-Message-State: AOAM532PKn9bnW9IOuCZtwzkxGzkOL4NTlCBuekkgnLvHKXWkTyDLos7
 7WhWORV4Eehj6ZPu6vpaPKMtIUpWqnfXL0X5G5dY6J3UHGmAhiGONWIPpPYrpd7FMk2cD0luw0D
 gWf/rokfGmKnc1fY=
X-Received: by 2002:a17:906:f01:: with SMTP id
 z1mr29137490eji.346.1641804566961; 
 Mon, 10 Jan 2022 00:49:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWIbqu8t/Gu1vTr6c1wuB0SlI+I0IlWDwNapyDzu9eRML0wTxcXkoLQ3DlbsZPzRpK18m89g==
X-Received: by 2002:a17:906:f01:: with SMTP id
 z1mr29137458eji.346.1641804566674; 
 Mon, 10 Jan 2022 00:49:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id gs14sm2161909ejc.183.2022.01.10.00.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:49:26 -0800 (PST)
Message-ID: <41b42506-672b-9480-c18d-a07ba67e01d3@redhat.com>
Date: Mon, 10 Jan 2022 09:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 8/9] hw/dma: Use dma_addr_t type definition when
 relevant
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-9-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-9-f4bug@amsat.org>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Update the obvious places where dma_addr_t should be used
> (instead of uint64_t, hwaddr, size_t, int32_t types).
> 
> This allows to have &dma_addr_t type portable on 32/64-bit
> hosts.
> 
> Move QEMUSGList declaration after dma_addr_t declaration
> so this structure can use the new type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/dma.h  | 22 +++++++++++-----------
>  hw/nvme/ctrl.c        |  2 +-
>  hw/rdma/rdma_utils.c  |  2 +-
>  hw/scsi/megasas.c     | 10 +++++-----
>  softmmu/dma-helpers.c |  6 +++---
>  5 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index 0db2478a506..7a8ae4fcd0b 100644
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
> +    dma_addr_t size;
> +    DeviceState *dev;
> +    AddressSpace *as;
> +};

Changing one member while moving is sneaky. Why the move in this patch?

Apart from that and Peters comment

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



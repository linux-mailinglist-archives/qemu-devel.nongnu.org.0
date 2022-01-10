Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35764894C5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:11:11 +0100 (CET)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qhq-0006Kk-Tp
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qcq-0008OX-3w; Mon, 10 Jan 2022 04:06:01 -0500
Received: from [2a00:1450:4864:20::435] (port=35792
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qco-0001AX-LK; Mon, 10 Jan 2022 04:05:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id e9so23874726wra.2;
 Mon, 10 Jan 2022 01:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DfO1BLK1lj7tMd5+xj+O9GnUcdWX/MIBoxgXmAPI9/w=;
 b=iaLcA4RFkRCvz3tVvGGP7c1mWlPQeTUlOZtmRBWmW4mFiuI0/TdXRnuseqlBeTeeVe
 mKuMgPfY1rp9Q8YfFG38YpZiPfGwht+6JDps0FLm+axhrc85cgCkgpamjgSNYFpPvWxp
 6l0lyNO6nVEJeE2DBjT6iZ+0b/i6dH9uD5K2OdUDidjMwb7N9iUCigEcwJFGxO+OdMBj
 df9Nh4P2ozoYkFtluqmMWOgex7ViHl0OCZoG7SRZP5eDnSt0Wu/MfjTTFJZnxRW/lboN
 ee87VZPdBJYJxL+gFz86GeVDFiVA7hrhyuCxHFyZUuvnm6oEVf5apOJeJ4n3JWCKOGGC
 9eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DfO1BLK1lj7tMd5+xj+O9GnUcdWX/MIBoxgXmAPI9/w=;
 b=vM1xP2JmsNMowYSaqmQN78lbq1kg+yDibh74qb880ddNNTZ1cIFIA59zhbNwYTJytR
 LJRR9RwnGczGLQTEj/iewNcjabiz5wG8OYM4aehhaE6sivzEg2P9ig0U7Vaq/q9vU075
 h7dkCkvfKFadwLPYdZ5KxpGBZMiFKJip+0jsqMJ0wud6UfRmHeYj7JyjjFy630kXRGbi
 IXnpVy0baMyQsliIjOlshF7vkwdEoCQG2kyqxt/S0gOKclbCA5oxCBYfKVW0w4YQNwQj
 F0QcGgRXBznaOH3nGgL/aq0c+BB95ttDlhgsXRjAAEhhM92KtLo2zfzrLCMxoC68c74+
 z5NQ==
X-Gm-Message-State: AOAM532dfWPSkzDmSiljm2VzXdYvM7138Alt+wAsjjIpKk3DZgzZXG+k
 LP3BtUC8TJ8R854Imyytt6o=
X-Google-Smtp-Source: ABdhPJxdTA4y7XaeT48vYuO0uTN9A/gEnTazZ5/uR8yWN4078I6gpaTD5piIUDLrlrI31aT/9nOevg==
X-Received: by 2002:a5d:4047:: with SMTP id w7mr5714709wrp.519.1641805556879; 
 Mon, 10 Jan 2022 01:05:56 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id q6sm6140284wrr.88.2022.01.10.01.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:05:56 -0800 (PST)
Message-ID: <bf4c1a41-d9c7-7704-8283-0b070c2bc316@amsat.org>
Date: Mon, 10 Jan 2022 10:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 8/9] hw/dma: Use dma_addr_t type definition when
 relevant
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-9-f4bug@amsat.org>
 <41b42506-672b-9480-c18d-a07ba67e01d3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <41b42506-672b-9480-c18d-a07ba67e01d3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/22 09:49, David Hildenbrand wrote:
> On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Update the obvious places where dma_addr_t should be used
>> (instead of uint64_t, hwaddr, size_t, int32_t types).
>>
>> This allows to have &dma_addr_t type portable on 32/64-bit
>> hosts.
>>
>> Move QEMUSGList declaration after dma_addr_t declaration
>> so this structure can use the new type.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/sysemu/dma.h  | 22 +++++++++++-----------
>>  hw/nvme/ctrl.c        |  2 +-
>>  hw/rdma/rdma_utils.c  |  2 +-
>>  hw/scsi/megasas.c     | 10 +++++-----
>>  softmmu/dma-helpers.c |  6 +++---
>>  5 files changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
>> index 0db2478a506..7a8ae4fcd0b 100644
>> --- a/include/sysemu/dma.h
>> +++ b/include/sysemu/dma.h
>> @@ -15,22 +15,11 @@
>>  #include "block/block.h"
>>  #include "block/accounting.h"
>>  
>> -typedef struct ScatterGatherEntry ScatterGatherEntry;
>> -
>>  typedef enum {
>>      DMA_DIRECTION_TO_DEVICE = 0,
>>      DMA_DIRECTION_FROM_DEVICE = 1,
>>  } DMADirection;
>>  
>> -struct QEMUSGList {
>> -    ScatterGatherEntry *sg;
>> -    int nsg;
>> -    int nalloc;
>> -    size_t size;
>> -    DeviceState *dev;
>> -    AddressSpace *as;
>> -};
>> -
>>  /*
>>   * When an IOMMU is present, bus addresses become distinct from
>>   * CPU/memory physical addresses and may be a different size.  Because
>> @@ -43,6 +32,17 @@ typedef uint64_t dma_addr_t;
>>  #define DMA_ADDR_BITS 64
>>  #define DMA_ADDR_FMT "%" PRIx64
>>  
>> +typedef struct ScatterGatherEntry ScatterGatherEntry;
>> +
>> +struct QEMUSGList {
>> +    ScatterGatherEntry *sg;
>> +    int nsg;
>> +    int nalloc;
>> +    dma_addr_t size;
>> +    DeviceState *dev;
>> +    AddressSpace *as;
>> +};
> 
> Changing one member while moving is sneaky. Why the move in this patch?

Because dma_addr_t is declared before QEMUSGList. I will add an
intermediate patch.

> Apart from that and Peters comment
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks (Peter's comment addressed).


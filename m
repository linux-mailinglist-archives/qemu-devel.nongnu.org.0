Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479F3DE823
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:16:39 +0200 (CEST)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApbK-0000HZ-7W
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mApZr-00076s-3z
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:15:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mApZp-0003Dy-Cu
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627978504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USQyxxWu6oDZ/xQwExDNksz46YeG05eHN22xdjDcljE=;
 b=M3RqJtiDTNbXDNvfROydts8JROAGV8tOFf4wuiaKiUJjqV8VmlaVINvvHSGpNvXeSdviBl
 IcRy5i9LnFY9NR2Yp6TRC8ReysJYLNGOgdLanxXLMGu3edp10XBMIpHjZuit80qAkMCNPP
 B0SNuxNYveI8f+ZlJa5m4TdV9HDbOqg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-hYVBpcb2O0WLtE3xIZ6nxw-1; Tue, 03 Aug 2021 04:15:03 -0400
X-MC-Unique: hYVBpcb2O0WLtE3xIZ6nxw-1
Received: by mail-pj1-f70.google.com with SMTP id
 j22-20020a17090a7e96b0290175fc969950so2256490pjl.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 01:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=USQyxxWu6oDZ/xQwExDNksz46YeG05eHN22xdjDcljE=;
 b=BGtBgJ+s4WeKlmU8ib2V7y1FlCm8H2wYZuBmZnU6IP9aneOtyhDJ3HwCHqnVe3hXal
 Hch2xzNlrc7XjBxxAVisK6iXw4fpw1DNBzMuaaa095UMu9OybsyzKjYgn23eDD76aW47
 a4zt/8/ESfVhfWVVXYu4mCa3faAEDZK+tlO5VuWHftPRN8fvnZZmufZcyCyKV8r/eziy
 tFzQRgeiI5Xj8j/Kl5N+T+/XjHFo0pFpqA3Wm3GpkiOXGFbVenSYR1pplb6PxkkmI8Mh
 2s5wTPzpH5Fx5+3CZ/C88Ix6eUTKpwobswK4mkzn4jkoygvkp3Zhe9V7iN+a1v45bv0Y
 hDzA==
X-Gm-Message-State: AOAM532yUwI+LlZfTSwOIyHFPqO88v0V3UTUWkBTXo8rvF2x9NsbbgM7
 iel58wOguGbVt3k/Ai3mx02pvL2W+fZ70nLhnxJLxPzR7wfZF3Dt/EUPmD7FAWV636ZB9ovKdGk
 B1gNpaZMyn60pbTjjXkgcQLDqT60XevzDI4caWv2noic/18n69eHnvfVvklx1VMrFH10=
X-Received: by 2002:a17:90a:ba82:: with SMTP id
 t2mr3263299pjr.143.1627978502274; 
 Tue, 03 Aug 2021 01:15:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnlyhKMTJ1AJNwPs68v5frQ5yV8d1hHtvHAxdOt1Ed1Oxl2jFHNGDbmAT86O+riH5Go+H+Dw==
X-Received: by 2002:a17:90a:ba82:: with SMTP id
 t2mr3263270pjr.143.1627978501935; 
 Tue, 03 Aug 2021 01:15:01 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d4sm14432788pfv.168.2021.08.03.01.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 01:15:01 -0700 (PDT)
Subject: Re: [PATCH] vhost: use large iotlb entry if no IOMMU translation is
 needed
To: Chao Gao <chao.gao@intel.com>
References: <20210721075402.203711-1-chao.gao@intel.com>
 <20210803042927.GA30466@gao-cwp>
 <5321eefb-7177-2009-6aae-f8c398731eac@redhat.com>
 <20210803055127.GA31303@gao-cwp>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <950f83e5-cc48-17b2-4509-902ecb7cc22a@redhat.com>
Date: Tue, 3 Aug 2021 16:14:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803055127.GA31303@gao-cwp>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/3 下午1:51, Chao Gao 写道:
> On Tue, Aug 03, 2021 at 12:43:58PM +0800, Jason Wang wrote:
>> 在 2021/8/3 下午12:29, Chao Gao 写道:
>>> Ping. Could someone help to review this patch?
>>>
>>> Thanks
>>> Chao
>>>
>>> On Wed, Jul 21, 2021 at 03:54:02PM +0800, Chao Gao wrote:
>>>> If guest enables IOMMU_PLATFORM for virtio-net, severe network
>>>> performance drop is observed even if there is no IOMMU.
>>
>> We see such reports internally and we're testing a patch series to disable
>> vhost IOTLB in this case.
>>
>> Will post a patch soon.
> OK. put me in the CC list. I would like to test with TDX to ensure your patch
> fix the performance issue I am facing.


Sure.


>
>>
>>
>>>>    And disabling
>>>> vhost can mitigate the perf issue. Finally, we found the culprit is
>>>> frequent iotlb misses: kernel vhost-net has 2048 entries and each
>>>> entry is 4K (qemu uses 4K for i386 if no IOMMU); vhost-net can cache
>>>> translations for up to 8M (i.e. 4K*2048) IOVAs. If guest uses >8M
>>>> memory for DMA, there are some iotlb misses.
>>>>
>>>> If there is no IOMMU or IOMMU is disabled or IOMMU works in pass-thru
>>>> mode, we can optimistically use large, unaligned iotlb entries instead
>>>> of 4K-aligned entries to reduce iotlb pressure.
>>
>> Instead of introducing new general facilities like unaligned IOTLB entry. I
>> wonder if we optimize the vtd_iommu_translate() to use e.g 1G instead?
> using 1G iotlb entry looks feasible.


Want to send a patch?


>
>>      } else {
>>          /* DMAR disabled, passthrough, use 4k-page*/
>>          iotlb.iova = addr & VTD_PAGE_MASK_4K;
>>          iotlb.translated_addr = addr & VTD_PAGE_MASK_4K;
>>          iotlb.addr_mask = ~VTD_PAGE_MASK_4K;
>>          iotlb.perm = IOMMU_RW;
>>          success = true;
>>      }
>>
>>
>>>>    Actually, vhost-net
>>>> in kernel supports unaligned iotlb entry. The alignment requirement is
>>>> imposed by address_space_get_iotlb_entry() and flatview_do_translate().
>>
>> For the passthrough case, is there anyway to detect them and then disable
>> device IOTLB in those case?
> yes. I guess so; qemu knows the presence and status of iommu. Currently,
> in flatview_do_translate(), memory_region_get_iommu() tells whether a memory
> region is behind an iommu.


The issues are:

1) how to know the passthrough mode is enabled (note that passthrough 
mode doesn't mean it doesn't sit behind IOMMU)
2) can passthrough mode be disabled on the fly? If yes, we need to deal 
with them

Thanks


>
> Thanks
> Chao
>



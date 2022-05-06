Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA251D1F3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:07:47 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nms42-0005Q1-Ad
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nms1y-0003pJ-O0
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:05:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:54707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nms1v-0005xG-Ju
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651820733;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXekGyN3cl4HLiYW2oGHeizpnu98tK0hBLPQzZm6gxg=;
 b=WSZ0Tp/tM+qGPmRTEeMRCSudFVBP364IzzpPNLojKonSVXUjRAG/CR3tTmOa1pdXZsfW8z
 8AWNaq0B0kB5UWzZW73S8cCPv4ShLkYHS5Z2VfF2cRFNMZFQHqeYf84T4aA74vIAvPdh9M
 jOxE4aU93EoKQoeMud4iShiSzJ7+0D8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-_ux-MWH8PTy6eMgN1LdZMA-1; Fri, 06 May 2022 03:05:32 -0400
X-MC-Unique: _ux-MWH8PTy6eMgN1LdZMA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo827240wml.1
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bXekGyN3cl4HLiYW2oGHeizpnu98tK0hBLPQzZm6gxg=;
 b=kC4GHcO8cP6M6GHju1A+vXjim1WF9XsiAYUzZ14fwWu722hhE0zBQTZqJUR67lOUv7
 m0kDnY5C8M8UPdok7g84qbRQ/me04TJ3iBi9s2m+FvIYjEmimacG1BfWVORi940w7c2D
 UWgn/agOwPz2v8ORDl3foFBQtPRLPjIy7baY28OqCzXM83J8zEXBx6we+YTsdjFIROzT
 sZ4+UkmZcFS7YfoZZSYWakQwuqi5RJLdxN3Wlnr9kjF/z4LFE9sH2C45elvjtkBSXx55
 VqlQFXchETxWAHEDSXfxJ5v63shDjly7MMoXcVIw+hHxCBl08WamcfjELNUzd2OOdmR7
 DQpA==
X-Gm-Message-State: AOAM5308UNgm1pExvF3OzO6Ck3iGSIOMyYsAO+vK1yEUkzTTCNCv2Knx
 XLwYmqsHa0r2crP6rLBexYjytVeonMBZLJvtotATCyU3fS8hWBZUoqg30PL/a0QMOhk64dXM1IA
 CfBxQeyGAlUeRarA=
X-Received: by 2002:a7b:c0c3:0:b0:394:4c67:b9df with SMTP id
 s3-20020a7bc0c3000000b003944c67b9dfmr8569200wmh.8.1651820730836; 
 Fri, 06 May 2022 00:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPzkeMy5zndS0PzjWIMsMZJOESHG46JlPd6AY2eoDxMB76Dbb+YiqVYKuaR543nCwER42m/g==
X-Received: by 2002:a7b:c0c3:0:b0:394:4c67:b9df with SMTP id
 s3-20020a7bc0c3000000b003944c67b9dfmr8569177wmh.8.1651820730495; 
 Fri, 06 May 2022 00:05:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4688000000b0020c5253d8ecsm2820573wrq.56.2022.05.06.00.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:05:29 -0700 (PDT)
Message-ID: <019b265a-2489-c595-acd4-b1b5c1772707@redhat.com>
Date: Fri, 6 May 2022 09:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd misalignment
 warning
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
References: <20220428134945.511829-1-eric.auger@redhat.com>
 <20220428141423.6e2da84c.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220428141423.6e2da84c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.74; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/28/22 22:14, Alex Williamson wrote:
> On Thu, 28 Apr 2022 15:49:45 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> The CRB command buffer currently is a RAM MemoryRegion and given
>> its base address alignment, it causes an error report on
>> vfio_listener_region_add(). This region could have been a RAM device
>> region, easing the detection of such safe situation but this option
>> was not well received. So let's add a helper function that uses the
>> memory region owner type to detect the situation is safe wrt
>> the assignment. Other device types can be checked here if such kind
>> of problem occurs again.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - rebase on top of qemu_real_host_page_size() and
>>   qemu_real_host_page_size(). Print the size and make the message
>>   consistent
>> - Added Stefan's A-b and Connie R-b (despite the changes)
>> ---
>>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>>  hw/vfio/trace-events |  1 +
>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 2b1f78fdfa..f6b9bb6d71 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -40,6 +40,7 @@
>>  #include "trace.h"
>>  #include "qapi/error.h"
>>  #include "migration/migration.h"
>> +#include "sysemu/tpm.h"
>>  
>>  VFIOGroupList vfio_group_list =
>>      QLIST_HEAD_INITIALIZER(vfio_group_list);
>> @@ -861,6 +862,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
>>      g_free(vrdl);
>>  }
>>  
>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>> +{
>> +    MemoryRegion *mr = section->mr;
>> +
>> +    if (!TPM_IS_CRB(mr->owner)) {
>> +        return false;
>> +    }
> It looks like this test is going to need to be wrapped in #ifdef
> CONFIG_TPM:

sorry for the delay. Your message fell though the cracks :-(

if I put an '#ifdef CONFIG_TPM' I need to inverse the logic because by
default the function shall return false.

solution #1

#ifdef CONFIG_TPM  
 if (TPM_IS_CRB(mr->owner)) {

    /* this is a known safe misaligned region, just trace for debug purpose */
    trace_vfio_known_safe_misalignment(memory_region_name(mr),
                                       section->offset_within_address_space,
                                       section->offset_within_region,
                                       qemu_real_host_page_size());

    return true;
   }

#endif
return false;

This looks weird to me.

+    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {
+        return false;
+    }


solution #2
replace !object_dynamic_cast(mr->owner, TYPE_TPM_CRB) by
!object_dynamic_cast(mr->owner, "tpm-crb")
and add a comment saying that we don't use TYPE_TPM_CRB on purpose

solution #3
Move #define TPM_IS_CRB(chr) and related defined out of
#ifdef CONFIG_TPM hoping it does not have other side effects

Thoughts?
Eric
>
> https://gitlab.com/alex.williamson/qemu/-/jobs/2391952412
>
> Thanks,
>
> Alex
>
>> +
>> +    /* this is a known safe misaligned region, just trace for debug purpose */
>> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
>> +                                       section->offset_within_address_space,
>> +                                       section->offset_within_region,
>> +                                       qemu_real_host_page_size());
>> +    return true;
>> +}
>> +
>>  static void vfio_listener_region_add(MemoryListener *listener,
>>                                       MemoryRegionSection *section)
>>  {
>> @@ -884,7 +901,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>      if (unlikely((section->offset_within_address_space &
>>                    ~qemu_real_host_page_mask()) !=
>>                   (section->offset_within_region & ~qemu_real_host_page_mask()))) {
>> -        error_report("%s received unaligned region", __func__);
>> +        if (!vfio_known_safe_misalignment(section)) {
>> +            error_report("%s received unaligned region %s iova=0x%"PRIx64
>> +                         " offset_within_region=0x%"PRIx64
>> +                         " qemu_real_host_page_size=0x%"PRIxPTR,
>> +                         __func__, memory_region_name(section->mr),
>> +                         section->offset_within_address_space,
>> +                         section->offset_within_region,
>> +                         qemu_real_host_page_size());
>> +        }
>>          return;
>>      }
>>  
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 0ef1b5f4a6..582882db91 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
>>  vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>>  vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>> +vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR ": cannot be mapped for DMA"
>>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64



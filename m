Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480A48502F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:38:57 +0100 (CET)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52kx-0005H3-Vi
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:38:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n52j6-0003ey-Gu
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:37:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n52j3-0003JK-Rt
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641375416;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WVzA9BJExJuk1ssdVBduOeQo2g6GGK9eFCCncTyilM=;
 b=OgmfTjVHr2zADXmZbM4i8Lldh5wHLpkGlojxl660F5nWXlOS4ZNZNwR+p9fgduEj3DnS2h
 5quV19noHrxC7lHRl7ybQ5kppQ7zQHJWw+NrVpqjAfJdaEjb2zG3r5Ofj/IswD7LdtPjd1
 g5NdVY9j1t+1IibeBto3mxj0a9jbPao=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-eMRRBwmbN0C9sgU5IJfRLQ-1; Wed, 05 Jan 2022 04:36:55 -0500
X-MC-Unique: eMRRBwmbN0C9sgU5IJfRLQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k40-20020a05600c1ca800b00345bf554707so275808wms.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:reply-to:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4WVzA9BJExJuk1ssdVBduOeQo2g6GGK9eFCCncTyilM=;
 b=BoYMaNNWQ6R2sjf71S8dD1KEUPgo2mqLeLeDupQx8N0E4lkjxt3BV5WnlnjEdzFQfJ
 bW+XELhwYng2o3QcIGn/Aw7UylOIO4U6fOt65qy3643mERs4wMYz+7pNW7IScQfneyqS
 Zb16TVo8mtRwgb0nRMRVYHep/A5jTFVhMpfSRI/OK+XHdYqsir+tvoYDKgof+CroZCBa
 GXj9ugCId8Ra2IKeQIyicb4F3WjXjzFYnK7wMMdzR7jE9fXGtdPGEmcxdkV5ggPhqaxz
 +c2klnwErd40YkfvemEaOFqHnwdcwbdyqx/s9LkyS7ERAhERFFYEVLuG7kSvmnR4qs0o
 +YfA==
X-Gm-Message-State: AOAM532vYQ5yEOkPi7+Bq7elM6sD52p+iBW1i2OaxUjT5ctsOCFzUyxr
 ATD2dn6cngplqmJf2KMiNVYfrtKov8FYqtqnByU/Re/RaTVxdvq+adUXsknPXPUv0brhxPipCNr
 q4yO7GRPcygsQEjo=
X-Received: by 2002:a05:600c:1d07:: with SMTP id
 l7mr2134915wms.12.1641375414209; 
 Wed, 05 Jan 2022 01:36:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+iYJbw7dL4mNA5vHV3pQPLdyhZKPXbHb1/JrvElCtt4s3NbE2JDK7q/xQopwj3NdJaMx++w==
X-Received: by 2002:a05:600c:1d07:: with SMTP id
 l7mr2134906wms.12.1641375413966; 
 Wed, 05 Jan 2022 01:36:53 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n1sm43208190wri.46.2022.01.05.01.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 01:36:53 -0800 (PST)
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Honor highmem setting when computing
 the memory map
From: Eric Auger <eric.auger@redhat.com>
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20211227211642.994461-1-maz@kernel.org>
 <20211227211642.994461-4-maz@kernel.org>
 <ef8b3500-04ab-5434-6a04-0e8b1dcc65d1@redhat.com>
Message-ID: <70643d20-b954-dcc4-0dee-6457244b64e0@redhat.com>
Date: Wed, 5 Jan 2022 10:36:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef8b3500-04ab-5434-6a04-0e8b1dcc65d1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/5/22 10:22 AM, Eric Auger wrote:
> Hi Marc,
> 
> On 12/27/21 10:16 PM, Marc Zyngier wrote:
>> Even when the VM is configured with highmem=off, the highest_gpa
>> field includes devices that are above the 4GiB limit.
>> Similarily, nothing seem to check that the memory is within
>> the limit set by the highmem=off option.
>>
>> This leads to failures in virt_kvm_type() on systems that have
>> a crippled IPA range, as the reported IPA space is larger than
>> what it should be.
>>
>> Instead, honor the user-specified limit to only use the devices
>> at the lowest end of the spectrum, and fail if we have memory
>> crossing the 4GiB limit.
>>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  hw/arm/virt.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 8b600d82c1..84dd3b36fb 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1678,6 +1678,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>>          exit(EXIT_FAILURE);
>>      }
>>  
>> +    if (!vms->highmem &&
>> +        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
>> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
>> +        exit(EXIT_FAILURE);
> 
> The memory is composed of initial memory and device memory.
> device memory is put after the initial memory but has a 1GB alignment
> On top of that you have 1G page alignment per device memory slot
> 
> so potentially the highest mem address is larger than
> vms->memmap[VIRT_MEM].base + ms->maxram_size.
> I would rather do the check on device_memory_base + device_memory_size
>> +    }
>>      /*
>>       * We compute the base of the high IO region depending on the
>>       * amount of initial and device memory. The device memory start/size
>> @@ -1707,7 +1712,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>>          vms->memmap[i].size = size;
>>          base += size;
>>      }
>> -    vms->highest_gpa = base - 1;
>> +    vms->highest_gpa = (vms->highmem ?
>> +                        base :
>> +                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
> As per the previous comment this looks wrong to me if !highmem.
> 
> If !highmem, if RAM requirements are low we still could get benefit from
> REDIST2 and HIGH ECAM which could fit within the 4GB limit. But maybe we
the above assertion is wrong, sorry, as we kept the legacy mem map in
that situation (HIGH regions always put above 256 GB). So anyway we can
skip the extended memmap if !highmem.

Eric
> simply don't care? If we don't, why don't we simply skip the
> extended_memmap overlay as suggested in v2? I did not get your reply sorry.
> 
> Thanks
> 
> Eric
>>      if (device_memory_size > 0) {
>>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>>          ms->device_memory->base = device_memory_base;
> 



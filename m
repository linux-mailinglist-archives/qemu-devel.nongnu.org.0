Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABFB5F2BC7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:28:54 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGon-0000Yt-HK
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGmF-0005g9-EM
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGmB-00007k-VV
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664785570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bG41qe43rrOoQl0WNGhgNeYy5jTzK6f3UzCkNy/UEs=;
 b=JZhUbjuU69r/iSwMAK3sNCgq2FVD+yquLpDHlZryTObG2kg65XvKPqBCEG9RUquGsny8GP
 xbFt+/zW/ZxzQUd4ZzDyHbQCieqvZ2de/CZXEOeiwDQbIznXeODZuVkd8k7oCEJAB0Pxv6
 Q9PQRIwbZezn4btAONyuU9Oa2gnUu5o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-7IXtbfX-MfWcgEUjc70qZA-1; Mon, 03 Oct 2022 04:26:09 -0400
X-MC-Unique: 7IXtbfX-MfWcgEUjc70qZA-1
Received: by mail-qk1-f200.google.com with SMTP id
 h7-20020a05620a400700b006cebec84734so8716336qko.23
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=/bG41qe43rrOoQl0WNGhgNeYy5jTzK6f3UzCkNy/UEs=;
 b=KwAyvnS9MYu6PDGl+DDQ3IXdFYn0POASp17HDIK4YzQVOSfosROQz2U/8kUsK0xyxX
 boGx4KBae4rLvnY4G6/zJNWuqPck34m/IXR/s+hmQORRnEeCTj2Kz6zCRv5clCgOYrjb
 4HlKoDvU0ehhFMGUPXIjAyfUdWEcf/3ETzrLkv5zFxyyearWB1FDgkVqJlquYh+Zov53
 3NmXvVrX4LGVNg5khBmjRxZ60bybUrLVNbYN0qdJhHn9xwvTnrqTMDmO0d+ncwR+sikv
 BPS9wN2VbqiUv58WpkOfPbEhmnRekD1ZmF6wYu40VqkIIhSmJ7Qb+pay1CeJVMX/zeNZ
 4+sA==
X-Gm-Message-State: ACrzQf3GrR7JqMmA+LYrnJ9Ix0AFZf2T3AEyoXnbeYDq4YI310OISzm1
 1sY/fDmbT3NhVICl/I3ruYMt7NbznbYDHkxKKHOTR/dfXX7WeuqfETK4brKwx544ElOjicTcmZb
 XisS9EwYhG7TztJ0=
X-Received: by 2002:a05:6214:238b:b0:48a:f607:c4e0 with SMTP id
 fw11-20020a056214238b00b0048af607c4e0mr15665393qvb.44.1664785568568; 
 Mon, 03 Oct 2022 01:26:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4uCGyJlXqLGmzcvr5qHsov+I2UOA7gGnAHTKMpED6fi4AEizlU9IPI4tIqk4CDyXNu86y6uQ==
X-Received: by 2002:a05:6214:238b:b0:48a:f607:c4e0 with SMTP id
 fw11-20020a056214238b00b0048af607c4e0mr15665382qvb.44.1664785568381; 
 Mon, 03 Oct 2022 01:26:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05620a0b5600b006b5c061844fsm10261637qkg.49.2022.10.03.01.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:26:07 -0700 (PDT)
Message-ID: <c28b468c-339d-c8a2-a2f5-bb37c7562487@redhat.com>
Date: Mon, 3 Oct 2022 10:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-4-gshan@redhat.com>
 <6e1b2667-b561-51ac-57af-123a393fc677@redhat.com>
 <4e53182d-89f5-cd9e-fe71-073251bfe385@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <4e53182d-89f5-cd9e-fe71-073251bfe385@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gavin,

On 9/29/22 01:15, Gavin Shan wrote:
> Hi Eric,
>
> On 9/28/22 10:10 PM, Eric Auger wrote:
>> On 9/22/22 01:13, Gavin Shan wrote:
>>> This introduces variable 'region_base' for the base address of the
>>> specific high memory region. It's the preparatory work to optimize
>>> high memory region address assignment.
>> Why is it a preparatory work (same comment for previous patch, ie [2/5]
>> ). Are those changes really needed? why?
>>
>
> In PATCH[4/5], @base argument is added to virt_set_high_memmap(), to
> represent current global base address. With the optimization applied
> in PATCH[4/5], @base isn't unconditionally updated to the top of the
> iterated high memory region. So we need @region_base here (PATCH[3/5])
> to track the aligned base address for the iterated high memory region,
> which may or may be not updated to @base.
>
> Since we have @region_base in PATCH[3/5], it'd better to have
> @region_size
> in PATCH[2/5].
>
> Actually, PATCH[1-3/5] are all preparatory patches for PATCH[4/5]. My
> intention was to organize the patches in a way to keep the logical
> change part simple enough, for easier review.
OK fair enough

Eric
>
> Thanks,
> Gavin
>
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 187b3ee0e2..b0b679d1f4 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1692,15 +1692,15 @@ static uint64_t
>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>   static void virt_set_high_memmap(VirtMachineState *vms,
>>>                                    hwaddr base, int pa_bits)
>>>   {
>>> -    hwaddr region_size;
>>> +    hwaddr region_base, region_size;
>>>       bool fits;
>>>       int i;
>>>         for (i = VIRT_LOWMEMMAP_LAST; i <
>>> ARRAY_SIZE(extended_memmap); i++) {
>>> +        region_base = ROUND_UP(base, extended_memmap[i].size);
>>>           region_size = extended_memmap[i].size;
>>>   -        base = ROUND_UP(base, region_size);
>>> -        vms->memmap[i].base = base;
>>> +        vms->memmap[i].base = region_base;
>>>           vms->memmap[i].size = region_size;
>>>             /*
>>> @@ -1709,9 +1709,9 @@ static void
>>> virt_set_high_memmap(VirtMachineState *vms,
>>>            *
>>>            * For each device that doesn't fit, disable it.
>>>            */
>>> -        fits = (base + region_size) <= BIT_ULL(pa_bits);
>>> +        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>>>           if (fits) {
>>> -            vms->highest_gpa = base + region_size - 1;
>>> +            vms->highest_gpa = region_base + region_size - 1;
>>>           }
>>>             switch (i) {
>>> @@ -1726,7 +1726,7 @@ static void
>>> virt_set_high_memmap(VirtMachineState *vms,
>>>               break;
>>>           }
>>>   -        base += region_size;
>>> +        base = region_base + region_size;
>>>       }
>>>   }
>>>   
>>
>



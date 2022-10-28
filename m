Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D12610D40
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:31:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLgJ-0005MX-Gf; Fri, 28 Oct 2022 05:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooLgH-0005Li-Q4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:29:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooLgG-0008RA-3U
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:29:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so3294734wmb.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4pcX4DEX6sCEDtbQNzQNLM2H95FeAnRtPk5gmYa9K6Q=;
 b=RoCdOc36jSMHDzovSbwIbyywnRR4dCMGJbXf8tVM311AaDQFuBk4aJYv0yNbxCIoVx
 coHWWKGuI4ZKoOd7w+UaA+KMGXh8yljNMfhoQp0smHasr0WcHrqytYTCZYJYVy1J71sj
 aCBymc/0bXVuogl/dsBa1jN5TV0QDiBwS3Z7kvUKrQMLgDzccpq0LNFW1/RZv34Q3bEJ
 jghtF+V63UEopvmjKqwCqG03wigjuplM6yhgtbp+btfQwveXksYRHxSkYIuTkxq8mnwN
 3R8Nw/El38fBB/bVOv8jTWclU13HSqE4Ui3V+9Ewr9LfvkpuGIti1LbviVTIYO7AuQqS
 zUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pcX4DEX6sCEDtbQNzQNLM2H95FeAnRtPk5gmYa9K6Q=;
 b=3uIBJthb0l0QS2DzoLcCVpWFieNKXUDC9H+3b8jdqQoTt49lZvGRXh7x3bcuKel/oq
 Ru56Zs89UT7JBvXZz8HwOv5oOuvRt7/lFrUAWuUjjDtU7WNINlWpP4++mqKQwRT44V94
 fic5t0KUoxYxMv5bg2kADGKuDxK3efT1EnCoHldALLRtIDhakWjEL0uXNhd9v/nbtsn5
 eakxRNFNf4oCdb9vqq1BPDz/oktEILC9w8Jx7NtKyWpwuUb1aGXoftfdW4doYo3u9zi+
 7Cp0OAoQabqMmkCDFIhxs0FD5lZo6DteCjs9PI9OIbOb+mmcJAoMSorVChMm1fBIZq/F
 mnSw==
X-Gm-Message-State: ACrzQf0KoblP0gAD5oymm0ATHNdmS27X+pB0mOV4L4+zHPw6QJUYyew8
 Ka6Tn44dS/xd6CpCIBSwLyiESg==
X-Google-Smtp-Source: AMsMyM7NT9sLAdFJD0SSQd2U7Icgd4pddLu9r4cblvV/5pizHKbEyiOuJvd6jQ4KzHsCDxxnwsSMzw==
X-Received: by 2002:a05:6000:1886:b0:22e:3921:fdc2 with SMTP id
 a6-20020a056000188600b0022e3921fdc2mr34563906wri.565.1666949374444; 
 Fri, 28 Oct 2022 02:29:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c35ca00b003cf4ec90938sm4104359wmq.21.2022.10.28.02.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 02:29:33 -0700 (PDT)
Message-ID: <aeda8a0a-a934-e6af-6d05-4835d1f3294a@linaro.org>
Date: Fri, 28 Oct 2022 11:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] memory: Fix wrong end address dump
Content-Language: en-US
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>
References: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
 <67dedbad-9d24-2c8d-f8a7-98e5387b89ae@redhat.com>
 <MWHPR1101MB211099D9C22D0FDFAC43554292329@MWHPR1101MB2110.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <MWHPR1101MB211099D9C22D0FDFAC43554292329@MWHPR1101MB2110.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 04:19, Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: David Hildenbrand <david@redhat.com>
>> Sent: Friday, July 22, 2022 2:44 PM
>> To: Duan, Zhenzhong <zhenzhong.duan@intel.com>; qemu-
>> devel@nongnu.org
>> Cc: pbonzini@redhat.com; peterx@redhat.com; f4bug@amsat.org
>> Subject: Re: [PATCH] memory: Fix wrong end address dump
>>
>> On 22.06.22 11:59, Zhenzhong Duan wrote:
>>> The end address of memory region section isn't correctly calculated
>>> which leads to overflowed mtree dump:
>>>
>>>    Dispatch
>>>      Physical sections
>>>        ......
>>>        #70 @0000000000002000..0000000000011fff io [ROOT]
>>>        #71 @0000000000005000..0000000000005fff (noname)
>>>        #72 @0000000000005000..0000000000014fff io [ROOT]
>>>        #73 @0000000000005658..0000000000005658 vmport
>>>        #74 @0000000000005659..0000000000015658 io [ROOT]
>>>        #75 @0000000000006000..0000000000015fff io [ROOT]
>>>
>>> After fix:
>>>        #70 @0000000000002000..0000000000004fff io [ROOT]
>>>        #71 @0000000000005000..0000000000005fff (noname)
>>>        #72 @0000000000005000..0000000000005657 io [ROOT]
>>>        #73 @0000000000005658..0000000000005658 vmport
>>>        #74 @0000000000005659..0000000000005fff io [ROOT]
>>>        #75 @0000000000006000..000000000000ffff io [ROOT]
>>>
>>> Fixes: 5e8fd947e2670 ("memory: Rework "info mtree" to print flat views
>>> and dispatch trees")
>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>> ---
>>>   softmmu/physmem.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c index
>>> 214cb04c8fc3..cbabd10ac0bf 100644
>>> --- a/softmmu/physmem.c
>>> +++ b/softmmu/physmem.c
>>> @@ -3701,7 +3701,7 @@ void mtree_print_dispatch(AddressSpaceDispatch
>> *d, MemoryRegion *root)
>>>                       " %s%s%s%s%s",
>>>               i,
>>>               s->offset_within_address_space,
>>> -            s->offset_within_address_space + MR_SIZE(s->mr->size),
>>> +            s->offset_within_address_space + MR_SIZE(s->size),
>>>               s->mr->name ? s->mr->name : "(noname)",
>>>               i < ARRAY_SIZE(names) ? names[i] : "",
>>>               s->mr == root ? " [ROOT]" : "",
>>
>> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>> I assume this should get picked up soonish.
> Hi Maintainers,
> 
> Can this patch be considered merged as it got reviewed-by and no objection for a long time. Thanks.

That dropped through the cracks, sorry.

Paolo, except if you are planning another PR before soft-freeze, I'm
queuing this single patch via the mips-next PR I'm backing.

Thanks,

Phil.


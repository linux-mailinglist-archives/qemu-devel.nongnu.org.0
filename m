Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73922537A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:19:27 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveMo-0006jh-9M
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nvdiS-0000KK-0C
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:37:44 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nvdiL-00037w-4G
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:37:40 -0400
Received: by mail-pg1-x532.google.com with SMTP id s68so9902317pgs.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oTn7xiqfMVG/Ets8BTsPYZb54RZ76weVWzmNwY5pPOo=;
 b=Sh2IF70NIweZY1YxFBbcJj+h+93R3gV45P301sqtBAYvTC1LNCDTVqNx/GSSKFseWa
 036lnyaVMqBdidXXcWzlLqYbAfPD0hzUxzNox8v3xnfLv+i5LbHZhjiNZ8yWdpfNl3G3
 r4C4g95JJpHGovTumWZYkpfVmrLEopIK4AehBE72PgZl8X4XClsrN0lOOBRnalM+mC5d
 udC0XbG5Vm4ceV5WRHq5u07rZcJdbZW27bvY8sxba93MwzgTx74f1gLC1QMyximZtc/J
 RpJdnh0P03nLKATKs+sTq8cow6FQuGkrgwkTOkS8kMXQexvE3T4U5h29KV6xAdOofSnn
 Saxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oTn7xiqfMVG/Ets8BTsPYZb54RZ76weVWzmNwY5pPOo=;
 b=pZAJ/g4GkKA0JT+oiZ8aYL3GBDXavgpUrVEdD82jQCCxXpSDJ5kYNplCOuLIUj28bv
 PGYa2Ikh9YgcoKc0RI7r/UL5xqdudCBC2/Yb17ZWpfUNf+b654wlbz0aC3vQBHK0NOxS
 0XcM275BiOM39r8MlEu0glJWlgTJeZlyl2KS3lw0APY1YJLJuydIWQsk4qCQJ3VKwIB0
 i+28CRRs0dofyZIffrEzQnzmWTCk0U1BpHfFfuIWgopqsnDQxD9oyEmjoGVz59Qu/WW2
 9RobGZPx8E++SGCibbCXjUNM8ap04hUri/cl09oDT/LkE/MYY0+GMnQNKoYS1dzumLOl
 620g==
X-Gm-Message-State: AOAM530npCscqnF8uE+BbofuMMz5i0T1DYQAAPqMKE4/C+B41Vknh0bG
 whU0qOc9GgrSjRBdQY+jKcqI9w==
X-Google-Smtp-Source: ABdhPJzonQ9UZ2K3KajjLc5t3cYmEGAE0YbTTOskwZ6mVqc54jbu+C/Juy1kTZLlt6QZEc2VPOnxMQ==
X-Received: by 2002:a65:618e:0:b0:3fb:177f:d365 with SMTP id
 c14-20020a65618e000000b003fb177fd365mr17788413pgv.265.1653910655546; 
 Mon, 30 May 2022 04:37:35 -0700 (PDT)
Received: from [10.255.89.136] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a17090a718100b001e2608203d4sm4426742pjk.5.2022.05.30.04.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 04:37:34 -0700 (PDT)
Message-ID: <4b0c3e37-b882-681a-36fc-16cee7e1fff0@bytedance.com>
Date: Mon, 30 May 2022 19:33:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jue Wang <juew@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, jasowang@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com, =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?=
 <naoya.horiguchi@nec.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
 <Yo/I3oLkd9OU0ice@xz-m1.local>
 <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
 <0d266c61-605d-ce0c-4274-b0c7e10f845a@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <0d266c61-605d-ce0c-4274-b0c7e10f845a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/30/22 15:41, David Hildenbrand wrote:
> On 27.05.22 08:32, zhenwei pi wrote:
>> On 5/27/22 02:37, Peter Xu wrote:
>>> On Wed, May 25, 2022 at 01:16:34PM -0700, Jue Wang wrote:
>>>> The hypervisor _must_ emulate poisons identified in guest physical
>>>> address space (could be transported from the source VM), this is to
>>>> prevent silent data corruption in the guest. With a paravirtual
>>>> approach like this patch series, the hypervisor can clear some of the
>>>> poisoned HVAs knowing for certain that the guest OS has isolated the
>>>> poisoned page. I wonder how much value it provides to the guest if the
>>>> guest and workload are _not_ in a pressing need for the extra KB/MB
>>>> worth of memory.
>>>
>>> I'm curious the same on how unpoisoning could help here.  The reasoning
>>> behind would be great material to be mentioned in the next cover letter.
>>>
>>> Shouldn't we consider migrating serious workloads off the host already
>>> where there's a sign of more severe hardware issues, instead?
>>>
>>> Thanks,
>>>
>>
>> I'm maintaining 1000,000+ virtual machines, from my experience:
>> UE is quite unusual and occurs randomly, and I did not hit UE storm case
>> in the past years. The memory also has no obvious performance drop after
>> hitting UE.
>>
>> I hit several CE storm case, the performance memory drops a lot. But I
>> can't find obvious relationship between UE and CE.
>>
>> So from the point of my view, to fix the corrupted page for VM seems
>> good enough. And yes, unpoisoning several pages does not help
>> significantly, but it is still a chance to make the virtualization better.
>>
> 
> I'm curious why we should care about resurrecting a handful of poisoned
> pages in a VM. The cover letter doesn't touch on that.
> 
> IOW, I'm missing the motivation why we should add additional
> code+complexity to unpoison pages at all.
> 
> If we're talking about individual 4k pages, it's certainly sub-optimal,
> but does it matter in practice? I could understand if we're losing
> megabytes of memory. But then, I assume the workload might be seriously
> harmed either way already?
> 

Yes, resurrecting a handful of poisoned pages does not help 
significantly. And, in some ways, it seems nice to have. :D

A VM uses RAM of 2M huge page. Once a MCE(@HVAy in [HVAx,HVAz)) occurs, 
the 2M([HVAx,HVAz)) of hypervisor becomes unaccessible, but the guest 
poisons 4K (@GPAy in [GPAx, GPAz)) only, it may hit another 511 MCE 
([GPAx, GPAz) except GPAy). This is the worse case, so I want to add
  '__le32 corrupted_pages' in struct virtio_balloon_config, it is used 
in the next step: reporting 512 * 4K 'corrupted_pages' to the guest, the 
guest has a chance to isolate the other 511 pages ahead of time. And the 
guest actually loses 2M, fixing 512*4K seems to help significantly.

> 
> I assume when talking about "the performance memory drops a lot", you
> imply that this patch set can mitigate that performance drop?
> 
> But why do you see a performance drop? Because we might lose some
> possible THP candidates (in the host or the guest) and you want to plug
> does holes? I assume you'll see a performance drop simply because
> poisoning memory is expensive, including migrating pages around on CE.
> 
> If you have some numbers to share, especially before/after this change,
> that would be great.
> 

The CE storm leads 2 problems I have even seen:
1, the memory bandwidth slows down to 10%~20%, and the cycles per 
instruction of CPU increases a lot.
2, the THR (/proc/interrupts) interrupts frequently, the CPU has to use 
a lot time to handle IRQ.

But no corrupted page occurs. Migrating VM to another healthy host seems 
a good choice. This patch does not handle CE storm case.

-- 
zhenwei pi


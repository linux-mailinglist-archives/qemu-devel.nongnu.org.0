Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143D39D614
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 09:34:34 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq9mL-0007UX-KV
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 03:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lq9lL-0006ba-T1; Mon, 07 Jun 2021 03:33:31 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lq9lJ-0005Us-FM; Mon, 07 Jun 2021 03:33:31 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MSckp-1lwR9s16M5-00SvTW; Mon, 07 Jun 2021 09:33:13 +0200
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
Date: Mon, 7 Jun 2021 09:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WPrFgPurXPB81l1CUCwBlATPJfY8s0RxJzuk5IaIW1a6YXFvZbm
 ED4+zrQidQ3cMbK/zGmmFDWAJVyajl47x5WyG7Lkd0SH+GtOLoMwxj1S87ZXsGOBRTfmszC
 e82uaF8y1ncOeVCKK40fAHFztHhpj7y/k138p1qqKBRNN6q1YcxIqJoulWMda3JUm+4JmZG
 fyqNjVVtUBC0kIBXodYvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YhuwSP+CgKY=:TpI2P074qdTMwLWYXVJjHq
 5l4ZpVP8xSANHCKHPbCQVyrH6lkn6HK/6aovN49ZzqX/+hi9VbJ7/ZXu6jUMDvaP8nOx2vYF1
 5F8PUE7M5EFqRwGk6dG17D7rJ7/11iJ5FB72pH66aosfkQwfSqphEgxdrNn3AV4nL4XjdwBLt
 tvymrbVbjSlMdCWz8nuqTHfqSuP5uRmKJd+rv/IzeY23IbMatJktHA8OeF6BPNW6jZJIslLxx
 ZKtDgYnlCvebtc8WJU1oaVZ+9NGXjiyXtqAw1H8d1gvxa926MF4fY3ZTSYS49FgRIsvBfrxib
 NJ6JHUeUwi622aTfudFuUbO9MzOx4pqTLcwN7S68izJlR69N3BqG3EVMZS5ImaztyNS71BUtq
 72bTDgVvaFiNt3/MTgvS0RPE10VknxH8bl99cw+UserWw5g+9oL5SCDe3zfX0JPPG82wHyB10
 TmgdN5X586W9rF8jYIONE/oqLRL3LLe6LYHM/E6rZLvnK3zDn60aRY/gH396KE1Ag2XDBCRN+
 jrwvwDW1s2f2GOChc3yugY=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@
> 
> On 3/18/21 4:39 PM, Philippe Mathieu-Daudé wrote:
>> ping?
>>
>> On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
>>> MemoryRegion names is cached on first call to memory_region_name(),

It is cached on first call but now that it is used in the trace function, does it mean it will be
always allocated in memory?

Thanks,
Laurent

>>> so displaying the name is trace events is cheap. Add it for read /
>>> write ops.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  softmmu/memory.c     | 12 ++++++++----
>>>  softmmu/trace-events |  4 ++--
>>>  2 files changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>> index 874a8fccdee..d4d9ab8828e 100644
>>> --- a/softmmu/memory.c
>>> +++ b/softmmu/memory.c
>>> @@ -444,7 +444,8 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
>>>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>>> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
>>> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
>>> +                                     memory_region_name(mr));
>>>      }
>>>      memory_region_shift_read_access(value, shift, mask, tmp);
>>>      return MEMTX_OK;
>>> @@ -466,7 +467,8 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
>>>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>>> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
>>> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
>>> +                                     memory_region_name(mr));
>>>      }
>>>      memory_region_shift_read_access(value, shift, mask, tmp);
>>>      return r;
>>> @@ -486,7 +488,8 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
>>>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>>> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
>>> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
>>> +                                      memory_region_name(mr));
>>>      }
>>>      mr->ops->write(mr->opaque, addr, tmp, size);
>>>      return MEMTX_OK;
>>> @@ -506,7 +509,8 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
>>>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>>> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
>>> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
>>> +                                      memory_region_name(mr));
>>>      }
>>>      return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
>>>  }
>>> diff --git a/softmmu/trace-events b/softmmu/trace-events
>>> index b80ca042e1f..359fb37cc8d 100644
>>> --- a/softmmu/trace-events
>>> +++ b/softmmu/trace-events
>>> @@ -9,8 +9,8 @@ cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>>>  cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>>>  
>>>  # memory.c
>>> -memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>> -memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>> +memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>>> +memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>>>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>>
>>
> 



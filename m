Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2E84953
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 12:21:46 +0200 (CEST)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvJ4j-0002Dv-Fa
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 06:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42775)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hvJ43-0001Ju-4u
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hvJ41-00007W-I3
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:21:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39900)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hvJ41-00006w-9d; Wed, 07 Aug 2019 06:21:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9AB9D923AD;
 Wed,  7 Aug 2019 10:21:00 +0000 (UTC)
Received: from [10.36.118.28] (unknown [10.36.118.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EADAD5D9CD;
 Wed,  7 Aug 2019 10:20:58 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190806094834.7691-1-imammedo@redhat.com>
 <20190806094834.7691-2-imammedo@redhat.com>
 <b90f1fc0-782c-b454-b999-48e88fac4cb9@redhat.com>
 <20190807115559.660f3e6c@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwX4EEwECACgFAljj9eoCGwMFCQlmAYAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEE3eEPcA/4Na5IIP/3T/FIQMxIfNzZshIq687qgG
 8UbspuE/YSUDdv7r5szYTK6KPTlqN8NAcSfheywbuYD9A4ZeSBWD3/NAVUdrCaRP2IvFyELj
 xoMvfJccbq45BxzgEspg/bVahNbyuBpLBVjVWwRtFCUEXkyazksSv8pdTMAs9IucChvFmmq3
 jJ2vlaz9lYt/lxN246fIVceckPMiUveimngvXZw21VOAhfQ+/sofXF8JCFv2mFcBDoa7eYob
 s0FLpmqFaeNRHAlzMWgSsP80qx5nWWEvRLdKWi533N2vC/EyunN3HcBwVrXH4hxRBMco3jvM
 m8VKLKao9wKj82qSivUnkPIwsAGNPdFoPbgghCQiBjBe6A75Z2xHFrzo7t1jg7nQfIyNC7ez
 MZBJ59sqA9EDMEJPlLNIeJmqslXPjmMFnE7Mby/+335WJYDulsRybN+W5rLT5aMvhC6x6POK
 z55fMNKrMASCzBJum2Fwjf/VnuGRYkhKCqqZ8gJ3OvmR50tInDV2jZ1DQgc3i550T5JDpToh
 dPBxZocIhzg+MBSRDXcJmHOx/7nQm3iQ6iLuwmXsRC6f5FbFefk9EjuTKcLMvBsEx+2DEx0E
 UnmJ4hVg7u1PQ+2Oy+Lh/opK/BDiqlQ8Pz2jiXv5xkECvr/3Sv59hlOCZMOaiLTTjtOIU7Tq
 7ut6OL64oAq+zsFNBFXLn5EBEADn1959INH2cwYJv0tsxf5MUCghCj/CA/lc/LMthqQ773ga
 uB9mN+F1rE9cyyXb6jyOGn+GUjMbnq1o121Vm0+neKHUCBtHyseBfDXHA6m4B3mUTWo13nid
 0e4AM71r0DS8+KYh6zvweLX/LL5kQS9GQeT+QNroXcC1NzWbitts6TZ+IrPOwT1hfB4WNC+X
 2n4AzDqp3+ILiVST2DT4VBc11Gz6jijpC/KI5Al8ZDhRwG47LUiuQmt3yqrmN63V9wzaPhC+
 xbwIsNZlLUvuRnmBPkTJwwrFRZvwu5GPHNndBjVpAfaSTOfppyKBTccu2AXJXWAE1Xjh6GOC
 8mlFjZwLxWFqdPHR1n2aPVgoiTLk34LR/bXO+e0GpzFXT7enwyvFFFyAS0Nk1q/7EChPcbRb
 hJqEBpRNZemxmg55zC3GLvgLKd5A09MOM2BrMea+l0FUR+PuTenh2YmnmLRTro6eZ/qYwWkC
 u8FFIw4pT0OUDMyLgi+GI1aMpVogTZJ70FgV0pUAlpmrzk/bLbRkF3TwgucpyPtcpmQtTkWS
 gDS50QG9DR/1As3LLLcNkwJBZzBG6PWbvcOyrwMQUF1nl4SSPV0LLH63+BrrHasfJzxKXzqg
 rW28CTAE2x8qi7e/6M/+XXhrsMYG+uaViM7n2je3qKe7ofum3s4vq7oFCPsOgwARAQABwsFl
 BBgBAgAPBQJVy5+RAhsMBQkJZgGAAAoJEE3eEPcA/4NagOsP/jPoIBb/iXVbM+fmSHOjEshl
 KMwEl/m5iLj3iHnHPVLBUWrXPdS7iQijJA/VLxjnFknhaS60hkUNWexDMxVVP/6lbOrs4bDZ
 NEWDMktAeqJaFtxackPszlcpRVkAs6Msn9tu8hlvB517pyUgvuD7ZS9gGOMmYwFQDyytpepo
 YApVV00P0u3AaE0Cj/o71STqGJKZxcVhPaZ+LR+UCBZOyKfEyq+ZN311VpOJZ1IvTExf+S/5
 lqnciDtbO3I4Wq0ArLX1gs1q1XlXLaVaA3yVqeC8E7kOchDNinD3hJS4OX0e1gdsx/e6COvy
 qNg5aL5n0Kl4fcVqM0LdIhsubVs4eiNCa5XMSYpXmVi3HAuFyg9dN+x8thSwI836FoMASwOl
 C7tHsTjnSGufB+D7F7ZBT61BffNBBIm1KdMxcxqLUVXpBQHHlGkbwI+3Ye+nE6HmZH7IwLwV
 W+Ajl7oYF+jeKaH4DZFtgLYGLtZ1LDwKPjX7VAsa4Yx7S5+EBAaZGxK510MjIx6SGrZWBrrV
 TEvdV00F2MnQoeXKzD7O4WFbL55hhyGgfWTHwZ457iN9SgYi1JLPqWkZB0JRXIEtjd4JEQcx
 +8Umfre0Xt4713VxMygW0PnQt5aSQdMD58jHFxTk092mU+yIHj5LeYgvwSgZN4airXk5yRXl
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <44c1500b-145c-34d8-c90c-306312a59f8a@redhat.com>
Date: Wed, 7 Aug 2019 12:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190807115559.660f3e6c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 07 Aug 2019 10:21:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH for-4.2 v4 1/2] kvm: s390:
 split too big memory section on several memslots
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
Cc: thuth@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.08.19 11:55, Igor Mammedov wrote:
> On Wed, 7 Aug 2019 09:54:27 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 06.08.19 11:48, Igor Mammedov wrote:
>>> Max memslot size supported by kvm on s390 is 8Tb,
>>> move logic of splitting RAM in chunks upto 8T to KVM code.
>>>
>>> This way it will hide KVM specific restrictions in KVM code
>>> and won't affect baord level design decisions. Which would allow
>>> us to avoid misusing memory_region_allocate_system_memory() API
>>> and eventually use a single hostmem backend for guest RAM.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> v4:
>>>   * fix compilation issue
>>>           (Christian Borntraeger <borntraeger@de.ibm.com>)
>>>   * advance HVA along with GPA in kvm_set_phys_mem()
>>>           (Christian Borntraeger <borntraeger@de.ibm.com>)
>>>
>>> patch prepares only KVM side for switching to single RAM memory region
>>> another patch will take care of  dropping manual RAM partitioning in
>>> s390 code.
>>> ---
>>>  include/sysemu/kvm_int.h   |  1 +
>>>  accel/kvm/kvm-all.c        | 80 +++++++++++++++++++++++---------------
>>>  hw/s390x/s390-virtio-ccw.c |  9 -----
>>>  target/s390x/kvm.c         | 12 ++++++
>>>  4 files changed, 62 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
>>> index 31df465fdc..7f7520bce2 100644
>>> --- a/include/sysemu/kvm_int.h
>>> +++ b/include/sysemu/kvm_int.h
>>> @@ -41,4 +41,5 @@ typedef struct KVMMemoryListener {
>>>  void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>>>                                    AddressSpace *as, int as_id);
>>>  
>>> +void kvm_set_max_memslot_size(hwaddr max_slot_size);
>>>  #endif
>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>> index f450f25295..d87f855ea4 100644
>>> --- a/accel/kvm/kvm-all.c
>>> +++ b/accel/kvm/kvm-all.c
>>> @@ -138,6 +138,7 @@ bool kvm_direct_msi_allowed;
>>>  bool kvm_ioeventfd_any_length_allowed;
>>>  bool kvm_msi_use_devid;
>>>  static bool kvm_immediate_exit;
>>> +static hwaddr kvm_max_slot_size = ~0;
>>>  
>>>  static const KVMCapabilityInfo kvm_required_capabilites[] = {
>>>      KVM_CAP_INFO(USER_MEMORY),
>>> @@ -951,6 +952,14 @@ kvm_check_extension_list(KVMState *s, const KVMCapabilityInfo *list)
>>>      return NULL;
>>>  }
>>>  
>>> +void kvm_set_max_memslot_size(hwaddr max_slot_size)
>>> +{
>>> +    g_assert(
>>> +        ROUND_UP(max_slot_size, qemu_real_host_page_size) == max_slot_size
>>> +    );
>>> +    kvm_max_slot_size = max_slot_size;
>>> +}
>>> +
>>>  static void kvm_set_phys_mem(KVMMemoryListener *kml,
>>>                               MemoryRegionSection *section, bool add)
>>>  {
>>> @@ -958,7 +967,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>>>      int err;
>>>      MemoryRegion *mr = section->mr;
>>>      bool writeable = !mr->readonly && !mr->rom_device;
>>> -    hwaddr start_addr, size;
>>> +    hwaddr start_addr, size, slot_size;
>>>      void *ram;
>>>  
>>>      if (!memory_region_is_ram(mr)) {
>>> @@ -983,41 +992,50 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>>>      kvm_slots_lock(kml);
>>>  
>>>      if (!add) {
>>> -        mem = kvm_lookup_matching_slot(kml, start_addr, size);
>>> -        if (!mem) {
>>> -            goto out;
>>> -        }
>>> -        if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
>>> -            kvm_physical_sync_dirty_bitmap(kml, section);
>>> -        }
>>> +        do {
>>> +            slot_size = kvm_max_slot_size < size ? kvm_max_slot_size : size;
>>> +            mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
>>> +            if (!mem) {
>>> +                goto out;  
>>
>> I wonder if this can trigger for the first, but not the second slot (or
>> the other way around). In that case you would want to continue the loop
>> (incrementing counters). But most probably there would something be
>> wrong in the caller if that would happen.
> 
> I couldn't come up with scenario where it would be possible
> (unless flatview rendering is broken)
> 
>>
>>> +            }
>>> +            if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
>>> +                kvm_physical_sync_dirty_bitmap(kml, section);
>>> +            }
>>>  
>>> -        /* unregister the slot */
>>> -        g_free(mem->dirty_bmap);
>>> -        mem->dirty_bmap = NULL;
>>> -        mem->memory_size = 0;
>>> -        mem->flags = 0;
>>> -        err = kvm_set_user_memory_region(kml, mem, false);
>>> -        if (err) {
>>> -            fprintf(stderr, "%s: error unregistering slot: %s\n",
>>> -                    __func__, strerror(-err));
>>> -            abort();
>>> -        }
>>> +            /* unregister the slot */
>>> +            g_free(mem->dirty_bmap);
>>> +            mem->dirty_bmap = NULL;
>>> +            mem->memory_size = 0;
>>> +            mem->flags = 0;
>>> +            err = kvm_set_user_memory_region(kml, mem, false);
>>> +            if (err) {
>>> +                fprintf(stderr, "%s: error unregistering slot: %s\n",
>>> +                        __func__, strerror(-err));
>>> +                abort();
>>> +            }
>>> +            start_addr += slot_size;
>>> +        } while ((size -= slot_size));  
>>
>> NIT: I think you can drop parentheses - but I would really prefer to not
>> perform computations in the condition.
> sure, I'll move computation within the loop
> 
>>>          goto out;
>>>      }
>>>  
>>>      /* register the new slot */
>>> -    mem = kvm_alloc_slot(kml);
>>> -    mem->memory_size = size;
>>> -    mem->start_addr = start_addr;
>>> -    mem->ram = ram;
>>> -    mem->flags = kvm_mem_flags(mr);
>>> -
>>> -    err = kvm_set_user_memory_region(kml, mem, true);
>>> -    if (err) {
>>> -        fprintf(stderr, "%s: error registering slot: %s\n", __func__,
>>> -                strerror(-err));
>>> -        abort();
>>> -    }
>>> +    do {
>>> +        slot_size = kvm_max_slot_size < size ? kvm_max_slot_size : size;
>>> +        mem = kvm_alloc_slot(kml);
>>> +        mem->memory_size = slot_size;
>>> +        mem->start_addr = start_addr;
>>> +        mem->ram = ram;
>>> +        mem->flags = kvm_mem_flags(mr);
>>> +
>>> +        err = kvm_set_user_memory_region(kml, mem, true);
>>> +        if (err) {
>>> +            fprintf(stderr, "%s: error registering slot: %s\n", __func__,
>>> +                    strerror(-err));
>>> +            abort();
>>> +        }
>>> +        start_addr += slot_size;
>>> +        ram += slot_size;
>>> +    } while ((size -= slot_size));  
>>
>> dito
>>
>> One note:
>>
>> KVMState stores the number of slots in "nr_slots". We export that via
>> kvm_get_max_memslots().
>>
>> E.g., spapr uses that to compare it against "machine->ram_slots".
> this patch shouldn't affect spapr/arm or x86 machines as they do not have
> limits on memslot size.
> 

Yes, just an example how the existing API could be used.

>> Later (esp. for s390x), kvm_get_max_memslots() can no longer be compared to
>> ram_slots directly. Could be that a ram slot would map to multiple KVM
>> memory slots. There would be no easy way to detect if KVM is able to
>> deal with "machine->ram_slots" as defined by the user, until the sizes
>> of the slots are known.
> 
> If I recall correctly about kvm_foo_slots() APIs,
> assumption 1 memory region == 1 memslot didn't/doesn't hold true
> in all cases (ex: x86) and it's only best effort to let us compare
> the number of apples to oranges on a tree and works for current
> usecases.

Yes, x86 needs two kvm slots due to SMM if I recall correctly.

> 
> From hotplug point of view kvm_has_free_slot() would be more important,
> to allow for graceful abort. If s390 would ever need to hotplug
> RAM MemoryRegion, anyway APIs should be changed to account for
> 1:N split when actual dependency arises.

Exactly, we should handle it gracefully then. (and hotplugging >4TB
DIMMs is quite unlikely, so we can ignore that for now, just wanted to
note it)

-- 

Thanks,

David / dhildenb


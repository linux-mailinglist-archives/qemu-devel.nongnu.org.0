Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936007000F3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 08:57:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxMhl-0005Qa-RZ; Fri, 12 May 2023 02:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxMhj-0005Nx-MD
 for qemu-devel@nongnu.org; Fri, 12 May 2023 02:56:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxMhh-0000Be-Gb
 for qemu-devel@nongnu.org; Fri, 12 May 2023 02:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALJwMbYkUyGKWejy8AofmkwrDQXY631+POe2w0Ye5q4=; b=b61tDGgdATFFHSZlDLn0J3o0Wn
 VocmYfALFqgKhcXFM0A0/zTqfLZNJDi6xZoGEfX0q+XTiFICp9adsy/+cQYnD8g3L2o+2BSbSeAdr
 RwAMus268caMVFf5jcjzu8dtc0cg5iNXgg/itTamL/dpplEabNV7psoFyL2IX2LCtr2gRO7llrjPz
 Ugxcc7pHMsm9WPQy7RByBSPbozGdLlyHa/4nxQrC6+zVHVXkzEVJtQz5YqgRip4XlWJZoIHpUkArM
 jLT6hkEuzgD6PBBwMV/bo/HHZxNGrNbaembBzi0+kNijBwpD9uf46bs6F5ZlJGFJwP72FuKq/588H
 EJh1iPjFMsiZTuFxeWAzTgCz4qHBedxHfX8kOPB3ODw2f8C4Lnj4Iq63D9JQu7A1quPQKDyol3Uie
 CU5EveRbZ1Eppg7heTNPJbPgvfK1nDcl+g+kgAi2dr6X8XBK1Eknm4ARqflkfZ6SJ8pMLls3/3QKf
 ip4iM8g/G1254v1RxNnDWPAgpnFx33Tgrattn3wlD7JNJ7Zt+iF8KHBqBUzOMeRkDBNv6hHj9JpNl
 N2/t2FWRsaZ41O2ZonV/Cp9xUhRT1HM2jlRqAsjyyeq+hrSesaMDjT7nRdw8mZUHv3HVSMHVFjUlY
 N3qzgwfPHDxvQ8k2fv33zVMlL1vhiVjGPz9eiFE5c=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxMge-00071J-3n; Fri, 12 May 2023 07:55:36 +0100
Message-ID: <3591883e-c121-efda-b2eb-cb4e58da291f@ilande.co.uk>
Date: Fri, 12 May 2023 07:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-4-mark.cave-ayland@ilande.co.uk>
 <0f030dfa-9c3e-b44a-584a-22deca1680f7@linaro.org>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <0f030dfa-9c3e-b44a-584a-22deca1680f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/3] softmmu/ioport.c: make MemoryRegionPortioList owner
 of portio_list MemoryRegions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/05/2023 20:22, Philippe Mathieu-Daudé wrote:

> On 19/4/23 17:16, Mark Cave-Ayland wrote:
>> Currently when portio_list MemoryRegions are freed using portio_list_destroy() the RCU
>> thread segfaults generating a backtrace similar to that below:
>>
>>      #0 0x5555599a34b6 in phys_section_destroy ../softmmu/physmem.c:996
>>      #1 0x5555599a37a3 in phys_sections_free ../softmmu/physmem.c:1011
>>      #2 0x5555599b24aa in address_space_dispatch_free ../softmmu/physmem.c:2430
>>      #3 0x55555996a283 in flatview_destroy ../softmmu/memory.c:292
>>      #4 0x55555a2cb9fb in call_rcu_thread ../util/rcu.c:284
>>      #5 0x55555a29b71d in qemu_thread_start ../util/qemu-thread-posix.c:541
>>      #6 0x7ffff4a0cea6 in start_thread nptl/pthread_create.c:477
>>      #7 0x7ffff492ca2e in __clone (/lib/x86_64-linux-gnu/libc.so.6+0xfca2e)
>>
>> The problem here is that portio_list_destroy() unparents the portio_list MemoryRegions
>> causing them to be freed immediately, however the flatview still has a reference to 
>> the
>> MemoryRegion and so causes a use-after-free segfault when the RCU thread next updates
>> the flatview.
>>
>> Solve the lifetime issue by making MemoryRegionPortioList the owner of the portio_list
>> MemoryRegions, and then reparenting them to the portio_list owner. This ensures 
>> that they
>> can be accessed as QOM childen via the portio_list owner, yet the 
>> MemoryRegionPortioList
> 
> "children"

Ooops, thanks - I'll correct that on the next respin.

>> owns the refcount.
>>
>> Update portio_list_destroy() to unparent the MemoryRegion from the portio_list 
>> owner and
>> then add a finalize() method to MemoryRegionPortioList, so that the portio_list
>> MemoryRegions remain allocated until flatview_destroy() removes the final refcount 
>> upon
>> the next flatview update.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   softmmu/ioport.c | 34 +++++++++++++++++++++++++++++++---
>>   1 file changed, 31 insertions(+), 3 deletions(-)
> 
> 
>> @@ -230,6 +230,8 @@ static void portio_list_add_1(PortioList *piolist,
>>                                 unsigned off_low, unsigned off_high)
>>   {
>>       MemoryRegionPortioList *mrpio;
>> +    Object *owner;
>> +    char *name;
>>       unsigned i;
>>       /* Copy the sub-list and null-terminate it.  */
>> @@ -246,8 +248,25 @@ static void portio_list_add_1(PortioList *piolist,
>>           mrpio->ports[i].base = start + off_low;
>>       }
>> -    memory_region_init_io(&mrpio->mr, piolist->owner, &portio_ops, mrpio,
>> +    /*
>> +     * The MemoryRegion owner is the MemoryRegionPortioList since that manages
>> +     * the lifecycle via the refcount
>> +     */
>> +    memory_region_init_io(&mrpio->mr, OBJECT(mrpio), &portio_ops, mrpio,
>>                             piolist->name, off_high - off_low);
>> +
>> +    /* Reparent the MemoryRegion to the piolist owner */
>> +    object_ref(&mrpio->mr);
>> +    object_unparent(OBJECT(&mrpio->mr));
> 
> Out of this patch scope, but could this part <...
> 
>> +    if (!piolist->owner) {
>> +        owner = container_get(qdev_get_machine(), "/unattached");
>> +    } else {
>> +        owner = piolist->owner;
>> +    }
>> +    name = g_strdup_printf("%s[*]", piolist->name);
>> +    object_property_add_child(owner, name, OBJECT(&mrpio->mr));
>> +    g_free(name);
> 
> ...> be extracted as qdev_add_child()? It seems to duplicate
> code from device_set_realized().

I would say no for 2 reasons: firstly qdev itself only has the concept of devices and 
buses: the fact that devices appear as children of their bus is an artifact of how 
they are modelled in QOM, rather than being part of the qdev design philosophy.

Secondly there is actually only one user of portio_list which doesn't have an owner, 
and that is our old friend the PCI IDE controller. That's because everything else is 
done through isa_register_ioport(), and in fact we have both attempted to solve this 
previously (see my comments at 
https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-9-philmd@linaro.org/#ca177083-b24d-90cd-9f3c-c99653bc9a08@ilande.co.uk 
and 
https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/#6bc0dc92-3787-5379-b139-a8b5973d87fc@ilande.co.uk).

My preference would be to merge this in its current form and then remove the part 
handling NULL piolist->owner and replace it with assert(piolist->owner) once one of 
the PCI IDE controller/ISA ioport patches have been merged.

>>       if (piolist->flush_coalesced_mmio) {
>>           memory_region_set_flush_coalesced(&mrpio->mr);
>>       }
>> @@ -305,10 +324,19 @@ void portio_list_del(PortioList *piolist)
>>       }
>>   }
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


ATB,

Mark.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5F5BE242
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 11:42:59 +0200 (CEST)
Received: from localhost ([::1]:48858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaZmL-0004Qq-HC
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 05:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oaYxL-0000n8-Hx; Tue, 20 Sep 2022 04:50:20 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oaYxH-0003he-Ex; Tue, 20 Sep 2022 04:50:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 39177746335;
 Tue, 20 Sep 2022 10:50:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E0C2A74632C; Tue, 20 Sep 2022 10:50:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DBD6474632B;
 Tue, 20 Sep 2022 10:50:01 +0200 (CEST)
Date: Tue, 20 Sep 2022 10:50:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>, 
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>, 
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com, 
 Roman Bolshakov <r.bolshakov@yadro.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>, 
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org, 
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>, 
 Havard Skinnemoen <hskinnemoen@google.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Wenchao Wang <wenchao.wang@intel.com>, 
 Tony Krowiak <akrowiak@linux.ibm.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>, 
 xen-devel@lists.xenproject.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, 
 John G Johnson <john.g.johnson@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
 Marcelo Tosatti <mtosatti@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Halil Pasic <pasic@linux.ibm.com>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, 
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, 
 Alistair Francis <alistair@alistair23.me>, 
 Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 8/9] softmmu/physmem: Let SysBusState absorb memory region
 and address space singletons
In-Reply-To: <be558812-199c-0909-d2e1-d2dd6be54dec@amsat.org>
Message-ID: <fcb592e-a346-2ae-47e9-8af4b9f5ba3@eik.bme.hu>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-9-shentey@gmail.com>
 <be558812-199c-0909-d2e1-d2dd6be54dec@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1142243070-1663663801=:43449"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1142243070-1663663801=:43449
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Tue, 20 Sep 2022, Philippe Mathieu-Daudé via wrote:

> On 20/9/22 01:17, Bernhard Beschow wrote:
>> These singletons are actually properties of the system bus but so far it
>> hasn't been modelled that way. Fix this to make this relationship very
>> obvious.
>> 
>> The idea of the patch is to restrain futher proliferation of the use of
>> get_system_memory() and get_system_io() which are "temprary interfaces"
>
> "further", "temporary"
>
>> "until a proper bus interface is available". This should now be the
>> case.
>> 
>> Note that the new attributes are values rather than a pointers. This
>> trades pointer dereferences for pointer arithmetic. The idea is to
>> reduce cache misses - a rule of thumb says that every pointer
>> dereference causes a cache miss while arithmetic is basically free.
>> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   include/exec/address-spaces.h | 19 ++++++++++++---
>>   include/hw/sysbus.h           |  6 +++++
>>   softmmu/physmem.c             | 46 ++++++++++++++++++-----------------
>>   3 files changed, 45 insertions(+), 26 deletions(-)
>> 
>> diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
>> index d5c8cbd718..b31bd8dcf0 100644
>> --- a/include/exec/address-spaces.h
>> +++ b/include/exec/address-spaces.h
>> @@ -23,17 +23,28 @@
>>     #ifndef CONFIG_USER_ONLY
>>   -/* Get the root memory region.  This interface should only be used 
>> temporarily
>> - * until a proper bus interface is available.
>> +/**
>> + * Get the root memory region.  This is a legacy function, provided for
>> + * compatibility. Prefer using SysBusState::system_memory directly.
>>    */
>>   MemoryRegion *get_system_memory(void);
>
>> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
>> index 5bb3b88501..516e9091dc 100644
>> --- a/include/hw/sysbus.h
>> +++ b/include/hw/sysbus.h
>> @@ -17,6 +17,12 @@ struct SysBusState {
>>       /*< private >*/
>>       BusState parent_obj;
>>       /*< public >*/
>> +
>> +    MemoryRegion system_memory;
>> +    MemoryRegion system_io;
>> +
>> +    AddressSpace address_space_io;
>> +    AddressSpace address_space_memory;
>
> Alternatively (renaming doc accordingly):
>
>       struct {
>           MemoryRegion mr;
>           AddressSpace as;
>       } io, memory;

Do we really need that? Isn't mr just the same as as.root so it would be 
enough to store as only? Or is caching mr and not going through as to get 
it saves time in accessing these? Now we'll go through SysBusState anyway 
instead of accessing globals so is there a performance impact?

Regards,
BALATON Zoltan

>>   };
>>     #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 0ac920d446..07e9a9171c 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -86,12 +86,6 @@
>>    */
>>   RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
>>   -static MemoryRegion *system_memory;
>> -static MemoryRegion *system_io;
>> -
>> -static AddressSpace address_space_io;
>> -static AddressSpace address_space_memory;
>> -
>>   static MemoryRegion io_mem_unassigned;
>>     typedef struct PhysPageEntry PhysPageEntry;
>> @@ -146,7 +140,7 @@ typedef struct subpage_t {
>>   #define PHYS_SECTION_UNASSIGNED 0
>>     static void io_mem_init(void);
>> -static void memory_map_init(void);
>> +static void memory_map_init(SysBusState *sysbus);
>>   static void tcg_log_global_after_sync(MemoryListener *listener);
>>   static void tcg_commit(MemoryListener *listener);
>>   @@ -2667,37 +2661,45 @@ static void tcg_commit(MemoryListener *listener)
>>       tlb_flush(cpuas->cpu);
>>   }
>>   -static void memory_map_init(void)
>> +static void memory_map_init(SysBusState *sysbus)
>>   {
>
> No need to pass a singleton by argument.
>
>       assert(current_machine);
>
> You can use get_system_memory() and get_system_io() in place :)
>
> LGTM otherwise, great!
>
>> -    system_memory = g_malloc(sizeof(*system_memory));
>> +    MemoryRegion *system_memory = &sysbus->system_memory;
>> +    MemoryRegion *system_io = &sysbus->system_io;
>>         memory_region_init(system_memory, NULL, "system", UINT64_MAX);
>> -    address_space_init(&address_space_memory, system_memory, "memory");
>> +    address_space_init(&sysbus->address_space_memory, system_memory, 
>> "memory");
>>   -    system_io = g_malloc(sizeof(*system_io));
>>       memory_region_init_io(system_io, NULL, &unassigned_io_ops, NULL, 
>> "io",
>>                             65536);
>> -    address_space_init(&address_space_io, system_io, "I/O");
>> +    address_space_init(&sysbus->address_space_io, system_io, "I/O");
>>   }
>>     MemoryRegion *get_system_memory(void)
>>   {
>> -    return system_memory;
>> +    assert(current_machine);
>> +
>> +    return &current_machine->main_system_bus.system_memory;
>>   }
>>     MemoryRegion *get_system_io(void)
>>   {
>> -    return system_io;
>> +    assert(current_machine);
>> +
>> +    return &current_machine->main_system_bus.system_io;
>>   }
>>     AddressSpace *get_address_space_memory(void)
>>   {
>> -    return &address_space_memory;
>> +    assert(current_machine);
>> +
>> +    return &current_machine->main_system_bus.address_space_memory;
>>   }
>>     AddressSpace *get_address_space_io(void)
>>   {
>> -    return &address_space_io;
>> +    assert(current_machine);
>> +
>> +    return &current_machine->main_system_bus.address_space_io;
>>   }
>
>
>
--3866299591-1142243070-1663663801=:43449--


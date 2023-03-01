Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5764E6A70E1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPId-0004LI-Ql; Wed, 01 Mar 2023 11:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pXPIc-0004L1-3z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:27:26 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pXPIZ-0000fw-Mn
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:27:25 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pXPIH-0000dT-NI; Wed, 01 Mar 2023 17:27:05 +0100
Message-ID: <9f581e62-0cb3-7f0f-8feb-ddfda5bba621@maciej.szmigiero.name>
Date: Wed, 1 Mar 2023 17:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <369d848fdc86994ca646a5aa4e04c4dc049d04f1.1677274611.git.maciej.szmigiero@oracle.com>
 <0953dc26-da87-65c7-9bba-fec4cfb04999@redhat.com>
 <a230f8bc-ef59-d2ad-1316-554f1a293da9@maciej.szmigiero.name>
 <f81827ce-2553-7b50-adba-a32e82f87e1f@redhat.com>
 <a0ebed14-436f-91c9-928d-e53e29d9db81@maciej.szmigiero.name>
 <eb7e7365-b8e1-2547-596a-98ffe826766f@redhat.com>
Content-Language: en-US, pl-PL
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <eb7e7365-b8e1-2547-596a-98ffe826766f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28.02.2023 23:12, David Hildenbrand wrote:
> On 28.02.23 22:27, Maciej S. Szmigiero wrote:
>> On 28.02.2023 16:02, David Hildenbrand wrote:
>>>>
>>>> That was more or less the approach that v1 of this driver took:
>>>> The QEMU manager inserted virtual DIMMs (Hyper-V DM memory devices,
>>>> whatever one calls them) explicitly via the machine hotplug handler
>>>> (using the device_add command).
>>>>
>>>> At that time you said [1] that:
>>>>> 1) I dislike that an external entity has to do vDIMM adaptions /
>>>>> ballooning adaptions when rebooting or when wanting to resize a guest.
>>>>
>>>> because:
>>>>> Once you have the current approach upstream (vDIMMs, ballooning),
>>>>> there is no easy way to change that later (requires deprecating, etc.).
>>>>
>>>> That's why this version hides these vDIMMs.
>>>
>>> Note that I don't have really strong feelings about letting the user hotplug devices. My comment was in general about user interactions when adding/removing memory or when rebooting the VM. As soon as you use individual memory blocks and/or devices, we end up with a similar user experience as we have already with DIMMS+virtio-balloon (bad IMHO).
>>>
>>> Hiding the devices internally might make it a little bit easier to use, but it's still the same underlying concept: to add more memory you have to figure out whether to deflate the balloon or whether to add a new memory backend.
>>
>> Well, the logic here is pretty simple: deflate the balloon first
>> (including deflating it by zero bytes if not inflated), then, if any
>> memory size remains to add, hot-add the reminder.
>>
> 
> Yes, but if you have 1 GiB deflated and want to add 2 GiB, things are already getting more involved if you get what I mean.
> 
> I was going through the exact same model back when I was designing virtio-mem, and eventually added with a way where you can just tell QEMU the requested size an be done with it.

Understood, this interface seems obviously more user-friendly.

>> We can't get rid of ballooning altogether because otherwise going
>> below the boot memory size wouldn't be possible.
> 
> Right, more on that below.
> 
>>
>>> What memory backends will remain when we reboot?
>>
>> In this driver version, none will remain inserted
>> (virtio-mem also seems to unplug all blocks unconditionally when the
>> VM is rebooted).
>>
> 
> There is a very important difference: virtio-mem only temporarily unplugs that memory. As the guest boots up it re-adds the requested amount of memory without any user interaction. That was added for two main reasons
> 
> (a) We can easily defragment the virtio-mem device that way.
> (b) If the rebooted guest doesn't load the virtio-mem driver, it
>      wouldn't be able to make use of that memory. Like, rebooting into
>      Windows right now ;)
> 
> So if you hotplugged some memory using virtio-mem and reboot, that memory will automatically be re-added.
> 
>> In version 1, all memory backeds were re-inserted once the guest
>> re-connected to the DM protocol after a reboot.
>>
>> As I wrote in my response to Daniel moments ago, there are some issues
>> with automatic re-insertion if the guest never re-connects to the DM
>> protocol - that's why I've removed this functionality from this
>> driver version.
> 
> I think we might be able to to better, but that's just my idea how it could look like. I'll describe it below.
> 
> [...]
> 
>>>> However, I'm not sure what is exactly gained by this approach.
>>>>
>>>> These sub-devices still need to implement the TYPE_MEMORY_DEVICE interface
>>>
>>> No, they wouldn't unless I am missing something. Only the hv-balloon device would be a TYPE_MEMORY_DEVICE.
>> In case of virtio-mem if one wants to add even more memory than the
>> "current" backing memory device allows there's always a possibility of
>> adding yet another virtio-mem-pci device with an additional backing
>> memory device.
> 
> We could, but that's not the way I envision virtio-mem. The thing is, already when starting QEMU we have to make decisions about the maximum VM size when setting the maxmem option. Consequently, we cannot grow a VM until infinity, we already have to plan ahead to some degree.
> 
> So what my goal is with virito-mem, is the following (it already works, we just have to work on reduction of metadata and memory overcommit handling -- mostly internal optimizations):
> 
> qemu-kvm ... \
> -m 4G,maxmem=1048G \
> -object memory-backend-ram,id=mem0,size=1T, ... \
> -device virtio-mem-pci,id=vmem0,memdev=mem0,requested-size=0
> 
> So we an grow the guest up to 1T if we like. There is no way we could add more memory to that VM because we're already hitting the limit of maxmem.
> 
> It gets more complicated with multiple NUMA nodes, NVDIMMS, etc, but the main goal is to make it possible to have the maximum size be ridiculously large (while optimizing it internally!) that one doesn't have to even worry about adding a new device.
> 
> I think the same model would work for hv as well, at least with my limited knowledge about it ;)

I understand your idea - responded below, under the hv-balloon example.

>>
>> If there would be just the main hv-balloon device (implementing
>> TYPE_MEMORY_DEVICE) then this would not be possible, since one can't
>> have multiple DM VMBus devices.
>>
>> Hence, intermediate sub-devices are necessary (each one implementing
>> TYPE_MEMORY_DEVICE), which do not sit on the VMBus, in order to allow
>> adding new backing memory devices (as virtio-mem allows).
> 
> Not necessarily, I think, as discussed.
> 
>>
>>>> so they are accounted for properly (the alternative would be to patch
>>>> the relevant QEMU code all over the place - that's probably why
>>>> virtio-mem also implements this interface instead).
>>>
>>> Please elaborate, I don't understand what you are trying to say here. Memory devices provide hooks, and the hooks exist for a reason -- because memory devices are no longer simple DIMMs/NVDIMMs. And virtio-mem + virtio-omem was responsible for adding some of these hooks.
>>
>> I was referring to the necessity of implementing TYPE_MEMORY_DEVICE at
>> all in hv-balloon driver - if it didn't implement this interface then it
>> couldn't benefit from the logic in hw/mem/memory-device.c, so it would
>> need to be open-coded inside the driver and every call to functions
>> provided by that file from QEMU would need to be patched to account for
>> the memory provided by this driver.
> 
> Ah, yes, one device has to be a memory device. I was just asking if you really need multiple ones.
> 
>>
>>>
>>>>
>>>> One still needs some QMP command to add a raw memory backend to
>>>> the chosen "container" hv-balloon sub-device.
>>>
>>> If you go with multiple memory backends, yes.
>>>
>>>>
>>>> Since now the QEMU manager (user) is aware of the presence of these
>>>> "container" sub-devices, and has to manage them, changing the QEMU
>>>> interface in the future is more complex (as you said in [1]).>
>>> Can you elaborate? Yes, when you design the feature around "multiple memory backends", you'll have to have an interface to add such. Well, and to query them during migration. And, maybe also to detect when to remove some (migration)?
>>>
>>
>> As I wrote above, multiple backing memory devices are necessary so the
>> guest can be expanded above the initially provided backing memory device,
>> much like virtio-mem already allows.
>>
>> And then you have to either:
>> 1) Let the hv-balloon driver transparently manage the lifetime of these
>> sub-devices, like this version of the patch set does, OR:
>>
>> 2) Make the QEMU manager (user) insert and remove these sub-devices
>> explicitly, like the version 1 of this driver did.
> 
> Let's me raise this idea:
> 
> qemu-kvm ... \
> -m 4G,maxmem=1048G \
> -object memory-backend-ram,id=mem0,size=1T, ... \
> -device hv-balloon,id=vmem0,memdev=mem0
> 
> We'd do the same internal optimizations as we're doing (and the ones I am working on) for virtio-mem.
> 
> The above would result in a VM with 4G. With virtio-mem, we resize devices, with the balloon, you resize the logical VM size.
> 
> So the single (existing?) user interface would be the existing balloon cmd. Note that we set the logical VM size here, not the size of the balloon.
> 
> info balloon -> 4G
> balloon 2G [will inflate]
> info balloon -> 2G
> balloon 128G [will deflate, then hotplug]
> info balloon -> 128G
> balloon 8G [will deflate]
> info balloon -> 8G
> ...
> 
> How memory is added (deflate first, then expose some new memory via the memdev, ...) is left to the hv-balloon device, the user doesn't have to bother. We set the logical VM size and hv-balloon will do it's thing to eventually reach that goal.

The idea would seem reasonable, but: (there's always some "but")
1) Once we implement NUMA support we'd probably need multiple
TYPE_MEMORY_DEVICEs anyway, since it seems one memdev can sit on only
one NUMA node,

With virtio-mem one can simply have per-node virtio-mem devices.

2) I'm not sure what's the overhead of having, let's say, 1 TiB backing
memory device mostly marked madvise(MADV_DONTNEED).
Like, how much memory + swap this setup would actually consume - that's
something I would need to measure.

3) In a public cloud environment malicious guests are a possibility.
Currently (without things like resizable memslots) the best idea I tried
was to place the whole QEMU process into a memory-limited cgroup
(limited to the guest target size).

There are still some issues with it: one needs to reserve swap space up
to the guest maximum size so the QEMU process doesn't get OOM-killed if
guest touches that memory and the cgroup memory controller for some
reason seems to start swapping even before reaching its limit (that's
still under investigation why).

> Reboot? Logically unplug all memory and as the guest boots up, re-add the memory after the guest booted up.
> 
> The only thing we can't do is the following: when going below 4G, we cannot resize boot memory.
> 
> 
> But I recall that that's *exactly* how the HV version I played with ~2 years ago worked: always start up with some initial memory ("startup memory"). After the VM is up for some seconds, we either add more memory (requested > startup) or request the VM to inflate memory (requested < startup).

Hyper-V actually "cleans up" the guest memory map on reboot - if the
guest was effectively resized up then on reboot the guest boot memory is
resized up to match that last size.
Similarly, if the guest was ballooned out - that amount of memory is
removed from the boot memory on reboot.

So it's not exactly doing a hot-add after the guest boots.
This approach (of resizing the boot memory) also avoids problems if the
guest loses hot-add / ballooning capability after a reboot - for example,
rebooting into a Linux guest from Windows with hv-balloon.

But unfortunately such resizing the guest boot memory seems not trivial
to implement in QEMU.

> 
> 
> Even migration could eventually be fairly simple, because virtio-mem already solved it to some degree. The only catch is, that for boot memory, we'd also have to detect discarded ranges. But that would be something to think about in the future.> 

Yes, migration support is planned for future versions of the driver,
when its final design is known.

Thanks,
Maciej



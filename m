Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA096A76A0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUd0-0007ui-HB; Wed, 01 Mar 2023 17:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pXUcq-0007tU-7Q
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:08:40 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pXUco-0000ZY-0u
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:08:39 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pXUcc-0001sb-EY; Wed, 01 Mar 2023 23:08:26 +0100
Message-ID: <9280c056-43eb-08e6-cb63-a7e601cb4700@maciej.szmigiero.name>
Date: Wed, 1 Mar 2023 23:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, pl-PL
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
 <9f581e62-0cb3-7f0f-8feb-ddfda5bba621@maciej.szmigiero.name>
 <678fb11d-4ac8-238f-9ead-d68d59d0a8ba@redhat.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <678fb11d-4ac8-238f-9ead-d68d59d0a8ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 1.03.2023 18:24, David Hildenbrand wrote:
(...)
>> With virtio-mem one can simply have per-node virtio-mem devices.
>>
>> 2) I'm not sure what's the overhead of having, let's say, 1 TiB backing
>> memory device mostly marked madvise(MADV_DONTNEED).
>> Like, how much memory + swap this setup would actually consume - that's
>> something I would need to measure.
> 
> There are some WIP items to improve that (QEMU metadata (e.g., bitmaps), KVM metadata (e.g., per-memslot), Linux metadata (e.g., page tables).
> Memory overcommit handling also has to be tackled.
> 
> So it would be a "shared" problem with virtio-mem and will be sorted out eventually :)
> 

Yes, but this might take a bit of time, especially if kernel-side changes
are involved - that's why I will check how this setup works in practice
in its current shape.

(...)
>>> Reboot? Logically unplug all memory and as the guest boots up, re-add the memory after the guest booted up.
>>>
>>> The only thing we can't do is the following: when going below 4G, we cannot resize boot memory.
>>>
>>>
>>> But I recall that that's *exactly* how the HV version I played with ~2 years ago worked: always start up with some initial memory ("startup memory"). After the VM is up for some seconds, we either add more memory (requested > startup) or request the VM to inflate memory (requested < startup).
>>
>> Hyper-V actually "cleans up" the guest memory map on reboot - if the
>> guest was effectively resized up then on reboot the guest boot memory is
>> resized up to match that last size.
>> Similarly, if the guest was ballooned out - that amount of memory is
>> removed from the boot memory on reboot.
> 
> Yes, it cleans up, but as I said last time I checked there was this concept of startup vs. minimum vs. maximum, at least for dynamic memory:
> 
> https://www.fastvue.co/tmgreporter/blog/understanding-hyper-v-dynamic-memory-dynamic-ram/
> 
> Startup RAM would be whatever you specify for "-m xG". If you go below min, you remove memory via deflation once the guest is up.


That article was from 2014, so I guess it pertained Windows 2012 R2.

The memory settings page in more recent Hyper-V versions looks like on
the screenshot at [1].

It no longer calls that main memory amount value "Startup RAM", now it's
just "RAM".

Despite what one might think the "Enable Dynamic Memory" checkbox does
*not* control the Dynamic Memory protocol availability or usage - the
protocol is always available/exported to the guest.

What the "Enable Dynamic Memory" checkbox controls is some host-side
heuristics that automatically resize the guest within chosen bounds
based on some metrics.

Even if the "Enable Dynamic Memory" checkbox is *not* enabled the guest
can still be online-resized via Dynamic Memory protocol by simply
changing the value in the "RAM" field and clicking "Apply".

At least that's how it works on Windows 2019 with a Linux guest.

>>
>> So it's not exactly doing a hot-add after the guest boots.
> 
> I recall BUG reports in Linux, that we got hv-balloon hot-add requests ~1 minute after Linux booted up, because of the above reason of startup memory [in these BUG reports, memory onlining was disabled and the VM would run out of memory because we hotplugged too much memory]. That's why I remember that this approach once was done.
> 
> Maybe there are multiple implementations noways. At least in QEMU you could chose whatever makes most sense for QEMU.
> 

Right, it seems that the Hyper-V behavior evolved with time, too.

>> This approach (of resizing the boot memory) also avoids problems if the
>> guest loses hot-add / ballooning capability after a reboot - for example,
>> rebooting into a Linux guest from Windows with hv-balloon.
> 
> TBH, I wouldn't be too concerned about that scenario ("hotplugged memory to a guest, guest reboots into a weird OS, weird OS isn't able to use hotplugged memory). For virtio-mem, the important part was that you always "know" how much memory the VM is aware about. If you always start with "Startup memory" and hotadd later (only if you detected guest support after a bootup), you can handle that scenario.

I'm not *that* concerned with cross-guest-type scenario either,
but if it can be made more smooth then I wouldn't mind.

Thanks,
Maciej

[1]: https://www.tenforums.com/performance-maintenance/38478-windows-10-hyper-v-dynamic-memory.html#post544905




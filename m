Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652D310D9E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:08:48 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83f5-0003Yw-9M
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1l83aT-0000F9-72
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:04:01 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1l83aP-0003tK-T3
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:04:00 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 1F4B320777;
 Fri,  5 Feb 2021 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1612541034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZ2BEuHaw9B0CttOW9AfgyPpCwFxGFcabF0O0pd9owM=;
 b=q2f8YXeNPPghSea3sh5Rw7ffYSnT/JGMG5wadObRmutaygyXEb4BudOyksW6lP/RrsJeyk
 JgDdOgIQRbO/+cgYzqWPbEpQ182RgZ0q8I81uFGvz+hFcvG8OfnAhOglrMXdH/Mr1413Sk
 LeCChOK1p3/7WSx+338RAuxDNSgPQOs=
Subject: Re: About creating machines on the command line
To: John Snow <jsnow@redhat.com>, Alexander Graf <graf@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Nikos Dragazis <ndragazis@arrikto.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Andra-Irina Paraschiv <andraprs@amazon.com>,
 "John G. Johnson" <john.g.johnson@oracle.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <93e41283-ec7c-4c2b-dcfd-9e0e7a2e435c@amsat.org>
 <497eb0f5-a308-7a10-37ef-5fcc3ec21b8a@amazon.com>
 <5fcd9231-2579-4829-862b-e23bdd184ac5@redhat.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <88f9098a-fd13-0fe5-004e-590f60848621@greensocs.com>
Date: Fri, 5 Feb 2021 17:04:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5fcd9231-2579-4829-862b-e23bdd184ac5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.33,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, richard.fuhler@sifive.com,
 armbru@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 9:29 PM, John Snow wrote:
> On 2/3/21 12:09 PM, graf--- via wrote:
>>
>>
>> On 03.02.21 17:55, Philippe Mathieu-Daudé wrote:
>>>
>>> On 1/11/21 3:50 PM, Luc Michel wrote:
>>>> Hi,
>>>>
>>>> We would like to work on improving QEMU to be able to create custom
>>>> machines from the command line. The goal here is to get feedback from
>>>> the community and shape the future developments.
>>>
>>> Cc'ing John who is working on command line, and some developers from
>>> the "inter-VM device emulation interface" call.
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg723252.html
>>>
> 
> I have a bunch of extremely naive questions about what it would take to 
> generalize this kind of interface; my familiarity is largely with x86 
> and so I actually just have a series of very basic questions about the 
> scope of this work.
> 
>>>>
>>>> The use case mainly comes from people working with tools to customize
>>>> their designs, such as SiFive Core Designer
>>>> (https://scs.sifive.com/core-designer). This kind of tools may allow
>>>> creation or customization of a whole SoC, from the number of cores, to
>>>> the memory and IRQ mapping of peripherals etc.
>>>>
>>>> The ultimate goal would be to be able to create any kind of machine on
>>>> the command line. However we are aware that this is a substantial 
>>>> amount
>>>> of changes in QEMU.
>>
>> Is the command line really the right abstraction level here? Wouldn't 
>> it make more sense to have a QOM / <scripting language> bridge that 
>> allows you to create and connect QOM objects using for example Python?
>>
>> You could then have machine descriptions in a script, which could be 
>> generated by the SoC customization tools.
>>
>> In combination with plugin support for platform devices, that should 
>> allow pretty much any customization you would need to happen, no?
>>
>>
>> Alex
>>
> 
> Right, I am just reading this proposal as "We want an interface language 
> that allows us to construct more arbitrary configurations."

Yes exactly.

> 
> In this case, something QMP/QOM-based would be the right place to do it 
> and not the CLI as it exists today.

Yes, we realized this through the discussions. We are now changing our 
plan to focus on QMP.

> Small details in the grand scheme of 
> things the kind of internal modeling cleanup this idea seems to imply.
> 
>>>>
>>>> In its current state, QEMU allows for very limited customization of
>>>> existing machines on the command line. We identified the following
>>>> limitations (feel free to add to the list):
>>>>
>>>>    - Most devices are not user creatable. Moreover, sysbus devices must
>>>> be explicitly allowed by a machine to be creatable through `-device`,
>>>>
>>>>    - Memory regions cannot be created on the command line,
>>>>
>>>>    - Device MMIO regions cannot be mapped on a bus from the command 
>>>> line,
>>>>
>>>>    - GPIOs and clocks cannot be wired from the command line,
>>>>
>>>>    - CPUs are not sysbus devices (and not user-creatable). They need
>>>> special care when creating them regarding system reset. Not being on a
>>>> bus means that they must be reset manually on system reset. This is 
>>>> done
>>>> in machines by registering a QEMU reset handler.
>>>>
>>>>    - Machine specific boot code is usually hard-coded into the machine
>>>> itself.  Some architectures (e.g. ARM) do factorize bootloader related
>>>> code, but there is no standard way of doing that in QEMU.
>>>>
>>>> We don't want to address all those limitations at once. We plan to 
>>>> start
>>>> with the following scenario:
>>>>
> 
> It does sound like a staggering level of work.
> 
>>>>    - Start with a base machine that would handle CPU creation and
>>>> bootloader stuff. Note that the "none" machine is probably not
>>>> sufficient in its current shape. It does allow only one CPU and
>>>> obviously does not handle the boot process.
>>>>
> 
> I suppose this implies a type of machine that doesn't have migration 
> compatibility. e.g. your "blank" might be different from someone else's 
> "blank".
> 
> Or at least, not migration compatibility in its current form. Some 
> thought might need to be put into how to negotiate migration 
> compatibility between two instances of QEMU; it sounds like a hard problem.
> 
> (Jokingly, I'd want to call a machine like this "Apple Pie", but that 
> would probably be too confusing for both Apple and Raspberry Pi 
> enthusiasts.)

Migration is definitely an issue. We didn't think too much about it yet 
because the use-case is more firmware/OS development oriented (i.e. I 
fix, compile and re-run my code in QEMU to test/debug). Migration is not 
a must-have for this use-case.

> 
>>>>    - Allow for this machine every sysbus devices we want to be user
>>>> command-line creatable (and mark them user_creatable if needed)
>>>>
> 
> Is it even possible to enumerate, for every sysbus device in QEMU, what 
> the interface requirements are?
> 
> e.g. I assume most need a memory region, or maybe an IO region, or maybe 
> an IRQ resource of some kind, or ...
> 
> doing this kind of dynamic bringup requires a lot of configuration data 
> that is at-present just hardcoded absolutely everywhere.

As of today, as I understand it, what a sysbus device exposes is part of 
its "specification" (i.e. in best cases, it is documented in a comment 
somewhere in its header file). Apart from that there is no way of 
knowing that the memory region number 0 is e.g for the ARM GIC, the 
distributor interface, while the number 1 is the CPU interface.

An introspection mechanism would be very helpful here. A simple addition 
would be to be able to name those regions at sysbus device init time, 
the same way we can name GPIOs and clocks. Having a proper name is 
already a good piece of "self-documentation" for the device, and it 
could be made observable by the user (as properties are today in QMP).

> 
>>>>    - Add command line options to create memory regions (probably ram 
>>>> ones
>>>> at first)
>>>>
> 
> Naive question: what does adding a memory region mean to you in this 
> context?
> 
> For whom (which device, spec, standard, instruction set, etc?) are these 
> regions tangible abstractions?

Good question. What we want here is basically being able to create the 
memories of our platform (rom, ram). Those can be viewed as devices 
really, and this is how in our current prototype we made them (a simple 
sysbus device that embeds the memory region and exposes it through SBD 
API). I think this is the good level of abstraction to choose because it 
aligns nicely with the rest. Such a simple device would make sense in 
vanilla IMO. Creating the memories of the platform would then resort to 
creating a device (with parameters to set the size, set if it is 
read-only, ...) and connecting it to a bus.

> 
>>>>    - Add command line options to map a memory region (including sysbus
>>>> device MMIO regions) onto another (memory_region_add_subregion)
>>>>
> 
> More naive questions:
> 
> The assumption here being that sysbus devices can be modeled using their 
> own private memory addressing namespace; and we configure them by 
> mapping that space onto the machine's physical address space.
> 
> Instead of, say, making the memory address of that device a property of 
> the device.
> 
> Yes?

Yes memory regions can be created by sysbus devices and exposed at the 
sysbus device API level. Then the parent device instantiating this 
device (or the machine itself) can use the SBD API to fetch and connect 
them to other memory regions. This is then up to the parent to choose 
where and how to map the child region(s).

> 
>>>>    - Add command line options to connect GPIOs and clocks.
>>>>
> 
> Similar to elsewhere, I wonder how much work it is to generalize this 
> kind of pluggability so that all existing clocks and GPIO devices can be 
> modeled in the same way.
> 
> (I say this meaning: Wow, I have no idea. I know a lot of the ones we 
> have are hard-coded. What does a configuration interface for this look 
> like?)

By hard-coded, you mean the connections? Because otherwise the GPIO and 
Clock APIs are well defined already. Exposing this to QMP does not seem 
to be an issue. I could be wrong though.

> 
>>>> This would hopefully allow for simple machines creation. We would then
>>>> be able to use either the command line or the `-readconfig` option to
>>>> create the machine.
>>>>
>>>> Note that we are not planning to use QMP/HMP for now. From our
>>>> understanding, a `device_add` request is always considered as hot-plug,
>>>> which is not what we want here.
>>>>
> 
> We're working our way towards being able to use QMP to define machines 
> prior to execution start in order to have a QMP-only interaction with 
> QEMU possible.
> 
> You likely want to invest in that kind of a strategy where you define 
> structures that describe the machines you want to build.

OK. It is clear to us that QMP is the way to go now. The plan is for us 
to work and come up with a first RFC series.

Thanks a lot!

-- 
Luc

> 
>>>> Please tell us what do you think about this plan. Any feedback is
>>>> appreciated.  Then we can discuss the details of how to do this 
>>>> properly.
>>>> Thanks!
>>>>
>>>> -- 
>>>> Luc
>>>>
>>
>>
>>
>> Amazon Development Center Germany GmbH
>> Krausenstr. 38
>> 10117 Berlin
>> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
>> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
>> Sitz: Berlin
>> Ust-ID: DE 289 237 879
>>
>>
> 


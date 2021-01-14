Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232372F5DC3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:35:38 +0100 (CET)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzz2V-0002Ay-Jr
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kzyx7-0000Vo-AV
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:30:01 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:47610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kzyx2-0008CL-EP
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:30:00 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id DB59D21DD2;
 Thu, 14 Jan 2021 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1610616591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ri2ezRFKBNnrOsCaYEvWSKafTVHDGy62rUDRe+4dJrY=;
 b=1G0RtH4jUjDUKeBk/Z//l8j7iS3T4ZmUj7ltGd4FvJpLmclq3XSdx7SXJ5k4wbi8reNrZT
 8CuwPb5kayH3g6bhny4eihMDYoYL0CTdFUH4iw/bA0LioDyZq3gpINiXVniHepGSqnj+ji
 My7uVq7U4t7Ox+Ndsb3RTkyLNU9OUD4=
From: Luc Michel <luc.michel@greensocs.com>
Subject: Re: About creating machines on the command line
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
Message-ID: <4dd30d0f-e04a-2647-f595-8d4a1c2c98db@greensocs.com>
Date: Thu, 14 Jan 2021 10:30:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 berrange@redhat.com, sam.grove@sifive.com, armbru@redhat.com,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 richard.fuhler@sifive.com, edgar.iglesias@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan,

On 1/11/21 9:04 PM, BALATON Zoltan wrote:
> On Mon, 11 Jan 2021, Luc Michel wrote:
>> Hi,
>>
>> We would like to work on improving QEMU to be able to create custom 
>> machines from the command line. The goal here is to get feedback from 
>> the community and shape the future developments.
>>
>> The use case mainly comes from people working with tools to customize 
>> their designs, such as SiFive Core Designer 
>> (https://scs.sifive.com/core-designer). This kind of tools may allow 
>> creation or customization of a whole SoC, from the number of cores, to 
>> the memory and IRQ mapping of peripherals etc.
>>
>> The ultimate goal would be to be able to create any kind of machine on 
>> the command line. However we are aware that this is a substantial 
>> amount of changes in QEMU.
>>
>> In its current state, QEMU allows for very limited customization of 
>> existing machines on the command line. We identified the following 
>> limitations (feel free to add to the list):
>>
>>  - Most devices are not user creatable. Moreover, sysbus devices must 
>> be explicitly allowed by a machine to be creatable through `-device`,
>>
>>  - Memory regions cannot be created on the command line,
>>
>>  - Device MMIO regions cannot be mapped on a bus from the command line,
>>
>>  - GPIOs and clocks cannot be wired from the command line,
>>
>>  - CPUs are not sysbus devices (and not user-creatable). They need 
>> special care when creating them regarding system reset. Not being on a 
>> bus means that they must be reset manually on system reset. This is 
>> done in machines by registering a QEMU reset handler.
>>
>>  - Machine specific boot code is usually hard-coded into the machine 
>> itself. Some architectures (e.g. ARM) do factorize bootloader related 
>> code, but there is no standard way of doing that in QEMU.
>>
>> We don't want to address all those limitations at once. We plan to 
>> start with the following scenario:
>>
>>  - Start with a base machine that would handle CPU creation and 
>> bootloader stuff. Note that the "none" machine is probably not 
>> sufficient in its current shape. It does allow only one CPU and 
>> obviously does not handle the boot process.
>>
>>  - Allow for this machine every sysbus devices we want to be user 
>> command-line creatable (and mark them user_creatable if needed)
>>
>>  - Add command line options to create memory regions (probably ram 
>> ones at first)
>>
>>  - Add command line options to map a memory region (including sysbus 
>> device MMIO regions) onto another (memory_region_add_subregion)
>>
>>  - Add command line options to connect GPIOs and clocks.
> 
> I'm not sure the command line would be the best interface for this, it's 
> already hard enough to get a simple VM running, adding more options 
> would just make it more obscure for mere users who just want to use 
> existing machines to create a VM. So I think some kind of config file to 
> define the machine would be better.

OK. My first thought here was to be not too much "intrusive" in the QEMU 
source code, so adding a couple a command line options seemed to be the 
way to go, as -device was already doing what we wanted.

> 
> Another issue with command line was backward compatibility that it's 
> hard to change if it's used as an interface in scripts, etc. My personal 
> opinion is that the command line should be a user interface to run VMs 
> but for management apps and this kind of dynamic machine creation a 
> better defined API might be better. But I'm not in any way authorative 
> to decide so this is just my input to this.

Makes sense. I tend to agree with you. I'd appreciate more feedback on 
this to know if it's indeed a shared opinion.

> 
>> This would hopefully allow for simple machines creation. We would then 
>> be able to use either the command line or the `-readconfig` option to 
>> create the machine.
> 
> It was found that readconfig is limited and cannot even handle its 
> current purpose so it probably would need to be rewritten. This might be 
> a good opportunity for that. Maybe you need a better format than ini 
> file that can actually describe the machine parts and their connections 
> you want to create in a managable way. Question arises how general this 
> has to be to describe all the properties of objects and their 
> connections and if you'll end up with somthing like still needing to 
> write a board code which is the current situation just instead of 
> writing C you'd use some other language and call it a "config file". 
> What do you really want here? Avoid writing C or avoid recompiling QEMU 
> to experiment with devices?

Yes the idea is definitely to have a mean to create custom machines 
without the need of recompiling QEMU.

> In the latter case better support from the 
> QEMU monitor to create machines interactively could also be a solution 
> and if you could run scripts with monitor commands in it that could be 
> your config file.

Yes. We plan to have a script that will serve as a "frontend" anyways to 
generate the necessary commands (being on the command line, or monitor 
command or...)

> 
>> Note that we are not planning to use QMP/HMP for now. From our 
>> understanding, a `device_add` request is always considered as 
>> hot-plug, which is not what we want here.
> 
> Is that something that cannot be solved? Maybe by adding another command 
> or a state where starting with -S and adding devices before continue 
> would not be hotplug?

Sure. The goal here was to avoid adding yet another run state to QEMU. 
The command line happened to kind of support what we plan to do. If 
people are OK with enhancing the monitor for this, going the QMP way 
could be a solution. Does anyone has an opinion on this?

> 
> These are just some random thoughts I had, feel free to ignore any of it.

Thanks for your feedback!

> 
> Regards,
> BALATON Zoltan


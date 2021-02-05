Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B5310977
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:49:02 +0100 (CET)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yfd-0001m6-6J
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1l7yaA-0007ft-2E
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:43:23 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:47790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1l7ya6-0003km-1p
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:43:21 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E8DEC20779;
 Fri,  5 Feb 2021 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1612521792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9k7iuORxLMe637ei0DCAj8iBAv1saolg6lnCZssSB5c=;
 b=4iDcKvLVCkRQ44bubJPDvlgWgMiyXPjNKHX1vuc8hDENdf6d07hLCgvmiAHrZs0jNj/A+8
 d98ge8gj2V88kyWu42O6peE9GV0GvwYjfh4pQ4Jt++vyO7DX+mYXZ6WLyjXK43TD8hNW0R
 r8uLxJoectQSCVQ/MVKm/jjN1jofUVY=
Subject: Re: About creating machines on the command line
To: Alexander Graf <graf@amazon.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Nikos Dragazis <ndragazis@arrikto.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Andra-Irina Paraschiv <andraprs@amazon.com>,
 "John G. Johnson" <john.g.johnson@oracle.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <93e41283-ec7c-4c2b-dcfd-9e0e7a2e435c@amsat.org>
 <497eb0f5-a308-7a10-37ef-5fcc3ec21b8a@amazon.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <01ebe874-badf-0454-388c-00d49b2b3763@greensocs.com>
Date: Fri, 5 Feb 2021 11:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <497eb0f5-a308-7a10-37ef-5fcc3ec21b8a@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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

On 2/3/21 6:09 PM, Alexander Graf wrote:
> 
> 
> On 03.02.21 17:55, Philippe Mathieu-Daudé wrote:
>>
>> On 1/11/21 3:50 PM, Luc Michel wrote:
>>> Hi,
>>>
>>> We would like to work on improving QEMU to be able to create custom
>>> machines from the command line. The goal here is to get feedback from
>>> the community and shape the future developments.
>>
>> Cc'ing John who is working on command line, and some developers from
>> the "inter-VM device emulation interface" call.
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg723252.html
>>
>>>
>>> The use case mainly comes from people working with tools to customize
>>> their designs, such as SiFive Core Designer
>>> (https://scs.sifive.com/core-designer). This kind of tools may allow
>>> creation or customization of a whole SoC, from the number of cores, to
>>> the memory and IRQ mapping of peripherals etc.
>>>
>>> The ultimate goal would be to be able to create any kind of machine on
>>> the command line. However we are aware that this is a substantial amount
>>> of changes in QEMU.
> 
> Is the command line really the right abstraction level here? Wouldn't it 
> make more sense to have a QOM / <scripting language> bridge that allows 
> you to create and connect QOM objects using for example Python?
Yes, after some discussions with the community, we are now working on 
improving QMP to achieve this. We first started with the idea of the 
command line because it seems to be the place where we had "almost" 
everything we needed already. In either cases we are planning to use a 
front-end script to go from e.g. a DTB to whatever QEMU interface we 
will end up using.

> 
> You could then have machine descriptions in a script, which could be 
> generated by the SoC customization tools.
Yes, most likely a DTB in our case.

> 
> In combination with plugin support for platform devices, that should 
> allow pretty much any customization you would need to happen, no?
I'm not sure what you mean by "plugin support for platform devices". If 
you refer to the current QEMU plugin API, it's pretty much limited to 
TCG. If you suggest this API could be enhanced to allow for custom 
devices to be added by plugins, for now we are planning to use only 
existing device models. It's more a matter of having flexibility on 
connections between the devices than on the devices themselves (but yes 
that would be a nice next step).

Thanks,

-- 
Luc

> 
> 
> Alex
> 
>>>
>>> In its current state, QEMU allows for very limited customization of
>>> existing machines on the command line. We identified the following
>>> limitations (feel free to add to the list):
>>>
>>>    - Most devices are not user creatable. Moreover, sysbus devices must
>>> be explicitly allowed by a machine to be creatable through `-device`,
>>>
>>>    - Memory regions cannot be created on the command line,
>>>
>>>    - Device MMIO regions cannot be mapped on a bus from the command 
>>> line,
>>>
>>>    - GPIOs and clocks cannot be wired from the command line,
>>>
>>>    - CPUs are not sysbus devices (and not user-creatable). They need
>>> special care when creating them regarding system reset. Not being on a
>>> bus means that they must be reset manually on system reset. This is done
>>> in machines by registering a QEMU reset handler.
>>>
>>>    - Machine specific boot code is usually hard-coded into the machine
>>> itself.  Some architectures (e.g. ARM) do factorize bootloader related
>>> code, but there is no standard way of doing that in QEMU.
>>>
>>> We don't want to address all those limitations at once. We plan to start
>>> with the following scenario:
>>>
>>>    - Start with a base machine that would handle CPU creation and
>>> bootloader stuff. Note that the "none" machine is probably not
>>> sufficient in its current shape. It does allow only one CPU and
>>> obviously does not handle the boot process.
>>>
>>>    - Allow for this machine every sysbus devices we want to be user
>>> command-line creatable (and mark them user_creatable if needed)
>>>
>>>    - Add command line options to create memory regions (probably ram 
>>> ones
>>> at first)
>>>
>>>    - Add command line options to map a memory region (including sysbus
>>> device MMIO regions) onto another (memory_region_add_subregion)
>>>
>>>    - Add command line options to connect GPIOs and clocks.
>>>
>>> This would hopefully allow for simple machines creation. We would then
>>> be able to use either the command line or the `-readconfig` option to
>>> create the machine.
>>>
>>> Note that we are not planning to use QMP/HMP for now. From our
>>> understanding, a `device_add` request is always considered as hot-plug,
>>> which is not what we want here.
>>>
>>> Please tell us what do you think about this plan. Any feedback is
>>> appreciated.  Then we can discuss the details of how to do this 
>>> properly.
>>> Thanks!
>>>
>>> -- 
>>> Luc
>>>
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 


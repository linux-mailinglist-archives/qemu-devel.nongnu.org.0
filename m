Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3A31AC04
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 15:04:23 +0100 (CET)
Received: from localhost ([::1]:54986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAvX2-0007Tx-Fl
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 09:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lAvR8-0006mT-CT
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:58:14 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lAvR5-0003NW-V6
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:58:14 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7F0C021C38;
 Sat, 13 Feb 2021 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1613224688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBzPTEYIzmZzoX4eyhJFnk9o+Xk9sQ34ub6022gt9MA=;
 b=5awS7xyMUXSc5bwZN2VZ6M7DvMOxc3XfBrkfEA9Uo3HjgWtGR9od/iLhfC4HAu7voLBo1N
 4bVrY9+qnriG5vGjXLnhAP76DQxv04u+IBut6fYe6jWJ2x2hdOjSbGxdL9VGWGmAneRbVU
 xwQdb0fuxoLlG4ZAM5y4eErs12pzpeY=
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
 <01ebe874-badf-0454-388c-00d49b2b3763@greensocs.com>
 <25208118-d432-c86f-1711-12e8491dd817@amazon.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <80cd81c4-ff7e-23ff-608a-ec85f5982577@greensocs.com>
Date: Sat, 13 Feb 2021 14:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <25208118-d432-c86f-1711-12e8491dd817@amazon.com>
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
 berrange@redhat.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, richard.fuhler@sifive.com,
 armbru@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 1:13 PM, Alexander Graf wrote:
> 
> 
> On 05.02.21 11:43, Luc Michel wrote:
>>
>> On 2/3/21 6:09 PM, Alexander Graf wrote:
>>>
>>>
>>> On 03.02.21 17:55, Philippe Mathieu-Daudé wrote:
>>>>
>>>> On 1/11/21 3:50 PM, Luc Michel wrote:
>>>>> Hi,
>>>>>
>>>>> We would like to work on improving QEMU to be able to create custom
>>>>> machines from the command line. The goal here is to get feedback from
>>>>> the community and shape the future developments.
>>>>
>>>> Cc'ing John who is working on command line, and some developers from
>>>> the "inter-VM device emulation interface" call.
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg723252.html
>>>>
>>>>>
>>>>> The use case mainly comes from people working with tools to customize
>>>>> their designs, such as SiFive Core Designer
>>>>> (https://scs.sifive.com/core-designer). This kind of tools may allow
>>>>> creation or customization of a whole SoC, from the number of cores, to
>>>>> the memory and IRQ mapping of peripherals etc.
>>>>>
>>>>> The ultimate goal would be to be able to create any kind of machine on
>>>>> the command line. However we are aware that this is a substantial 
>>>>> amount
>>>>> of changes in QEMU.
>>>
>>> Is the command line really the right abstraction level here? Wouldn't it
>>> make more sense to have a QOM / <scripting language> bridge that allows
>>> you to create and connect QOM objects using for example Python?
>> Yes, after some discussions with the community, we are now working on
>> improving QMP to achieve this. We first started with the idea of the
>> command line because it seems to be the place where we had "almost"
>> everything we needed already. In either cases we are planning to use a
>> front-end script to go from e.g. a DTB to whatever QEMU interface we
>> will end up using.
>>
>>>
>>> You could then have machine descriptions in a script, which could be
>>> generated by the SoC customization tools.
>> Yes, most likely a DTB in our case.
> 
> So, something like this?
> 
>      https://github.com/Xilinx/qemu/blob/master/hw/arm/arm_generic_fdt.c

Yes, but we specifically want to avoid embedding the part that will 
parse and translate the DTB into QEMU.

> 
> I'm not sure how DTB would translate 1:1 into qom properties for a reeal 
> generic mechanism? And how easy it would be to extract target device 
> specifics, such as interrupt descriptors or PCI ranges properties.
I think there is no such 1:1 mapping. That's why we believe the tool(s) 
that parses the DTB and translate it into QMP commands must stay out of 
QEMU.

> 
> If you want to make this fully generic, try to ensure that you can model 
> weird beasts such as the q35 machine model.
> 
> Either way, the idea has come up multiple times before. I don't know of 
> anyone who successfully managed to push it upstream yet, but I 
> definitely hope we will be at a point where you can describe machine 
> models in something different than C.
We'll try an go step by step, to not raise all the issues at the same 
time hopefully.

Thanks

-- 
Luc

> 
> 
> Alex
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


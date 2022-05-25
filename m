Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C5533A53
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:59:33 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnng-0000DK-RJ
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntng5-0003cV-3O
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:51:43 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:33144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntng1-00023M-8I
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:51:39 -0400
Received: from [192.168.15.104] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id EFA282078C;
 Wed, 25 May 2022 09:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653472294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGqxExJ7ESOtfP6t87UXNL4XXXXYds48mgbfStukVAE=;
 b=wwzmnNKBHXoX+RDkosAgwblOXHLS1ZeqTNVo329/65lDUMgm7qOkXeuIDMY+YoIkGvkXQi
 8dBaX5YqJReMVFPhyLASGveRD4uYPnCnS2/Oyljcslyx5q0WnT4dBS7xsfIDrqZu8DO28A
 6OEYNdalcEaGBy3oXifVUUsQJxs3S00=
Message-ID: <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
Date: Wed, 25 May 2022 11:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
Content-Language: en-US-large
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/24/22 19:44, Mark Cave-Ayland wrote:
> On 24/05/2022 14:48, Damien Hedde wrote:
> 
>> Hi all,
>>
>> This series is about enabling to plug sysbus devices with
>> device_add QAPI command. I've put RFC because, there are several
>> options and I would like to know if you think the current version
>> is ok to be added in qemu.
>>
>> Right now only a few sysbus device can be plugged using "-device"
>> CLI option and a custom plugging mechanism. A machine defines a
>> list of allowed/supported sysbus devices and provides some code to
>> handle the plug. For example, it sets up the memory map and irq
>> connections.
>>
>> In order to configure a machine from scratch with qapi, we want to
>> cold plug sysbus devices to the _none_ machine with qapi commands
>> without requiring the machine to provide some specific per-device
>> support.
>>
>> There are mostly 2 options (option 1 is in these patches). Note that
>> in any case this only applies to "user-creatable" device.
>>
>> + Option 1: Use the current plug mechanism by allowing any sysbus
>> device, without adding handle code in the machine.
>>
>> + Option 2: Add a boolean flag in the machine to allow to plug any
>> sysbus device. We can additionally differentiate the sysbus devices
>> requiring the legacy plug mechanism (with a flag, for example) and
>> the others.
>>
>> The setup of the memory map and irq connections is not related to
>> the option choice above. We planned to rely on qapi commands to do
>> these operations. A new _sysbus-mmio-map_ command is proposed in this
>> series to setup the mapping. Irqs can already be connected using the
>> _qom-set_ command.
>> Alternatively we could probably add parameters/properties to device_add
>> to handle the memory map, but it looks more complicated to achieve.
>>
>> Based-on: <20220519153402.41540-1-damien.hedde@greensocs.com>
>>      ( QAPI support for device cold-plug )
>> Note that it does not stricly require this to be merged, but this series
>> does not make much sense without the ability to cold plug with device_add
>> first.
>>
>> Thanks for your feedback,
>> -- 
>> Damien
>>
>> Damien Hedde (3):
>>    none-machine: allow cold plugging sysbus devices
>>    softmmu/memory: add memory_region_try_add_subregion function
>>    add sysbus-mmio-map qapi command
>>
>>   qapi/qdev.json         | 31 ++++++++++++++++++++++++++
>>   include/exec/memory.h  | 22 +++++++++++++++++++
>>   hw/core/null-machine.c |  4 ++++
>>   hw/core/sysbus.c       | 49 ++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/memory.c       | 26 ++++++++++++++--------
>>   5 files changed, 123 insertions(+), 9 deletions(-)
> 
> Sorry for coming late into this series, however one of the things I've 
> been thinking about a lot recently is that with the advent of QOM and 
> qdev, is there really any distinction between TYPE_DEVICE and 
> TYPE_SYS_BUS_DEVICE anymore, and whether it makes sense to keep 
> TYPE_SYS_BUS_DEVICE long term.

On QAPI/CLI level there is a huge difference since TYPE_SYS_BUS_DEVICE 
is the only subtype of TYPE_DEVICE which is subject to special 
treatment. It prevents to plug a sysbus device which has not be allowed 
by code and that's what I want to get rid of (or workaround by allowing 
all of them).

> 
> No objection to the concept of being able to plug devices into the none 
> machine, but I'm wondering if the "sysbus-mmio-map" QAPI command should 
> be a generic "device-map" instead so that the concept of SYS_BUS_DEVICE 
> doesn't leak into QAPI.

It is possible to change this command to a more generic command if 
people feel better with it.
Instead of providing a mmio index we just need to provide an argument to 
identify the memory region in the device (by it's name/path maybe ?).

> 
> Can you give a bit more detail as to the sequence of QMP transactions 
> that would be used to map a SYS_BUS_DEVICE with this series applied? I'm 
> particularly interested to understand how SYS_BUS_DEVICEs are 
> identified, and how their memory regions and gpios are enumerated by the 
> client to enable it to generate the final "sysbus-mmio-map" and 
> "qom-set" commands.

Here's a typical example of commands to create and connect an uart (here 
"plic" is the id of the interrupt controller created before):
 > device_add driver=ibex-uart id=uart chardev=serial0
 > sysbus-mmio-map device=uart addr=1073741824
 > qom-set path=uart property=sysbus-irq[0] value=plic/unnamed-gpio-in[1]
 > qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
 > qom-set path=uart property=sysbus-irq[2] value=plic/unnamed-gpio-in[3]
 > qom-set path=uart property=sysbus-irq[3] value=plic/unnamed-gpio-in[4]

This comes from one of my example here (it needs more patches than this 
series): 
https://github.com/GreenSocs/qemu-qmp-machines/blob/master/riscv-opentitan/machine.qmp

I'm note sure what you mean by identification and enumeration. I do not 
do any introspection and rely on knowing which mmio or irq index 
corresponds to what. The "id" in `device_add` allows to reference the 
device in following commands.

Thanks,
--
Damien


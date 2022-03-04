Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC404CD2C3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:51:13 +0100 (CET)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Wi-0001Vw-FN
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nQ5Om-0001nq-FQ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:43:00 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nQ5Ok-0003L9-6T
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:43:00 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E8F5221C36;
 Fri,  4 Mar 2022 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1646390574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hK33hMN1ANGa5mxb9VKAV1e4buFLy8Mfuc/1AMXP2Wo=;
 b=y0cyZgSYZLTwk1xw/nf+y7bJjryaAGP7B/OyuK6XnY0Rn1PGhOXWPjeBXn5RVhF4KjvFOv
 848aEZ1CBbq1EnALfMMUVLuPx1Mtz63V+MsSz83yF/jWL8oYrRaucy2fh3eujg+6sr4wit
 sc6JFDP0/QmlhlymlkV1+qUbguQbvj4=
Message-ID: <77bcc8d7-a906-f97a-c927-927c2eb4fce0@greensocs.com>
Date: Fri, 4 Mar 2022 11:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 12/14] add sysbus-mmio-map qapi command
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-13-damien.hedde@greensocs.com>
 <a507b986-c8fb-3deb-5531-54fcbb35039e@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <a507b986-c8fb-3deb-5531-54fcbb35039e@gmail.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/3/22 15:59, Philippe Mathieu-Daudé wrote:
> On 23/2/22 10:07, Damien Hedde wrote:
>> This command allows to map an mmio region of sysbus device onto
>> the system memory. Its behavior mimics the sysbus_mmio_map()
>> function apart from the automatic unmap (the C function unmaps
>> the region if it is already mapped).
>> For the qapi function we consider it is an error to try to map
>> an already mapped function. If unmapping is required, it is
>> probably better to add a sysbus-mmip-unmap command.
> 
> "sysbus-mmio-unmap" typo I presume.
> 
>> This command is still experimental (hence the 'unstable' feature),
>> as it is related to the sysbus device creation through qapi commands.
>>
>> This command is required to be able to dynamically build a machine
>> from scratch as there is no qapi-way of doing a memory mapping.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>>
>> v4:
>>   + integrate priority parameter
>>   + use 'unstable' feature flag instead of 'x-' prefix
>>   + bump version to 7.0
>>   + dropped Alistair's reviewed-by as a consequence
>> ---
>>   qapi/qdev.json   | 31 ++++++++++++++++++++++++++++++
>>   hw/core/sysbus.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 80 insertions(+)
>>
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index 2e2de41499..4830e87a90 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -160,3 +160,34 @@
>>   ##
>>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>>     'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @sysbus-mmio-map:
>> +#
>> +# Map a sysbus device mmio onto the main system bus.
>> +#
>> +# @device: the device's QOM path
>> +#
>> +# @mmio: The mmio number to be mapped (defaults to 0).
>> +#
>> +# @addr: The base address for the mapping.
>> +#
>> +# @priority: The priority of the mapping (defaults to 0).
>> +#
>> +# Features:
>> +# @unstable: Command is meant to map sysbus devices
>> +#            while in preconfig mode.
>> +#
>> +# Since: 7.0
>> +#
>> +# Returns: Nothing on success
>> +#
>> +##
>> +
>> +{ 'command': 'sysbus-mmio-map',
>> +  'data': { 'device': 'str',
>> +            '*mmio': 'uint8',
>> +            'addr': 'uint64',
>> +            '*priority': 'int32' },
> 
> I wonder if not providing the explicit parent container now could
> be problematic later, and if we shouldn't start with a QOM MR path
> (default to 'system_memory'). Anyway, sysbus are currently
> restricted to system_memory so as you described, this mimics well
> sysbus_mmio_map().

I think we ended-up adding such a parameter to handle complex xilinx 
machines having several cpu clusters. I wanted to stay simple in this 
series here as there are probably several way to address this issue. (we 
could also add a bus parameter, and create more sysbus).
We can still add the parameter later, with an appropriate default value 
(or even make the parameter mandatory).

If everybody agree to go for the bus-less approach. I can add the MR 
parameter right now.

CCing Igor

>> +void qmp_sysbus_mmio_map(const char *device,
>> +                         bool has_mmio, uint8_t mmio,
>> +                         uint64_t addr,
>> +                         bool has_priority, int32_t priority,
>> +                         Error **errp)
>> +{
>> +    Object *obj = object_resolve_path_type(device, 
>> TYPE_SYS_BUS_DEVICE, NULL);
>> +    SysBusDevice *dev;
>> +
>> +    if (phase_get() != PHASE_MACHINE_INITIALIZED) {
>> +        error_setg(errp, "The command is permitted only when "
>> +                         "the machine is in initialized phase");
> 
> "command only permitted during the " #PHASE_MACHINE_INITIALIZED "phase"?

What do you mean by '#', this is not a macro parameter. 
PHASE_MACHINE_INITIALIZED is just an enum value and there is no 
human/qapi exposed name.
"when the machine is initialized/initializing" ?
I think all the machine phase error message are bit like that (not 
mentioning the phase).



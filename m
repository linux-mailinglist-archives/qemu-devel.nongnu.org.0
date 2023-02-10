Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C180A691E6F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:37:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRi0-0006yY-JR; Fri, 10 Feb 2023 06:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQRhy-0006y0-0O
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:36:50 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQRhv-0005HR-Iy
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:36:49 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 057D65FFE6;
 Fri, 10 Feb 2023 14:36:38 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1310::1:f] (unknown
 [2a02:6b8:b081:1310::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 badksF0OjuQ1-Fm0XHJ04; Fri, 10 Feb 2023 14:36:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676028997; bh=M6iPjpcHBv+j4DOwjRn1puL7FcRw7GL+dkTTs1aPO+I=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=SsMBukJh0mNNC0+iMpayP5ZHPsyFXKKFPJju+M/9H2l24ACNSp1nfsoLu2sWwp3Q7
 Eo2GiB9Lf5OFwcL8iQeqnmEDgXJHxo+R6n/AsZDX+glC7vQNNA98iUIlIWdTKltN+q
 mEIgoIT/tI2NiW6M7zmRL/MR1rZWWqtQEbK4+XM4=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c361c5f3-c623-09e9-0519-cf9ba68ae0a1@yandex-team.ru>
Date: Fri, 10 Feb 2023 14:36:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
 <875yc9vmxz.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <875yc9vmxz.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 10.02.23 13:23, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> 
>> For PCIe and SHPC hotplug it's important to track led indicators,
>> especially the power led. Add an event that helps.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   qapi/qdev.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/pci/pci.h | 15 +++++++++++
>>   hw/pci/pci.c         | 33 +++++++++++++++++++++++
>>   hw/pci/pcie.c        | 49 ++++++++++++++++++++++++++++++++++
>>   hw/pci/shpc.c        | 42 ++++++++++++++++++++++++++++++
>>   5 files changed, 201 insertions(+)
>>
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index 2708fb4e99..40dc34f091 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -158,3 +158,65 @@
>>   ##
>>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>>     'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @HotplugLedState:
>> +#
> 
> No documentation?

Will do!

> 
>> +# Since: 8.0
>> +##
>> +{ 'enum': 'HotplugLedState',
>> +  'data': [ 'on', 'blink', 'off' ] }
>> +
>> +##
>> +# @HotplugPowerState:
> 
> No documentation?
> 
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'enum': 'HotplugPowerState',
>> +  'data': [ 'on', 'off' ] }
> 
> Why not bool?

I wanted to reflect PCI_EXP_SLTCTL_PWR_ON and PCI_EXP_SLTCTL_PWR_OFF.

On the other hand, it's just a bit in the config. Power Controller Control. An unobvious thing that

  0 = Power On
  1 = Power Off

for that bit. So with proper documentation we can use boolean. But on/off is more obvious.

> 
>> +##
>> +# @HotplugSlotState:
> 
> No documentation?
> 
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'enum': 'HotplugSlotState',
>> +  'data': [ 'power-only', 'enabled', 'disabled' ] }
>> +
>> +##
>> +# @HotplugState:
>> +#
>> +# @hotplug-device: hotplug device id
>> +# @hotplug-path: hotplug device path
>> +# @hotplug-slot: hotplug device slot (only for SHPC)
>> +# @device: device name
>> +# @path: device path
>> +# @power-led: Power Indicator
>> +# @attention-led: Attention Indicator
>> +# @state: slot state, only for SHPC hotplug controller
>> +# @power: Power Controller state, only for PCIe hotplug
> 
> 
> 
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'struct': 'HotplugState',
>> +  'data': { '*hotplug-device': 'str',
>> +            'hotplug-path': 'str',
>> +            '*hotplug-slot': 'int',
>> +            '*device': 'str',
>> +            'path': 'str',
>> +            '*power-led': 'HotplugLedState',
>> +            '*attention-led': 'HotplugLedState',
>> +            '*state': 'HotplugSlotState',
>> +            '*power': 'HotplugPowerState' } }
> 
> Too terse.

Will fix)

> 
> What do @hotplug-device and @device name?  Are these qdev-id?
> 
> What kind of paths are @hotplug-path and @path?  Are these paths to an
> object device in the QOM tree?  Which object?

device / path is same name and path as for DEVICE_DELETED

> 
> What's a @hotplug-slot?

pci slot. Significant for SHPC

> 
>> +
>> +##
>> +# @HOTPLUG_STATE:
>> +#
>> +# Emitted whenever the state of hotplug controller is changed.
> 
> Suggest "the state of hotplug controller changes."
> 
> Regardless, too terse.  What state changes exactly trigger the event?

Any change of power-led / attention-led / state / power.

Will add a description

> 
>> +# Only changed values are included into event.
> 
> "in the event"
> 
> Which values are included for each event trigger?

- device ids and names always included
- power-led / attention-led / state / power  - only those who changed

> 
>> +# Only SHPC and PCIe-native hotplug are supported.
> 
> Suggest something like "only ... provide this event."
> 
> Are parts of HotplugState specific to "SHPC and PCIe-native"?  Or asked
> differently: when we make other kinds of hotplug send the event, what
> would we need to change here?

Hmm. Looks like I'd better use a union with type discriminator. This way we'll be able to add any other hotplug later.

(and even now it's better, as not all 4 state fields are shared for PCIe and SHPC)

> 
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'event': 'HOTPLUG_STATE',
>> +  'data': 'HotplugState' }
> 
> [...]
> 

-- 
Best regards,
Vladimir



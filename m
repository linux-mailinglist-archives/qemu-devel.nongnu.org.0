Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545D6A7D71
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:16:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXf3H-0003nR-Fl; Thu, 02 Mar 2023 04:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXf3D-0003lJ-7J
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:16:35 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXf3A-0000wO-P7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:16:34 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:57a5:0:640:1f49:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id BCDF35EE72;
 Thu,  2 Mar 2023 12:16:25 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7321::1:10] (unknown
 [2a02:6b8:b081:7321::1:10])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id NGSfSB0On8c0-4nN5NNRx; Thu, 02 Mar 2023 12:16:24 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <c826b232-0df4-e3a2-c076-3a9fc0c3df28@yandex-team.ru>
Date: Thu, 2 Mar 2023 12:16:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 18/18] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-19-vsementsov@yandex-team.ru>
 <20230301160635-mutt-send-email-mst@kernel.org>
 <5a92d09e-d682-427a-cae0-58b8ec51f75e@yandex-team.ru>
 <20230302034518-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230302034518-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 02.03.23 11:50, Michael S. Tsirkin wrote:
> On Thu, Mar 02, 2023 at 11:39:42AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 02.03.23 00:07, Michael S. Tsirkin wrote:
>>> On Thu, Feb 16, 2023 at 09:03:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> We have DEVICE_DELETED event, that signals that device_del command is
>>>> actually completed. But we don't have a counter-part for device_add.
>>>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>>>> when the device in some intermediate state. Let's add an event that say
>>>> that the device is finally powered on, power indicator is on and
>>>> everything is OK for next manipulation on that device.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>
>>> I don't much mind though a bit more motivation would be nice.
>>> How is this going to be used? When does management care?
>>
>> Some motivations:
>>
>> 1. To be sure that device is "accepted" by guest. Guest may ignore hotplugged device for some reason (for example during OS booting). Management wants to catch this and handle the problem, instead of silent assume that everything is OK. So, if we don't get the event by some timeout, we can report an error, try to unplug/plug the disk again or do some other things to handle the problem.
> 
> Note this is kind of weak in that we don't know that there's a driver.

Still, in many cases we are sure that guest has the driver, but can't be sure that the hotplug is handled by guest at all

> 
>> 2. The device can't be removed (by blockdev-del) while power indicator of hotplug controller is blinking (QEMU reports "guest is busy (power indicator blinking)"). So, management should avoid removing the device until it gets the DEVICE_ON event.
> 
> That always annoyed me. I wanted delete to just stay pending until
> it triggers.
> 
> But if we can't fix that> it's a good reason.  However it can always
> start blinking again. So DEVICE_ON is not a good name. DEVICE_REMOVABLE?
> And not it's not realiable, it can start blinking by the time you try to
> remove.
> Another problem is that guest can create a flood of these events
> by starting/stopping blinking.

Hmm, right. Do we have some generic rate-limitator for events?

> 
> Maybe, if blockdev-del fails then we start listening for events
> and notify when it can be retried?
> 
> DEVICE_DELETED_RETRY ?

Actually HOTPLUG_STATE event from previous patch cover this.

So, DEVICE_ON is a convenient generic wrapper, to track plug process for different hotplug controllers in the same simple way: wait some seconds for DEVICE_ON, if it comes - we are OK, if not - handle error.

> 
>> 3. Also, management tool may make a GUI visualization of power indicator with help of this event.
>>
>>>
>>> Meanwhile, for the schema - can this one get ACKs from QAPI maintainers please?
>>>
>>>
>>>> ---
>>>>    qapi/qdev.json | 10 ++++++++++
>>>>    hw/pci/pcie.c  | 14 ++++++++++++++
>>>>    hw/pci/shpc.c  | 12 ++++++++++++
>>>>    3 files changed, 36 insertions(+)
>>>>
>>>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>>>> index 6f2d8d6647..116a8a7de8 100644
>>>> --- a/qapi/qdev.json
>>>> +++ b/qapi/qdev.json
>>>> @@ -348,3 +348,13 @@
>>>>    { 'command': 'query-hotplug',
>>>>      'data': { 'id': 'str' },
>>>>      'returns': 'HotplugInfo' }
>>>> +
>>>> +##
>>>> +# @DEVICE_ON:
>>>> +#
>>>> +# Emitted whenever the device insertion completion is acknowledged by the guest.
>>>> +# For now only emitted for SHPC and PCIe-native hotplug.
>>>> +#
>>>> +# Since: 8.0
>>>> +##
>>>> +{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
>>>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>>>> index 636f962a23..4297e4e8dc 100644
>>>> --- a/hw/pci/pcie.c
>>>> +++ b/hw/pci/pcie.c
>>>> @@ -22,6 +22,7 @@
>>>>    #include "monitor/qdev.h"
>>>>    #include "qapi/error.h"
>>>> +#include "qapi/qapi-events-qdev.h"
>>>>    #include "hw/pci/pci_bridge.h"
>>>>    #include "hw/pci/pcie.h"
>>>>    #include "hw/pci/msix.h"
>>>> @@ -47,6 +48,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
>>>>            && (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
>>>>    }
>>>> +static bool pcie_sltctl_powered_on(uint16_t sltctl)
>>>> +{
>>>> +    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON &&
>>>> +        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_ON &&
>>>> +        (sltctl & PCI_EXP_SLTCTL_AIC) == PCI_EXP_SLTCTL_ATTN_IND_OFF;
>>>> +}
>>>> +
>>>>    static LedActivity pcie_led_state_to_qapi(uint16_t value)
>>>>    {
>>>>        switch (value) {
>>>> @@ -816,6 +824,12 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>>>>            qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &changed_state);
>>>>        }
>>>> +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
>>>> +        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
>>>> +    {
>>>> +        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
>>>> +    }
>>>> +
>>>>        /*
>>>>         * If the slot is populated, power indicator is off and power
>>>>         * controller is off, it is safe to detach the devices.
>>>> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
>>>> index 6a4f93949d..380b2b83b3 100644
>>>> --- a/hw/pci/shpc.c
>>>> +++ b/hw/pci/shpc.c
>>>> @@ -299,6 +299,12 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
>>>>        return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
>>>>    }
>>>> +static bool shpc_slot_is_on(uint8_t state, uint8_t power, uint8_t attn)
>>>> +{
>>>> +    return state == SHPC_STATE_ENABLED && power == SHPC_LED_ON &&
>>>> +        attn == SHPC_LED_OFF;
>>>> +}
>>>> +
>>>>    static void shpc_slot_command(PCIDevice *d, uint8_t target,
>>>>                                  uint8_t state, uint8_t power, uint8_t attn)
>>>>    {
>>>> @@ -366,6 +372,12 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
>>>>                SHPC_SLOT_EVENT_MRL |
>>>>                SHPC_SLOT_EVENT_PRESENCE;
>>>>        }
>>>> +
>>>> +    if (!shpc_slot_is_on(old_state, old_power, old_attn) &&
>>>> +        shpc_slot_is_on(state, power, attn) && child_dev)
>>>> +    {
>>>> +        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
>>>> +    }
>>>>    }
>>>>    static void shpc_command(PCIDevice *d)
>>>> -- 
>>>> 2.34.1
>>>
>>
>> -- 
>> Best regards,
>> Vladimir
> 

-- 
Best regards,
Vladimir



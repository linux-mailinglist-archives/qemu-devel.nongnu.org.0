Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADB4692034
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTmT-0004bU-Sp; Fri, 10 Feb 2023 08:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQTmM-0004QB-Bw
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:49:30 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQTmJ-0001Hf-G6
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:49:30 -0500
Received: from sas1-1ced178f0cda.qloud-c.yandex.net
 (sas1-1ced178f0cda.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3a29:0:640:1ced:178f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id BBFC762279;
 Fri, 10 Feb 2023 16:49:19 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1310::1:f] (unknown
 [2a02:6b8:b081:1310::1:f])
 by sas1-1ced178f0cda.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Inf9QH0PmKo1-SfcsfhlG; Fri, 10 Feb 2023 16:49:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676036958; bh=d6rKhXLMDsXv4KTwD9GmOXfa+7YgEq3L8vrA+tz5JjE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=BnBQb9XaNSlv46fehWSzwK7zMisShUzlcSYYddoA08yEUx9ofzyj02ry+IeFOTbBS
 1urDKLTFsRb9BndPSd+09p6QKlmyc4/nrKbhU389xmV+OdEt8qJQcUTSrXS77U9QS+
 zG2npG64wjQzSneAuF0z8j2UUHHiRwbj2x8kje9M=
Authentication-Results: sas1-1ced178f0cda.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ad626b08-1bc4-7e3b-cc69-e5384a3dc6e3@yandex-team.ru>
Date: Fri, 10 Feb 2023 16:49:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 14/15] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-15-vsementsov@yandex-team.ru>
 <37ebba4c-b522-37ee-dab8-c88061848d34@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <37ebba4c-b522-37ee-dab8-c88061848d34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 10.02.23 00:37, Philippe Mathieu-Daudé wrote:
> On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
>> We have DEVICE_DELETED event, that signals that device_del command is
>> actually complited. But we don't have a counter-part for device_add.
>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>> when the device in some intermediate state. Let's add an event that say
>> that the device is finally powered on, power indicator is on and
>> everything is OK for next manipulation on that device.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   qapi/qdev.json | 24 ++++++++++++++++++++++++
>>   hw/pci/pcie.c  | 12 ++++++++++++
>>   hw/pci/shpc.c  | 12 ++++++++++++
>>   3 files changed, 48 insertions(+)
>>
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index 40dc34f091..94da7ca228 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -220,3 +220,27 @@
>>   ##
>>   { 'event': 'HOTPLUG_STATE',
>>     'data': 'HotplugState' }
>> +
>> +
>> +##
>> +# @DEVICE_ON:
>> +#
>> +# Emitted whenever the device insertion completion is acknowledged by the guest.
>> +# For now only emitted for SHPC and PCIe-native hotplug.
>> +#
>> +# @device: device name
>> +#
>> +# @path: device path
>> +#
>> +# Since: 8.0
>> +#
>> +# Example:
>> +#
>> +# <- { "event": "DEVICE_ON",
>> +#      "data": { "device": "virtio-net-pci-0",
>> +#                "path": "/machine/peripheral/virtio-net-pci-0" },
> 
> Why provide both device & path? Could the type_name be helpful?

I just follow DEVICE_DELETED event. Not sure that it's the best thing to do)

> 
>> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>> +#
>> +##
>> +{ 'event': 'DEVICE_ON',
>> +  'data': { '*device': 'str', 'path': 'str' } }
>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>> index 37e2979b3c..bc7e60ff9d 100644
>> --- a/hw/pci/pcie.c
>> +++ b/hw/pci/pcie.c
>> @@ -45,6 +45,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
>>           (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
>>   }
>> +static bool pcie_sltctl_powered_on(uint16_t sltctl)
>> +{
>> +    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON &&
>> +        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_ON &&
>> +        (sltctl & PCI_EXP_SLTCTL_AIC) == PCI_EXP_SLTCTL_ATTN_IND_OFF;
>> +}
>> +
>>   static HotplugLedState pcie_led_state_to_qapi(uint16_t value)
>>   {
>>       switch (value) {
>> @@ -816,6 +823,11 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>>                               0, 0, /* no state */
>>                               pcie_power_state_to_qapi(old_pcc),
>>                               pcie_power_state_to_qapi(pcc));
>> +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
>> +        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
>> +    {
>> +        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
>> +    }
> 
> Beside this series aims, but this probably belong to the QDev layer;
> if we ever model power domains & co some day.
> Then this would be refactored to something like:
> 
>            qdev_set_power_on(DEVICE(child_dev));

I thought about it but was not sure where such helper should be placed. For DEVICE_DELETED we don't have one..

-- 
Best regards,
Vladimir



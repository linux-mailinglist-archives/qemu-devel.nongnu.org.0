Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50166944D1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRXFD-0001CU-CQ; Mon, 13 Feb 2023 06:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRXFA-0001AF-Ia
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:43:36 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRXF8-0003Ng-DX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:43:36 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E808E6010B;
 Mon, 13 Feb 2023 14:43:26 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6527::1:3a] (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 QhgRD00QeqM1-UOVUcVK4; Mon, 13 Feb 2023 14:43:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676288606; bh=rxVyqsZwKQ9lcAplHMpmGlUiU8kJaJ49XKsTGj+fLsQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=J3uQuDovCduwhTua+D+ktKV3HgLmEMBdDEcuXSC2pIM937YwvWAz3Cc7iDp+yJ6EQ
 8GcEblvqA/sly1gJYjQrXARidF4BU9xZ5JqMI3qh0zEP/qHLewVVM4oumyaT1d++xN
 zR9ipPbbQ87ZPaucxPm3vvrMBzWJ8E7e0uvTLjdE=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <bbe4be57-2840-46e8-9d7a-8d4c29252d13@yandex-team.ru>
Date: Mon, 13 Feb 2023 14:43:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 14/15] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 eblake@redhat.com, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-15-vsementsov@yandex-team.ru>
 <37ebba4c-b522-37ee-dab8-c88061848d34@linaro.org>
 <ad626b08-1bc4-7e3b-cc69-e5384a3dc6e3@yandex-team.ru>
 <873579x67l.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <873579x67l.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 13.02.23 12:30, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> 
>> On 10.02.23 00:37, Philippe Mathieu-Daudé wrote:
>>> On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
>>>> We have DEVICE_DELETED event, that signals that device_del command is
>>>> actually complited. But we don't have a counter-part for device_add.
>>>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>>>> when the device in some intermediate state. Let's add an event that say
>>>> that the device is finally powered on, power indicator is on and
>>>> everything is OK for next manipulation on that device.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>> ---
>>>>    qapi/qdev.json | 24 ++++++++++++++++++++++++
>>>>    hw/pci/pcie.c  | 12 ++++++++++++
>>>>    hw/pci/shpc.c  | 12 ++++++++++++
>>>>    3 files changed, 48 insertions(+)
>>>>
>>>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>>>> index 40dc34f091..94da7ca228 100644
>>>> --- a/qapi/qdev.json
>>>> +++ b/qapi/qdev.json
>>>> @@ -220,3 +220,27 @@
>>>>    ##
>>>>    { 'event': 'HOTPLUG_STATE',
>>>>      'data': 'HotplugState' }
>>>> +
>>>> +
>>>> +##
>>>> +# @DEVICE_ON:
>>>> +#
>>>> +# Emitted whenever the device insertion completion is acknowledged by the guest.
>>>> +# For now only emitted for SHPC and PCIe-native hotplug.
>>>> +#
>>>> +# @device: device name
> 
> Make that "the device's ID if it has one", and ...
> 
>>>> +#
>>>> +# @path: device path
> 
> ... "the device's QOM path", please.
> 
>>>> +#
>>>> +# Since: 8.0
>>>> +#
>>>> +# Example:
>>>> +#
>>>> +# <- { "event": "DEVICE_ON",
>>>> +#      "data": { "device": "virtio-net-pci-0",
>>>> +#                "path": "/machine/peripheral/virtio-net-pci-0" },
>>>
>>> Why provide both device & path? Could the type_name be helpful?
>>
>> I just follow DEVICE_DELETED event. Not sure that it's the best thing to do)
> 
> The device ID is redundant, since the QOM path of a device with an ID is
> /machine/peripheral/ID.
> 
> Fine print: code could conceivably violate this invariant.  But code
> should *not* create devices with IDs.  IDs are strictly for the user.
> 
> We commonly send both device ID and QOM path, mostly for historical
> reasons: the former precede the latter.
> 
> There are exceptions, such as query-cpus-fast.  Can't say offhand
> whether CPUs can be created with IDs.
> 
> It's probably best to remain consistent with DEVICE_DELETED here.
> 
> I'd be in favour of deprecating and deleting redundant device IDs in QMP
> output.
> 

Hmm. Good. I can make a patch with deprecation and add new events with only QOM path fields after it.

-- 
Best regards,
Vladimir



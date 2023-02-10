Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C00691D29
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQw3-0002tA-F4; Fri, 10 Feb 2023 05:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQQw0-0002sZ-D6
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:47:16 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQQvy-0001Zs-1Q
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:47:15 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id C31C55FF42;
 Fri, 10 Feb 2023 13:47:06 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1310::1:f] (unknown
 [2a02:6b8:b081:1310::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 5lc1IF0OjSw1-DnGgAxZL; Fri, 10 Feb 2023 13:47:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676026026; bh=Ta6P80ITA/P8IRuGA/eAU1Jfx85ZS6E5jwprw9gAPaU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=dcvlMoYTePWOTC/hFGCCp6vURP1zjq1YA9qypNfvVVwREI7EUwhZkIgTJu3sSg8Si
 tGOLWfhbdIlc+jU9FCY9omFJ079N2mwe4GAyPtozkdQ8ZR/c7h7pFSjHCBm7qGZ7Ct
 5odBJnYLGi0hu8vcOzI/AV9BWIdBqATiQdBfpmN8=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5ac6f2a0-ff4f-1c18-dfed-9ec24056f18f@yandex-team.ru>
Date: Fri, 10 Feb 2023 13:47:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
 <c6613d1d-b489-5094-fd8c-1795159d0a80@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <c6613d1d-b489-5094-fd8c-1795159d0a80@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
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

On 10.02.23 00:28, Philippe Mathieu-Daudé wrote:
> On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
>> For PCIe and SHPC hotplug it's important to track led indicators,
>> especially the power led. Add an event that helps.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   qapi/qdev.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/pci/pci.h | 15 +++++++++++
>>   hw/pci/pci.c         | 33 +++++++++++++++++++++++
>>   hw/pci/pcie.c        | 49 ++++++++++++++++++++++++++++++++++
>>   hw/pci/shpc.c        | 42 ++++++++++++++++++++++++++++++
>>   5 files changed, 201 insertions(+)
>>
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index 2708fb4e99..40dc34f091 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -158,3 +158,65 @@
>>   ##
>>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>>     'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @HotplugLedState:
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'enum': 'HotplugLedState',
>> +  'data': [ 'on', 'blink', 'off' ] }
> 
> Could this be more helpful as generic state in "hw/misc/led.h"?

Hmm. LEDState ? Doesn't look similar..

> 
>> +##
>> +# @HotplugPowerState:
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'enum': 'HotplugPowerState',
>> +  'data': [ 'on', 'off' ] }
> 
> Could it be better to have a generic SwitchState in qapi/common.json?
> 

Hmm not sure. This way I stress that it's part of PCIe spec.. Hmm. But still I didn't call it PCIE_*... Maybe generic OnOff in qapi/common.json would be the best.


-- 
Best regards,
Vladimir



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34F68D48A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:40:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLNc-0004Fp-VY; Tue, 07 Feb 2023 05:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPLNZ-0004Fd-BG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:39:13 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPLNX-0000Cb-Df
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:39:13 -0500
Received: from sas1-2d2912cdb877.qloud-c.yandex.net
 (sas1-2d2912cdb877.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:280d:0:640:2d29:12cd])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 31B2D61204;
 Tue,  7 Feb 2023 13:39:04 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:218::1:e] (unknown [2a02:6b8:b081:218::1:e])
 by sas1-2d2912cdb877.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3dZEPg0Or8c1-uce5gcAr; Tue, 07 Feb 2023 13:39:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675766343; bh=zEwjoCQ6IDBqX8u2Mi5xGh7BS6o7mprR/i2W1/C6Y6A=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=cOtMEv3by660vN/CuEBIrIf6J/A3MEuvma2muHAhBHOV+M7OhGlUrg+68PF/Md04C
 B+xLjK7hghjngNv6HDgSYomVO+8jHx8bVN5aAtbejljy4D3fe8pfNI+JqjXYnWBg6o
 GOpzs/yk5tAuyh4yXuzWQkP6qLZrKehSmv88wDks=
Authentication-Results: sas1-2d2912cdb877.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d6ea345b-d3d1-0dfa-20cb-fb328900086a@yandex-team.ru>
Date: Tue, 7 Feb 2023 13:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] pcie: add trace-point for power indicator transitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
 <20230204174758.234951-6-vsementsov@yandex-team.ru>
 <1dc32ad1-e52b-f1cd-c176-5844cdba6815@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <1dc32ad1-e52b-f1cd-c176-5844cdba6815@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

Thanks for reviewing!

On 05.02.23 13:56, Philippe Mathieu-Daudé wrote:
> On 4/2/23 18:47, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   hw/pci/pcie.c       | 20 ++++++++++++++++++++
>>   hw/pci/trace-events |  3 +++
>>   2 files changed, 23 insertions(+)
> 
>> +static const char *pcie_sltctl_pic_str(uint16_t sltctl)
>> +{
>> +    switch (sltctl & PCI_EXP_SLTCTL_PIC) {
>> +    case PCI_EXP_SLTCTL_PWR_IND_ON:
>> +        return "on";
>> +    case PCI_EXP_SLTCTL_PWR_IND_BLINK:
>> +        return "blink";
>> +    case PCI_EXP_SLTCTL_PWR_IND_OFF:
>> +        return "off";
>> +    default:
>> +        return "?";
> 
> Maybe "illegal"?

I just was unsure about it.

For SHPC, 0 is correct, and means that this command don't change the led state.

But with PCI-e hotplug we don't have such commands but change the led directly, so it must be one of "on"/"blink"/"off", and zero is really wrong, right?


Also, I'm now looking at /* TODO: send event to monitor */ in shpc code, and working on it. So, I think, I'll soon send patches with such event for both SHPC and PCI-e, and probably that trace point becomes not needed.

> 
> Otherwise:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> +    }
>> +}
> 

-- 
Best regards,
Vladimir



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A367538836
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:27:08 +0200 (CEST)
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlyk-0002wm-QG
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvlwu-0002A5-KB
 for qemu-devel@nongnu.org; Mon, 30 May 2022 16:25:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvlwt-0006t9-0b
 for qemu-devel@nongnu.org; Mon, 30 May 2022 16:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VYC9rdqhvsbZTrNyT3FK7ygYXqL3U/5rS3rYvxJzfh4=; b=fnnj37sukVk2B5CK7Ol2LrxJ/v
 RoFvfUtv23ZlC6LqLKQvOTMxpsJHVIkVTR8i0hr7reyYziy/1GnyStqWFzYg2dFDs2YcPE3A75Awz
 vcUfatHNe9GV9BBjgOanMU5w+KLqA5lOpx25rflsRzFWkOISzdVua8i2uos3R+DLjhBSLZWWp7Hke
 KRQfwvPjwmEIzrE6j+VAD2eolVbUfCfAeskf1bBaB7K++5U7gU8zq5UUXxHmSC0wZnBrikLCTQxE/
 Kp6kyfvgCZq9naB8Kf770ZudmCIQFlJnXW116vFvjrZBFWQYBbVT1m+ym1DF+Tip5jU2pw927l6Fr
 9tvsGRe/cY3HwWzlFKzmGQWFsCkCCfFlcUL6tykk9JhC4UATU7Gw1G7TUjsA0piLcFrPRJqb2Bjl7
 qfqzOwqNeGyVa11AWoR/N4CmNEiWVapaTs4e52Hq/vNtWy0zbwmNGy+EXV1Y3lYXK+7uv+GucguIE
 GhbUD0UlJsnduZTtENwvw+Tk+Vo09/QBJc11pRQNNJFiZAiz2GFt2e5wAz4Wl58OIDYQkNiMckUTd
 GUHjkPzuRoW9yfozPQZEd0XKosz8jIT3gEXUlD/v+9XtyG4SHYWCHpAm42ZzODaG+3fzN4GVBBlh8
 Lq7vwqoW33W5UyQBoDwEKBn+O8qauUj9l05tOAElE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvlva-0009U5-WC; Mon, 30 May 2022 21:23:55 +0100
Message-ID: <5d9f75bb-a559-ef8d-0bcb-9c594deea76a@ilande.co.uk>
Date: Mon, 30 May 2022 21:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, hpoussin@reactos.org,
 qemu-devel@nongnu.org
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-8-mark.cave-ayland@ilande.co.uk>
 <4BDCA8D0-F8C1-4C0D-8EFB-E003E1444AAA@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <4BDCA8D0-F8C1-4C0D-8EFB-E003E1444AAA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 07/12] hw/acpi/piix4: introduce piix4_pm_init() instance
 init function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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

On 29/05/2022 20:06, Bernhard Beschow wrote:

> Am 28. Mai 2022 09:19:29 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> Use the new piix4_pm_init() instance init function to initialise 2 separate qdev
>> gpios for the SCI and SMI IRQs.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/acpi/piix4.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index d897d2dee6..454fa34df1 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -497,6 +497,14 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>>      piix4_pm_add_properties(s);
>> }
>>
>> +static void piix4_pm_init(Object *obj)
>> +{
>> +    PIIX4PMState *s = PIIX4_PM(obj);
>> +
>> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>> +    qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
>> +}
> 
> The two IRQs still get connected internally. Doesn't this create the risk of double connections until patches 8 and 9 are applied?

No, that should be fine. Here the address of the IRQ is being made available as a 
qdev gpio for use by qdev_connect_gpio_out(). Since that isn't being used yet, and 
the 2 IRQs are still being set afterwards in piix4_pm_initfn(), everything should 
still work just as before.

>> +
>> PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
>>                                qemu_irq sci_irq, qemu_irq smi_irq,
>>                                int smm_enabled)
>> @@ -663,6 +671,7 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
>> static const TypeInfo piix4_pm_info = {
>>      .name          = TYPE_PIIX4_PM,
>>      .parent        = TYPE_PCI_DEVICE,
>> +    .instance_init  = piix4_pm_init,
>>      .instance_size = sizeof(PIIX4PMState),
>>      .class_init    = piix4_pm_class_init,
>>      .interfaces = (InterfaceInfo[]) {

ATB,

Mark.


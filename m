Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD6532F98
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:27:29 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYJc-0007ON-9u
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYGp-0004ud-Pt; Tue, 24 May 2022 13:24:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYGa-0006QM-F5; Tue, 24 May 2022 13:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EPGeL7ZRENlJWneVf0+6SMtnyDnUr6w+kVoTxUUYtLE=; b=JLCEtq4GWS1DwvKWJQTfqIw1ci
 iyZffB5SWczh9isOEkbZRlqRxPAYtviQDBxdkgc5VUpgOQ6tiTgESzr2CW5Z5mD/di3hGTMgDtQhb
 S5dokaGNnlFJRzSk6AC7c7ZIlJbTvy0JIVbH19v5+5XudAnMOO2BpKOX7qGr4iksz6CvYXqhipr6l
 mDN+Q+HZ1O5E30Ny+9B6eEqubKZlqZPoGO+8dElSzjXTovszhU1+Ie/Rv+xPX6PwNzkp893+rdWK9
 +2ib8cFrqNSfqice3vr6Whm4/09Qp+sEdWwp323bJgDLLNA8R78lCAN7nTl2kYS+HGrhyGhywL2c3
 fCTmQuVhQ/UcGsP3rVHRqUx+6/bAjMjHWEFaMh3Mit1CfjGiSmkRriQEfbSE3Xdf+1Vw4+byfDm8l
 KwxgFIdI983DrJV7GqZgyvUqxfD6BWLn5hLMDM8/UeTH85O1XaLe0uWOOUeVIflNnV5yEldal8HS+
 CCt7Ny1lMBDz82Jxt9rJ9bL4eIillnrrSdOS5QwUrav+T0PRBBRm6cU+qxPAJImjCCW0glIgFmokW
 EoXhop16nl6ha+SxbRVY+ivNhwTcD1r3Vsn86sRFCyDkCJxBFTpZ9wTZjVwX0pbtqNCLJUaAdlYh+
 q0b0NF6MHL3QavBKGNnWbJteudeQSGBbWxMeTAXxA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYFO-000AYV-Ua; Tue, 24 May 2022 18:23:11 +0100
Message-ID: <758bf46a-9d89-d36d-071b-24865b3bb874@ilande.co.uk>
Date: Tue, 24 May 2022 18:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-30-mark.cave-ayland@ilande.co.uk>
 <adb1830e-8b71-a889-7a2e-416f9f76d714@reactos.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <adb1830e-8b71-a889-7a2e-416f9f76d714@reactos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 29/50] pckbd: more vmstate_register() from i8042_mm_init()
 to i8042_mmio_realize()
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

On 23/05/2022 07:34, Hervé Poussineau wrote:

> Hello,
> 
> If you want, you can break migration compatibility. I don't see it as a problem.
> 
> Hervé

Thanks for suggesting this. Given that migration of the magnum machine was broken for 
a long time until I fixed it recently, I don't think it would be a problem either.

I was considering a similar proposal for lasips2 but was planning to do the migration 
break in the part 2 series as part of the QOM modelling improvements rather than in 
this initial series. I'll update the I8042_MMIO accordingly when my current working 
branch for part 2.

> Le 22/05/2022 à 20:18, Mark Cave-Ayland a écrit :
>> Note in this case it is not possible to register a (new) VMStateDescription in
>> the DeviceClass without breaking migration compatibility for the MIPS magnum
>> machine.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/pckbd.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index eb77ad193e..7f3578aa4d 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -681,6 +681,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
>>       memory_region_init_io(&s->region, OBJECT(dev), &i8042_mmio_ops, ks,
>>                             "i8042", s->size);
>> +
>> +    /* Note we can't use dc->vmsd without breaking migration compatibility */
>> +    vmstate_register(NULL, 0, &vmstate_kbd, ks);
>>   }
>>   static void i8042_mmio_init(Object *obj)
>> @@ -721,8 +724,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>>       s->irq_kbd = kbd_irq;
>>       s->irq_mouse = mouse_irq;
>> -    vmstate_register(NULL, 0, &vmstate_kbd, s);
>> -
>>       s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
>>       s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);


ATB,

Mark.


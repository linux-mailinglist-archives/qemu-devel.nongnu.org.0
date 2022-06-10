Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE6545CCB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 09:06:44 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzYjB-0002TU-QJ
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 03:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYar-0007XH-Da; Fri, 10 Jun 2022 02:58:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYaq-0005gb-01; Fri, 10 Jun 2022 02:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sAVCqxXZ23UBBEzhXUPRM6vBSQLahXKnCbHFZojlNOk=; b=P+r4wiFBvrxggWlH8HRpjJFKKq
 I/7ydakDzdoB3/gLJn8sCHX9oBlqaUsL8ST+tSqpE0cvD7fPWbvx8daDhGvZPCZicQOWeb0mp/wCA
 eQnLmTSij8WfQy3L5eAb4TCL8FIbzprJS1u8VE6dbdtykrkEgJYM+H4i8ZlyCVwxiGuEFJazhrlLY
 VfqbJdsILD2wchNoH55KAEJq0mSWZitaceLmANo6+flPm7IDmI6kYAOCQzAWIJ+IV8zH2FBpeeWdn
 4YBV1vV14u4RirZPD0A7Cjh2IHPw1Bo+rgwALcKKt9D0ja2shtmh5V73dNVf8eM5uTuZsI7M8Umbf
 /D6VjdSaehcdD0LL8l919YpaZNivjtjd7hrFlzkqSgUYc3DiY5u6c4p0H5b82gwBuyRQiyxs5zBgA
 rKw3hTE7cSDE5QkXxDQ82p4hbrvYK+9u6mxTWZEciv+Bel8ZfQ9Z8mK+8aELxqyBmQxes39leqBs7
 FBRp3WHMlVzPP4+vVlhOBk55X7uo28HCAnsfH9toYSPoE0A1oxjWDwOtUyu69WYdbvrS+07Pa0TCO
 oZoCz72JvoN5bBX+R7GeHE5FQnHll82C9BIko8hAJeKpI18UGST156jH30GZ7QVCeoxZxCxsddkwf
 AHizy6eU2SX7ZthrXq5z3Gl73BqDpClftcuh5cfX0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYZY-0001CC-Kk; Fri, 10 Jun 2022 07:56:48 +0100
Message-ID: <4401d5ff-7268-526f-db72-67161aa9b6de@ilande.co.uk>
Date: Fri, 10 Jun 2022 07:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-27-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA-VHn9qWQdUgOHDy6QQwuGwf5p2BXUOjG-zq4NPenf2PQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-VHn9qWQdUgOHDy6QQwuGwf5p2BXUOjG-zq4NPenf2PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 26/50] pckbd: implement i8042_mmio_init() function
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

On 09/06/2022 11:53, Peter Maydell wrote:

> On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This enables use to expose the register memory region of the I8042_MMIO device
>> using sysbus_init_mmio().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/pckbd.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index addd1f058a..c407c082e2 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -683,6 +683,13 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
>>                             "i8042", s->size);
>>   }
>>
>> +static void i8042_mmio_init(Object *obj)
>> +{
>> +    MMIOKBDState *s = I8042_MMIO(obj);
>> +
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->region);
>> +}
> 
> You don't initialize s->region until your device realize function;
> you should only call sysbus_init_mmio() after that, so this line
> belongs in the realize function too.

Yes indeed, I can fix this fairly easily.


ATB,

Mark.


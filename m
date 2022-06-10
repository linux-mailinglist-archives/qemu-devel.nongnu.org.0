Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2A545CBE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 09:00:07 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzYcn-0007je-Ow
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 03:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYWb-0003Gy-6P; Fri, 10 Jun 2022 02:53:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYWZ-00052N-LZ; Fri, 10 Jun 2022 02:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fMB90FSJtZya7rx++Bo7ETTqV5TcuPFY3/82ceRP05I=; b=YVhkJ3XgMVXUB16pF9YUEQITJ9
 kCNrjMA6wqQBrKyrfMf5FAN4w1GsJJug/cXYkAd+j95gaOvZGapo/WWNKJY7w9Q906jG7FJDwUvAM
 LICbYPr3obGKPlQejoeFMGvuizwZd7X5/UhutIZCMo+4OCaOhhkG6lZ39ZWUFgSViOWpr2B8hU9kj
 NDEIlmYESEZSbc5OvDyRKsGp5S9eIMvJgxv02dQmlipdIIbxWloFQxKeMxwCyR1gdpiT9lraqwXsH
 KYwATSLwwuRj7LrRTy3XBArZXCMfIB5us/LiBdYP2b3eCULeSBslyqhUX8rqxYybBfUecSnIdUzgg
 Xo0I2c4uhrqFlUKG7Q/IisNx+L+n/WQcpa47SyjTsuT0JyZPMbPmfZ8NoAj/t9ZXWf3QjiD1h8+XY
 /hAibVKSs4x7rAwQ9rIV+f5HQ/KmTjOeLnAFC0WBOdXDqRo2sZqH4hhRnkHGWUBK2wxeHvE0hQaVr
 um2oBKV5LgB7zRAgSvmmlbVxVftDfjSk+WZ0GIVrgND+uHLYphPYs/mvcBjHJBAwrUBVrEZu8StSg
 YJPRVNURIZrP7gPnExUCsSxu/qEQxg5k+Pj9pAxoax2zfZ6wEtmaAgzmLuywNTaizU0X4BQ9xw47e
 Gx0JRSZGMiCTRP2fmCc685J8IJO2IioeHV5UXcWEg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYVE-000172-55; Fri, 10 Jun 2022 07:52:20 +0100
Message-ID: <9fb5d9ea-35c0-c6a9-d2d9-b264093665ee@ilande.co.uk>
Date: Fri, 10 Jun 2022 07:53:17 +0100
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
 <20220522181836.864-23-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9UcEHGE0BL5Dz3mVC+T9Z4XrMidhxFGWR92sMQ-0rrEA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA9UcEHGE0BL5Dz3mVC+T9Z4XrMidhxFGWR92sMQ-0rrEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 22/50] pckbd: implement i8042_mmio_reset() for I8042_MMIO
 device
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

On 09/06/2022 11:49, Peter Maydell wrote:

> On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This allows the I8042_MMIO reset function to be registered directly within the
>> DeviceClass rather than using qemu_register_reset() directly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/pckbd.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index bbdd3bc568..df443aaff2 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -665,10 +665,20 @@ static const MemoryRegionOps i8042_mmio_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>
>> +static void i8042_mmio_reset(DeviceState *dev)
>> +{
>> +    MMIOKBDState *s = I8042_MMIO(dev);
>> +    KBDState *ks = &s->kbd;
>> +
>> +    ks->extended_state = true;
>> +    kbd_reset(ks);
>> +}
> 
> extended_state is not runtime guest-changeable state, it's a
> device property that's set at device creation time. So we
> shouldn't be setting it to 'true' here, but instead in the
> device init or realize function.

Ah oops. I'll move it to a corresponding device init function in v2.


ATB,

Mark.


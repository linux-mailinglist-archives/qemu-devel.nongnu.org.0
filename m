Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577533F833B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 09:43:33 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJA2u-0001wX-D9
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 03:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJA1e-0001Gl-0y; Thu, 26 Aug 2021 03:42:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJA1Y-0006uA-4l; Thu, 26 Aug 2021 03:42:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u9so3475123wrg.8;
 Thu, 26 Aug 2021 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v8es6gbLCJsCDDNzwbACyTEiHAj7Ie+3La7R7ZFWeCA=;
 b=rfevmODYEFospwqAoSJ3xrxeBEaOmMcAwhsVPipTC83xjDjuC/Y2ABvF5sZCZoUkEM
 TAnsYh8twBwfC5n4HqARsU7HLLJmitptS8YEcqOcIIL0h4sv/yTgJHn0z8+2STDJnSA9
 flnyUUWIAN9PmrYD1CBTf1umozuPHXNwt/SVVyEpivSD/Tfo4P1WL4l2qFfgFbQ6dbEo
 MRi0GU9t4PqilkKtoYFOUlO5hc6fLmDU6BRTu8bMDtmRNtIvcufIjZGpAzPJ3TnbM7OV
 z4OrL8SixOdsYUnRp80WN+wDS6qFG4Xhk3B2MAWEjQ8ZmrK745k3fbVT/N5Mx+ucpe/o
 3vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v8es6gbLCJsCDDNzwbACyTEiHAj7Ie+3La7R7ZFWeCA=;
 b=i5tbMiwr6L7AkbVALPMy7xnXujBDB5PzVEk5uEYkIqqVwStA+eNGGl1HOjq+PyDqkm
 SlhiSlm6x7GX8E3gcyOtqoIXetWkwo/Ll8th+BObSHX/t2P24FqWaEkQ8Zi1wDufLu8p
 VdNUT41iUIeWdGiqV2aAA5a9kCfDHoii6kKnhkjPEATLQg110S6e/5VsTTVTB5soS4p8
 V3pC/qOhWIEB4j6ZsMuHovdDCsZBXqgrvGJWOVFNlaXdnsOLY3+yX3cNVguOcNx4BjxK
 dLNeBMf/GEcCPgR3RLzfArVHYZasu2/PXhzRBOuZU/EgSacTlWz+MJc0ui1oN5KLlNvK
 3Srg==
X-Gm-Message-State: AOAM533dyGcbzP7JtKN6TxrUUXI3Lo/lfsgOe9CWOvSp+0xQgoc7vLCE
 1lgmmOyyGryL0+JVx5XoKz9iUm6T5aY=
X-Google-Smtp-Source: ABdhPJwQ7iiy9fSEtDQZIFeLl7ER89GB65arxzMA4QgI51F8HmQePiRcZmRT3kAei0+fw3aOuXVFcg==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr2204251wru.315.1629963726021; 
 Thu, 26 Aug 2021 00:42:06 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n10sm2161642wrw.76.2021.08.26.00.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 00:42:05 -0700 (PDT)
Subject: Re: [RFC 04/10] hw/mos6522: Rename timer callback functions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <e9a9b7f8c4530109b083bf19c547532f14db32a1.1629799776.git.fthain@linux-m68k.org>
 <e7042a4f-1958-3e42-2d2e-9cf63eda6f5a@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c75f83ee-0e00-f911-4b5c-4273cdb349d0@amsat.org>
Date: Thu, 26 Aug 2021 09:42:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e7042a4f-1958-3e42-2d2e-9cf63eda6f5a@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 9:11 AM, Mark Cave-Ayland wrote:
> On 24/08/2021 11:09, Finn Thain wrote:
> 
>> This improves readability.
>>
>> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>> ---
>>   hw/misc/mos6522.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>> index 1d4a56077e..c0d6bee4cc 100644
>> --- a/hw/misc/mos6522.c
>> +++ b/hw/misc/mos6522.c
>> @@ -154,7 +154,7 @@ static void mos6522_timer2_update(MOS6522State *s,
>> MOS6522Timer *ti,
>>       }
>>   }
>>   -static void mos6522_timer1(void *opaque)
>> +static void mos6522_timer1_expired(void *opaque)
>>   {
>>       MOS6522State *s = opaque;
>>       MOS6522Timer *ti = &s->timers[0];
>> @@ -164,7 +164,7 @@ static void mos6522_timer1(void *opaque)
>>       mos6522_update_irq(s);
>>   }
>>   -static void mos6522_timer2(void *opaque)
>> +static void mos6522_timer2_expired(void *opaque)
>>   {
>>       MOS6522State *s = opaque;
>>       MOS6522Timer *ti = &s->timers[1];
>> @@ -445,8 +445,10 @@ static void mos6522_init(Object *obj)
>>           s->timers[i].index = i;
>>       }
>>   -    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> mos6522_timer1, s);
>> -    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> mos6522_timer2, s);
>> +    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> +                                      mos6522_timer1_expired, s);
>> +    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> +                                      mos6522_timer2_expired, s);
>>   }
>>     static void mos6522_finalize(Object *obj)
> 
> I'm not overly keen on this one: the general QEMU convention for a timer
> callback is for it to be named *_timer() rather than *_expired(), so I'd
> prefer to keep this consistent with the rest of the codebase.

I can not find any convention, and 'git grep -A1 \ timer_new' doesn't
show any conventional pattern neither.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD2440845
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 11:43:24 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgktX-00052M-J2
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgks4-0003Nv-7f
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:41:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgks2-00006g-HG
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:41:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso5673041wme.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 02:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pdn0RWY2ru3Vv43PUJxNhp+BVHnNMJov5gq2di/R0gQ=;
 b=ecfohJtMbN8G3Il9MVdfJwM6RogVmkZeX+MHe6P6LsuJHSrrBEhzYa36fvtUhE4od2
 91pqS770ZmvQj39KJ//uWiVX4wI5N+du9rpBrEVzFfMTHGt8XMhqDRbsF9OnS0848/AU
 9nNKlBHLK48hHPAArmMednSTBiyVEEtCCF+NjhRcgacZWdxU6X8/YdNyRvuoXacp5VWU
 pVIzzclWlo0O+vVUSpJiuuBmnK7yQW0paLn1krQ0gG78a9Qs7yUs4EKOfANQG+Uekzxr
 weZMldYe2B4cOezbx0u507g2bY57+io7rBUK7tJOcFmOr/igh5LR3d6+CA2iTdC6Jmhm
 jmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pdn0RWY2ru3Vv43PUJxNhp+BVHnNMJov5gq2di/R0gQ=;
 b=ilPqTG8j+eKQUmcQoqneH+wu3ITZpgMQTBy2ppb5eMBZz8iVb3suMowHRktK1gxuHI
 WqK0u5eoSkUp37RqI1jAQPptMyKvwHI8DL0/PdNWTkzQRWDmxq8AJuYIrk5afuUPZHWW
 3nI/DmTM6yIKHnicZa0vrNpmjiQtJbIGLB37MXAqmql7HRsPDtx2FNPoIAuERKu7AAnr
 +/9t65rKrU5e3bUs44rod8T24X2mlY0YQSmVpvkFAxV6FkcwVSqYMjPNJQdmUGLiks0B
 0h48pM85j7Oy9uV/pGRPfAhHgfBaTdU2isHxJvxtM8Ux6T6QP5Hi92TXjVMJ8am5I7b1
 cwkg==
X-Gm-Message-State: AOAM5319FSu6CEvIhMLtvuuzF3O8G7p+fRhaeQnKCt5uWmCS16atuE91
 47AZJBhRF4klTq3fKGUztfI=
X-Google-Smtp-Source: ABdhPJyLmLadTI1aQcQX+OAp6GqiD209SMpLnMexw2rgHpUvViL3owxJ7/C2tAs1rImwtsdC9rqrhQ==
X-Received: by 2002:a05:600c:294b:: with SMTP id
 n11mr1388731wmd.18.1635586909149; 
 Sat, 30 Oct 2021 02:41:49 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z135sm13275744wmc.45.2021.10.30.02.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 02:41:48 -0700 (PDT)
Message-ID: <62c562c7-cfef-af43-e53f-29f4017d230f@amsat.org>
Date: Sat, 30 Oct 2021 11:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 29/30] hw/timer/sh_timer: Fix timer memory region size
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
 <abe8c599-11b7-ea53-a22c-44846d6ffa2a@amsat.org>
 <851b67-fd93-ec4a-cb80-3fd83a9a374@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <851b67-fd93-ec4a-cb80-3fd83a9a374@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 01:36, BALATON Zoltan wrote:
> On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/29/21 23:02, BALATON Zoltan wrote:
>>> The timer memory region is only accessed via aliases that are 0x1000
>>> bytes long, no need to have the timer region larger than that.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/timer/sh_timer.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
>>> index 250ad41b48..a6445092e4 100644
>>> --- a/hw/timer/sh_timer.c
>>> +++ b/hw/timer/sh_timer.c
>>> @@ -350,8 +350,7 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr
>>> base, int feat, uint32_t freq,
>>>                                      ch2_irq0); /* ch2_irq1 not
>>> supported */
>>>      }
>>>
>>> -    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
>>> -                          "timer", 0x100000000ULL);
>>> +    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer",
>>> 0x1000);
>>
>> Per the manual (R01UH0457EJ0401 Rev. 4.01 [*]) Page 317/1128, Table
>> 12.2 "TMU Registers" the first 3 timers (implemented by the tmu012_state
>> structure) fit in a region of 0x30 bytes.
> 
> Sent a v7 of this patch only changing it to 0x30 with which the Linux
> image I've tested still boots but don't know if it uses a timer at all.
> 
>> Looking at hw/timer/sh_timer.c I only see a maximum access of 0x40,
> 
> Where do you see 0x40?

I just looked at tmu012_read(), not sh_timer_read(). Now looking at
it, the later only parses a 0x10 region, so total is 0x30 indeed.

> 
>> where 0x1000 comes from? The P4/A7 aliases?
> 
> Yes, as the commit message said. Since this was a last minute change I
> tried to be safe and not change anything guest visible at this point.

We should avoid last minute changes days before soft freeze ;)

>> If you have a way to test and ack, I can replace by 0x40 when applying.
> 
> If you think 0x40 is better then I'm fine with that but I don't see a
> register after 0x2c which is 32 bits so 0x30 length should be enough
> according to that.

Yes, 0x30 is correct, I'll take your v7 patch.

Thanks,

Phil.


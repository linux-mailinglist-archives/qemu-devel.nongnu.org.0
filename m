Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D71466996
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 19:04:00 +0100 (CET)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqR3-000283-Os
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 13:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msqOt-000112-TK
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 13:01:43 -0500
Received: from [2a00:1450:4864:20::433] (port=42782
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msqOr-0006Y9-Ps
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 13:01:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so445090wrd.9
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YTVlwIdNquXWIiko/nyJzIii4lxyXcEnMmOsfb3BaGo=;
 b=KcPtQ0bmGoMjvit1iWD8YszX84Z7j/ceK6hbPZL8wTy00+fUmpBWRW05AfW1YqLIYk
 b/bc/LxdDl828ZViDTlwYFMrY5SgeF/vUbxrzClvMdQy9JbD3nFp7tMKq8pwCSPaP6v3
 PDtKDpVacOxyus5iEhVOmg8TSA7xkbL7OnlIy+6N2/m/XlUT9WJqGIss47WWRwVl24gH
 1zUnSPSfgFx6y6XCmk/KBvwzcHFX0zot+46FoFpc1FBIBNytUNHN85mnbUFgpMyrHZEo
 1Csp1S0r+3wDNrhX9sTWlgKjCGr1BYgx//7U3Ti2OMmVrxfGfbJBNWi1eTOS/uGoKwz+
 urcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YTVlwIdNquXWIiko/nyJzIii4lxyXcEnMmOsfb3BaGo=;
 b=KQwJGtQPSJXGdU0T3Pop84VvMddY6f0c66vB3lQJQmR//QJsZRInliolzwPSfFgcFj
 CoDM4jNgYkcm5hkfYXeRlhZ+39cNaL+9tqS1f++3q6/pf225VOQO3IYZgXAPEaC5hTvt
 uG47x6PC5Nvki/iOxx/jYHA/ie/dWWJQXJly1m4ofTll9EUvBloMl9X0bBfL10YK6Ib+
 zadT8ZE3Rig8zY2/O6TXCKR0hlGtIA+QQDXHijPZMIcLaArcTaD/f6NhexryrrrTqr8M
 OT/bxkVZoK9Mrac4MLhoMPf56JeYvVHoqpF+tZjAZP5Xfc8VNnCCHoFt7jT1SLDVErSc
 mK0g==
X-Gm-Message-State: AOAM532oNCNkKyE9XiehhxCUTrWLGUXp0Nx2QfUzcJVOTUrMPBjXhPP6
 cB3s4GFJZAXj5AOE6PYpTFs=
X-Google-Smtp-Source: ABdhPJwmYdK3qXh8RsB+t4v316LDSJ0N8ldAYKm3O7U0bDhtc6EPQs8YwY8Dykxx6HoXUrk4GUQHIA==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr16429454wrr.520.1638468100103; 
 Thu, 02 Dec 2021 10:01:40 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id d1sm382312wrz.92.2021.12.02.10.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 10:01:39 -0800 (PST)
Message-ID: <cb7f6ba2-60b7-2da4-4248-749c78aec1b4@amsat.org>
Date: Thu, 2 Dec 2021 19:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] hw/mips: bootloader: Fix write_ulong
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
 <20211130211729.7116-2-jiaxun.yang@flygoat.com>
 <f6d41700-94fa-d8bf-bc54-a842f0cd4873@amsat.org>
 <5466a0e1-2fad-464a-bec1-7be8b794d09c@www.fastmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5466a0e1-2fad-464a-bec1-7be8b794d09c@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 11:51, Jiaxun Yang wrote:
> 在2021年11月30日十一月 下午9:52，Philippe Mathieu-Daudé写道：
>> On 11/30/21 22:17, Jiaxun Yang wrote:
>>> bl_gen_write_ulong uses sd for both 32 and 64 bit CPU,
>>> while sd is illegal on 32 bit CPUs.
>>>
>>> Replace sd with sw on 32bit CPUs.
>>>
>>> Fixes: 3ebbf86 ("hw/mips: Add a bootloader helper")
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>> Should be backported to 6.0 onwards.
>>> ---
>>>  hw/mips/bootloader.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>>> index 6ec8314490..99991f8b2b 100644
>>> --- a/hw/mips/bootloader.c
>>> +++ b/hw/mips/bootloader.c
>>> @@ -182,7 +182,11 @@ void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
>>>  {
>>>      bl_gen_load_ulong(p, BL_REG_K0, val);
>>>      bl_gen_load_ulong(p, BL_REG_K1, addr);
>>> -    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
>>> +    if (bootcpu_supports_isa(ISA_MIPS3)) {
>>> +        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
>>> +    } else {
>>> +        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
>>> +    }
>>
>> We have bl_gen_load_ulong(); having bl_gen_store_ulong()
>> would make the API even. Mind sending a patch? Otherwise:
> 
> Should I revisit this set or start another patch?

Another patch :)


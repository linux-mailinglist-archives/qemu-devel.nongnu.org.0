Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C7649640
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4SxZ-0007QY-PY; Sun, 11 Dec 2022 15:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4SxX-0007Q9-GU
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:30:03 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4SxV-0000Tk-RH
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:30:03 -0500
Received: by mail-ej1-x635.google.com with SMTP id t17so23298175eju.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0PBNCSvUhWS/7YFPJZ1DzN7DPZ36zMMwNndWTdPjlc8=;
 b=nsWcRP7xylefJpovCb2f4MU0kZw8QfkX/uvzONkV32vqFoZ2Ay9yA4xhkfkC2EX2l+
 NqR4QTg8f6wUWNlGRLQ9ZZcl6TRKpZv7U18Ow4A6kNQpf0ELAHWyydliIwJtu2Z49UB/
 +irSpS7lvEkuiGzp/dCKmP40j4BGZhZMuyS4g+6+MinuiiycTit95+AbZ3dEnWeOYIzh
 OgCCXMtptlioOVeWPYgm86qgxL9JtE+QRE/qHYyKx1d9hY6z/jukb6oqZBYIKeRRfpLI
 ln7jIE0hZuwgF+Lf39+zh5ochtLhlaYQWdTD0m/gnKylHbxaHqdq7mRd1BT2F6gMgX72
 0lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0PBNCSvUhWS/7YFPJZ1DzN7DPZ36zMMwNndWTdPjlc8=;
 b=o8WLrnCUSz0Hbq8HBX2ytt1Njsd6YR8cmRKbmos4KqxcGHXh2aFqoIPWr6D4JrlSM6
 trrVPxgNILFOdZZiiSXiDyixikl+BQR9CohxxA6NBWuqmseyBU4ej7/nq7AOLjPSBlmA
 zHk8X0/BqQLLWvYBPChZjeTgjrkqAdx+9Qjo8WWJyE5Hki7zkghUWgn1evubsMQt+keb
 PnhGtfRxSh6YWChI3lJByo8cJ3p3l02+sp3mESOO3Tw0KfgLnQnmHfhru/0Yl8zh4luu
 8Z1zCf10AxKa59OaWo4IqTN4TDtocG5E1WGOdi6yzmNNxBuuSwfHYS8VY5V1id5ejUby
 KD0w==
X-Gm-Message-State: ANoB5pl7I88O3DXbsTlvUTU12spkFyGZFOC0qaSGcf6468Aq48CcOnVn
 SVmxtFQsA0+w+ef1qugqty2+Gg==
X-Google-Smtp-Source: AA0mqf7V0L6CSD5372PwpCWqr+ibFAVM3YVoebVM/8vv992oVKcS0fXNwT7HeMSlAouJqvfJwqkbUg==
X-Received: by 2002:a17:906:34d9:b0:7c0:d6b6:1ee9 with SMTP id
 h25-20020a17090634d900b007c0d6b61ee9mr10581330ejb.11.1670790600194; 
 Sun, 11 Dec 2022 12:30:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ku11-20020a170907788b00b007adaca75bd0sm2453668ejc.179.2022.12.11.12.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 12:29:59 -0800 (PST)
Message-ID: <ffb7f192-8135-d219-dd5a-70a6180db23e@linaro.org>
Date: Sun, 11 Dec 2022 21:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 1/7] hw/mips/bootloader: Handle buffers as opaque
 arrays
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-2-philmd@linaro.org>
 <8c25781a-5f18-42e6-3995-ff4ee946f38d@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8c25781a-5f18-42e6-3995-ff4ee946f38d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/12/22 01:16, BALATON Zoltan wrote:
> On Sat, 10 Dec 2022, Philippe Mathieu-Daudé wrote:
>> It is irrelevant to the API what the buffers to fill are made of.
>> In particular, some MIPS ISA have 16-bit wide instructions.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/mips/bootloader.c         | 55 +++++++++++++++++++++---------------
>> hw/mips/malta.c              | 19 +++++++------
>> include/hw/mips/bootloader.h | 10 +++----
>> 3 files changed, 48 insertions(+), 36 deletions(-)
>>
>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>> index f5f42f2bf2..fc14eb0894 100644
>> --- a/hw/mips/bootloader.c
>> +++ b/hw/mips/bootloader.c
>> @@ -55,16 +55,20 @@ static bool bootcpu_supports_isa(uint64_t isa_mask)
>> }
>>
>> /* Base types */
>> -static void bl_gen_nop(uint32_t **p)
>> +static void bl_gen_nop(void **ptr)
>> {
>> -    stl_p(*p, 0);
>> -    *p = *p + 1;
>> +    uint32_t *p = (uint32_t *)*ptr;
> 
> Do you need to cast void * ? I thought in C that's not necessary but 
> maybe I'm missing why it's needed here.

No, you are right.

>> +
>> +    stl_p(p, 0);
>> +    p++;
>> +    *ptr = p;
> 
> Do you need a cast here though? (You could also combine the ++ either in 
> stl_p(p++, 0) or *ptr = ++p but not sure you want to.)

If the compiler were unhappy it would have complained :)



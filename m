Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463AE3EDE6F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:08:30 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFiuF-0004eX-Mg
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFitV-00040P-6g
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:07:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFitT-0006Qq-Ho
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:07:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v4so18116538wro.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BK4e6DWMHxWJ/GX4rpKmXQ7QNITLJI569Mc7t6soOiw=;
 b=p4bqq1f8K6N8Odi4grDlyi9hQk1lWXtyKK30/cQkLA4m71xQqbpdkOlg1bBiLn2HUF
 tTkg7uf2x6fsU/LFy/bFcVbwSoDzTN0EODpifG0wTcw9JY5ft8CZRH64S9GsK/BwAPhI
 QpNn87uhha98GPmBHXrtAB0dWSj6E+TpguhO1NP5OOvuMj/rXFS7t2NjKvb/glm3AibN
 IjSGBE4dM0EufnefY3ixnSopE+4RuaHEJbrJNk1LrxFyEmeqx089MU7C+6oeH+JJoTpK
 J9Aqauesc7zSQq5zUAS12IpLMBrXJ9TDoOVgndSZZbevQEKvL1ykbcAOW0uQhVrRsiGR
 IZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BK4e6DWMHxWJ/GX4rpKmXQ7QNITLJI569Mc7t6soOiw=;
 b=lNh9iwe2iYejfRqlY5aP8PiXUtzmypZtNnJD7K/vIxdKEDdqG7TrIiGwNC923TVAwi
 Zbp6CKwEN4DnfG7DoTODF7OFzg+IxxmHU/22jpmzhTjCWFmtdEQuplQJBq6wI7ehOKUW
 T1Jcupewx/YeA9dJ/B6OsW4IG4xB+MrcrLc2N53b/u85mAZJeHotSvUXkylHtl9fkvv3
 Dco1FnObQhOFhNaS+HTsKQ9PdDkb6H7ihFwAG0TzH0UXEk+J1AvC0AepcRyaphVsRR+T
 6o0Yg45lQp5BV3FURrM9Ai4NsnUq4hmtIO8w+fTW2hwPS00GInzDg1l2679hTS2wPJrZ
 Pokw==
X-Gm-Message-State: AOAM531KHoUTil5vIS2nXgzKPNOmqtKHODJNFu61lM+H6EP/bxVVkHmo
 +OFagTA/5M8Yi344pSse6u0=
X-Google-Smtp-Source: ABdhPJxWjNTKMQhNPud9QNV+AqGJNMpF6Xthv2NlkU4+9x8zPxXL8gXecYTsEbBKUcdVWCZjUZnE+w==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr215372wru.310.1629144454141;
 Mon, 16 Aug 2021 13:07:34 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l17sm108863wmq.44.2021.08.16.13.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 13:07:33 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/mips/boston: Massage memory map information
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
 <20210729033959.6454-2-jiaxun.yang@flygoat.com>
 <ee274e68-f569-627a-d764-8dac7084372d@amsat.org>
Message-ID: <2393c7d9-7a38-7af9-4fae-2bb39ccbcf48@amsat.org>
Date: Mon, 16 Aug 2021 22:07:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ee274e68-f569-627a-d764-8dac7084372d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 9:55 AM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 5:39 AM, Jiaxun Yang wrote:
>> Use memmap array to unfiy address of memory map.

Typo 'unify'.

>> That would allow us reuse address information for FDT generation.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/boston.c | 95 ++++++++++++++++++++++++++++++++++++------------
>>  1 file changed, 71 insertions(+), 24 deletions(-)
> 
>> +static const MemMapEntry boston_memmap[] = {
>> +    [BOSTON_LOWDDR] =     {        0x0,    0x10000000 },
>> +    [BOSTON_PCIE0] =      { 0x10000000,     0x2000000 },
>> +    [BOSTON_PCIE1] =      { 0x12000000,     0x2000000 },
>> +    [BOSTON_PCIE2] =      { 0x14000000,     0x2000000 },
>> +    [BOSTON_PCIE2_MMIO] = { 0x16000000,      0x100000 },
>> +    [BOSTON_CM] =         { 0x16100000,       0x20000 },
>> +    [BOSTON_GIC] =        { 0x16120000,       0x20000 },
>> +    [BOSTON_CDMM] =       { 0x16140000,        0x8000 },
>> +    [BOSTON_CPC] =        { 0x16200000,        0x8000 },
>> +    [BOSTON_PLATREG] =    { 0x17ffd000,        0x1000 },
>> +    [BOSTON_UART] =       { 0x17ffe000,        0x1000 },
> 
> 0x20?
> 
>> +    [BOSTON_LCD] =        { 0x17fff000,           0x8 },
>> +    [BOSTON_FLASH] =      { 0x18000000,     0x8000000 },
>> +    [BOSTON_PCIE1_MMIO] = { 0x20000000,    0x20000000 },
>> +    [BOSTON_PCIE0_MMIO] = { 0x40000000,    0x40000000 },
>> +    [BOSTON_HIGHDDR] =    { 0x80000000,           0x0 },
>> +};
> 
>>      /*
>>       * Setup argument registers to follow the UHI boot protocol:
>> @@ -333,8 +369,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
>>      ram_low_sz = MIN(256 * MiB, machine->ram_size);
>>      ram_high_sz = machine->ram_size - ram_low_sz;
>>      qemu_fdt_setprop_sized_cells(fdt, "/memory@0", "reg",
>> -                                 1, 0x00000000, 1, ram_low_sz,
>> -                                 1, 0x90000000, 1, ram_high_sz);
>> +                                 1, boston_memmap[BOSTON_LOWDDR].base, 1, ram_low_sz,
>> +                                 1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz
>> +                                 , 1, ram_high_sz);
> 
> Misplaced comma.
> 
> BTW shouldn't we check whether ram_high_sz > 0 before adding this cell?
> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 


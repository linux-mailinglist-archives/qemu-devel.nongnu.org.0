Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68A6121DE
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 11:31:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooi9y-0004uP-DF; Sat, 29 Oct 2022 05:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooi9x-0004q7-4s; Sat, 29 Oct 2022 05:29:45 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooi9u-0004Ji-H3; Sat, 29 Oct 2022 05:29:44 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so4272126otp.10; 
 Sat, 29 Oct 2022 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJu/HTDP9BhXpxgSyDpr92wAK++NVmsvH7oHkokTBJA=;
 b=OanXTlBM1Na8aCusxWCwFV5KB6imm5XCQEuMPzCzOA/1zkmTmoMa702en02PGYtJal
 EEbetQ6Qg1+P4Lhz7iImWEByQaVuA10s2zWo3ABj2xnE7RoduPKlx29Ki1omSO8dUvNK
 SnBEGodxaqji5oituX/h++/ZsJAHsiDeSyZtFBXSJaby7yHLb7Yr4ujd5MB7KysISnJg
 w8s+W7B1WR/EL+qycWNI4EpJ7CJgRFxWl5HubOXyBfl76yYniUyslArxaGl2tH2vG5U5
 8kjrcqOK9HRJXwjqdkBqNqzhEVEICA+mejhrweuUbkMcD4LXJh7gqLXjalnJTjHsQMMe
 LiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJu/HTDP9BhXpxgSyDpr92wAK++NVmsvH7oHkokTBJA=;
 b=NXweCXZC17cZHeHTculE73KV7aQv3mE2XU6RC8+RuVes8xGovI+yrXqS/NnFFoZq0q
 mKc+KbXLoXB9jBw4U1TTCXUDeesYvROp1x5vmfXpDcYQUj+pcGgCGWL2IsmZtL/Upqkc
 5uSsPDNyClxSfEFi9fpSQwSbI5yyB3pB27bNU2cN0VOnZnuvpuHMW8WoP3FqYCNBNabG
 PG0T64+x8ZgLfiGDBvmW2wvVNm25+LDJqq4RXMTWI3hL2Mw416VNDedXI9phv87+/HUR
 Oe5nYt1MsF5Xl1akQnF4x4KktvSmWHlOkw7sJdOwtpgyr5BvORnHPSZzJWi7QrD5Ln4A
 GZ7w==
X-Gm-Message-State: ACrzQf1B5KOQkF5FbWqOwu1AQQ+UhRxepuJl5AD09XW/5ORsocjOYg86
 ZdCQUgxDoLYMnS3uzKJAKQg=
X-Google-Smtp-Source: AMsMyM42FO3h8EerJuivNVgbKd32FmTlgipyLcog4pDjWHZ8XVJ4BRxRrrlb3FSuLfbvjVqkgL0Amw==
X-Received: by 2002:a05:6830:1552:b0:661:8b22:84b6 with SMTP id
 l18-20020a056830155200b006618b2284b6mr1721090otp.12.1667035779865; 
 Sat, 29 Oct 2022 02:29:39 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056870d20d00b0012c21a64a76sm472220oac.24.2022.10.29.02.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 02:29:39 -0700 (PDT)
Message-ID: <87865821-9729-e9d8-e789-cc8dc4159acb@gmail.com>
Date: Sat, 29 Oct 2022 06:29:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-6-shentey@gmail.com>
 <eea963b8-f6d9-b345-376e-7fd6dad73cd4@gmail.com>
 <202ae9ed-c1d1-ea57-6c50-b9c24f12dd5e@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <202ae9ed-c1d1-ea57-6c50-b9c24f12dd5e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/28/22 19:42, Philippe Mathieu-Daudé wrote:
> On 28/10/22 17:09, Daniel Henrique Barboza wrote:
>> Bernhard,
>>
>> The 32 builds aren't fancying this patch. The issue is down there:
>>
>> On 10/18/22 18:01, Bernhard Beschow wrote:
>>> Allows e500 boards to have their root file system reside on flash using
>>> only builtin devices located in the eLBC memory region.
>>>
>>> Note that the flash memory area is only created when a -pflash argument is
>>> given, and that the size is determined by the given file. The idea is to
>>> put users into control.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>   docs/system/ppc/ppce500.rst | 16 ++++++++
>>>   hw/ppc/Kconfig              |  1 +
>>>   hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 96 insertions(+)
> 
>>> @@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
>>>                                   pmc->platform_bus_base,
>>>                                   &pms->pbus_dev->mmio);
>>> +    dinfo = drive_get(IF_PFLASH, 0, 0);
>>> +    if (dinfo) {
>>> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
>>> +        BlockDriverState *bs = blk_bs(blk);
>>> +        uint64_t size = bdrv_getlength(bs);
>>> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
>>
>> ^ here. The issue is that on a 32 bit system it is not possible to cast the
>> Int128 type to uint64_t:
>>
>> FAILED: libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o
>> 3746cc -m32 -Ilibqemu-ppc64-softmmu.fa.p -I. -I.. -Itarget/ppc -I../target/ppc -I../dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /builds/danielhb/qemu/linux-headers -isystem linux-headers -iquote . -iquote /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include -iquote /builds/danielhb/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value 
>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET="ppc64-softmmu-config-target.h"' '-DCONFIG_DEVICES="ppc64-softmmu-config-devices.h"' -MD -MQ libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o -MF libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o.d -o libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o -c ../hw/ppc/e500.c
>> 3747../hw/ppc/e500.c: In function 'ppce500_init':
>> 3748../hw/ppc/e500.c:1069:30: error: incompatible types when initializing type 'uint64_t' {aka 'long long unsigned int'} using type 'Int128'
>> 3749 1069 |         uint64_t mmio_size = pms->pbus_dev->mmio.size;
>> 3750      |                              ^~~
>> 3751[3207/5331] Compiling C object libqemu-ppc64-softmmu.fa.p/hw_ppc_mpc8544_guts.c.o
>>
>>
>> What I did to solve the problem is this:
>>
>>
>> +         uint64_t mmio_size = int128_get64(pms->pbus_dev->mmio.size); >
>> This will get the lower 64 bits and return an uint64_t.
>>
>> Note that this function will assert if mmio.size is bigger than UINT64_MAX, but
>> since you're doing an error(1) on the "if size > mmio_size" conditional, this
>> assert() is not introducing a new side effect. We'll just fail earlier with
>> a different error message.
> 
> Simply use:
> 
>    memory_region_size(pms->pbus_dev->mmio);

Nice! I'll change it in-tree before re-sending the PR.


Daniel

> 


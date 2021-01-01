Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5791E2E859F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:52:37 +0100 (CET)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRPY-0004lE-FQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvROT-0004K8-69
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:51:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvROR-000298-IZ
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:51:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id q75so9781376wme.2
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wykzWUnOZWKspbibOr9LKo/sdQqqzIuQjz7mxDka+ZQ=;
 b=Zt4QDy1LXaU8kEl+xs88zPlIv4s/GHmJx85gwyMGsGYnB60A5XIBICCq81tf4fs7Q8
 HQdrKr1ex5h0psYyQGKpt0VSG/J9kKBqzSvML+1WJnIiJlcQN5PD+YjVOurt1IIPa2lQ
 v/rcZ7xH5wTkIlvejZo1zAn88etAN+Jdk/VdyrdHIkcZ2xZ8mD3MvlnUzkohbzG+NlIw
 GLuwl5AVVTLruufj9wjEoCK6A1Is9faDpFFBMhApn/jujk26i9Q+nOvfaSxeSWYp56iY
 9UGWR5UtQlLC7dh6/R9xi2ZSEssGxh/riHEQ0CaPDLNgKVxgtmOMRb3tl/YW2WRJKa95
 CN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wykzWUnOZWKspbibOr9LKo/sdQqqzIuQjz7mxDka+ZQ=;
 b=PF6Zm/CJqDJlnMDBppoClhb3642ZvSDcsst39aU9SF+mSBf3mxeKHdR04T1LGx5Hey
 Y01dEMhzzwgcEM3UKGWI/UtJw/ekHhO2FMiYiOmuYK77Ar3TxhFQFc1BLaYjgnGFeICX
 MKCvmToS3HHzIFhHHaq26b2kl1R6fwtwVLtqjsOljATY+vbzijkdGv8eIP6aRFW8o9Pc
 MxvWi7Vcelk1GHD2xI5I1UlqNNgPK0iZsToPmcSN7MKkeQiEd9YFFyIZe0iBTLO7kyFD
 YlTb25YbQTK2wZPeybmoo/+Md8Iv8SqmHk5up7mpKTFsIZ4SqjH2FWoNbmhY+PlLKWSz
 BnGQ==
X-Gm-Message-State: AOAM530BiG7Qa1bsVG1+yiG1oIO8BF2pMlY26NmVrCM2eCWX4+T9AZBN
 9OSadiKV/LuaSabgHmg6MnXCegmkCks=
X-Google-Smtp-Source: ABdhPJzNeTTmvSsq0UrwckZ8DGQ7wfvGZDomd/12Qp5h0X7K680Z1FHBZinQ+1NvpMGoHV/uZ9dbCg==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr17298392wmj.40.1609534286240; 
 Fri, 01 Jan 2021 12:51:26 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id i11sm18174570wmd.47.2021.01.01.12.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:51:25 -0800 (PST)
Subject: Re: [PATCH v3 5/8] hw/mips/fuloong2e: Remove unused env entry
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-6-jiaxun.yang@flygoat.com>
 <178da26f-421b-28cc-bfa1-4d233a8d8de2@amsat.org>
Message-ID: <3f16b76b-1a65-5899-9a72-525e3604eaf1@amsat.org>
Date: Fri, 1 Jan 2021 21:51:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <178da26f-421b-28cc-bfa1-4d233a8d8de2@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/1/21 7:05 PM, Philippe Mathieu-Daudé wrote:
> On 12/24/20 4:17 AM, Jiaxun Yang wrote:
>> modetty is not handled by kernel and the parameter
>> here seems unreasonable.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> v3: Bring busclock back
>> ---
>>  hw/mips/fuloong2e.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>> index d846ef7b00..c4843dd15e 100644
>> --- a/hw/mips/fuloong2e.c
>> +++ b/hw/mips/fuloong2e.c
>> @@ -159,10 +159,8 @@ static uint64_t load_kernel(CPUMIPSState *env)
>>      }
>>  
>>      /* Setup minimum environment variables */
>> -    prom_set(prom_buf, index++, "busclock=33000000");

Ah but you still removed busclock... This might explain why.

>>      prom_set(prom_buf, index++, "cpuclock=100000000");
>>      prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
>> -    prom_set(prom_buf, index++, "modetty0=38400n8r");
>>      prom_set(prom_buf, index++, NULL);
> 
> This makes my Linux kernel 2.6 test behave oddly:
> 
>  (4/4)
> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
>  console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3
> 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
> console: busclock=0, cpuclock=-2145008360,memsize=256,highmemsize=0
> console: console [early0] enabled
> console: CPU revision is: 00006302 (ICT Loongson-2)
> 


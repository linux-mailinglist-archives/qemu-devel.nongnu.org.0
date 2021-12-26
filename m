Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D331647F67B
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 11:53:58 +0100 (CET)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1RA5-0002mW-Dn
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 05:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1R6d-0001Pi-3X
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 05:50:23 -0500
Received: from [2a00:1450:4864:20::436] (port=38604
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1R6b-0000JA-Au
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 05:50:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id e5so26377681wrc.5
 for <qemu-devel@nongnu.org>; Sun, 26 Dec 2021 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j+/7VCATsHA92inZZwh/cnro/NWa/VPcHp1vUBSZBVk=;
 b=WfASaAbnnpWKSirNSzYSq7A5or2nVyv9b6ruFK8OGiNbbCgybADkfeN48MUnW7VVQb
 BCDGhk6w1c1SVbEbmbOO/uKMCOgWm4jbe+OfjAeyW8K0IX403M9IbppwUzc1F+xEchh9
 hWqilEJVvH6bnmZ1TV+vvFVdENkm7K2eaB3WQDjIg+gu4ZGKQjiXoNAon2t+SMx2NeA+
 hHyIqXNwd/PInW/bQqIF+oa/qzXwRakSjNlctk9Hooc2KzXwrg9XpwnJKKtAh3icahD0
 f7JIsQrlh/QwL3kgFTjI1Q+kEf+pQ6XP1iqShfX3blfOjLKM+lMkWxR1g6BUhmH0vsAL
 czvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j+/7VCATsHA92inZZwh/cnro/NWa/VPcHp1vUBSZBVk=;
 b=WFxNH7svqI+hNKfFmoiafgXyoIqTqoG82OvBfABfcPS58+iZtPJVnykLuyUBGesrTU
 uIi9yGYWy8WDS9D1wVZLkZJj/PPhiCpj0/xI+3lJBs/xZtOdh+VIyZYLkl7TkUDNbdIe
 Yv0R9jaQuRRi1s/lZHa0y24VkS+LwOgCMIhQISArtR0nv6ih1J7zIXDo8i5zeYtMSFAL
 unN2DQj+RjF4b2mVMsrc6EyM3LdglSKwyHmJsVCFOuCN7uSnJULmSwTkD5y1MwE0nQ/r
 VtiPVr2x3AJGpddu1Xur/dwsiAb+4ykLRxBhcgy/d1nBK2qj4jGDfncuTREbScQECzuF
 c5wg==
X-Gm-Message-State: AOAM5303/SMpfMAxcx89OcL58FwjUGkifHMxRtI3Xtzbn6VG9k0oW94a
 2akJuqQJHrFR9qZ8KKXv4ro=
X-Google-Smtp-Source: ABdhPJzsh1buhdxIVpP1vOHE7SG0yhbJ54akdJcoZJO3ZCdFy8HteaawHOoFmZbAezaBUtgHPWBalg==
X-Received: by 2002:adf:d1cc:: with SMTP id b12mr10170464wrd.282.1640515816629; 
 Sun, 26 Dec 2021 02:50:16 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id m17sm16905196wms.25.2021.12.26.02.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 02:50:15 -0800 (PST)
Message-ID: <ada264bd-6277-0c44-b010-cbbe93e98a8e@amsat.org>
Date: Sun, 26 Dec 2021 11:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/2] tests/tcg/mips64el: Run float tests
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
References: <20211226001931.3809249-1-f4bug@amsat.org>
 <20211226001931.3809249-3-f4bug@amsat.org>
 <1cc49727-5ad5-4c4f-be81-6450e5889cff@www.fastmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1cc49727-5ad5-4c4f-be81-6450e5889cff@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.063,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/26/21 03:25, Jiaxun Yang wrote:
> 在2021年12月26日十二月 上午12:19，Philippe Mathieu-Daudé写道：
>> Unfortunately this fails:
>>
>>   $ make run-tcg-tests-mips64el-linux-user
>>   ...
>>   Files float_convs.out and tests/tcg/mips64el/float_convs.ref differ
>>   --- float_convs.out     2021-12-26 01:03:48.585973637 +0100
>>   +++ tests/tcg/mips64el/float_convs.ref   2021-12-26 00:29:35.804465340 +0100
>>   @@ -1,40 +1,40 @@
>>    ### Rounding to nearest
>>   -from single: f32(nan:0xffffffff)
>>   -  to double: f64(nan:0x007ff7ffffffffffff) (INVALID)
>>   -   to int32: 2147483647 (INVALID)
>>   -   to int64: 9223372036854775807 (INVALID)
>>   -  to uint32: 2147483647 (INVALID)
>>   -  to uint64: 9223372036854775807 (INVALID)
>>   make[2]: *** [tests/tcg/multiarch/Makefile.target:32: run-float_convs] Error 1
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/tcg/mips64el/Makefile.target | 2 ++
>>  1 file changed, 2 insertions(+)
>>  create mode 100644 tests/tcg/mips64el/Makefile.target
>>
>> diff --git a/tests/tcg/mips64el/Makefile.target 
>> b/tests/tcg/mips64el/Makefile.target
>> new file mode 100644
>> index 00000000000..dcb1e9d72ac
>> --- /dev/null
>> +++ b/tests/tcg/mips64el/Makefile.target
>> @@ -0,0 +1,2 @@
>> +float_%: CFLAGS+=-march=loongson3a
>> +float_%: QEMU_OPTS+=-cpu Loongson-3A4000
> 
> Hmm, -march=loongson3a assumed legacy NaN while our -cpu Loongson-3A4000 assumed IEEE 754-2008 style NaN.
> 
> I guess switch to Loongson-3A1000 can help?

Nop, exactly the same error.

Also, float_madds fails as:

Files float_madds.out and tests/tcg/mips64el/float_madds.ref differ
--- float_madds.out     2021-12-26 11:49:06.018532269 +0100
+++ tests/tcg/mips64el/float_madds.ref   2021-12-26 01:16:02.269497182 +0100
@@ -1,16 +1,16 @@
 ### Rounding to nearest
-op : f32(nan:0xffffffff) * f32(nan:0xffbfffff) + f32(-inf:0xff800000)
-res: f32(nan:0x7fbfffff) flags=INVALID (0/0)
-op : f32(nan:0xffbfffff) * f32(-inf:0xff800000) + f32(nan:0xffffffff)
-res: f32(nan:0x7fbfffff) flags=INVALID (0/1)
-op : f32(-inf:0xff800000) * f32(nan:0xffffffff) + f32(nan:0xffbfffff)
-res: f32(nan:0x7fbfffff) flags=INVALID (0/2)
make[2]: *** [tests/tcg/multiarch/Makefile.target:30: run-float_madds]
Error 1


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE441834F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:51:46 +0200 (CEST)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9xp-00007V-OJ
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU9ix-0004qU-1Q
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:36:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU9iv-0007bY-6T
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:36:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so36788759wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZwfiDuSdrIn1Ey4ocMiGbF4LOHhBCGONlkAD8S6HYfI=;
 b=E1Bzs+kH02+2YA6K1BxfkJmg4wCm3rIGtUr4ajYfg3I9fxayfApCr0cVN0DZrmG5OT
 vPwl4V5/i2xJuUR3yKLTwozM/TzN42CSEf7VxqNEjZoppx2ZXK//rkV/Kzv48dghzT4Q
 5hkknBgPurbuW+aombLRhMV5GYxuL0EcfbjOamZg4hwKI4ipbRwtTlQ+uVqFJnmIqZaV
 FF/aRCrX1cRL1VwRAfMozKi+ZQD8i9Cg5kN078P73UluPFX5Oyr2NCsf46FR847WsO2t
 W/LRUHez2zdKKL+5nje4FVlZeTlHg0IwGDnoJudtsc78XYoOWLVMlwKHMoB9/h0MlDpY
 /8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZwfiDuSdrIn1Ey4ocMiGbF4LOHhBCGONlkAD8S6HYfI=;
 b=vGEiCnzEJTpAWH98jsP079/h9UgXLw77wBwh5GDTAyPonrr8C3MXOoAtc6nfpm9mIK
 w/LZkOSnVtCNzrufQyd33cYOygmCBzbJhGjCr4EB9n4yLJt5Umq0nGFTY/M63xULhWD7
 KEGFWc7j3Z5FOhfWC1FWk5Vh7q2teY8W8gaj+3X02mofIyhwl+4hPuO7NAjc1piNqsff
 AFds2V+ZB8a6lS/kp3JMOWMV2ad0snEnbuS8een5lFgrrU2XljRbK+LqT+1dzx/4vIel
 lx3r/Hr8dOGOb4yNVWDGWYo1/LYZ5uYPnyHLZP3L6YsMZ9QfDuvqPwYBKr/M9tl23cMe
 UzVQ==
X-Gm-Message-State: AOAM531stzU19Vq5bhIPp8pmI6hFCD7GLO1GFhf5377WsWH+yM5LEFpj
 ho0MX9BXUluyfXFg3XcaqYc=
X-Google-Smtp-Source: ABdhPJwE/DRhK++o6bqawnSYCT+qIkPeITeggpU0dit8gyt2mYjBq+aBS6aPjjQIir/Z1rMD6+2TBg==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr7460024wml.136.1632584179606; 
 Sat, 25 Sep 2021 08:36:19 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z17sm11213532wml.24.2021.09.25.08.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 08:36:19 -0700 (PDT)
Message-ID: <1960908b-2402-a635-3477-6cc6e27cb179@amsat.org>
Date: Sat, 25 Sep 2021 17:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 00/40] accel: Move has_work() from CPUClass to
 AccelOpsClass
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210925145118.1361230-1-f4bug@amsat.org>
 <db0359fd-cfef-f959-02b4-258188c49312@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <db0359fd-cfef-f959-02b4-258188c49312@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 17:28, Richard Henderson wrote:
> On 9/25/21 10:50 AM, Philippe Mathieu-Daudé wrote:
>> Philippe Mathieu-Daudé (40):
>>    accel: Simplify qemu_init_vcpu()
>>    hw/core: Restrict cpu_has_work() to sysemu
>>    hw/core: Un-inline cpu_has_work()
>>    hw/core: Move cpu_common_has_work() to cpu_has_work()
>>    accel: Introduce AccelOpsClass::has_work()
>>    accel/kvm: Implement AccelOpsClass::has_work()
>>    accel/whpx: Implement AccelOpsClass::has_work()
>>    accel/hvf: Implement AccelOpsClass::has_work()
>>    accel/xen: Implement AccelOpsClass::has_work()
>>    accel/hax: Implement AccelOpsClass::has_work()
>>    accel/nvmm: Implement AccelOpsClass::has_work()
>>    accel/qtest: Implement AccelOpsClass::has_work()
>>    accel/tcg: Implement AccelOpsClass::has_work()
>>    accel: Simplify cpu_has_work()
>>    accel/tcg: Introduce TCGCPUOps::has_work()
>>    target/arm: Explicit v7M cores use arm_cpu_has_work as
>>      CPUClass:has_work
>>    target/arm: Restrict has_work() handler to sysemu and TCG
>>    target/alpha: Restrict has_work() handler to sysemu
>>    target/avr: Restrict has_work() handler to sysemu
>>    target/cris: Restrict has_work() handler to sysemu
>>    target/hexagon: Remove unused has_work() handler
>>    target/hppa: Restrict has_work() handler to sysemu
>>    target/i386: Restrict has_work() handler to sysemu and TCG
>>    target/m68k: Restrict has_work() handler to sysemu
>>    target/microblaze: Restrict has_work() handler to sysemu
>>    target/mips: Restrict has_work() handler to sysemu and TCG
>>    target/nios2: Restrict has_work() handler to sysemu
>>    target/openrisc: Restrict has_work() handler to sysemu
>>    target/ppc: Introduce PowerPCCPUClass::has_work()
>>    target/ppc: Restrict has_work() handlers to sysemu and TCG
>>    target/riscv: Restrict has_work() handler to sysemu and TCG
>>    target/rx: Restrict has_work() handler to sysemu
>>    target/s390x: Restrict has_work() handler to sysemu and TCG
>>    target/sh4: Restrict has_work() handler to sysemu
>>    target/sparc: Remove pointless use of CONFIG_TCG definition
>>    target/sparc: Restrict has_work() handler to sysemu
>>    target/tricore: Restrict has_work() handler to sysemu
>>    target/xtensa: Restrict has_work() handler to sysemu
>>    accel/tcg: Remove CPUClass::has_work()
>>    accel/tcg: Simplify tcg_cpu_has_work()
> 
> $ make check
>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> [1/143] Generating qemu-version.h with a meson_exe.py custom command
> Running test qtest-aarch64/qom-test
> **
> ERROR:../git-alt/accel/qtest/qtest.c:52:qtest_cpu_has_work: code should 
> not be reached
> ERROR qtest-aarch64/qom-test - Bail out! 
> ERROR:../git-alt/accel/qtest/qtest.c:52:qtest_cpu_has_work: code should 
> not be reached
> Broken pipe

Yeah sorry I just realized 🤦‍♂️

Quick fix if you want to keep testing while allowing other to review:

-- >8 --
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 903c39ec1bf..eb5a17cef18 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -51,3 +51,3 @@ static bool qtest_cpu_has_work(CPUState *cpu)
  {
-    g_assert_not_reached();
+    return false;
  }
---


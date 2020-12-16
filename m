Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEFB2DC484
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:44:22 +0100 (CET)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZuX-0003j9-ER
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZke-0002MG-A9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:34:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZkc-0000B8-Kb
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:34:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c5so20148101wrp.6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bqg4VfHPg5ij64AlLvY3EBHpZqgixCX2QH0G8/lslz8=;
 b=Uf2Nr2TpgLUlpeYkCyQwu0vovTQLkyTpeMPaPzbvjbeUjPmt2TUj8W/IE9CsQZ15vu
 33AMnHCMByhwIQL3hzNruV+1R9EIfLV3lVwqctggC+LDrojnnPwK/GKTWxix5K3zDEUK
 BlpJ63RdA7U/8zhxQGxFQzs/MFZthdFsPfJQKohfWd03n3/jiML0MCy8vFn5DpedLCJs
 sVMpDjgZ6R/oEznm4OOUtvAqT9ezfI8fXbk08TUT0guiUXQmwnZ5oRdL7agFXcNvFKOL
 q48SB8TVcgkVhC3RSjjfnfx8K78dyAVJ2T2iq/zqkspDgUtN/GcDH38SnxsVr/EKJNiK
 8KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bqg4VfHPg5ij64AlLvY3EBHpZqgixCX2QH0G8/lslz8=;
 b=PoLpGEl1/AMsXE/2zHha9IrdWkaa2DxzDM7aUnfx+k1HZUo3UtBJsJTYXpq4KEVPOj
 OtLFvETyTlyzQOq466G10jvmc/ykiKvsSCRZg1vTS0wtf8vczVSoj/iRKEHhoqqAnFYl
 3AwNcl4jpNnGFzk+Y/QrreZYgUs8mQCvHhIb2wwWX6O/UNQPlr5UbVOnOW41URJ5Fz9o
 BW85J0cIlAdZp/UEKnQvyXv0fnmTkyhkPhfqfZq4ioUHIV3RQ7dTGV57nLe8mnKLW9jV
 G2/5MypyJ4+4UfEPp5CUT8u+iYrKL8xPNsq0xNZueYZPXg5zFoeOLGRThiT3axKB7JXA
 fFpA==
X-Gm-Message-State: AOAM5308YYuP2RCCkwgsUnJht9Z9WjdEPAbXu3V5Wn224g5Ju+XarB43
 2xEICDNT6FnV1rawioeWfi8=
X-Google-Smtp-Source: ABdhPJwtlnVnQf/NCC7hvIb49obbIImtvIedOlw/U0CXeS+lRyEyF2UsL0EKuI5iSaESdTOlWEXzXQ==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr39301823wrn.171.1608136444637; 
 Wed, 16 Dec 2020 08:34:04 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u6sm4019213wrm.90.2020.12.16.08.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:34:03 -0800 (PST)
Subject: Re: [PATCH 03/11] target/mips/mips-defs: Use ISA_MIPS32R2 definition
 to check Release 2
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201216134328.851840-1-f4bug@amsat.org>
 <20201216134328.851840-4-f4bug@amsat.org>
 <a1f2e2a9-6b41-5289-7332-8a4400faf0a4@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ddb7e42-b11d-5a24-80fd-51ee08720359@amsat.org>
Date: Wed, 16 Dec 2020 17:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a1f2e2a9-6b41-5289-7332-8a4400faf0a4@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 4:16 PM, Jiaxun Yang wrote:
> 在 2020/12/16 21:43, Philippe Mathieu-Daudé 写道:
>> Use the single ISA_MIPS32R2 definition to check if the Release 2
>> ISA is supported, whether the CPU support 32/64-bit.
>>
>> For now we keep '32' in the definition name, we will rename it
>> as ISA_MIPS_R2 in few commits.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/mips-defs.h    | 3 +--
>>   linux-user/mips/cpu_loop.c | 1 -
>>   target/mips/translate.c    | 4 ++--
>>   3 files changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
>> index 2756e72a9d6..9cfa4c346bf 100644
>> --- a/target/mips/mips-defs.h
>> +++ b/target/mips/mips-defs.h
>> @@ -24,7 +24,6 @@
>>   #define ISA_MIPS5         0x0000000000000010ULL
>>   #define ISA_MIPS32        0x0000000000000020ULL
>>   #define ISA_MIPS32R2      0x0000000000000040ULL
>> -#define ISA_MIPS64R2      0x0000000000000100ULL
>>   #define ISA_MIPS32R3      0x0000000000000200ULL
>>   #define ISA_MIPS64R3      0x0000000000000400ULL
>>   #define ISA_MIPS32R5      0x0000000000000800ULL
>> @@ -81,7 +80,7 @@
>>     /* MIPS Technologies "Release 2" */
>>   #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
>> -#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
>> +#define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS32R2)
>>     /* MIPS Technologies "Release 3" */
>>   #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
>> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
>> index b58dbeb83d1..a2aa8167210 100644
>> --- a/linux-user/mips/cpu_loop.c
>> +++ b/linux-user/mips/cpu_loop.c
>> @@ -386,7 +386,6 @@ void target_cpu_copy_regs(CPUArchState *env,
>> struct target_pt_regs *regs)
>>       prog_req.fre &= interp_req.fre;
>>         bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
>> -                              env->insn_flags & ISA_MIPS64R2 ||
>>                                 env->insn_flags & ISA_MIPS32R6 ||
>>                                 env->insn_flags & ISA_MIPS64R6;
>>   diff --git a/target/mips/translate.c b/target/mips/translate.c
>> index 8c0ecfa17e1..0923dfdf451 100644
>> --- a/target/mips/translate.c
>> +++ b/target/mips/translate.c
>> @@ -28212,7 +28212,7 @@ static void decode_opc_special3(CPUMIPSState
>> *env, DisasContext *ctx)
>>       case OPC_DINSM:
>>       case OPC_DINSU:
>>       case OPC_DINS:
>> -        check_insn(ctx, ISA_MIPS64R2);
>> +        check_insn(ctx, ISA_MIPS32R2);
>>           check_mips_64(ctx);
> 

Sorry I respin v2 before noticing this reply.

> After this change, 32-bit CPUs emulated with TARGET_MIPS64
> and got CP0.Status.KX and CP0.Status.UX accidentally set won't
> emit RI exception.

32-bit CPUs shouldn't have MIPS_HFLAG_64 set, regardless
the build used. So check_mips_64() will emit it...

Anyhow, I'd rather remove 32-bit CPUs from 64-bit build unless
we are sure this works.

> 
> Probably we need to check ISA_MIPS64 when calculating
> MIPS_HFLAG_64 and setting ksux in cpu_mips_store_status?
> 
> Thanks.
> 
> - Jiaxun
> 
>>           gen_bitops(ctx, op1, rt, rs, sa, rd);
>>           break;
>> @@ -28232,7 +28232,7 @@ static void decode_opc_special3(CPUMIPSState
>> *env, DisasContext *ctx)
>>               decode_opc_special3_r6(env, ctx);
>>               break;
>>           default:
>> -            check_insn(ctx, ISA_MIPS64R2);
>> +            check_insn(ctx, ISA_MIPS32R2);
>>               check_mips_64(ctx);
>>               op2 = MASK_DBSHFL(ctx->opcode);
>>               gen_bshfl(ctx, op2, rt, rd);
> 


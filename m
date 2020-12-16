Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723C72DC9AF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 00:45:44 +0100 (CET)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpgUJ-0003GA-1O
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 18:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpgRj-0002nK-DW
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 18:43:03 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpgRh-0008Fu-G3
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 18:43:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id d17so35277802ejy.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 15:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ZRQB3aF/8aoC+QwhWU/Nxf8aPezL+1+z4MXdILDwXI=;
 b=Oq7kTOxEcoN1zV7n9FvbXw/JJ4P1tPWvXJTptNhanLO0FGkQO7Qgjk+2g/AvX7w0Ha
 +llbEJeEXs3ByyK0Z0bBzBlKge9+n+RUWp3oomUblLnxxDvX+P7ey6AnWyVQB6WO475r
 U7XWHUPBSH4JQi+2GkFJpmNeQ6HmL8wofH2SrielcNE90MapgiU+DNvsm8CWwInY3ZMw
 fhOc7LywpcI1YtRMRJbQkI9ydS5R0M4jol/R0J3QovzTBjS4KflUTQYi9txftdbDq0SS
 QvoiMkpkl6rOZQZMPIiu9UK2baT8iOBOHDnq0+jMbMqCL1PRuOsWsvhdE+lzUduX1NhM
 pfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ZRQB3aF/8aoC+QwhWU/Nxf8aPezL+1+z4MXdILDwXI=;
 b=Pa3nJ9hiygUV/FrEUATC+Ja64EtvtcsrDieAbSYPAZ4Efefl9nyUEWG6b8KhsgO9EZ
 lBJdDUTs5xSLtLpjXkU8SwKY5VtXjo+jstjVVg4SL4L3/JKhNUxGinSyQoI1vnYFD2gE
 ciAbeqY6L7M36wIjaF05fD0uCmfQBPNUt6/47KvJIuitthZLmyClh6F+gOxPc71arKUn
 qEQEy1HOOFKovIzwAml2U6kHoxETt88kMeIPuUm/9iE45YVuWj0XUqtF+KLEWd6QXKbc
 opvm2grvgT48o6bBeCNKxP8PHE3elOiVYvUfWot81/+nhnpmO8V8Ip2QfB4lk0C2FQ+U
 z6aw==
X-Gm-Message-State: AOAM533EYYiqJZoOZL9bPoUB8wbIbqDm768aEMfV4rHGVTolVfeUilPB
 erjGNiBEPq42WoT1AjMH3To=
X-Google-Smtp-Source: ABdhPJwjb8U8i4yV9M8eiao7zngDNWIQ7Avwn9uUMv50fRTjt28uqjzyLNSymH5mvlbIM/pL7sKgLw==
X-Received: by 2002:a17:906:acc:: with SMTP id
 z12mr9107806ejf.23.1608162178815; 
 Wed, 16 Dec 2020 15:42:58 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a20sm22649617edr.70.2020.12.16.15.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 15:42:57 -0800 (PST)
Subject: Re: [PATCH v2 02/12] target/mips/mips-defs: Use ISA_MIPS3 for
 ISA_MIPS64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-3-f4bug@amsat.org>
 <20a9e22d-cc44-71f1-eae8-019a03838c26@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a23290fa-9ec6-3511-ccc2-a564dcb9ca1c@amsat.org>
Date: Thu, 17 Dec 2020 00:42:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20a9e22d-cc44-71f1-eae8-019a03838c26@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 8:08 PM, Richard Henderson wrote:
> On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
>> MIPS 64-bit ISA is introduced with MIPS3.
>> No need for another bit/definition to check for 64-bit.
>>
>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/mips-defs.h | 2 +-
>>  hw/mips/boston.c        | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
>> index f4d76e562d1..ab621a750d5 100644
>> --- a/target/mips/mips-defs.h
>> +++ b/target/mips/mips-defs.h
>> @@ -19,7 +19,7 @@
>>   */
>>  #define ISA_MIPS1         0x0000000000000001ULL
>>  #define ISA_MIPS2         0x0000000000000002ULL
>> -#define ISA_MIPS3         0x0000000000000004ULL
>> +#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
>>  #define ISA_MIPS4         0x0000000000000008ULL
>>  #define ISA_MIPS5         0x0000000000000010ULL
>>  #define ISA_MIPS32        0x0000000000000020ULL
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index c3b94c68e1b..f44f681fab5 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
>>          exit(1);
>>      }
>>  
>> -    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
>> +    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);
> 
> Find this slightly confusing.
> 
> After all of the renaming, I would expect ISA_MIPS64R6 -> ISA_MIPS_R6 |
> ISA_MIPS_64, not ISA_MIPS_R6 | ISA_MIPS3.

Well all the ISA_* definitions now match:
https://images.anandtech.com/doci/8457/MIPS%20ISA%20Evolution.JPG

Except ISA_NANOMIPS32, which is listed in
MD01251-2B-nanoMIPS32PRA-06.09.pdf as an extension, similar to microMIPS:

  MIPS32, microMIPS32, and nanoMIPS32 Operating Modes

  Release 2 of the MIPS32 Architecture added support for 64-bit
  coprocessors (and, in particular, 64-bit floating-point units)
  with 32-bit CPUs. Thus, certain floating-point instructions
  that previously were enabled by 64-bit operations on a MIPS64
  processor now are enabled by new 64-bit floating-point operations.

  Release 3 introduced the microMIPS instruction set, allowing all
  microMIPS processors to implement a 64-bit floating-point unit.

  Release 6 introduces the nanoMIPS instruction set. The nanoMIPS
  instruction set provides access to the same instruction set extensions
  (example, COP1 floating-point instructions) that microMIPS had access
  to.

I'd rather keep one definitions per ISA. Eventually if you want
a definition to check if a CPU is 32/64-bit we can add an alias:

-- >8 --
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 376262fa250..2c3f4277cfe 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -65,6 +65,8 @@
 #define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)

+#define CPU_MIPS64      (ISA_MIPS3)
+
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS_R1)
 #define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1)
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index f44f681fab5..9f56099e42f 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
         exit(1);
     }

-    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);
+    is_64b = cpu_type_supports_isa(machine->cpu_type, CPU_MIPS64);

     object_initialize_child(OBJECT(machine), "cps", &s->cps,
TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
---

But for the Boston case, it is simpler to add an inline function in
cpu.h:

-- >8 --
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1302,6 +1302,11 @@ static inline bool ase_mt_available(CPUMIPSState
*env)
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }

+static inline bool cpu_type_is_64bit(const char *cpu_type)
+{
+    return cpu_type_supports_isa(cpu_type, CPU_MIPS64);
+}
+
 void cpu_set_exception_base(int vp_index, target_ulong address);

 /* addr.c */
---

Note, I'd still use ISA_MIPS3 in this cpu_type_is_64bit().

Or I could add the ISA_MIPS_64 alias and call it a day...

> 
> 
> r~
> 


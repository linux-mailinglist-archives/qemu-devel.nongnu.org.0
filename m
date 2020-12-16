Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B542DC3C0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:09:32 +0100 (CET)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZMp-0007VY-NA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZLh-000755-7F
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:08:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZLf-0004Xt-4V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:08:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q18so16199775wrn.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BfhSyFtyA3MFiwC8Arwd3ARykKukVO08yS5+MWrEIjs=;
 b=I6iFCnhHhkjL/x+6hMglq2JZUlv5HCFo/w1imbo8iPH7Av742rrjtA15PPJkgPVMQU
 TfYkvBEKJLSOAluUWRlEQcjDsABZ5FeNQDLuQHifTHvuiX+0q+O1qmLHUzXiq+u6X0lf
 Oy4mbrxVBube7dwtR/TGT3NZxIdU1nfFrE3le9NMT6gMOmVFMSWrxN/3+Lr49NhntUn8
 +YtU2YKzTYImuli5ESXv/qM+z0dXs3uZHz0If7khNXNYOnS7Qr46YW/P3rM27/td9nsI
 UaZAyMokOxMz8A6eGT3TQLuFBKrwMWTGKvNHlHZQDEdIXGknt+JOVpDN0//BhSnVoVzk
 Qdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BfhSyFtyA3MFiwC8Arwd3ARykKukVO08yS5+MWrEIjs=;
 b=flPAGKeQJilxysj8MUmJLmiFvdcN20FneWp/RL6/QIXtr8KkxjjMYpdoa3RZskR9na
 L5RXB0l0EHlH1TzLZJmN9vjZRc1tsAjUhKzb4e3TeQMHGND/MFbbWVhdwsxgo47DB5CP
 HcQisfFek8ybgQbW+HLTFwFtmMzV4zuEtJGF5n6GfN1uk3XY4EFBF140ctOMUmjR+JOi
 lnyBUBHd97pPbFGS81iFylYXXPRsSLDuO74cO9we3cfIUz7uh4MzgKlzd9JowG9u2pfA
 KqphAZ4t/nCpQslBV+xke/lfwGhXxs+/TSegR3CoXU1kdrnsOwMF8JIgVbc/2PInPHFR
 CpyQ==
X-Gm-Message-State: AOAM532BNKXOB604LjeKmaPALDru+LQYYcUfTWLaRPDK2YLmoAVvROJr
 CEM7qzdFds3NMQiprYZ4YIs=
X-Google-Smtp-Source: ABdhPJz6lScoOAamvD3Oq3LRaOaf2G/2K5Y/0UGiP55iZPfBRHsW+/641YReaNkqMhnsrUqKLa5n+g==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr22966905wrw.5.1608134897149;
 Wed, 16 Dec 2020 08:08:17 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z64sm3368036wme.10.2020.12.16.08.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:08:16 -0800 (PST)
Subject: Re: [PATCH 02/11] target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201216134328.851840-1-f4bug@amsat.org>
 <20201216134328.851840-3-f4bug@amsat.org>
 <ccdc8892-c97b-593f-8d53-28ac97100438@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8bec609c-102b-f9f6-bc08-404537dca56a@amsat.org>
Date: Wed, 16 Dec 2020 17:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ccdc8892-c97b-593f-8d53-28ac97100438@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

On 12/16/20 4:06 PM, Jiaxun Yang wrote:
> 在 2020/12/16 21:43, Philippe Mathieu-Daudé 写道:
>> MIPS 64-bit ISA is introduced with MIPS3.
>> No need for another bit/definition to check for 64-bit.
>>
>> Simplify CPU_MIPS64 definition as CPU_MIPS5 contains
>> CPU_MIPS4 which contains CPU_MIPS3 which contains ISA_MIPS3.
> 
> Oops, I shall amend my reviewed by tag, just found a issue.
> 
>>
>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/mips-defs.h |  5 ++---
>>   hw/mips/boston.c        |  2 +-
>>   target/mips/translate.c | 10 +++++-----
>>   3 files changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
>> index f4d76e562d1..2756e72a9d6 100644
>> --- a/target/mips/mips-defs.h
>> +++ b/target/mips/mips-defs.h
>> @@ -19,12 +19,11 @@
>>    */
>>   #define ISA_MIPS1         0x0000000000000001ULL
>>   #define ISA_MIPS2         0x0000000000000002ULL
>> -#define ISA_MIPS3         0x0000000000000004ULL
>> +#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
>>   #define ISA_MIPS4         0x0000000000000008ULL
>>   #define ISA_MIPS5         0x0000000000000010ULL
>>   #define ISA_MIPS32        0x0000000000000020ULL
>>   #define ISA_MIPS32R2      0x0000000000000040ULL
>> -#define ISA_MIPS64        0x0000000000000080ULL
>>   #define ISA_MIPS64R2      0x0000000000000100ULL
>>   #define ISA_MIPS32R3      0x0000000000000200ULL
>>   #define ISA_MIPS64R3      0x0000000000000400ULL
>> @@ -78,7 +77,7 @@
>>     /* MIPS Technologies "Release 1" */
>>   #define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
>> -#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
>> +#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32)
>>     /* MIPS Technologies "Release 2" */
>>   #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index c3b94c68e1b..f44f681fab5 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
>>           exit(1);
>>       }
>>   -    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
>> +    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);
>>         object_initialize_child(OBJECT(machine), "cps", &s->cps,
>> TYPE_MIPS_CPS);
>>       object_property_set_str(OBJECT(&s->cps), "cpu-type",
>> machine->cpu_type,
>> diff --git a/target/mips/translate.c b/target/mips/translate.c
>> index 15265485f76..8c0ecfa17e1 100644
>> --- a/target/mips/translate.c
>> +++ b/target/mips/translate.c
>> @@ -8538,7 +8538,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv
>> arg, int reg, int sel)
>>       const char *register_name = "invalid";
>>         if (sel != 0) {
>> -        check_insn(ctx, ISA_MIPS64);
>> +        check_insn(ctx, ISA_MIPS3);
>>       }
> 
> I think these ISA_MIPS64 should mean ISA_MIPS_R1?

Good catch, thanks.


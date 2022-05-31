Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E5539383
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 17:02:45 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3OO-0002Fs-BG
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 11:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw3LM-0000jK-3d
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:59:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw3LJ-0000OD-VU
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:59:35 -0400
Received: by mail-pg1-x532.google.com with SMTP id d129so13064629pgc.9
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mdTwjTTlXAgURfiH2FGnfhkCCki0iq2L5iT3D7MsA9Q=;
 b=i27c/LgowI9fvMM4bhqp2tuG8aMay3d0AlW4gmOlOeDKHsUlPqmumiWqZTzyBrd6kF
 R5kjgTyv+Xfg66l5OoLpfRN0vJUFXfUeD4wY2nFnCq8icQ7EsLacZW/V1TcYioORRbKw
 i5NZd5vCeNQ6cXWJNj0p8HLN/lex4mOKuTHaApyVAX58hAiv4tkz7DII2QA7KXt9zATW
 5dI55oWXWzKc16Npk+AG4LU5HlJuyzMhsrWLfUcV73xhjZEcj/RdfPiK/SqkvuqPJ8Y/
 xG9y2F0ViW/pu+i3dk88D9MkqZ3C9l88yahOoUgfPJoROd226sSKSSaqX7mlsQPqy4Rc
 SJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mdTwjTTlXAgURfiH2FGnfhkCCki0iq2L5iT3D7MsA9Q=;
 b=dLO8uGpN6i7E68A+PMj959nlPQLFKXSIsKCxxyflUgLGTtB4kXXCgqNpy3jwxNBtqc
 hVpGk3pF69z1IXKP90HCVcVCPKLzWAHhOQGTmYM3ebrpE3LXXyILLYQQjarI0/QsQhnM
 LLdzEIRJd/qB6iskc8d1aJEgrHh+odMFM1F3u/oyjiT7cYykAVqItC0yco8DUQ2w/8vm
 e9uMR/rQnbNfCO5A3WH5ITHbouA2pPGLpCk15yBuiw88B5n/rR69Jgk58B5vKY47/N7i
 fcvVa/FIy9hss4sCON1y5fIjhPVUQGSL2KxDSU40kZPMRYsomWvkV/NRVKku7hybgX59
 26yw==
X-Gm-Message-State: AOAM532wASH7/AnUAIvwGHFcdqODkmhpUZJe84l19EmF+If16uOqah6d
 a11AuziathIODmuZ9uJA4m/KeQ==
X-Google-Smtp-Source: ABdhPJxnU5dKIOCS5Wz9LJzUDBC/JGomjegmuILb/jbf86x8PSswBQt7CJDyAjCDAB9LCoDJwNYzAQ==
X-Received: by 2002:a05:6a00:4004:b0:518:94e3:485 with SMTP id
 by4-20020a056a00400400b0051894e30485mr45548185pfb.23.1654009172253; 
 Tue, 31 May 2022 07:59:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a1709028e8300b001616723b8ddsm11263101plb.45.2022.05.31.07.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:59:31 -0700 (PDT)
Message-ID: <f8f38e0b-e99f-40d7-d4c7-7e2dc047d4c8@linaro.org>
Date: Tue, 31 May 2022 07:59:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 10/17] target/m68k: Implement TRAPcc
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
 <20220527164807.135038-11-richard.henderson@linaro.org>
 <34af03f0-6c53-17a3-b91f-d368fd2ef7c3@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <34af03f0-6c53-17a3-b91f-d368fd2ef7c3@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/31/22 01:01, Laurent Vivier wrote:
> Le 27/05/2022 à 18:48, Richard Henderson a écrit :
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/m68k/cpu.h          |  2 ++
>>   linux-user/m68k/cpu_loop.c |  1 +
>>   target/m68k/cpu.c          |  1 +
>>   target/m68k/op_helper.c    |  6 +----
>>   target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 54 insertions(+), 5 deletions(-)
>>
> ...
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index 399d9232e4..c4fe8abc03 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
> ...
>> @@ -6050,6 +6098,7 @@ void register_m68k_insns (CPUM68KState *env)
>>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
>>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>>       INSN(dbcc,      50c8, f0f8, M68000);
>> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>>       INSN(tpf,       51f8, fff8, CF_ISA_A);
>>       /* Branch instructions.  */
> 
> This one breaks Mark's series to support MacOS.
> 
> I think the new opcode short-circuits Scc one:
> 
>    ----------------
>    IN: INITRSRCMGR
>    0x408011d0:  st 0xa58
>    Disassembler disagrees with translator over instruction decoding
>    Please report this to qemu-devel@nongnu.org
> 
> The following patch seems to fix the problem:
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index d5d73401b7cc..3b0e3d0b58f6 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -6119,9 +6119,9 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(addsubq,   5000, f080, M68000);
>       BASE(addsubq,   5080, f0c0);
>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>       INSN(dbcc,      50c8, f0f8, M68000);
> -    INSN(trapcc,    50f8, f0f8, TRAPCC);

Hmm.  That will completely hide trapcc -- you should have seen the new test case fail (and 
if not, the test case needs fixing).

These two insn overlap considerably:

    setcc  0101 cond:4 11 mode:3 reg:3
    trapcc 0101 cond:4 11 111 opmode:3

We need to select only the 3 valid opmodes:

     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
     INSN(trapcc,    50fa, f0fe, TRAPCC);   /* opmode 010, 011 */
     INSN(trapcc,    50fc, f0ff, TRAPCC);   /* opmode 100 */
     INSN(trapcc,    51fa, fffe, CP_ISA_A); /* TPF (trapf) opmode 010, 011 */
     INSN(trapcc,    51fc, ffff, CP_ISA_A); /* TPF (trapf) opmode 100 */

which are invalid mode/reg combinations for Scc.


r~


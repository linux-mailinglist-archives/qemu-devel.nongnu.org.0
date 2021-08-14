Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9323EC4B7
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 21:15:07 +0200 (CEST)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEz7a-0002Fi-JX
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 15:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mEz6A-0001As-9w; Sat, 14 Aug 2021 15:13:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mEz68-00026a-DT; Sat, 14 Aug 2021 15:13:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso20954339pjy.5; 
 Sat, 14 Aug 2021 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PyiqZvoebYkuPbkP9gSiU9jkruBDgxF7arZUHyvffn8=;
 b=ntL6ICpgSPvrOVY7adwcdLbbZ4HcVnZyfTPqG9bbKwV1BErdijX7xHHm61HsiRM5tV
 rAsUv0k4rCyio0bUDsjPq62hP8wt3vZg328FcufoLkOmsaEXcGCCRMlQzjMrwvsekLe+
 FYs0MVUERZKyglSicdQozCfX2Fkc6x8K2js98m+5AimURh/gRDSygVIQO/o5mEj49aTC
 L+5O/J7QbCda3j1ZGatzXI7H9H+gcQdYyPNqDGyX8r3aIAx2NtW/aQwJF6curDzicPvg
 ZWeBDbMEJXlexyisenY9y91hoCXcjvprqOeS3iIk9X/w/tVoNtXf2ro5gJed6ksSAw5r
 08fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PyiqZvoebYkuPbkP9gSiU9jkruBDgxF7arZUHyvffn8=;
 b=Q7zVudZ71RjmIOd+r84gG6MDT9t29cskqGA/OSGK0Tw5R3ijVWok1D1or3Ebh54I7M
 3oogSqopxKh7Oi0qcd0ZbO1Tu+Wx8TSJ8blFHAztYKRyrqfh4DIWE1TBGZQEGiXWyQP4
 Y2ox2aZB8Syz+9dNCj6KUxp5n7WVYJuAJur7jJH7o4hmDzI2aoGPbtYyYkqvC7L7TItv
 wmwgTsU8QWACYUYufJrgRGafkBQWaMjrJr2BCXGq8Wgr/KGDN3fSpW5c2s3ZcJ0GUln3
 9WJQhjbeABi1aB4+6hpw3/47zQh1ZlsAbivumcwVvtd8fHciwaAYdXEN71sVd1/QT3H5
 q9Wg==
X-Gm-Message-State: AOAM532q33tGd/tmDqDwEXmT3gm4Fjje4oNlVPN2Pz4wWKnwBvovk2Y/
 AE+tyBofbmz+58Vthnx50ok=
X-Google-Smtp-Source: ABdhPJxRj+yxBTOShPMc2ZiyrROZrvBTTjDzJSZZT3fZpRmqEaGimqp7Mr0BYne877EJ14NqF+FhAw==
X-Received: by 2002:a65:400a:: with SMTP id f10mr8006171pgp.327.1628968413824; 
 Sat, 14 Aug 2021 12:13:33 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.174.223])
 by smtp.gmail.com with ESMTPSA id k197sm6442362pfd.190.2021.08.14.12.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Aug 2021 12:13:33 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
 <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
 <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
 <d2f1f35c-fc82-0b27-b41e-0b1055ecc2e8@gmail.com>
 <7f9ee790-3f5a-6161-627b-0c4313a08bca@gmail.com>
 <d312903b-7096-1ce6-28d0-5bb3690ae0eb@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <67c127c0-33b0-abb7-dcb6-2143cc56a192@gmail.com>
Date: Sat, 14 Aug 2021 16:13:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d312903b-7096-1ce6-28d0-5bb3690ae0eb@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/12/21 9:35 PM, Richard Henderson wrote:
> On 8/12/21 11:24 AM, Daniel Henrique Barboza wrote:
>> +void helper_insns_inc(CPUPPCState *env)
>> +{
>> +    env->pmu_insns_count++;
>> +}
>> +
>> +void helper_insns_dec(CPUPPCState *env)
>> +{
>> +    env->pmu_insns_count--;
>> +}
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 60f35360b7..c56c656694 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -8689,6 +8689,7 @@ static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
>>
>>   static void ppc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>>   {
>> +    gen_helper_insns_inc(cpu_env);
>>       tcg_gen_insn_start(dcbase->pc_next);
>>   }
>>
>> @@ -8755,6 +8756,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>>           return;
>>       }
>>
>> +    gen_helper_insns_dec(cpu_env);
>> +
>>       /* Honor single stepping. */
>>       sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
>>       if (unlikely(sse)) {
>>
>>
>> And then I used 'env->pmu_insns_count' to update the instruction counters. And it's
>> working, with a slightly better performance than we have with the icount()
>> version. I'm not sure why it's working now since I tried something very similar
>> before and it didn't. Figures.
> 
> Not sure why you're decrementing there.
> 
> Also, how do you want to count retired instructions? Ones that merely start?  E.g. including loads that fault?  How about illegal instructions?  Or does the instruction need to run to completion?  Which of these you choose affects where you place the increment.

Before I proceed, let me mention that the numbers I'm about to post here are from the powerpc
selftest located here:

https://github.com/torvalds/linux/blob/master/tools/testing/selftests/powerpc/pmu/count_instructions.c

This test runs an instruction loop that consists of 'addi' instructions . Before running the instructions
there's an overhead calculation with an empty loop.


So, the event I want to count is described as "The thread has completed an instruction" in the ISA.
There are no events that counts illegal instructions or that causes fault, so my guess is that
all completed functions regardless of side-effects are counted.

Putting the incrementer in ppc_tr_insn_start() like I mentioned in my previous reply provides results
similar to the icount version:

# ./count_instructions
test: count_instructions
tags: git_version:v5.13-5357-gdbe69e433722-dirty
Binding to cpu 0
main test running as pid 568
Overhead of null loop: 2370 instructions
instructions: result 1002370 running/enabled 1587314
cycles: result 1001372 running/enabled 1348532
Looped for 1000000 instructions, overhead 2370
Expected 1002370
Actual   1002370
Delta    0, 0.000000%
instructions: result 10010309 running/enabled 11603340
cycles: result 10009311 running/enabled 11362216
Looped for 10000000 instructions, overhead 2370
Expected 10002370
Actual   10010309
Delta    7939, 0.079308%
[FAIL] Test FAILED on line 119
failure: count_instructions

I'm aware that putting the increment in insn_start() is too early since the instruction didn't
even complete, so I attempted to put the increment at the end of ppc_tr_translate_insn(). I
ended up with fewer instructions counted for the same test:

# ./count_instructions
test: count_instructions
tags: git_version:v5.13-5357-gdbe69e433722-dirty
Binding to cpu 0
main test running as pid 575
Overhead of null loop: 1962 instructions
instructions: result 939462 running/enabled 1587310
cycles: result 1001372 running/enabled 1348532
Looped for 1000000 instructions, overhead 1962
Expected 1001962
Actual   939462
Delta    -62500, -6.652744%
[FAIL] Test FAILED on line 116
failure: count_instructions

Reading translator_loop() I can't explain why  we're missing this amount of functions because
translate_insn() is always called right after insns_start():


     while (true) {
         db->num_insns++;

         /* NOTE: incrementing the counter in insn_start() ppc impl gives similar result as icount*/
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */

        (...)

         /* NOTE: incrementing the counter in translate_insn() PPC impl misses 6% of the instructions,
         even though it's always called right after insn_start() */
         if (db->num_insns == db->max_insns && (cflags & CF_LAST_IO)) {
             /* Accept I/O on the last instruction.  */
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
             /* we should only see CF_MEMI_ONLY for io_recompile */
             tcg_debug_assert(!(cflags & CF_MEMI_ONLY));
             ops->translate_insn(db, cpu);
         }

I've recompiled QEMU with --enable-tcg-debug to see if tcg_debug_assert() right after insn_start() was
being hit. The assert isn't being hit in the test.


I also tried to read the instructions in tb_stop() via db->num_insns. Since I'm not worried about missing
the counter_overflow a few instructions it would also be an alternative. I changed the helper to receive
a number of instructions to be added instead of single increments:

static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
      target_ulong nip = ctx->base.pc_next;
      int sse;
  
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(dcbase->num_insns));
+
      if (is_jmp == DISAS_NORETURN) {
          /* We have already exited the TB. */
          return;


The test gives us these numbers:

# ./count_instructions
test: count_instructions
tags: git_version:v5.13-5357-gdbe69e433722-dirty
Binding to cpu 0
main test running as pid 573
Overhead of null loop: 85 instructions
instructions: result 85 running/enabled 1587316
cycles: result 1001372 running/enabled 1348534
Looped for 1000000 instructions, overhead 85
Expected 1000085
Actual   85
Delta    -1000000, -1176470.588235%
[FAIL] Test FAILED on line 116
failure: count_instructions

This is the situation I've faced some time ago and commented on a previous email. My hypothesis
back then was that translation_loop(), which is called via gen_intermediate_code() - tb_gen_code(),
was not being executed because tb_gen_code() is always guarded by a tb_lookup() , and
assumed that the lookup was finding the already translated TB and cpu_tb_exec() with it.


Well, we just saw that incrementing the counter in both insn_start() and translate_insn() gives
a far greater number than trying to sum up all the db->num_insns in tb_stop(), and all of
them are called inside translator_loop(). This invalidates (I guess) the assumptions I made
on tb_gen_code() up above. So yeah, I need more time to understand why I'm getting these
numbers.

For now, I'm really tempted into increment the instructions at insn_start() and come back at
instruction counting specifics in a follow-up work.


> 
> It is of course extremely heavyweight to call a helper to perform a simple addition operation.

This increment would update all registers that are counting instructions and
also fire a PMU interrupt when an overflow happens. I also added the frozen
count PMU bit in 'hflags' so we can increment only if the PMU is running.


There's a good chance that most of this can be done outside the helper in a
TCG function in translate.c. That would minimize the impact of the running
PMU in the translation process. I'll see how it goes.


> 
> You may also wish to look at target/hexagon, gen_exec_counters(), which is doing the same sort of thing.  But not completely, since it loses count along dynamic exception paths (e.g. faulting load).  That can be fixed as well, via restore_state_to_opc.

I saw the hexagon code and attempted to accumulate the instructions in
a 'num_insn' ctx variable, that was incremented in insns_start(), and then
update the PMU counters in tb_stop() with it. The results were similar
to what I've described above with db->num_insns in tb_stop().



Thanks,


Daniel


> 
> 
> r~


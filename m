Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE045B949
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:39:30 +0100 (CET)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpqca-0003E8-Vp
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:39:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpqas-000284-EF
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:37:42 -0500
Received: from [2a00:1450:4864:20::429] (port=43605
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpqaq-0008Pa-1m
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:37:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id v11so3596285wrw.10
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 03:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jymJ6u1S6K/hKezNabPdukRHoIbd/yEJDGYBlOiYh/g=;
 b=fC7u473z7n38eyWY//LuAJsGYZ45iJdFGFBwGh/Mw2+XNy5gBzL5vSfYF1PuRDUwAk
 BWLvbHvgl0udhigTgwjMgc3SRN+9R10mElgsaoWaNfd3u7MqpXNfMamNq8xOx5m6Nar3
 jv/Uvk8WnUUVunwY5bdVJZtuj1UUrfnmfhpPm/iav+Q83CtbO8NvONv8/qKmoVka0mcC
 1iEV5bbB3QUE+vpifbqvJCj1vLXBe3oRLSFJVPNnufuXV0+C9eYT4Up7shA62aCnizbX
 KoNyW4DXiz095398UTFkMzHy7NXRixOps3JxQvgn28Eb+EJmaAqkZp/iMVNpGTRm4E/i
 bIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jymJ6u1S6K/hKezNabPdukRHoIbd/yEJDGYBlOiYh/g=;
 b=jNfu4pmB1m8uo2aKdooTofQAgQFfMSd7fmlQrv3wZMZe8utb/zdg2SALkDeMRpkQoJ
 rY2p5/kL+do0PoWoZmG+VWOWZEfdwccpr7rzyF/eBh1S+hIUMB/745N9Fb6fLoAWtovc
 qGNOHJX0qUMmpd4uet3Eeg40NNjd1MflpNUEQVd+27z0gfdM6m+5lFYrYHVHg+Sfp4p/
 DBHN4+Bk8CBah/pLwFXxTmZjkcgqqbXIFOcwNJ6CtRtvC5M4UdGswDxk/1ilMGOUno36
 EeGchU5jWhcuswzrqEyVdkiJyG1jmG0WHRWx5UJfW+rEJdy7Qm3lI8BEyFGClOnK49CO
 ZtQQ==
X-Gm-Message-State: AOAM533psgSnbjm4QXxsnmS5gzdPp99AG/HPGJbe+NBgzrcCkbynTlF7
 jswOE8J6BWfpYyd2bca1Avn9wA==
X-Google-Smtp-Source: ABdhPJzaX6u1GeFzsIHTf6DfFh6iuqbW8Gqkk3udZwXyK5Wlnqrv5Q/WOzBbZ9dlQsS0mNpP6WsIkw==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr17309628wrr.53.1637753858294; 
 Wed, 24 Nov 2021 03:37:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h22sm5286546wmq.14.2021.11.24.03.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 03:37:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABD641FF96;
 Wed, 24 Nov 2021 11:37:36 +0000 (GMT)
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-3-alex.bennee@linaro.org>
 <69ae3ca0-a485-d5ff-2508-5fcd13869498@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 2/7] accel/tcg: suppress IRQ check for special TBs
Date: Wed, 24 Nov 2021 10:24:53 +0000
In-reply-to: <69ae3ca0-a485-d5ff-2508-5fcd13869498@linaro.org>
Message-ID: <8735nliy2n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/23/21 9:57 PM, Alex Benn=C3=A9e wrote:
>> Generally when we set cpu->cflags_next_tb it is because we want to
>> carefully control the execution of the next TB. Currently there is a
>> race that causes cflags_next_tb to get ignored if an IRQ is processed
>> before we execute any actual instructions.
>> To avoid this we introduce a new compiler flag: CF_NOIRQ to suppress
>> this check in the generated code so we know we will definitely execute
>> the next block.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245
>> ---
>>   include/exec/exec-all.h   |  1 +
>>   include/exec/gen-icount.h | 21 +++++++++++++++++----
>>   accel/tcg/cpu-exec.c      | 14 ++++++++++++++
>>   3 files changed, 32 insertions(+), 4 deletions(-)
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 6bb2a0f7ec..35d8e93976 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -503,6 +503,7 @@ struct TranslationBlock {
>>   #define CF_USE_ICOUNT    0x00020000
>>   #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock=
 held */
>>   #define CF_PARALLEL      0x00080000 /* Generate code for a parallel co=
ntext */
>> +#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
>>   #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
>>   #define CF_CLUSTER_SHIFT 24
>>   diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
>> index 610cba58fe..c57204ddad 100644
>> --- a/include/exec/gen-icount.h
>> +++ b/include/exec/gen-icount.h
>> @@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlock=
 *tb)
>>   {
>>       TCGv_i32 count;
>>   -    tcg_ctx->exitreq_label =3D gen_new_label();
>>       if (tb_cflags(tb) & CF_USE_ICOUNT) {
>>           count =3D tcg_temp_local_new_i32();
>>       } else {
>> @@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBloc=
k *tb)
>>           icount_start_insn =3D tcg_last_op();
>>       }
>>   -    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0,
>> tcg_ctx->exitreq_label);
>> +    /*
>> +     * Emit the check against icount_decr.u32 to see if we should exit
>> +     * unless we suppress the check with CF_NOIRQ. If we are using
>> +     * icount and have suppressed interruption the higher level code
>> +     * should have ensured we don't run more instructions than the
>> +     * budget.
>> +     */
>> +    if (tb_cflags(tb) & CF_NOIRQ) {
>> +        tcg_ctx->exitreq_label =3D NULL;
>> +    } else {
>> +        tcg_ctx->exitreq_label =3D gen_new_label();
>> +        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_lab=
el);
>> +    }
>>         if (tb_cflags(tb) & CF_USE_ICOUNT) {
>>           tcg_gen_st16_i32(count, cpu_env,
>> @@ -74,8 +85,10 @@ static inline void gen_tb_end(const TranslationBlock =
*tb, int num_insns)
>>                              tcgv_i32_arg(tcg_constant_i32(num_insns)));
>>       }
>>   -    gen_set_label(tcg_ctx->exitreq_label);
>> -    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>> +    if (tcg_ctx->exitreq_label) {
>> +        gen_set_label(tcg_ctx->exitreq_label);
>> +        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>> +    }
>>   }
>>     #endif
>
> Split patch here, I think.

Not including the header to cpu_handle_interrupt?=20

>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 9cb892e326..9e3ed42ceb 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -721,6 +721,15 @@ static inline bool need_replay_interrupt(int interr=
upt_request)
>>   static inline bool cpu_handle_interrupt(CPUState *cpu,
>>                                           TranslationBlock **last_tb)
>>   {
>> +    /*
>> +     * If we have special cflags lets not get distracted with IRQs. We
>> +     * shall exit the loop as soon as the next TB completes what it
>> +     * needs to do.
>> +     */
>
> We will *probably* exit the loop, I think.
>
> With watchpoints, we expect to perform the same memory operation,
> which is expected to hit the watchpoint_hit check in
> cpu_check_watchpoint, which will raise CPU_INTERRUPT_DEBUG.
>
> With SMC, we flush all TBs from the current page, re-execute one insn,
> and then (probably) have to exit to generate the next tb.
>
> With icount, in cpu_loop_exec_tb, we have no idea what's coming; we
> only know that we want no more than N insns to execute.

I think technically we do because all asynchronous interrupt are tied to
the icount (which is part of the budget calculation - icount_get_limit).
In theory we could drop the interrupt check altogether in icount mode
because we should always end and exit to the outer loop when a timer is
going to expire.

> None of which directly exit the loop -- we need the IRQ check at the
> beginning of the *next* TB to exit the loop.
>
> If we want to force an exit from the loop, we need CF_NO_GOTO_TB |
> CF_NO_GOTO_PTR.  Which is probably a good idea, at least for
> watchpoints; exit_tb is the fastest way out of the TB to recognize the
> debug interrupt.
>
> The icount usage I find a bit odd.  I don't think that we should
> suppress an IRQ in that case -- we can have up to 510 insns
> outstanding on icount_budget, which is clearly far too many to have
> IRQs disabled.  I think we should not use cflags_next_tb for this at
> all, but should apply the icount limit later somehow, because an IRQ
> *could* be recognized immediately, with the first TB of the interrupt
> handler running with limited budget, and the icount tick being
> recognized at that point.

I wonder what would happen if we checked u16.high in icount mode? No
timer should ever set it - although I guess it could get set during an
IO operation.

Perhaps really all icount exit checks should be done at the end of
blocks? I suspect that breaks too many assumptions in the rest of the
code.

>
>> +             * As we don't want this special TB being interrupted by
>> +             * some sort of asynchronous event we apply CF_NOIRQ to
>> +             * disable the usual event checking.
>>                */
>>               cflags =3D cpu->cflags_next_tb;
>>               if (cflags =3D=3D -1) {
>>                   cflags =3D curr_cflags(cpu);
>>               } else {
>> +                cflags |=3D CF_NOIRQ;
>>                   cpu->cflags_next_tb =3D -1;
>>               }
>
> Is it clearer to add NOIRQ here, or back where we set cflags_next_tb
> in the first place?

Are there cases of setting cpu->cflags_next_tb which we are happy to get
preempted by asynchronous events? I guess in the SMC case it wouldn't
matter because when we get back from the IRQ things get reset?

>
>
> r~


--=20
Alex Benn=C3=A9e


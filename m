Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58C45C9B8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:17:51 +0100 (CET)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuxy-0002JF-5I
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpuvi-0000hy-9M
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:30 -0500
Received: from [2a00:1450:4864:20::434] (port=47094
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpuvg-0004vP-8v
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id u1so5098097wru.13
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 08:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gaBIwr0vPp4jdqO9PXvXTal56ij/ZIu/zlzpC6a+NO8=;
 b=Blv4eSpSidaTHTsXdAygJvRK1S2+ZJLoY/MpNEQD7VvRjh2EA+55ytfgC2G1taGU/Y
 Od089P7zSCUB4ZTwmypvIxEOsmJy2eLSQvBUG9GzwXLqWBi4LfWTi5oBcxXNZJXxLf8V
 FrqI5dzvJuZmJdZSYpyxPMIDE9sYdTYd+tUntMObykysrXi2DsQmNtNlLKsTIvv8/dj/
 KY9ZYiyoARHge3U7QhLlrLMfIEupHWTiAhUi4FYRBRxuxUSXGTXd5i9uLtx9TAvdXri1
 8ziB9f1kpgroP7F371rEV1CEQossIQMr+FUc0bwKHLhDb7c2265rgnFgSjUHSvl1CKQY
 mooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gaBIwr0vPp4jdqO9PXvXTal56ij/ZIu/zlzpC6a+NO8=;
 b=7w447VcliyCWr1VQ9t64ZyMtnRQtx/ZOwcYPAlJE8ZTxLZCMw9zndbNgYBfayLqCBc
 ZSpoXEQq+jQnjvJayI7d+WbkeYxuGYoXBdQZjCz6kWVaZUPjpTRktJGzZQqUrqfcI+7t
 01jBa0aF/eaZi1+DwcNvtBU304RHHShSog9UdU4i5zTYtefx4zYTPmYfzYGzDZy94JzQ
 wYkU1wf3OELuifjfvuW1bZ578MVZiBL8/6QlUZ0jZaj52wFlF1B5blxlWn/TlCfYJten
 hlg90XNNp8Vvb5F3yHBa7MQIeh5LT4oHhAKeZ+5+sEf9QvbxI3jOJ0yrEGKfiTep/Jja
 qRZA==
X-Gm-Message-State: AOAM530//Ex6cwNxmt7dt3ILHc+MwWJFZjQu8udadxrEe7r9u47fhA+7
 Gm1S8/TnpiNfIG+GwJMiUhvAbw==
X-Google-Smtp-Source: ABdhPJwzLhA+zDmRl/uEEcI1ewsPHSNU+SNoYODMau+gqTDigro28HayQuNY8t36v0ZETkZ0qkim9w==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr19720417wrt.103.1637770526192; 
 Wed, 24 Nov 2021 08:15:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm336514wre.32.2021.11.24.08.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 08:15:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A6B01FF96;
 Wed, 24 Nov 2021 16:15:24 +0000 (GMT)
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-3-alex.bennee@linaro.org>
 <69ae3ca0-a485-d5ff-2508-5fcd13869498@linaro.org>
 <8735nliy2n.fsf@linaro.org>
 <3d48bf77-e8c0-d9ba-4b28-6b13e870f95a@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 2/7] accel/tcg: suppress IRQ check for special TBs
Date: Wed, 24 Nov 2021 16:04:45 +0000
In-reply-to: <3d48bf77-e8c0-d9ba-4b28-6b13e870f95a@linaro.org>
Message-ID: <87czmph6n7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> On 11/24/21 11:24 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 11/23/21 9:57 PM, Alex Benn=C3=A9e wrote:
>>>> Generally when we set cpu->cflags_next_tb it is because we want to
>>>> carefully control the execution of the next TB. Currently there is a
>>>> race that causes cflags_next_tb to get ignored if an IRQ is processed
>>>> before we execute any actual instructions.
>>>> To avoid this we introduce a new compiler flag: CF_NOIRQ to suppress
>>>> this check in the generated code so we know we will definitely execute
>>>> the next block.
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245
>>>> ---
>>>>    include/exec/exec-all.h   |  1 +
>>>>    include/exec/gen-icount.h | 21 +++++++++++++++++----
>>>>    accel/tcg/cpu-exec.c      | 14 ++++++++++++++
>>>>    3 files changed, 32 insertions(+), 4 deletions(-)
>>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>>> index 6bb2a0f7ec..35d8e93976 100644
>>>> --- a/include/exec/exec-all.h
>>>> +++ b/include/exec/exec-all.h
>>>> @@ -503,6 +503,7 @@ struct TranslationBlock {
>>>>    #define CF_USE_ICOUNT    0x00020000
>>>>    #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_l=
ock held */
>>>>    #define CF_PARALLEL      0x00080000 /* Generate code for a parallel=
 context */
>>>> +#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB=
 */
>>>>    #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
>>>>    #define CF_CLUSTER_SHIFT 24
>>>>    diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
>>>> index 610cba58fe..c57204ddad 100644
>>>> --- a/include/exec/gen-icount.h
>>>> +++ b/include/exec/gen-icount.h
>>>> @@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlo=
ck *tb)
>>>>    {
>>>>        TCGv_i32 count;
>>>>    -    tcg_ctx->exitreq_label =3D gen_new_label();
>>>>        if (tb_cflags(tb) & CF_USE_ICOUNT) {
>>>>            count =3D tcg_temp_local_new_i32();
>>>>        } else {
>>>> @@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBl=
ock *tb)
>>>>            icount_start_insn =3D tcg_last_op();
>>>>        }
>>>>    -    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0,
>>>> tcg_ctx->exitreq_label);
>>>> +    /*
>>>> +     * Emit the check against icount_decr.u32 to see if we should exit
>>>> +     * unless we suppress the check with CF_NOIRQ. If we are using
>>>> +     * icount and have suppressed interruption the higher level code
>>>> +     * should have ensured we don't run more instructions than the
>>>> +     * budget.
>>>> +     */
>>>> +    if (tb_cflags(tb) & CF_NOIRQ) {
>>>> +        tcg_ctx->exitreq_label =3D NULL;
>>>> +    } else {
>>>> +        tcg_ctx->exitreq_label =3D gen_new_label();
>>>> +        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_l=
abel);
>>>> +    }
>>>>          if (tb_cflags(tb) & CF_USE_ICOUNT) {
>>>>            tcg_gen_st16_i32(count, cpu_env,
>>>> @@ -74,8 +85,10 @@ static inline void gen_tb_end(const TranslationBloc=
k *tb, int num_insns)
>>>>                               tcgv_i32_arg(tcg_constant_i32(num_insns)=
));
>>>>        }
>>>>    -    gen_set_label(tcg_ctx->exitreq_label);
>>>> -    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>>>> +    if (tcg_ctx->exitreq_label) {
>>>> +        gen_set_label(tcg_ctx->exitreq_label);
>>>> +        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>>>> +    }
>>>>    }
>>>>      #endif
>>>
>>> Split patch here, I think.
>> Not including the header to cpu_handle_interrupt?
>
> Correct.  Introduce CF_NOIRQ without using it yet.
>
>>> With icount, in cpu_loop_exec_tb, we have no idea what's coming; we
>>> only know that we want no more than N insns to execute.
>> I think technically we do because all asynchronous interrupt are
>> tied to
>> the icount (which is part of the budget calculation - icount_get_limit).
>
> Are you sure that's plain icount and not replay?
> In icount_get_limit we talk about timers, not any other asynchronous
> interrupt, like a keyboard press.

Hmm right - and I guess other I/O during record of icount. I guess it's
only fully deterministic (outside of replay) if it's a totally
"isolated" from external system events.

>> In theory we could drop the interrupt check altogether in icount mode
>> because we should always end and exit to the outer loop when a timer is
>> going to expire.
>
> But we know nothing about synchronous exceptions or anything else.

Hmm I didn't think we needed to care about synchronous events but now
you have me wandering what happens in icount mode when an exception
happens mid-block?

>> I wonder what would happen if we checked u16.high in icount mode? No
>> timer should ever set it - although I guess it could get set during an
>> IO operation.
>
> Uh, we do, via u32?  I'm not sure what you're saying here.

I mean should we detect if something has called cpu_exit() mid block
rather than just icount expiring.

<snip>
>> Are there cases of setting cpu->cflags_next_tb which we are happy to get
>> preempted by asynchronous events?
>
> Well, icount.
>
>> I guess in the SMC case it wouldn't
>> matter because when we get back from the IRQ things get reset?
>
> SMC probably would work with an interrupt, but we'd wind up having to
> repeat the process of flushing all TBs on the page, so we might as
> well perform the one store and get it over with.

I guess. Makes the patch a bit noisier though...

--=20
Alex Benn=C3=A9e


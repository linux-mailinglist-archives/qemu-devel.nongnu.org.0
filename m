Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270F8319D79
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:42:33 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWqG-0006Td-0b
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAWog-00060O-Ep
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:40:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAWoc-0006td-81
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:40:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id t15so5162701wrx.13
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MWsA+ADTB4tngEBFHPhdglgyLcX5HmkfB0kkZsSx5EA=;
 b=JIAjNLdvQfn/z20k4kNsO8M/FbvGOM2kOg8vLfSZLbJ/AAhJrE0qU3wOKeqHwmLTG9
 z+tE7bSJMwiGRCI9xYCTLOk/ceWbBUglid60v3z9wVtNEoO0d/Cd8zAaWU5kQw4XM5uD
 0RS26bT9+dLWxNGsyAWvNbHUtY6zAceQWKm6iIKbPjaNc7YhE1MrnKgoQv2iFZScc7nk
 27+hw4Tt4Z5bGeRzmL8cGVVICp7yFOVyyCU6dpgg+3FueZM7jdUnflCAxVCTHCgMciyp
 P4bOgvCJKLcEGu8mXOIVfnIoRHZ0XjsfhhTm+uKaIgoN4KgFvIlrxmic4BUylZI3z6pl
 AQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MWsA+ADTB4tngEBFHPhdglgyLcX5HmkfB0kkZsSx5EA=;
 b=djW/gandcK3G4e+0XStdDRwCMGr/VbM7d+y/GI2DveCwHrPsyWkXNkDfUcx5s1ZWFZ
 tr/wjE29GeMXIUw4vnp8W+ckrGNmbXGrXfBfarDBAdDXpfl2O80HSV6fGEuxHpSMKxTH
 Iz9S+YLQTlmG3hqXb860Pk8xsYgEa/rY7ilebGGAeiUBlhqe2QF0fcOwHXW5MZB7skWX
 f2EF3X+riMR0Iy5NvDMZcLCkB/13uEdAqYQA++xSP3ivyEQZR0gAsTzEaga50016LLli
 VnWP+eZdCo+GUJ0OJzvxU6p4iqbBVC4F8CcAoMZxwJqbDDHKFNNVjXM6fnDuwnwf6CTH
 9rLA==
X-Gm-Message-State: AOAM530f6xeZmpLTaXbMMh+UbeMXvS4YH4AabYyzyOMdw6rgdPbMIYTv
 TNaH7OfNMQNFGUv8YGcsrM2u4Q==
X-Google-Smtp-Source: ABdhPJwQ4IX1zK/GGLXr/yOwenUDOhcQ6Jkc9QzF6BM4SD8MZYnTs+zalNvR3pGQED0Z/WiwbFDChQ==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr2946668wrw.52.1613130047425; 
 Fri, 12 Feb 2021 03:40:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i7sm37070974wmq.2.2021.02.12.03.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 03:40:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5EEC1FF7E;
 Fri, 12 Feb 2021 11:40:45 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Fri, 12 Feb 2021 11:22:42 +0000
In-reply-to: <YCXRpCiekU+TgoAX@strawberry.localdomain>
Message-ID: <87a6s9v7ia.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 10 22:10, Alex Benn=C3=A9e wrote:
>> When icount is enabled and we recompile an MMIO access we end up
>> double counting the instruction execution. To avoid this we introduce
>> the CF_NOINSTR cflag which disables instrumentation for the next TB.
>> As this is part of the hashed compile flags we will only execute the
>> generated TB while coming out of a cpu_io_recompile.
>
> Unfortunately this patch works a little too well!
>
> With this change, the memory access callbacks registered via
> `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> re-translated instruction making the IO access, since we've disabled all
> instrumentation.

Hmm well we correctly don't instrument stores (as we have already
executed the plugin for them) - but of course the load instrumentation
is after the fact so we are now missing them.


> Is it possible to selectively disable only instruction callbacks using
> this mechanism, while still allowing others that would not yet have been
> called for the re-translated instruction?

Hmmm let me see if I can finesse the CF_NOINSTR logic to allow
plugin_gen_insn_end() without the rest? It probably needs a better name
for the flag as well.=20

>
> -Aaron
>
>> While we are at it delete the old TODO. We might as well keep the
>> translation handy as it's likely you will repeatedly hit it on each
>> MMIO access.
>>=20
>> Reported-by: Aaron Lindsay <aaron@os.amperecomputing.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20210209182749.31323-12-alex.bennee@linaro.org>
>>=20
>> ---
>> v2
>>   - squashed CH_HASHMASK to ~CF_INVALID
>> ---
>>  include/exec/exec-all.h   |  6 +++---
>>  accel/tcg/translate-all.c | 17 ++++++++---------
>>  accel/tcg/translator.c    |  2 +-
>>  3 files changed, 12 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index e08179de34..299282cc59 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -454,14 +454,14 @@ struct TranslationBlock {
>>      uint32_t cflags;    /* compile flags */
>>  #define CF_COUNT_MASK  0x00007fff
>>  #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
>> +#define CF_NOINSTR     0x00010000 /* Disable instrumentation of TB */
>>  #define CF_USE_ICOUNT  0x00020000
>>  #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock he=
ld */
>>  #define CF_PARALLEL    0x00080000 /* Generate code for a parallel conte=
xt */
>>  #define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
>>  #define CF_CLUSTER_SHIFT 24
>> -/* cflags' mask for hashing/comparison */
>> -#define CF_HASH_MASK   \
>> -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUS=
TER_MASK)
>> +/* cflags' mask for hashing/comparison, basically ignore CF_INVALID */
>> +#define CF_HASH_MASK   (~CF_INVALID)
>>=20=20
>>      /* Per-vCPU dynamic tracing state used to generate this TB */
>>      uint32_t trace_vcpu_dstate;
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 0666f9ef14..32a3d8fe24 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -2399,7 +2399,8 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t =
retaddr)
>>  }
>>=20=20
>>  #ifndef CONFIG_USER_ONLY
>> -/* in deterministic execution mode, instructions doing device I/Os
>> +/*
>> + * In deterministic execution mode, instructions doing device I/Os
>>   * must be at the end of the TB.
>>   *
>>   * Called by softmmu_template.h, with iothread mutex not held.
>> @@ -2430,19 +2431,17 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t r=
etaddr)
>>          n =3D 2;
>>      }
>>=20=20
>> -    /* Generate a new TB executing the I/O insn.  */
>> -    cpu->cflags_next_tb =3D curr_cflags() | CF_LAST_IO | n;
>> +    /*
>> +     * Exit the loop and potentially generate a new TB executing the
>> +     * just the I/O insns. We also disable instrumentation so we don't
>> +     * double count the instruction.
>> +     */
>> +    cpu->cflags_next_tb =3D curr_cflags() | CF_NOINSTR | CF_LAST_IO | n;
>>=20=20
>>      qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
>>                             "cpu_io_recompile: rewound execution of TB t=
o "
>>                             TARGET_FMT_lx "\n", tb->pc);
>>=20=20
>> -    /* TODO: If env->pc !=3D tb->pc (i.e. the faulting instruction was =
not
>> -     * the first in the TB) then we end up generating a whole new TB and
>> -     *  repeating the fault, which is horribly inefficient.
>> -     *  Better would be to execute just this insn uncached, or generate=
 a
>> -     *  second new TB.
>> -     */
>>      cpu_loop_exit_noexc(cpu);
>>  }
>>=20=20
>> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
>> index a49a794065..14d1ea795d 100644
>> --- a/accel/tcg/translator.c
>> +++ b/accel/tcg/translator.c
>> @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasCo=
ntextBase *db,
>>      ops->tb_start(db, cpu);
>>      tcg_debug_assert(db->is_jmp =3D=3D DISAS_NEXT);  /* no early exit */
>>=20=20
>> -    plugin_enabled =3D plugin_gen_tb_start(cpu, tb);
>> +    plugin_enabled =3D !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_=
tb_start(cpu, tb);
>>=20=20
>>      while (true) {
>>          db->num_insns++;
>> --=20
>> 2.20.1
>>=20


--=20
Alex Benn=C3=A9e


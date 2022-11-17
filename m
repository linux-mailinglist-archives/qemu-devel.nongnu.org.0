Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA462D7B3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 11:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovbkZ-0001GD-Un; Thu, 17 Nov 2022 05:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovbkQ-0001DF-Ay; Thu, 17 Nov 2022 05:03:55 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovbkL-0005Wx-6n; Thu, 17 Nov 2022 05:03:52 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 r76-20020a4a374f000000b004988a70de2eso221110oor.2; 
 Thu, 17 Nov 2022 02:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VABtYdWgQkGIvWHgSdjx0Y6t3P6oRaKQJopjomauoOE=;
 b=durmlPXLS1zXdfQ+s7zkVU9bBh30YQCouLwfExqsrCgnIKUwVATl+uX1mB1xCOkpe8
 VNhuVli84PLoA6YFpEo0n7Rf1M7OekZoJVVZjdTSkpP5ll60QDzjRhMtjJ3t7nMKl6tT
 A0+nnQgeNTxCzJLjHnQKzBAyXW2yV77ZDGqNSK+OFYafO/6aBI5Wdw2Rm7aFaYv0gm5Y
 VSN6CA2sdra45J4f/rGdVsUQfQSxwS5LWdOOxdfbqbshVydA/4RyKkT0wAjhsAB9kax/
 Jd4eaebR3xZc+hwYAQLhFOe5dpr/lFRA/ZztplGehc3GCWWCAfe2m2FIu5LrwY04D4FM
 7i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VABtYdWgQkGIvWHgSdjx0Y6t3P6oRaKQJopjomauoOE=;
 b=J3lwYxuny6RFsNvewNiItEScJuOlGMch9+dduYhov9BjhpWrryLHtuMTBx/sb/IL01
 y273YRNkR+DvQd9ML0GEO0S8addzRm2yfcNLREs/tID+ui6p9qtD9gh1ufJIWmctqMgu
 zNBVASGDQHhtY0raaepxUIz+vzYCP6y/nCukBO+fc3VAwj53KxAZ5HOklzpejHeAHgLl
 2GrukyRG0RUuek9W7H8P5qWMbsahtObYxE2q8QANjnktR/Xzzx1nZe33YQiJj0jqhtbm
 Pe1BDgIfykO74fDyFvCEwjI7wjZZ3jcWoZVTmRWRVEiimWAtqqQ7puk4NQ8Fg+9vQVA2
 vSgg==
X-Gm-Message-State: ANoB5pmz0cg17diJNLjklTiPKFn2eLRwRSfWwRo2p/tj2bDm40vCc92c
 B0QAsn/k2T4C6d5njYEw63Q=
X-Google-Smtp-Source: AA0mqf76vMksklv8liA1vNnyJBSedeeBDCJCvKWGzMKzMQ/iLFll9W5s3cG563RxkQ/N49n7vDq8kw==
X-Received: by 2002:a05:6820:1524:b0:49f:b32b:b0af with SMTP id
 ay36-20020a056820152400b0049fb32bb0afmr895277oob.16.1668679426236; 
 Thu, 17 Nov 2022 02:03:46 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05687042cc00b0013ae39d0575sm167623oah.15.2022.11.17.02.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 02:03:46 -0800 (PST)
Message-ID: <f9ff61cf-e38a-15de-5059-e76e6a174515@gmail.com>
Date: Thu, 17 Nov 2022 07:03:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 1/1] target/ppc: Use tcg_gen_atomic_cmpxchg_i128
 for STQCX
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>
References: <20221112061122.2720163-1-richard.henderson@linaro.org>
 <20221112061122.2720163-2-richard.henderson@linaro.org>
 <e8423c84-0e72-f4d2-97b1-55280bd137e5@gmail.com>
 <CAFXwXrkHgRQ7ADXiRx4rTW3NGYBk0GWLLagN7+RZZYF_yoLZFg@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFXwXrkHgRQ7ADXiRx4rTW3NGYBk0GWLLagN7+RZZYF_yoLZFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/16/22 23:48, Richard Henderson wrote:
> I think you missed the Based-on tag.
> 
> r~


Duh. Sorry about that. Let me try it again.


Daniel


> 
> On Wed, 16 Nov 2022, 05:38 Daniel Henrique Barboza, <danielhb413@gmail.com <mailto:danielhb413@gmail.com>> wrote:
> 
>     Richard,
> 
>     I believe the ppc64-linux-user target didn't like what you did in this
>     patch. Here's the error:
> 
>     $ ../configure --target-list=ppc64-softmmu,ppc64-linux-user,ppc-softmmu,ppc-linux-user,ppc64le-linux-user
>     $ make -j
> 
>     (...)
> 
>     [15/133] Compiling C object libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o
>     FAILED: libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o
>     cc -m64 -mcx16 -Ilibqemu-ppc64-linux-user.fa.p -I. -I.. -Itarget/ppc -I../target/ppc -I../common-user/host/x86_64 -I../linux-user/include/host/x86_64 -I../linux-user/include -Ilinux-user -I../linux-user -Ilinux-user/ppc -I../linux-user/ppc -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /home/danielhb/kvm-project/qemu/linux-headers -isystem linux-headers -iquote . -iquote /home/danielhb/kvm-project/qemu -iquote /home/danielhb/kvm-project/qemu/include -iquote /home/danielhb/kvm-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
>     -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET="ppc64-linux-user-config-target.h"' '-DCONFIG_DEVICES="ppc64-linux-user-config-devices.h"' -MD -MQ libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o -MF libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o.d -o libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o -c ../target/ppc/translate.c
>     ../target/ppc/translate.c: In function ‘gen_stqcx_’:
>     ../target/ppc/translate.c:3989:5: error: unknown type name ‘TCGv_i128’; did you mean ‘TCGv_i32’?
>        3989 |     TCGv_i128 cmp, val;
>             |     ^~~~~~~~~
>             |     TCGv_i32
>     ../target/ppc/translate.c:4006:11: error: implicit declaration of function ‘tcg_temp_new_i128’; did you mean ‘tcg_temp_new_i32’? [-Werror=implicit-function-declaration]
>        4006 |     cmp = tcg_temp_new_i128();
>             |           ^~~~~~~~~~~~~~~~~
>             |           tcg_temp_new_i32
>     ../target/ppc/translate.c:4006:11: error: nested extern declaration of ‘tcg_temp_new_i128’ [-Werror=nested-externs]
>     ../target/ppc/translate.c:4009:5: error: implicit declaration of function ‘tcg_gen_concat_i64_i128’; did you mean ‘tcg_gen_concat_i32_i64’? [-Werror=implicit-function-declaration]
>        4009 |     tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2, cpu_reserve_val);
>             |     ^~~~~~~~~~~~~~~~~~~~~~~
>             |     tcg_gen_concat_i32_i64
>     ../target/ppc/translate.c:4009:5: error: nested extern declaration of ‘tcg_gen_concat_i64_i128’ [-Werror=nested-externs]
>     ../target/ppc/translate.c:4014:5: error: implicit declaration of function ‘tcg_gen_atomic_cmpxchg_i128’; did you mean ‘tcg_gen_atomic_cmpxchg_i32’? [-Werror=implicit-function-declaration]
>        4014 |     tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val, ctx->mem_idx,
>             |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>             |     tcg_gen_atomic_cmpxchg_i32
>     ../target/ppc/translate.c:4014:5: error: nested extern declaration of ‘tcg_gen_atomic_cmpxchg_i128’ [-Werror=nested-externs]
>     ../target/ppc/translate.c:4016:5: error: implicit declaration of function ‘tcg_temp_free_i128’; did you mean ‘tcg_temp_free_i32’? [-Werror=implicit-function-declaration]
>        4016 |     tcg_temp_free_i128(cmp);
>             |     ^~~~~~~~~~~~~~~~~~
>             |     tcg_temp_free_i32
>     ../target/ppc/translate.c:4016:5: error: nested extern declaration of ‘tcg_temp_free_i128’ [-Werror=nested-externs]
>     ../target/ppc/translate.c:4020:5: error: implicit declaration of function ‘tcg_gen_extr_i128_i64’; did you mean ‘tcg_gen_ext_i32_i64’? [-Werror=implicit-function-declaration]
>        4020 |     tcg_gen_extr_i128_i64(t1, t0, val);
>             |     ^~~~~~~~~~~~~~~~~~~~~
>             |     tcg_gen_ext_i32_i64
>     ../target/ppc/translate.c:4020:5: error: nested extern declaration of ‘tcg_gen_extr_i128_i64’ [-Werror=nested-externs]
>     cc1: all warnings being treated as errors
>     [16/133] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_mmu_helper.c.o
>     [17/133] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_translate.c.o
>     FAILED: libqemu-ppc64-softmmu.fa.p/target_ppc_translate.c.o
> 
> 
>     Thanks,
> 
> 
>     Daniel
> 
> 
>     On 11/12/22 03:11, Richard Henderson wrote:
>      > Note that the previous direct reference to reserve_val,
>      >
>      > -   tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
>      > -                                ? offsetof(CPUPPCState, reserve_val2)
>      > -                                : offsetof(CPUPPCState, reserve_val)));
>      >
>      > was incorrect because all references should have gone through
>      > cpu_reserve_val.  Create a cpu_reserve_val2 tcg temp to fix this.
>      >
>      > Signed-off-by: Richard Henderson <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>>
>      > ---
>      >   target/ppc/helper.h     |   2 -
>      >   target/ppc/mem_helper.c |  44 -----------------
>      >   target/ppc/translate.c  | 102 ++++++++++++++++++----------------------
>      >   3 files changed, 47 insertions(+), 101 deletions(-)
>      >
>      > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>      > index 8dd22a35e4..0beaca5c7a 100644
>      > --- a/target/ppc/helper.h
>      > +++ b/target/ppc/helper.h
>      > @@ -818,6 +818,4 @@ DEF_HELPER_FLAGS_5(stq_le_parallel, TCG_CALL_NO_WG,
>      >                      void, env, tl, i64, i64, i32)
>      >   DEF_HELPER_FLAGS_5(stq_be_parallel, TCG_CALL_NO_WG,
>      >                      void, env, tl, i64, i64, i32)
>      > -DEF_HELPER_5(stqcx_le_parallel, i32, env, tl, i64, i64, i32)
>      > -DEF_HELPER_5(stqcx_be_parallel, i32, env, tl, i64, i64, i32)
>      >   #endif
>      > diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
>      > index d1163f316c..1578887a8f 100644
>      > --- a/target/ppc/mem_helper.c
>      > +++ b/target/ppc/mem_helper.c
>      > @@ -413,50 +413,6 @@ void helper_stq_be_parallel(CPUPPCState *env, target_ulong addr,
>      >       val = int128_make128(lo, hi);
>      >       cpu_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
>      >   }
>      > -
>      > -uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr,
>      > -                                  uint64_t new_lo, uint64_t new_hi,
>      > -                                  uint32_t opidx)
>      > -{
>      > -    bool success = false;
>      > -
>      > -    /* We will have raised EXCP_ATOMIC from the translator.  */
>      > -    assert(HAVE_CMPXCHG128);
>      > -
>      > -    if (likely(addr == env->reserve_addr)) {
>      > -        Int128 oldv, cmpv, newv;
>      > -
>      > -        cmpv = int128_make128(env->reserve_val2, env->reserve_val);
>      > -        newv = int128_make128(new_lo, new_hi);
>      > -        oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv,
>      > -                                          opidx, GETPC());
>      > -        success = int128_eq(oldv, cmpv);
>      > -    }
>      > -    env->reserve_addr = -1;
>      > -    return env->so + success * CRF_EQ_BIT;
>      > -}
>      > -
>      > -uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
>      > -                                  uint64_t new_lo, uint64_t new_hi,
>      > -                                  uint32_t opidx)
>      > -{
>      > -    bool success = false;
>      > -
>      > -    /* We will have raised EXCP_ATOMIC from the translator.  */
>      > -    assert(HAVE_CMPXCHG128);
>      > -
>      > -    if (likely(addr == env->reserve_addr)) {
>      > -        Int128 oldv, cmpv, newv;
>      > -
>      > -        cmpv = int128_make128(env->reserve_val2, env->reserve_val);
>      > -        newv = int128_make128(new_lo, new_hi);
>      > -        oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv,
>      > -                                          opidx, GETPC());
>      > -        success = int128_eq(oldv, cmpv);
>      > -    }
>      > -    env->reserve_addr = -1;
>      > -    return env->so + success * CRF_EQ_BIT;
>      > -}
>      >   #endif
>      >
>      >   /*****************************************************************************/
>      > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>      > index 19c1d17cb0..85f95a9045 100644
>      > --- a/target/ppc/translate.c
>      > +++ b/target/ppc/translate.c
>      > @@ -72,6 +72,7 @@ static TCGv cpu_cfar;
>      >   static TCGv cpu_xer, cpu_so, cpu_ov, cpu_ca, cpu_ov32, cpu_ca32;
>      >   static TCGv cpu_reserve;
>      >   static TCGv cpu_reserve_val;
>      > +static TCGv cpu_reserve_val2;
>      >   static TCGv cpu_fpscr;
>      >   static TCGv_i32 cpu_access_type;
>      >
>      > @@ -141,8 +142,11 @@ void ppc_translate_init(void)
>      >                                        offsetof(CPUPPCState, reserve_addr),
>      >                                        "reserve_addr");
>      >       cpu_reserve_val = tcg_global_mem_new(cpu_env,
>      > -                                     offsetof(CPUPPCState, reserve_val),
>      > -                                     "reserve_val");
>      > +                                         offsetof(CPUPPCState, reserve_val),
>      > +                                         "reserve_val");
>      > +    cpu_reserve_val2 = tcg_global_mem_new(cpu_env,
>      > +                                          offsetof(CPUPPCState, reserve_val2),
>      > +                                          "reserve_val2");
>      >
>      >       cpu_fpscr = tcg_global_mem_new(cpu_env,
>      >                                      offsetof(CPUPPCState, fpscr), "fpscr");
>      > @@ -3979,78 +3983,66 @@ static void gen_lqarx(DisasContext *ctx)
>      >   /* stqcx. */
>      >   static void gen_stqcx_(DisasContext *ctx)
>      >   {
>      > +    TCGLabel *lab_fail, *lab_over;
>      >       int rs = rS(ctx->opcode);
>      > -    TCGv EA, hi, lo;
>      > +    TCGv EA, t0, t1;
>      > +    TCGv_i128 cmp, val;
>      >
>      >       if (unlikely(rs & 1)) {
>      >           gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>      >           return;
>      >       }
>      >
>      > +    lab_fail = gen_new_label();
>      > +    lab_over = gen_new_label();
>      > +
>      >       gen_set_access_type(ctx, ACCESS_RES);
>      >       EA = tcg_temp_new();
>      >       gen_addr_reg_index(ctx, EA);
>      >
>      > +    tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
>      > +    tcg_temp_free(EA);
>      > +
>      > +    cmp = tcg_temp_new_i128();
>      > +    val = tcg_temp_new_i128();
>      > +
>      > +    tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2, cpu_reserve_val);
>      > +
>      >       /* Note that the low part is always in RS+1, even in LE mode.  */
>      > -    lo = cpu_gpr[rs + 1];
>      > -    hi = cpu_gpr[rs];
>      > +    tcg_gen_concat_i64_i128(val, cpu_gpr[rs + 1], cpu_gpr[rs]);
>      >
>      > -    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
>      > -        if (HAVE_CMPXCHG128) {
>      > -            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
>      > -            if (ctx->le_mode) {
>      > -                gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
>      > -                                             EA, lo, hi, oi);
>      > -            } else {
>      > -                gen_helper_stqcx_be_parallel(cpu_crf[0], cpu_env,
>      > -                                             EA, lo, hi, oi);
>      > -            }
>      > -            tcg_temp_free_i32(oi);
>      > -        } else {
>      > -            /* Restart with exclusive lock.  */
>      > -            gen_helper_exit_atomic(cpu_env);
>      > -            ctx->base.is_jmp = DISAS_NORETURN;
>      > -        }
>      > -        tcg_temp_free(EA);
>      > -    } else {
>      > -        TCGLabel *lab_fail = gen_new_label();
>      > -        TCGLabel *lab_over = gen_new_label();
>      > -        TCGv_i64 t0 = tcg_temp_new_i64();
>      > -        TCGv_i64 t1 = tcg_temp_new_i64();
>      > +    tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val, ctx->mem_idx,
>      > +                                DEF_MEMOP(MO_128 | MO_ALIGN));
>      > +    tcg_temp_free_i128(cmp);
>      >
>      > -        tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
>      > -        tcg_temp_free(EA);
>      > +    t0 = tcg_temp_new();
>      > +    t1 = tcg_temp_new();
>      > +    tcg_gen_extr_i128_i64(t1, t0, val);
>      > +    tcg_temp_free_i128(val);
>      >
>      > -        gen_qemu_ld64_i64(ctx, t0, cpu_reserve);
>      > -        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
>      > -                                     ? offsetof(CPUPPCState, reserve_val2)
>      > -                                     : offsetof(CPUPPCState, reserve_val)));
>      > -        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
>      > +    tcg_gen_xor_tl(t1, t1, cpu_reserve_val2);
>      > +    tcg_gen_xor_tl(t0, t0, cpu_reserve_val);
>      > +    tcg_gen_or_tl(t0, t0, t1);
>      > +    tcg_temp_free(t1);
>      >
>      > -        tcg_gen_addi_i64(t0, cpu_reserve, 8);
>      > -        gen_qemu_ld64_i64(ctx, t0, t0);
>      > -        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
>      > -                                     ? offsetof(CPUPPCState, reserve_val)
>      > -                                     : offsetof(CPUPPCState, reserve_val2)));
>      > -        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
>      > +    tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, 0);
>      > +    tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);
>      > +    tcg_gen_or_tl(t0, t0, cpu_so);
>      > +    tcg_gen_trunc_tl_i32(cpu_crf[0], t0);
>      > +    tcg_temp_free(t0);
>      >
>      > -        /* Success */
>      > -        gen_qemu_st64_i64(ctx, ctx->le_mode ? lo : hi, cpu_reserve);
>      > -        tcg_gen_addi_i64(t0, cpu_reserve, 8);
>      > -        gen_qemu_st64_i64(ctx, ctx->le_mode ? hi : lo, t0);
>      > +    tcg_gen_br(lab_over);
>      > +    gen_set_label(lab_fail);
>      >
>      > -        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
>      > -        tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], CRF_EQ);
>      > -        tcg_gen_br(lab_over);
>      > +    /*
>      > +     * Address mismatch implies failure.  But we still need to provide
>      > +     * the memory barrier semantics of the instruction.
>      > +     */
>      > +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      > +    tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
>      >
>      > -        gen_set_label(lab_fail);
>      > -        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
>      > -
>      > -        gen_set_label(lab_over);
>      > -        tcg_gen_movi_tl(cpu_reserve, -1);
>      > -        tcg_temp_free_i64(t0);
>      > -        tcg_temp_free_i64(t1);
>      > -    }
>      > +    gen_set_label(lab_over);
>      > +    tcg_gen_movi_tl(cpu_reserve, -1);
>      >   }
>      >   #endif /* defined(TARGET_PPC64) */
>      >
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1662D13A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 03:50:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovUxZ-00046E-W4; Wed, 16 Nov 2022 21:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovUxY-000452-51
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 21:49:00 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovUxU-0005oy-MA
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 21:48:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id v17so630525edc.8
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 18:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R8rXY2cp768Zi/jCmN4+ktYFzKZlIJUHx/VE7+sgUSA=;
 b=PUPPWNgGnFJ0WTW7glCFBSEOUx6C6clwoHSXy9Z6TDsSyKoODBd24VAZdusYRTaWPI
 Ur2wnVhcIoiRyhMJEAuREBUHF+V5t3P0EtQcC50NXlKz//cj8jQbGss4D3FzerM1vZR9
 ocDsv8nEX0Z3ZTUgbzANOjnhf5pzV3WqCck2FcWAW9zlf2Hyuy/W8FyN4NYAGCP4guYv
 9iWXF+VhH8F3ODn7cSNd+wDPUednqEcw8B5r1ZhBBt/DLdCbsX7jpKnoRh5ftRPnvCz+
 8ER4IQWASWvFcFwcJT0mgM2p3Gk/2zCWM6Z8CBkV9y02dQt+RHdXEugZNUASnv/C+Xj4
 hopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8rXY2cp768Zi/jCmN4+ktYFzKZlIJUHx/VE7+sgUSA=;
 b=A+JquvJ0O1EldMP7pfyazMCIS0yD/QQnyNxlF4JQJb/N7h+/2yhtkLXri/i373m73r
 oLWGuZxCPbAx58JirQ4hrkPJJaMgOP16e65qAvCbLp1LFz4FVYIV0JTrwxihvS14aD5N
 /YN5zDkV5tkbx3cDcIhcgCBNiiiQOHYMRKXm3XmPZ/c2pj1WN44fzVYPUlt4+/nIxaxw
 jjV1QhVbF2lVSBW8sCrM8Dcuxlfgz0beBODURUhReItAtyfPIU12yLW1al9RsGoWj5Zh
 e6/BkKU1DcwXfXS1fOqsp06g+95My/bQzoiMIiLpqaGRnHPKNL5dGh5EeeeXWqDogY9S
 pGRg==
X-Gm-Message-State: ANoB5pkvTy5QNYpicbUHlmHjSg4ywMKvpvXcUPQdDA7QQxUApVl9F7YR
 HW2S8YR1agDMQ8qs68Sy/arzlkOMganHwIMnuP/FAA==
X-Google-Smtp-Source: AA0mqf6FAxWaeqMl2hoFwFsScQwHf1KirOxMfp49PN7NcS6MF5i99v0rrD/dZbhRrWJyE9EFWgYbGDd8cLHUPK4/Grs=
X-Received: by 2002:aa7:d446:0:b0:462:fb18:3b45 with SMTP id
 q6-20020aa7d446000000b00462fb183b45mr447975edr.243.1668653334594; Wed, 16 Nov
 2022 18:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20221112061122.2720163-1-richard.henderson@linaro.org>
 <20221112061122.2720163-2-richard.henderson@linaro.org>
 <e8423c84-0e72-f4d2-97b1-55280bd137e5@gmail.com>
In-Reply-To: <e8423c84-0e72-f4d2-97b1-55280bd137e5@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Wed, 16 Nov 2022 18:48:44 -0800
Message-ID: <CAFXwXrkHgRQ7ADXiRx4rTW3NGYBk0GWLLagN7+RZZYF_yoLZFg@mail.gmail.com>
Subject: Re: [PATCH for-8.0 1/1] target/ppc: Use tcg_gen_atomic_cmpxchg_i128
 for STQCX
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, 
 "open list:PowerPC" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004315ea05eda1a1e9"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000004315ea05eda1a1e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you missed the Based-on tag.

r~

On Wed, 16 Nov 2022, 05:38 Daniel Henrique Barboza, <danielhb413@gmail.com>
wrote:

> Richard,
>
> I believe the ppc64-linux-user target didn't like what you did in this
> patch. Here's the error:
>
> $ ../configure
> --target-list=3Dppc64-softmmu,ppc64-linux-user,ppc-softmmu,ppc-linux-user=
,ppc64le-linux-user
> $ make -j
>
> (...)
>
> [15/133] Compiling C object
> libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o
> FAILED: libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o
> cc -m64 -mcx16 -Ilibqemu-ppc64-linux-user.fa.p -I. -I.. -Itarget/ppc
> -I../target/ppc -I../common-user/host/x86_64
> -I../linux-user/include/host/x86_64 -I../linux-user/include -Ilinux-user
> -I../linux-user -Ilinux-user/ppc -I../linux-user/ppc -Iqapi -Itrace -Iui
> -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
> -I/usr/include/sysprof-4 -fdiagnostics-color=3Dauto -Wall -Winvalid-pch
> -Werror -std=3Dgnu11 -O2 -g -isystem
> /home/danielhb/kvm-project/qemu/linux-headers -isystem linux-headers
> -iquote . -iquote /home/danielhb/kvm-project/qemu -iquote
> /home/danielhb/kvm-project/qemu/include -iquote
> /home/danielhb/kvm-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> '-DCONFIG_TARGET=3D"ppc64-linux-user-config-target.h"'
> '-DCONFIG_DEVICES=3D"ppc64-linux-user-config-devices.h"' -MD -MQ
> libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o -MF
> libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o.d -o
> libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o -c
> ../target/ppc/translate.c
> ../target/ppc/translate.c: In function =E2=80=98gen_stqcx_=E2=80=99:
> ../target/ppc/translate.c:3989:5: error: unknown type name =E2=80=98TCGv_=
i128=E2=80=99;
> did you mean =E2=80=98TCGv_i32=E2=80=99?
>   3989 |     TCGv_i128 cmp, val;
>        |     ^~~~~~~~~
>        |     TCGv_i32
> ../target/ppc/translate.c:4006:11: error: implicit declaration of functio=
n
> =E2=80=98tcg_temp_new_i128=E2=80=99; did you mean =E2=80=98tcg_temp_new_i=
32=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>   4006 |     cmp =3D tcg_temp_new_i128();
>        |           ^~~~~~~~~~~~~~~~~
>        |           tcg_temp_new_i32
> ../target/ppc/translate.c:4006:11: error: nested extern declaration of
> =E2=80=98tcg_temp_new_i128=E2=80=99 [-Werror=3Dnested-externs]
> ../target/ppc/translate.c:4009:5: error: implicit declaration of function
> =E2=80=98tcg_gen_concat_i64_i128=E2=80=99; did you mean =E2=80=98tcg_gen_=
concat_i32_i64=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>   4009 |     tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2,
> cpu_reserve_val);
>        |     ^~~~~~~~~~~~~~~~~~~~~~~
>        |     tcg_gen_concat_i32_i64
> ../target/ppc/translate.c:4009:5: error: nested extern declaration of
> =E2=80=98tcg_gen_concat_i64_i128=E2=80=99 [-Werror=3Dnested-externs]
> ../target/ppc/translate.c:4014:5: error: implicit declaration of function
> =E2=80=98tcg_gen_atomic_cmpxchg_i128=E2=80=99; did you mean =E2=80=98tcg_=
gen_atomic_cmpxchg_i32=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>   4014 |     tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val,
> ctx->mem_idx,
>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |     tcg_gen_atomic_cmpxchg_i32
> ../target/ppc/translate.c:4014:5: error: nested extern declaration of
> =E2=80=98tcg_gen_atomic_cmpxchg_i128=E2=80=99 [-Werror=3Dnested-externs]
> ../target/ppc/translate.c:4016:5: error: implicit declaration of function
> =E2=80=98tcg_temp_free_i128=E2=80=99; did you mean =E2=80=98tcg_temp_free=
_i32=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>   4016 |     tcg_temp_free_i128(cmp);
>        |     ^~~~~~~~~~~~~~~~~~
>        |     tcg_temp_free_i32
> ../target/ppc/translate.c:4016:5: error: nested extern declaration of
> =E2=80=98tcg_temp_free_i128=E2=80=99 [-Werror=3Dnested-externs]
> ../target/ppc/translate.c:4020:5: error: implicit declaration of function
> =E2=80=98tcg_gen_extr_i128_i64=E2=80=99; did you mean =E2=80=98tcg_gen_ex=
t_i32_i64=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>   4020 |     tcg_gen_extr_i128_i64(t1, t0, val);
>        |     ^~~~~~~~~~~~~~~~~~~~~
>        |     tcg_gen_ext_i32_i64
> ../target/ppc/translate.c:4020:5: error: nested extern declaration of
> =E2=80=98tcg_gen_extr_i128_i64=E2=80=99 [-Werror=3Dnested-externs]
> cc1: all warnings being treated as errors
> [16/133] Compiling C object
> libqemu-ppc64-softmmu.fa.p/target_ppc_mmu_helper.c.o
> [17/133] Compiling C object
> libqemu-ppc64-softmmu.fa.p/target_ppc_translate.c.o
> FAILED: libqemu-ppc64-softmmu.fa.p/target_ppc_translate.c.o
>
>
> Thanks,
>
>
> Daniel
>
>
> On 11/12/22 03:11, Richard Henderson wrote:
> > Note that the previous direct reference to reserve_val,
> >
> > -   tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
> > -                                ? offsetof(CPUPPCState, reserve_val2)
> > -                                : offsetof(CPUPPCState, reserve_val)))=
;
> >
> > was incorrect because all references should have gone through
> > cpu_reserve_val.  Create a cpu_reserve_val2 tcg temp to fix this.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/ppc/helper.h     |   2 -
> >   target/ppc/mem_helper.c |  44 -----------------
> >   target/ppc/translate.c  | 102 ++++++++++++++++++---------------------=
-
> >   3 files changed, 47 insertions(+), 101 deletions(-)
> >
> > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > index 8dd22a35e4..0beaca5c7a 100644
> > --- a/target/ppc/helper.h
> > +++ b/target/ppc/helper.h
> > @@ -818,6 +818,4 @@ DEF_HELPER_FLAGS_5(stq_le_parallel, TCG_CALL_NO_WG,
> >                      void, env, tl, i64, i64, i32)
> >   DEF_HELPER_FLAGS_5(stq_be_parallel, TCG_CALL_NO_WG,
> >                      void, env, tl, i64, i64, i32)
> > -DEF_HELPER_5(stqcx_le_parallel, i32, env, tl, i64, i64, i32)
> > -DEF_HELPER_5(stqcx_be_parallel, i32, env, tl, i64, i64, i32)
> >   #endif
> > diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> > index d1163f316c..1578887a8f 100644
> > --- a/target/ppc/mem_helper.c
> > +++ b/target/ppc/mem_helper.c
> > @@ -413,50 +413,6 @@ void helper_stq_be_parallel(CPUPPCState *env,
> target_ulong addr,
> >       val =3D int128_make128(lo, hi);
> >       cpu_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
> >   }
> > -
> > -uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr,
> > -                                  uint64_t new_lo, uint64_t new_hi,
> > -                                  uint32_t opidx)
> > -{
> > -    bool success =3D false;
> > -
> > -    /* We will have raised EXCP_ATOMIC from the translator.  */
> > -    assert(HAVE_CMPXCHG128);
> > -
> > -    if (likely(addr =3D=3D env->reserve_addr)) {
> > -        Int128 oldv, cmpv, newv;
> > -
> > -        cmpv =3D int128_make128(env->reserve_val2, env->reserve_val);
> > -        newv =3D int128_make128(new_lo, new_hi);
> > -        oldv =3D cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv,
> > -                                          opidx, GETPC());
> > -        success =3D int128_eq(oldv, cmpv);
> > -    }
> > -    env->reserve_addr =3D -1;
> > -    return env->so + success * CRF_EQ_BIT;
> > -}
> > -
> > -uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
> > -                                  uint64_t new_lo, uint64_t new_hi,
> > -                                  uint32_t opidx)
> > -{
> > -    bool success =3D false;
> > -
> > -    /* We will have raised EXCP_ATOMIC from the translator.  */
> > -    assert(HAVE_CMPXCHG128);
> > -
> > -    if (likely(addr =3D=3D env->reserve_addr)) {
> > -        Int128 oldv, cmpv, newv;
> > -
> > -        cmpv =3D int128_make128(env->reserve_val2, env->reserve_val);
> > -        newv =3D int128_make128(new_lo, new_hi);
> > -        oldv =3D cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv,
> > -                                          opidx, GETPC());
> > -        success =3D int128_eq(oldv, cmpv);
> > -    }
> > -    env->reserve_addr =3D -1;
> > -    return env->so + success * CRF_EQ_BIT;
> > -}
> >   #endif
> >
> >
>  /***********************************************************************=
******/
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index 19c1d17cb0..85f95a9045 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -72,6 +72,7 @@ static TCGv cpu_cfar;
> >   static TCGv cpu_xer, cpu_so, cpu_ov, cpu_ca, cpu_ov32, cpu_ca32;
> >   static TCGv cpu_reserve;
> >   static TCGv cpu_reserve_val;
> > +static TCGv cpu_reserve_val2;
> >   static TCGv cpu_fpscr;
> >   static TCGv_i32 cpu_access_type;
> >
> > @@ -141,8 +142,11 @@ void ppc_translate_init(void)
> >                                        offsetof(CPUPPCState,
> reserve_addr),
> >                                        "reserve_addr");
> >       cpu_reserve_val =3D tcg_global_mem_new(cpu_env,
> > -                                     offsetof(CPUPPCState, reserve_val=
),
> > -                                     "reserve_val");
> > +                                         offsetof(CPUPPCState,
> reserve_val),
> > +                                         "reserve_val");
> > +    cpu_reserve_val2 =3D tcg_global_mem_new(cpu_env,
> > +                                          offsetof(CPUPPCState,
> reserve_val2),
> > +                                          "reserve_val2");
> >
> >       cpu_fpscr =3D tcg_global_mem_new(cpu_env,
> >                                      offsetof(CPUPPCState, fpscr),
> "fpscr");
> > @@ -3979,78 +3983,66 @@ static void gen_lqarx(DisasContext *ctx)
> >   /* stqcx. */
> >   static void gen_stqcx_(DisasContext *ctx)
> >   {
> > +    TCGLabel *lab_fail, *lab_over;
> >       int rs =3D rS(ctx->opcode);
> > -    TCGv EA, hi, lo;
> > +    TCGv EA, t0, t1;
> > +    TCGv_i128 cmp, val;
> >
> >       if (unlikely(rs & 1)) {
> >           gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
> >           return;
> >       }
> >
> > +    lab_fail =3D gen_new_label();
> > +    lab_over =3D gen_new_label();
> > +
> >       gen_set_access_type(ctx, ACCESS_RES);
> >       EA =3D tcg_temp_new();
> >       gen_addr_reg_index(ctx, EA);
> >
> > +    tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
> > +    tcg_temp_free(EA);
> > +
> > +    cmp =3D tcg_temp_new_i128();
> > +    val =3D tcg_temp_new_i128();
> > +
> > +    tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2, cpu_reserve_val);
> > +
> >       /* Note that the low part is always in RS+1, even in LE mode.  */
> > -    lo =3D cpu_gpr[rs + 1];
> > -    hi =3D cpu_gpr[rs];
> > +    tcg_gen_concat_i64_i128(val, cpu_gpr[rs + 1], cpu_gpr[rs]);
> >
> > -    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
> > -        if (HAVE_CMPXCHG128) {
> > -            TCGv_i32 oi =3D tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN=
);
> > -            if (ctx->le_mode) {
> > -                gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
> > -                                             EA, lo, hi, oi);
> > -            } else {
> > -                gen_helper_stqcx_be_parallel(cpu_crf[0], cpu_env,
> > -                                             EA, lo, hi, oi);
> > -            }
> > -            tcg_temp_free_i32(oi);
> > -        } else {
> > -            /* Restart with exclusive lock.  */
> > -            gen_helper_exit_atomic(cpu_env);
> > -            ctx->base.is_jmp =3D DISAS_NORETURN;
> > -        }
> > -        tcg_temp_free(EA);
> > -    } else {
> > -        TCGLabel *lab_fail =3D gen_new_label();
> > -        TCGLabel *lab_over =3D gen_new_label();
> > -        TCGv_i64 t0 =3D tcg_temp_new_i64();
> > -        TCGv_i64 t1 =3D tcg_temp_new_i64();
> > +    tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val,
> ctx->mem_idx,
> > +                                DEF_MEMOP(MO_128 | MO_ALIGN));
> > +    tcg_temp_free_i128(cmp);
> >
> > -        tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
> > -        tcg_temp_free(EA);
> > +    t0 =3D tcg_temp_new();
> > +    t1 =3D tcg_temp_new();
> > +    tcg_gen_extr_i128_i64(t1, t0, val);
> > +    tcg_temp_free_i128(val);
> >
> > -        gen_qemu_ld64_i64(ctx, t0, cpu_reserve);
> > -        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
> > -                                     ? offsetof(CPUPPCState,
> reserve_val2)
> > -                                     : offsetof(CPUPPCState,
> reserve_val)));
> > -        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
> > +    tcg_gen_xor_tl(t1, t1, cpu_reserve_val2);
> > +    tcg_gen_xor_tl(t0, t0, cpu_reserve_val);
> > +    tcg_gen_or_tl(t0, t0, t1);
> > +    tcg_temp_free(t1);
> >
> > -        tcg_gen_addi_i64(t0, cpu_reserve, 8);
> > -        gen_qemu_ld64_i64(ctx, t0, t0);
> > -        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
> > -                                     ? offsetof(CPUPPCState,
> reserve_val)
> > -                                     : offsetof(CPUPPCState,
> reserve_val2)));
> > -        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
> > +    tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, 0);
> > +    tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);
> > +    tcg_gen_or_tl(t0, t0, cpu_so);
> > +    tcg_gen_trunc_tl_i32(cpu_crf[0], t0);
> > +    tcg_temp_free(t0);
> >
> > -        /* Success */
> > -        gen_qemu_st64_i64(ctx, ctx->le_mode ? lo : hi, cpu_reserve);
> > -        tcg_gen_addi_i64(t0, cpu_reserve, 8);
> > -        gen_qemu_st64_i64(ctx, ctx->le_mode ? hi : lo, t0);
> > +    tcg_gen_br(lab_over);
> > +    gen_set_label(lab_fail);
> >
> > -        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> > -        tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], CRF_EQ);
> > -        tcg_gen_br(lab_over);
> > +    /*
> > +     * Address mismatch implies failure.  But we still need to provide
> > +     * the memory barrier semantics of the instruction.
> > +     */
> > +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> > +    tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> >
> > -        gen_set_label(lab_fail);
> > -        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> > -
> > -        gen_set_label(lab_over);
> > -        tcg_gen_movi_tl(cpu_reserve, -1);
> > -        tcg_temp_free_i64(t0);
> > -        tcg_temp_free_i64(t1);
> > -    }
> > +    gen_set_label(lab_over);
> > +    tcg_gen_movi_tl(cpu_reserve, -1);
> >   }
> >   #endif /* defined(TARGET_PPC64) */
> >
>

--0000000000004315ea05eda1a1e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think you missed the Based-on tag.<br><br><div data-sma=
rtmail=3D"gmail_signature">r~</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Nov 2022, 05:38 Daniel Henriq=
ue Barboza, &lt;<a href=3D"mailto:danielhb413@gmail.com">danielhb413@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Richard,<br>
<br>
I believe the ppc64-linux-user target didn&#39;t like what you did in this<=
br>
patch. Here&#39;s the error:<br>
<br>
$ ../configure --target-list=3Dppc64-softmmu,ppc64-linux-user,ppc-softmmu,p=
pc-linux-user,ppc64le-linux-user<br>
$ make -j<br>
<br>
(...)<br>
<br>
[15/133] Compiling C object libqemu-ppc64-linux-user.fa.p/target_ppc_transl=
ate.c.o<br>
FAILED: libqemu-ppc64-linux-user.fa.p/target_ppc_translate.c.o<br>
cc -m64 -mcx16 -Ilibqemu-ppc64-linux-user.fa.p -I. -I.. -Itarget/ppc -I../t=
arget/ppc -I../common-user/host/x86_64 -I../linux-user/include/host/x86_64 =
-I../linux-user/include -Ilinux-user -I../linux-user -Ilinux-user/ppc -I../=
linux-user/ppc -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/u=
sr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=3Dau=
to -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /home/danielhb/=
kvm-project/qemu/linux-headers -isystem linux-headers -iquote . -iquote /ho=
me/danielhb/kvm-project/qemu -iquote /home/danielhb/kvm-project/qemu/includ=
e -iquote /home/danielhb/kvm-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOUR=
CE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFIL=
E_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmi=
ssing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-decla=
ration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k =
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labe=
ls -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-d=
irs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -is=
ystem../linux-headers -isystemlinux-headers -DNEED_CPU_H &#39;-DCONFIG_TARG=
ET=3D&quot;ppc64-linux-user-config-target.h&quot;&#39; &#39;-DCONFIG_DEVICE=
S=3D&quot;ppc64-linux-user-config-devices.h&quot;&#39; -MD -MQ libqemu-ppc6=
4-linux-user.fa.p/target_ppc_translate.c.o -MF libqemu-ppc64-linux-user.fa.=
p/target_ppc_translate.c.o.d -o libqemu-ppc64-linux-user.fa.p/target_ppc_tr=
anslate.c.o -c ../target/ppc/translate.c<br>
../target/ppc/translate.c: In function =E2=80=98gen_stqcx_=E2=80=99:<br>
../target/ppc/translate.c:3989:5: error: unknown type name =E2=80=98TCGv_i1=
28=E2=80=99; did you mean =E2=80=98TCGv_i32=E2=80=99?<br>
=C2=A0 3989 |=C2=A0 =C2=A0 =C2=A0TCGv_i128 cmp, val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0TCGv_i32<br>
../target/ppc/translate.c:4006:11: error: implicit declaration of function =
=E2=80=98tcg_temp_new_i128=E2=80=99; did you mean =E2=80=98tcg_temp_new_i32=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 4006 |=C2=A0 =C2=A0 =C2=A0cmp =3D tcg_temp_new_i128();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~=
~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_te=
mp_new_i32<br>
../target/ppc/translate.c:4006:11: error: nested extern declaration of =E2=
=80=98tcg_temp_new_i128=E2=80=99 [-Werror=3Dnested-externs]<br>
../target/ppc/translate.c:4009:5: error: implicit declaration of function =
=E2=80=98tcg_gen_concat_i64_i128=E2=80=99; did you mean =E2=80=98tcg_gen_co=
ncat_i32_i64=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 4009 |=C2=A0 =C2=A0 =C2=A0tcg_gen_concat_i64_i128(cmp, cpu_reserve_v=
al2, cpu_reserve_val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0tcg_gen_concat_i32_i64<br>
../target/ppc/translate.c:4009:5: error: nested extern declaration of =E2=
=80=98tcg_gen_concat_i64_i128=E2=80=99 [-Werror=3Dnested-externs]<br>
../target/ppc/translate.c:4014:5: error: implicit declaration of function =
=E2=80=98tcg_gen_atomic_cmpxchg_i128=E2=80=99; did you mean =E2=80=98tcg_ge=
n_atomic_cmpxchg_i32=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br=
>
=C2=A0 4014 |=C2=A0 =C2=A0 =C2=A0tcg_gen_atomic_cmpxchg_i128(val, cpu_reser=
ve, cmp, val, ctx-&gt;mem_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0tcg_gen_atomic_cmpxchg_i32<=
br>
../target/ppc/translate.c:4014:5: error: nested extern declaration of =E2=
=80=98tcg_gen_atomic_cmpxchg_i128=E2=80=99 [-Werror=3Dnested-externs]<br>
../target/ppc/translate.c:4016:5: error: implicit declaration of function =
=E2=80=98tcg_temp_free_i128=E2=80=99; did you mean =E2=80=98tcg_temp_free_i=
32=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 4016 |=C2=A0 =C2=A0 =C2=A0tcg_temp_free_i128(cmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0tcg_temp_free_i32<br>
../target/ppc/translate.c:4016:5: error: nested extern declaration of =E2=
=80=98tcg_temp_free_i128=E2=80=99 [-Werror=3Dnested-externs]<br>
../target/ppc/translate.c:4020:5: error: implicit declaration of function =
=E2=80=98tcg_gen_extr_i128_i64=E2=80=99; did you mean =E2=80=98tcg_gen_ext_=
i32_i64=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 4020 |=C2=A0 =C2=A0 =C2=A0tcg_gen_extr_i128_i64(t1, t0, val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0tcg_gen_ext_i32_i64<br>
../target/ppc/translate.c:4020:5: error: nested extern declaration of =E2=
=80=98tcg_gen_extr_i128_i64=E2=80=99 [-Werror=3Dnested-externs]<br>
cc1: all warnings being treated as errors<br>
[16/133] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_mmu_helpe=
r.c.o<br>
[17/133] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_translate=
.c.o<br>
FAILED: libqemu-ppc64-softmmu.fa.p/target_ppc_translate.c.o<br>
<br>
<br>
Thanks,<br>
<br>
<br>
Daniel<br>
<br>
<br>
On 11/12/22 03:11, Richard Henderson wrote:<br>
&gt; Note that the previous direct reference to reserve_val,<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0tcg_gen_ld_i64(t1, cpu_env, (ctx-&gt;le_mode<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? offsetof(CPUPPCState, reserve_=
val2)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : offsetof(CPUPPCState, reserve_=
val)));<br>
&gt; <br>
&gt; was incorrect because all references should have gone through<br>
&gt; cpu_reserve_val.=C2=A0 Create a cpu_reserve_val2 tcg temp to fix this.=
<br>
&gt; <br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linar=
o.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/ppc/helper.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<b=
r>
&gt;=C2=A0 =C2=A0target/ppc/mem_helper.c |=C2=A0 44 -----------------<br>
&gt;=C2=A0 =C2=A0target/ppc/translate.c=C2=A0 | 102 ++++++++++++++++++-----=
-----------------<br>
&gt;=C2=A0 =C2=A03 files changed, 47 insertions(+), 101 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/ppc/helper.h b/target/ppc/helper.h<br>
&gt; index 8dd22a35e4..0beaca5c7a 100644<br>
&gt; --- a/target/ppc/helper.h<br>
&gt; +++ b/target/ppc/helper.h<br>
&gt; @@ -818,6 +818,4 @@ DEF_HELPER_FLAGS_5(stq_le_parallel, TCG_CALL_NO_WG=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void, env, tl, i64, i64, i32)<br>
&gt;=C2=A0 =C2=A0DEF_HELPER_FLAGS_5(stq_be_parallel, TCG_CALL_NO_WG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void, env, tl, i64, i64, i32)<br>
&gt; -DEF_HELPER_5(stqcx_le_parallel, i32, env, tl, i64, i64, i32)<br>
&gt; -DEF_HELPER_5(stqcx_be_parallel, i32, env, tl, i64, i64, i32)<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c<br>
&gt; index d1163f316c..1578887a8f 100644<br>
&gt; --- a/target/ppc/mem_helper.c<br>
&gt; +++ b/target/ppc/mem_helper.c<br>
&gt; @@ -413,50 +413,6 @@ void helper_stq_be_parallel(CPUPPCState *env, tar=
get_ulong addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D int128_make128(lo, hi);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_atomic_sto_be_mmu(env, addr, val, opidx,=
 GETPC());<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_lo, uint64_t=
 new_hi,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t opidx)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 bool success =3D false;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* We will have raised EXCP_ATOMIC from the translator.=
=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 assert(HAVE_CMPXCHG128);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (likely(addr =3D=3D env-&gt;reserve_addr)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Int128 oldv, cmpv, newv;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmpv =3D int128_make128(env-&gt;reserve_v=
al2, env-&gt;reserve_val);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 newv =3D int128_make128(new_lo, new_hi);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldv =3D cpu_atomic_cmpxchgo_le_mmu(env, =
addr, cmpv, newv,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 opidx, GETPC());<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 success =3D int128_eq(oldv, cmpv);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;reserve_addr =3D -1;<br>
&gt; -=C2=A0 =C2=A0 return env-&gt;so + success * CRF_EQ_BIT;<br>
&gt; -}<br>
&gt; -<br>
&gt; -uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t new_lo, uint64_t=
 new_hi,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t opidx)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 bool success =3D false;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* We will have raised EXCP_ATOMIC from the translator.=
=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 assert(HAVE_CMPXCHG128);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (likely(addr =3D=3D env-&gt;reserve_addr)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Int128 oldv, cmpv, newv;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmpv =3D int128_make128(env-&gt;reserve_v=
al2, env-&gt;reserve_val);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 newv =3D int128_make128(new_lo, new_hi);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldv =3D cpu_atomic_cmpxchgo_be_mmu(env, =
addr, cmpv, newv,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 opidx, GETPC());<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 success =3D int128_eq(oldv, cmpv);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;reserve_addr =3D -1;<br>
&gt; -=C2=A0 =C2=A0 return env-&gt;so + success * CRF_EQ_BIT;<br>
&gt; -}<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/*********************************************************=
********************/<br>
&gt; diff --git a/target/ppc/translate.c b/target/ppc/translate.c<br>
&gt; index 19c1d17cb0..85f95a9045 100644<br>
&gt; --- a/target/ppc/translate.c<br>
&gt; +++ b/target/ppc/translate.c<br>
&gt; @@ -72,6 +72,7 @@ static TCGv cpu_cfar;<br>
&gt;=C2=A0 =C2=A0static TCGv cpu_xer, cpu_so, cpu_ov, cpu_ca, cpu_ov32, cpu=
_ca32;<br>
&gt;=C2=A0 =C2=A0static TCGv cpu_reserve;<br>
&gt;=C2=A0 =C2=A0static TCGv cpu_reserve_val;<br>
&gt; +static TCGv cpu_reserve_val2;<br>
&gt;=C2=A0 =C2=A0static TCGv cpu_fpscr;<br>
&gt;=C2=A0 =C2=A0static TCGv_i32 cpu_access_type;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -141,8 +142,11 @@ void ppc_translate_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offse=
tof(CPUPPCState, reserve_addr),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;reserve_addr&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reserve_val =3D tcg_global_mem_new(cpu_e=
nv,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offsetof(CPU=
PPCState, reserve_val),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;reserv=
e_val&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0offsetof(CPUPPCState, reserve_val),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;reserve_val&quot;);<br>
&gt; +=C2=A0 =C2=A0 cpu_reserve_val2 =3D tcg_global_mem_new(cpu_env,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 offsetof(CPUPPCState, reserve_val2),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;reserve_val2&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_fpscr =3D tcg_global_mem_new(cpu_env,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offsetof(CPU=
PPCState, fpscr), &quot;fpscr&quot;);<br>
&gt; @@ -3979,78 +3983,66 @@ static void gen_lqarx(DisasContext *ctx)<br>
&gt;=C2=A0 =C2=A0/* stqcx. */<br>
&gt;=C2=A0 =C2=A0static void gen_stqcx_(DisasContext *ctx)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 TCGLabel *lab_fail, *lab_over;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int rs =3D rS(ctx-&gt;opcode);<br>
&gt; -=C2=A0 =C2=A0 TCGv EA, hi, lo;<br>
&gt; +=C2=A0 =C2=A0 TCGv EA, t0, t1;<br>
&gt; +=C2=A0 =C2=A0 TCGv_i128 cmp, val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(rs &amp; 1)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_inval_exception(ctx, POWER=
PC_EXCP_INVAL_INVAL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 lab_fail =3D gen_new_label();<br>
&gt; +=C2=A0 =C2=A0 lab_over =3D gen_new_label();<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_set_access_type(ctx, ACCESS_RES);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EA =3D tcg_temp_new();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_addr_reg_index(ctx, EA);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fai=
l);<br>
&gt; +=C2=A0 =C2=A0 tcg_temp_free(EA);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cmp =3D tcg_temp_new_i128();<br>
&gt; +=C2=A0 =C2=A0 val =3D tcg_temp_new_i128();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2, cpu_rese=
rve_val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Note that the low part is always in RS+1,=
 even in LE mode.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 lo =3D cpu_gpr[rs + 1];<br>
&gt; -=C2=A0 =C2=A0 hi =3D cpu_gpr[rs];<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_concat_i64_i128(val, cpu_gpr[rs + 1], cpu_gpr[r=
s]);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;base.tb) &amp; CF_PARALLEL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HAVE_CMPXCHG128) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i32 oi =3D tcg_const_i=
32(DEF_MEMOP(MO_128) | MO_ALIGN);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;le_mode) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_st=
qcx_le_parallel(cpu_crf[0], cpu_env,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0EA, lo, hi, oi);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_st=
qcx_be_parallel(cpu_crf[0], cpu_env,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0EA, lo, hi, oi);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i32(oi);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Restart with exclusive l=
ock.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_exit_atomic(cpu_=
env);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DIS=
AS_NORETURN;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(EA);<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGLabel *lab_fail =3D gen_new_label();<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGLabel *lab_over =3D gen_new_label();<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t0 =3D tcg_temp_new_i64();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t1 =3D tcg_temp_new_i64();<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val,=
 ctx-&gt;mem_idx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEF_MEMOP(MO_128 | MO_ALIGN));<b=
r>
&gt; +=C2=A0 =C2=A0 tcg_temp_free_i128(cmp);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_re=
serve, lab_fail);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(EA);<br>
&gt; +=C2=A0 =C2=A0 t0 =3D tcg_temp_new();<br>
&gt; +=C2=A0 =C2=A0 t1 =3D tcg_temp_new();<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_extr_i128_i64(t1, t0, val);<br>
&gt; +=C2=A0 =C2=A0 tcg_temp_free_i128(val);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_qemu_ld64_i64(ctx, t0, cpu_reserve);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ld_i64(t1, cpu_env, (ctx-&gt;le_m=
ode<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? offsetof(C=
PUPPCState, reserve_val2)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: offsetof(C=
PUPPCState, reserve_val)));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, l=
ab_fail);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_xor_tl(t1, t1, cpu_reserve_val2);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_xor_tl(t0, t0, cpu_reserve_val);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_or_tl(t0, t0, t1);<br>
&gt; +=C2=A0 =C2=A0 tcg_temp_free(t1);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_addi_i64(t0, cpu_reserve, 8);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_qemu_ld64_i64(ctx, t0, t0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ld_i64(t1, cpu_env, (ctx-&gt;le_m=
ode<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? offsetof(C=
PUPPCState, reserve_val)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: offsetof(C=
PUPPCState, reserve_val2)));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, l=
ab_fail);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, 0);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_or_tl(t0, t0, cpu_so);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_trunc_tl_i32(cpu_crf[0], t0);<br>
&gt; +=C2=A0 =C2=A0 tcg_temp_free(t0);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Success */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_qemu_st64_i64(ctx, ctx-&gt;le_mode ? =
lo : hi, cpu_reserve);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_addi_i64(t0, cpu_reserve, 8);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_qemu_st64_i64(ctx, ctx-&gt;le_mode ? =
hi : lo, t0);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_br(lab_over);<br>
&gt; +=C2=A0 =C2=A0 gen_set_label(lab_fail);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], C=
RF_EQ);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_br(lab_over);<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Address mismatch implies failure.=C2=A0 But we =
still need to provide<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the memory barrier semantics of the instruction=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_label(lab_fail);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);=
<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_label(lab_over);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_reserve, -1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(t0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(t1);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 gen_set_label(lab_over);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_reserve, -1);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#endif /* defined(TARGET_PPC64) */<br>
&gt;=C2=A0 =C2=A0<br>
</blockquote></div>

--0000000000004315ea05eda1a1e9--


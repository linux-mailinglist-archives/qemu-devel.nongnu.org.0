Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02763387024
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 05:08:25 +0200 (CEST)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liq5n-0004Ai-SC
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 23:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1liq4c-0003LY-OI
 for qemu-devel@nongnu.org; Mon, 17 May 2021 23:07:10 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1liq4a-0002do-67
 for qemu-devel@nongnu.org; Mon, 17 May 2021 23:07:10 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id n83so446474ybg.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 20:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OgL4R85APHDJ4g9sIOQYFFNMNVeSkeSqhvgKh2S9Dng=;
 b=ceCFPcW8I3U2KapiVnc4Whq1dtWYoXbdKYTuPoeXtDEX5bUoq9kwQBWvjEzFXqwMB6
 yElaAYnjrzwh7l/1tyLRm36J617Mr6jjUvAVC5vQi8I+DmZcLrF5YX6mH+I1pezv1IMJ
 aa5n0LOy7qqEh0JaBTe5+pFLmyycI+BA/WA2lU7Neh2J3MbNsX+pcJQICjVVEil7cxkG
 +WRDXkruFVtk3tRA++fcJK3/0rlHgOtgoMGITiF6UxJuQMKT8oZJMvRq+DVw6iXo8wNx
 neljeHq4Z4/YwHZ4kXrr2gg3fWGHiOg585HxkpEdmQLiojFL9oVp7hp+jAi/htYz8Tgn
 w+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OgL4R85APHDJ4g9sIOQYFFNMNVeSkeSqhvgKh2S9Dng=;
 b=gVpGc0sc2mg/dEpg0PKDeI7nN7qGHWGwasg2LEGjVS5TtNz9lmPrHM99yXxxdCWFlq
 HRZWbzi1HE9AtFb9y/Kscg10FJTVgZcqjlgl6vNQPCrDKw3gHA9H91iCMM9lb1YBNIWh
 9Wpq/9QSL8crNnCECc43KqRliIt8Xyvbrmd+6yVfJQhTuiCQJmEA71u3xyT2yYW9dCNB
 Dq7937WI7Ao1m1o7RRA60JPW9OX69uuecMJ3qYZ5Hzx0jCtGNvdCdHXroQQ/0BSWN/Ql
 1s/q6dbmKNb0VAD5KcIXRAV5LQfMAwDSxXWnTE5gBJHjUiSAz/BLvoIM2ga535NevXjC
 nY3A==
X-Gm-Message-State: AOAM530b4grtqj8uoqVYoNygrK20FMFCsbXTAUfCH5v4Ap4/HdgYE+Im
 aK4/db8i+ro/xEbrxlE5LtFaEHf+zjpSD+yIdlk=
X-Google-Smtp-Source: ABdhPJzKevGVTOXiPdE8KAWKKvt7lw4Y8Gp9e5vxsDyFPo+vToqgxH4t/1Uq03dq05h/QZnRFKI2jadGNQ5BxbNqCiw=
X-Received: by 2002:a05:6902:512:: with SMTP id
 x18mr4509054ybs.405.1621307226725; 
 Mon, 17 May 2021 20:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210507080055.258563-1-ziqiaokong@gmail.com>
 <20210507080055.258563-2-ziqiaokong@gmail.com>
 <20210517202934.qghui32kfrv6zgns@habkost.net>
In-Reply-To: <20210517202934.qghui32kfrv6zgns@habkost.net>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Tue, 18 May 2021 11:06:56 +0800
Message-ID: <CAM0BWNBHwKst1USrGv6kcnPA9omLFjAW_+bJybYDrDhhynxqQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 4:29 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Hi,
>
> Thanks for the patch, and apologies for not reviewing earlier
> versions.
>

Nevermind, the earlier version is also hard to review without a proper split.

> On Fri, May 07, 2021 at 04:00:58PM +0800, Ziqiao Kong wrote:
> > Changes since v3:
> >  - Split the long patches to series to make review easier.
> >  - Fix the coding style problems in v3.
> >
> > Changes since v2:
> >  - Change the sequence of fpcs, fpds, fpip and fpdp in CPUX86State.
> >  - Use stl instead of stw in do_fstenv.
> >  - Move variables to floats instruction case block.
> >  - Move last accessed memory operand to a temp variable to avoid another load.
> >  - Move segment selectors instead of segment base to fpcs and fpds.
> >  - Fix some code stype problems for the original code in floats case block.
>
> On the next versions, please include the changelog after a "---"
> line, so it won't be included in the final commit.
>
> In addition to the changelog, the actual commit message (the text
> above "---") needs to include an explanation for the change.  If
> you are fixing a bug, please explain what's the bug you are
> fixing.

The bug is tracked in this thread
https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00307.html.

>
>
> >
> > Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> > ---
> >  target/i386/cpu.h            |  4 +++
> >  target/i386/tcg/fpu_helper.c | 48 ++++++++++++++++++++++--------------
> >  target/i386/tcg/translate.c  | 45 ++++++++++++++++++++++++++++++++-
> >  3 files changed, 77 insertions(+), 20 deletions(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 570f916878..241945320b 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -705,6 +705,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
> >  #define CPUID_7_0_EBX_INVPCID           (1U << 10)
> >  /* Restricted Transactional Memory */
> >  #define CPUID_7_0_EBX_RTM               (1U << 11)
> > +/* Deprecates FPU CS and FPU DS values */
> > +#define CPUID_7_0_EBX_FCS_FDS           (1U << 13)
> >  /* Memory Protection Extension */
> >  #define CPUID_7_0_EBX_MPX               (1U << 14)
> >  /* AVX-512 Foundation */
> > @@ -1440,6 +1442,8 @@ typedef struct CPUX86State {
> >      FPReg fpregs[8];
> >      /* KVM-only so far */
> >      uint16_t fpop;
> > +    uint16_t fpcs;
> > +    uint16_t fpds;
> >      uint64_t fpip;
> >      uint64_t fpdp;
> >
> > diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> > index 60ed93520a..f1a8717ed8 100644
> > --- a/target/i386/tcg/fpu_helper.c
> > +++ b/target/i386/tcg/fpu_helper.c
> > @@ -766,6 +766,10 @@ void helper_fninit(CPUX86State *env)
> >  {
> >      env->fpus = 0;
> >      env->fpstt = 0;
> > +    env->fpcs = 0;
> > +    env->fpip = 0;
> > +    env->fpds = 0;
> > +    env->fpdp = 0;
> >      cpu_set_fpuc(env, 0x37f);
> >      env->fptags[0] = 1;
> >      env->fptags[1] = 1;
> > @@ -2368,6 +2372,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
> >  {
> >      int fpus, fptag, exp, i;
> >      uint64_t mant;
> > +    uint16_t fpcs, fpds;
> >      CPU_LDoubleU tmp;
> >
> >      fpus = (env->fpus & ~0x3800) | (env->fpstt & 0x7) << 11;
> > @@ -2390,24 +2395,39 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
> >              }
> >          }
> >      }
> > +
> > +    /*
> > +     * If CR0.PE = 1, each instruction saves FCS and FDS into memory. If
> > +     * CPUID.(EAX=07H,ECX=0H):EBX[bit 13] = 1, the processor deprecates
> > +     * FCS and FDS; it saves each as 0000H.
> > +     */
> > +    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FCS_FDS)
> > +        && (env->cr[0] & CR0_PE_MASK)) {
> > +        fpcs = env->fpcs;
> > +        fpds = env->fpds;
>
>
> If you want to start supporting this feature flag, I suggest
> moving this to a separate patch.  The description of this patch
> seems to imply it is just a bug fix, not the implementation of a
> new feature flag.
>
> When adding support for a new feature flag in TCG code, you need
> to extend TCG_*_FEATURES in target/i386/cpu.c, otherwise the
> feature flag will never be enabled by the CPU configuration code.

Yes, currently this feature flag is never enabled for all CPU types.
How about removing this
feature flag in this patch and leaving a TODO in the comment? Thus I
can issue another patch
to complete the feature later.

>
>
> > +    } else {
> > +        fpcs = 0;
> > +        fpds = 0;
> > +    }
> > +
> >      if (data32) {
> >          /* 32 bit */
> >          cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
> >          cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
> >          cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> > -        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> > -        cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
> > -        cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
> > -        cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
> > +        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
> > +        cpu_stl_data_ra(env, ptr + 16, fpcs, retaddr); /* fpcs */
> > +        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpdp */
> > +        cpu_stl_data_ra(env, ptr + 24, fpds, retaddr); /* fpds */
> >      } else {
> >          /* 16 bit */
> >          cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
> >          cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
> >          cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
> > -        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
> > -        cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
> > -        cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
> > -        cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
> > +        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
> > +        cpu_stw_data_ra(env, ptr + 8, fpcs, retaddr);
> > +        cpu_stw_data_ra(env, ptr + 10, env->fpdp, retaddr);
> > +        cpu_stw_data_ra(env, ptr + 12, fpds, retaddr);
> >      }
> >  }
> >
> > @@ -2473,17 +2493,7 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
> >      }
> >
> >      /* fninit */
> > -    env->fpus = 0;
> > -    env->fpstt = 0;
> > -    cpu_set_fpuc(env, 0x37f);
> > -    env->fptags[0] = 1;
> > -    env->fptags[1] = 1;
> > -    env->fptags[2] = 1;
> > -    env->fptags[3] = 1;
> > -    env->fptags[4] = 1;
> > -    env->fptags[5] = 1;
> > -    env->fptags[6] = 1;
> > -    env->fptags[7] = 1;
> > +    helper_fninit(env);
> >  }
> >
> >  void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index 52e94fe106..59647ea5b7 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -5839,6 +5839,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >          /* floats */
> >      case 0xd8 ... 0xdf:
> >          {
> > +            TCGv last_addr = tcg_temp_new();
> > +            int last_seg;
> > +            bool update_fdp = false;
> > +            bool update_fip = true;
> > +

Note: The variables are declared here, in the case block. Without the
braces added in the previous commit,
the variables can only be moved outside.

> >              if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
> >                  /* if CR0.EM or CR0.TS are set, generate an FPU exception */
> >                  /* XXX: what to do if illegal op ? */
> > @@ -5851,7 +5856,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >              op = ((b & 7) << 3) | ((modrm >> 3) & 7);
> >              if (mod != 3) {
> >                  /* memory op */
> > -                gen_lea_modrm(env, s, modrm);
> > +                AddressParts a = gen_lea_modrm_0(env, s, modrm);
> > +                TCGv ea = gen_lea_modrm_1(s, a);
> > +
> > +                update_fdp = true;
> > +                last_seg = a.def_seg;
> > +                tcg_gen_mov_tl(last_addr, ea);
> > +                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
> > +
> >                  switch (op) {
> >                  case 0x00 ... 0x07: /* fxxxs */
> >                  case 0x10 ... 0x17: /* fixxxl */
> > @@ -5978,19 +5990,23 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                      break;
> >                  case 0x0c: /* fldenv mem */
> >                      gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x0d: /* fldcw mem */
> >                      tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> >                                          s->mem_index, MO_LEUW);
> >                      gen_helper_fldcw(cpu_env, s->tmp2_i32);
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x0e: /* fnstenv mem */
> >                      gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x0f: /* fnstcw mem */
> >                      gen_helper_fnstcw(s->tmp2_i32, cpu_env);
> >                      tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> >                                          s->mem_index, MO_LEUW);
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x1d: /* fldt mem */
> >                      gen_helper_fldt_ST0(cpu_env, s->A0);
> > @@ -6001,14 +6017,17 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                      break;
> >                  case 0x2c: /* frstor mem */
> >                      gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x2e: /* fnsave mem */
> >                      gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x2f: /* fnstsw mem */
> >                      gen_helper_fnstsw(s->tmp2_i32, cpu_env);
> >                      tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> >                                          s->mem_index, MO_LEUW);
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x3c: /* fbld */
> >                      gen_helper_fbld_ST0(cpu_env, s->A0);
> > @@ -6051,6 +6070,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                      case 0: /* fnop */
> >                          /* check exceptions (FreeBSD FPU probe) */
> >                          gen_helper_fwait(cpu_env);
> > +                        update_fip = update_fdp = false;
> >                          break;
> >                      default:
> >                          goto unknown_op;
> > @@ -6220,9 +6240,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                          break;
> >                      case 2: /* fclex */
> >                          gen_helper_fclex(cpu_env);
> > +                        update_fip = update_fdp = false;
> >                          break;
> >                      case 3: /* fninit */
> >                          gen_helper_fninit(cpu_env);
> > +                        update_fip = update_fdp = false;
> >                          break;
> >                      case 4: /* fsetpm (287 only, just do nop here) */
> >                          break;
> > @@ -6343,6 +6365,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                      goto unknown_op;
> >                  }
> >              }
> > +
> > +            if (update_fip) {
> > +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> > +                                offsetof(CPUX86State, segs[R_CS].selector));
> > +                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpcs));
> > +
> > +                tcg_gen_movi_tl(s->T0, pc_start - s->cs_base);
> > +                tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, fpip));
> > +            }
> > +
> > +            if (update_fdp) {
> > +                if (s->override >= 0) {
> > +                    last_seg = s->override;
> > +                }
> > +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> > +                                 offsetof(CPUX86State,
> > +                                 segs[last_seg].selector));
> > +                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpds));
> > +
> > +                tcg_gen_st_tl(last_addr, cpu_env, offsetof(CPUX86State, fpdp));
> > +            }
> >          }
> >          break;
> >          /************************/
> > --
> > 2.25.1
> >
>
> --
> Eduardo
>


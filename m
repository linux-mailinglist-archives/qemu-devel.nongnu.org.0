Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD53BD832
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:23:56 +0200 (CEST)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lzP-0001lO-2G
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1m0lw1-0007QQ-Rk
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:20:26 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:45965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1m0lvz-0004zB-Mi
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:20:25 -0400
Received: by mail-yb1-xb36.google.com with SMTP id k184so34396382ybf.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOz8fQyHntpcI1nkp4urrd5HTbXIuOTTCN+RXjqAreU=;
 b=WnvmwTwdnG7ae+d/whTan1wy8/5KUwvOcgubqfNMDjOMshG/eOAtP7tPJsiVGBA3Df
 VvAC1yIaX0nzSsZ0SwYo+FNOGGDcD1sLr51wW3NGsTtjShAdBcqoZ4CXXiuCQS1O03n+
 bCGOmeSe2wqo47wzyH/EZ9IGe0a1AF81/GF8XnwZXK74OFOkwDixPIJfEjYrQSAFd5l8
 WOKjC+usBkzrtKK6pSVxKOxFj8O4+/LYjvYdwdJ+7KQ6a32lrbZSqoX/TFVJ31u4L312
 GY+k9w4qMvZOnGcawJIei1oBbGC6INUTYcmZ8FzW/HGGlrOxcFlVaWq4nEYGxhpzvEsN
 oetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOz8fQyHntpcI1nkp4urrd5HTbXIuOTTCN+RXjqAreU=;
 b=Kvx1A4HFkMx9UIXAmOXesHoxJ1osrz03TXm+07FxQ9o/SCVR+sCe58jDE9fBIMHO+u
 KbTVa4OrIz1JQJLrkkuK8bSjiqlJQjy98uS6/qksrESYyB9QvvKWXYUWnzkwVwAb3vLt
 T6YALTUN1coYYH3UupK/86gyQXi/KeqFEvOQKI6BuQ9nRu2vAKOwYjlughHZVm3tJiRN
 8LIfAEzukzSCU/pkjkf2MLc63tPhLniU/cy2sywJr4uzTvFNrKQPbRuebBqGqh2Ec7ms
 NhBDBG5tc+Z7MskxgdpyqEEPS4ZknBZZ08WT6IueF3vdzD7xRiPQuJcDaAsgrEEOeBHn
 U6qA==
X-Gm-Message-State: AOAM533lTr46spkrmukCQI6bG4PHtF7jXR27NlMNscF77i6+ja8hO+Jl
 GwXAAre3+zOnQ6pc4ToBnRgppPgcHpMi760Dca8eIK8N
X-Google-Smtp-Source: ABdhPJxB+LUJcxC9JFk/pYG3MHRgKIqtsjudQx+Fn780OSUCee2wxdd94DkC0rojQDfe4Z144hzKouRcphcFRmqIc6w=
X-Received: by 2002:a25:dc8c:: with SMTP id
 y134mr21874581ybe.301.1625581222532; 
 Tue, 06 Jul 2021 07:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210530150112.74411-1-ziqiaokong@gmail.com>
 <20210530150112.74411-2-ziqiaokong@gmail.com>
 <CAM0BWNAu5YCXnp+fxcQcWeQnosjJq_VegiibW77bh6mdZpQ3Ow@mail.gmail.com>
 <CAM0BWNBdENZwQ-p3M3owrjCfw3u_=vZvnCceP82gAbQ123TqSw@mail.gmail.com>
 <CAM0BWNCZLmAP-XV7TA_DTes+9X3-bARo4jhbP2nxxCUGCcoydQ@mail.gmail.com>
 <CAM0BWNA7YsJf=fF0=TnX5rOyCbuNVzWTZRPBiKxF-HwT1jB3iA@mail.gmail.com>
In-Reply-To: <CAM0BWNA7YsJf=fF0=TnX5rOyCbuNVzWTZRPBiKxF-HwT1jB3iA@mail.gmail.com>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Tue, 6 Jul 2021 22:20:11 +0800
Message-ID: <CAM0BWNC3shiQJaEsBE1UJaWEZuwoYFSX43ocoKyptX8zBEwMUQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb36.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On Thu, Jul 1, 2021 at 9:58 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
>
> Ping.
>
> Ziqiao
>
> On Fri, Jun 25, 2021 at 1:06 AM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
> >
> > Ping.
> >
> > On Fri, Jun 11, 2021 at 10:32 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
> > >
> > > Ping.
> > >
> > > On Fri, Jun 4, 2021 at 11:04 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
> > > >
> > > > Ping.
> > > >
> > > > Sorry again for the previous duplicate emails.
> > > >
> > > > On Sun, May 30, 2021 at 11:05 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
> > > > >
> > > > > Update FCS:FIP and FDS:FDP according to the Intel Manual Vol.1 8.1.8. Note that
> > > > > CPUID.(EAX=07H,ECX=0H):EBX[bit 13] is not implemented by design in this patch
> > > > > and will be added along with TCG features flag in a separate patch later.
> > > > >
> > > > > Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> > > > > ---
> > > > > Sorry for the duplicate emails due to my bad network. The v7 has no
> > > > > difference from v6 and is sent just for clarification.
> > > > > Changes since v5:
> > > > > - Improve code indention in translate.c.
> > > > > Changes since v4:
> > > > > - Remove the dead code about CPUID_7_0_EBX_FCS_FDS.
> > > > > - Rewrite the commit message.
> > > > > ---
> > > > >  target/i386/cpu.h            |  2 ++
> > > > >  target/i386/tcg/fpu_helper.c | 32 +++++++++++--------------
> > > > >  target/i386/tcg/translate.c  | 45 +++++++++++++++++++++++++++++++++++-
> > > > >  3 files changed, 59 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > > > > index da72aa5228..147dadcce0 100644
> > > > > --- a/target/i386/cpu.h
> > > > > +++ b/target/i386/cpu.h
> > > > > @@ -1455,6 +1455,8 @@ typedef struct CPUX86State {
> > > > >      FPReg fpregs[8];
> > > > >      /* KVM-only so far */
> > > > >      uint16_t fpop;
> > > > > +    uint16_t fpcs;
> > > > > +    uint16_t fpds;
> > > > >      uint64_t fpip;
> > > > >      uint64_t fpdp;
> > > > >
> > > > > diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> > > > > index 1b30f1bb73..d953f04bb5 100644
> > > > > --- a/target/i386/tcg/fpu_helper.c
> > > > > +++ b/target/i386/tcg/fpu_helper.c
> > > > > @@ -728,6 +728,10 @@ void helper_fninit(CPUX86State *env)
> > > > >  {
> > > > >      env->fpus = 0;
> > > > >      env->fpstt = 0;
> > > > > +    env->fpcs = 0;
> > > > > +    env->fpds = 0;
> > > > > +    env->fpip = 0;
> > > > > +    env->fpdp = 0;
> > > > >      cpu_set_fpuc(env, 0x37f);
> > > > >      env->fptags[0] = 1;
> > > > >      env->fptags[1] = 1;
> > > > > @@ -2357,19 +2361,19 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
> > > > >          cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
> > > > >          cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
> > > > >          cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> > > > > -        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> > > > > -        cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
> > > > > -        cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
> > > > > -        cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
> > > > > +        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
> > > > > +        cpu_stl_data_ra(env, ptr + 16, env->fpcs, retaddr); /* fpcs */
> > > > > +        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpoo */
> > > > > +        cpu_stl_data_ra(env, ptr + 24, env->fpds, retaddr); /* fpos */
> > > > >      } else {
> > > > >          /* 16 bit */
> > > > >          cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
> > > > >          cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
> > > > >          cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
> > > > > -        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
> > > > > -        cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
> > > > > -        cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
> > > > > -        cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
> > > > > +        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
> > > > > +        cpu_stw_data_ra(env, ptr + 8, env->fpcs, retaddr);
> > > > > +        cpu_stw_data_ra(env, ptr + 10, env->fpdp, retaddr);
> > > > > +        cpu_stw_data_ra(env, ptr + 12, env->fpds, retaddr);
> > > > >      }
> > > > >  }
> > > > >
> > > > > @@ -2436,17 +2440,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
> > > > >      }
> > > > >
> > > > >      /* fninit */
> > > > > -    env->fpus = 0;
> > > > > -    env->fpstt = 0;
> > > > > -    cpu_set_fpuc(env, 0x37f);
> > > > > -    env->fptags[0] = 1;
> > > > > -    env->fptags[1] = 1;
> > > > > -    env->fptags[2] = 1;
> > > > > -    env->fptags[3] = 1;
> > > > > -    env->fptags[4] = 1;
> > > > > -    env->fptags[5] = 1;
> > > > > -    env->fptags[6] = 1;
> > > > > -    env->fptags[7] = 1;
> > > > > +    helper_fninit(env);
> > > > >  }
> > > > >
> > > > >  void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
> > > > > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > > > > index 5c1b7b87c5..4c57ee5c26 100644
> > > > > --- a/target/i386/tcg/translate.c
> > > > > +++ b/target/i386/tcg/translate.c
> > > > > @@ -5930,6 +5930,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >          /* floats */
> > > > >      case 0xd8 ... 0xdf:
> > > > >          {
> > > > > +            TCGv last_addr = tcg_temp_new();
> > > > > +            int last_seg;
> > > > > +            bool update_fdp = false;
> > > > > +            bool update_fip = true;
> > > > > +
> > > > >              if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
> > > > >                  /* if CR0.EM or CR0.TS are set, generate an FPU exception */
> > > > >                  /* XXX: what to do if illegal op ? */
> > > > > @@ -5942,7 +5947,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >              op = ((b & 7) << 3) | ((modrm >> 3) & 7);
> > > > >              if (mod != 3) {
> > > > >                  /* memory op */
> > > > > -                gen_lea_modrm(env, s, modrm);
> > > > > +                AddressParts a = gen_lea_modrm_0(env, s, modrm);
> > > > > +                TCGv ea = gen_lea_modrm_1(s, a);
> > > > > +
> > > > > +                update_fdp = true;
> > > > > +                last_seg = a.def_seg;
> > > > > +                tcg_gen_mov_tl(last_addr, ea);
> > > > > +                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
> > > > > +
> > > > >                  switch (op) {
> > > > >                  case 0x00 ... 0x07: /* fxxxs */
> > > > >                  case 0x10 ... 0x17: /* fixxxl */
> > > > > @@ -6070,20 +6082,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >                  case 0x0c: /* fldenv mem */
> > > > >                      gen_helper_fldenv(cpu_env, s->A0,
> > > > >                                        tcg_const_i32(dflag - 1));
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x0d: /* fldcw mem */
> > > > >                      tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> > > > >                                          s->mem_index, MO_LEUW);
> > > > >                      gen_helper_fldcw(cpu_env, s->tmp2_i32);
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x0e: /* fnstenv mem */
> > > > >                      gen_helper_fstenv(cpu_env, s->A0,
> > > > >                                        tcg_const_i32(dflag - 1));
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x0f: /* fnstcw mem */
> > > > >                      gen_helper_fnstcw(s->tmp2_i32, cpu_env);
> > > > >                      tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> > > > >                                          s->mem_index, MO_LEUW);
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x1d: /* fldt mem */
> > > > >                      gen_helper_fldt_ST0(cpu_env, s->A0);
> > > > > @@ -6095,15 +6111,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >                  case 0x2c: /* frstor mem */
> > > > >                      gen_helper_frstor(cpu_env, s->A0,
> > > > >                                        tcg_const_i32(dflag - 1));
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x2e: /* fnsave mem */
> > > > >                      gen_helper_fsave(cpu_env, s->A0,
> > > > >                                       tcg_const_i32(dflag - 1));
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x2f: /* fnstsw mem */
> > > > >                      gen_helper_fnstsw(s->tmp2_i32, cpu_env);
> > > > >                      tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> > > > >                                          s->mem_index, MO_LEUW);
> > > > > +                    update_fip = update_fdp = false;
> > > > >                      break;
> > > > >                  case 0x3c: /* fbld */
> > > > >                      gen_helper_fbld_ST0(cpu_env, s->A0);
> > > > > @@ -6146,6 +6165,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >                      case 0: /* fnop */
> > > > >                          /* check exceptions (FreeBSD FPU probe) */
> > > > >                          gen_helper_fwait(cpu_env);
> > > > > +                        update_fip = update_fdp = false;
> > > > >                          break;
> > > > >                      default:
> > > > >                          goto unknown_op;
> > > > > @@ -6315,9 +6335,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >                          break;
> > > > >                      case 2: /* fclex */
> > > > >                          gen_helper_fclex(cpu_env);
> > > > > +                        update_fip = update_fdp = false;
> > > > >                          break;
> > > > >                      case 3: /* fninit */
> > > > >                          gen_helper_fninit(cpu_env);
> > > > > +                        update_fip = update_fdp = false;
> > > > >                          break;
> > > > >                      case 4: /* fsetpm (287 only, just do nop here) */
> > > > >                          break;
> > > > > @@ -6438,6 +6460,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> > > > >                      goto unknown_op;
> > > > >                  }
> > > > >              }
> > > > > +
> > > > > +            if (update_fip) {
> > > > > +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> > > > > +                                 offsetof(CPUX86State, segs[R_CS].selector));
> > > > > +                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpcs));
> > > > > +
> > > > > +                tcg_gen_movi_tl(s->T0, pc_start - s->cs_base);
> > > > > +                tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, fpip));
> > > > > +            }
> > > > > +
> > > > > +            if (update_fdp) {
> > > > > +                if (s->override >= 0) {
> > > > > +                    last_seg = s->override;
> > > > > +                }
> > > > > +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> > > > > +                                 offsetof(CPUX86State,
> > > > > +                                 segs[last_seg].selector));
> > > > > +                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpds));
> > > > > +
> > > > > +                tcg_gen_st_tl(last_addr, cpu_env, offsetof(CPUX86State, fpdp));
> > > > > +            }
> > > > >          }
> > > > >          break;
> > > > >          /************************/
> > > > > --
> > > > > 2.25.1
> > > > >


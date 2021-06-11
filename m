Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA63A4422
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:34:07 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lriEY-0003B6-P1
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lriCs-00008c-4n
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:32:22 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lriCn-0003Gh-Nl
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:32:21 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id c14so4613338ybk.3
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=joVT8SRrdll/N+48TSLWrDq85zBMOzD4PYPjcGNPnAg=;
 b=k7nAcuccGZXFfw3Ea+aKqsGtlhZRMsJ6hzsIadW1pA4K4o5ZSETS1Es33UHzoD5PGD
 nlfAFEmU4RFBokX7KoBdDv2U9wx7YME1mQi7/P3yBljuT9H9xiK/s8Q/bJj3fIe0Alby
 OdQguqgrrEirJJa/f0drvQcqQL0l5dF48bvBqQ59cx/F2fh3qvosvD8ezelJH8S3OEu3
 3/wkJMqwmvHvjXnaRHeQF//xTG9ecun05MCvEd5lmVjdetZAAbUKWdtlGMaFYcEERSqj
 dQoB8nQd0F3jdWoPYm5icvSf/1wJ2UBbWy4/TK0QL+55BQkT6WLJmfiZpaJk8ph9sFGn
 Lp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=joVT8SRrdll/N+48TSLWrDq85zBMOzD4PYPjcGNPnAg=;
 b=D4cxygATZ+y4iyHZ9W4wMFP/e/xbIpbSjIW+17a258gDuAJCCUKBsnc4u2oLgLg/7I
 mnN4UDLUc8YONLKXkfAJa6tbZlcmydVQ353WOm3FSdc9GYL+We8TIWDxHG7J3846w81c
 +xuq2jGdXgcx9mOY1H/+J0hmpslfhocThB8dachGtK6AENqEltmYy01k+DWQwz+Nxh2w
 fkTqNVrPd3gl/CMYEdCz6J/43CtSvKYSOf7fhWC+c/fAEfui12/ExWTGngy3pgPbw9tj
 DfuGt77vanZrQ1nMTlO+CKyeg96pS9CCLEisV2btiVir60dIbK0+Hloq393ml0AP6W6z
 OAAg==
X-Gm-Message-State: AOAM531TOpgss1lk5Sw9BOtZTvZIeR9WiFDlTurNb3C2uZ38yxPt5v8/
 IaSFbbcAaRU8Z1uKMd6H4KZhOakSm4NgmWNJsBFeL5nniO8=
X-Google-Smtp-Source: ABdhPJzijDziPVW2wOTzBFKS4q/HNA5Tf7cYsP1UQm3woFM1ynYJRINrRc4tKzgN7r3M+f5ujhr09ZgcK0s+POBdHig=
X-Received: by 2002:a25:8b08:: with SMTP id i8mr5773276ybl.370.1623421934415; 
 Fri, 11 Jun 2021 07:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210530150112.74411-1-ziqiaokong@gmail.com>
 <20210530150112.74411-2-ziqiaokong@gmail.com>
 <CAM0BWNAu5YCXnp+fxcQcWeQnosjJq_VegiibW77bh6mdZpQ3Ow@mail.gmail.com>
In-Reply-To: <CAM0BWNAu5YCXnp+fxcQcWeQnosjJq_VegiibW77bh6mdZpQ3Ow@mail.gmail.com>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Fri, 11 Jun 2021 22:32:03 +0800
Message-ID: <CAM0BWNBdENZwQ-p3M3owrjCfw3u_=vZvnCceP82gAbQ123TqSw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb2a.google.com
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

On Fri, Jun 4, 2021 at 11:04 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
>
> Ping.
>
> Sorry again for the previous duplicate emails.
>
> On Sun, May 30, 2021 at 11:05 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
> >
> > Update FCS:FIP and FDS:FDP according to the Intel Manual Vol.1 8.1.8. Note that
> > CPUID.(EAX=07H,ECX=0H):EBX[bit 13] is not implemented by design in this patch
> > and will be added along with TCG features flag in a separate patch later.
> >
> > Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> > ---
> > Sorry for the duplicate emails due to my bad network. The v7 has no
> > difference from v6 and is sent just for clarification.
> > Changes since v5:
> > - Improve code indention in translate.c.
> > Changes since v4:
> > - Remove the dead code about CPUID_7_0_EBX_FCS_FDS.
> > - Rewrite the commit message.
> > ---
> >  target/i386/cpu.h            |  2 ++
> >  target/i386/tcg/fpu_helper.c | 32 +++++++++++--------------
> >  target/i386/tcg/translate.c  | 45 +++++++++++++++++++++++++++++++++++-
> >  3 files changed, 59 insertions(+), 20 deletions(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index da72aa5228..147dadcce0 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1455,6 +1455,8 @@ typedef struct CPUX86State {
> >      FPReg fpregs[8];
> >      /* KVM-only so far */
> >      uint16_t fpop;
> > +    uint16_t fpcs;
> > +    uint16_t fpds;
> >      uint64_t fpip;
> >      uint64_t fpdp;
> >
> > diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> > index 1b30f1bb73..d953f04bb5 100644
> > --- a/target/i386/tcg/fpu_helper.c
> > +++ b/target/i386/tcg/fpu_helper.c
> > @@ -728,6 +728,10 @@ void helper_fninit(CPUX86State *env)
> >  {
> >      env->fpus = 0;
> >      env->fpstt = 0;
> > +    env->fpcs = 0;
> > +    env->fpds = 0;
> > +    env->fpip = 0;
> > +    env->fpdp = 0;
> >      cpu_set_fpuc(env, 0x37f);
> >      env->fptags[0] = 1;
> >      env->fptags[1] = 1;
> > @@ -2357,19 +2361,19 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
> >          cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
> >          cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
> >          cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> > -        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> > -        cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
> > -        cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
> > -        cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
> > +        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
> > +        cpu_stl_data_ra(env, ptr + 16, env->fpcs, retaddr); /* fpcs */
> > +        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpoo */
> > +        cpu_stl_data_ra(env, ptr + 24, env->fpds, retaddr); /* fpos */
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
> > +        cpu_stw_data_ra(env, ptr + 8, env->fpcs, retaddr);
> > +        cpu_stw_data_ra(env, ptr + 10, env->fpdp, retaddr);
> > +        cpu_stw_data_ra(env, ptr + 12, env->fpds, retaddr);
> >      }
> >  }
> >
> > @@ -2436,17 +2440,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
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
> >  void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index 5c1b7b87c5..4c57ee5c26 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -5930,6 +5930,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >          /* floats */
> >      case 0xd8 ... 0xdf:
> >          {
> > +            TCGv last_addr = tcg_temp_new();
> > +            int last_seg;
> > +            bool update_fdp = false;
> > +            bool update_fip = true;
> > +
> >              if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
> >                  /* if CR0.EM or CR0.TS are set, generate an FPU exception */
> >                  /* XXX: what to do if illegal op ? */
> > @@ -5942,7 +5947,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
> > @@ -6070,20 +6082,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                  case 0x0c: /* fldenv mem */
> >                      gen_helper_fldenv(cpu_env, s->A0,
> >                                        tcg_const_i32(dflag - 1));
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x0d: /* fldcw mem */
> >                      tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> >                                          s->mem_index, MO_LEUW);
> >                      gen_helper_fldcw(cpu_env, s->tmp2_i32);
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x0e: /* fnstenv mem */
> >                      gen_helper_fstenv(cpu_env, s->A0,
> >                                        tcg_const_i32(dflag - 1));
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
> > @@ -6095,15 +6111,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                  case 0x2c: /* frstor mem */
> >                      gen_helper_frstor(cpu_env, s->A0,
> >                                        tcg_const_i32(dflag - 1));
> > +                    update_fip = update_fdp = false;
> >                      break;
> >                  case 0x2e: /* fnsave mem */
> >                      gen_helper_fsave(cpu_env, s->A0,
> >                                       tcg_const_i32(dflag - 1));
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
> > @@ -6146,6 +6165,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                      case 0: /* fnop */
> >                          /* check exceptions (FreeBSD FPU probe) */
> >                          gen_helper_fwait(cpu_env);
> > +                        update_fip = update_fdp = false;
> >                          break;
> >                      default:
> >                          goto unknown_op;
> > @@ -6315,9 +6335,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
> > @@ -6438,6 +6460,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                      goto unknown_op;
> >                  }
> >              }
> > +
> > +            if (update_fip) {
> > +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> > +                                 offsetof(CPUX86State, segs[R_CS].selector));
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


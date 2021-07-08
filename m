Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB293BF3F8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:25:48 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1JjX-0007DC-6H
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1m1JiB-0005lU-GH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:24:23 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1m1Ji9-00021u-A5
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:24:23 -0400
Received: by mail-yb1-xb29.google.com with SMTP id g5so6449773ybu.10
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 19:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVH1kpuE7An1K8HJIbosYxOYmhxIPkGUwpwXHWPmPsk=;
 b=q1EdR95iGd0MmN7SwoIxfadUl3j0ye2+cn68oOTl9evmnTJJ0qh1s6+wxgj3DAGJIT
 /vV43yzv2gfsU8nvqD7+K9xA8oYLO6A8wkbeqzIGL6JTnKBWifIfJWCcoE3KF90NWONv
 uKgfuaguajqJIxGlLaIdNk38EiTbQPZBVfCAob7tnR0tHaIEmjIFj4hoUbhArhQVhQCb
 2jDxcutTeXd4KbksNZCCUbB5fYgI3h8n44LooRgFEIkJjALnEAAKuQ4i7GTJM/MI4pVC
 32ndjOxZbNuP5H5/QomsoWspFlNR7hlWo5PD3drORyevroNo9o6YOvgL6f6QXKmaCyBl
 +zJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVH1kpuE7An1K8HJIbosYxOYmhxIPkGUwpwXHWPmPsk=;
 b=E60eDCf/5tnHxO+sCWGfH5sn9KRiZ9/KfC4bLCyik+8JtMfZvwHyCh4doit1LmAJqh
 bnpRGn9Xo9vC6ByjyCOaz5Nowu0femro2/YF4JNOZxbrV9UgIVmXcXxpDy9kzs7FGB63
 GWAlzTjINbs/gXvL+CHtm3EuFFIiTRk1TFJi6uvB15aB5nM1wPzeK1mMeBtPYj9Vesyw
 e+NQBGtWw4go76HwH4VMPjv2DHnEwyrDimAe1OE9FJwyu1L9iVr6L/lTVvWzRZ5lU3ce
 WqDVDPQIn1JT9yVWqSp6aaJoEsPRIZl4YtjzpqtyAYtnmplO+wzrIgc6VDLOzfXfBrUX
 Pbbw==
X-Gm-Message-State: AOAM531G10Pzucv2qb6zXDiFb3ZdT6e/1sshPPI7fXw5f3vZ7nhsJpzL
 OnO5134uJVQwcMEEYv/gS/5wfagRWENYwZ0peI0=
X-Google-Smtp-Source: ABdhPJzGA8yEpUSIIclFZA3ejW19SC5oyRLr2SZ1/f9OIg1/BfMZQAaQdgcHc+VapMAVno83ERjbZWAO45PRoIQTrko=
X-Received: by 2002:a25:d015:: with SMTP id h21mr36488009ybg.202.1625711058763; 
 Wed, 07 Jul 2021 19:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210707222452.591810-1-richard.henderson@linaro.org>
 <20210707222452.591810-4-richard.henderson@linaro.org>
In-Reply-To: <20210707222452.591810-4-richard.henderson@linaro.org>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Thu, 8 Jul 2021 10:24:07 +0800
Message-ID: <CAM0BWNBMHvokWceJadbEp+5C+8FZmBDy44vztFu9bsKCh0mNXQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb29.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

Thanks for applying fixes for me. Is there anything else I should do?

Ziqiao


On Thu, Jul 8, 2021 at 6:24 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Ziqiao Kong <ziqiaokong@gmail.com>
>
> Update FCS:FIP and FDS:FDP according to the Intel Manual Vol.1 8.1.8.
> Note that CPUID.(EAX=07H,ECX=0H):EBX[bit 13] is not implemented by
> design in this patch and will be added along with TCG features flag
> in a separate patch later.
>
> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> Message-Id: <20210530150112.74411-2-ziqiaokong@gmail.com>
> [rth: Push FDS/FDP handling down into mod != 3 case; free last_addr.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/cpu.h            |  2 ++
>  target/i386/tcg/fpu_helper.c | 20 ++++++++++-------
>  target/i386/tcg/translate.c  | 43 +++++++++++++++++++++++++++++++++++-
>  3 files changed, 56 insertions(+), 9 deletions(-)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 0f7ddbfeae..8921bf5318 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1435,6 +1435,8 @@ typedef struct CPUX86State {
>      FPReg fpregs[8];
>      /* KVM-only so far */
>      uint16_t fpop;
> +    uint16_t fpcs;
> +    uint16_t fpds;
>      uint64_t fpip;
>      uint64_t fpdp;
>
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index beb63be432..cdd8e9f947 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -731,6 +731,10 @@ static void do_fninit(CPUX86State *env)
>  {
>      env->fpus = 0;
>      env->fpstt = 0;
> +    env->fpcs = 0;
> +    env->fpds = 0;
> +    env->fpip = 0;
> +    env->fpdp = 0;
>      cpu_set_fpuc(env, 0x37f);
>      env->fptags[0] = 1;
>      env->fptags[1] = 1;
> @@ -2378,19 +2382,19 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
>          cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
>          cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
>          cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> -        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> -        cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
> -        cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
> -        cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
> +        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
> +        cpu_stl_data_ra(env, ptr + 16, env->fpcs, retaddr); /* fpcs */
> +        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpoo */
> +        cpu_stl_data_ra(env, ptr + 24, env->fpds, retaddr); /* fpos */
>      } else {
>          /* 16 bit */
>          cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
>          cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
>          cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
> -        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
> -        cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
> -        cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
> -        cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
> +        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
> +        cpu_stw_data_ra(env, ptr + 8, env->fpcs, retaddr);
> +        cpu_stw_data_ra(env, ptr + 10, env->fpdp, retaddr);
> +        cpu_stw_data_ra(env, ptr + 12, env->fpds, retaddr);
>      }
>  }
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 886d3d80f3..888ead0d49 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5930,6 +5930,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          /* floats */
>      case 0xd8 ... 0xdf:
>          {
> +            bool update_fip = true;
> +
>              if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
>                  /* if CR0.EM or CR0.TS are set, generate an FPU exception */
>                  /* XXX: what to do if illegal op ? */
> @@ -5942,7 +5944,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              op = ((b & 7) << 3) | ((modrm >> 3) & 7);
>              if (mod != 3) {
>                  /* memory op */
> -                gen_lea_modrm(env, s, modrm);
> +                AddressParts a = gen_lea_modrm_0(env, s, modrm);
> +                TCGv ea = gen_lea_modrm_1(s, a);
> +                TCGv last_addr = tcg_temp_new();
> +                bool update_fdp = true;
> +
> +                tcg_gen_mov_tl(last_addr, ea);
> +                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
> +
>                  switch (op) {
>                  case 0x00 ... 0x07: /* fxxxs */
>                  case 0x10 ... 0x17: /* fixxxl */
> @@ -6070,20 +6079,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  case 0x0c: /* fldenv mem */
>                      gen_helper_fldenv(cpu_env, s->A0,
>                                        tcg_const_i32(dflag - 1));
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x0d: /* fldcw mem */
>                      tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
>                                          s->mem_index, MO_LEUW);
>                      gen_helper_fldcw(cpu_env, s->tmp2_i32);
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x0e: /* fnstenv mem */
>                      gen_helper_fstenv(cpu_env, s->A0,
>                                        tcg_const_i32(dflag - 1));
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x0f: /* fnstcw mem */
>                      gen_helper_fnstcw(s->tmp2_i32, cpu_env);
>                      tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
>                                          s->mem_index, MO_LEUW);
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x1d: /* fldt mem */
>                      gen_helper_fldt_ST0(cpu_env, s->A0);
> @@ -6095,15 +6108,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  case 0x2c: /* frstor mem */
>                      gen_helper_frstor(cpu_env, s->A0,
>                                        tcg_const_i32(dflag - 1));
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x2e: /* fnsave mem */
>                      gen_helper_fsave(cpu_env, s->A0,
>                                       tcg_const_i32(dflag - 1));
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x2f: /* fnstsw mem */
>                      gen_helper_fnstsw(s->tmp2_i32, cpu_env);
>                      tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
>                                          s->mem_index, MO_LEUW);
> +                    update_fip = update_fdp = false;
>                      break;
>                  case 0x3c: /* fbld */
>                      gen_helper_fbld_ST0(cpu_env, s->A0);
> @@ -6126,6 +6142,19 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  default:
>                      goto unknown_op;
>                  }
> +
> +                if (update_fdp) {
> +                    int last_seg = s->override >= 0 ? s->override : a.def_seg;
> +
> +                    tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
> +                                   offsetof(CPUX86State,
> +                                            segs[last_seg].selector));
> +                    tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
> +                                     offsetof(CPUX86State, fpds));
> +                    tcg_gen_st_tl(last_addr, cpu_env,
> +                                  offsetof(CPUX86State, fpdp));
> +                }
> +                tcg_temp_free(last_addr);
>              } else {
>                  /* register float ops */
>                  opreg = rm;
> @@ -6146,6 +6175,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                      case 0: /* fnop */
>                          /* check exceptions (FreeBSD FPU probe) */
>                          gen_helper_fwait(cpu_env);
> +                        update_fip = false;
>                          break;
>                      default:
>                          goto unknown_op;
> @@ -6315,9 +6345,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                          break;
>                      case 2: /* fclex */
>                          gen_helper_fclex(cpu_env);
> +                        update_fip = false;
>                          break;
>                      case 3: /* fninit */
>                          gen_helper_fninit(cpu_env);
> +                        update_fip = false;
>                          break;
>                      case 4: /* fsetpm (287 only, just do nop here) */
>                          break;
> @@ -6438,6 +6470,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                      goto unknown_op;
>                  }
>              }
> +
> +            if (update_fip) {
> +                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
> +                               offsetof(CPUX86State, segs[R_CS].selector));
> +                tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
> +                                 offsetof(CPUX86State, fpcs));
> +                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
> +                              cpu_env, offsetof(CPUX86State, fpip));
> +            }
>          }
>          break;
>          /************************/
> --
> 2.25.1
>


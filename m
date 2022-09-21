Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1C5BFDF4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:33:06 +0200 (CEST)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayuX-0002Ow-PP
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayn0-00044x-FG
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaymy-0001FR-KZ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ifIR+V3E5PysuuDDk7f4sEXKEpNZcbEH8+PPtXTEKOM=;
 b=Bnb8sl9+bAXTEndvpsl8AjsNeBoxnCrR9iuxMFdy5tsSOWN4K0hkDzZ/j5jLn6LBmEnK26
 3xy5Xkfcs4yq8/pPwV3/idOUiQW1uj2MvxCgwF02R+fZhQrXm31MQihhQ6/kvJfhAOnTPL
 37sVjyB8ebJ17BTeDy+FxegLnHkKxVg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-gpLqhbGSPLmeMBOT4ny7SA-1; Wed, 21 Sep 2022 08:25:14 -0400
X-MC-Unique: gpLqhbGSPLmeMBOT4ny7SA-1
Received: by mail-qv1-f71.google.com with SMTP id
 ec8-20020ad44e68000000b004aab01f3eaaso4137599qvb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ifIR+V3E5PysuuDDk7f4sEXKEpNZcbEH8+PPtXTEKOM=;
 b=PmZcquHzFaXihl8pEEOxSJjs5tkuvg1dQpd4W/wYpLOEq2zi600ADe+WEbybyEwAzx
 RHUW3jj+2xTkWK1Okq0vbOdJcHnLUlb7j0iMrI99qDEcI7SVj/AzuCDkaQkqdbzQNdDD
 M19qu9Ve+szOxer0WsGkqSp7piORxqqyH5JtpKzKrzCmz6WZgTDRsC8o3+CxOtTDc17o
 R4ZSQTMeLr+2/6+58z9+MHxpylbsrBUX3l5OGjLuDHPa2FDoLOjCt5vcvsbPnIkxOz14
 /Xr3v7RliT1j4Gtpj2mftVQCEPAfEsjjLHH9uETQk3M09P+Bh0TCUGqtDNdQW+9xXJBp
 k0Tg==
X-Gm-Message-State: ACrzQf3uwH/pmTtucG9Ea+rF4vl4hOFSxykoQMQ4o5qhEK3en5CTv3wY
 J11pLOqfxUJz4t/4e9o2S0AVgZ0YW4d58+NhAfPZ3L/BgFURTz5DRQbOxhFasunI23uHOg7j5FX
 Ba+jxD0uSbMR1xYovTm0m9prE6vpq6PE=
X-Received: by 2002:a37:503:0:b0:6ce:8a8e:7625 with SMTP id
 3-20020a370503000000b006ce8a8e7625mr19563927qkf.288.1663763114011; 
 Wed, 21 Sep 2022 05:25:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JpdueLPI6bhwctA2B4O3YdcrZ0qJiDJcjJ1jNmkYak2BdAs++7y3RgoUUBSEsDTNzv9wJ2lKJ69X+q9QoaM4=
X-Received: by 2002:a37:503:0:b0:6ce:8a8e:7625 with SMTP id
 3-20020a370503000000b006ce8a8e7625mr19563907qkf.288.1663763113706; Wed, 21
 Sep 2022 05:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-10-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-10-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:25:02 +0200
Message-ID: <CABgObfaD9f4f5S78ycMS01cR9u_mjd3M9KqT_WZBNUg=2zD8OQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/23] target/i386: Use DISAS_EOB_NEXT
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace sequences of gen_update_cc_op, gen_update_eip_next,
> and gen_eob with the new is_jmp enumerator.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  target/i386/tcg/translate.c | 40 ++++++++++++-------------------------
>  1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index ea35d3e9b4..a7e5bcdec7 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -6987,8 +6987,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_pop_update(s, ot);
>              set_cc_op(s, CC_OP_EFLAGS);
>              /* abort translation because TF/AC flag may change */
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>          }
>          break;
>      case 0x9e: /* sahf */
> @@ -7417,8 +7416,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  gen_helper_rdmsr(cpu_env);
>              } else {
>                  gen_helper_wrmsr(cpu_env);
> -                gen_update_eip_next(s);
> -                gen_eob(s);
> +                s->base.is_jmp = DISAS_EOB_NEXT;
>              }
>          }
>          break;
> @@ -7617,8 +7615,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_helper_clac(cpu_env);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          case 0xcb: /* stac */
> @@ -7627,8 +7624,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_helper_stac(cpu_env);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          CASE_MODRM_MEM_OP(1): /* sidt */
> @@ -7672,8 +7668,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
>              gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
>              /* End TB because translation flags may change.  */
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          case 0xd8: /* VMRUN */
> @@ -7734,8 +7729,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              }
>              gen_update_cc_op(s);
>              gen_helper_stgi(cpu_env);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          case 0xdd: /* CLGI */
> @@ -7773,8 +7767,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
>              }
>              gen_helper_flush_page(cpu_env, s->A0);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          CASE_MODRM_MEM_OP(2): /* lgdt */
> @@ -7857,8 +7850,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
>              tcg_gen_or_tl(s->T0, s->T0, s->T1);
>              gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          CASE_MODRM_MEM_OP(7): /* invlpg */
> @@ -7868,8 +7860,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
>              gen_lea_modrm(env, s, modrm);
>              gen_helper_flush_page(cpu_env, s->A0);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          case 0xf8: /* swapgs */
> @@ -8268,8 +8259,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
>              gen_op_mov_v_reg(s, ot, s->T0, rm);
>              gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>          } else {
>              gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
>              gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
> @@ -8303,8 +8293,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  gen_op_mov_v_reg(s, ot, s->T0, rm);
>                  tcg_gen_movi_i32(s->tmp2_i32, reg);
>                  gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
> -                gen_update_eip_next(s);
> -                gen_eob(s);
> +                s->base.is_jmp = DISAS_EOB_NEXT;
>              } else {
>                  gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
>                  tcg_gen_movi_i32(s->tmp2_i32, reg);
> @@ -8318,8 +8307,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
>              gen_helper_clts(cpu_env);
>              /* abort block because static cpu state changed */
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>          }
>          break;
>      /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
> @@ -8415,9 +8403,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_helper_xrstor(cpu_env, s->A0, s->tmp1_i64);
>              /* XRSTOR is how MPX is enabled, which changes how
>                 we translate.  Thus we need to end the TB.  */
> -            gen_update_cc_op(s);
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>              break;
>
>          CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
> --
> 2.34.1
>



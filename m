Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE35BFE84
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:57:57 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazIa-0006qW-Tz
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaywH-0005fZ-U9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:34:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaywF-000357-Hg
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+RCe2nIINp7rbbZjD7JVl+kL8VX/drxG47A0/VVgSc8=;
 b=YtDWyMIXZ6FmHPhZCqTE4Pj2kuKtDKotyxpo/UYiCPeTYXR79xHsoob1gB1lkM0Amln2XG
 8bl6wAHfed7mV5KrIma+9nNRvfUcxmkru1mnz/ed8F1BIecaJ3cD8JW0FtvD2ZPG4gU63S
 lbmW2RYnyMAp0geD93yL8l/iPZg6+Kw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-541-0_lzJ9YMOf-XXhDTY4O28w-1; Wed, 21 Sep 2022 08:34:49 -0400
X-MC-Unique: 0_lzJ9YMOf-XXhDTY4O28w-1
Received: by mail-qk1-f200.google.com with SMTP id
 w10-20020a05620a444a00b006ce9917ea1fso4138405qkp.16
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+RCe2nIINp7rbbZjD7JVl+kL8VX/drxG47A0/VVgSc8=;
 b=8MbU3lZG2yGeXRJ0dPGANyrh+gV2uHmaV/rXug0YZn7Fvu9p9ONjP6v0fvawe0kYDU
 +pMdzNvpXUxc0TybQK6RVR2IxvdJBzBzLWJjQSKmvlSxXAo8D+WkKqX1morIIpAY2xbU
 wTsYOjRFirUxTGoMmaNk5YtIDHaSOktvFaP42gn+Y6pdf9rl4xgMHAc9MTge1m7KHoLu
 NbnckDIcV82ujD8Rx61ULfxJys5SWlHHIPLVqNvv+5Nv+SqdLKtvI/xhIi39of6Intou
 KcNPrueRUeZR/RCo8PHs3OBti0MuPpFlA46um6hqNeyvZx9mI9OJlfzULF96SuB+yuPy
 yYeA==
X-Gm-Message-State: ACrzQf24hgIZoZIiRFbRY+5OULpDCF80Na4intT6jSVIKlwu+WkcaPCI
 FI1OBxSzCadMjpJcjdu3o5nuXjt4S4MVvW6tpoNUbU2wBKDipW98ZimYXYIQ1ymztYXZRpw5nOB
 uMdeCZaLA6nJFcCLC/tR9aXif+nKh83A=
X-Received: by 2002:a05:6214:627:b0:4ac:adeb:58d9 with SMTP id
 a7-20020a056214062700b004acadeb58d9mr22794425qvx.128.1663763688350; 
 Wed, 21 Sep 2022 05:34:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4L2FQsdYxKbTjj76cwAP4q+j6yzmeQtQUO1A+yxiuZUvIz1kKq2ZgYdH2hQKHlMtEhNMASS9YiCLiPC+lQXQk=
X-Received: by 2002:a05:6214:627:b0:4ac:adeb:58d9 with SMTP id
 a7-20020a056214062700b004acadeb58d9mr22794393qvx.128.1663763687968; Wed, 21
 Sep 2022 05:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-16-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-16-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:34:36 +0200
Message-ID: <CABgObfaFe4NADTpzQQFCtK1bFviSW4qGquCsK83+XOjWYLE5GA@mail.gmail.com>
Subject: Re: [PATCH v2 15/23] target/i386: Create eip_next_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
> Create helpers for loading the address of the next insn.
> Use tcg_constant_* in adjacent code where convenient.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 427ee72442..527fb79895 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -541,6 +541,16 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
>      return tcg_constant_i32(cur_insn_len(s));
>  }
>
> +static TCGv_i32 eip_next_i32(DisasContext *s)
> +{
> +    return tcg_constant_i32(s->pc - s->cs_base);

Perhaps this should return 0xdeadbeef or 0xffffffff in 64-bit mode, so
that code goes in the weeds very quickly if it tries to use it?

Alternatively, just make iret_protected take a target_ulong for
next_eip, without too much worries about 64-on-32 emulation.

Paolo

> +}
> +
> +static TCGv eip_next_tl(DisasContext *s)
> +{
> +    return tcg_constant_tl(s->pc - s->cs_base);
> +}
> +
>  /* Compute SEG:REG into A0.  SEG is selected from the override segment
>     (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
>     indicate no override.  */
> @@ -1213,12 +1223,9 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
>          /* user-mode cpu should not be in IOBPT mode */
>          g_assert_not_reached();
>  #else
> -        TCGv_i32 t_size = tcg_const_i32(1 << ot);
> -        TCGv t_next = tcg_const_tl(s->pc - s->cs_base);
> -
> +        TCGv_i32 t_size = tcg_constant_i32(1 << ot);
> +        TCGv t_next = eip_next_tl(s);
>          gen_helper_bpt_io(cpu_env, t_port, t_size, t_next);
> -        tcg_temp_free_i32(t_size);
> -        tcg_temp_free(t_next);
>  #endif /* CONFIG_USER_ONLY */
>      }
>  }
> @@ -5280,9 +5287,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              if (dflag == MO_16) {
>                  tcg_gen_ext16u_tl(s->T0, s->T0);
>              }
> -            next_eip = s->pc - s->cs_base;
> -            tcg_gen_movi_tl(s->T1, next_eip);
> -            gen_push_v(s, s->T1);
> +            gen_push_v(s, eip_next_tl(s));
>              gen_op_jmp_v(s->T0);
>              gen_bnd_jmp(s);
>              s->base.is_jmp = DISAS_JUMP;
> @@ -5298,14 +5303,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              if (PE(s) && !VM86(s)) {
>                  tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
>                  gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
> -                                           tcg_const_i32(dflag - 1),
> -                                           tcg_const_tl(s->pc - s->cs_base));
> +                                           tcg_constant_i32(dflag - 1),
> +                                           eip_next_tl(s));
>              } else {
>                  tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
>                  tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
>                  gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
> -                                      tcg_const_i32(dflag - 1),
> -                                      tcg_const_i32(s->pc - s->cs_base));
> +                                      tcg_constant_i32(dflag - 1),
> +                                      eip_next_i32(s));
>              }
>              s->base.is_jmp = DISAS_JUMP;
>              break;
> @@ -5328,7 +5333,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              if (PE(s) && !VM86(s)) {
>                  tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
>                  gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
> -                                          tcg_const_tl(s->pc - s->cs_base));
> +                                          eip_next_tl(s));
>              } else {
>                  gen_op_movl_seg_T0_vm(s, R_CS);
>                  gen_op_jmp_v(s->T1);
> @@ -6819,8 +6824,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              }
>              gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
>          } else {
> -            gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
> -                                      tcg_const_i32(s->pc - s->cs_base));
> +            gen_helper_iret_protected(cpu_env, tcg_constant_i32(dflag - 1),
> +                                      eip_next_i32(s));
>          }
>          set_cc_op(s, CC_OP_EFLAGS);
>          s->base.is_jmp = DISAS_EOB_ONLY;
> @@ -6832,15 +6837,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              } else {
>                  tval = (int16_t)insn_get(env, s, MO_16);
>              }
> -            next_eip = s->pc - s->cs_base;
> -            tval += next_eip;
> +            tval += s->pc - s->cs_base;
>              if (dflag == MO_16) {
>                  tval &= 0xffff;
>              } else if (!CODE64(s)) {
>                  tval &= 0xffffffff;
>              }
> -            tcg_gen_movi_tl(s->T0, next_eip);
> -            gen_push_v(s, s->T0);
> +            gen_push_v(s, eip_next_tl(s));
>              gen_bnd_jmp(s);
>              gen_jmp(s, tval);
>          }
> @@ -7374,8 +7377,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              TCGLabel *l1, *l2, *l3;
>
>              tval = (int8_t)insn_get(env, s, MO_8);
> -            next_eip = s->pc - s->cs_base;
> -            tval += next_eip;
> +            tval += s->pc - s->cs_base;
>              if (dflag == MO_16) {
>                  tval &= 0xffff;
>              }
> --
> 2.34.1
>



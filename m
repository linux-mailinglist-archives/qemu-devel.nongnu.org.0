Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE27544F94
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:39:00 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJJL-0002uc-Ei
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIbR-0001LJ-5I
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:53:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIbP-0006af-JG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:53:36 -0400
Received: by mail-pg1-x52f.google.com with SMTP id y187so21917158pgd.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fDb0Dmcsx+ZFsOd3c0daRecpemMUPGtZHRnv9+lYy3s=;
 b=TsjCxEoGbNosQ1XstrYrpjntMhoy5cA4JWXgKIEsKXp5k7SQSZPOkRTp1j+KYUJhZZ
 +JtkRkfi+7ybGCjdEs2Tyt+NWPU6IWHBFS1wyDeed4CsKX7WxsKzYXsVjdkx/68PVKK8
 A8Ve6rq5YjDts8Kdik72x5MwdVBg11W1lofRQNnfBLy7ycNXhHtY5Pj8Pn/qFU7ZHiRF
 /Vu1XBOdynPQvsosDm4xdDPOESrNCy5ICzs/glWIrNuas+MYriIZsdQo3Q6IPwDGJCtC
 hjO507KeK9AMoniAb8NSekV+c8rCo2CzYSUi3lIG41Erm0RDZG88YaC/hvjwUjsmAMgx
 Ps+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fDb0Dmcsx+ZFsOd3c0daRecpemMUPGtZHRnv9+lYy3s=;
 b=4JG3rqin3/E68hzbkfZGyhUntC+oabQglE5TOxwV2XQ/jD5VTzphAvg9BgJxvuNTwm
 KPbbJqd/GK3EbNnRDaXWlrAS7YEkgFdl3uLqbuQzc+BnkI3Q6lRaxnwfJK8iF4lhOF1c
 cGogsjCk8nIoLCZj2GZnvIheV374a0Alb9At50nurhfVplWUy91C0xfGbK2JNHsTzqV2
 Tu6GMx8Y1fDrU5IgOWKF6seDMRFbITmuCQH9HZVQbwdwO6j9szC97u51Roja127H+7Un
 QzYVsFfCmGOjB6/GEbYv0uNTtNZZVtUY2Pb6RVyoV8noh50672oYYD82kKvNeleVn5qz
 c2hg==
X-Gm-Message-State: AOAM533MIqgSCIiRadTP0kx+kHb6LlNWW2hM5/Wbvgq7ykuiiiSOqxqd
 wP1N+l2r9rIZ6M1u0hJQaZYhiw==
X-Google-Smtp-Source: ABdhPJyJrTYDtQTeiyWeOpKxZHODGIvW2/l4nA8nX/qCs+6ANkZNp+SVuXFyzEzNnPQQPKgIpGdLnw==
X-Received: by 2002:a63:2cd7:0:b0:3fe:1c0a:75ce with SMTP id
 s206-20020a632cd7000000b003fe1c0a75cemr10529669pgs.602.1654782814148; 
 Thu, 09 Jun 2022 06:53:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 c143-20020a621c95000000b005187c4d53c9sm17172909pfc.160.2022.06.09.06.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 06:53:33 -0700 (PDT)
Message-ID: <7be99a0a-f7cc-5b58-a483-99c1c634997e@linaro.org>
Date: Thu, 9 Jun 2022 06:53:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/riscv: trans_rvv: Avoid assert for RV32 and e64
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Robert Bu <robert.bu@gmail.com>
References: <20220608234701.369536-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608234701.369536-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/8/22 16:47, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> When running a 32-bit guest, with a e64 vmv.v.x and vl_eq_vlmax set to
> true the `tcg_debug_assert(vece <= MO_32)` will be triggered inside
> tcg_gen_gvec_dup_i32().
> 
> This patch checks that condition and instead uses tcg_gen_gvec_dup_i64()
> is required.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1028
> Suggested-by: Robert Bu <robert.bu@gmail.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 391c61fe93..6b27d8e91e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2097,8 +2097,16 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>           s1 = get_gpr(s, a->rs1, EXT_SIGN);
>   
>           if (s->vl_eq_vlmax) {
> -            tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
> -                                MAXSZ(s), MAXSZ(s), s1);
> +            if (get_xl(s) == MXL_RV32 && s->sew == MO_64) {
> +                TCGv_i64 s1_i64 = tcg_temp_new_i64();
> +                tcg_gen_ext_tl_i64(s1_i64, s1);
> +                tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
> +                                     MAXSZ(s), MAXSZ(s), s1_i64);
> +                tcg_temp_free_i64(s1_i64);
> +            } else {
> +                tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
> +                                    MAXSZ(s), MAXSZ(s), s1);
> +            }
>           } else {
>               TCGv_i32 desc;
>               TCGv_i64 s1_i64 = tcg_temp_new_i64();



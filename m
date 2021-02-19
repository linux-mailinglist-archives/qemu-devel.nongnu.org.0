Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2431FDC0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:19:24 +0100 (CET)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9R5-0004ug-As
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lD9Nd-0003Jh-Lx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:15:49 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lD9NY-00071y-OX
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:15:49 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so14890811ejc.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bW5EcD3CuesYyjVHyPqGkrd3XFRQH/0rjYBx7nNIslY=;
 b=A2DhNOXJfOD1UgvB9x2lt5u+AzRfG0zA9lOI/oRLnr/nBbPW/RazEuVcxyBVFqd2ja
 uh28+Dg56Sd/0kmIymczDHX79LU//yd0r60Y9Ygr5pUgMTfYeuVLo+IOzILru62NcKMp
 IwROdkYhFuJGmOKbNlgZmiXoq6MT3ss8dObySNPORt9uaDahS9PkPaJOzVEO/fW+MTpb
 h6RAPS6MuffIthzoCFEFXYFgHE5mvGv+bZeUMaNt4fsn4uzrijB81+OWjo1+2JpXa90K
 WVhnWK4tVG60nUHjTJD5Qb2q1UBGdjDJJc4SLPjofpGylykOJSAYapOefcrZHMymjsiF
 wDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bW5EcD3CuesYyjVHyPqGkrd3XFRQH/0rjYBx7nNIslY=;
 b=eamaT+RW4vDJiPO0dy8MJcAt1h465kroONsvd74b5UCA0CcmMNLYREJG5FzJdCaBGU
 xX6M7fQuARtigFOZON3p7gjGbmGf3tDKZ/9tkqi7gm5XU/W7acM+ke1EDA6tcwigrM60
 zBnBMqyYrkyhOc7/v1ywMLxFIv12xE1NCQRqdU4YdyfAA6hOajjlFgA7hNO5Xt4SJdup
 nG+RC10+rJ+2Y3tq+S6JfSW91aiQFAJf7mAnsVk/lF8RTc8fpi7a6DLjAaHkgNlb/diz
 w0DqL0TkDurjSv9bamBBrFQTHRyYvV5RqJfwJIhxT8wuivExPB/8nHoMOt75COlJcc3I
 r7+g==
X-Gm-Message-State: AOAM530yvOx3H6/F1/e9tjFn5e2l6wa3uCvjedg0n+RQO8BVaS55B4Bt
 NDjEh7nz+03GveDNcBu1Cmq3xvisxSrLQrsN7Ug=
X-Google-Smtp-Source: ABdhPJwXGU5fmM1YczIlxLgH8aLPBIkvGMzUHyXI97B4aCwIh+ANZ71hiQmWWtoosVmAIB7c+qMIWDMXBc/qJNmx6rc=
X-Received: by 2002:a17:906:2991:: with SMTP id
 x17mr2027550eje.367.1613754942470; 
 Fri, 19 Feb 2021 09:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20210219124416.28178-1-stefans@axis.com>
In-Reply-To: <20210219124416.28178-1-stefans@axis.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 19 Feb 2021 18:15:31 +0100
Message-ID: <CAJy5ezrOi9VHE3dNJ6-47txFMFo5T-k0kPce7UcaKRQEywKJSw@mail.gmail.com>
Subject: Re: [PATCH v4] target/cris: Plug leakage of TCG temporaries
To: =?UTF-8?Q?Stefan_Sandstr=C3=B6m?= <stefans@axis.com>
Content-Type: multipart/alternative; boundary="00000000000019bc2605bbb39a68"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000019bc2605bbb39a68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Richard (Since he had comments on v1)

On Fri, 19 Feb 2021, 13:44 Stefan Sandstr=C3=B6m, <stefans@axis.com> wrote:

> From: Stefan Sandstrom <stefans@axis.com>
>
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.
>
> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> Signed-off-by: Stefan Sandstr=C3=B6m <stefans@axis.com>
> ---
>  target/cris/translate.c         | 124 ++++++++++++++++++++++----------
>  target/cris/translate_v10.c.inc |  70 ++++++++++++------
>  2 files changed, 135 insertions(+), 59 deletions(-)
>
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index c893f877ab..583bc73ccf 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -172,14 +172,20 @@ static int preg_sizes[] =3D {
>      tcg_gen_ld_tl(tn, cpu_env, offsetof(CPUCRISState, member))
>  #define t_gen_mov_env_TN(member, tn) \
>      tcg_gen_st_tl(tn, cpu_env, offsetof(CPUCRISState, member))
> +#define t_gen_movi_env_TN(member, c) \
> +    do { \
> +        TCGv tc =3D tcg_const_tl(c); \
> +        t_gen_mov_env_TN(member, tc); \
> +        tcg_temp_free(tc); \
> +    } while (0)
>
>  static inline void t_gen_mov_TN_preg(TCGv tn, int r)
>  {
>      assert(r >=3D 0 && r <=3D 15);
>      if (r =3D=3D PR_BZ || r =3D=3D PR_WZ || r =3D=3D PR_DZ) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(0));
> +        tcg_gen_movi_tl(tn, 0);
>      } else if (r =3D=3D PR_VR) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(32));
> +        tcg_gen_movi_tl(tn, 32);
>      } else {
>          tcg_gen_mov_tl(tn, cpu_PR[r]);
>      }
> @@ -256,7 +262,7 @@ static int cris_fetch(CPUCRISState *env, DisasContext
> *dc, uint32_t addr,
>  static void cris_lock_irq(DisasContext *dc)
>  {
>      dc->clear_locked_irq =3D 0;
> -    t_gen_mov_env_TN(locked_irq, tcg_const_tl(1));
> +    t_gen_movi_env_TN(locked_irq, 1);
>  }
>
>  static inline void t_gen_raise_exception(uint32_t index)
> @@ -885,8 +891,7 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, in=
t
> cond)
>      case CC_EQ:
>          if ((arith_opt || move_opt)
>                  && dc->cc_x_uptodate !=3D (2 | X_FLAG)) {
> -            tcg_gen_setcond_tl(TCG_COND_EQ, cc,
> -                    cc_result, tcg_const_tl(0));
> +            tcg_gen_setcondi_tl(TCG_COND_EQ, cc, cc_result, 0);
>          } else {
>              cris_evaluate_flags(dc);
>              tcg_gen_andi_tl(cc,
> @@ -1330,14 +1335,17 @@ static int dec_addoq(CPUCRISState *env,
> DisasContext *dc)
>  }
>  static int dec_addq(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c;
>      LOG_DIS("addq %u, $r%u\n", dc->op1, dc->op2);
>
>      dc->op1 =3D EXTRACT_FIELD(dc->ir, 0, 5);
>
>      cris_cc_mask(dc, CC_MASK_NZVC);
>
> +    c =3D tcg_const_tl(dc->op1);
>      cris_alu(dc, CC_OP_ADD,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(dc->op1), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>      return 2;
>  }
>  static int dec_moveq(CPUCRISState *env, DisasContext *dc)
> @@ -1353,62 +1361,77 @@ static int dec_moveq(CPUCRISState *env,
> DisasContext *dc)
>  }
>  static int dec_subq(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c;
>      dc->op1 =3D EXTRACT_FIELD(dc->ir, 0, 5);
>
>      LOG_DIS("subq %u, $r%u\n", dc->op1, dc->op2);
>
>      cris_cc_mask(dc, CC_MASK_NZVC);
> +    c =3D tcg_const_tl(dc->op1);
>      cris_alu(dc, CC_OP_SUB,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(dc->op1), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>      return 2;
>  }
>  static int dec_cmpq(CPUCRISState *env, DisasContext *dc)
>  {
>      uint32_t imm;
> +    TCGv c;
>      dc->op1 =3D EXTRACT_FIELD(dc->ir, 0, 5);
>      imm =3D sign_extend(dc->op1, 5);
>
>      LOG_DIS("cmpq %d, $r%d\n", imm, dc->op2);
>      cris_cc_mask(dc, CC_MASK_NZVC);
>
> +    c =3D tcg_const_tl(imm);
>      cris_alu(dc, CC_OP_CMP,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(imm), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>      return 2;
>  }
>  static int dec_andq(CPUCRISState *env, DisasContext *dc)
>  {
>      uint32_t imm;
> +    TCGv c;
>      dc->op1 =3D EXTRACT_FIELD(dc->ir, 0, 5);
>      imm =3D sign_extend(dc->op1, 5);
>
>      LOG_DIS("andq %d, $r%d\n", imm, dc->op2);
>      cris_cc_mask(dc, CC_MASK_NZ);
>
> +    c =3D tcg_const_tl(imm);
>      cris_alu(dc, CC_OP_AND,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(imm), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>      return 2;
>  }
>  static int dec_orq(CPUCRISState *env, DisasContext *dc)
>  {
>      uint32_t imm;
> +    TCGv c;
>      dc->op1 =3D EXTRACT_FIELD(dc->ir, 0, 5);
>      imm =3D sign_extend(dc->op1, 5);
>      LOG_DIS("orq %d, $r%d\n", imm, dc->op2);
>      cris_cc_mask(dc, CC_MASK_NZ);
>
> +    c =3D tcg_const_tl(imm);
>      cris_alu(dc, CC_OP_OR,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(imm), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>      return 2;
>  }
>  static int dec_btstq(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c;
>      dc->op1 =3D EXTRACT_FIELD(dc->ir, 0, 4);
>      LOG_DIS("btstq %u, $r%d\n", dc->op1, dc->op2);
>
>      cris_cc_mask(dc, CC_MASK_NZ);
> +    c =3D tcg_const_tl(dc->op1);
>      cris_evaluate_flags(dc);
> -        gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->op2],
> -            tcg_const_tl(dc->op1), cpu_PR[PR_CCS]);
> +    gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->op2],
> +            c, cpu_PR[PR_CCS]);
> +    tcg_temp_free(c);
>      cris_alu(dc, CC_OP_MOVE,
>           cpu_R[dc->op2], cpu_R[dc->op2], cpu_R[dc->op2], 4);
>      cris_update_cc_op(dc, CC_OP_FLAGS, 4);
> @@ -1558,7 +1581,7 @@ static int dec_lsl_r(CPUCRISState *env, DisasContex=
t
> *dc)
>      dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
>      tcg_gen_andi_tl(t[1], t[1], 63);
>      cris_alu(dc, CC_OP_LSL, cpu_R[dc->op2], t[0], t[1], size);
> -    cris_alu_alloc_temps(dc, size, t);
> +    cris_alu_free_temps(dc, size, t);
>      return 2;
>  }
>
> @@ -1624,7 +1647,7 @@ static int dec_mulu_r(CPUCRISState *env,
> DisasContext *dc)
>      dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
>
>      cris_alu(dc, CC_OP_MULU, cpu_R[dc->op2], t[0], t[1], 4);
> -    cris_alu_alloc_temps(dc, size, t);
> +    cris_alu_free_temps(dc, size, t);
>      return 2;
>  }
>
> @@ -1806,7 +1829,7 @@ static int dec_addi_r(CPUCRISState *env,
> DisasContext *dc)
>              memsize_char(memsize_zz(dc)), dc->op2, dc->op1);
>      cris_cc_mask(dc, 0);
>      t0 =3D tcg_temp_new();
> -    tcg_gen_shl_tl(t0, cpu_R[dc->op2], tcg_const_tl(dc->zzsize));
> +    tcg_gen_shli_tl(t0, cpu_R[dc->op2], dc->zzsize);
>      tcg_gen_add_tl(cpu_R[dc->op1], cpu_R[dc->op1], t0);
>      tcg_temp_free(t0);
>      return 2;
> @@ -1819,7 +1842,7 @@ static int dec_addi_acr(CPUCRISState *env,
> DisasContext *dc)
>            memsize_char(memsize_zz(dc)), dc->op2, dc->op1);
>      cris_cc_mask(dc, 0);
>      t0 =3D tcg_temp_new();
> -    tcg_gen_shl_tl(t0, cpu_R[dc->op2], tcg_const_tl(dc->zzsize));
> +    tcg_gen_shli_tl(t0, cpu_R[dc->op2], dc->zzsize);
>      tcg_gen_add_tl(cpu_R[R_ACR], cpu_R[dc->op1], t0);
>      tcg_temp_free(t0);
>      return 2;
> @@ -2051,18 +2074,26 @@ static int dec_setclrf(CPUCRISState *env,
> DisasContext *dc)
>
>  static int dec_move_rs(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c2, c1;
>      LOG_DIS("move $r%u, $s%u\n", dc->op1, dc->op2);
> +    c1 =3D tcg_const_tl(dc->op1);
> +    c2 =3D tcg_const_tl(dc->op2);
>      cris_cc_mask(dc, 0);
> -        gen_helper_movl_sreg_reg(cpu_env, tcg_const_tl(dc->op2),
> -                                 tcg_const_tl(dc->op1));
> +    gen_helper_movl_sreg_reg(cpu_env, c2, c1);
> +    tcg_temp_free(c1);
> +    tcg_temp_free(c2);
>      return 2;
>  }
>  static int dec_move_sr(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c2, c1;
>      LOG_DIS("move $s%u, $r%u\n", dc->op2, dc->op1);
> +    c1 =3D tcg_const_tl(dc->op1);
> +    c2 =3D tcg_const_tl(dc->op2);
>      cris_cc_mask(dc, 0);
> -        gen_helper_movl_reg_sreg(cpu_env, tcg_const_tl(dc->op1),
> -                                 tcg_const_tl(dc->op2));
> +    gen_helper_movl_reg_sreg(cpu_env, c1, c2);
> +    tcg_temp_free(c1);
> +    tcg_temp_free(c2);
>      return 2;
>  }
>
> @@ -2345,7 +2376,7 @@ static int dec_cmp_m(CPUCRISState *env, DisasContex=
t
> *dc)
>
>  static int dec_test_m(CPUCRISState *env, DisasContext *dc)
>  {
> -    TCGv t[2];
> +    TCGv t[2], c;
>      int memsize =3D memsize_zz(dc);
>      int insn_len;
>      LOG_DIS("test.%c [$r%u%s] op2=3D%x\n",
> @@ -2360,8 +2391,10 @@ static int dec_test_m(CPUCRISState *env,
> DisasContext *dc)
>      cris_cc_mask(dc, CC_MASK_NZ);
>      tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);
>
> +    c =3D tcg_const_tl(0);
>      cris_alu(dc, CC_OP_CMP,
> -         cpu_R[dc->op2], t[1], tcg_const_tl(0), memsize_zz(dc));
> +         cpu_R[dc->op2], t[1], c, memsize_zz(dc));
> +    tcg_temp_free(c);
>      do_postinc(dc, memsize);
>      cris_alu_m_free_temps(t);
>      return insn_len;
> @@ -2713,6 +2746,7 @@ static int dec_jump_p(CPUCRISState *env,
> DisasContext *dc)
>  /* Jump and save.  */
>  static int dec_jas_r(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c;
>      LOG_DIS("jas $r%u, $p%u\n", dc->op1, dc->op2);
>      cris_cc_mask(dc, 0);
>      /* Store the return address in Pd.  */
> @@ -2720,7 +2754,9 @@ static int dec_jas_r(CPUCRISState *env, DisasContex=
t
> *dc)
>      if (dc->op2 > 15) {
>          abort();
>      }
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 4));
> +    c =3D tcg_const_tl(dc->pc + 4);
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>
>      cris_prepare_jmp(dc, JMP_INDIRECT);
>      return 2;
> @@ -2729,13 +2765,16 @@ static int dec_jas_r(CPUCRISState *env,
> DisasContext *dc)
>  static int dec_jas_im(CPUCRISState *env, DisasContext *dc)
>  {
>      uint32_t imm;
> +    TCGv c;
>
>      imm =3D cris_fetch(env, dc, dc->pc + 2, 4, 0);
>
>      LOG_DIS("jas 0x%x\n", imm);
>      cris_cc_mask(dc, 0);
> +    c =3D tcg_const_tl(dc->pc + 8);
>      /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 8));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>
>      dc->jmp_pc =3D imm;
>      cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2745,13 +2784,16 @@ static int dec_jas_im(CPUCRISState *env,
> DisasContext *dc)
>  static int dec_jasc_im(CPUCRISState *env, DisasContext *dc)
>  {
>      uint32_t imm;
> +    TCGv c;
>
>      imm =3D cris_fetch(env, dc, dc->pc + 2, 4, 0);
>
>      LOG_DIS("jasc 0x%x\n", imm);
>      cris_cc_mask(dc, 0);
> +    c =3D tcg_const_tl(dc->pc + 8 + 4);
>      /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 8 + 4));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>
>      dc->jmp_pc =3D imm;
>      cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2760,11 +2802,14 @@ static int dec_jasc_im(CPUCRISState *env,
> DisasContext *dc)
>
>  static int dec_jasc_r(CPUCRISState *env, DisasContext *dc)
>  {
> +    TCGv c;
>      LOG_DIS("jasc_r $r%u, $p%u\n", dc->op1, dc->op2);
>      cris_cc_mask(dc, 0);
>      /* Store the return address in Pd.  */
>      tcg_gen_mov_tl(env_btarget, cpu_R[dc->op1]);
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 4 + 4));
> +    c =3D tcg_const_tl(dc->pc + 4 + 4);
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>      cris_prepare_jmp(dc, JMP_INDIRECT);
>      return 2;
>  }
> @@ -2789,13 +2834,16 @@ static int dec_bcc_im(CPUCRISState *env,
> DisasContext *dc)
>  static int dec_bas_im(CPUCRISState *env, DisasContext *dc)
>  {
>      int32_t simm;
> +    TCGv c;
>
>      simm =3D cris_fetch(env, dc, dc->pc + 2, 4, 0);
>
>      LOG_DIS("bas 0x%x, $p%u\n", dc->pc + simm, dc->op2);
>      cris_cc_mask(dc, 0);
> +    c =3D tcg_const_tl(dc->pc + 8);
>      /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 8));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>
>      dc->jmp_pc =3D dc->pc + simm;
>      cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2805,12 +2853,15 @@ static int dec_bas_im(CPUCRISState *env,
> DisasContext *dc)
>  static int dec_basc_im(CPUCRISState *env, DisasContext *dc)
>  {
>      int32_t simm;
> +    TCGv c;
>      simm =3D cris_fetch(env, dc, dc->pc + 2, 4, 0);
>
>      LOG_DIS("basc 0x%x, $p%u\n", dc->pc + simm, dc->op2);
>      cris_cc_mask(dc, 0);
> +    c =3D tcg_const_tl(dc->pc + 12);
>      /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 12));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>
>      dc->jmp_pc =3D dc->pc + simm;
>      cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2851,8 +2902,7 @@ static int dec_rfe_etc(CPUCRISState *env,
> DisasContext *dc)
>          tcg_gen_movi_tl(env_pc, dc->pc + 2);
>
>          /* Breaks start at 16 in the exception vector.  */
> -        t_gen_mov_env_TN(trap_vector,
> -                tcg_const_tl(dc->op1 + 16));
> +        t_gen_movi_env_TN(trap_vector, dc->op1 + 16);
>          t_gen_raise_exception(EXCP_BREAK);
>          dc->is_jmp =3D DISAS_UPDATE;
>          break;
> @@ -3026,7 +3076,7 @@ static unsigned int crisv32_decoder(CPUCRISState
> *env, DisasContext *dc)
>          tcg_gen_brcondi_tl(TCG_COND_NE, cpu_PR[PR_SPC], dc->pc, l1);
>          /* We treat SPC as a break with an odd trap vector.  */
>          cris_evaluate_flags(dc);
> -        t_gen_mov_env_TN(trap_vector, tcg_const_tl(3));
> +        t_gen_movi_env_TN(trap_vector, 3);
>          tcg_gen_movi_tl(env_pc, dc->pc + insn_len);
>          tcg_gen_movi_tl(cpu_PR[PR_SPC], dc->pc + insn_len);
>          t_gen_raise_exception(EXCP_BREAK);
> @@ -3170,7 +3220,7 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
>              dc->delayed_branch--;
>              if (dc->delayed_branch =3D=3D 0) {
>                  if (tb->flags & 7) {
> -                    t_gen_mov_env_TN(dslot, tcg_const_tl(0));
> +                    t_gen_movi_env_TN(dslot, 0);
>                  }
>                  if (dc->cpustate_changed || !dc->flagx_known
>                      || (dc->flags_x !=3D (tb->flags & X_FLAG))) {
> @@ -3179,7 +3229,7 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
>
>                  if (dc->clear_locked_irq) {
>                      dc->clear_locked_irq =3D 0;
> -                    t_gen_mov_env_TN(locked_irq, tcg_const_tl(0));
> +                    t_gen_movi_env_TN(locked_irq, 0);
>                  }
>
>                  if (dc->jmp =3D=3D JMP_DIRECT_CC) {
> @@ -3200,7 +3250,9 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
>                      dc->is_jmp =3D DISAS_TB_JUMP;
>                      dc->jmp =3D JMP_NOJMP;
>                  } else {
> -                    t_gen_cc_jmp(env_btarget, tcg_const_tl(dc->pc));
> +                    TCGv c =3D tcg_const_tl(dc->pc);
> +                    t_gen_cc_jmp(env_btarget, c);
> +                    tcg_temp_free(c);
>                      dc->is_jmp =3D DISAS_JUMP;
>                  }
>                  break;
> @@ -3219,7 +3271,7 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
>              && num_insns < max_insns);
>
>      if (dc->clear_locked_irq) {
> -        t_gen_mov_env_TN(locked_irq, tcg_const_tl(0));
> +        t_gen_movi_env_TN(locked_irq, 0);
>      }
>
>      npc =3D dc->pc;
> @@ -3234,7 +3286,7 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
>      /* Broken branch+delayslot sequence.  */
>      if (dc->delayed_branch =3D=3D 1) {
>          /* Set env->dslot to the size of the branch insn.  */
> -        t_gen_mov_env_TN(dslot, tcg_const_tl(dc->pc - dc->ppc));
> +        t_gen_movi_env_TN(dslot, dc->pc - dc->ppc);
>          cris_store_direct_jmp(dc);
>      }
>
> diff --git a/target/cris/translate_v10.c.inc
> b/target/cris/translate_v10.c.inc
> index 86d78a82aa..f7cd67be37 100644
> --- a/target/cris/translate_v10.c.inc
> +++ b/target/cris/translate_v10.c.inc
> @@ -228,6 +228,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
>  {
>      int32_t imm, simm;
>      int op;
> +    TCGv c;
>
>      /* sign extend.  */
>      imm =3D dc->ir & ((1 << 6) - 1);
> @@ -254,29 +255,37 @@ static unsigned int dec10_quick_imm(DisasContext *d=
c)
>              LOG_DIS("moveq %d, $r%d\n", simm, dc->dst);
>
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(simm);
>              cris_alu(dc, CC_OP_MOVE, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_CMPQ:
>              LOG_DIS("cmpq %d, $r%d\n", simm, dc->dst);
>
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(simm);
>              cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_ADDQ:
>              LOG_DIS("addq %d, $r%d\n", imm, dc->dst);
>
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(imm);
>              cris_alu(dc, CC_OP_ADD, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_ANDQ:
>              LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
>
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(simm);
>              cris_alu(dc, CC_OP_AND, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_ASHQ:
>              LOG_DIS("ashq %d, $r%d\n", simm, dc->dst);
> @@ -284,15 +293,17 @@ static unsigned int dec10_quick_imm(DisasContext *d=
c)
>              cris_cc_mask(dc, CC_MASK_NZVC);
>              op =3D imm & (1 << 5);
>              imm &=3D 0x1f;
> +            c =3D tcg_const_tl(imm);
>              if (op) {
>                  cris_alu(dc, CC_OP_ASR, cpu_R[dc->dst],
> -                          cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                          cpu_R[dc->dst], c, 4);
>              } else {
>                  /* BTST */
>                  cris_update_cc_op(dc, CC_OP_FLAGS, 4);
>                  gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->dst],
> -                           tcg_const_tl(imm), cpu_PR[PR_CCS]);
> +                           c, cpu_PR[PR_CCS]);
>              }
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_LSHQ:
>              LOG_DIS("lshq %d, $r%d\n", simm, dc->dst);
> @@ -303,22 +314,28 @@ static unsigned int dec10_quick_imm(DisasContext *d=
c)
>              }
>              imm &=3D 0x1f;
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(imm);
>              cris_alu(dc, op, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_SUBQ:
>              LOG_DIS("subq %d, $r%d\n", imm, dc->dst);
>
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(imm);
>              cris_alu(dc, CC_OP_SUB, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>          case CRISV10_QIMM_ORQ:
>              LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
>
>              cris_cc_mask(dc, CC_MASK_NZVC);
> +            c =3D tcg_const_tl(simm);
>              cris_alu(dc, CC_OP_OR, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>              break;
>
>          case CRISV10_QIMM_BCC_R0:
> @@ -760,7 +777,6 @@ static unsigned int dec10_ind_move_m_r(CPUCRISState
> *env, DisasContext *dc,
>          tcg_gen_mov_tl(env_btarget, cpu_R[dc->dst]);
>          cris_prepare_jmp(dc, JMP_INDIRECT);
>          dc->delayed_branch =3D 1;
> -        return insn_len;
>      }
>
>      tcg_temp_free(t);
> @@ -777,6 +793,7 @@ static unsigned int dec10_ind_move_r_m(DisasContext
> *dc, unsigned int size)
>      crisv10_prepare_memaddr(dc, addr, size);
>      gen_store_v10(dc, addr, cpu_R[dc->dst], size);
>      insn_len +=3D crisv10_post_memaddr(dc, size);
> +    tcg_temp_free(addr);
>
>      return insn_len;
>  }
> @@ -796,11 +813,10 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISStat=
e
> *env, DisasContext *dc)
>          tcg_gen_mov_tl(env_btarget, t);
>          cris_prepare_jmp(dc, JMP_INDIRECT);
>          dc->delayed_branch =3D 1;
> -        return insn_len;
> +    } else {
> +        tcg_gen_mov_tl(cpu_PR[rd], t);
> +        dc->cpustate_changed =3D 1;
>      }
> -
> -    tcg_gen_mov_tl(cpu_PR[rd], t);
> -    dc->cpustate_changed =3D 1;
>      tcg_temp_free(addr);
>      tcg_temp_free(t);
>      return insn_len;
> @@ -824,8 +840,8 @@ static unsigned int dec10_ind_move_pr_m(DisasContext
> *dc)
>      } else {
>          gen_store_v10(dc, addr, cpu_PR[dc->dst], size);
>      }
> -    t0 =3D tcg_temp_new();
>      insn_len +=3D crisv10_post_memaddr(dc, size);
> +    tcg_temp_free(addr);
>      cris_lock_irq(dc);
>
>      return insn_len;
> @@ -927,7 +943,6 @@ static int dec10_ind_bound(CPUCRISState *env,
> DisasContext *dc,
>          tcg_gen_mov_tl(env_btarget, cpu_R[dc->dst]);
>          cris_prepare_jmp(dc, JMP_INDIRECT);
>          dc->delayed_branch =3D 1;
> -        return insn_len;
>      }
>
>      tcg_temp_free(t);
> @@ -953,7 +968,6 @@ static int dec10_alux_m(CPUCRISState *env,
> DisasContext *dc, int op)
>          tcg_gen_mov_tl(env_btarget, cpu_R[dc->dst]);
>          cris_prepare_jmp(dc, JMP_INDIRECT);
>          dc->delayed_branch =3D 1;
> -        return insn_len;
>      }
>
>      tcg_temp_free(t);
> @@ -1020,7 +1034,7 @@ static unsigned int dec10_ind(CPUCRISState *env,
> DisasContext *dc)
>      unsigned int size =3D dec10_size(dc->size);
>      uint32_t imm;
>      int32_t simm;
> -    TCGv t[2];
> +    TCGv t[2], c;
>
>      if (dc->size !=3D 3) {
>          switch (dc->opcode) {
> @@ -1041,8 +1055,10 @@ static unsigned int dec10_ind(CPUCRISState *env,
> DisasContext *dc)
>                  cris_alu_m_alloc_temps(t);
>                  insn_len +=3D dec10_prep_move_m(env, dc, 0, size, t[0]);
>                  tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);
> +                c =3D tcg_const_tl(0);
>                  cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
> -                         t[0], tcg_const_tl(0), size);
> +                         t[0], c, size);
> +                tcg_temp_free(c);
>                  cris_alu_m_free_temps(t);
>                  break;
>              case CRISV10_IND_ADD:
> @@ -1138,7 +1154,9 @@ static unsigned int dec10_ind(CPUCRISState *env,
> DisasContext *dc)
>                  if (dc->mode =3D=3D CRISV10_MODE_AUTOINC)
>                      insn_len +=3D size;
>
> -                t_gen_mov_preg_TN(dc, dc->dst, tcg_const_tl(dc->pc +
> insn_len));
> +                c =3D tcg_const_tl(dc->pc + insn_len);
> +                t_gen_mov_preg_TN(dc, dc->dst, c);
> +                tcg_temp_free(c);
>                  dc->jmp_pc =3D imm;
>                  cris_prepare_jmp(dc, JMP_DIRECT);
>                  dc->delayed_branch--; /* v10 has no dslot here.  */
> @@ -1147,7 +1165,9 @@ static unsigned int dec10_ind(CPUCRISState *env,
> DisasContext *dc)
>                      LOG_DIS("break %d\n", dc->src);
>                      cris_evaluate_flags(dc);
>                      tcg_gen_movi_tl(env_pc, dc->pc + 2);
> -                    t_gen_mov_env_TN(trap_vector, tcg_const_tl(dc->src +
> 2));
> +                    c =3D tcg_const_tl(dc->src + 2);
> +                    t_gen_mov_env_TN(trap_vector, c);
> +                    tcg_temp_free(c);
>                      t_gen_raise_exception(EXCP_BREAK);
>                      dc->is_jmp =3D DISAS_UPDATE;
>                      return insn_len;
> @@ -1155,7 +1175,9 @@ static unsigned int dec10_ind(CPUCRISState *env,
> DisasContext *dc)
>                  LOG_DIS("%d: jump.%d %d r%d r%d\n", __LINE__, size,
>                           dc->opcode, dc->src, dc->dst);
>                  t[0] =3D tcg_temp_new();
> -                t_gen_mov_preg_TN(dc, dc->dst, tcg_const_tl(dc->pc +
> insn_len));
> +                c =3D tcg_const_tl(dc->pc + insn_len);
> +                t_gen_mov_preg_TN(dc, dc->dst, c);
> +                tcg_temp_free(c);
>                  crisv10_prepare_memaddr(dc, t[0], size);
>                  gen_load(dc, env_btarget, t[0], 4, 0);
>                  insn_len +=3D crisv10_post_memaddr(dc, size);
> @@ -1178,7 +1200,9 @@ static unsigned int dec10_ind(CPUCRISState *env,
> DisasContext *dc)
>              LOG_DIS("jmp pc=3D%x opcode=3D%d r%d r%d\n",
>                          dc->pc, dc->opcode, dc->dst, dc->src);
>              tcg_gen_mov_tl(env_btarget, cpu_R[dc->src]);
> -            t_gen_mov_preg_TN(dc, dc->dst, tcg_const_tl(dc->pc +
> insn_len));
> +            c =3D tcg_const_tl(dc->pc + insn_len);
> +            t_gen_mov_preg_TN(dc, dc->dst, c);
> +            tcg_temp_free(c);
>              cris_prepare_jmp(dc, JMP_INDIRECT);
>              dc->delayed_branch--; /* v10 has no dslot here.  */
>              break;
> --
> 2.24.3 (Apple Git-128)
>
>

--00000000000019bc2605bbb39a68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>+ Richard (Since he had comments on v1)=C2=A0<br><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1=
9 Feb 2021, 13:44 Stefan Sandstr=C3=B6m, &lt;<a href=3D"mailto:stefans@axis=
.com">stefans@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">From: Stefan Sandstrom &lt;<a href=3D"mailto:stefans@axis.com" target=3D=
"_blank" rel=3D"noreferrer">stefans@axis.com</a>&gt;<br>
<br>
Add and fix deallocation of temporary TCG registers in CRIS code<br>
generation.<br>
<br>
Tested-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@xilinx.co=
m" target=3D"_blank" rel=3D"noreferrer">edgar.iglesias@xilinx.com</a>&gt;<b=
r>
Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@xilinx.=
com" target=3D"_blank" rel=3D"noreferrer">edgar.iglesias@xilinx.com</a>&gt;=
<br>
Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc<br>
Signed-off-by: Stefan Sandstr=C3=B6m &lt;<a href=3D"mailto:stefans@axis.com=
" target=3D"_blank" rel=3D"noreferrer">stefans@axis.com</a>&gt;<br>
---<br>
=C2=A0target/cris/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 124 ++++++=
++++++++++++++++----------<br>
=C2=A0target/cris/translate_v10.c.inc |=C2=A0 70 ++++++++++++------<br>
=C2=A02 files changed, 135 insertions(+), 59 deletions(-)<br>
<br>
diff --git a/target/cris/translate.c b/target/cris/translate.c<br>
index c893f877ab..583bc73ccf 100644<br>
--- a/target/cris/translate.c<br>
+++ b/target/cris/translate.c<br>
@@ -172,14 +172,20 @@ static int preg_sizes[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_ld_tl(tn, cpu_env, offsetof(CPUCRISState, membe=
r))<br>
=C2=A0#define t_gen_mov_env_TN(member, tn) \<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_st_tl(tn, cpu_env, offsetof(CPUCRISState, membe=
r))<br>
+#define t_gen_movi_env_TN(member, c) \<br>
+=C2=A0 =C2=A0 do { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tc =3D tcg_const_tl(c); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_env_TN(member, tc); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tc); \<br>
+=C2=A0 =C2=A0 } while (0)<br>
<br>
=C2=A0static inline void t_gen_mov_TN_preg(TCGv tn, int r)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0assert(r &gt;=3D 0 &amp;&amp; r &lt;=3D 15);<br>
=C2=A0 =C2=A0 =C2=A0if (r =3D=3D PR_BZ || r =3D=3D PR_WZ || r =3D=3D PR_DZ)=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(tn, tcg_const_tl(0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(tn, 0);<br>
=C2=A0 =C2=A0 =C2=A0} else if (r =3D=3D PR_VR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(tn, tcg_const_tl(32));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(tn, 32);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(tn, cpu_PR[r]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -256,7 +262,7 @@ static int cris_fetch(CPUCRISState *env, DisasContext *=
dc, uint32_t addr,<br>
=C2=A0static void cris_lock_irq(DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;clear_locked_irq =3D 0;<br>
-=C2=A0 =C2=A0 t_gen_mov_env_TN(locked_irq, tcg_const_tl(1));<br>
+=C2=A0 =C2=A0 t_gen_movi_env_TN(locked_irq, 1);<br>
=C2=A0}<br>
<br>
=C2=A0static inline void t_gen_raise_exception(uint32_t index)<br>
@@ -885,8 +891,7 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, int =
cond)<br>
=C2=A0 =C2=A0 =C2=A0case CC_EQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((arith_opt || move_opt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; dc=
-&gt;cc_x_uptodate !=3D (2 | X_FLAG)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_setcond_tl(TCG_COND_EQ, =
cc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc_r=
esult, tcg_const_tl(0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_setcondi_tl(TCG_COND_EQ,=
 cc, cc_result, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_evaluate_flags(dc);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(cc,<br>
@@ -1330,14 +1335,17 @@ static int dec_addoq(CPUCRISState *env, DisasContex=
t *dc)<br>
=C2=A0}<br>
=C2=A0static int dec_addq(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;addq %u, $r%u\n&quot;, dc-&gt;op1, dc-&gt=
;op2);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;op1 =3D EXTRACT_FIELD(dc-&gt;ir, 0, 5);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZVC);<br>
<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;op1);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_ADD,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], tcg_const_tl(dc-&gt;op1), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], c, 4);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
=C2=A0static int dec_moveq(CPUCRISState *env, DisasContext *dc)<br>
@@ -1353,62 +1361,77 @@ static int dec_moveq(CPUCRISState *env, DisasContex=
t *dc)<br>
=C2=A0}<br>
=C2=A0static int dec_subq(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;op1 =3D EXTRACT_FIELD(dc-&gt;ir, 0, 5);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;subq %u, $r%u\n&quot;, dc-&gt;op1, dc-&gt=
;op2);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZVC);<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;op1);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_SUB,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], tcg_const_tl(dc-&gt;op1), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], c, 4);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
=C2=A0static int dec_cmpq(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t imm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;op1 =3D EXTRACT_FIELD(dc-&gt;ir, 0, 5);<br>
=C2=A0 =C2=A0 =C2=A0imm =3D sign_extend(dc-&gt;op1, 5);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;cmpq %d, $r%d\n&quot;, imm, dc-&gt;op2);<=
br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZVC);<br>
<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_CMP,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], c, 4);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
=C2=A0static int dec_andq(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t imm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;op1 =3D EXTRACT_FIELD(dc-&gt;ir, 0, 5);<br>
=C2=A0 =C2=A0 =C2=A0imm =3D sign_extend(dc-&gt;op1, 5);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;andq %d, $r%d\n&quot;, imm, dc-&gt;op2);<=
br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ);<br>
<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_AND,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], c, 4);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
=C2=A0static int dec_orq(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t imm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;op1 =3D EXTRACT_FIELD(dc-&gt;ir, 0, 5);<br>
=C2=A0 =C2=A0 =C2=A0imm =3D sign_extend(dc-&gt;op1, 5);<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;orq %d, $r%d\n&quot;, imm, dc-&gt;op2);<b=
r>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ);<br>
<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_OR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;=
op2], c, 4);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
=C2=A0static int dec_btstq(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;op1 =3D EXTRACT_FIELD(dc-&gt;ir, 0, 4);<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;btstq %u, $r%d\n&quot;, dc-&gt;op1, dc-&g=
t;op2);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ);<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;op1);<br>
=C2=A0 =C2=A0 =C2=A0cris_evaluate_flags(dc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R=
[dc-&gt;op2],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_const_tl(dc-&gt;op1), cpu_PR=
[PR_CCS]);<br>
+=C2=A0 =C2=A0 gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc-&gt;op2],<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c, cpu_PR[PR_CCS]);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_MOVE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;op2], cpu_R[dc-&gt;op2], cp=
u_R[dc-&gt;op2], 4);<br>
=C2=A0 =C2=A0 =C2=A0cris_update_cc_op(dc, CC_OP_FLAGS, 4);<br>
@@ -1558,7 +1581,7 @@ static int dec_lsl_r(CPUCRISState *env, DisasContext =
*dc)<br>
=C2=A0 =C2=A0 =C2=A0dec_prep_alu_r(dc, dc-&gt;op1, dc-&gt;op2, size, 0, t[0=
], t[1]);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(t[1], t[1], 63);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_LSL, cpu_R[dc-&gt;op2], t[0], t[1], =
size);<br>
-=C2=A0 =C2=A0 cris_alu_alloc_temps(dc, size, t);<br>
+=C2=A0 =C2=A0 cris_alu_free_temps(dc, size, t);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
<br>
@@ -1624,7 +1647,7 @@ static int dec_mulu_r(CPUCRISState *env, DisasContext=
 *dc)<br>
=C2=A0 =C2=A0 =C2=A0dec_prep_alu_r(dc, dc-&gt;op1, dc-&gt;op2, size, 0, t[0=
], t[1]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_MULU, cpu_R[dc-&gt;op2], t[0], t[1],=
 4);<br>
-=C2=A0 =C2=A0 cris_alu_alloc_temps(dc, size, t);<br>
+=C2=A0 =C2=A0 cris_alu_free_temps(dc, size, t);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
<br>
@@ -1806,7 +1829,7 @@ static int dec_addi_r(CPUCRISState *env, DisasContext=
 *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memsize_char(memsize_zz(dc)=
), dc-&gt;op2, dc-&gt;op1);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
=C2=A0 =C2=A0 =C2=A0t0 =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 tcg_gen_shl_tl(t0, cpu_R[dc-&gt;op2], tcg_const_tl(dc-&gt;zz=
size));<br>
+=C2=A0 =C2=A0 tcg_gen_shli_tl(t0, cpu_R[dc-&gt;op2], dc-&gt;zzsize);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_add_tl(cpu_R[dc-&gt;op1], cpu_R[dc-&gt;op1], t0=
);<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t0);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
@@ -1819,7 +1842,7 @@ static int dec_addi_acr(CPUCRISState *env, DisasConte=
xt *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memsize_char(memsize_zz(dc)), dc-&=
gt;op2, dc-&gt;op1);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
=C2=A0 =C2=A0 =C2=A0t0 =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 tcg_gen_shl_tl(t0, cpu_R[dc-&gt;op2], tcg_const_tl(dc-&gt;zz=
size));<br>
+=C2=A0 =C2=A0 tcg_gen_shli_tl(t0, cpu_R[dc-&gt;op2], dc-&gt;zzsize);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_add_tl(cpu_R[R_ACR], cpu_R[dc-&gt;op1], t0);<br=
>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t0);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
@@ -2051,18 +2074,26 @@ static int dec_setclrf(CPUCRISState *env, DisasCont=
ext *dc)<br>
<br>
=C2=A0static int dec_move_rs(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c2, c1;<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;move $r%u, $s%u\n&quot;, dc-&gt;op1, dc-&=
gt;op2);<br>
+=C2=A0 =C2=A0 c1 =3D tcg_const_tl(dc-&gt;op1);<br>
+=C2=A0 =C2=A0 c2 =3D tcg_const_tl(dc-&gt;op2);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_movl_sreg_reg(cpu_env, tcg_const_tl=
(dc-&gt;op2),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_const_tl(dc-&gt;op1));<br>
+=C2=A0 =C2=A0 gen_helper_movl_sreg_reg(cpu_env, c2, c1);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c1);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c2);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
=C2=A0static int dec_move_sr(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c2, c1;<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;move $s%u, $r%u\n&quot;, dc-&gt;op2, dc-&=
gt;op1);<br>
+=C2=A0 =C2=A0 c1 =3D tcg_const_tl(dc-&gt;op1);<br>
+=C2=A0 =C2=A0 c2 =3D tcg_const_tl(dc-&gt;op2);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_movl_reg_sreg(cpu_env, tcg_const_tl=
(dc-&gt;op1),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_const_tl(dc-&gt;op2));<br>
+=C2=A0 =C2=A0 gen_helper_movl_reg_sreg(cpu_env, c1, c2);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c1);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c2);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
<br>
@@ -2345,7 +2376,7 @@ static int dec_cmp_m(CPUCRISState *env, DisasContext =
*dc)<br>
<br>
=C2=A0static int dec_test_m(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 TCGv t[2];<br>
+=C2=A0 =C2=A0 TCGv t[2], c;<br>
=C2=A0 =C2=A0 =C2=A0int memsize =3D memsize_zz(dc);<br>
=C2=A0 =C2=A0 =C2=A0int insn_len;<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;test.%c [$r%u%s] op2=3D%x\n&quot;,<br>
@@ -2360,8 +2391,10 @@ static int dec_test_m(CPUCRISState *env, DisasContex=
t *dc)<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);<br=
>
<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(0);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_CMP,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_R[dc-&gt;op2], t[1], tcg_const_tl(0)=
, memsize_zz(dc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_R[dc-&gt;op2], t[1], c, memsize_zz(d=
c));<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0do_postinc(dc, memsize);<br>
=C2=A0 =C2=A0 =C2=A0cris_alu_m_free_temps(t);<br>
=C2=A0 =C2=A0 =C2=A0return insn_len;<br>
@@ -2713,6 +2746,7 @@ static int dec_jump_p(CPUCRISState *env, DisasContext=
 *dc)<br>
=C2=A0/* Jump and save.=C2=A0 */<br>
=C2=A0static int dec_jas_r(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;jas $r%u, $p%u\n&quot;, dc-&gt;op1, dc-&g=
t;op2);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
=C2=A0 =C2=A0 =C2=A0/* Store the return address in Pd.=C2=A0 */<br>
@@ -2720,7 +2754,9 @@ static int dec_jas_r(CPUCRISState *env, DisasContext =
*dc)<br>
=C2=A0 =C2=A0 =C2=A0if (dc-&gt;op2 &gt; 15) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, tcg_const_tl(dc-&gt;pc + 4=
));<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + 4);<br>
+=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, c);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_INDIRECT);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
@@ -2729,13 +2765,16 @@ static int dec_jas_r(CPUCRISState *env, DisasContex=
t *dc)<br>
=C2=A0static int dec_jas_im(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t imm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
<br>
=C2=A0 =C2=A0 =C2=A0imm =3D cris_fetch(env, dc, dc-&gt;pc + 2, 4, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;jas 0x%x\n&quot;, imm);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + 8);<br>
=C2=A0 =C2=A0 =C2=A0/* Store the return address in Pd.=C2=A0 */<br>
-=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, tcg_const_tl(dc-&gt;pc + 8=
));<br>
+=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, c);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;jmp_pc =3D imm;<br>
=C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_DIRECT);<br>
@@ -2745,13 +2784,16 @@ static int dec_jas_im(CPUCRISState *env, DisasConte=
xt *dc)<br>
=C2=A0static int dec_jasc_im(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t imm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
<br>
=C2=A0 =C2=A0 =C2=A0imm =3D cris_fetch(env, dc, dc-&gt;pc + 2, 4, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;jasc 0x%x\n&quot;, imm);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + 8 + 4);<br>
=C2=A0 =C2=A0 =C2=A0/* Store the return address in Pd.=C2=A0 */<br>
-=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, tcg_const_tl(dc-&gt;pc + 8=
 + 4));<br>
+=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, c);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;jmp_pc =3D imm;<br>
=C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_DIRECT);<br>
@@ -2760,11 +2802,14 @@ static int dec_jasc_im(CPUCRISState *env, DisasCont=
ext *dc)<br>
<br>
=C2=A0static int dec_jasc_r(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;jasc_r $r%u, $p%u\n&quot;, dc-&gt;op1, dc=
-&gt;op2);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
=C2=A0 =C2=A0 =C2=A0/* Store the return address in Pd.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(env_btarget, cpu_R[dc-&gt;op1]);<br>
-=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, tcg_const_tl(dc-&gt;pc + 4=
 + 4));<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + 4 + 4);<br>
+=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, c);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_INDIRECT);<br>
=C2=A0 =C2=A0 =C2=A0return 2;<br>
=C2=A0}<br>
@@ -2789,13 +2834,16 @@ static int dec_bcc_im(CPUCRISState *env, DisasConte=
xt *dc)<br>
=C2=A0static int dec_bas_im(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int32_t simm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
<br>
=C2=A0 =C2=A0 =C2=A0simm =3D cris_fetch(env, dc, dc-&gt;pc + 2, 4, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;bas 0x%x, $p%u\n&quot;, dc-&gt;pc + simm,=
 dc-&gt;op2);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + 8);<br>
=C2=A0 =C2=A0 =C2=A0/* Store the return address in Pd.=C2=A0 */<br>
-=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, tcg_const_tl(dc-&gt;pc + 8=
));<br>
+=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, c);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;jmp_pc =3D dc-&gt;pc + simm;<br>
=C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_DIRECT);<br>
@@ -2805,12 +2853,15 @@ static int dec_bas_im(CPUCRISState *env, DisasConte=
xt *dc)<br>
=C2=A0static int dec_basc_im(CPUCRISState *env, DisasContext *dc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int32_t simm;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
=C2=A0 =C2=A0 =C2=A0simm =3D cris_fetch(env, dc, dc-&gt;pc + 2, 4, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;basc 0x%x, $p%u\n&quot;, dc-&gt;pc + simm=
, dc-&gt;op2);<br>
=C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, 0);<br>
+=C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + 12);<br>
=C2=A0 =C2=A0 =C2=A0/* Store the return address in Pd.=C2=A0 */<br>
-=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, tcg_const_tl(dc-&gt;pc + 1=
2));<br>
+=C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;op2, c);<br>
+=C2=A0 =C2=A0 tcg_temp_free(c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;jmp_pc =3D dc-&gt;pc + simm;<br>
=C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_DIRECT);<br>
@@ -2851,8 +2902,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContex=
t *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(env_pc, dc-&gt;pc + 2);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Breaks start at 16 in the exception ve=
ctor.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_env_TN(trap_vector,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_const_tl(dc-&g=
t;op1 + 16));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_movi_env_TN(trap_vector, dc-&gt;op1 + 16=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t_gen_raise_exception(EXCP_BREAK);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;is_jmp =3D DISAS_UPDATE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -3026,7 +3076,7 @@ static unsigned int crisv32_decoder(CPUCRISState *env=
, DisasContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_brcondi_tl(TCG_COND_NE, cpu_PR[PR=
_SPC], dc-&gt;pc, l1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We treat SPC as a break with an odd tr=
ap vector.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_evaluate_flags(dc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_env_TN(trap_vector, tcg_const_tl(3))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_movi_env_TN(trap_vector, 3);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(env_pc, dc-&gt;pc + insn_=
len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(cpu_PR[PR_SPC], dc-&gt;pc=
 + insn_len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t_gen_raise_exception(EXCP_BREAK);<br>
@@ -3170,7 +3220,7 @@ void gen_intermediate_code(CPUState *cs, TranslationB=
lock *tb, int max_insns)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delayed_branch--;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc-&gt;delayed_branch =
=3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb-&gt;fl=
ags &amp; 7) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_mov_env_TN(dslot, tcg_const_tl(0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_movi_env_TN(dslot, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc-&gt;cp=
ustate_changed || !dc-&gt;flagx_known<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|| (dc-&gt;flags_x !=3D (tb-&gt;flags &amp; X_FLAG))) {<br>
@@ -3179,7 +3229,7 @@ void gen_intermediate_code(CPUState *cs, TranslationB=
lock *tb, int max_insns)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc-&gt;cl=
ear_locked_irq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dc-&gt;clear_locked_irq =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_mov_env_TN(locked_irq, tcg_const_tl(0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_movi_env_TN(locked_irq, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc-&gt;jm=
p =3D=3D JMP_DIRECT_CC) {<br>
@@ -3200,7 +3250,9 @@ void gen_intermediate_code(CPUState *cs, TranslationB=
lock *tb, int max_insns)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dc-&gt;is_jmp =3D DISAS_TB_JUMP;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dc-&gt;jmp =3D JMP_NOJMP;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_cc_jmp(env_btarget, tcg_const_tl(dc-&gt;pc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv=
 c =3D tcg_const_tl(dc-&gt;pc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_cc_jmp(env_btarget, c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_=
temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dc-&gt;is_jmp =3D DISAS_JUMP;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -3219,7 +3271,7 @@ void gen_intermediate_code(CPUState *cs, TranslationB=
lock *tb, int max_insns)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; num_insns &lt; m=
ax_insns);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dc-&gt;clear_locked_irq) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_env_TN(locked_irq, tcg_const_tl(0));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_movi_env_TN(locked_irq, 0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0npc =3D dc-&gt;pc;<br>
@@ -3234,7 +3286,7 @@ void gen_intermediate_code(CPUState *cs, TranslationB=
lock *tb, int max_insns)<br>
=C2=A0 =C2=A0 =C2=A0/* Broken branch+delayslot sequence.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (dc-&gt;delayed_branch =3D=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set env-&gt;dslot to the size of the b=
ranch insn.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_env_TN(dslot, tcg_const_tl(dc-&gt;pc=
 - dc-&gt;ppc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_movi_env_TN(dslot, dc-&gt;pc - dc-&gt;pp=
c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_store_direct_jmp(dc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.=
inc<br>
index 86d78a82aa..f7cd67be37 100644<br>
--- a/target/cris/translate_v10.c.inc<br>
+++ b/target/cris/translate_v10.c.inc<br>
@@ -228,6 +228,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int32_t imm, simm;<br>
=C2=A0 =C2=A0 =C2=A0int op;<br>
+=C2=A0 =C2=A0 TCGv c;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* sign extend.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0imm =3D dc-&gt;ir &amp; ((1 &lt;&lt; 6) - 1);<br>
@@ -254,29 +255,37 @@ static unsigned int dec10_quick_imm(DisasContext *dc)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;moveq %d, $r%=
d\n&quot;, simm, dc-&gt;dst);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(simm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_MOVE, cp=
u_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(simm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_CMPQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;cmpq %d, $r%d=
\n&quot;, simm, dc-&gt;dst);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(simm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_CMP, cpu=
_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(simm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_ADDQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;addq %d, $r%d=
\n&quot;, imm, dc-&gt;dst);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_ADD, cpu=
_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_ANDQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;andq %d, $r%d=
\n&quot;, simm, dc-&gt;dst);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(simm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_AND, cpu=
_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(simm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_ASHQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;ashq %d, $r%d=
\n&quot;, simm, dc-&gt;dst);<br>
@@ -284,15 +293,17 @@ static unsigned int dec10_quick_imm(DisasContext *dc)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op =3D imm &amp; (1 &lt;&lt=
; 5);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm &amp;=3D 0x1f;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (op) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, =
CC_OP_ASR, cpu_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;dst], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cpu_R[dc-&gt;dst], c, 4);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BTST */<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_update_c=
c_op(dc, CC_OP_FLAGS, 4);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_bt=
st(cpu_PR[PR_CCS], cpu_env, cpu_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tcg_const_tl(imm), cpu_PR[PR_CCS]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0c, cpu_PR[PR_CCS]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_LSHQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;lshq %d, $r%d=
\n&quot;, simm, dc-&gt;dst);<br>
@@ -303,22 +314,28 @@ static unsigned int dec10_quick_imm(DisasContext *dc)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm &amp;=3D 0x1f;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, op, cpu_R[dc-&=
gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_SUBQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;subq %d, $r%d=
\n&quot;, imm, dc-&gt;dst);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(imm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_SUB, cpu=
_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(imm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_ORQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;andq %d, $r%d=
\n&quot;, simm, dc-&gt;dst);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_cc_mask(dc, CC_MASK_NZ=
VC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(simm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, CC_OP_OR, cpu_=
R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], tcg_const_tl(simm), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu_R[dc-&gt;dst], c, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_QIMM_BCC_R0:<br>
@@ -760,7 +777,6 @@ static unsigned int dec10_ind_move_m_r(CPUCRISState *en=
v, DisasContext *dc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(env_btarget, cpu_R[dc-&gt;=
dst]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_INDIRECT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delayed_branch =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return insn_len;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t);<br>
@@ -777,6 +793,7 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc=
, unsigned int size)<br>
=C2=A0 =C2=A0 =C2=A0crisv10_prepare_memaddr(dc, addr, size);<br>
=C2=A0 =C2=A0 =C2=A0gen_store_v10(dc, addr, cpu_R[dc-&gt;dst], size);<br>
=C2=A0 =C2=A0 =C2=A0insn_len +=3D crisv10_post_memaddr(dc, size);<br>
+=C2=A0 =C2=A0 tcg_temp_free(addr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return insn_len;<br>
=C2=A0}<br>
@@ -796,11 +813,10 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState =
*env, DisasContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(env_btarget, t);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_INDIRECT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delayed_branch =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return insn_len;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(cpu_PR[rd], t);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dc-&gt;cpustate_changed =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 tcg_gen_mov_tl(cpu_PR[rd], t);<br>
-=C2=A0 =C2=A0 dc-&gt;cpustate_changed =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(addr);<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t);<br>
=C2=A0 =C2=A0 =C2=A0return insn_len;<br>
@@ -824,8 +840,8 @@ static unsigned int dec10_ind_move_pr_m(DisasContext *d=
c)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_store_v10(dc, addr, cpu_PR[dc-&gt;dst=
], size);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 t0 =3D tcg_temp_new();<br>
=C2=A0 =C2=A0 =C2=A0insn_len +=3D crisv10_post_memaddr(dc, size);<br>
+=C2=A0 =C2=A0 tcg_temp_free(addr);<br>
=C2=A0 =C2=A0 =C2=A0cris_lock_irq(dc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return insn_len;<br>
@@ -927,7 +943,6 @@ static int dec10_ind_bound(CPUCRISState *env, DisasCont=
ext *dc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(env_btarget, cpu_R[dc-&gt;=
dst]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_INDIRECT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delayed_branch =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return insn_len;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t);<br>
@@ -953,7 +968,6 @@ static int dec10_alux_m(CPUCRISState *env, DisasContext=
 *dc, int op)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(env_btarget, cpu_R[dc-&gt;=
dst]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_INDIRECT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delayed_branch =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return insn_len;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t);<br>
@@ -1020,7 +1034,7 @@ static unsigned int dec10_ind(CPUCRISState *env, Disa=
sContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0unsigned int size =3D dec10_size(dc-&gt;size);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t imm;<br>
=C2=A0 =C2=A0 =C2=A0int32_t simm;<br>
-=C2=A0 =C2=A0 TCGv t[2];<br>
+=C2=A0 =C2=A0 TCGv t[2], c;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dc-&gt;size !=3D 3) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (dc-&gt;opcode) {<br>
@@ -1041,8 +1055,10 @@ static unsigned int dec10_ind(CPUCRISState *env, Dis=
asContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu_m_al=
loc_temps(t);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insn_len +=3D=
 dec10_prep_move_m(env, dc, 0, size, t[0]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_=
tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl=
(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu(dc, =
CC_OP_CMP, cpu_R[dc-&gt;dst],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0t[0], tcg_const_tl(0), size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0t[0], c, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_alu_m_fr=
ee_temps(t);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CRISV10_IND_ADD:<br>
@@ -1138,7 +1154,9 @@ static unsigned int dec10_ind(CPUCRISState *env, Disa=
sContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc-&gt;mo=
de =3D=3D CRISV10_MODE_AUTOINC)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0insn_len +=3D size;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_preg_TN(=
dc, dc-&gt;dst, tcg_const_tl(dc-&gt;pc + insn_len));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl=
(dc-&gt;pc + insn_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_preg_TN(=
dc, dc-&gt;dst, c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;jmp_pc=
 =3D imm;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_prepare_=
jmp(dc, JMP_DIRECT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delaye=
d_branch--; /* v10 has no dslot here.=C2=A0 */<br>
@@ -1147,7 +1165,9 @@ static unsigned int dec10_ind(CPUCRISState *env, Disa=
sContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0LOG_DIS(&quot;break %d\n&quot;, dc-&gt;src);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cris_evaluate_flags(dc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tcg_gen_movi_tl(env_pc, dc-&gt;pc + 2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_mov_env_TN(trap_vector, tcg_const_tl(dc-&gt;src + 2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =
=3D tcg_const_tl(dc-&gt;src + 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_ge=
n_mov_env_TN(trap_vector, c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_=
temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0t_gen_raise_exception(EXCP_BREAK);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dc-&gt;is_jmp =3D DISAS_UPDATE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return insn_len;<br>
@@ -1155,7 +1175,9 @@ static unsigned int dec10_ind(CPUCRISState *env, Disa=
sContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot=
;%d: jump.%d %d r%d r%d\n&quot;, __LINE__, size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dc-&gt;opcode, dc-&gt;src, dc-&gt;dst);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t[0] =3D tcg_=
temp_new();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_preg_TN(=
dc, dc-&gt;dst, tcg_const_tl(dc-&gt;pc + insn_len));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl=
(dc-&gt;pc + insn_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_preg_TN(=
dc, dc-&gt;dst, c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crisv10_prepa=
re_memaddr(dc, t[0], size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_load(dc, =
env_btarget, t[0], 4, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insn_len +=3D=
 crisv10_post_memaddr(dc, size);<br>
@@ -1178,7 +1200,9 @@ static unsigned int dec10_ind(CPUCRISState *env, Disa=
sContext *dc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG_DIS(&quot;jmp pc=3D%x o=
pcode=3D%d r%d r%d\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dc-&gt;pc, dc-&gt;opcode, dc-&gt;dst, dc-&gt;src);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_tl(env_btarget,=
 cpu_R[dc-&gt;src]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;dst=
, tcg_const_tl(dc-&gt;pc + insn_len));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D tcg_const_tl(dc-&gt;pc + i=
nsn_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_gen_mov_preg_TN(dc, dc-&gt;dst=
, c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cris_prepare_jmp(dc, JMP_IN=
DIRECT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;delayed_branch--; /*=
 v10 has no dslot here.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.24.3 (Apple Git-128)<br>
<br>
</blockquote></div></div></div>

--00000000000019bc2605bbb39a68--


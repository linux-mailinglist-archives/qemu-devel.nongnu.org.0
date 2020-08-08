Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A55923F7F0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Aug 2020 16:19:50 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k4PhM-00017X-Ob
	for lists+qemu-devel@lfdr.de; Sat, 08 Aug 2020 10:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k4Pgb-0000hf-9O; Sat, 08 Aug 2020 10:19:01 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k4PgW-0008Up-Lb; Sat, 08 Aug 2020 10:19:01 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06608327|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0238238-0.0022386-0.973938;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=6; RT=6; SR=0; TI=SMTPD_---.IEUF7SC_1596896316; 
Received: from 30.15.222.6(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.IEUF7SC_1596896316)
 by smtp.aliyun-inc.com(10.147.42.22); Sat, 08 Aug 2020 22:18:36 +0800
Subject: Re: [PATCH v2 5/7] target/riscv: Check nanboxed inputs in
 trans_rvf.inc.c
To: Chih-Min Chao <chihmin.chao@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-6-richard.henderson@linaro.org>
 <CAEiOBXVac0bFSZCrh_rhZbLVC7DGVwBe+D6YF90HQy1K-8wfYQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <560581be-926e-c303-85a6-b15d4c187ad6@c-sky.com>
Date: Sat, 8 Aug 2020 22:18:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEiOBXVac0bFSZCrh_rhZbLVC7DGVwBe+D6YF90HQy1K-8wfYQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------C8E50AE94484F7970774D672"
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/08 10:18:38
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------C8E50AE94484F7970774D672
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2020/8/8 4:24, Chih-Min Chao wrote:
> On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson 
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> 
> wrote:
>
>     If a 32-bit input is not properly nanboxed, then the input is replaced
>     with the default qnan.  The only inline expansion is for the
>     sign-changing
>     set of instructions: FSGNJ.S, FSGNJX.S, FSGNJN.S.
>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     ---
>      target/riscv/insn_trans/trans_rvf.inc.c | 71
>     +++++++++++++++++++------
>      target/riscv/translate.c                | 18 +++++++
>      2 files changed, 73 insertions(+), 16 deletions(-)
>
>     diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
>     b/target/riscv/insn_trans/trans_rvf.inc.c
>     index 264d3139f1..f9a9e0643a 100644
>     --- a/target/riscv/insn_trans/trans_rvf.inc.c
>     +++ b/target/riscv/insn_trans/trans_rvf.inc.c
>     @@ -161,47 +161,86 @@ static bool trans_fsgnj_s(DisasContext *ctx,
>     arg_fsgnj_s *a)
>      {
>          REQUIRE_FPU;
>          REQUIRE_EXT(ctx, RVF);
>     +
>          if (a->rs1 == a->rs2) { /* FMOV */
>     -        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
>     +        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
>          } else { /* FSGNJ */
>     -        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
>     cpu_fpr[a->rs1],
>     -                            0, 31);
>     +        TCGv_i64 rs1 = tcg_temp_new_i64();
>     +        TCGv_i64 rs2 = tcg_temp_new_i64();
>     +
>     +        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
>     +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
>     +
>     +        /* This formulation retains the nanboxing of rs2. */
>     +        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
>     +        tcg_temp_free_i64(rs1);
>     +        tcg_temp_free_i64(rs2);
>          }
>     -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>          mark_fs_dirty(ctx);
>          return true;
>      }
>
>      static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
>      {
>     +    TCGv_i64 rs1, rs2, mask;
>     +
>          REQUIRE_FPU;
>          REQUIRE_EXT(ctx, RVF);
>     +
>     +    rs1 = tcg_temp_new_i64();
>     +    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
>     +
>          if (a->rs1 == a->rs2) { /* FNEG */
>     -        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT32_MIN);
>     +        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(31,
>     1));
>          } else {
>     -        TCGv_i64 t0 = tcg_temp_new_i64();
>     -        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
>     -        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1],
>     0, 31);
>     -        tcg_temp_free_i64(t0);
>     +        rs2 = tcg_temp_new_i64();
>     +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
>     +
>     +        /*
>     +         * Replace bit 31 in rs1 with inverse in rs2.
>     +         * This formulation retains the nanboxing of rs1.
>     +         */
>     +        mask = tcg_const_i64(~MAKE_64BIT_MASK(31, 1));
>     +        tcg_gen_andc_i64(rs2, mask, rs2);
>
>
> should be
>               tcg_gen_not_i64(rs2, rs2);         // forget to inverse rs2
>               tcg_gen_andc_i64(rs2, rs2, mask);  //mask needs to be 
> inverted to get only sign
Hi Chih-Min，

Thanks for pointing it out. It's a bug here. However, I think it should be

tcg_gen_andc_i64(rs2, rs2, mask);  // only get rs2 bit 31

tcg_gen_not_i64(rs2, rs2);  // inverse rs2


Best Regards,
Zhiwei
>
>  Chih-Min Chao
>
>     +        tcg_gen_and_i64(rs1, mask, rs1);
>     +        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
>     +
>     +        tcg_temp_free_i64(mask);
>     +        tcg_temp_free_i64(rs2);
>          }
>     -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>     +    tcg_temp_free_i64(rs1);
>     +
>          mark_fs_dirty(ctx);
>          return true;
>      }
>
>      static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
>      {
>     +    TCGv_i64 rs1, rs2;
>     +
>          REQUIRE_FPU;
>          REQUIRE_EXT(ctx, RVF);
>     +
>     +    rs1 = tcg_temp_new_i64();
>     +    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
>     +
>          if (a->rs1 == a->rs2) { /* FABS */
>     -        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1],
>     ~INT32_MIN);
>     +        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1,
>     ~MAKE_64BIT_MASK(31, 1));
>          } else {
>     -        TCGv_i64 t0 = tcg_temp_new_i64();
>     -        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT32_MIN);
>     -        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
>     -        tcg_temp_free_i64(t0);
>     +        rs2 = tcg_temp_new_i64();
>     +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
>     +
>     +        /*
>     +         * Xor bit 31 in rs1 with that in rs2.
>     +         * This formulation retains the nanboxing of rs1.
>     +         */
>     +        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));
>     +        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
>     +
>     +        tcg_temp_free_i64(rs2);
>          }
>     -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>     +    tcg_temp_free_i64(rs1);
>     +
>          mark_fs_dirty(ctx);
>          return true;
>      }
>     diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>     index 12a746da97..bf35182776 100644
>     --- a/target/riscv/translate.c
>     +++ b/target/riscv/translate.c
>     @@ -101,6 +101,24 @@ static void gen_nanbox_s(TCGv_i64 out,
>     TCGv_i64 in)
>          tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
>      }
>
>     +/*
>     + * A narrow n-bit operation, where n < FLEN, checks that input
>     operands
>     + * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
>     + * If so, the least-significant bits of the input are used,
>     otherwise the
>     + * input value is treated as an n-bit canonical NaN (v2.2 section
>     9.2).
>     + *
>     + * Here, the result is always nan-boxed, even the canonical nan.
>     + */
>     +static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>     +{
>     +    TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
>     +    TCGv_i64 t_nan = tcg_const_i64(0xffffffff7fc00000ull);
>     +
>     +    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
>     +    tcg_temp_free_i64(t_max);
>     +    tcg_temp_free_i64(t_nan);
>     +}
>     +
>      static void generate_exception(DisasContext *ctx, int excp)
>      {
>          tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>     -- 
>     2.25.1
>
>


--------------C8E50AE94484F7970774D672
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020/8/8 4:24, Chih-Min Chao wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEiOBXVac0bFSZCrh_rhZbLVC7DGVwBe+D6YF90HQy1K-8wfYQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div>
            <div dir="ltr" class="gmail_signature"
              data-smartmail="gmail_signature">
              <div dir="ltr">On Fri, Jul 24, 2020 at 8:28 AM Richard
                Henderson &lt;<a
                  href="mailto:richard.henderson@linaro.org"
                  moz-do-not-send="true">richard.henderson@linaro.org</a>&gt;
                wrote:<br>
              </div>
            </div>
          </div>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">If a 32-bit input is not
            properly nanboxed, then the input is replaced<br>
            with the default qnan.  The only inline expansion is for the
            sign-changing<br>
            set of instructions: FSGNJ.S, FSGNJX.S, FSGNJN.S.<br>
            <br>
            Signed-off-by: Richard Henderson &lt;<a
              href="mailto:richard.henderson@linaro.org" target="_blank"
              moz-do-not-send="true">richard.henderson@linaro.org</a>&gt;<br>
            ---<br>
             target/riscv/insn_trans/trans_rvf.inc.c | 71
            +++++++++++++++++++------<br>
             target/riscv/translate.c                | 18 +++++++<br>
             2 files changed, 73 insertions(+), 16 deletions(-)<br>
            <br>
            diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
            b/target/riscv/insn_trans/trans_rvf.inc.c<br>
            index 264d3139f1..f9a9e0643a 100644<br>
            --- a/target/riscv/insn_trans/trans_rvf.inc.c<br>
            +++ b/target/riscv/insn_trans/trans_rvf.inc.c<br>
            @@ -161,47 +161,86 @@ static bool trans_fsgnj_s(DisasContext
            *ctx, arg_fsgnj_s *a)<br>
             {<br>
                 REQUIRE_FPU;<br>
                 REQUIRE_EXT(ctx, RVF);<br>
            +<br>
                 if (a-&gt;rs1 == a-&gt;rs2) { /* FMOV */<br>
            -        tcg_gen_mov_i64(cpu_fpr[a-&gt;rd],
            cpu_fpr[a-&gt;rs1]);<br>
            +        gen_check_nanbox_s(cpu_fpr[a-&gt;rd],
            cpu_fpr[a-&gt;rs1]);<br>
                 } else { /* FSGNJ */<br>
            -        tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd],
            cpu_fpr[a-&gt;rs2], cpu_fpr[a-&gt;rs1],<br>
            -                            0, 31);<br>
            +        TCGv_i64 rs1 = tcg_temp_new_i64();<br>
            +        TCGv_i64 rs2 = tcg_temp_new_i64();<br>
            +<br>
            +        gen_check_nanbox_s(rs1, cpu_fpr[a-&gt;rs1]);<br>
            +        gen_check_nanbox_s(rs2, cpu_fpr[a-&gt;rs2]);<br>
            +<br>
            +        /* This formulation retains the nanboxing of rs2.
            */<br>
            +        tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], rs2, rs1, 0,
            31);<br>
            +        tcg_temp_free_i64(rs1);<br>
            +        tcg_temp_free_i64(rs2);<br>
                 }<br>
            -    gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
                 mark_fs_dirty(ctx);<br>
                 return true;<br>
             }<br>
            <br>
             static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s
            *a)<br>
             {<br>
            +    TCGv_i64 rs1, rs2, mask;<br>
            +<br>
                 REQUIRE_FPU;<br>
                 REQUIRE_EXT(ctx, RVF);<br>
            +<br>
            +    rs1 = tcg_temp_new_i64();<br>
            +    gen_check_nanbox_s(rs1, cpu_fpr[a-&gt;rs1]);<br>
            +<br>
                 if (a-&gt;rs1 == a-&gt;rs2) { /* FNEG */<br>
            -        tcg_gen_xori_i64(cpu_fpr[a-&gt;rd],
            cpu_fpr[a-&gt;rs1], INT32_MIN);<br>
            +        tcg_gen_xori_i64(cpu_fpr[a-&gt;rd], rs1,
            MAKE_64BIT_MASK(31, 1));<br>
                 } else {<br>
            -        TCGv_i64 t0 = tcg_temp_new_i64();<br>
            -        tcg_gen_not_i64(t0, cpu_fpr[a-&gt;rs2]);<br>
            -        tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], t0,
            cpu_fpr[a-&gt;rs1], 0, 31);<br>
            -        tcg_temp_free_i64(t0);<br>
            +        rs2 = tcg_temp_new_i64();<br>
            +        gen_check_nanbox_s(rs2, cpu_fpr[a-&gt;rs2]);<br>
            +<br>
            +        /*<br>
            +         * Replace bit 31 in rs1 with inverse in rs2.<br>
            +         * This formulation retains the nanboxing of rs1.<br>
            +         */<br>
            +        mask = tcg_const_i64(~MAKE_64BIT_MASK(31, 1));<br>
            +        tcg_gen_andc_i64(rs2, mask, rs2);<br>
          </blockquote>
          <div><br>
          </div>
          <div>should be </div>
          <div>              tcg_gen_not_i64(rs2, rs2);         //
            forget to inverse rs2</div>
          <div>              tcg_gen_andc_i64(rs2, rs2, mask);  //mask
            needs to be inverted to get only sign</div>
        </div>
      </div>
    </blockquote>
    Hi Chih-Min，<br>
    <br>
    Thanks for pointing it out. It's a bug here. However, I think it
    should be <br>
    <br>
    <pre>tcg_gen_andc_i64(rs2, rs2, mask);  // only get rs2 bit 31</pre>
    <pre>tcg_gen_not_i64(rs2, rs2);  // inverse rs2</pre>
    <br>
    Best Regards,<br>
    Zhiwei<br>
    <blockquote type="cite"
cite="mid:CAEiOBXVac0bFSZCrh_rhZbLVC7DGVwBe+D6YF90HQy1K-8wfYQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div> Chih-Min Chao<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +        tcg_gen_and_i64(rs1, mask, rs1);<br>
            +        tcg_gen_or_i64(cpu_fpr[a-&gt;rd], rs1, rs2);<br>
            +<br>
            +        tcg_temp_free_i64(mask);<br>
            +        tcg_temp_free_i64(rs2);<br>
                 }<br>
            -    gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
            +    tcg_temp_free_i64(rs1);<br>
            +<br>
                 mark_fs_dirty(ctx);<br>
                 return true;<br>
             }<br>
            <br>
             static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s
            *a)<br>
             {<br>
            +    TCGv_i64 rs1, rs2;<br>
            +<br>
                 REQUIRE_FPU;<br>
                 REQUIRE_EXT(ctx, RVF);<br>
            +<br>
            +    rs1 = tcg_temp_new_i64();<br>
            +    gen_check_nanbox_s(rs1, cpu_fpr[a-&gt;rs1]);<br>
            +<br>
                 if (a-&gt;rs1 == a-&gt;rs2) { /* FABS */<br>
            -        tcg_gen_andi_i64(cpu_fpr[a-&gt;rd],
            cpu_fpr[a-&gt;rs1], ~INT32_MIN);<br>
            +        tcg_gen_andi_i64(cpu_fpr[a-&gt;rd], rs1,
            ~MAKE_64BIT_MASK(31, 1));<br>
                 } else {<br>
            -        TCGv_i64 t0 = tcg_temp_new_i64();<br>
            -        tcg_gen_andi_i64(t0, cpu_fpr[a-&gt;rs2],
            INT32_MIN);<br>
            -        tcg_gen_xor_i64(cpu_fpr[a-&gt;rd],
            cpu_fpr[a-&gt;rs1], t0);<br>
            -        tcg_temp_free_i64(t0);<br>
            +        rs2 = tcg_temp_new_i64();<br>
            +        gen_check_nanbox_s(rs2, cpu_fpr[a-&gt;rs2]);<br>
            +<br>
            +        /*<br>
            +         * Xor bit 31 in rs1 with that in rs2.<br>
            +         * This formulation retains the nanboxing of rs1.<br>
            +         */<br>
            +        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));<br>
            +        tcg_gen_xor_i64(cpu_fpr[a-&gt;rd], rs1, rs2);<br>
            +<br>
            +        tcg_temp_free_i64(rs2);<br>
                 }<br>
            -    gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
            +    tcg_temp_free_i64(rs1);<br>
            +<br>
                 mark_fs_dirty(ctx);<br>
                 return true;<br>
             }<br>
            diff --git a/target/riscv/translate.c
            b/target/riscv/translate.c<br>
            index 12a746da97..bf35182776 100644<br>
            --- a/target/riscv/translate.c<br>
            +++ b/target/riscv/translate.c<br>
            @@ -101,6 +101,24 @@ static void gen_nanbox_s(TCGv_i64 out,
            TCGv_i64 in)<br>
                 tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));<br>
             }<br>
            <br>
            +/*<br>
            + * A narrow n-bit operation, where n &lt; FLEN, checks that
            input operands<br>
            + * are correctly Nan-boxed, i.e., all upper FLEN - n bits
            are 1.<br>
            + * If so, the least-significant bits of the input are used,
            otherwise the<br>
            + * input value is treated as an n-bit canonical NaN (v2.2
            section 9.2).<br>
            + *<br>
            + * Here, the result is always nan-boxed, even the canonical
            nan.<br>
            + */<br>
            +static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)<br>
            +{<br>
            +    TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);<br>
            +    TCGv_i64 t_nan = tcg_const_i64(0xffffffff7fc00000ull);<br>
            +<br>
            +    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in,
            t_nan);<br>
            +    tcg_temp_free_i64(t_max);<br>
            +    tcg_temp_free_i64(t_nan);<br>
            +}<br>
            +<br>
             static void generate_exception(DisasContext *ctx, int excp)<br>
             {<br>
                 tcg_gen_movi_tl(cpu_pc, ctx-&gt;base.pc_next);<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------C8E50AE94484F7970774D672--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24B20582E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 19:03:05 +0200 (CEST)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnmK6-0000qg-IF
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 13:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jnmIn-0007g5-9d; Tue, 23 Jun 2020 13:01:41 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jnmIi-0001kT-2n; Tue, 23 Jun 2020 13:01:41 -0400
Received: by mail-io1-xd41.google.com with SMTP id s18so24558884ioe.2;
 Tue, 23 Jun 2020 10:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pMXYaQ3YX/SDju87HBLF7UHkAgj0aHsa1T5Syps6TtA=;
 b=e+b2Vr0/N9+9cdYaHUMAvJqip6qnCsrayoGFtfpl0KPbIOhSM/apGQsnkUNxBZnYvN
 pwBSSPB1vpivFAP/1zJ4EJv/V4yeHiQDbOl2PRqeucLzD3xUlYUOC82/DNQAPnRlA0JT
 EGKJd8rxknAjHySaKBPR46jJpbRqv8z+GbT7ZZxHOnoYg5cnVtRLRMQ0iNNo13CmIi5h
 ItwvQiDfQ5BadU0IAIQqg9jy9A4m1/TyPTYFEOfaKC6VsAWq945Z/c1hJw6hMC++fHZu
 wb3+FbcY0lhSi3fpp92Ljg/MOhC6E3mQ3JJ8Z7dB43Css52oDfiuk1e2W7IXSN+qy209
 S+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pMXYaQ3YX/SDju87HBLF7UHkAgj0aHsa1T5Syps6TtA=;
 b=pb62gGb2bYClYspRl8HgDk/mLcjJFN4sYdcfowx+YtiLHkP7cFvOV4b0e0Xp2YJXrp
 dczVTUhivWF95yPztMcxDndzuxbvWpei9mX63d8xGm27KxkiIZ8ms3GlUwjTcrxZ5f0p
 oQGBhUMhQyz3x0SVB71KGHWtkZVabdV2h9NvJP3cZMg3ITZKh+OaOw2TMAmvf+9AcvXH
 xNchodgFrtkYykFgfID9vD53oEuRbVPzIdl4lgoBD5iX5+zh3lAK/jWYjnGG0odtCOQG
 iPCl//oUroTBRDhyPUvTVfyZZYFjqT97yfZP3GSb9qn4OPIODPJt1tVSpVCCtdj+vs34
 Sdng==
X-Gm-Message-State: AOAM532B7XdAsR9kYS2sOKODqKIl3K+6nkfrfrvEKD9gVvEiATV18w9x
 neCBva7RjJ5TglknRo9nObS4wt0vfYsjufg83DY=
X-Google-Smtp-Source: ABdhPJxbED1Y0M/uN9/3cyQ+2TDxuzhd0NT96R3O2l/x0bz5VKszUqZ0fJ9Macq8QJkLrg4tVnu6eEOT2Pv8t3BdBx0=
X-Received: by 2002:a6b:6412:: with SMTP id t18mr7560701iog.175.1592931694087; 
 Tue, 23 Jun 2020 10:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200620043701.1323-1-zhiwei_liu@c-sky.com>
 <20200620043701.1323-7-zhiwei_liu@c-sky.com>
In-Reply-To: <20200620043701.1323-7-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jun 2020 09:52:01 -0700
Message-ID: <CAKmqyKMN_PMJrwT3HvWryWaaWHhbQZkhO3y-NVk_OyEfgT8H4g@mail.gmail.com>
Subject: Re: [PATCH v10 06/61] target/riscv: add vector stride load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 19, 2020 at 9:49 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Vector strided operations access the first memory element at the base add=
ress,
> and then access subsequent elements at address increments given by the by=
te
> offset contained in the x register specified by rs2.
>
> Vector unit-stride operations access elements stored contiguously in memo=
ry
> starting from the base effective address. It can been seen as a special
> case of strided operations.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   | 105 ++++++
>  target/riscv/insn32.decode              |  32 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 355 ++++++++++++++++++++
>  target/riscv/internals.h                |   5 +
>  target/riscv/translate.c                |   7 +
>  target/riscv/vector_helper.c            | 410 ++++++++++++++++++++++++
>  6 files changed, 914 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 8e81ff440b..f03b3d52f5 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -84,3 +84,108 @@ DEF_HELPER_1(hyp_tlb_flush, void, env)
>
>  /* Vector functions */
>  DEF_HELPER_3(vsetvl, tl, env, tl, tl)
> +DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlb_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlh_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlh_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlh_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlh_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlh_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlh_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlw_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlw_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlw_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlw_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_b, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_b_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_b, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_b_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlbu_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlhu_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlhu_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlhu_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlhu_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlhu_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlhu_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlwu_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlwu_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlwu_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlwu_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_b, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_b_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsb_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsh_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsh_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsh_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsh_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsh_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsh_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsw_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsw_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsw_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsw_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_b, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_b_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_h, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_h_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_w, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_w_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_d, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse_v_d_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_6(vlsb_v_b, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsb_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsb_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsb_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsh_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsh_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsh_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsw_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsw_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse_v_b, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsbu_v_b, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsbu_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsbu_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlsbu_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlshu_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlshu_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlshu_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlswu_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlswu_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssb_v_b, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssb_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssb_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssb_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssh_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssh_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssh_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssw_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vssw_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse_v_b, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse_v_h, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse_v_w, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse_v_d, void, ptr, ptr, tl, tl, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 1916cf331d..58b95792e6 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -25,6 +25,7 @@
>  %sh10    20:10
>  %csr    20:12
>  %rm     12:3
> +%nf     29:3                     !function=3Dex_plus_1
>
>  # immediates:
>  %imm_i    20:s12
> @@ -43,6 +44,8 @@
>  &u    imm rd
>  &shift     shamt rs1 rd
>  &atomic    aq rl rs2 rs1 rd
> +&r2nfvm    vm rd rs1 nf
> +&rnfvm     vm rd rs1 rs2 nf
>
>  # Formats 32:
>  @r       .......   ..... ..... ... ..... ....... &r                %rs2 =
%rs1 %rd
> @@ -62,6 +65,8 @@
>  @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
>  @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
>  @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
> +@r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
> +@r_nfvm  ... ... vm:1 ..... ..... ... ..... ....... &rnfvm %nf %rs2 %rs1=
 %rd
>  @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
>
>  @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
> @@ -212,5 +217,32 @@ hfence_gvma 0110001  .....  ..... 000 00000 1110011 =
@hfence_gvma
>  hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
>
>  # *** RV32V Extension ***
> +
> +# *** Vector loads and stores are encoded within LOADFP/STORE-FP ***
> +vlb_v      ... 100 . 00000 ..... 000 ..... 0000111 @r2_nfvm
> +vlh_v      ... 100 . 00000 ..... 101 ..... 0000111 @r2_nfvm
> +vlw_v      ... 100 . 00000 ..... 110 ..... 0000111 @r2_nfvm
> +vle_v      ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
> +vlbu_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
> +vlhu_v     ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
> +vlwu_v     ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
> +vsb_v      ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
> +vsh_v      ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
> +vsw_v      ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
> +vse_v      ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
> +
> +vlsb_v     ... 110 . ..... ..... 000 ..... 0000111 @r_nfvm
> +vlsh_v     ... 110 . ..... ..... 101 ..... 0000111 @r_nfvm
> +vlsw_v     ... 110 . ..... ..... 110 ..... 0000111 @r_nfvm
> +vlse_v     ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
> +vlsbu_v    ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
> +vlshu_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
> +vlswu_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
> +vssb_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
> +vssh_v     ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
> +vssw_v     ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
> +vsse_v     ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
> +
> +# *** new major opcode OP-V ***
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_=
trans/trans_rvv.inc.c
> index c82fdf013e..f9950ad5a0 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -15,6 +15,9 @@
>   * You should have received a copy of the GNU General Public License alo=
ng with
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
> +#include "tcg/tcg-op-gvec.h"
> +#include "tcg/tcg-gvec-desc.h"
> +#include "internals.h"
>
>  static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>  {
> @@ -77,3 +80,355 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vset=
vli *a)
>      tcg_temp_free(dst);
>      return true;
>  }
> +
> +/* vector register offset from env */
> +static uint32_t vreg_ofs(DisasContext *s, int reg)
> +{
> +    return offsetof(CPURISCVState, vreg) + reg * s->vlen / 8;
> +}
> +
> +/* check functions */
> +
> +/*
> + * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
> + * So RVV is also be checked in this function.
> + */
> +static bool vext_check_isa_ill(DisasContext *s)
> +{
> +    return !s->vill;
> +}
> +
> +/*
> + * There are two rules check here.
> + *
> + * 1. Vector register numbers are multiples of LMUL. (Section 3.2)
> + *
> + * 2. For all widening instructions, the destination LMUL value must als=
o be
> + *    a supported LMUL value. (Section 11.2=EF=BC=89

There is some strange UTF encoding on this line according to
checkpatch. Do you mind running checkpatch on the patches and fix any
issues?

checkpatch seems to have some false positives (it confusing pointer *
and multiply *) they don't need to be fixed.

Alistair

> + */
> +static bool vext_check_reg(DisasContext *s, uint32_t reg, bool widen)
> +{
> +    /*
> +     * The destination vector register group results are arranged as if =
both
> +     * SEW and LMUL were at twice their current settings. (Section 11.2)=
.
> +     */
> +    int legal =3D widen ? 2 << s->lmul : 1 << s->lmul;
> +
> +    return !((s->lmul =3D=3D 0x3 && widen) || (reg % legal));
> +}
> +
> +/*
> + * There are two rules check here.
> + *
> + * 1. The destination vector register group for a masked vector instruct=
ion can
> + *    only overlap the source mask register (v0) when LMUL=3D1. (Section=
 5.3)
> + *
> + * 2. In widen instructions and some other insturctions, like vslideup.v=
x,
> + *    there is no need to check whether LMUL=3D1.
> + */
> +static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool v=
m,
> +    bool force)
> +{
> +    return (vm !=3D 0 || vd !=3D 0) || (!force && (s->lmul =3D=3D 0));
> +}
> +
> +/* The LMUL setting must be such that LMUL * NFIELDS <=3D 8. (Section 7.=
8) */
> +static bool vext_check_nf(DisasContext *s, uint32_t nf)
> +{
> +    return (1 << s->lmul) * nf <=3D 8;
> +}
> +
> +/* common translation macro */
> +#define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
> +static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
> +{                                                          \
> +    if (CHECK(s, a)) {                                     \
> +        return OP(s, a, SEQ);                              \
> +    }                                                      \
> +    return false;                                          \
> +}
> +
> +/*
> + *** unit stride load and store
> + */
> +typedef void gen_helper_ldst_us(TCGv_ptr, TCGv_ptr, TCGv,
> +                                TCGv_env, TCGv_i32);
> +
> +static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
> +                          gen_helper_ldst_us *fn, DisasContext *s)
> +{
> +    TCGv_ptr dest, mask;
> +    TCGv base;
> +    TCGv_i32 desc;
> +
> +    TCGLabel *over =3D gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +
> +    dest =3D tcg_temp_new_ptr();
> +    mask =3D tcg_temp_new_ptr();
> +    base =3D tcg_temp_new();
> +
> +    /*
> +     * As simd_desc supports at most 256 bytes, and in this implementati=
on,
> +     * the max vector group length is 2048 bytes. So split it into two p=
arts.
> +     *
> +     * The first part is vlen in bytes, encoded in maxsz of simd_desc.
> +     * The second part is lmul, encoded in data of simd_desc.
> +     */
> +    desc =3D tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +
> +    gen_get_gpr(base, rs1);
> +    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> +    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> +
> +    fn(dest, mask, base, cpu_env, desc);
> +
> +    tcg_temp_free_ptr(dest);
> +    tcg_temp_free_ptr(mask);
> +    tcg_temp_free(base);
> +    tcg_temp_free_i32(desc);
> +    gen_set_label(over);
> +    return true;
> +}
> +
> +static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
> +{
> +    uint32_t data =3D 0;
> +    gen_helper_ldst_us *fn;
> +    static gen_helper_ldst_us * const fns[2][7][4] =3D {
> +        /* masked unit stride load */
> +        { { gen_helper_vlb_v_b_mask,  gen_helper_vlb_v_h_mask,
> +            gen_helper_vlb_v_w_mask,  gen_helper_vlb_v_d_mask },
> +          { NULL,                     gen_helper_vlh_v_h_mask,
> +            gen_helper_vlh_v_w_mask,  gen_helper_vlh_v_d_mask },
> +          { NULL,                     NULL,
> +            gen_helper_vlw_v_w_mask,  gen_helper_vlw_v_d_mask },
> +          { gen_helper_vle_v_b_mask,  gen_helper_vle_v_h_mask,
> +            gen_helper_vle_v_w_mask,  gen_helper_vle_v_d_mask },
> +          { gen_helper_vlbu_v_b_mask, gen_helper_vlbu_v_h_mask,
> +            gen_helper_vlbu_v_w_mask, gen_helper_vlbu_v_d_mask },
> +          { NULL,                     gen_helper_vlhu_v_h_mask,
> +            gen_helper_vlhu_v_w_mask, gen_helper_vlhu_v_d_mask },
> +          { NULL,                     NULL,
> +            gen_helper_vlwu_v_w_mask, gen_helper_vlwu_v_d_mask } },
> +        /* unmasked unit stride load */
> +        { { gen_helper_vlb_v_b,  gen_helper_vlb_v_h,
> +            gen_helper_vlb_v_w,  gen_helper_vlb_v_d },
> +          { NULL,                gen_helper_vlh_v_h,
> +            gen_helper_vlh_v_w,  gen_helper_vlh_v_d },
> +          { NULL,                NULL,
> +            gen_helper_vlw_v_w,  gen_helper_vlw_v_d },
> +          { gen_helper_vle_v_b,  gen_helper_vle_v_h,
> +            gen_helper_vle_v_w,  gen_helper_vle_v_d },
> +          { gen_helper_vlbu_v_b, gen_helper_vlbu_v_h,
> +            gen_helper_vlbu_v_w, gen_helper_vlbu_v_d },
> +          { NULL,                gen_helper_vlhu_v_h,
> +            gen_helper_vlhu_v_w, gen_helper_vlhu_v_d },
> +          { NULL,                NULL,
> +            gen_helper_vlwu_v_w, gen_helper_vlwu_v_d } }
> +    };
> +
> +    fn =3D  fns[a->vm][seq][s->sew];
> +    if (fn =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
> +    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> +    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data =3D FIELD_DP32(data, VDATA, NF, a->nf);
> +    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
> +}
> +
> +static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
> +{
> +    return (vext_check_isa_ill(s) &&
> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_nf(s, a->nf));
> +}
> +
> +GEN_VEXT_TRANS(vlb_v, 0, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vlh_v, 1, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vlw_v, 2, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vle_v, 3, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vlbu_v, 4, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vlhu_v, 5, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vlwu_v, 6, r2nfvm, ld_us_op, ld_us_check)
> +
> +static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
> +{
> +    uint32_t data =3D 0;
> +    gen_helper_ldst_us *fn;
> +    static gen_helper_ldst_us * const fns[2][4][4] =3D {
> +        /* masked unit stride load and store */
> +        { { gen_helper_vsb_v_b_mask,  gen_helper_vsb_v_h_mask,
> +            gen_helper_vsb_v_w_mask,  gen_helper_vsb_v_d_mask },
> +          { NULL,                     gen_helper_vsh_v_h_mask,
> +            gen_helper_vsh_v_w_mask,  gen_helper_vsh_v_d_mask },
> +          { NULL,                     NULL,
> +            gen_helper_vsw_v_w_mask,  gen_helper_vsw_v_d_mask },
> +          { gen_helper_vse_v_b_mask,  gen_helper_vse_v_h_mask,
> +            gen_helper_vse_v_w_mask,  gen_helper_vse_v_d_mask } },
> +        /* unmasked unit stride store */
> +        { { gen_helper_vsb_v_b,  gen_helper_vsb_v_h,
> +            gen_helper_vsb_v_w,  gen_helper_vsb_v_d },
> +          { NULL,                gen_helper_vsh_v_h,
> +            gen_helper_vsh_v_w,  gen_helper_vsh_v_d },
> +          { NULL,                NULL,
> +            gen_helper_vsw_v_w,  gen_helper_vsw_v_d },
> +          { gen_helper_vse_v_b,  gen_helper_vse_v_h,
> +            gen_helper_vse_v_w,  gen_helper_vse_v_d } }
> +    };
> +
> +    fn =3D  fns[a->vm][seq][s->sew];
> +    if (fn =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
> +    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> +    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data =3D FIELD_DP32(data, VDATA, NF, a->nf);
> +    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
> +}
> +
> +static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
> +{
> +    return (vext_check_isa_ill(s) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_nf(s, a->nf));
> +}
> +
> +GEN_VEXT_TRANS(vsb_v, 0, r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vsh_v, 1, r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vsw_v, 2, r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vse_v, 3, r2nfvm, st_us_op, st_us_check)
> +
> +/*
> + *** stride load and store
> + */
> +typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_ptr, TCGv,
> +                                    TCGv, TCGv_env, TCGv_i32);
> +
> +static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
> +                              uint32_t data, gen_helper_ldst_stride *fn,
> +                              DisasContext *s)
> +{
> +    TCGv_ptr dest, mask;
> +    TCGv base, stride;
> +    TCGv_i32 desc;
> +
> +    TCGLabel *over =3D gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +
> +    dest =3D tcg_temp_new_ptr();
> +    mask =3D tcg_temp_new_ptr();
> +    base =3D tcg_temp_new();
> +    stride =3D tcg_temp_new();
> +    desc =3D tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +
> +    gen_get_gpr(base, rs1);
> +    gen_get_gpr(stride, rs2);
> +    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> +    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> +
> +    fn(dest, mask, base, stride, cpu_env, desc);
> +
> +    tcg_temp_free_ptr(dest);
> +    tcg_temp_free_ptr(mask);
> +    tcg_temp_free(base);
> +    tcg_temp_free(stride);
> +    tcg_temp_free_i32(desc);
> +    gen_set_label(over);
> +    return true;
> +}
> +
> +static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +{
> +    uint32_t data =3D 0;
> +    gen_helper_ldst_stride *fn;
> +    static gen_helper_ldst_stride * const fns[7][4] =3D {
> +        { gen_helper_vlsb_v_b,  gen_helper_vlsb_v_h,
> +          gen_helper_vlsb_v_w,  gen_helper_vlsb_v_d },
> +        { NULL,                 gen_helper_vlsh_v_h,
> +          gen_helper_vlsh_v_w,  gen_helper_vlsh_v_d },
> +        { NULL,                 NULL,
> +          gen_helper_vlsw_v_w,  gen_helper_vlsw_v_d },
> +        { gen_helper_vlse_v_b,  gen_helper_vlse_v_h,
> +          gen_helper_vlse_v_w,  gen_helper_vlse_v_d },
> +        { gen_helper_vlsbu_v_b, gen_helper_vlsbu_v_h,
> +          gen_helper_vlsbu_v_w, gen_helper_vlsbu_v_d },
> +        { NULL,                 gen_helper_vlshu_v_h,
> +          gen_helper_vlshu_v_w, gen_helper_vlshu_v_d },
> +        { NULL,                 NULL,
> +          gen_helper_vlswu_v_w, gen_helper_vlswu_v_d },
> +    };
> +
> +    fn =3D  fns[seq][s->sew];
> +    if (fn =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
> +    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> +    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data =3D FIELD_DP32(data, VDATA, NF, a->nf);
> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +}
> +
> +static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
> +{
> +    return (vext_check_isa_ill(s) &&
> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_nf(s, a->nf));
> +}
> +
> +GEN_VEXT_TRANS(vlsb_v, 0, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlsh_v, 1, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlsw_v, 2, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse_v, 3, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlsbu_v, 4, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlshu_v, 5, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlswu_v, 6, rnfvm, ld_stride_op, ld_stride_check)
> +
> +static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +{
> +    uint32_t data =3D 0;
> +    gen_helper_ldst_stride *fn;
> +    static gen_helper_ldst_stride * const fns[4][4] =3D {
> +        /* masked stride store */
> +        { gen_helper_vssb_v_b,  gen_helper_vssb_v_h,
> +          gen_helper_vssb_v_w,  gen_helper_vssb_v_d },
> +        { NULL,                 gen_helper_vssh_v_h,
> +          gen_helper_vssh_v_w,  gen_helper_vssh_v_d },
> +        { NULL,                 NULL,
> +          gen_helper_vssw_v_w,  gen_helper_vssw_v_d },
> +        { gen_helper_vsse_v_b,  gen_helper_vsse_v_h,
> +          gen_helper_vsse_v_w,  gen_helper_vsse_v_d }
> +    };
> +
> +    data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
> +    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
> +    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data =3D FIELD_DP32(data, VDATA, NF, a->nf);
> +    fn =3D  fns[seq][s->sew];
> +    if (fn =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +}
> +
> +static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
> +{
> +    return (vext_check_isa_ill(s) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_nf(s, a->nf));
> +}
> +
> +GEN_VEXT_TRANS(vssb_v, 0, rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vssh_v, 1, rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vssw_v, 2, rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vsse_v, 3, rnfvm, st_stride_op, st_stride_check)
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 22a49af413..3253e73474 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -21,4 +21,9 @@
>
>  #include "hw/registerfields.h"
>
> +/* share data between vector helpers and decode code */
> +FIELD(VDATA, MLEN, 0, 8)
> +FIELD(VDATA, VM, 8, 1)
> +FIELD(VDATA, LMUL, 9, 2)
> +FIELD(VDATA, NF, 11, 4)
>  #endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index cacb9b9cd3..9632e79cf3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -61,6 +61,7 @@ typedef struct DisasContext {
>      uint8_t lmul;
>      uint8_t sew;
>      uint16_t vlen;
> +    uint16_t mlen;
>      bool vl_eq_vlmax;
>  } DisasContext;
>
> @@ -548,6 +549,11 @@ static void decode_RV32_64C(DisasContext *ctx, uint1=
6_t opcode)
>      }
>  }
>
> +static int ex_plus_1(DisasContext *ctx, int nf)
> +{
> +    return nf + 1;
> +}
> +
>  #define EX_SH(amount) \
>      static int ex_shift_##amount(DisasContext *ctx, int imm) \
>      {                                         \
> @@ -785,6 +791,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>      ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
> +    ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>  }
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 40ed0d55e7..27ddb1d0dc 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -18,8 +18,11 @@
>
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> +#include "exec/memop.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> +#include "tcg/tcg-gvec-desc.h"
> +#include "internals.h"
>  #include <math.h>
>
>  target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
> @@ -51,3 +54,410 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, targe=
t_ulong s1,
>      env->vstart =3D 0;
>      return vl;
>  }
> +
> +/*
> + * Note that vector data is stored in host-endian 64-bit chunks,
> + * so addressing units smaller than that needs a host-endian fixup.
> + */
> +#ifdef HOST_WORDS_BIGENDIAN
> +#define H1(x)   ((x) ^ 7)
> +#define H1_2(x) ((x) ^ 6)
> +#define H1_4(x) ((x) ^ 4)
> +#define H2(x)   ((x) ^ 3)
> +#define H4(x)   ((x) ^ 1)
> +#define H8(x)   ((x))
> +#else
> +#define H1(x)   (x)
> +#define H1_2(x) (x)
> +#define H1_4(x) (x)
> +#define H2(x)   (x)
> +#define H4(x)   (x)
> +#define H8(x)   (x)
> +#endif
> +
> +static inline uint32_t vext_nf(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, NF);
> +}
> +
> +static inline uint32_t vext_mlen(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, MLEN);
> +}
> +
> +static inline uint32_t vext_vm(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VM);
> +}
> +
> +static inline uint32_t vext_lmul(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, LMUL);
> +}
> +
> +/*
> + * Get vector group length in bytes. Its range is [64, 2048].
> + *
> + * As simd_desc support at most 256, the max vlen is 512 bits.
> + * So vlen in bytes is encoded as maxsz.
> + */
> +static inline uint32_t vext_maxsz(uint32_t desc)
> +{
> +    return simd_maxsz(desc) << vext_lmul(desc);
> +}
> +
> +/*
> + * This function checks watchpoint before real load operation.
> + *
> + * In softmmu mode, the TLB API probe_access is enough for watchpoint ch=
eck.
> + * In user mode, there is no watchpoint support now.
> + *
> + * It will trigger an exception if there is no mapping in TLB
> + * and page table walk can't fill the TLB entry. Then the guest
> + * software can return here after process the exception or never return.
> + */
> +static void probe_pages(CPURISCVState *env, target_ulong addr,
> +                        target_ulong len, uintptr_t ra,
> +                        MMUAccessType access_type)
> +{
> +    target_ulong pagelen =3D -(addr | TARGET_PAGE_MASK);
> +    target_ulong curlen =3D MIN(pagelen, len);
> +
> +    probe_access(env, addr, curlen, access_type,
> +                 cpu_mmu_index(env, false), ra);
> +    if (len > curlen) {
> +        addr +=3D curlen;
> +        curlen =3D len - curlen;
> +        probe_access(env, addr, curlen, access_type,
> +                     cpu_mmu_index(env, false), ra);
> +    }
> +}
> +
> +#ifdef HOST_WORDS_BIGENDIAN
> +static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
> +{
> +    /*
> +     * Split the remaining range to two parts.
> +     * The first part is in the last uint64_t unit.
> +     * The second part start from the next uint64_t unit.
> +     */
> +    int part1 =3D 0, part2 =3D tot - cnt;
> +    if (cnt % 8) {
> +        part1 =3D 8 - (cnt % 8);
> +        part2 =3D tot - cnt - part1;
> +        memset(tail & ~(7ULL), 0, part1);
> +        memset((tail + 8) & ~(7ULL), 0, part2);
> +    } else {
> +        memset(tail, 0, part2);
> +    }
> +}
> +#else
> +static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
> +{
> +    memset(tail, 0, tot - cnt);
> +}
> +#endif
> +
> +static void clearb(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
> +{
> +    int8_t *cur =3D ((int8_t *)vd + H1(idx));
> +    vext_clear(cur, cnt, tot);
> +}
> +
> +static void clearh(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
> +{
> +    int16_t *cur =3D ((int16_t *)vd + H2(idx));
> +    vext_clear(cur, cnt, tot);
> +}
> +
> +static void clearl(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
> +{
> +    int32_t *cur =3D ((int32_t *)vd + H4(idx));
> +    vext_clear(cur, cnt, tot);
> +}
> +
> +static void clearq(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
> +{
> +    int64_t *cur =3D (int64_t *)vd + idx;
> +    vext_clear(cur, cnt, tot);
> +}
> +
> +
> +static inline int vext_elem_mask(void *v0, int mlen, int index)
> +{
> +    int idx =3D (index * mlen) / 64;
> +    int pos =3D (index * mlen) % 64;
> +    return (((uint64_t *)v0)[idx] >> pos) & 1;
> +}
> +
> +/* elements operations for load and store */
> +typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
> +                               uint32_t idx, void *vd, uintptr_t retaddr=
);
> +typedef void clear_fn(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot=
);
> +
> +#define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)     \
> +static void NAME(CPURISCVState *env, abi_ptr addr,         \
> +                 uint32_t idx, void *vd, uintptr_t retaddr)\
> +{                                                          \
> +    MTYPE data;                                            \
> +    ETYPE *cur =3D ((ETYPE *)vd + H(idx));                   \
> +    data =3D cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
> +    *cur =3D data;                                           \
> +}                                                          \
> +
> +GEN_VEXT_LD_ELEM(ldb_b, int8_t,  int8_t,  H1, ldsb)
> +GEN_VEXT_LD_ELEM(ldb_h, int8_t,  int16_t, H2, ldsb)
> +GEN_VEXT_LD_ELEM(ldb_w, int8_t,  int32_t, H4, ldsb)
> +GEN_VEXT_LD_ELEM(ldb_d, int8_t,  int64_t, H8, ldsb)
> +GEN_VEXT_LD_ELEM(ldh_h, int16_t, int16_t, H2, ldsw)
> +GEN_VEXT_LD_ELEM(ldh_w, int16_t, int32_t, H4, ldsw)
> +GEN_VEXT_LD_ELEM(ldh_d, int16_t, int64_t, H8, ldsw)
> +GEN_VEXT_LD_ELEM(ldw_w, int32_t, int32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(ldw_d, int32_t, int64_t, H8, ldl)
> +GEN_VEXT_LD_ELEM(lde_b, int8_t,  int8_t,  H1, ldsb)
> +GEN_VEXT_LD_ELEM(lde_h, int16_t, int16_t, H2, ldsw)
> +GEN_VEXT_LD_ELEM(lde_w, int32_t, int32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(lde_d, int64_t, int64_t, H8, ldq)
> +GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  uint8_t,  H1, ldub)
> +GEN_VEXT_LD_ELEM(ldbu_h, uint8_t,  uint16_t, H2, ldub)
> +GEN_VEXT_LD_ELEM(ldbu_w, uint8_t,  uint32_t, H4, ldub)
> +GEN_VEXT_LD_ELEM(ldbu_d, uint8_t,  uint64_t, H8, ldub)
> +GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, uint16_t, H2, lduw)
> +GEN_VEXT_LD_ELEM(ldhu_w, uint16_t, uint32_t, H4, lduw)
> +GEN_VEXT_LD_ELEM(ldhu_d, uint16_t, uint64_t, H8, lduw)
> +GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, uint32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(ldwu_d, uint32_t, uint64_t, H8, ldl)
> +
> +#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
> +static void NAME(CPURISCVState *env, abi_ptr addr,         \
> +                 uint32_t idx, void *vd, uintptr_t retaddr)\
> +{                                                          \
> +    ETYPE data =3D *((ETYPE *)vd + H(idx));                  \
> +    cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
> +}
> +
> +GEN_VEXT_ST_ELEM(stb_b, int8_t,  H1, stb)
> +GEN_VEXT_ST_ELEM(stb_h, int16_t, H2, stb)
> +GEN_VEXT_ST_ELEM(stb_w, int32_t, H4, stb)
> +GEN_VEXT_ST_ELEM(stb_d, int64_t, H8, stb)
> +GEN_VEXT_ST_ELEM(sth_h, int16_t, H2, stw)
> +GEN_VEXT_ST_ELEM(sth_w, int32_t, H4, stw)
> +GEN_VEXT_ST_ELEM(sth_d, int64_t, H8, stw)
> +GEN_VEXT_ST_ELEM(stw_w, int32_t, H4, stl)
> +GEN_VEXT_ST_ELEM(stw_d, int64_t, H8, stl)
> +GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
> +GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
> +GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
> +GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
> +
> +/*
> + *** stride: access vector element from strided memory
> + */
> +static void
> +vext_ldst_stride(void *vd, void *v0, target_ulong base,
> +                 target_ulong stride, CPURISCVState *env,
> +                 uint32_t desc, uint32_t vm,
> +                 vext_ldst_elem_fn *ldst_elem, clear_fn *clear_elem,
> +                 uint32_t esz, uint32_t msz, uintptr_t ra,
> +                 MMUAccessType access_type)
> +{
> +    uint32_t i, k;
> +    uint32_t nf =3D vext_nf(desc);
> +    uint32_t mlen =3D vext_mlen(desc);
> +    uint32_t vlmax =3D vext_maxsz(desc) / esz;
> +
> +    /* probe every access*/
> +    for (i =3D 0; i < env->vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        probe_pages(env, base + stride * i, nf * msz, ra, access_type);
> +    }
> +    /* do real access */
> +    for (i =3D 0; i < env->vl; i++) {
> +        k =3D 0;
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            target_ulong addr =3D base + stride * i + k * msz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +    /* clear tail elements */
> +    if (clear_elem) {
> +        for (k =3D 0; k < nf; k++) {
> +            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * e=
sz);
> +        }
> +    }
> +}
> +
> +#define GEN_VEXT_LD_STRIDE(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)       =
\
> +void HELPER(NAME)(void *vd, void * v0, target_ulong base,               =
\
> +                  target_ulong stride, CPURISCVState *env,              =
\
> +                  uint32_t desc)                                        =
\
> +{                                                                       =
\
> +    uint32_t vm =3D vext_vm(desc);                                      =
  \
> +    vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      =
\
> +                     CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),            =
\
> +                     GETPC(), MMU_DATA_LOAD);                           =
\
> +}
> +
> +GEN_VEXT_LD_STRIDE(vlsb_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
> +GEN_VEXT_LD_STRIDE(vlsb_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
> +GEN_VEXT_LD_STRIDE(vlsb_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
> +GEN_VEXT_LD_STRIDE(vlsb_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
> +GEN_VEXT_LD_STRIDE(vlsh_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
> +GEN_VEXT_LD_STRIDE(vlsh_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
> +GEN_VEXT_LD_STRIDE(vlsh_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
> +GEN_VEXT_LD_STRIDE(vlsw_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
> +GEN_VEXT_LD_STRIDE(vlsw_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
> +GEN_VEXT_LD_STRIDE(vlse_v_b,  int8_t,   int8_t,   lde_b,  clearb)
> +GEN_VEXT_LD_STRIDE(vlse_v_h,  int16_t,  int16_t,  lde_h,  clearh)
> +GEN_VEXT_LD_STRIDE(vlse_v_w,  int32_t,  int32_t,  lde_w,  clearl)
> +GEN_VEXT_LD_STRIDE(vlse_v_d,  int64_t,  int64_t,  lde_d,  clearq)
> +GEN_VEXT_LD_STRIDE(vlsbu_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
> +GEN_VEXT_LD_STRIDE(vlsbu_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
> +GEN_VEXT_LD_STRIDE(vlsbu_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
> +GEN_VEXT_LD_STRIDE(vlsbu_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
> +GEN_VEXT_LD_STRIDE(vlshu_v_h, uint16_t, uint16_t, ldhu_h, clearh)
> +GEN_VEXT_LD_STRIDE(vlshu_v_w, uint16_t, uint32_t, ldhu_w, clearl)
> +GEN_VEXT_LD_STRIDE(vlshu_v_d, uint16_t, uint64_t, ldhu_d, clearq)
> +GEN_VEXT_LD_STRIDE(vlswu_v_w, uint32_t, uint32_t, ldwu_w, clearl)
> +GEN_VEXT_LD_STRIDE(vlswu_v_d, uint32_t, uint64_t, ldwu_d, clearq)
> +
> +#define GEN_VEXT_ST_STRIDE(NAME, MTYPE, ETYPE, STORE_FN)                =
\
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
> +                  target_ulong stride, CPURISCVState *env,              =
\
> +                  uint32_t desc)                                        =
\
> +{                                                                       =
\
> +    uint32_t vm =3D vext_vm(desc);                                      =
  \
> +    vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     =
\
> +                     NULL, sizeof(ETYPE), sizeof(MTYPE),                =
\
> +                     GETPC(), MMU_DATA_STORE);                          =
\
> +}
> +
> +GEN_VEXT_ST_STRIDE(vssb_v_b, int8_t,  int8_t,  stb_b)
> +GEN_VEXT_ST_STRIDE(vssb_v_h, int8_t,  int16_t, stb_h)
> +GEN_VEXT_ST_STRIDE(vssb_v_w, int8_t,  int32_t, stb_w)
> +GEN_VEXT_ST_STRIDE(vssb_v_d, int8_t,  int64_t, stb_d)
> +GEN_VEXT_ST_STRIDE(vssh_v_h, int16_t, int16_t, sth_h)
> +GEN_VEXT_ST_STRIDE(vssh_v_w, int16_t, int32_t, sth_w)
> +GEN_VEXT_ST_STRIDE(vssh_v_d, int16_t, int64_t, sth_d)
> +GEN_VEXT_ST_STRIDE(vssw_v_w, int32_t, int32_t, stw_w)
> +GEN_VEXT_ST_STRIDE(vssw_v_d, int32_t, int64_t, stw_d)
> +GEN_VEXT_ST_STRIDE(vsse_v_b, int8_t,  int8_t,  ste_b)
> +GEN_VEXT_ST_STRIDE(vsse_v_h, int16_t, int16_t, ste_h)
> +GEN_VEXT_ST_STRIDE(vsse_v_w, int32_t, int32_t, ste_w)
> +GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
> +
> +/*
> + *** unit-stride: access elements stored contiguously in memory
> + */
> +
> +/* unmasked unit-stride load and store operation*/
> +static void
> +vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t d=
esc,
> +             vext_ldst_elem_fn *ldst_elem, clear_fn *clear_elem,
> +             uint32_t esz, uint32_t msz, uintptr_t ra,
> +             MMUAccessType access_type)
> +{
> +    uint32_t i, k;
> +    uint32_t nf =3D vext_nf(desc);
> +    uint32_t vlmax =3D vext_maxsz(desc) / esz;
> +
> +    /* probe every access */
> +    probe_pages(env, base, env->vl * nf * msz, ra, access_type);
> +    /* load bytes from guest memory */
> +    for (i =3D 0; i < env->vl; i++) {
> +        k =3D 0;
> +        while (k < nf) {
> +            target_ulong addr =3D base + (i * nf + k) * msz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +    /* clear tail elements */
> +    if (clear_elem) {
> +        for (k =3D 0; k < nf; k++) {
> +            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * e=
sz);
> +        }
> +    }
> +}
> +
> +/*
> + * masked unit-stride load and store operation will be a special case of=
 stride,
> + * stride =3D NF * sizeof (MTYPE)
> + */
> +
> +#define GEN_VEXT_LD_US(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)           =
\
> +void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
> +                         CPURISCVState *env, uint32_t desc)             =
\
> +{                                                                       =
\
> +    uint32_t stride =3D vext_nf(desc) * sizeof(MTYPE);                  =
  \
> +    vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   =
\
> +                     CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),            =
\
> +                     GETPC(), MMU_DATA_LOAD);                           =
\
> +}                                                                       =
\
> +                                                                        =
\
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
> +                  CPURISCVState *env, uint32_t desc)                    =
\
> +{                                                                       =
\
> +    vext_ldst_us(vd, base, env, desc, LOAD_FN, CLEAR_FN,                =
\
> +                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_LOAD); =
\
> +}
> +
> +GEN_VEXT_LD_US(vlb_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
> +GEN_VEXT_LD_US(vlb_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
> +GEN_VEXT_LD_US(vlb_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
> +GEN_VEXT_LD_US(vlb_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
> +GEN_VEXT_LD_US(vlh_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
> +GEN_VEXT_LD_US(vlh_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
> +GEN_VEXT_LD_US(vlh_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
> +GEN_VEXT_LD_US(vlw_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
> +GEN_VEXT_LD_US(vlw_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
> +GEN_VEXT_LD_US(vle_v_b,  int8_t,   int8_t,   lde_b,  clearb)
> +GEN_VEXT_LD_US(vle_v_h,  int16_t,  int16_t,  lde_h,  clearh)
> +GEN_VEXT_LD_US(vle_v_w,  int32_t,  int32_t,  lde_w,  clearl)
> +GEN_VEXT_LD_US(vle_v_d,  int64_t,  int64_t,  lde_d,  clearq)
> +GEN_VEXT_LD_US(vlbu_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
> +GEN_VEXT_LD_US(vlbu_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
> +GEN_VEXT_LD_US(vlbu_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
> +GEN_VEXT_LD_US(vlbu_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
> +GEN_VEXT_LD_US(vlhu_v_h, uint16_t, uint16_t, ldhu_h, clearh)
> +GEN_VEXT_LD_US(vlhu_v_w, uint16_t, uint32_t, ldhu_w, clearl)
> +GEN_VEXT_LD_US(vlhu_v_d, uint16_t, uint64_t, ldhu_d, clearq)
> +GEN_VEXT_LD_US(vlwu_v_w, uint32_t, uint32_t, ldwu_w, clearl)
> +GEN_VEXT_LD_US(vlwu_v_d, uint32_t, uint64_t, ldwu_d, clearq)
> +
> +#define GEN_VEXT_ST_US(NAME, MTYPE, ETYPE, STORE_FN)                    =
\
> +void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
> +                         CPURISCVState *env, uint32_t desc)             =
\
> +{                                                                       =
\
> +    uint32_t stride =3D vext_nf(desc) * sizeof(MTYPE);                  =
  \
> +    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
\
> +                     NULL, sizeof(ETYPE), sizeof(MTYPE),                =
\
> +                     GETPC(), MMU_DATA_STORE);                          =
\
> +}                                                                       =
\
> +                                                                        =
\
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
> +                  CPURISCVState *env, uint32_t desc)                    =
\
> +{                                                                       =
\
> +    vext_ldst_us(vd, base, env, desc, STORE_FN, NULL,                   =
\
> +                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_STORE);=
\
> +}
> +
> +GEN_VEXT_ST_US(vsb_v_b, int8_t,  int8_t , stb_b)
> +GEN_VEXT_ST_US(vsb_v_h, int8_t,  int16_t, stb_h)
> +GEN_VEXT_ST_US(vsb_v_w, int8_t,  int32_t, stb_w)
> +GEN_VEXT_ST_US(vsb_v_d, int8_t,  int64_t, stb_d)
> +GEN_VEXT_ST_US(vsh_v_h, int16_t, int16_t, sth_h)
> +GEN_VEXT_ST_US(vsh_v_w, int16_t, int32_t, sth_w)
> +GEN_VEXT_ST_US(vsh_v_d, int16_t, int64_t, sth_d)
> +GEN_VEXT_ST_US(vsw_v_w, int32_t, int32_t, stw_w)
> +GEN_VEXT_ST_US(vsw_v_d, int32_t, int64_t, stw_d)
> +GEN_VEXT_ST_US(vse_v_b, int8_t,  int8_t , ste_b)
> +GEN_VEXT_ST_US(vse_v_h, int16_t, int16_t, ste_h)
> +GEN_VEXT_ST_US(vse_v_w, int32_t, int32_t, ste_w)
> +GEN_VEXT_ST_US(vse_v_d, int64_t, int64_t, ste_d)
> --
> 2.23.0
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36053F1333
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 08:18:36 +0200 (CEST)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGbNr-0000Ph-S0
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 02:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbMv-0007mZ-2s
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 02:17:38 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbMs-0004sp-Lv
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 02:17:36 -0400
Received: by mail-io1-xd2f.google.com with SMTP id a15so6262178iot.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 23:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vveqHgx3m6sNBg8F4aGHmOtrJF84u2Z5JOWW6NUK0qE=;
 b=ZPxo9LlsowIJR+0P8cdGMUFfzv0/+2hZ7vp7s6LbZhsT8kiDQd2LkQE9IS3dEvM+Hw
 EUjpdBXB3HKdViJMrxCq1ofV0UZ8Y1iLSWY83QzkqRbBQlNjjxOKugwqKqaSVkRFOgGO
 4Xx8dND25JB7hGZvVzmoG0UOeW4XXO0WALrZQx0hQYVn4NiNxlRI6R/r9Ru7aZ31olUq
 wz31rcwj76mmXor7+Frw1v6cTNS6GKcy3DFHWlOHz7UhwFFCilNs0/46iK+Xz3Qqwl8o
 YkEeMQqb4OUASo3mzla1kou+kK6Jl1j+wk5+fT7EZrbz9yRUiSaU/arF61jbrOmDQsSI
 tUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vveqHgx3m6sNBg8F4aGHmOtrJF84u2Z5JOWW6NUK0qE=;
 b=WKTMwRsMtI9HP/KvopwYZF5CtgX+ST7dHlOYlD+IpPWfNKrj6qjtg3Z1YvOTIIDVvk
 56HEKgTsYHSfU7rg989uc5h0TemTU1wzLvxaLbcBZJbBhRu4n2UhZbmOepRYMotOS607
 VcOOe2ORxR0ze+sLzwVEF7WFzUlIvg22KgiRWQfRZVd9XnP8xx7vPt0xmJvJcJU5KAsG
 SJDe+JoWImnKYs8I1T7l4OZGPfFSpi7vCisFzPed0oiO9Dk/B4FaZLHQCPwFDHkfx41U
 aInw0BjGUtD38uLFj4HKbvEEAWJWilCY2sjg1Ft4k5AbgWH5rWUcUdFvlx/5EapUwpnv
 nodQ==
X-Gm-Message-State: AOAM533TODva4pH/BqFe/S9mb8DzUk/+orSLJrjDNhUbtXG94pArsGxU
 i6Hmh4mG+XVkk0sEe6WapWGBPKPyOqoBcwmgnYM=
X-Google-Smtp-Source: ABdhPJx3X5uWQ1TTKlyB2CdL2EbLM7WQRGCItW81X5wZa62nAAggVaPrr1T8zjLA/o7bFFg2SVA8GabR3IOwTIHcjds=
X-Received: by 2002:a02:c502:: with SMTP id s2mr11597834jam.135.1629353853588; 
 Wed, 18 Aug 2021 23:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-24-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-24-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:17:07 +1000
Message-ID: <CAKmqyKN1OeCuTmG+EC8U4GuBTX2h+=LnOZ1P8T0vAV4MVQFfiQ@mail.gmail.com>
Subject: Re: [PATCH v3 23/66] tcg: Expand MO_SIZE to 3 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 5:41 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have lacked expressive support for memory sizes larger
> than 64-bits for a while.  Fixing that requires adjustment
> to several points where we used this for array indexing,
> and two places that develop -Wswitch warnings after the change.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/memop.h                | 14 +++++++++-----
>  target/arm/translate-a64.c          |  2 +-
>  tcg/tcg-op.c                        | 13 ++++++++-----
>  target/s390x/tcg/translate_vx.c.inc |  2 +-
>  tcg/aarch64/tcg-target.c.inc        |  4 ++--
>  tcg/arm/tcg-target.c.inc            |  4 ++--
>  tcg/i386/tcg-target.c.inc           |  4 ++--
>  tcg/mips/tcg-target.c.inc           |  4 ++--
>  tcg/ppc/tcg-target.c.inc            |  8 ++++----
>  tcg/riscv/tcg-target.c.inc          |  4 ++--
>  tcg/s390/tcg-target.c.inc           |  4 ++--
>  tcg/sparc/tcg-target.c.inc          | 16 ++++++++--------
>  12 files changed, 43 insertions(+), 36 deletions(-)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 529d07b02d..04264ffd6b 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -19,11 +19,15 @@ typedef enum MemOp {
>      MO_16    =3D 1,
>      MO_32    =3D 2,
>      MO_64    =3D 3,
> -    MO_SIZE  =3D 3,   /* Mask for the above.  */
> +    MO_128   =3D 4,
> +    MO_256   =3D 5,
> +    MO_512   =3D 6,
> +    MO_1024  =3D 7,
> +    MO_SIZE  =3D 0x07,   /* Mask for the above.  */
>
> -    MO_SIGN  =3D 4,   /* Sign-extended, otherwise zero-extended.  */
> +    MO_SIGN  =3D 0x08,   /* Sign-extended, otherwise zero-extended.  */
>
> -    MO_BSWAP =3D 8,   /* Host reverse endian.  */
> +    MO_BSWAP =3D 0x10,   /* Host reverse endian.  */
>  #ifdef HOST_WORDS_BIGENDIAN
>      MO_LE    =3D MO_BSWAP,
>      MO_BE    =3D 0,
> @@ -59,8 +63,8 @@ typedef enum MemOp {
>       * - an alignment to a specified size, which may be more or less tha=
n
>       *   the access size (MO_ALIGN_x where 'x' is a size in bytes);
>       */
> -    MO_ASHIFT =3D 4,
> -    MO_AMASK =3D 7 << MO_ASHIFT,
> +    MO_ASHIFT =3D 5,
> +    MO_AMASK =3D 0x7 << MO_ASHIFT,
>  #ifdef NEED_CPU_H
>  #ifdef TARGET_ALIGNED_ONLY
>      MO_ALIGN =3D 0,
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 422e2ac0c9..247c9672be 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1045,7 +1045,7 @@ static void read_vec_element(DisasContext *s, TCGv_=
i64 tcg_dest, int srcidx,
>                               int element, MemOp memop)
>  {
>      int vect_off =3D vec_reg_offset(s, srcidx, element, memop & MO_SIZE)=
;
> -    switch (memop) {
> +    switch ((unsigned)memop) {
>      case MO_8:
>          tcg_gen_ld8u_i64(tcg_dest, cpu_env, vect_off);
>          break;
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index c754396575..e01f68f44d 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2780,10 +2780,13 @@ static inline MemOp tcg_canonicalize_memop(MemOp =
op, bool is64, bool st)
>          }
>          break;
>      case MO_64:
> -        if (!is64) {
> -            tcg_abort();
> +        if (is64) {
> +            op &=3D ~MO_SIGN;
> +            break;
>          }
> -        break;
> +        /* fall through */
> +    default:
> +        g_assert_not_reached();
>      }
>      if (st) {
>          op &=3D ~MO_SIGN;
> @@ -3095,7 +3098,7 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_en=
v, TCGv,
>  # define WITH_ATOMIC64(X)
>  #endif
>
> -static void * const table_cmpxchg[16] =3D {
> +static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_8] =3D gen_helper_atomic_cmpxchgb,
>      [MO_16 | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,
>      [MO_16 | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,
> @@ -3297,7 +3300,7 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv add=
r, TCGv_i64 val,
>  }
>
>  #define GEN_ATOMIC_HELPER(NAME, OP, NEW)                                =
\
> -static void * const table_##NAME[16] =3D {                              =
  \
> +static void * const table_##NAME[(MO_SIZE | MO_BSWAP) + 1] =3D {        =
  \
>      [MO_8] =3D gen_helper_atomic_##NAME##b,                             =
  \
>      [MO_16 | MO_LE] =3D gen_helper_atomic_##NAME##w_le,                 =
  \
>      [MO_16 | MO_BE] =3D gen_helper_atomic_##NAME##w_be,                 =
  \
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/trans=
late_vx.c.inc
> index 0afa46e463..28bf5a23b6 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -67,7 +67,7 @@ static void read_vec_element_i64(TCGv_i64 dst, uint8_t =
reg, uint8_t enr,
>  {
>      const int offs =3D vec_reg_offset(reg, enr, memop & MO_SIZE);
>
> -    switch (memop) {
> +    switch ((unsigned)memop) {
>      case ES_8:
>          tcg_gen_ld8u_i64(dst, cpu_env, offs);
>          break;
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 5924977b42..6f43c048a5 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1547,7 +1547,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext=
, TCGReg d,
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     TCGMemOpIdx oi, uintptr_t ra)
>   */
> -static void * const qemu_ld_helpers[4] =3D {
> +static void * const qemu_ld_helpers[MO_SIZE + 1] =3D {
>      [MO_8]  =3D helper_ret_ldub_mmu,
>  #ifdef HOST_WORDS_BIGENDIAN
>      [MO_16] =3D helper_be_lduw_mmu,
> @@ -1564,7 +1564,7 @@ static void * const qemu_ld_helpers[4] =3D {
>   *                                     uintxx_t val, TCGMemOpIdx oi,
>   *                                     uintptr_t ra)
>   */
> -static void * const qemu_st_helpers[4] =3D {
> +static void * const qemu_st_helpers[MO_SIZE + 1] =3D {
>      [MO_8]  =3D helper_ret_stb_mmu,
>  #ifdef HOST_WORDS_BIGENDIAN
>      [MO_16] =3D helper_be_stw_mmu,
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 007ceee68e..8939b2c2da 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1393,7 +1393,7 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn in=
sn,
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     int mmu_idx, uintptr_t ra)
>   */
> -static void * const qemu_ld_helpers[8] =3D {
> +static void * const qemu_ld_helpers[MO_SSIZE + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_SB]   =3D helper_ret_ldsb_mmu,
>  #ifdef HOST_WORDS_BIGENDIAN
> @@ -1414,7 +1414,7 @@ static void * const qemu_ld_helpers[8] =3D {
>  /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
>   *                                     uintxx_t val, int mmu_idx, uintpt=
r_t ra)
>   */
> -static void * const qemu_st_helpers[4] =3D {
> +static void * const qemu_st_helpers[MO_SIZE + 1] =3D {
>      [MO_8]   =3D helper_ret_stb_mmu,
>  #ifdef HOST_WORDS_BIGENDIAN
>      [MO_16] =3D helper_be_stw_mmu,
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 98d924b91a..5fd4e4392f 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -1610,7 +1610,7 @@ static void tcg_out_nopn(TCGContext *s, int n)
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     int mmu_idx, uintptr_t ra)
>   */
> -static void * const qemu_ld_helpers[16] =3D {
> +static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_LEUW] =3D helper_le_lduw_mmu,
>      [MO_LEUL] =3D helper_le_ldul_mmu,
> @@ -1623,7 +1623,7 @@ static void * const qemu_ld_helpers[16] =3D {
>  /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
>   *                                     uintxx_t val, int mmu_idx, uintpt=
r_t ra)
>   */
> -static void * const qemu_st_helpers[16] =3D {
> +static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index bf0eb84e2d..cc279205d6 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1037,7 +1037,7 @@ static void tcg_out_call(TCGContext *s, const tcg_i=
nsn_unit *arg)
>  #if defined(CONFIG_SOFTMMU)
>  #include "../tcg-ldst.c.inc"
>
> -static void * const qemu_ld_helpers[16] =3D {
> +static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_SB]   =3D helper_ret_ldsb_mmu,
>      [MO_LEUW] =3D helper_le_lduw_mmu,
> @@ -1054,7 +1054,7 @@ static void * const qemu_ld_helpers[16] =3D {
>  #endif
>  };
>
> -static void * const qemu_st_helpers[16] =3D {
> +static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index e0f4665213..3fef2aa6b2 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1916,7 +1916,7 @@ static void tcg_out_call(TCGContext *s, const tcg_i=
nsn_unit *target)
>  #endif
>  }
>
> -static const uint32_t qemu_ldx_opc[16] =3D {
> +static const uint32_t qemu_ldx_opc[(MO_SSIZE + MO_BSWAP) + 1] =3D {
>      [MO_UB] =3D LBZX,
>      [MO_UW] =3D LHZX,
>      [MO_UL] =3D LWZX,
> @@ -1929,7 +1929,7 @@ static const uint32_t qemu_ldx_opc[16] =3D {
>      [MO_BSWAP | MO_Q]  =3D LDBRX,
>  };
>
> -static const uint32_t qemu_stx_opc[16] =3D {
> +static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] =3D {
>      [MO_UB] =3D STBX,
>      [MO_UW] =3D STHX,
>      [MO_UL] =3D STWX,
> @@ -1950,7 +1950,7 @@ static const uint32_t qemu_exts_opc[4] =3D {
>  /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
>   *                                 int mmu_idx, uintptr_t ra)
>   */
> -static void * const qemu_ld_helpers[16] =3D {
> +static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_LEUW] =3D helper_le_lduw_mmu,
>      [MO_LEUL] =3D helper_le_ldul_mmu,
> @@ -1963,7 +1963,7 @@ static void * const qemu_ld_helpers[16] =3D {
>  /* helper signature: helper_st_mmu(CPUState *env, target_ulong addr,
>   *                                 uintxx_t val, int mmu_idx, uintptr_t =
ra)
>   */
> -static void * const qemu_st_helpers[16] =3D {
> +static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index c16f96b401..6264e58b3a 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -852,7 +852,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     TCGMemOpIdx oi, uintptr_t ra)
>   */
> -static void * const qemu_ld_helpers[8] =3D {
> +static void * const qemu_ld_helpers[MO_SSIZE + 1] =3D {
>      [MO_UB] =3D helper_ret_ldub_mmu,
>      [MO_SB] =3D helper_ret_ldsb_mmu,
>  #ifdef HOST_WORDS_BIGENDIAN
> @@ -878,7 +878,7 @@ static void * const qemu_ld_helpers[8] =3D {
>   *                                     uintxx_t val, TCGMemOpIdx oi,
>   *                                     uintptr_t ra)
>   */
> -static void * const qemu_st_helpers[4] =3D {
> +static void * const qemu_st_helpers[MO_SIZE + 1] =3D {
>      [MO_8]   =3D helper_ret_stb_mmu,
>  #ifdef HOST_WORDS_BIGENDIAN
>      [MO_16] =3D helper_be_stw_mmu,
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index b82cf19f09..67a2ba5ff3 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -350,7 +350,7 @@ static const uint8_t tcg_cond_to_ltr_cond[] =3D {
>  };
>
>  #ifdef CONFIG_SOFTMMU
> -static void * const qemu_ld_helpers[16] =3D {
> +static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_ldub_mmu,
>      [MO_SB]   =3D helper_ret_ldsb_mmu,
>      [MO_LEUW] =3D helper_le_lduw_mmu,
> @@ -365,7 +365,7 @@ static void * const qemu_ld_helpers[16] =3D {
>      [MO_BEQ]  =3D helper_be_ldq_mmu,
>  };
>
> -static void * const qemu_st_helpers[16] =3D {
> +static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D helper_ret_stb_mmu,
>      [MO_LEUW] =3D helper_le_stw_mmu,
>      [MO_LEUL] =3D helper_le_stl_mmu,
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 688827968b..b9bce29282 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -847,8 +847,8 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>  }
>
>  #ifdef CONFIG_SOFTMMU
> -static const tcg_insn_unit *qemu_ld_trampoline[16];
> -static const tcg_insn_unit *qemu_st_trampoline[16];
> +static const tcg_insn_unit *qemu_ld_trampoline[(MO_SSIZE | MO_BSWAP) + 1=
];
> +static const tcg_insn_unit *qemu_st_trampoline[(MO_SIZE | MO_BSWAP) + 1]=
;
>
>  static void emit_extend(TCGContext *s, TCGReg r, int op)
>  {
> @@ -875,7 +875,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int =
op)
>
>  static void build_trampolines(TCGContext *s)
>  {
> -    static void * const qemu_ld_helpers[16] =3D {
> +    static void * const qemu_ld_helpers[] =3D {
>          [MO_UB]   =3D helper_ret_ldub_mmu,
>          [MO_SB]   =3D helper_ret_ldsb_mmu,
>          [MO_LEUW] =3D helper_le_lduw_mmu,
> @@ -887,7 +887,7 @@ static void build_trampolines(TCGContext *s)
>          [MO_BEUL] =3D helper_be_ldul_mmu,
>          [MO_BEQ]  =3D helper_be_ldq_mmu,
>      };
> -    static void * const qemu_st_helpers[16] =3D {
> +    static void * const qemu_st_helpers[] =3D {
>          [MO_UB]   =3D helper_ret_stb_mmu,
>          [MO_LEUW] =3D helper_le_stw_mmu,
>          [MO_LEUL] =3D helper_le_stl_mmu,
> @@ -900,7 +900,7 @@ static void build_trampolines(TCGContext *s)
>      int i;
>      TCGReg ra;
>
> -    for (i =3D 0; i < 16; ++i) {
> +    for (i =3D 0; i < ARRAY_SIZE(qemu_ld_helpers); ++i) {
>          if (qemu_ld_helpers[i] =3D=3D NULL) {
>              continue;
>          }
> @@ -928,7 +928,7 @@ static void build_trampolines(TCGContext *s)
>          tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
>      }
>
> -    for (i =3D 0; i < 16; ++i) {
> +    for (i =3D 0; i < ARRAY_SIZE(qemu_st_helpers); ++i) {
>          if (qemu_st_helpers[i] =3D=3D NULL) {
>              continue;
>          }
> @@ -1110,7 +1110,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGRe=
g addr, int mem_index,
>  }
>  #endif /* CONFIG_SOFTMMU */
>
> -static const int qemu_ld_opc[16] =3D {
> +static const int qemu_ld_opc[(MO_SSIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D LDUB,
>      [MO_SB]   =3D LDSB,
>
> @@ -1127,7 +1127,7 @@ static const int qemu_ld_opc[16] =3D {
>      [MO_LEQ]  =3D LDX_LE,
>  };
>
> -static const int qemu_st_opc[16] =3D {
> +static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] =3D {
>      [MO_UB]   =3D STB,
>
>      [MO_BEUW] =3D STH,
> --
> 2.25.1
>
>


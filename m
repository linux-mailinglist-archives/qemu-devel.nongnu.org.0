Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F811A32
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 15:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMBo2-0003dS-HA
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 09:31:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMBmx-000310-4X
	for qemu-devel@nongnu.org; Thu, 02 May 2019 09:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMBmv-0002ew-JD
	for qemu-devel@nongnu.org; Thu, 02 May 2019 09:30:15 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMBmv-0002e7-94
	for qemu-devel@nongnu.org; Thu, 02 May 2019 09:30:13 -0400
Received: by mail-wr1-x444.google.com with SMTP id e9so3416119wrc.1
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:subject:in-reply-to:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Zvi2CuZF/PaKPaSUbpjYWSgUzxvy3HZV7iiF2K9RSN8=;
	b=zrE5v18T4RDltEkx2jzqfJ8O9RZuvnKrbxWBDrviqTDgb5vbUUgAywhRZTLIGX8eKb
	zHZvXD/VHvBVzAl5g3f8wg9jpWkKNSBr6oRZ+ZT8khV/pLYQZWQEEWxVUt2JatuwHQjs
	S+5yCKCDncbyOqv5yWZeHyXmPVmcUX5vLPCk9/nH0CknvLeQhOnJ1mmZZiK5NdYXrlOx
	Wpl6ndPY0W62mDhc7WIMl8w5/hl2yeg6UGpsWw/wZBSWqKVTPNBUfnAOtWlKQbA0Miob
	KETmSkZrrgq0HO5zB3i8/+5NgSnYdzj+bsLcklt+IZfzdEenZttaAtuUKfAQkFm3Dr5n
	aosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=Zvi2CuZF/PaKPaSUbpjYWSgUzxvy3HZV7iiF2K9RSN8=;
	b=NYYnTpVNdUCt/AaeyauDTKajc3K1toEuT/tHWM0W0Wh/eOKNGXzzAeyn4rseG7J3F3
	CZbJw9r4fQoUcCqYFLkXpel3py2uKvnp5/+XotKwxLzJUcRbLtXY0lIwgHmmKV/Fnmn1
	ZOiazAYpue7L/TY8fXSq9XhdQS9LiwrUPtNOtMlNcXpWBx1SMarsz05TnYwdZFi8RhGc
	f5uiz1NBWjKGteYkcfxUo/wFRQV+F/7j8qPx2/1mgdtm9MCaqfYUmPmjTPiM6O/hkFht
	n9oKr53TYu9y3XPZ3z1p3vzTrv3EDydusJ5JB9rxMMLBnhpky9c3r0BQvVYhX1VBk/oZ
	Cq5g==
X-Gm-Message-State: APjAAAUYwSZKA8Da+C8TniIQJEK7dkbTAxL45LVeMwuhpTYHXS09kPad
	sxUI4t669gOuf81YgSJ+t18m6C/duR0=
X-Google-Smtp-Source: APXvYqydE1nVSS4/BnMewdVaNvw1V6xrvDUtuS9r5UXjQ/yKdZGh0S7wmhFy0WXtnNfGCD7YsbtyWg==
X-Received: by 2002:adf:f14e:: with SMTP id y14mr833442wro.276.1556803811671; 
	Thu, 02 May 2019 06:30:11 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	h131sm13875096wmh.44.2019.05.02.06.30.10 for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 06:30:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 84F011FF87
	for <qemu-devel@nongnu.org>; Thu,  2 May 2019 14:30:10 +0100 (BST)
References: <20190501050536.15580-1-richard.henderson@linaro.org>
	<20190501050536.15580-14-richard.henderson@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190501050536.15580-14-richard.henderson@linaro.org>
Date: Thu, 02 May 2019 14:30:10 +0100
Message-ID: <87d0l156hp.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v2 13/29] tcg: Add INDEX_op_dup_mem_vec
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Allow the backend to expand dup from memory directly, instead of
> forcing the value into a temp first.  This is especially important
> if integer/vector register moves do not exist.
>
> Note that officially tcg_out_dupm_vec is allowed to fail.
> If it did, we could fix this up relatively easily:
>
>   VECE =3D=3D 32/64:
>     Load the value into a vector register, then dup.
>     Both of these must work.
>
>   VECE =3D=3D 8/16:
>     If the value happens to be at an offset such that an aligned
>     load would place the desired value in the least significant
>     end of the register, go ahead and load w/garbage in high bits.
>
>     Load the value w/INDEX_op_ld{8,16}_i32.
>     Attempt a move directly to vector reg, which may fail.
>     Store the value into the backing store for OTS.
>     Load the value into the vector reg w/TCG_TYPE_I32, which must work.
>     Duplicate from the vector reg into itself, which must work.
>
> All of which is well and good, except that all supported
> hosts can support dupm for all vece, so all of the failure
> paths would be dead code and untestable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op.h                 |  1 +
>  tcg/tcg-opc.h                |  1 +
>  tcg/aarch64/tcg-target.inc.c |  4 ++
>  tcg/i386/tcg-target.inc.c    |  4 ++
>  tcg/tcg-op-gvec.c            | 89 +++++++++++++++++++-----------------
>  tcg/tcg-op-vec.c             | 11 +++++
>  tcg/tcg.c                    |  1 +
>  7 files changed, 70 insertions(+), 41 deletions(-)
>
> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
> index 1f1824c30a..9fff9864f6 100644
> --- a/tcg/tcg-op.h
> +++ b/tcg/tcg-op.h
> @@ -954,6 +954,7 @@ void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TC=
Gv_i64, TCGArg, TCGMemOp);
>  void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
>  void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
>  void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec, TCGv_i64);
> +void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec, TCGv_ptr, tcg_target_l=
ong);
>  void tcg_gen_dup8i_vec(TCGv_vec, uint32_t);
>  void tcg_gen_dup16i_vec(TCGv_vec, uint32_t);
>  void tcg_gen_dup32i_vec(TCGv_vec, uint32_t);
> diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
> index 1bad6e4208..4bf71f261f 100644
> --- a/tcg/tcg-opc.h
> +++ b/tcg/tcg-opc.h
> @@ -219,6 +219,7 @@ DEF(dup2_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_REG_=
BITS =3D=3D 32))
>
>  DEF(ld_vec, 1, 1, 1, IMPLVEC)
>  DEF(st_vec, 0, 2, 1, IMPLVEC)
> +DEF(dupm_vec, 1, 1, 1, IMPLVEC)
>
>  DEF(add_vec, 1, 2, 0, IMPLVEC)
>  DEF(sub_vec, 1, 2, 0, IMPLVEC)
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index 411fb463ac..16381f5175 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -2192,6 +2192,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode=
 opc,
>      case INDEX_op_st_vec:
>          tcg_out_st(s, type, a0, a1, a2);
>          break;
> +    case INDEX_op_dupm_vec:
> +        tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
> +        break;
>      case INDEX_op_add_vec:
>          tcg_out_insn(s, 3616, ADD, is_q, vece, a0, a1, a2);
>          break;
> @@ -2524,6 +2527,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGO=
pcode op)
>          return &w_w;
>      case INDEX_op_ld_vec:
>      case INDEX_op_st_vec:
> +    case INDEX_op_dupm_vec:
>          return &w_r;
>      case INDEX_op_dup_vec:
>          return &w_wr;
> diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
> index f4bd00e24f..5b33bbd99b 100644
> --- a/tcg/i386/tcg-target.inc.c
> +++ b/tcg/i386/tcg-target.inc.c
> @@ -2829,6 +2829,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode=
 opc,
>      case INDEX_op_st_vec:
>          tcg_out_st(s, type, a0, a1, a2);
>          break;
> +    case INDEX_op_dupm_vec:
> +        tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
> +        break;
>
>      case INDEX_op_x86_shufps_vec:
>          insn =3D OPC_SHUFPS;
> @@ -3115,6 +3118,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGO=
pcode op)
>
>      case INDEX_op_ld_vec:
>      case INDEX_op_st_vec:
> +    case INDEX_op_dupm_vec:
>          return &x_r;
>
>      case INDEX_op_add_vec:
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index 3fcb2352d9..35ebc5a201 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -395,6 +395,41 @@ static TCGType choose_vector_type(const TCGOpcode *l=
ist, unsigned vece,
>      return 0;
>  }
>
> +static void do_dup_store(TCGType type, uint32_t dofs, uint32_t oprsz,
> +                         uint32_t maxsz, TCGv_vec t_vec)
> +{
> +    uint32_t i =3D 0;
> +
> +    switch (type) {
> +    case TCG_TYPE_V256:
> +        /*
> +         * Recall that ARM SVE allows vector sizes that are not a
> +         * power of 2, but always a multiple of 16.  The intent is
> +         * that e.g. size =3D=3D 80 would be expanded with 2x32 + 1x16.
> +         */

The c&p comment explains the fall-through  although in this case we are
only mxing and matching V256/V128?

> +        for (; i + 32 <=3D oprsz; i +=3D 32) {
> +            tcg_gen_stl_vec(t_vec, cpu_env, dofs + i, TCG_TYPE_V256);
> +        }
> +        /* fallthru */
> +    case TCG_TYPE_V128:
> +        for (; i + 16 <=3D oprsz; i +=3D 16) {
> +            tcg_gen_stl_vec(t_vec, cpu_env, dofs + i, TCG_TYPE_V128);
> +        }
> +        break;
> +    case TCG_TYPE_V64:
> +        for (; i < oprsz; i +=3D 8) {
> +            tcg_gen_stl_vec(t_vec, cpu_env, dofs + i, TCG_TYPE_V64);
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (oprsz < maxsz) {
> +        expand_clr(dofs + oprsz, maxsz - oprsz);
> +    }
> +}
> +
>  /* Set OPRSZ bytes at DOFS to replications of IN_32, IN_64 or IN_C.
>   * Only one of IN_32 or IN_64 may be set;
>   * IN_C is used if IN_32 and IN_64 are unset.
> @@ -434,49 +469,11 @@ static void do_dup(unsigned vece, uint32_t dofs, ui=
nt32_t oprsz,
>          } else if (in_64) {
>              tcg_gen_dup_i64_vec(vece, t_vec, in_64);
>          } else {
> -            switch (vece) {
> -            case MO_8:
> -                tcg_gen_dup8i_vec(t_vec, in_c);
> -                break;
> -            case MO_16:
> -                tcg_gen_dup16i_vec(t_vec, in_c);
> -                break;
> -            case MO_32:
> -                tcg_gen_dup32i_vec(t_vec, in_c);
> -                break;
> -            default:
> -                tcg_gen_dup64i_vec(t_vec, in_c);
> -                break;
> -            }
> +            tcg_gen_dupi_vec(vece, t_vec, in_c);
>          }
> -
> -        i =3D 0;
> -        switch (type) {
> -        case TCG_TYPE_V256:
> -            /* Recall that ARM SVE allows vector sizes that are not a
> -             * power of 2, but always a multiple of 16.  The intent is
> -             * that e.g. size =3D=3D 80 would be expanded with 2x32 + 1x=
16.
> -             */

Hmm I see it was just code motion.

> -            for (; i + 32 <=3D oprsz; i +=3D 32) {
> -                tcg_gen_stl_vec(t_vec, cpu_env, dofs + i, TCG_TYPE_V256);
> -            }
> -            /* fallthru */
> -        case TCG_TYPE_V128:
> -            for (; i + 16 <=3D oprsz; i +=3D 16) {
> -                tcg_gen_stl_vec(t_vec, cpu_env, dofs + i, TCG_TYPE_V128);
> -            }
> -            break;
> -        case TCG_TYPE_V64:
> -            for (; i < oprsz; i +=3D 8) {
> -                tcg_gen_stl_vec(t_vec, cpu_env, dofs + i, TCG_TYPE_V64);
> -            }
> -            break;
> -        default:
> -            g_assert_not_reached();
> -        }
> -
> +        do_dup_store(type, dofs, oprsz, maxsz, t_vec);
>          tcg_temp_free_vec(t_vec);
> -        goto done;
> +        return;
>      }
>
>      /* Otherwise, inline with an integer type, unless "large".  */
> @@ -1449,6 +1446,16 @@ void tcg_gen_gvec_dup_i64(unsigned vece, uint32_t =
dofs, uint32_t oprsz,
>  void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
>                            uint32_t oprsz, uint32_t maxsz)
>  {
> +    if (vece <=3D MO_64) {
> +        TCGType type =3D choose_vector_type(0, vece, oprsz, 0);
> +        if (type !=3D 0) {
> +            TCGv_vec t_vec =3D tcg_temp_new_vec(type);
> +            tcg_gen_dup_mem_vec(vece, t_vec, cpu_env, aofs);
> +            do_dup_store(type, dofs, oprsz, maxsz, t_vec);
> +            tcg_temp_free_vec(t_vec);
> +            return;
> +        }
> +    }
>      if (vece <=3D MO_32) {
>          TCGv_i32 in =3D tcg_temp_new_i32();
>          switch (vece) {
> diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
> index 914fe42b1e..213d2e22aa 100644
> --- a/tcg/tcg-op-vec.c
> +++ b/tcg/tcg-op-vec.c
> @@ -278,6 +278,17 @@ void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec r, =
TCGv_i32 a)
>      vec_gen_2(INDEX_op_dup_vec, type, vece, ri, ai);
>  }
>
> +void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec r, TCGv_ptr b,
> +                         tcg_target_long ofs)
> +{
> +    TCGArg ri =3D tcgv_vec_arg(r);
> +    TCGArg bi =3D tcgv_ptr_arg(b);
> +    TCGTemp *rt =3D arg_temp(ri);
> +    TCGType type =3D rt->base_type;
> +
> +    vec_gen_3(INDEX_op_dupm_vec, type, vece, ri, bi, ofs);
> +}
> +
>  static void vec_gen_ldst(TCGOpcode opc, TCGv_vec r, TCGv_ptr b, TCGArg o)
>  {
>      TCGArg ri =3D tcgv_vec_arg(r);
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index ef01cf8214..bb1e124e80 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1600,6 +1600,7 @@ bool tcg_op_supported(TCGOpcode op)
>      case INDEX_op_mov_vec:
>      case INDEX_op_dup_vec:
>      case INDEX_op_dupi_vec:
> +    case INDEX_op_dupm_vec:
>      case INDEX_op_ld_vec:
>      case INDEX_op_st_vec:
>      case INDEX_op_add_vec:


Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e


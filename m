Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE3D428ACD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:33:26 +0200 (CEST)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZscX-0007nE-9f
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZsb8-0006MK-2a
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:31:58 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZsb6-0003Mj-0O
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:31:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so54735064wrb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tmdaxyVDzdpT8Lge7q/DG3UtU7xCsjXeqoDaLwlfXms=;
 b=Au36eOXOcQOKWyrvAH5scZnlU6nzIMkVl5pMEEGAOaXeojHd9xxXx31iXrC81fT2Pi
 lJPzZhU3Pwfh24fQmdxRJnfm9InqYw/mKfOX18TCRR3LJmICuL4iKB8K3DzQvZHNageN
 hO+IdhelR8LEe5uXi13KM+IRbQjCqVcMANVRiOw2/gx1bqmmNRHINJS/ISMklphvRycc
 GGEGJFnIS1dRAlszrA60UevXuyeuZclJ5vAeDT2jca0HX8A3DICr822IA96qvOMd9Ybh
 wsGpU29/UVUKNJdUcQYFK8AoD3wogDWgkYFG2mSk2znCKdrITYQ4CTQrBZVQZC78jS6e
 UMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tmdaxyVDzdpT8Lge7q/DG3UtU7xCsjXeqoDaLwlfXms=;
 b=PGCZ5t+yts830QE6qPiYrzO/oQ+kgywj7GWb2nN2gkrBIbKvvvn/xTst9YcGzDxR8P
 NykdD5b+90Xj+temypbM41KCEx7V4PkgLrWkmOBypz8d7b7h0DyA5MI4APBpSl215DEh
 3nHAkgnxaKaFARjQjO/zdktno5nDpeUBgmg8rDFafkaUrUd/MGYfBpTxbvpWrHhhxpB5
 MU/NV35oqjPpnRcI795VwKyjk4Mcmi5/MKk688ddZZynO5G4hVJ7u/JEkvbWGUQLruiE
 B63L+F6hAAe8Tt4sFZXzZExNoMs7hIKdqjg8us8NCTaptLnynx0MfqHXRu87X1KIU9Q3
 w+7Q==
X-Gm-Message-State: AOAM5301HpMvtH7a8ld9YJCKKRoBZeJqM5uaMjHYI57yXckT3HdsNOH8
 /CmA9AoPBfNoFE6o1CJXFt4zjQ==
X-Google-Smtp-Source: ABdhPJyxcCI3X+GHN9qhnRP4Aa4Ra4HvFOOVbyLJQ/4N5doDhfHZvVXKTzYFRnPtcAjOegCCXQouiQ==
X-Received: by 2002:adf:9796:: with SMTP id s22mr22573538wrb.224.1633948313922; 
 Mon, 11 Oct 2021 03:31:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p8sm7413461wmg.15.2021.10.11.03.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 03:31:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A490E1FF96;
 Mon, 11 Oct 2021 11:31:52 +0100 (BST)
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 6/8] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Mon, 11 Oct 2021 11:28:19 +0100
In-reply-to: <20211010174401.141339-7-richard.henderson@linaro.org>
Message-ID: <877dejyhrb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> AArch64 has both sign and zero-extending addressing modes, which
> means that either treatment of guest addresses is equally efficient.
> Enabling this for AArch64 gives us testing of the feature in CI.

So which guests front ends will exercise this backend? I realise you
never mentioned it in the cover letter. Is this something we can
exercise in 32 bit user mode tests?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-sa32.h |  8 ++++-
>  tcg/aarch64/tcg-target.c.inc  | 68 ++++++++++++++++++++++-------------
>  2 files changed, 51 insertions(+), 25 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
> index cb185b1526..c99e502e4c 100644
> --- a/tcg/aarch64/tcg-target-sa32.h
> +++ b/tcg/aarch64/tcg-target-sa32.h
> @@ -1 +1,7 @@
> -#define TCG_TARGET_SIGNED_ADDR32 0
> +/*
> + * AArch64 has both SXTW and UXTW addressing modes, which means that
> + * it is agnostic to how guest addresses should be represented.
> + * Because aarch64 is more common than the other hosts that will
> + * want to use this feature, enable it for continuous testing.
> + */
> +#define TCG_TARGET_SIGNED_ADDR32 1
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 5edca8d44d..88b2963f9d 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -12,6 +12,7 @@
>=20=20
>  #include "../tcg-pool.c.inc"
>  #include "qemu/bitops.h"
> +#include "tcg-target-sa32.h"
>=20=20
>  /* We're going to re-use TCGType in setting of the SF bit, which controls
>     the size of the operation performed.  If we know the values match, it
> @@ -804,12 +805,12 @@ static void tcg_out_insn_3617(TCGContext *s, AArch6=
4Insn insn, bool q,
>  }
>=20=20
>  static void tcg_out_insn_3310(TCGContext *s, AArch64Insn insn,
> -                              TCGReg rd, TCGReg base, TCGType ext,
> +                              TCGReg rd, TCGReg base, int option,
>                                TCGReg regoff)
>  {
>      /* Note the AArch64Insn constants above are for C3.3.12.  Adjust.  */
>      tcg_out32(s, insn | I3312_TO_I3310 | regoff << 16 |
> -              0x4000 | ext << 13 | base << 5 | (rd & 0x1f));
> +              option << 13 | base << 5 | (rd & 0x1f));
>  }
>=20=20
>  static void tcg_out_insn_3312(TCGContext *s, AArch64Insn insn,
> @@ -1124,7 +1125,7 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn=
 insn, TCGReg rd,
>=20=20
>      /* Worst-case scenario, move offset to temp register, use reg offset=
.  */
>      tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, offset);
> -    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP);
> +    tcg_out_ldst_r(s, insn, rd, rn, 3 /* LSL #0 */, TCG_REG_TMP);
>  }
>=20=20
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg =
arg)
> @@ -1718,34 +1719,34 @@ static void tcg_out_tlb_read(TCGContext *s, TCGRe=
g addr_reg, MemOp opc,
>=20=20
>  static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType e=
xt,
>                                     TCGReg data_r, TCGReg addr_r,
> -                                   TCGType otype, TCGReg off_r)
> +                                   int option, TCGReg off_r)
>  {
>      /* Byte swapping is left to middle-end expansion. */
>      tcg_debug_assert((memop & MO_BSWAP) =3D=3D 0);
>=20=20
>      switch (memop & MO_SSIZE) {
>      case MO_UB:
> -        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, option, off_r);
>          break;
>      case MO_SB:
>          tcg_out_ldst_r(s, ext ? I3312_LDRSBX : I3312_LDRSBW,
> -                       data_r, addr_r, otype, off_r);
> +                       data_r, addr_r, option, off_r);
>          break;
>      case MO_UW:
> -        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, option, off_r);
>          break;
>      case MO_SW:
>          tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
> -                       data_r, addr_r, otype, off_r);
> +                       data_r, addr_r, option, off_r);
>          break;
>      case MO_UL:
> -        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, option, off_r);
>          break;
>      case MO_SL:
> -        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, option, off_r);
>          break;
>      case MO_Q:
> -        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, option, off_r);
>          break;
>      default:
>          tcg_abort();
> @@ -1754,50 +1755,68 @@ static void tcg_out_qemu_ld_direct(TCGContext *s,=
 MemOp memop, TCGType ext,
>=20=20
>  static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
>                                     TCGReg data_r, TCGReg addr_r,
> -                                   TCGType otype, TCGReg off_r)
> +                                   int option, TCGReg off_r)
>  {
>      /* Byte swapping is left to middle-end expansion. */
>      tcg_debug_assert((memop & MO_BSWAP) =3D=3D 0);
>=20=20
>      switch (memop & MO_SIZE) {
>      case MO_8:
> -        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, option, off_r);
>          break;
>      case MO_16:
> -        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, option, off_r);
>          break;
>      case MO_32:
> -        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, option, off_r);
>          break;
>      case MO_64:
> -        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
> +        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, option, off_r);
>          break;
>      default:
>          tcg_abort();
>      }
>  }
>=20=20
> +static int guest_ext_option(void)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    bool signed_addr32 =3D guest_base_signed_addr32;
> +#else
> +    bool signed_addr32 =3D TCG_TARGET_SIGNED_ADDR32;
> +#endif
> +
> +    if (TARGET_LONG_BITS =3D=3D 64) {
> +        return 3; /* LSL #0 */
> +    } else if (signed_addr32) {
> +        return 6; /* SXTW */
> +    } else {
> +        return 2; /* UXTW */
> +    }
> +}

If this is is going to be a magic number we pass into our code
generation we could at least wrap it in a confined enum rather than a
bare int we chuck around.

> +
>  static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_=
reg,
>                              MemOpIdx oi, TCGType ext)
>  {
>      MemOp memop =3D get_memop(oi);
> -    const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64 ? TCG_TYPE_I64 : =
TCG_TYPE_I32;
> +    int option =3D guest_ext_option();
> +
>  #ifdef CONFIG_SOFTMMU
>      unsigned mem_index =3D get_mmuidx(oi);
>      tcg_insn_unit *label_ptr;
>=20=20
>      tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
>      tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> -                           TCG_REG_X1, otype, addr_reg);
> +                           TCG_REG_X1, option, addr_reg);
>      add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
>                          s->code_ptr, label_ptr);
>  #else /* !CONFIG_SOFTMMU */
>      if (USE_GUEST_BASE) {
>          tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> -                               TCG_REG_GUEST_BASE, otype, addr_reg);
> +                               TCG_REG_GUEST_BASE, option, addr_reg);
>      } else {
>          tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> -                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
> +                               addr_reg, option, TCG_REG_XZR);
>      }
>  #endif /* CONFIG_SOFTMMU */
>  }
> @@ -1806,23 +1825,24 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg=
 data_reg, TCGReg addr_reg,
>                              MemOpIdx oi)
>  {
>      MemOp memop =3D get_memop(oi);
> -    const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64 ? TCG_TYPE_I64 : =
TCG_TYPE_I32;
> +    int option =3D guest_ext_option();
> +
>  #ifdef CONFIG_SOFTMMU
>      unsigned mem_index =3D get_mmuidx(oi);
>      tcg_insn_unit *label_ptr;
>=20=20
>      tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
>      tcg_out_qemu_st_direct(s, memop, data_reg,
> -                           TCG_REG_X1, otype, addr_reg);
> +                           TCG_REG_X1, option, addr_reg);
>      add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)=3D=3D MO_64,
>                          data_reg, addr_reg, s->code_ptr, label_ptr);
>  #else /* !CONFIG_SOFTMMU */
>      if (USE_GUEST_BASE) {
>          tcg_out_qemu_st_direct(s, memop, data_reg,
> -                               TCG_REG_GUEST_BASE, otype, addr_reg);
> +                               TCG_REG_GUEST_BASE, option, addr_reg);
>      } else {
>          tcg_out_qemu_st_direct(s, memop, data_reg,
> -                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
> +                               addr_reg, option, TCG_REG_XZR);
>      }
>  #endif /* CONFIG_SOFTMMU */
>  }


--=20
Alex Benn=C3=A9e


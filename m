Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155105AFE7
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jun 2019 15:39:17 +0200 (CEST)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hha31-0002dj-Ky
	for lists+qemu-devel@lfdr.de; Sun, 30 Jun 2019 09:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47255)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hha1p-0002CX-My
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 09:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hha1l-0002RQ-Pi
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 09:38:01 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:47079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hha1j-0002OQ-RT
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 09:37:57 -0400
Received: by mail-oi1-x244.google.com with SMTP id 65so7810040oid.13
 for <qemu-devel@nongnu.org>; Sun, 30 Jun 2019 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gm1WQ1n7WexGK2fTG7M6zWYTVuyjfAw8H9M6qAhKb+E=;
 b=J3W5UfzhN96b7W5s6J7lnopgxHMZ/MabvnG0tanbGPgPgNb8xvgT4YfdJpWsDIUa9g
 KuAmi4ibCes49CBmdsNnbRfPmHA8u+b6GovEcDJb6XaitVBuUFfF7PceL64BqXDLwAqB
 QFoSOFrkjgMp/UTk5vMZPA3TknybBCx7HGRL3BB26AWnhHAZPlT3sdwz2osmN9dI1oXg
 C2BsSObRu7LKtNX9dlwt4HIo9B/Ry0XkmGrrLtq5wXfHbpAM8cDop+QV5QX49YDHjqr+
 tPqE2Xe9HtIrDwYY70+6+9dum7ANpJxBOYFwzIVH0DOWy8JwL1iiyKRpE3aX1IvdV6aL
 U76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gm1WQ1n7WexGK2fTG7M6zWYTVuyjfAw8H9M6qAhKb+E=;
 b=ViFRTsojcOFVNjwS0p8vUQVoB4wFPB3XqfWQsM5Z0HkmKXeQ9SWdcjpxj0cswAAvJk
 cpD9bUInq+G5CCJsPbINw/vJI1MWbcSQR3iJopLzpfb4MTbgxIXhhxU3G7Q5W1S7Rqg2
 yZqsEoGY9rvNEGS3XPaE63hWSJy55kxPzvcUNGeaM0dqpUAuvcdrU5XDUIcLttBSKg40
 eX4zt41T1N2yCr1N/daPee908pEY5vmCx+U163nQJzw/dF1/tQf9r+THO2T1s4QqFxJ8
 Dm7jKRN1ChMiknG9eDhYo/V4lOGTfTmBvpIBGYtRIaX9z21+m/szYxua0IDeBoW7xzVu
 RHVA==
X-Gm-Message-State: APjAAAXiWz5aXt8eeb/YbACSTLGUIwDPwiPDKkCEhqJFJiswq53jyuwz
 Ugl/OtBT8RZLsqiLMkEZSSk3vT+PmoQM75Em4Nk=
X-Google-Smtp-Source: APXvYqzjPSVKLOkPJ6Ac+QyZvhQOWnim3xxlnNFdj50pCV+H3oqfolvQHOmnf+w+/pVBeik9GwvcHzPsdxJUa2ZQLv4=
X-Received: by 2002:aca:310a:: with SMTP id x10mr4087740oix.62.1561901874147; 
 Sun, 30 Jun 2019 06:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Sun, 30 Jun 2019 06:37:53
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Sun, 30 Jun 2019 06:37:53
 -0700 (PDT)
In-Reply-To: <20190629130017.2973-16-richard.henderson@linaro.org>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
 <20190629130017.2973-16-richard.henderson@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sun, 30 Jun 2019 15:37:53 +0200
Message-ID: <CAL1e-=ghMjUtEyqKX+s15RcyQp6uQO_hJ_u4RTSJ5ZyPvFnymw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v6 15/16] tcg/ppc: Update vector support to
 v2.07
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 29, 2019 3:14 PM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> This includes single-word loads and stores, lots of double-word
> arithmetic, and a few extra logical operations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  tcg/ppc/tcg-target.h     |   3 +-
>  tcg/ppc/tcg-target.inc.c | 128 ++++++++++++++++++++++++++++++---------
>  2 files changed, 103 insertions(+), 28 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index 40544f996d..b8355d0a56 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -61,6 +61,7 @@ typedef enum {
>  extern bool have_isa_altivec;
>  extern bool have_isa_2_06;
>  extern bool have_isa_2_06_vsx;
> +extern bool have_isa_2_07_vsx;
>  extern bool have_isa_3_00;
>
>  /* optional instructions automatically implemented */
> @@ -147,7 +148,7 @@ extern bool have_isa_3_00;
>  #define TCG_TARGET_HAS_v256             0
>
>  #define TCG_TARGET_HAS_andc_vec         1
> -#define TCG_TARGET_HAS_orc_vec          0
> +#define TCG_TARGET_HAS_orc_vec          have_isa_2_07_vsx
>  #define TCG_TARGET_HAS_not_vec          1
>  #define TCG_TARGET_HAS_neg_vec          0
>  #define TCG_TARGET_HAS_abs_vec          0
> diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
> index 50d1b5612c..af86ab07dd 100644
> --- a/tcg/ppc/tcg-target.inc.c
> +++ b/tcg/ppc/tcg-target.inc.c
> @@ -67,6 +67,7 @@ static tcg_insn_unit *tb_ret_addr;
>  bool have_isa_altivec;
>  bool have_isa_2_06;
>  bool have_isa_2_06_vsx;
> +bool have_isa_2_07_vsx;

Does this flag indicate support for PowerISA 2.07 or VSX?

If VSX support is implied by PowerISA 2.07, then =E2=80=9C_vsx=E2=80=9D suf=
fix is really
not needed. If not, why are there two flavors of =E2=80=9C2_06=E2=80=9D fla=
gs (with and
without _vsx), and only one flavor if 2.07 (with _vsx) flg variables?

>  bool have_isa_3_00;
>
>  #define HAVE_ISA_2_06  have_isa_2_06
> @@ -473,10 +474,12 @@ static int tcg_target_const_match(tcg_target_long
val, TCGType type,
>  #define LVEWX      XO31(71)
>  #define LXSDX      XO31(588)      /* v2.06 */
>  #define LXVDSX     XO31(332)      /* v2.06 */
> +#define LXSIWZX    XO31(12)       /* v2.07 */
>
>  #define STVX       XO31(231)
>  #define STVEWX     XO31(199)
>  #define STXSDX     XO31(716)      /* v2.06 */
> +#define STXSIWX    XO31(140)      /* v2.07 */
>
>  #define VADDSBS    VX4(768)
>  #define VADDUBS    VX4(512)
> @@ -487,6 +490,7 @@ static int tcg_target_const_match(tcg_target_long
val, TCGType type,
>  #define VADDSWS    VX4(896)
>  #define VADDUWS    VX4(640)
>  #define VADDUWM    VX4(128)
> +#define VADDUDM    VX4(192)       /* v2.07 */
>
>  #define VSUBSBS    VX4(1792)
>  #define VSUBUBS    VX4(1536)
> @@ -497,47 +501,62 @@ static int tcg_target_const_match(tcg_target_long
val, TCGType type,
>  #define VSUBSWS    VX4(1920)
>  #define VSUBUWS    VX4(1664)
>  #define VSUBUWM    VX4(1152)
> +#define VSUBUDM    VX4(1216)      /* v2.07 */
>
>  #define VMAXSB     VX4(258)
>  #define VMAXSH     VX4(322)
>  #define VMAXSW     VX4(386)
> +#define VMAXSD     VX4(450)       /* v2.07 */
>  #define VMAXUB     VX4(2)
>  #define VMAXUH     VX4(66)
>  #define VMAXUW     VX4(130)
> +#define VMAXUD     VX4(194)       /* v2.07 */
>  #define VMINSB     VX4(770)
>  #define VMINSH     VX4(834)
>  #define VMINSW     VX4(898)
> +#define VMINSD     VX4(962)       /* v2.07 */
>  #define VMINUB     VX4(514)
>  #define VMINUH     VX4(578)
>  #define VMINUW     VX4(642)
> +#define VMINUD     VX4(706)       /* v2.07 */
>
>  #define VCMPEQUB   VX4(6)
>  #define VCMPEQUH   VX4(70)
>  #define VCMPEQUW   VX4(134)
> +#define VCMPEQUD   VX4(199)       /* v2.07 */
>  #define VCMPGTSB   VX4(774)
>  #define VCMPGTSH   VX4(838)
>  #define VCMPGTSW   VX4(902)
> +#define VCMPGTSD   VX4(967)       /* v2.07 */
>  #define VCMPGTUB   VX4(518)
>  #define VCMPGTUH   VX4(582)
>  #define VCMPGTUW   VX4(646)
> +#define VCMPGTUD   VX4(711)       /* v2.07 */
>
>  #define VSLB       VX4(260)
>  #define VSLH       VX4(324)
>  #define VSLW       VX4(388)
> +#define VSLD       VX4(1476)      /* v2.07 */
>  #define VSRB       VX4(516)
>  #define VSRH       VX4(580)
>  #define VSRW       VX4(644)
> +#define VSRD       VX4(1732)      /* v2.07 */
>  #define VSRAB      VX4(772)
>  #define VSRAH      VX4(836)
>  #define VSRAW      VX4(900)
> +#define VSRAD      VX4(964)       /* v2.07 */
>  #define VRLB       VX4(4)
>  #define VRLH       VX4(68)
>  #define VRLW       VX4(132)
> +#define VRLD       VX4(196)       /* v2.07 */
>
>  #define VMULEUB    VX4(520)
>  #define VMULEUH    VX4(584)
> +#define VMULEUW    VX4(648)       /* v2.07 */
>  #define VMULOUB    VX4(8)
>  #define VMULOUH    VX4(72)
> +#define VMULOUW    VX4(136)       /* v2.07 */
> +#define VMULUWM    VX4(137)       /* v2.07 */
>  #define VMSUMUHM   VX4(38)
>
>  #define VMRGHB     VX4(12)
> @@ -555,6 +574,9 @@ static int tcg_target_const_match(tcg_target_long
val, TCGType type,
>  #define VNOR       VX4(1284)
>  #define VOR        VX4(1156)
>  #define VXOR       VX4(1220)
> +#define VEQV       VX4(1668)      /* v2.07 */
> +#define VNAND      VX4(1412)      /* v2.07 */
> +#define VORC       VX4(1348)      /* v2.07 */
>
>  #define VSPLTB     VX4(524)
>  #define VSPLTH     VX4(588)
> @@ -568,6 +590,11 @@ static int tcg_target_const_match(tcg_target_long
val, TCGType type,
>  #define XXPERMDI   (OPCD(60) | (10 << 3))   /* v2.06 */
>  #define XXSEL      (OPCD(60) | (3 << 4))    /* v2.06 */
>
> +#define MFVSRD     XO31(51)       /* v2.07 */
> +#define MFVSRWZ    XO31(115)      /* v2.07 */
> +#define MTVSRD     XO31(179)      /* v2.07 */
> +#define MTVSRWZ    XO31(179)      /* v2.07 */
> +
>  #define RT(r) ((r)<<21)
>  #define RS(r) ((r)<<21)
>  #define RA(r) ((r)<<16)
> @@ -697,12 +724,27 @@ static bool tcg_out_mov(TCGContext *s, TCGType
type, TCGReg ret, TCGReg arg)
>          tcg_debug_assert(TCG_TARGET_REG_BITS =3D=3D 64);
>          /* fallthru */
>      case TCG_TYPE_I32:
> -        if (ret < TCG_REG_V0 && arg < TCG_REG_V0) {
> -            tcg_out32(s, OR | SAB(arg, ret, arg));
> -            break;
> -        } else if (ret < TCG_REG_V0 || arg < TCG_REG_V0) {
> -            /* Altivec does not support vector/integer moves.  */
> -            return false;
> +        if (ret < TCG_REG_V0) {
> +            if (arg < TCG_REG_V0) {
> +                tcg_out32(s, OR | SAB(arg, ret, arg));
> +                break;
> +            } else if (have_isa_2_07_vsx) {
> +                tcg_out32(s, (type =3D=3D TCG_TYPE_I32 ? MFVSRWZ : MFVSR=
D)
> +                          | VRT(arg) | RA(ret) | 1);
> +                break;
> +            } else {
> +                /* Altivec does not support vector->integer moves.  */
> +                return false;
> +            }
> +        } else if (arg < TCG_REG_V0) {
> +            if (have_isa_2_07_vsx) {
> +                tcg_out32(s, (type =3D=3D TCG_TYPE_I32 ? MTVSRWZ : MTVSR=
D)
> +                          | VRT(ret) | RA(arg) | 1);
> +                break;
> +            } else {
> +                /* Altivec does not support integer->vector moves.  */
> +                return false;
> +            }
>          }
>          /* fallthru */
>      case TCG_TYPE_V64:
> @@ -1140,6 +1182,10 @@ static void tcg_out_ld(TCGContext *s, TCGType
type, TCGReg ret,
>              tcg_out_mem_long(s, LWZ, LWZX, ret, base, offset);
>              break;
>          }
> +        if (have_isa_2_07_vsx) {
> +            tcg_out_mem_long(s, 0, LXSIWZX | 1, ret, base, offset);
> +            break;
> +        }
>          assert((offset & 3) =3D=3D 0);
>          tcg_out_mem_long(s, 0, LVEWX, ret, base, offset);
>          shift =3D (offset - 4) & 0xc;
> @@ -1187,6 +1233,10 @@ static void tcg_out_st(TCGContext *s, TCGType
type, TCGReg arg,
>              tcg_out_mem_long(s, STW, STWX, arg, base, offset);
>              break;
>          }
> +        if (have_isa_2_07_vsx) {
> +            tcg_out_mem_long(s, 0, STXSIWX | 1, arg, base, offset);
> +            break;
> +        }
>          assert((offset & 3) =3D=3D 0);
>          shift =3D (offset - 4) & 0xc;
>          if (shift) {
> @@ -2907,26 +2957,37 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType
type, unsigned vece)
>      case INDEX_op_andc_vec:
>      case INDEX_op_not_vec:
>          return 1;
> +    case INDEX_op_orc_vec:
> +        return have_isa_2_07_vsx;
>      case INDEX_op_add_vec:
>      case INDEX_op_sub_vec:
>      case INDEX_op_smax_vec:
>      case INDEX_op_smin_vec:
>      case INDEX_op_umax_vec:
>      case INDEX_op_umin_vec:
> +    case INDEX_op_shlv_vec:
> +    case INDEX_op_shrv_vec:
> +    case INDEX_op_sarv_vec:
> +        return vece <=3D MO_32 || have_isa_2_07_vsx;
>      case INDEX_op_ssadd_vec:
>      case INDEX_op_sssub_vec:
>      case INDEX_op_usadd_vec:
>      case INDEX_op_ussub_vec:
> -    case INDEX_op_shlv_vec:
> -    case INDEX_op_shrv_vec:
> -    case INDEX_op_sarv_vec:
>          return vece <=3D MO_32;
>      case INDEX_op_cmp_vec:
> -    case INDEX_op_mul_vec:
>      case INDEX_op_shli_vec:
>      case INDEX_op_shri_vec:
>      case INDEX_op_sari_vec:
> -        return vece <=3D MO_32 ? -1 : 0;
> +        return vece <=3D MO_32 || have_isa_2_07_vsx ? -1 : 0;
> +    case INDEX_op_mul_vec:
> +        switch (vece) {
> +        case MO_8:
> +        case MO_16:
> +            return -1;
> +        case MO_32:
> +            return have_isa_2_07_vsx ? 1 : -1;
> +        }
> +        return 0;
>      case INDEX_op_bitsel_vec:
>          return have_isa_2_06_vsx;
>      default:
> @@ -3030,28 +3091,28 @@ static void tcg_out_vec_op(TCGContext *s,
TCGOpcode opc,
>                             const TCGArg *args, const int *const_args)
>  {
>      static const uint32_t
> -        add_op[4] =3D { VADDUBM, VADDUHM, VADDUWM, 0 },
> -        sub_op[4] =3D { VSUBUBM, VSUBUHM, VSUBUWM, 0 },
> -        eq_op[4]  =3D { VCMPEQUB, VCMPEQUH, VCMPEQUW, 0 },
> -        gts_op[4] =3D { VCMPGTSB, VCMPGTSH, VCMPGTSW, 0 },
> -        gtu_op[4] =3D { VCMPGTUB, VCMPGTUH, VCMPGTUW, 0 },
> +        add_op[4] =3D { VADDUBM, VADDUHM, VADDUWM, VADDUDM },
> +        sub_op[4] =3D { VSUBUBM, VSUBUHM, VSUBUWM, VSUBUDM },
> +        eq_op[4]  =3D { VCMPEQUB, VCMPEQUH, VCMPEQUW, VCMPEQUD },
> +        gts_op[4] =3D { VCMPGTSB, VCMPGTSH, VCMPGTSW, VCMPGTSD },
> +        gtu_op[4] =3D { VCMPGTUB, VCMPGTUH, VCMPGTUW, VCMPGTUD },
>          ssadd_op[4] =3D { VADDSBS, VADDSHS, VADDSWS, 0 },
>          usadd_op[4] =3D { VADDUBS, VADDUHS, VADDUWS, 0 },
>          sssub_op[4] =3D { VSUBSBS, VSUBSHS, VSUBSWS, 0 },
>          ussub_op[4] =3D { VSUBUBS, VSUBUHS, VSUBUWS, 0 },
> -        umin_op[4] =3D { VMINUB, VMINUH, VMINUW, 0 },
> -        smin_op[4] =3D { VMINSB, VMINSH, VMINSW, 0 },
> -        umax_op[4] =3D { VMAXUB, VMAXUH, VMAXUW, 0 },
> -        smax_op[4] =3D { VMAXSB, VMAXSH, VMAXSW, 0 },
> -        shlv_op[4] =3D { VSLB, VSLH, VSLW, 0 },
> -        shrv_op[4] =3D { VSRB, VSRH, VSRW, 0 },
> -        sarv_op[4] =3D { VSRAB, VSRAH, VSRAW, 0 },
> +        umin_op[4] =3D { VMINUB, VMINUH, VMINUW, VMINUD },
> +        smin_op[4] =3D { VMINSB, VMINSH, VMINSW, VMINSD },
> +        umax_op[4] =3D { VMAXUB, VMAXUH, VMAXUW, VMAXUD },
> +        smax_op[4] =3D { VMAXSB, VMAXSH, VMAXSW, VMAXSD },
> +        shlv_op[4] =3D { VSLB, VSLH, VSLW, VSLD },
> +        shrv_op[4] =3D { VSRB, VSRH, VSRW, VSRD },
> +        sarv_op[4] =3D { VSRAB, VSRAH, VSRAW, VSRAD },
>          mrgh_op[4] =3D { VMRGHB, VMRGHH, VMRGHW, 0 },
>          mrgl_op[4] =3D { VMRGLB, VMRGLH, VMRGLW, 0 },
> -        muleu_op[4] =3D { VMULEUB, VMULEUH, 0, 0 },
> -        mulou_op[4] =3D { VMULOUB, VMULOUH, 0, 0 },
> +        muleu_op[4] =3D { VMULEUB, VMULEUH, VMULEUW, 0 },
> +        mulou_op[4] =3D { VMULOUB, VMULOUH, VMULOUW, 0 },
>          pkum_op[4] =3D { VPKUHUM, VPKUWUM, 0, 0 },
> -        rotl_op[4] =3D { VRLB, VRLH, VRLW, 0 };
> +        rotl_op[4] =3D { VRLB, VRLH, VRLW, VRLD };
>
>      TCGType type =3D vecl + TCG_TYPE_V64;
>      TCGArg a0 =3D args[0], a1 =3D args[1], a2 =3D args[2];
> @@ -3074,6 +3135,10 @@ static void tcg_out_vec_op(TCGContext *s,
TCGOpcode opc,
>      case INDEX_op_sub_vec:
>          insn =3D sub_op[vece];
>          break;
> +    case INDEX_op_mul_vec:
> +        tcg_debug_assert(vece =3D=3D MO_32 && have_isa_2_07_vsx);
> +        insn =3D VMULUWM;
> +        break;
>      case INDEX_op_ssadd_vec:
>          insn =3D ssadd_op[vece];
>          break;
> @@ -3123,6 +3188,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode
opc,
>          insn =3D VNOR;
>          a2 =3D a1;
>          break;
> +    case INDEX_op_orc_vec:
> +        insn =3D VORC;
> +        break;
>
>      case INDEX_op_cmp_vec:
>          switch (args[3]) {
> @@ -3203,7 +3271,7 @@ static void expand_vec_cmp(TCGType type, unsigned
vece, TCGv_vec v0,
>  {
>      bool need_swap =3D false, need_inv =3D false;
>
> -    tcg_debug_assert(vece <=3D MO_32);
> +    tcg_debug_assert(vece <=3D MO_32 || have_isa_2_07_vsx);
>
>      switch (cond) {
>      case TCG_COND_EQ:
> @@ -3267,6 +3335,7 @@ static void expand_vec_mul(TCGType type, unsigned
vece, TCGv_vec v0,
>         break;
>
>      case MO_32:
> +        tcg_debug_assert(!have_isa_2_07_vsx);
>          t3 =3D tcg_temp_new_vec(type);
>          t4 =3D tcg_temp_new_vec(type);
>          tcg_gen_dupi_vec(MO_8, t4, -16);
> @@ -3562,6 +3631,11 @@ static void tcg_target_init(TCGContext *s)
>              have_isa_2_06_vsx =3D true;
>          }
>      }
> +    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
> +        if (hwcap & PPC_FEATURE_HAS_VSX) {
> +            have_isa_2_07_vsx =3D true;
> +        }
> +    }
>  #ifdef PPC_FEATURE2_ARCH_3_00
>      if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
>          have_isa_3_00 =3D true;
> --
> 2.17.1
>
>

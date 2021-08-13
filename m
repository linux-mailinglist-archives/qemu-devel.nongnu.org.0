Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C423EB425
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 12:40:12 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEUbj-0004uf-8z
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 06:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEUaK-0003ct-RS
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 06:38:44 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEUaI-0008Al-MN
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 06:38:44 -0400
Received: by mail-ej1-x62a.google.com with SMTP id z20so17495082ejf.5
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cjJboWpIzhrZFUjJO+oeK63oTXM7M0euAD78tR+7FR4=;
 b=bkzUaSRPnN9X4PTgKbgIR600+m++i45zsM3soxhIgFa1v1oonxPad1oH+9f0jhHVsD
 lwH9/K/6XKpHLhVJC4zjKxvLOShd82//ctm8OW3fQT6LlL+g/c5UP+7X0AgGX2q0O2+M
 6FyED7SYfmoaBNCR1Qrkpk4Bwb9MY1Eo7pt2IIC7kMAGfYlhHtK7XLmbTg2X5vHp+J+G
 JMMWTtkHqc5x+mAZUYwDtqlwg4k/GtySNH3uVqWOFkXOO+mozQ9LIOPQjpL31D1Et+zB
 Ti5aHF6PnaO+W9WdHFccjwqbo5JA5yQgJj0OXGHIs0CgXrvThSvrpMpcawVml1ZQrTbF
 WlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cjJboWpIzhrZFUjJO+oeK63oTXM7M0euAD78tR+7FR4=;
 b=SHm8a9Ob9edsQmiXCdtiXCI7hMsSdReT7rA7XSeSIOHtq/TXOOHpyGBb7HokovK15M
 nNiU5nMCnWCxxYvzWbWFIYm3dUhH9DMmjiyG0wYSLHnNDLFtMDHKnx8BxcxoE+drNWth
 qE93Z3HfPKKos82I/bI6Ix3EdTqAfU3vyStiyBWS7MXCMmsmQ3SRlugKqMmkrDMnNdZX
 7VNsFezX7jgXmhAv7LrP2VHBY271LSR3P/JVgQdKp0ejH5FSCdFj94BDDGz8SEoH3Oda
 B43C7BN0kUQ56fqaMRAejJnVOE0EQbJw8awHYICAmSyVAMb+kWFXvOQRCDFYhri7gc8X
 RpOQ==
X-Gm-Message-State: AOAM53231nLVbvuWn7g61oL2eEFbM/sKf66cAhCm5JZAmBJd5srHHDKu
 06QoCxoVWSE0BefsOLpPSNDkQ++N7k200jq7ztTOjQ==
X-Google-Smtp-Source: ABdhPJxrgGetbBG4bRJmYdyGKgox6acLaWUe+L8Q5P/6z/3/ZkcoBXiZt7Hxen5U/3DvPfgiYQVWx/H6LFxM9IDtkFA=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr1734924ejf.482.1628851120964; 
 Fri, 13 Aug 2021 03:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
In-Reply-To: <20210810232530.1033519-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 11:37:55 +0100
Message-ID: <CAFEAcA8J4WBFiLUTJAXduST4v+cz7-5s3KPJJY05LVizN_9PcA@mail.gmail.com>
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Aug 2021 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need to be able to represent VEX.W on a 32-bit host, where REX.W
> will always be zero.  Fixes the encoding for VPSLLVQ and VPSRLVQ.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/385
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 98d924b91a..997510109d 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -241,8 +241,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>  #define P_EXT          0x100           /* 0x0f opcode prefix */
>  #define P_EXT38         0x200           /* 0x0f 0x38 opcode prefix */
>  #define P_DATA16        0x400           /* 0x66 opcode prefix */
> +#define P_VEXW          0x1000          /* Set VEX.W = 1 */
>  #if TCG_TARGET_REG_BITS == 64
> -# define P_REXW         0x1000          /* Set REX.W = 1 */
> +# define P_REXW         P_VEXW          /* Set REX.W = 1; match VEXW */
>  # define P_REXB_R       0x2000          /* REG field as byte register */
>  # define P_REXB_RM      0x4000          /* R/M field as byte register */
>  # define P_GS           0x8000          /* gs segment override */
> @@ -410,13 +411,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>  #define OPC_VPBROADCASTW (0x79 | P_EXT38 | P_DATA16)
>  #define OPC_VPBROADCASTD (0x58 | P_EXT38 | P_DATA16)
>  #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
> -#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_REXW)
> +#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
>  #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
>  #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
> -#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_REXW)
> +#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
>  #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
>  #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
> -#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_REXW)
> +#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
>  #define OPC_VZEROUPPER  (0x77 | P_EXT)
>  #define OPC_XCHG_ax_r32        (0x90)
>
> @@ -576,7 +577,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
>
>      /* Use the two byte form if possible, which cannot encode
>         VEX.W, VEX.B, VEX.X, or an m-mmmm field other than P_EXT.  */
> -    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_REXW)) == P_EXT
> +    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_VEXW)) == P_EXT
>          && ((rm | index) & 8) == 0) {
>          /* Two byte VEX prefix.  */
>          tcg_out8(s, 0xc5);
> @@ -601,7 +602,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
>          tmp |= (rm & 8 ? 0 : 0x20);            /* VEX.B */
>          tcg_out8(s, tmp);
>
> -        tmp = (opc & P_REXW ? 0x80 : 0);       /* VEX.W */
> +        tmp = (opc & P_VEXW ? 0x80 : 0);       /* VEX.W */
>      }
>
>      tmp |= (opc & P_VEXL ? 0x04 : 0);      /* VEX.L */

These changes look OK as far as they go, but it's not clear to
me why the other places that set P_REXW are all OK to use P_REXW
and not P_VEXW. For instance tcg_out_mov() sets rexw = P_REXW
and some of the codepaths there will then pass that into
tcg_out_vex_modrm() which ends up in tcg_out_vex_opc().

More generally, is there somewhere we can assert that we
didn't try to use a REXW prefix for i386 codegen rather
than just silently ignoring it ?

thanks
-- PMM


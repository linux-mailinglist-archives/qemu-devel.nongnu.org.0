Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F1E30908A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:22:41 +0100 (CET)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5d62-0006Ge-Oy
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d4P-0005bD-Ct
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:20:53 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d4N-0001p2-Of
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:20:53 -0500
Received: by mail-ed1-x52e.google.com with SMTP id bx12so12461488edb.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/u/D0p6zoJzvscCd/b0tXvIvdzSy3csHwXB1lwZ2dD0=;
 b=j1DrleWgadATRd+kUEPL+BSn9mDcV+JHsnxuGZZEpOxrgxjArM+jtET3Z4PqxxxQTM
 44cG73X0Abku5108QwGoO5qYZY6vxN9hdtcCPEMaw941C/PiNOoSVbj1AC1kMIe9mrZ8
 9lgVFQlk6XvpUQ1FOancvEYKnjNoei36gQOizOpFezR4apixFIV84XX6Z1wL8eCoAWY5
 xyKvT0TtA5LSCGgcr3ohpefRgXIhLJRNuYX+9ek0grNumORhXS2GdEdC1di5pkEVekO+
 NNtTK5sURQRj/fkoyLBo7vANVQqEM9PlXfg1VWuoDis5vjj1TQKlfSnUiJY1/KA3f0dS
 Ui+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/u/D0p6zoJzvscCd/b0tXvIvdzSy3csHwXB1lwZ2dD0=;
 b=jd9HZk+tS1Ms8itjLrlXS5ySnQcAXnhkDj/507kYBYRBuiCdTpgLxVV1L/cDYPqgzw
 uzd/+rxM/RME2BqZxKn5Tb/eN3bUYo8KVaNE8PpuUYs2BFOV/j0wJdf90AF4SEDS43w1
 zxzjLxSJAh7Ma9OlBQzqeCWqqPXwohUnOXgabSKzjSnxpMOVnQCefMjRi6aERbS+vq//
 gWjqgx5jyfI29HN456C4DylBnA1gMw3UoEDYdveCkTceAiqiieRrEs+fNsBaEom5Msps
 BUnSeEK9J5JR7z0tWiP7ttzSJvsjYdRCXy7PdmGLAoY1MryfLpctW1njfAzD/8uvBdGY
 n0Kg==
X-Gm-Message-State: AOAM5309ZOFe+yG0gUvTcUcbyhYNxYTY10l6bpkVlWsmZvZdypXF76UV
 nW6OrWyttWd8Lh0z/YaNTM9rXybBv2lV7UkQFv1bXw==
X-Google-Smtp-Source: ABdhPJxRohYcDnP6CTGzMqRg4nyfm/+T9WB3jYIPWUrbxeFAcOU01QrYbdKKhthruZh7KSF256h3tjWtehF3TXFla+g=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr7680750edu.251.1611962450107; 
 Fri, 29 Jan 2021 15:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-5-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:20:39 +0000
Message-ID: <CAFEAcA_L-vs8d+EMN3WAy3m8cBqtGtkRgy_6_SYLWGuMDSTFFA@mail.gmail.com>
Subject: Re: [PATCH v3 04/24] tcg/i386: Tidy register constraint definitions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Fri, 29 Jan 2021 at 20:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create symbolic constants for all low-byte-addressable
> and second-byte-addressable registers.  Create a symbol
> for the registers that need reserving for softmmu.
>
> There is no functional change for 's', as this letter is
> only used for i386.  The BYTEL name is correct for the
> action we wish from the constraint.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 40 +++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> @@ -226,11 +234,11 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>          break;
>      case 'q':
>          /* A register that can be used as a byte operand.  */
> -        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xf;
> +        ct->regs |= ALL_BYTEL_REGS;
>          break;
>      case 'Q':
>          /* A register with an addressable second byte (e.g. %ah).  */
> -        ct->regs = 0xf;
> +        ct->regs |= ALL_BYTEH_REGS;
>          break;
>      case 'r':
>          /* A general register.  */
> @@ -247,19 +255,11 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>
>      case 'L':
>          /* qemu_ld/st data+address constraint */
> -        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
> -#ifdef CONFIG_SOFTMMU
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
> -#endif
> +        ct->regs |= ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS;
>          break;
>      case 's':
>          /* qemu_st8_i32 data constraint */
> -        ct->regs = 0xf;
> -#ifdef CONFIG_SOFTMMU
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
> -#endif
> +        ct->regs |= ALL_BYTEL_REGS & ~SOFTMMU_RESERVE_REGS;
>          break;

Should these cases really be ORing in these expressions
rather than just using '=' the way the old code was?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


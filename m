Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF842B899
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:10:57 +0200 (CEST)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYPg-0004BI-Pg
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYNY-0002TV-61
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:08:44 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYNW-00035c-JV
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:08:43 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 5so1657322iov.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=650eW90FfktmXQhA+QgzUhyjgXJ5WzrouIb/sIyotrQ=;
 b=mYRj69hDrz/9seJLvNVjaelMllpQHTehmaoXFOaDzjfMRK/yZyCwXzojELjGr3D7S2
 +xX/zW3RgtU8xNWn9EYxPOd0wOSfyZTHcogPV34oedt/NWFKpcQFxN3iPUe4veD5X4c2
 MfvdsvFucTeLIACxRsuzTlU0MTWQgJf3hGy3Nsh6zJqBdOj7JbMTZn6qN8CF0DohiUxT
 1HALyXtHoBxp+B7Q1xvd/ASxlbS9DVgXSf/GgJ0av9yBe6URVvqVLwfRgcC8j3qij3UL
 XBR4SHchnDztALcoqc5jBVqFCb7CXyNdZIErpfIk+Je16wozrlCCMano8SWKZjx3qXbz
 Q1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=650eW90FfktmXQhA+QgzUhyjgXJ5WzrouIb/sIyotrQ=;
 b=1quCqCohQ6TBzRRxQUI0fpJYQoy2uo9It5Z/t2tyRrMx5MBxOjRF0HLizEnrEMycvf
 BLaPnSJIUX1J5hRHJSboXG+tvt1WecFabMvD0FJndh/3pJA7RXjql+NXL4rsAAGaotvN
 kJ+OGQH/yBM220Z70aOQUYF1jg3bmuLIzikOvpNTCjEjohBIj36HVpI8Oo1y0+Def6uE
 Rk/V9jas6rlDmjuq0Gf7Iu2q7p+MTOoLt7CKkSE8HnbiAPV+C8TF3CSGfhylbRLZXXCT
 hxjVJgPs4hpQpcmhpac/7LbNDiW6bYrizhk16unKDzfYzrYArpfh4gTlQvShudFJQ1u7
 TE7w==
X-Gm-Message-State: AOAM5303yBLDlvPbMCzK7v3kWBbBGs+WYwVYKMOWVPYK2vIyDggL7UTJ
 vrnZCrMcSaOhn++TqA73JPiKyDFd+mhemXAqXEE=
X-Google-Smtp-Source: ABdhPJz+557ZhryjIVX666LAnMla5/QITQXqPZYcR9TValD4b7EVsPUvht1EFajSUFDL2YJAdrYj3hhGghhdZgOdjBs=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr8974306iow.91.1634108921551; 
 Wed, 13 Oct 2021 00:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-9-richard.henderson@linaro.org>
In-Reply-To: <20211010174401.141339-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:08:14 +1000
Message-ID: <CAKmqyKM8pcgQUV-d2VMkCh0mSo8K9foUtVbN+t1LF7DpFUgiHw@mail.gmail.com>
Subject: Re: [PATCH 8/8] target/riscv: Support TCG_TARGET_SIGNED_ADDR32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
Cc: git@xen0n.name, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 3:50 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All RV64 32-bit operations sign-extend the output, so we are easily
> able to keep TCG_TYPE_I32 values sign-extended in host registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target-sa32.h | 6 +++++-
>  tcg/riscv/tcg-target.c.inc  | 8 ++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
> index cb185b1526..703467b37a 100644
> --- a/tcg/riscv/tcg-target-sa32.h
> +++ b/tcg/riscv/tcg-target-sa32.h
> @@ -1 +1,5 @@
> -#define TCG_TARGET_SIGNED_ADDR32 0
> +/*
> + * Do not set TCG_TARGET_SIGNED_ADDR32 for RV32;
> + * TCG expects this to only be set for 64-bit hosts.
> + */
> +#define TCG_TARGET_SIGNED_ADDR32  (__riscv_xlen == 64)
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 9b13a46fb4..9426ef8926 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -952,10 +952,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
>      tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
>
>      /* TLB Hit - translate address using addend.  */
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
> -        addrl = TCG_REG_TMP0;
> -    }
>      tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
>  }
>
> @@ -1126,7 +1122,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>                          data_regl, data_regh, addr_regl, addr_regh,
>                          s->code_ptr, label_ptr);
>  #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
>          tcg_out_ext32u(s, base, addr_regl);
>          addr_regl = base;
>      }
> @@ -1192,7 +1188,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>                          data_regl, data_regh, addr_regl, addr_regh,
>                          s->code_ptr, label_ptr);
>  #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
>          tcg_out_ext32u(s, base, addr_regl);
>          addr_regl = base;
>      }
> --
> 2.25.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51D5911D0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:04:26 +0200 (CEST)
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVGz-0007yu-5t
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMVDr-0005pK-My
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:01:11 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMVDn-00025G-SR
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:01:10 -0400
Received: by mail-ej1-x636.google.com with SMTP id dc19so2166622ejb.12
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 07:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=UXa0Pabual+iQu/vNcU9hBH3Mwq/wUZ/0AlBXbFhSog=;
 b=ZNNy3GXPS+toKrm0uyMlOEU5SUZ46e+FP+btmYlLVuP2sludnLWKpv0AFpNKxNAx68
 1oQfDDS6oUHC30Mt055WFxkNqyAC5y9lnyQmdwtM6mmZkkLz+xVElUD0as2sTM06KyEO
 mPqEA4EboD2PZXqdatGhr8WtH4PBqaKjRfOtlOhH4Y84LbXZ/T6ux7SqMqbLbn+MrK3z
 otiZHJouhZFy8irk8wUP5Ujmvwlnds+dRXeAtozLFfEnMdGaQh77d2Un9Fo0c9EIxYej
 zoQ38XpwbHleYZS1jaLeaE2FEiHj5e0IoFnmEKhJ1g5ip6kUQQ8pvxpnlIQGzuvFMQu0
 /XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=UXa0Pabual+iQu/vNcU9hBH3Mwq/wUZ/0AlBXbFhSog=;
 b=uI6OLR5f66vts8DC0jN4Tuoxwjdp0g7eU3gNEMSRPzsQ+PmiCtQv0qsORd1zHTmiTc
 RtAkOsW4bph9yCb10aJYQ98z0Oty1MBzkxsga3XnZyOXPuNOiU1UWmT4zkBZV3EbbgEd
 /tC+GOPIGyEe0vi5EBU/gYxjm9mCmHZO1orICmUe00Y1ZgEtnxgwFgw4Zxk7fumoCkB5
 HuGJbbajpRsyAC4hEAiqGfYzcAndUN5cdTVQgGp51er/kBpPdaLxviatJiDaM6AUkWAO
 y+STxsef4CaTi7e7Ps6NjYT4TVmBl4vyqfvamFFbVvZH/yaMTL3x2m1mxPjwG8X66+PG
 YnxA==
X-Gm-Message-State: ACgBeo1c04ZH/nJ8NyBgWBy7pdR//Mxxx5ifI+fvmP8l/yoNM931929A
 8rDfeytc3vVC/tMY0txMjZJd1w==
X-Google-Smtp-Source: AA6agR6Kxl/DNpwQVTTYqUtdCg5EU0FTw8/EgPqinu2F7pyQBQrxBn4mK2pebVcOImyJ9hsDx1g71A==
X-Received: by 2002:a17:907:1629:b0:730:7d10:639c with SMTP id
 hb41-20020a170907162900b007307d10639cmr2726872ejc.256.1660312865634; 
 Fri, 12 Aug 2022 07:01:05 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 b25-20020aa7dc19000000b0043d668dec21sm1384083edu.38.2022.08.12.07.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:01:04 -0700 (PDT)
Date: Fri, 12 Aug 2022 16:01:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/2] target/riscv: fence.i: update decode pattern
Message-ID: <20220812140103.3lbh45oidiw2fhsf@kamzik>
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Please use a cover-letter for multi-patch patch series.

On Fri, Aug 12, 2022 at 03:13:03PM +0200, Philipp Tomsich wrote:
> The RISC-V specification specifies imm12, rs1 and rd to be all-zeros,
> so we can't ignore these bits when decoding into fence.i.
> 
> Update the decode pattern to reflect the specification.

I got hung-up on this for a bit since there isn't any "must-be-0" fields,
only ignored fields, but the next patch gives a clue which helped me make
sense of this. The encoding of these instructions with ignored fields set
to anything except zero gets into reserved instruction territory, and QEMU
may legally raise an illegal-instruction in that case, which this patch
will start doing. It'd be nice to have a bit more text in this commit
message to make that clear.

> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
> 
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 014127d066..089128c3dc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -151,7 +151,7 @@ sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
>  fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> -fence_i  ---- ----   ----   ----- 001 ----- 0001111
> +fence_i  000000000000     00000 001 00000 0001111
                        ^ need two more spaces here to line up with fence.

>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
>  csrrc    ............     ..... 011 ..... 1110011 @csr
> -- 
> 2.34.1
> 
> 

Thanks,
drew


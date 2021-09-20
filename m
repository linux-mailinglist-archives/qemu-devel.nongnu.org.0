Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67480411799
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:52:44 +0200 (CEST)
Received: from localhost ([::1]:36914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKex-0003di-Dh
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKD5-0006hx-AK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:23:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKD0-0003TS-Km
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:23:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso15313276pjh.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iK40LVoaUjoehC97s3HJua3eFTydHYwAyVVhgyegr+M=;
 b=AtB8N5A8txfXs1ksRPWCVQnpLu2Ib3C1ZG6OOe9FlRpsvLrXM7kJnomUuZ2TSHkRrF
 olSdk1ulih1G5mwsB3IjvGNKb5ZM6ZVpsmMtah38LON5e40vW964ozI2FDItf//FJZQ2
 wWKYYV1NxHBina0Fu96wruQ1ziMeP76/aSKNvRQqkbI9xheCIJ8WxniDaIG/4ewIGK2E
 P5uP6ij94y3hYFQm37co+iYfDoOqqc76ki6PPEdcN/EYlC9aCjNCZMvxP0r0UBqarm+G
 I2bh6gD2MSG47S+vAe8RHbrbeYhAG3q3/mg4wyuoDpo9ATEMGXSTXmU9Xh1WYO1alu0d
 Np/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iK40LVoaUjoehC97s3HJua3eFTydHYwAyVVhgyegr+M=;
 b=E465pvoFtRimVVEBY+cOzZC1scSCQ1eRVMIxsnaI4hHHppQScL4jops8YO6kC2LO7K
 h6LADU4HI1r5xRerYnZIMtzfv/4B4sBZilple3Ola0WQ5eTN9S6uPM8xOd+t/1WQJVfe
 5rBt6q/1e60tHgWFemDlQ2LRjSacAAgFFjWJAcPbhEhPWTXuuxaFfodgSED3Syr+leZq
 6nLt8GOG/6NKWWOD/5+wdfah4s31MAvs0kW3LlvluuOLFGcn/VNK5CUuJkRkx1UFJnby
 n0OP91joPsEzRfjpcBZNJTvgipcqzRf6kuhSCBZV+Gj2U9ieu3SW3ouX/jinS5Ir96+K
 zlEQ==
X-Gm-Message-State: AOAM532L84G0QxdbvrqDYmOb8tSPKChU+toDsgllpLHUSJNxNDuDTLDJ
 jS0VP+Y/sVi6IGrFkJ564tuJm2NolOUHXw==
X-Google-Smtp-Source: ABdhPJyw3WhU7sI2E4TNDln0ddoesdL5+YYMq1O/umvkdZofduzGVDA+SUy3aRqoWObtUnAJJ/Dg/Q==
X-Received: by 2002:a17:903:11c8:b0:138:d85a:7f09 with SMTP id
 q8-20020a17090311c800b00138d85a7f09mr23138508plh.75.1632147828012; 
 Mon, 20 Sep 2021 07:23:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id cp17sm13347666pjb.3.2021.09.20.07.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:23:47 -0700 (PDT)
Subject: Re: [PATCH 03/30] tcg/loongarch: Add the tcg-target.h file
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-4-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5104c22-e09f-d8b9-3429-fec2c52a7494@linaro.org>
Date: Mon, 20 Sep 2021 07:23:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-4-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target.h | 183 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 183 insertions(+)
>   create mode 100644 tcg/loongarch/tcg-target.h
> 
> diff --git a/tcg/loongarch/tcg-target.h b/tcg/loongarch/tcg-target.h
> new file mode 100644
> index 0000000000..b5e70e01b5
> --- /dev/null
> +++ b/tcg/loongarch/tcg-target.h
> @@ -0,0 +1,183 @@
> +/*
> + * Tiny Code Generator for QEMU
> + *
> + * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
> + *
> + * Based on tcg/riscv/tcg-target.h
> + *
> + * Copyright (c) 2018 SiFive, Inc

You may have copied too much from the riscv port?  :-)

> +/*
> + * Loongson removed the (incomplete) 32-bit support from kernel and toolchain
> + * for the initial upstreaming of this architecture, so don't bother and just
> + * support the LP64 ABI for now.
> + */
> +#if defined(__loongarch64)
> +# define TCG_TARGET_REG_BITS 64
> +#else
> +# error unsupported LoongArch bitness

s/bitness/register size/


> +#define TCG_TARGET_TLB_DISPLACEMENT_BITS 20

Hmm.  I was about to say this is more copying from riscv, and should be X, but now I see 
that this is no longer used.  You can omit it now; I'll remove the other instances myself.

> +/* optional instructions */
> +#define TCG_TARGET_HAS_movcond_i32      0
> +#define TCG_TARGET_HAS_div_i32          1
> +#define TCG_TARGET_HAS_rem_i32          1
> +#define TCG_TARGET_HAS_div2_i32         0
> +#define TCG_TARGET_HAS_rot_i32          1
> +#define TCG_TARGET_HAS_deposit_i32      1
> +#define TCG_TARGET_HAS_extract_i32      1
> +#define TCG_TARGET_HAS_sextract_i32     0
> +#define TCG_TARGET_HAS_extract2_i32     0
> +#define TCG_TARGET_HAS_add2_i32         0
> +#define TCG_TARGET_HAS_sub2_i32         0
> +#define TCG_TARGET_HAS_mulu2_i32        0
> +#define TCG_TARGET_HAS_muls2_i32        0
> +#define TCG_TARGET_HAS_muluh_i32        1
> +#define TCG_TARGET_HAS_mulsh_i32        1
> +#define TCG_TARGET_HAS_ext8s_i32        1
> +#define TCG_TARGET_HAS_ext16s_i32       1
> +#define TCG_TARGET_HAS_ext8u_i32        1
> +#define TCG_TARGET_HAS_ext16u_i32       1
> +#define TCG_TARGET_HAS_bswap16_i32      0
> +#define TCG_TARGET_HAS_bswap32_i32      1
> +#define TCG_TARGET_HAS_not_i32          1
> +#define TCG_TARGET_HAS_neg_i32          1
> +#define TCG_TARGET_HAS_andc_i32         1
> +#define TCG_TARGET_HAS_orc_i32          1
> +#define TCG_TARGET_HAS_eqv_i32          0
> +#define TCG_TARGET_HAS_nand_i32         0
> +#define TCG_TARGET_HAS_nor_i32          1
> +#define TCG_TARGET_HAS_clz_i32          1
> +#define TCG_TARGET_HAS_ctz_i32          1
> +#define TCG_TARGET_HAS_ctpop_i32        0
> +#define TCG_TARGET_HAS_direct_jump      0
> +#define TCG_TARGET_HAS_brcond2          0
> +#define TCG_TARGET_HAS_setcond2         0
> +#define TCG_TARGET_HAS_qemu_st8_i32     0
> +
> +#if TCG_TARGET_REG_BITS == 64

You don't need this conditional, since you've asserted it at the top (and unlike riscv, 
have no plans to add support for riscv32 at some future point).


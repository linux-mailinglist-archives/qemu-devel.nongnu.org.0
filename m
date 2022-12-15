Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0564D770
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5j0z-0001cC-6X; Thu, 15 Dec 2022 02:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5j0w-0001Zf-7h
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:50:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5j0u-0007IV-Fr
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:50:45 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h16so2119614wrz.12
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 23:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kG90cX51CgB5sfBsvEgMd6uUEROk/xkCy/q0Yudzfn8=;
 b=p+bsPCh6k0oYk13FlCic5ReloYQLNWBbkplYrjVYGOPHxsno6Z+DnVRYXVthRxHI4O
 FF1iH5Sx5ZIixxsKRmXf3q9A6/3iHigdH9bFtflBUh4zydnam3SuzSzhzPENduJyjuAp
 8ZAOKLS3MVCfuv2155+R1SAmwLKWG0ABRbvGRqpLdUtV6U00rS7Ku9pvjzYii90Q1K5z
 8qh6T6PIkLkf9vEdsW8rdA7UiWRlcOLQJFDjsWQhlNxZL63EFjQZk+5hkqfKg0ZdCX1C
 0JPSOgdPQxdVJ8M6Ng+6/0CN6xm4nccDtCHYC6nOeYda36TagSPjJ4KCYb0w4Eqnbega
 pu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kG90cX51CgB5sfBsvEgMd6uUEROk/xkCy/q0Yudzfn8=;
 b=eJ/tpA/ey/5EUHhLinki7Dm6J0YKxz49FHqsoYkipu3WIe5K2n3limZqMLuDe9X9M/
 Y4kXy3jOBqAZ8BaA92yfdoAqjoOItG8kOoKtNjwwIkwpZ46+ZYZlI8QniBbmT/ffgvUG
 GKowGXjbMML4eHs0029/qmsYev4I1eAMzlYWy+0sgIL1LeG2W5u5WdZSvs36MCqrLgTQ
 zcCRuA7133gsPRAa6UHlLHWq0zQPqh1SIvqSjzLsaPH7Srs2g8LcuRjv3i+GgvFuAa17
 6Z5D5NY0YorIehpvDBFOBGL843RxVywB2zv7mRnQgmg3J3o+Fs20ORJ3AXkcbwTCagln
 2KKA==
X-Gm-Message-State: ANoB5pns3oDEYYBdoPCRBo6o7gdPaN4+RqrH1hbq9bSW73cqUDAT+DP/
 9cHPUTaLH12t0YzOOZC9fCYy3A==
X-Google-Smtp-Source: AA0mqf6qf8xILOCtXAeug73KMCi3cObu2VXr8lmvnUAmoCEs4MfZxdea1mC/SebFqOKiY9vIdW5Rsw==
X-Received: by 2002:a5d:4b0b:0:b0:241:fd7c:4ce4 with SMTP id
 v11-20020a5d4b0b000000b00241fd7c4ce4mr16478196wrq.21.1671090642784; 
 Wed, 14 Dec 2022 23:50:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b00241c6729c2bsm5116439wrb.26.2022.12.14.23.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 23:50:42 -0800 (PST)
Message-ID: <f6a305b3-692a-28fd-2587-a7e17b0fe363@linaro.org>
Date: Thu, 15 Dec 2022 08:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/8] tcg/loongarch64: Update tcg-insn-defs.c.inc
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
 <20221206044051.322543-4-richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206044051.322543-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 05:40, Richard Henderson wrote:
> Regenerate with ADDU16I included.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-insn-defs.c.inc | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
> index d162571856..c3c8669b4b 100644
> --- a/tcg/loongarch64/tcg-insn-defs.c.inc
> +++ b/tcg/loongarch64/tcg-insn-defs.c.inc
> @@ -4,7 +4,7 @@
>    *
>    * This file is auto-generated by genqemutcgdefs from
>    * https://github.com/loongson-community/loongarch-opcodes,
> - * from commit 961f0c60f5b63e574d785995600c71ad5413fdc4.

Odd, addu16i.d is present since 3d057a6, so was already in 961f0c6.

> + * from commit 6ffbaddacacfcd5bdc893a49a165b8549d385eea.
>    * DO NOT EDIT.
>    */
>   
> @@ -74,6 +74,7 @@ typedef enum {
>       OPC_ANDI = 0x03400000,
>       OPC_ORI = 0x03800000,
>       OPC_XORI = 0x03c00000,
> +    OPC_ADDU16I_D = 0x10000000,
>       OPC_LU12I_W = 0x14000000,
>       OPC_CU32I_D = 0x16000000,
>       OPC_PCADDU2I = 0x18000000,
> @@ -710,6 +711,13 @@ tcg_out_opc_xori(TCGContext *s, TCGReg d, TCGReg j, uint32_t uk12)
>       tcg_out32(s, encode_djuk12_insn(OPC_XORI, d, j, uk12));
>   }
>   
> +/* Emits the `addu16i.d d, j, sk16` instruction.  */
> +static void __attribute__((unused))
> +tcg_out_opc_addu16i_d(TCGContext *s, TCGReg d, TCGReg j, int32_t sk16)
> +{
> +    tcg_out32(s, encode_djsk16_insn(OPC_ADDU16I_D, d, j, sk16));
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>




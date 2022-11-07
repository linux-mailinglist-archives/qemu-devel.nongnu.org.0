Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD17620388
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:14:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBIj-0003UO-8N; Mon, 07 Nov 2022 18:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBIg-0003Tf-8G
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:13:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBIe-0001V2-Hg
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:13:06 -0500
Received: by mail-wr1-x432.google.com with SMTP id z14so18413110wrn.7
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fbd2F3WhfZBOG9/vord+0b+DJQMEIuHIX+Rsc1+DDbw=;
 b=eNBwHDjrNsLI7xMcWA/uG6QfHPpiuyZ4XYDSUpTSjWwVaOxpXDYie4K9dwWdPIeHGo
 DQ8vu3yMNi6Le43XkcLSfSiwfOCDVNG+Ni5ljS7Y5L6sMxTkw4wRVo3GFU8zFwhZr89F
 kQQ7P6DY72pDKUPZ4qEjwVbYZpz/QyrAAsZHpz39GpSFJeVEoRxj2pKv7BnCIsagr158
 vXK0GXYjVTg8GJiTmu1pNfYiSuDsyG9LgHNym/AAHlTthdkolyl8YNs0xmUeuLSSpB+L
 z1Y89y4Ay4BQYpukJ/VwkQVRDUpW9PtZYSt/iM4xopZlSvM4mrHH55yw1IhgYchhMsK2
 xxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fbd2F3WhfZBOG9/vord+0b+DJQMEIuHIX+Rsc1+DDbw=;
 b=RSQ83Bw9vlyNioc4Ps5NVPs1KF0CBOormNYvKX3q06mdPCBKfqgl83Q7/mkiz6W6JN
 eFbtpbWJBIcJDP1DUCVbWpHdMw3XyvrvVV0ytzvGkj/ISRSeSQRvBDD5KJrQWAvqMCgX
 5c16zQ7F1PHUR63p6n3pnJclsNwlss9eqzauvi8wFt5LuSelDXqA5vIRjpqvrwQRnK0Q
 7uhQE0vyRRaHCPE/nh82X+5cvl94/OQNY/+uAgkJsCblYfcw0JqLHyxYb5qOWdnrVkt+
 jRP0BPr9FjNJ9O1+pWWa1K1Jzm7vMnWA3AciyztS2QNd0RdASulpHNQU2rmBdokQ/s51
 0O+g==
X-Gm-Message-State: ACrzQf3Jb+3pM9J6vGhfBylopFU934zE7Bsk4lsZtiWPG2qGcXVcKMdJ
 Bs1bmycpwvIMrFqV/9n7CfkxGA==
X-Google-Smtp-Source: AMsMyM6Qei/3kt/cCaaT8od8ZbOAVmH8Qgl8CTtQBNIkxHAOFv9c3npMgVLFr0UeSskmpIHIqppjlA==
X-Received: by 2002:a5d:4a46:0:b0:236:ea45:1e3d with SMTP id
 v6-20020a5d4a46000000b00236ea451e3dmr23036393wrs.38.1667862781966; 
 Mon, 07 Nov 2022 15:13:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n14-20020adfe34e000000b002366ded5864sm8554217wrj.116.2022.11.07.15.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:13:01 -0800 (PST)
Message-ID: <3e42ffb9-0a3d-0eac-2263-d8aa0d6ff198@linaro.org>
Date: Tue, 8 Nov 2022 00:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] target/mips: enable LBX/LWX/* instructions for Octeon
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, jiaxun.yang@flygoat.com
References: <166728058455.229236.13834649461181619195.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166728058455.229236.13834649461181619195.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 1/11/22 06:29, Pavel Dovgalyuk wrote:
> This patch changes condition and function name for enabling
> indexed load instructions for Octeon vCPUs. Octeons do not
> have DSP extension, but implement LBX-and-others.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/mips/tcg/translate.c |   10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index c3f92ea652..6248143c62 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -12173,12 +12173,16 @@ enum {
>   #include "nanomips_translate.c.inc"
>   
>   /* MIPSDSP functions. */
> -static void gen_mipsdsp_ld(DisasContext *ctx, uint32_t opc,
> +
> +/* Indexed load is not for DSP only */
> +static void gen_mips_lx(DisasContext *ctx, uint32_t opc,
>                              int rd, int base, int offset)
>   {
>       TCGv t0;
>   
> -    check_dsp(ctx);
> +    if (!(ctx->insn_flags & INSN_OCTEON)) {

Ideally we'd need to check CP0 reg 9 select 7 bit 12 (USEUN in
Cavium Control) is set, otherwise these instrs are a NOP.

I presume QEMU Octeon emulation expects CvmCtl[USEUN] to be set
to be more useful; therefore:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        check_dsp(ctx);
> +    }
>       t0 = tcg_temp_new();
>   
>       if (base == 0) {
> @@ -14523,7 +14527,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
>           case OPC_LBUX:
>           case OPC_LHX:
>           case OPC_LWX:
> -            gen_mipsdsp_ld(ctx, op2, rd, rs, rt);
> +            gen_mips_lx(ctx, op2, rd, rs, rt);
>               break;
>           default:            /* Invalid */
>               MIPS_INVAL("MASK LX");
> 



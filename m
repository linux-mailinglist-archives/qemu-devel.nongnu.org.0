Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DFC415063
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:16:25 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7jD-0004pZ-QR
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT77o-0005Ib-Aq
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:37:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT77m-0004hG-Fu
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:37:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so9675935wrr.9
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DT7RDjBZGhuRmXIb31cF9NK5Swrp4rXbkXt8CzPtyAc=;
 b=hVjAJ+TccARnGVPHjkYSx66nN7vaOWcyksNzodsRXHEfbsLYJlXhyogYbsBWwnS/y7
 hjMx10ykoUqtj/J1XsShF24V22+ehHzKJ8nnryYRDgBUTFvny4/pSi03Xh40j9+Psxxj
 AL01x3uHGTWfpRaZ6XM2kYSCvzLJllWk+vL7v8+nZ6i7CKKWuYsp7AqhhojIYDBIHxTZ
 K467BuffsgZTepr42u5YruZ2WTZ4OjDDl63sY/mt0dg+sjhnbmKMVtxflyRq7sDShM3F
 EE3V5/Vmf6xFK5tIUX5Lo3VvCPptyaksSE4RYFo7ySPfECN527poHcZ/kp6tVo9/6UqS
 rb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DT7RDjBZGhuRmXIb31cF9NK5Swrp4rXbkXt8CzPtyAc=;
 b=2uSCg0JgnTvMmqkhS1nCHve1XbAK7rTikmbAFPEwsJFnSTt4BWkefRBF9b0Xg+L8cL
 FCzGeanPXKGKIGrg5WFsHctLOoUPD1g9pk0WauQ57ezXx+k15HOfvxNRNPKye+v7ZdbZ
 SwJMXS57oANjF+uH1FwD/gNDvSfiabREMqLSOX+zmX3NpI9VhoZ0TRDpc+TFIjYKo8Vy
 ddQVFpL7p+YlbI5zFVxfL5dX50yOidVz2IHT1QEnN32QEj4hqA2QoM7vdzPJioa1GFDq
 xfV3TVz6FjOK1XLgyQvgO++PY1EgWE+eEgQbod2VECqrQ+11NyFaaDiRhZ/WaYcYIAsq
 7u6A==
X-Gm-Message-State: AOAM5337sCpucgcPMOYMFmDg8J/vTRFX/83OyUX9Eki5Z+FT4RC5jeiD
 AcOulyXL/WiHJAWGxsaJGno=
X-Google-Smtp-Source: ABdhPJzVlY8W0vkK5SUbpDWZyO+VdSM8QS9aGnkhFcbZeUOF8WD68u3HrtNCybAVmlUbtqvVEp46Nw==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr597411wmd.20.1632335861039; 
 Wed, 22 Sep 2021 11:37:41 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 131sm6257580wmc.20.2021.09.22.11.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:37:40 -0700 (PDT)
Message-ID: <c3bb4d03-62bb-5b5e-caa4-7c8a90059eac@amsat.org>
Date: Wed, 22 Sep 2021 20:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-5-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922180927.666273-5-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 20:09, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-insn-defs.c.inc | 881 ++++++++++++++++++++++++++++
>   1 file changed, 881 insertions(+)
>   create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
> 
> diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
> new file mode 100644
> index 0000000000..7d73136b1b
> --- /dev/null
> +++ b/tcg/loongarch64/tcg-insn-defs.c.inc
> @@ -0,0 +1,881 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * LoongArch instruction formats, opcodes, and encoders for TCG use.
> + *
> + * Code generated by genqemutcgdefs from
> + * https://github.com/loongson-community/loongarch-opcodes,
> + * from commit 308d38087401eb333063556f027ce0b24d86b416.
> + * DO NOT EDIT.

The generated code ...

> + */
> +
> +typedef enum {
> +    OPC_CLZ_W = 0x00001400,
> +    OPC_CTZ_W = 0x00001c00,
> +    OPC_CLZ_D = 0x00002400,
> +    OPC_CTZ_D = 0x00002c00,
> +    OPC_REVB_2H = 0x00003000,
> +    OPC_REVB_2W = 0x00003800,
> +    OPC_REVB_D = 0x00003c00,
> +    OPC_SEXT_H = 0x00005800,
> +    OPC_SEXT_B = 0x00005c00,
> +    OPC_ADD_W = 0x00100000,
> +    OPC_ADD_D = 0x00108000,
> +    OPC_SUB_W = 0x00110000,
> +    OPC_SUB_D = 0x00118000,
> +    OPC_SLT = 0x00120000,
> +    OPC_SLTU = 0x00128000,
> +    OPC_MASKEQZ = 0x00130000,
> +    OPC_MASKNEZ = 0x00138000,
> +    OPC_NOR = 0x00140000,
> +    OPC_AND = 0x00148000,
> +    OPC_OR = 0x00150000,
> +    OPC_XOR = 0x00158000,
> +    OPC_ORN = 0x00160000,
> +    OPC_ANDN = 0x00168000,
> +    OPC_SLL_W = 0x00170000,
> +    OPC_SRL_W = 0x00178000,
> +    OPC_SRA_W = 0x00180000,
> +    OPC_SLL_D = 0x00188000,
> +    OPC_SRL_D = 0x00190000,
> +    OPC_SRA_D = 0x00198000,
> +    OPC_ROTR_W = 0x001b0000,
> +    OPC_ROTR_D = 0x001b8000,
> +    OPC_MUL_W = 0x001c0000,
> +    OPC_MULH_W = 0x001c8000,
> +    OPC_MULH_WU = 0x001d0000,
> +    OPC_MUL_D = 0x001d8000,
> +    OPC_MULH_D = 0x001e0000,
> +    OPC_MULH_DU = 0x001e8000,
> +    OPC_DIV_W = 0x00200000,
> +    OPC_MOD_W = 0x00208000,
> +    OPC_DIV_WU = 0x00210000,
> +    OPC_MOD_WU = 0x00218000,
> +    OPC_DIV_D = 0x00220000,
> +    OPC_MOD_D = 0x00228000,
> +    OPC_DIV_DU = 0x00230000,
> +    OPC_MOD_DU = 0x00238000,
> +    OPC_SLLI_W = 0x00408000,
> +    OPC_SLLI_D = 0x00410000,
> +    OPC_SRLI_W = 0x00448000,
> +    OPC_SRLI_D = 0x00450000,
> +    OPC_SRAI_W = 0x00488000,
> +    OPC_SRAI_D = 0x00490000,
> +    OPC_ROTRI_W = 0x004c8000,
> +    OPC_ROTRI_D = 0x004d0000,
> +    OPC_BSTRINS_W = 0x00600000,
> +    OPC_BSTRPICK_W = 0x00608000,
> +    OPC_BSTRINS_D = 0x00800000,
> +    OPC_BSTRPICK_D = 0x00c00000,
> +    OPC_SLTI = 0x02000000,
> +    OPC_SLTUI = 0x02400000,
> +    OPC_ADDI_W = 0x02800000,
> +    OPC_ADDI_D = 0x02c00000,
> +    OPC_CU52I_D = 0x03000000,
> +    OPC_ANDI = 0x03400000,
> +    OPC_ORI = 0x03800000,
> +    OPC_XORI = 0x03c00000,
> +    OPC_LU12I_W = 0x14000000,
> +    OPC_CU32I_D = 0x16000000,
> +    OPC_PCADDU2I = 0x18000000,
> +    OPC_PCADDU12I = 0x1c000000,
> +    OPC_PCADDU18I = 0x1e000000,
> +    OPC_LD_B = 0x28000000,
> +    OPC_LD_H = 0x28400000,
> +    OPC_LD_W = 0x28800000,
> +    OPC_LD_D = 0x28c00000,
> +    OPC_ST_B = 0x29000000,
> +    OPC_ST_H = 0x29400000,
> +    OPC_ST_W = 0x29800000,
> +    OPC_ST_D = 0x29c00000,
> +    OPC_LD_BU = 0x2a000000,
> +    OPC_LD_HU = 0x2a400000,
> +    OPC_LD_WU = 0x2a800000,
> +    OPC_DBAR = 0x38720000,
> +    OPC_JIRL = 0x4c000000,
> +    OPC_B = 0x50000000,
> +    OPC_BL = 0x54000000,
> +    OPC_BEQ = 0x58000000,
> +    OPC_BNE = 0x5c000000,
> +    OPC_BGT = 0x60000000,
> +    OPC_BLE = 0x64000000,
> +    OPC_BGTU = 0x68000000,
> +    OPC_BLEU = 0x6c000000,
> +} LoongArchInsn;

... ends here, right? ...

> +
> +static int32_t __attribute__((unused))
> +encode_d_slot(LoongArchInsn opc, uint32_t d)
> +{
> +    return opc | d;
> +}
> +
> +static int32_t __attribute__((unused))
> +encode_dj_slots(LoongArchInsn opc, uint32_t d, uint32_t j)
> +{
> +    return opc | d | j << 5;
> +}
> +
> +static int32_t __attribute__((unused))
> +encode_djk_slots(LoongArchInsn opc, uint32_t d, uint32_t j, uint32_t k)
> +{
> +    return opc | d | j << 5 | k << 10;
> +}
> +
> +static int32_t __attribute__((unused))
> +encode_djkm_slots(LoongArchInsn opc, uint32_t d, uint32_t j, uint32_t k,
> +                  uint32_t m)
> +{
> +    return opc | d | j << 5 | k << 10 | m << 16;
> +}
> +
> +static int32_t __attribute__((unused))
> +encode_dk_slots(LoongArchInsn opc, uint32_t d, uint32_t k)
> +{
> +    return opc | d | k << 10;
> +}
> +
> +static int32_t __attribute__((unused))
> +encode_dj_insn(LoongArchInsn opc, TCGReg d, TCGReg j)
> +{
> +    tcg_debug_assert(d >= 0 && d <= 0x1f);
> +    tcg_debug_assert(j >= 0 && j <= 0x1f);
> +    return encode_dj_slots(opc, d, j);
> +}

... or are these helpers also generated?


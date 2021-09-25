Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40A4180FA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:15:06 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4i0-000250-OZ
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4gA-0000Yw-Fi
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:13:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4g8-00028J-Lz
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:13:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id t8so35052710wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GHOew5oMJOktN14yXJjhStGWHfDjvSv3JwIxvSQzKco=;
 b=C9E9F3/oFfr6XdzLWqr+qCTDHd72tB4pzDCNKFEkEQOL8wENAxep/gsM+cxb3BscJn
 kIqR/49o013/L5KZ10EWHFB7T1C3acS8bUH7czOhIn9JdgGD+yNF4s4lD5FoRkM7deBx
 slUSCj20HeEVgjd74zZrBk8JKXnVwRTI2AnY8PLP8HbdyrGoSDcvbeXSeYiE8rvdkaCw
 ctRgO5whs5wwRJJLtOem7TUVDgYXMg2JKKRgnnmArW/68bwEkUTAlcbnJxgf5rMqq327
 h9qfYrYglSedwobQLQOyTkyU3tdxv6IA6adrSB2URx+N/G0T5BsPA6UxT0r7dZ+HahyQ
 MfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GHOew5oMJOktN14yXJjhStGWHfDjvSv3JwIxvSQzKco=;
 b=LJI4fMouK1GTZUIrv71MaWtFNAuCO7tIF0MeVCOeqz78yyUgTV0iMELDKK73JfRbeN
 8esYaawWwbK6zlBA7iDiq5/pOgR7cBJ4mc2fpyM1FQMaHKnshvbFyJ9AzKxSNtblN4aQ
 nSX5Rtb1le9W29VWaFnWC2pH/zNZ/Moz7Q17yIjU8rQlwpiqdL1t1K6iNa9FCcWljcLz
 jdh25EVJxD/HTQU4V0rTffG9IpyK9pkZd+SIu/OFOzvPsj1NHWaEkqxD6LTI4FMSkAMu
 WEk+G/UeSGtDUM6kkVUrC5YweJYQn3QSH1wJY5PfoL8sYT1n5bg4pnzDJLnvuez+QGtS
 fJyg==
X-Gm-Message-State: AOAM5332SrKT9nS/wnohZ28Qb9fVMz3YXA2ksRUqOtoLDlVrNnE+RACG
 oNXnh7r+8znnZBJApvLB7gs=
X-Google-Smtp-Source: ABdhPJwUAdoHxdJ41GB5dLQFW2V6SadbSfEPf4f0MX2JSX2tp7tXwbLCRBgvDFrf0cw8IHOUz84Cnw==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr16200262wri.205.1632564787181; 
 Sat, 25 Sep 2021 03:13:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c9sm9243347wmb.41.2021.09.25.03.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:13:06 -0700 (PDT)
Message-ID: <cab5c9aa-3371-783c-1b4d-c4e265a272f2@amsat.org>
Date: Sat, 25 Sep 2021 12:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 19/30] tcg/loongarch64: Implement br/brcond ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-20-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-20-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.034,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  1 +
>   tcg/loongarch64/tcg-target.c.inc     | 53 ++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+)

> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index e3aac6c3de..d2339d823d 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -406,6 +406,44 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
>       tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
>   }
>   
> +/*
> + * Branch helpers
> + */
> +
> +static const struct {
> +    LoongArchInsn op;
> +    bool swap;
> +} tcg_brcond_to_loongarch[] = {

Richard, TCGCond is 4-bit, shouldn't we explicit this array
size to 16, and even better define TCG_COND_COUNT = 16 in
"tcg/tcg-cond.h"?

> +    [TCG_COND_EQ] =  { OPC_BEQ,  false },
> +    [TCG_COND_NE] =  { OPC_BNE,  false },
> +    [TCG_COND_LT] =  { OPC_BGT,  true  },
> +    [TCG_COND_GE] =  { OPC_BLE,  true  },
> +    [TCG_COND_LE] =  { OPC_BLE,  false },
> +    [TCG_COND_GT] =  { OPC_BGT,  false },
> +    [TCG_COND_LTU] = { OPC_BGTU, true  },
> +    [TCG_COND_GEU] = { OPC_BLEU, true  },
> +    [TCG_COND_LEU] = { OPC_BLEU, false },
> +    [TCG_COND_GTU] = { OPC_BGTU, false }
> +};

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


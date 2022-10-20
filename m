Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF7060625A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:59:42 +0200 (CEST)
Received: from localhost ([::1]:54700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olW54-0006AR-Pm
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:59:37 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVuf-0006hO-7V
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTdk-0004kk-DR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:23:08 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTdS-00083c-Ul
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:23:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so3161891pji.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4eI4hua//BBjk3jco+ZYdxRFiCwLlZJfiUPHwQxcsf4=;
 b=GaQU9Z+9e9U9EYiurEGr/8lCGoSOpy+oGq3eop/UlPRBzkbhngHFlpzzf0KvZfLVwQ
 vvJdN4jb7kAGiAWZRR9bESO2hgaLK/M8QFEPiUokXLsBZwxRIAlqDQo+dqZnZEKK8uCv
 r2U+Q3R4dFt3HGH86nmo8PvZT6Xt1M8q+a6S/IcndxjHl5PTAzBxlDjg5n7KDzAJZJeT
 OkqeDSQM2xUsicrKEGdXAeUUsgZpepVUt2KTgEejh5G2Bs0dZuLhzQgPh6qp2ntjfWWt
 XPSEQ34Dm3IMiF1qRV6rvZQO0pJHxu+HXYVSEw4ceMf9rlzspIJS2/MqYSAWV+3TCmAZ
 0ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4eI4hua//BBjk3jco+ZYdxRFiCwLlZJfiUPHwQxcsf4=;
 b=jQtA20xBCX5VFNcA3weDpCxA06XpZHmHB+6eqyYvFKVE6fZj4VVyPFWjE17K8ucbyY
 zTyO8HZcbVtyDCnhYHl3y3YZirp1NhErlWDea4MwY49bkqsdX5f0u1hEc1EU8WS00CSf
 xof21meyyoupmtMJpfmmXfrTlwVWxBtuBh5/p5nV1zBPsBxr21csQldPMbJd8HB5LoyG
 eE/sQ2raUniSrICYVFC1WwzUDADznl1xwJnWILEYd15mHqtR5cBq0mdJYG9vFGuGtpiZ
 SfrApboqXbMLetfKXeC6flNgppih5gOUUynY0wJzcjEyY+bgQ1xSNgL5e/edMgNU6D/3
 +W5g==
X-Gm-Message-State: ACrzQf1qd6RxNk0XAkslvZ3wRCe4BeDUpb3diH9samJd7Tq+5n0x+mCw
 G/Kwu/wJWXF9IriVyvkaOk1ovg==
X-Google-Smtp-Source: AMsMyM6Oeb3jdzdUrmpcyZiJp9qiSNQztrwYLa2e7MC04xwoNaq8VuLC8Bqa1c8zxQtxtZ6DRIKvRw==
X-Received: by 2002:a17:90b:4d0d:b0:20d:6fc0:51 with SMTP id
 mw13-20020a17090b4d0d00b0020d6fc00051mr43984815pjb.10.1666264969205; 
 Thu, 20 Oct 2022 04:22:49 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a056a00005200b00561b02e3118sm13138296pfk.106.2022.10.20.04.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:22:48 -0700 (PDT)
Message-ID: <49246207-2202-0239-65f5-1f0b44d8bd64@linaro.org>
Date: Thu, 20 Oct 2022 21:22:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 2/3] tcg/riscv: Fix tcg_out_opc_imm when imm exceeds
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/20/22 20:41, LIU Zhiwei wrote:
> TYPE-I immediate can only represent a signed 12-bit value. If immediate
> exceed, mov it to an register.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++++++++++-----
>   1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 32f4bc7bfc..bfdf2bea69 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -668,7 +668,12 @@ static void tcg_out_addsub2(TCGContext *s,
>       if (!cbh) {
>           tcg_out_opc_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);
>       } else if (bh != 0 || ah == rl) {
> -        tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
> +        if (bh == sextract(bh, 0, 12)) {
> +            tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
> +        } else {
> +            tcg_out_movi(s, TCG_TYPE_TL, th, (is_sub ? -bh : bh));
> +            tcg_out_opc_reg(s, opc_add, th, ah, th);
> +        }

This value is currently constrained by 'M': +/- 0xfff.
You're suggesting that the fix should be to use 'I', which is signed 12-bit.

But this fix is definitely in the wrong place.


r~


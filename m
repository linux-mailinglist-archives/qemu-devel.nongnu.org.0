Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24ED648F97
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 17:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42IS-0001px-Lf; Sat, 10 Dec 2022 11:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42IM-0001nT-Mr
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 11:01:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42IK-0003BS-RB
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 11:01:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id h11so7987814wrw.13
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 08:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aZaPiKuoBMnORxWWFOf727ZxQe1/qW3Kxb+uBdGC9Yw=;
 b=YTyg1+B0TUlCceqDjMpy79PXDyfB+DMq2Va0XwQMYBL315vnggVmyD1w2w5VCVGDIi
 gZjL1/qLXl7xp+VPaA4KGpCF6YoUKG8dbel+GaBhZpgL1ELTvps+buS3ZCzaNn5dIj+w
 xuXk5wut2UuH/+cjEktyi+5C0nCZjY73YLwuhwmmtliC1DEYRNEJpC8XS6W6T5l667qE
 +0/a0vK2AOJKfGsGTaPC4P4MidoliNUa0zPGx7VVh205mq2X84eykVa/DNu9I9XcNmTu
 cjtNKWJLIIkbQPQoEhccHDojfM9oRpopj0e2OCWtFjtERrEEmHzaRwaWIVSOFxldax7l
 PVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aZaPiKuoBMnORxWWFOf727ZxQe1/qW3Kxb+uBdGC9Yw=;
 b=Mt5T02g0bFODon+bcNzU1R+8d+rDv5SJpJpSXlelU4/GpE2MnLsCKdl7mdZTaiNjlj
 IzJDVRT2E5xMR+GG4j0BXJ2WpJm0mKuo5fmZ/Nce9rPWNGC/mIPprR6ACcvnuC5Xy9KB
 kJbl5gF+dyptJTOetmWVvjxwSc7KGUekqQ3fN29dcGOuSZblPsqdhztqWlN2lKOSzRuN
 B6kxD4v9xvZhx7GK/fflK5tYfBRVFMJgTGAwT3zwaW3fylmmBzo25isjKEQwTVhU/dyi
 SvDNR1W+bK0Vd5oXQCUZKOTa7ScUDsguwTyM+1sYLFuToePTSQ8hLWc/wY9IwPmnmvnQ
 gL7w==
X-Gm-Message-State: ANoB5pm70ZZvap3REAeGfd3mq4eUVv9qQDgui7gaZq9HfqIwMlWFNbyq
 idrs6Ht0ndmF0750tZnszAU5lrCD4g+gqpoP6TE=
X-Google-Smtp-Source: AA0mqf7WhFGGzlJwSHCtNSg0cIksAgUVoBWVP+M5xtQUqrJKGn1kkmMOr20aKOv9LnP17jW3kRfzkw==
X-Received: by 2002:adf:9d8c:0:b0:241:fc02:f904 with SMTP id
 p12-20020adf9d8c000000b00241fc02f904mr6924291wre.71.1670688102516; 
 Sat, 10 Dec 2022 08:01:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e6-20020adffc46000000b002425c6d30c6sm4763314wrs.117.2022.12.10.08.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 08:01:41 -0800 (PST)
Message-ID: <3c81cd7b-4055-a9fb-96f6-811917df9ba2@linaro.org>
Date: Sat, 10 Dec 2022 17:01:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 4/7] hw/mips/bootloader: Implement nanoMIPS LUI
 opcode
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221210155502.74609-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 10/12/22 16:54, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c | 29 ++++++++++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 7f7d938f2e..997e74ee52 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -120,11 +120,34 @@ static void bl_gen_jalr(void **p, bl_reg rs)
>       bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
>   }
>   
> +static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
> +{
> +    uint16_t *p = (uint16_t *)*ptr;
> +    uint32_t insn = 0;

Hmm we should check if imm20 fits in 20-bit.

> +    insn = deposit32(insn, 26, 6, 0b111000);
> +    insn = deposit32(insn, 21, 5, rt);
> +    insn = deposit32(insn, 12, 9, extract32(imm20, 12, 9));
> +    insn = deposit32(insn, 2, 10, extract32(imm20, 21, 10));
> +    insn = deposit32(insn, 0, 1, sextract32(imm20, 31, 1));
> +
> +    stw_p(p, insn >> 16);
> +    p++;
> +    stw_p(p, insn >> 0);
> +    p++;
> +
> +    *ptr = p;
> +}



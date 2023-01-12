Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18319667A64
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0Ag-0004bb-Gy; Thu, 12 Jan 2023 11:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pG0Ae-0004bJ-NL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:11:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pG0Ac-0004OG-QG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:11:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v2so7575545wrw.10
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FvPC/g0c7HRCcYmpQcZ/FjZ36Wo0Djb8ljBSwCV/IP8=;
 b=tffV73Zqa9mzlWk5k9zc061bGAn044F2uriMerxn1796eB7rouQhHj4MMVs5+B0pGt
 OFWtfc3GLkQFpBPn39o3utn63Bf5Ksp++IPW/ChBQ1YVCehnsmVCIPZ8LUJepbP8iYWg
 d5lrZkpKHXBHpL64IbU6AcSIQiliOq7HoKrjTGTH7aRqBlW8ub9vka8MfJuZwqNNm76r
 QStENN0RDvXyu96T+7iQTljd81ebvFFh/OZRZeSOgEPuNAz1hy82BNOu8OuI8uBjA5s2
 coCsPvqnL4Aw2CNx2EpRcCOs95m+5ddsvZ1s6TL9rhhEQYJcn+mbFgEbQGjVxz8Qpzed
 IbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FvPC/g0c7HRCcYmpQcZ/FjZ36Wo0Djb8ljBSwCV/IP8=;
 b=InVwwxGiiH1gOcvkvDHyjUCDzXh0qgyb6RWWhpBFAaFm1ItQsFESX8qgaDvn2zN9k3
 6YhKvp8KcXVXq4qyGvgcVw4aVZ+YgfEJTl4N6/h2SfFHwQuuT0h2DW30+6PDQbK8qiEc
 apKjaLHIgHb6C+DCnNFXiPsxRFtgPKHm7H9SHtuDl0XjPMgLl8RZTgorGtR0Fe6gN+PL
 /Jbfsp6UYEkAjaf0jH85dBuUkBH6A8Og2k2vVySOEiU9HdcK5lwyHRepg8CDRdwUk4VH
 9g1mmR7MTYCefGhCEwyHnLNmqZWM0ZlMc6mo2daWqYR0DP8pOq06iA97xbTDQkQ7hbjO
 tDcg==
X-Gm-Message-State: AFqh2kqTbIA5W3FBGU9JSiC6LB+L9PzPlKgQGH+vofeQD3qSKnRoLpvz
 SSNgAADg2tL4kQAgRv5Of4y7OA==
X-Google-Smtp-Source: AMrXdXvc2WTv4vqNDKqBZLPJbaGod3OP9qyahhs3UCpNRmX1gI58DIaH3LKxYTyxnzrSWCxuHaiCwQ==
X-Received: by 2002:adf:f206:0:b0:2bc:7e59:fd8e with SMTP id
 p6-20020adff206000000b002bc7e59fd8emr10168778wro.57.1673539873265; 
 Thu, 12 Jan 2023 08:11:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm13812118wrx.14.2023.01.12.08.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 08:11:12 -0800 (PST)
Message-ID: <84956702-ce6d-8a7d-6bf7-ee6f9a49881e@linaro.org>
Date: Thu, 12 Jan 2023 17:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/tricore: Fix OPC1_16_SRO_LD_H translation
Content-Language: en-US
To: Anton Kochkov <anton.kochkov@proton.me>, qemu-devel@nongnu.org
Cc: eitan_eliahu@hotmail.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20230112142258.514079-1-anton.kochkov@proton.me>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112142258.514079-1-anton.kochkov@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 12/1/23 15:24, Anton Kochkov wrote:

Fixes: 5a7634a28c ("target-tricore: Add instructions of SLR, SSRO and 
SRO opcode format")

> Signed-off-by: Eitan Eliahu <eitan_eliahu@hotmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/652
> ---
>   target/tricore/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index df9e46c649..b2a5e11778 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -3878,7 +3878,7 @@ static void decode_sro_opc(DisasContext *ctx, int op1)
>           gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_UB);
>           break;
>       case OPC1_16_SRO_LD_H:
> -        gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_LESW);
> +        gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 2, MO_LESW);

Good catch!

>           break;
>       case OPC1_16_SRO_LD_W:
>           gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 4, MO_LESL);
> --
> 2.39.0

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>




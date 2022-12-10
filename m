Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72369648F98
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 17:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42J8-0002H1-H6; Sat, 10 Dec 2022 11:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42J6-0002D2-56
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 11:02:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42J3-0004Ci-Ca
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 11:02:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n7so1955433wms.3
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5iFt0o4hp8oydr/H07T2l3xa0NAVDkbrs1bUMGd4sHo=;
 b=byBr6ezrpGQrUau/46h0OG1bCWDeFcV9DiRKu1PvA6iDdTcLbq9RA8FGxYur9/5Pnv
 NBweKvjJXGYi96D2lxjnzHIHEQxFzFGPJ5lsAOHoAmumgRcXlxeEtiDHbdWcuZ3D19rh
 M0WnAPINXmKjNH2K6YIhhQQCywra5fT871MLAa6ebQ81ZTH4XQFRr8aQLQONCzbID2Pu
 vebmQat27+QH7U0yIBMVKAl1CuywJ8CD+kmSKDzGm+wKIUDS0S18Rehj6wYQPL5pAO+r
 mwbJ6RgCDagNmjr7Od9i96CDk2bCZZsVkQnLOWfpkvSte6KAwqLrr7EqFZi0UC8b4F9H
 ZoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5iFt0o4hp8oydr/H07T2l3xa0NAVDkbrs1bUMGd4sHo=;
 b=ocud5ZWDBwcJnjtLVZxTOwW/dGcLrRfcbnoJF191ZGCiWzhe5lceVvuXUoYs/j2ttY
 1jrXU0HkTLcmr+7bc2v8i+AISmBoK5Zr6sqtH/EhgVKKNQtxex4LmIgSxyKGVWYzBPIF
 GiwamPSz9c7HcRap3DmdlMnHYbL09/L4j3+UO7a4EL9cvJSjpjuahLqe0pmPL5frBAWF
 5fyqyF+PTzyx/imDA7EbIV/T/fOAAGGG8yqOwYlQ4hyDYdvD6fSwzTtR6xopjUZ0MLfr
 GOmwrggT5F1TBZWYiFCzDmsWFmCToKqUc1TtQfvoQLn13gr969n6DhofsQUZL/9GUviw
 EIUw==
X-Gm-Message-State: ANoB5plhojuXKcO4tKOd40F3qXYlO/qHQaJEPh8whoReUkG5Xjn+JBWj
 2MECAdcuARlk+kzHL5n8DGbZeBTKlsXM6nIOUk0=
X-Google-Smtp-Source: AA0mqf6qPMltfquxy7wdlUt63Tnao7jkOoKX7OwZUIBeVqqRMt29j6TV7rnAL7ieYanbvlf/bpuIBA==
X-Received: by 2002:a05:600c:4f89:b0:3d1:caf1:3f56 with SMTP id
 n9-20020a05600c4f8900b003d1caf13f56mr7635322wmq.9.1670688147561; 
 Sat, 10 Dec 2022 08:02:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c364a00b003b95ed78275sm3091735wmq.20.2022.12.10.08.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 08:02:27 -0800 (PST)
Message-ID: <ffe60d4d-551a-bf4c-403e-7d64aed30a78@linaro.org>
Date: Sat, 10 Dec 2022 17:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 5/7] hw/mips/bootloader: Implement nanoMIPS SW
 opcode
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-6-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221210155502.74609-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 10/12/22 16:55, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 997e74ee52..cc3df385df 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -150,9 +150,31 @@ static void bl_gen_lui(void **p, bl_reg rt, uint32_t imm32)
>       }
>   }
>   
> +static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm)
> +{
> +    uint16_t *p = (uint16_t *)*ptr;
> +    uint32_t insn = 0;

Similarly, we should check whether imm fits in 12-bit.

> +    insn = deposit32(insn, 26, 6, 0b100000);
> +    insn = deposit32(insn, 21, 5, rt);
> +    insn = deposit32(insn, 16, 5, rs);
> +    insn = deposit32(insn, 0, 12, imm);
> +
> +    stw_p(p, insn >> 16);
> +    p++;
> +    stw_p(p, insn >> 0);
> +    p++;
> +
> +    *ptr = p;
> +}



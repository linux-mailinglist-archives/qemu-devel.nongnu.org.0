Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272BD68ABCC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 19:17:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pON5G-0004WW-1c; Sat, 04 Feb 2023 13:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pON5D-0004Vl-P8
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 13:16:15 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pON5C-0002hN-9m
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 13:16:15 -0500
Received: by mail-ej1-x62e.google.com with SMTP id p26so23566921ejx.13
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b/2gFN9pcHbU/n7PMf6iI+BKameeldqRF+zNCLe3aU4=;
 b=TzvLFLXjws7bVa2OOe+LM6KLm7XbIauRMmJur9A7mqOg1DCYCrJFUo6PggLvUPvcR5
 QcmlFIDW9yaSU/exXIJPAfqCpWdBfA/h5cws1HPMh2OEH0cz9Ga4NP1qWh14c0svFnS4
 xDoF98WhVbktqviQCyeocMnwSokgfqaaeYxrLLsdZuhjmdwHEsB+yBLmU8r6m2cSXww7
 NQudgz2DPkxFNXKmE9iNMPbaGktRAe9Dji0HYZisMpiyW0pXmTegY4HY3H5RUbUQLf9v
 HeGGWv1zYXQQZYE5gpC6KUDw9pXLSgfiXDV9rVsDJDk7w2rUcPo6C7T471FMA43Dgiwy
 mAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/2gFN9pcHbU/n7PMf6iI+BKameeldqRF+zNCLe3aU4=;
 b=Kchv0EzLaZ68lv4pZXteYgO7MNgKhP9arFBALQK14L+hecGYaBIHiYQJfszJA/gA/Q
 4BL/B7d8pfLA/0SSvCII9eQYYFxtkEqgJSyxCOfg4XRM7+R4AemA8LAWvJBx3F5uxP58
 xoCIzFTHO82JyeVEtAaq8Lz7XcJSeUNwgSMOcNrGmuRYvi5S3yHeIScc9Xxlx1HpC2I3
 329Or9pS39ewIaEB/8KIJrmKAjL5krPNy533uw3WW9Lp4/rm9bWftwWpHiMSKn0Y7+WQ
 TMXIirP/M9qvKo6ko0AApsJ69L6JqHs4JRK4a9Lrbr+sgqV9oZA72s52W/mza5I1L5U5
 5H/w==
X-Gm-Message-State: AO0yUKVFCQKRRWWTG3KH4iZEIHEoLUFcnP1/TXF4AcPkLeX3LMuHRdQu
 /6zGQZX2vOqy2HK/43uAotQczA==
X-Google-Smtp-Source: AK7set+YGFpErYDK/8911VyrfPP/xEVrRosVCjmZY0IkxDILYkz/obhhoSBspYqVptUwPDZNGHkuEA==
X-Received: by 2002:a17:906:c9d0:b0:884:fdb:6c41 with SMTP id
 hk16-20020a170906c9d000b008840fdb6c41mr16529703ejb.43.1675534572129; 
 Sat, 04 Feb 2023 10:16:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709063b8a00b0088b93bfa782sm3139665ejf.176.2023.02.04.10.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Feb 2023 10:16:11 -0800 (PST)
Message-ID: <a58e814a-322e-da47-b15a-e4a95fbf202a@linaro.org>
Date: Sat, 4 Feb 2023 19:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tcg: Init temp_subindex in liveness_pass_2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230203225928.4129774-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203225928.4129774-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 3/2/23 23:59, Richard Henderson wrote:
> Correctly handle large types while lowering.
> 
> Fixes: fac87bd2a49b ("tcg: Add temp_subindex to TCGTemp")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index fd557d55d3..bc60fd0fe8 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -3063,6 +3063,7 @@ static bool liveness_pass_2(TCGContext *s)
>               TCGTemp *dts = tcg_temp_alloc(s);
>               dts->type = its->type;
>               dts->base_type = its->base_type;
> +            dts->temp_subindex = its->temp_subindex;
>               dts->kind = TEMP_EBB;
>               its->state_ptr = dts;
>           } else {

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



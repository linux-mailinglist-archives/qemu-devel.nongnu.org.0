Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC6632967
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:29:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9dw-0000l6-Dj; Mon, 21 Nov 2022 11:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9du-0000gB-5t
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9do-0001vf-N3
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 5so8849132wmo.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CySiUVrnxrh8mc1VzGhNunFkpNonfmUDK16Ri5SP5Q=;
 b=TN3F3GPv66hdxJDYFoZE0MmiodKic4e2OPuY7eWo7ecV8ofIge0eDPVT/sLG5pcsXH
 dPyTeucH7iZYf2PascJptRMRltC+gh/jlameqozD7lAkRW9WCm5tkBlznBbFvT4RYwam
 +cxwSzvIfRjl3W1h+2M+8863I4ONCViJ6J+PxyptheokpryQJB7GFTxUuuBurzjRzluX
 ZJtidw41Hhf2VjMQZiggKcpNOtInzokFSW3g3M35AUnbxcBK9IAjsZ6eM58muOln8eYR
 4DtvyhuePVHAU1nEK/w0D/v5QII5W8KNTsjlN7ATytrmk/ovr/PbqyoESrooBzkSj6IV
 fppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CySiUVrnxrh8mc1VzGhNunFkpNonfmUDK16Ri5SP5Q=;
 b=joE3NVB/EYlVZsxga+M+68C4l0of915RDMJEL1BuOlB6gnSIprdF9XzpaKUZUzGuZr
 uYF3Ob+XbhzB51lm5k+c2dXU0iLXOCz1ArKki64auWS3xSbgM0DA/nvdGwlxrVTpaCLL
 uI/40EQXlBgmb4vVK/IaauuAkH9y5x74DzD4l+dh9rEpLMoHPVK48LeegrzZfZ6Nwfov
 z+PXS5o5U8IRiovZ55qnbVNQRb285C1byRr+PVPFOk0oKYI4v3RR6Tupq+I1nsmSXaRn
 UD6p5y3MWh509XbfjrnLpNEfH6Xmux0lwAxdVLCTrAIu2jB0HLNWPsB7tg31FPdGjsEv
 7WlA==
X-Gm-Message-State: ANoB5pnV7MoymWeKC48RSVJOBkSFOfra0KK0aW95GDjOPVoU+xT8JDcs
 SFaqgJatlA6dMd4cbjWxUY/6mYfzatoroA==
X-Google-Smtp-Source: AA0mqf6Lmvz50pFyrWNtJQ/42e9WAaj0o+RdTElAjC90RLIUs/2n2RELVVWtfW7x8yiLKJcMDa+QXw==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id
 x33-20020a05600c18a100b003cfa9d536c7mr16695865wmp.13.1669048047115; 
 Mon, 21 Nov 2022 08:27:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003cf6a55d8e8sm15587905wmq.7.2022.11.21.08.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:27:26 -0800 (PST)
Message-ID: <fcc52506-bc01-d83d-0c4b-438bfb3ab9e0@linaro.org>
Date: Mon, 21 Nov 2022 17:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 24/29] tcg/i386: Replace is64 with type in
 qemu_ld/st routines
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Prepare for TCG_TYPE_I128 by not using a boolean.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 54 ++++++++++++++++++++++++++-------------
>   1 file changed, 36 insertions(+), 18 deletions(-)


> @@ -2315,7 +2324,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>       }
>   }
>   
> -static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
> +static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
>   {
>       TCGReg datalo, datahi, addrlo;
>       TCGReg addrhi __attribute__((unused));
> @@ -2327,7 +2336,16 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)

Confusing git-diff context :)

>   #endif
>   
>       datalo = *args++;
> -    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +        datahi = 0;
> +        break;
> +    case TCG_TYPE_I64:
> +        datahi = (TCG_TARGET_REG_BITS == 32 ? *args++ : 0);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



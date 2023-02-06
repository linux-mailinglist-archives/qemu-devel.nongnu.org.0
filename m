Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C6268C825
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:01:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP8c9-0003ep-TX; Mon, 06 Feb 2023 16:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP8bv-0003W4-UP
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:01:11 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP8bo-0004tF-OA
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:01:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11794989wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 13:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0O8nnox3UHvSoVwaPBu6/pUkyeIh7ma50XiEkH3CVyY=;
 b=buS1Tu5Uco5jIT1/M0SnugMy3QGFD9to4k3WRXz8qw/O1Yrart+AvZZWKzr71MwfhP
 wvm6RWhkdwX5u+NQI7XQNd+bf+9Mn1XzyH5tUS7xco3A8/sXHWtrYov4pz1wZP78cK4u
 CLI3EGN4XZseQFkPvxQIwMMaVYIjV1NopMf6wb1T/nrjq4SqcDDxdcMvg4KTouq+gGKf
 88IA5Gk+1jo3akQTILflK0GUPjY4AFVxcQqxtACPSHdLQqxEkLcf2zyn/iXkPdj6sKhM
 vWOrLPFuZGp3HYwYxI+9LP0aZc2Ysb78CQ8c7w1OysTz4fkXbCrmtUBr83XWyQLRjODa
 Ww6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0O8nnox3UHvSoVwaPBu6/pUkyeIh7ma50XiEkH3CVyY=;
 b=TU5wiR4mJb4NuwFSRA9D2Dbloop6jiY5wOajJEd5th3kqW8kFGCoklaBJAeCj6Q1v7
 4XSa/6ucw4k5RK0rMmXL9zuMyrd4Bt0QubrTBLndiA0VBLBW5RD/15vBCWT4/UGqRroL
 1YGS+OURMqLUqad4KBNRfgRkE7vwCtR5yjrvZaiNabqgeC4iWCouwQVEVivE3sCBNFuZ
 rVLGMFpgnHSTjHnVHPmt8vQbSdgCXw5qpqmRREKqrj+xTqFCcyOV9SDMfDSkBG4HpOwY
 /yr8fTcJRSKrOZM8Lzp5BZ3mhzKQIVR7XICgJrKg43q4zxCf5PCwPFBL1PK+txL3zDiB
 WJIg==
X-Gm-Message-State: AO0yUKV0/vSiJ/q9JwCv3yFjpUnOSyQbq+x631y0HYWn1WPexV1q3Iyw
 p+RjjppJc43Btnip5Il123YdUg==
X-Google-Smtp-Source: AK7set+8NyBlwXEySHvc9p0Gs2EMhXUewlSI70sb3og5DNkTAiVT9y+bM/6TCxA8c5IDfMdoDKK1hg==
X-Received: by 2002:a05:600c:755:b0:3e0:6c4:6a3a with SMTP id
 j21-20020a05600c075500b003e006c46a3amr946795wmn.22.1675717262709; 
 Mon, 06 Feb 2023 13:01:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adff810000000b002c3dc4131f5sm7398593wrp.18.2023.02.06.13.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 13:01:01 -0800 (PST)
Message-ID: <00eb9ba6-9aa3-41f4-6a0c-1197eba19285@linaro.org>
Date: Mon, 6 Feb 2023 22:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] accel/tcg: Allow the second page of an instruction to
 be MMIO
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sidneym@quicinc.com, mburton@qti.qualcomm.com, bcain@quicinc.com,
 mathbern@qti.qualcomm.com, Jorgen.Hansen@wdc.com, Ajay.Joshi@wdc.com
References: <20230206193809.1153124-1-richard.henderson@linaro.org>
 <20230206193809.1153124-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206193809.1153124-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 20:38, Richard Henderson wrote:
> If an instruction straddles a page boundary, and the first page
> was ram, but the second page was MMIO, we would abort.  Handle
> this as if both pages are MMIO, by setting the ram_addr_t for
> the first page to -1.
> 
> Reported-by: Sid Manning <sidneym@quicinc.com>
> Reported-by: Jørgen Hansen <Jorgen.Hansen@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/translator.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index ef5193c67e..1cf404ced0 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -176,8 +176,16 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
>           if (host == NULL) {
>               tb_page_addr_t phys_page =
>                   get_page_addr_code_hostp(env, base, &db->host_addr[1]);
> -            /* We cannot handle MMIO as second page. */
> -            assert(phys_page != -1);
> +
> +            /*
> +             * If the second page is MMIO, treat as if the first page
> +             * was MMIO as well, so that we do not cache the TB.
> +             */
> +            if (unlikely(phys_page == -1)) {
> +                tb_set_page_addr0(tb, -1);

Nice trick! I'm tempted to log it at CPU_LOG_EXEC (or
CPU_LOG_TB_CPU) level.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +                return NULL;
> +            }
> +
>               tb_set_page_addr1(tb, phys_page);
>   #ifdef CONFIG_USER_ONLY
>               page_protect(end);



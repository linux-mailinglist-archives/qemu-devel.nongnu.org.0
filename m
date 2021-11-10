Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36844C15D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:33:49 +0100 (CET)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmnU-0003S7-Kg
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkmmc-0002nD-CU
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:32:54 -0500
Received: from [2a00:1450:4864:20::52f] (port=46065
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkmma-0000d7-Od
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:32:54 -0500
Received: by mail-ed1-x52f.google.com with SMTP id f4so9784594edx.12
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XtCy1qAg5Y2RmHYl7FRs6hAC5rF82+ZxORv1Dx5KPmM=;
 b=XEo57Lgsdco1RjSiVAQ9dUkpwYBZ6/qalJbYg9jHu3pja3Alv5jIb4ZIdbBuh1n1sw
 Jv/syoY3YmpBNXUZ/kjIYg6RPZmx0biM4UnQz/JBmN3ox0tWsebt+CN3CXzgQCxAk/9g
 C/yO+ShcBP15kLoR6Hs5rCVV7eLsYndUKgwoCepT1ACrhK5jPcP2dW9tWMjsEhzOnuxL
 /ug+G/5mVFmCI41O/EHXfjVgtnebl0w8zNjEl2QTQu30TyBkyfHDAMfoknnL1nb3m7sY
 PKF3lPuVVYiqN1gd68SLIqiOkpiZGUs+WYBDCKa8TGpYYgyTcZWOTn9AR3cfbEFT1yyo
 r+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XtCy1qAg5Y2RmHYl7FRs6hAC5rF82+ZxORv1Dx5KPmM=;
 b=soSfFeT4mBVQqeFNtS/SWaUFJOwUE1BUTNDk0k6yHteKJrGRzeUDYXO+yxNkVdGscO
 lByjMeoXOQDZ7o2DE4EEdWrkncNJl3NchslTDj3RvR3KaK6BQxP/OtoB4VkXuGAZT7IU
 XxigjCiLca7TCUto87Ko1cEX8oF5aWo1njBnhyW051zv7E8AKTlZULgxHINEGdOEQ3Nu
 f0PK8LQU94gO5rHxQw4ut66HlO5ROQUDxh6DHY2VOGWgzyTWjkO1P5nbibGibSvpbR6E
 kGosQ/Yf6jsiAnFcRq2FYz/co663uNsroJuV51ck0lx0+igX3VpKHwfIG7PAR/kfQIYN
 gbcg==
X-Gm-Message-State: AOAM531otT9o05TYe1QfIftradYD6poB02WCEDjg1S1txHpBf+kB/P0a
 nLB7xW3e+KRFnS35U764ScQ=
X-Google-Smtp-Source: ABdhPJzD+ADTo/Hd5TWa72J21JImKgcXfoh8mPoHXTzYQTRP9ClgPaL6IdEq/xxWBwL8q2O28NAWLw==
X-Received: by 2002:a05:6402:3552:: with SMTP id
 f18mr21156701edd.129.1636547571120; 
 Wed, 10 Nov 2021 04:32:51 -0800 (PST)
Received: from [192.168.20.130] (73.red-83-57-43.dynamicip.rima-tde.net.
 [83.57.43.73])
 by smtp.gmail.com with ESMTPSA id cs12sm5285344ejc.15.2021.11.10.04.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 04:32:50 -0800 (PST)
Message-ID: <8da2a402-e4d8-10ba-393a-a6b7b4137380@amsat.org>
Date: Wed, 10 Nov 2021 13:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tcg: Document ctpop opcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211110122015.189655-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211110122015.189655-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 11/10/21 13:20, Richard Henderson wrote:
> Fixes: a768e4e99247
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/658
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/README | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tcg/README b/tcg/README
> index c2e7762a37..391f4d1e80 100644
> --- a/tcg/README
> +++ b/tcg/README
> @@ -254,6 +254,12 @@ t0 = t1 ? clz(t1) : t2
>  
>  t0 = t1 ? ctz(t1) : t2
>  
> +* ctpop_i32/i64 t0, t1
> +
> +t0 = number of bits set in t1
> +With "ctpop" short for "count popultation", matching

Typo "population".

> +the function name used in include/qemu/host-utils.h.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


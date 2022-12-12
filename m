Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C364A9DB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qnl-0006hu-Qs; Mon, 12 Dec 2022 16:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4qnj-0006h4-Bp
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:57:31 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4qnh-0006Tb-H6
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:57:31 -0500
Received: by mail-ed1-x534.google.com with SMTP id d20so15166300edn.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A/V27+CW2nqPGk5XuXVsJjs5cYPQEQbbw1TqXTeQMIc=;
 b=wFQe3FTTwOQjs/U4LeLiCzC9O1wsFKS8usLDTQ4/zSNqfA4alBu4pOLRAnhe7jyT23
 8d/QnXptGPsidb7Gf7VoiUzvlCmOgyg7TtbqKTQ6ddkpCM1f4a+QMSjihDWzYfXZWlLo
 7Z4S1ZE9Z6Qvxe9jvYlHwPNDNxJaWprywYAdi0RhVXcWSht11pp5vHJfvYT6NAsgR1O0
 5LFAt/bF/DkVVArzcn09K1lvl/miPj14dT+mSp/t7eRDce68BPUu/7+q6JQAIAKhn9Et
 px+DdSPtphLjeHcnMMDf1T7r9IPr1UeXSWYa9HIfJco9lAiLvRMZnLl4L2U6VWZczf6w
 3EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A/V27+CW2nqPGk5XuXVsJjs5cYPQEQbbw1TqXTeQMIc=;
 b=SyfhTs+e2NdDLFMA84ftkLB3Y98ljj8ZFPIa5IQNfp+5bBJGESmCbE10oLEjAe+dx0
 sFA4Jlp6tnkS0Rpq9v4zTcl19aSiVwY5k4ea90OfNxmNYfLBJzKdFWVsAXfvlSTVGDLv
 sSb8zO/0UfPLgFHQNy7b5RKAkYHNga//Wny05UQ/XM+zOrjGfrXJG6qrpewAbh5aKPFm
 C7wUtvpA3Z5zu8y+Fz1zqI12XyOlghITcXaCqp6vZ4pDMW3XSjFnbFzh31jbVRbVjBUm
 vC26A/ZAeVuwKzmJUdt4WWO/Nsj/1/HFA99mDISLjfo9jnWjmC1ZQ9EqnJYs5SWHLoNJ
 KKxQ==
X-Gm-Message-State: ANoB5pmuacVs8WhtPoOZ6K9i3ksDhi5W0aCB3Q90pPU+1dnvaF0j/2jJ
 mgd2kjz1amA6UX29SsQOucFYbw==
X-Google-Smtp-Source: AA0mqf6jWuDdcmFugd/wIhbmklo8wpj749j5KQxaVWt9tFu5cqKzRdrDvezBI3ku7M8lq846G9qqZQ==
X-Received: by 2002:a50:fd8e:0:b0:46f:97fb:1321 with SMTP id
 o14-20020a50fd8e000000b0046f97fb1321mr9287513edt.35.1670882247471; 
 Mon, 12 Dec 2022 13:57:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n13-20020aa7d04d000000b00457b5ba968csm4170003edo.27.2022.12.12.13.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 13:57:26 -0800 (PST)
Message-ID: <b194cca1-872a-6690-efcf-afdf14dd9cb4@linaro.org>
Date: Mon, 12 Dec 2022 22:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] target/tricore: Fix gdbstub write to address registers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221212204959.1353838-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212204959.1353838-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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

On 12/12/22 21:49, Richard Henderson wrote:
> Typo had double-writes to data registers.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1363
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



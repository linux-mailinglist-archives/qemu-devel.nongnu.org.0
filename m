Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC186AD33F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:22:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZL5V-0000wl-Bs; Mon, 06 Mar 2023 19:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL5S-0000u8-UF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:21:50 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL5Q-0005rA-3j
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:21:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id v16so10634893wrn.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BEsMiPzWS0WXmpBRCRq7WQU3yu/bDa8rVhXrxITh8Lg=;
 b=RxmdmZe9b2YFkamnd7IE7YYYCXBeiBxR3JWHPfDd1fjzvc5i8KLisc4z55BZd2KPg/
 5Qp4e2TWzLQh4RUUDAyGk+ClT/hgctOiXuKi4SQ1FA07G2s7W7LyfZKGoe8GC373FuYZ
 30le2V+4coDKsbvMCepGOA0nheFuNR0T+B2ZrFXI47wNhsHi0IT57Y/vlcYbayaKJ4in
 tFixkB+CxUeATcshUW8taVYFErFLpNy701enW/FA4WByLQuNln9MkxEgfQa1icwJUbEl
 fPDofAw+pkUEJoeQOW/q4yPsl9ryWCeBSATJmtkwiPZqIj/wWhH8E/pz1yMe/KVYoEmA
 WJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BEsMiPzWS0WXmpBRCRq7WQU3yu/bDa8rVhXrxITh8Lg=;
 b=llN47qdZSngK2VBrJk5zHwIjroD6tMsyud9KXhGQoZxtQLBKd5UwWGhAG9WX/WTHfr
 4xP9Ye1qSMjIpt4MnKGoE4fkN+IMk/eV2ggmc4DBTYVcJUamA+MnlRwz/1GikoNN9tJK
 r7rZ4ETQxCzx9/W55nNL8QifomobywlmOuo9IcKy4tNN08u7grD2hNqOzrG716Q9kwoK
 Bx9Y+qqiRtArrCO+NzCDAcwCfU26oDcK8y6NaBQ20mt5YovAWwngyHwbzrZ66bvNIMnl
 gtvUf3798sxZh/UWrrfHPP3m/m/QP7k2Q8236Uq3xh7Do0vA4DduYvUj+fqVs/pbKodL
 I/Mw==
X-Gm-Message-State: AO0yUKWzckhfJeX25f1mKccNMoTCR9fQwM23YQJ6iMdgHayi9Spb0n/1
 fu60Ug3NqYD8mLwms0UIcF4bjA==
X-Google-Smtp-Source: AK7set8pAyAQXjFdFrqv62Kw5b4TiP+z5qY9SG7bkw3jvE0GVHdIJw9PXtcu00Od6N50WetWWlSkRA==
X-Received: by 2002:a5d:678b:0:b0:2c5:5870:b589 with SMTP id
 v11-20020a5d678b000000b002c55870b589mr8382791wru.14.1678148506628; 
 Mon, 06 Mar 2023 16:21:46 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d408e000000b002bfd524255esm11101086wrp.43.2023.03.06.16.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:21:46 -0800 (PST)
Message-ID: <ba7b1ab9-0dca-1fab-e636-131ea3cee5bf@linaro.org>
Date: Tue, 7 Mar 2023 01:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 51/70] target/s390x: Avoid tcg_const_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-52-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 06:42, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Super-easy one!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



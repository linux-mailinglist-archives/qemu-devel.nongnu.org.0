Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4D652F31
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 11:15:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7w6Q-00082V-NO; Wed, 21 Dec 2022 05:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7w6P-000829-35
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 05:13:33 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7w6M-0007uk-Fm
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 05:13:32 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v7so10839636wmn.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 02:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PDwRBSFfA4PZk4+reRlKF33AUK/4ezBjkzPVJbtank8=;
 b=G07UdKonI0Ofg/qnaE8co/FzFq/+Rg/1G5IDHs8g7AzH5ypNUYfV9YiYmWimPQpdNg
 6RdKYwMIryXR0PQbxFkJVNB413iYbE3Em5D6GZWOhyWWutRlG+QgusfpMIgd2SqQH0pv
 OAOsYLehQh26AC9zZSiGafGVKmOvVz3/WH1XKX9qpNzHup+7+mvAG7GOGJbvgb1S/F/R
 ZrSnaHHXIOublNAU9vP/giCoEjWtvo463dzW5dVJdpEfku5KDbICTkZSrAWizjV74UzW
 mVd1Z8DO1+/GE2owZLsglkGBthKvX5BaeA0iAjXBIikg5uYSjP9wuailvfPXKVNPpZk/
 GqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDwRBSFfA4PZk4+reRlKF33AUK/4ezBjkzPVJbtank8=;
 b=cK8wfux348r4l3EAJIgYGpLNePFVfyGqX4C4O3rzabonj/KESwIqUUbChLX5XtksSM
 XJLHEyOAhS+pI/csiHEzpG+FzHt2cwQTkjsW4PzILcEd0EOsVUP184oJsdnMHsLCHQFh
 0il28jJqoP/I3W5CACDeLAqK8l3X6KpZ/ZK/LcBBg7JGMLGHDCxRb8llS8w0hWqdr4px
 1SCkk6VIyUvthGanzfrSN3Chb2AKt+37J5wesZ6GOHvDqMjg1KhpdHImU397ZKA6xWQ3
 tFjEUQ5b4qt/w25dyvvvKES0m6kGBiKOd6fuYvCDB7GprG1H4gyuT5q7i6EYMu5yXMf4
 riAQ==
X-Gm-Message-State: AFqh2kqHyQkWBztA3RfscirUz5STdC8QBjnRZ3uQOGjqMKPkyFJBU47a
 wK1Dzd07ORIAOh7E/gsFybCKgA==
X-Google-Smtp-Source: AMrXdXswXWE72NzxbSiH4k+ig60XPWDUlrQUVR1PhIafdJ/bcL8pP1F2gvcqcNfiXL1bDOG00q+fuw==
X-Received: by 2002:a05:600c:6016:b0:3d3:3c93:af5e with SMTP id
 az22-20020a05600c601600b003d33c93af5emr1161853wmb.35.1671617608637; 
 Wed, 21 Dec 2022 02:13:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm6270257wmq.1.2022.12.21.02.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 02:13:28 -0800 (PST)
Message-ID: <fc91975e-572a-ec7d-a451-9acc127527e5@linaro.org>
Date: Wed, 21 Dec 2022 11:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] target/hexagon: suppress unused variable warning
Content-Language: en-US
To: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>
References: <20221221100254.1352686-1-ale@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221100254.1352686-1-ale@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 11:02, Alessandro Di Federico wrote:
> This patch manually suppresses a warning for an unused variable
> (yynerrs) emitted by bison.
> 
> This warning has been triggered for the first time by clang 15.
> 
> This patch also disables `-Wextra`, which is not usually adopted in
> QEMU. However, clang 15 triggers the warning fixed in this patch even in
> absence of `-Wextra`.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>   target/hexagon/idef-parser/idef-parser.y | 2 ++
>   target/hexagon/meson.build               | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!


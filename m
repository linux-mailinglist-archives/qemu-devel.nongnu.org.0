Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA3615BE0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 06:35:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq6Nb-0000W0-Nt; Wed, 02 Nov 2022 01:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6NY-0000V4-If
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:33:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6NV-0006mK-Uc
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:33:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id l6so15252168pjj.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 22:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8zw73O248UyVHdONBlSCrjt6b9cvZV9DYu3FgBB6UNQ=;
 b=bvBUAQL4JEQOciIYTSVpzQxgx3FpoRMsZ+UYUM93ly1gMbChz7v/BNx5BeSfD3bCHd
 mfJ0XUgVEmuLdmC0UOOBO2houZrnzqhwBXpS0RvBnpa9zZIIWLLQygcaC4lAdlauYqtq
 7hGYpxwHmZxyNPlt19QsnJ/3/bNGFZ7hcjUf9Y/fXOAf4Mo/N7AIU6rygK5Oz1VMpa4e
 3WoNrXcNCEqUARQAkB596ok9mGu87THKc7xXXZ69JE6DdmLYBQSMnzQx/GepdQlpHImx
 ShwEDXRD4YYSEB9/2iGxZxKaym+ZaWxfPVr6J5BKcj7ibrWvgvCZIgfxTG7s08Qz8Lvr
 zrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8zw73O248UyVHdONBlSCrjt6b9cvZV9DYu3FgBB6UNQ=;
 b=hgZ+VluLBmSLarzynvgRPnfusrW4JfFYf5Gc9w5JJzQ+Rv/I11LI1gVN9Ns4qGoGbb
 YspIc5xaXu8XJQy/mbjzvQX4tFRtoVKeN+jJzY4Tv2sjXbsPNw3BmyQ7jzwBzcD5xoVZ
 axahSFsxVQ7+vU2N8ZXA//l0xJHnoNsCNoPa+uvbl1rEqLzEC4ghdfxhFiLePiRy/IxY
 u+RjNGdL9bHW9mJRicSDn+a1Dab4y2Taq5ZUOQ0BlSTGjqwGwOmsVoHBkuND+/qe0c/u
 WoCXS0GpJoTscszb1dNXQP2Gridd5Q001IKZXuSLNENPe9mfF7PPn1dsPWOIDkbshVm/
 rouA==
X-Gm-Message-State: ACrzQf0Yu24mkcqt3DbSnxaCzJCQsYvV1b5ul5hqHXiFVf0Sz+ukA7Fy
 y2OV5sICGJK4JZvKOVKPBY0SqQ==
X-Google-Smtp-Source: AMsMyM6tPq+0GNTy25UY07cbxGuR6QI5hfMTitHqiX7myn6TFqRI6ca7sm/CP2EON5JxGQE0CA26hQ==
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr7805951plg.153.1667367205629; 
 Tue, 01 Nov 2022 22:33:25 -0700 (PDT)
Received: from [10.0.0.242] (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a488400b001ef8ab65052sm518021pjh.11.2022.11.01.22.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 22:33:24 -0700 (PDT)
Message-ID: <2b021c6c-7fdc-9ef9-befb-ff18991e4776@linaro.org>
Date: Wed, 2 Nov 2022 16:33:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Content-Language: en-US
To: Ake Koomsin <ake@igel.co.jp>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221101064250.12444-1-ake@igel.co.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221101064250.12444-1-ake@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/22 17:42, Ake Koomsin wrote:
> We need to check HCR_E2H and HCR_TGE to select the right MMU index for
> the correct translation regime.
> 
> To check for EL2&0 translation regime:
> - For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
> - For S1E2* ops, check only HCR_E2H
> 
> Signed-off-by: Ake Koomsin<ake@igel.co.jp>
> ---
> 
> v3:
> - Avoid recomputing arm_hcr_el2_eff() as recommended by Richard H.
> - Use ':?' for more compact code as recommended by Richard H.
> 
> v2:
> - Rebase with the latest upstream
> - It turns out that we need to check both HCR_E2H and HCR_TGE for
>    S1E0*, S1E1* and S12E* address translation as well according to the
>    Architecture Manual.
> -https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg06084.html
> 
> v1:
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html
> 
>   target/arm/helper.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


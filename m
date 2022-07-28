Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814955844A8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 19:13:48 +0200 (CEST)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH751-0000LE-Kn
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 13:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH72r-0006ep-8g
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:11:33 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH72p-0001Nd-Jj
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:11:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id 6so1991489pgb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ICUbhPhTdbsYQ21f/Lz5X/8MA99LufwMeBeU6i0QQPY=;
 b=HntA6RVR4JK6fFZdquAztw+Cz417b/jxQ+qBtw+BEcDeegoyY/sTDn/2Ce9wAIX9+l
 QxpczoFawjN4tMY0UGB2zt29Zd3JnX3LpXkVD8CwcfQM5oJFGVJh2GOFgOmz3iTvhfs3
 XGPjssy4VAZCeePPEf3dS8Y9uec5frmURTiaIiStICK18KtDs8c696w2LfOJCEQ2jwJc
 Uti3HXboVpWDWvJ9oqkc55UWMah0sui7BwmDFOp8MTH1im7vVaLkDD7EosTUZ4kHmtFd
 D2/dEMPyEGGwoLRBm3+vn3+5Fazc7Sr23Jq4N3uC0w+YisWl4LkJuYrHA7+aSslfHhTw
 j+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ICUbhPhTdbsYQ21f/Lz5X/8MA99LufwMeBeU6i0QQPY=;
 b=4ueRMBYflIt7qlbXnbS26CFwo1z5SbeujDFirvydmzru9FBGqZDOyzI1mqGpVc0+kx
 D/NEq5PVE8bt8XchWbjdWrFOymUzjWzZye6J4ShqnnzloC3uIiBkEmJbihnwp685LnPq
 BxVrOnaeexMG6AzS3U15nZdtDXcoUTape/nQZunsHVb+L1n14aVEXCBnvW7u49f/5Aw8
 3c69EPO4g42SGOZuNXjyIZcnTWxojHHF3TflxPJt1Z849H6hswrwbzE3j+64hOXSiTam
 YhbFgfOFH0E69P1LGfCkoTQEZ/oItCKybkcIlwr+xmwAobOu46cHf5/A9pTpVtYcWoo3
 26dA==
X-Gm-Message-State: AJIora+HH2QkCfIvtbtHmqiONaYcCwA95U68g3oN6igdykI8oihMnW+U
 h+vE9PBLVvqfiD8l7ySlyPG0Mg==
X-Google-Smtp-Source: AGRyM1sfqQhiOwf5ExyAS+Gc1fEJuWDXLqH2OHRCX1arwiUf6I9xOEh/FrdJY6dv9jI7m25ELVMjug==
X-Received: by 2002:a65:68d4:0:b0:41b:7702:6361 with SMTP id
 k20-20020a6568d4000000b0041b77026361mr1834813pgt.299.1659028289224; 
 Thu, 28 Jul 2022 10:11:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa79a0d000000b0052b36de51cdsm1008508pfj.111.2022.07.28.10.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 10:11:28 -0700 (PDT)
Message-ID: <b103fb49-0316-6a49-198a-b2ffe8e9e805@linaro.org>
Date: Thu, 28 Jul 2022 10:11:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] linux-user/flatload.c: Fix setting of
 image_info::end_code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220728151406.2262862-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728151406.2262862-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/28/22 08:14, Peter Maydell wrote:
> The flatload loader sets the end_code field in the image_info struct
> incorrectly, due to a typo.
> 
> This is a very long-standing bug (dating all the way back to when
> the bFLT loader was added in 2006), but has gone unnoticed because
> (a) most people don't use bFLT binaries
> (b) we don't actually do anything with the end_code field, except
>      print it in debugging traces and pass it to TCG plugins
> 
> Fix the typo.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1119
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/flatload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


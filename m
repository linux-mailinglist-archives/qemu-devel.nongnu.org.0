Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935FC50AB03
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:52:54 +0200 (CEST)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhejN-0004h7-Ec
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhehz-0003jJ-27
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:51:27 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhehx-0000Uz-Bm
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:51:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id t12so6646449pll.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=CdG2iBqN8xCYttJ9Dvyrfk0cyi5X9CloOOlQO0uUwSk=;
 b=sLWG0fH1g9LE3kcJnLnCrH1KYzaYLRsk+P+X5KgGkUqgtVUbjTZovCcDZD0cqi1OnZ
 QfFqMGIQcTA2NK4H593VixqC+izh0SWIYLsZIfGnk7jlbKuAveqxjDUDD7L9lMVqZcsh
 HEEWJgFVUWyYlSrnaw7KVR5CRI6fsi2J8qo0M/qxp4rQC2F3drQ5C1pt+HlZshZ/Pxqk
 JTx/Q1m07E3zlH/zaltjuZbLnPhs5LTkW1iRqKMievRQ5rHrMXTIApuTXvRS105wLN+H
 GjSPv+N/4MT4lTyWX0t1xav62nvtq3DzfGFAugmU6X7L2tZSd/5xE3chCz4MZOSipxCX
 XVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CdG2iBqN8xCYttJ9Dvyrfk0cyi5X9CloOOlQO0uUwSk=;
 b=mT8iYhF6+stRwt/iNuKZMPpWfTsYECRjeXV0SxaZ/DfH77wyzPiMBGAC5KkzyEBOPk
 CzM38ICjVllnABNL5Xo2tlkMdZFljKLGx+NgrqA2QibUhwz+28klXlIPb8SQVKHptTw1
 tzj+qtZc8o3uAoAbgjEByyueb+wpa72uPdSHSUK/s6b3tO2yZM33Bq7BG6yyoAl66RiZ
 RUfZq64Vxn0wi645wjXRghWqvg2urHgjkW9kSvkSjtRPXW10gYWezAQBYvSyMBT2a20B
 chBUzYgH/zmYFGwwkE4818gDR9ma3xvWZnLI6XPpzYCZCIJL5J+01nbXABXhU8NSIcSV
 6DQQ==
X-Gm-Message-State: AOAM532GcZ94AkWKp3u7xg/s2udd4B4HATZf0DBh254FyhOM/ruhy5q8
 NGWutF5mz0xbvPo10/uKp+9iyg==
X-Google-Smtp-Source: ABdhPJyafD8dejwQeW9DDyF4LUiVk4S5rLhevVPo4MzByuIKIKSIQ6XcI30gMFfP68/ZF1YrhbFk7w==
X-Received: by 2002:a17:902:8483:b0:158:f833:b7a4 with SMTP id
 c3-20020a170902848300b00158f833b7a4mr1366902plo.100.1650577883819; 
 Thu, 21 Apr 2022 14:51:23 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090ad70300b001cd4989feeasm3749744pju.54.2022.04.21.14.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:51:23 -0700 (PDT)
Message-ID: <f5840fbb-b224-2115-c3c4-3b88fa3a2d07@linaro.org>
Date: Thu, 21 Apr 2022 14:51:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/xtensa: add missing tcg_temp_free to
 gen_window_check
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421202126.364580-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421202126.364580-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 4/21/22 13:21, Max Filippov wrote:
> pc and w are allocated with tcg_const_i32 but not freed in
> gen_window_check. Add missing tcg_temp_free for pc, use tcg_constant_i32
> for w.
> 
> Fixes: 2db59a76c421 ("target-xtensa: record available window in TB flags")
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   target/xtensa/translate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index b1491ed625e5..f4dac27507fd 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -572,9 +572,10 @@ static bool gen_window_check(DisasContext *dc, uint32_t mask)
>   
>       if (r / 4 > dc->window) {
>           TCGv_i32 pc = tcg_const_i32(dc->pc);
> -        TCGv_i32 w = tcg_const_i32(r / 4);
> +        TCGv_i32 w = tcg_constant_i32(r / 4);
>   
>           gen_helper_window_check(cpu_env, pc, w);
> +        tcg_temp_free(pc);

Should use tcg_constant_i32 for both of them, and not add the free for pc.


r~


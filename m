Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D92B107D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:33:32 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKDh-0002U7-Dj
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK9S-0000DH-G9
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:29:06 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK9Q-0001LJ-LP
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:29:06 -0500
Received: by mail-pf1-x443.google.com with SMTP id b63so2127904pfg.12
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Ht8JYWC4IBaET4M3ZGxEFTx73eaIKzUnK1XvKCG/vU=;
 b=DnWfmWtB2IAgQhUMhxEky+0BgiF+Htt650AukiDHAq6qsbX5EyT2CVFQecZetKhVvH
 RLYJveTRClFPaJ72yK/7XY5T20Fzyf84gcW9NIEAw0c2aV0px+LGoUahOypmHWOhsBuc
 f/ajpft9/+7fbCeh9FADUwOERBEuJiDc0iM3MvIA+xmyr33lqo+HdYLcSfKz31NQ5vvG
 w2iOEi5Ogav4ohIH7Gm5p9qIE/8/li+6YM88cM8bWHOyzvSQSbI8xWCptl9P8kuSK674
 ITCAFSJXVxMD0lBdJRwY0316MjGPG0IDitR4mZtC2JI/MuwvXDaCSjJIbh9hoo1H97Rt
 WSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Ht8JYWC4IBaET4M3ZGxEFTx73eaIKzUnK1XvKCG/vU=;
 b=F54/sZxPzx6MYjozI+ZuwD0GDCa0ZhNkn9kO8/nNt37DHXzmuts96N7XNC2ZFbea4Z
 gQ3V1nOUhN+3MhP/v8plhcFTnEQQY/8VNfgN+MoTs7QF1LeUSX8qQz8h83rfL/7EeDP1
 Zef46q7OuewFvHmmtcfemmno5h6gjQGORhRwHdJ0eCwiysQr8JtCjthfB19cuf+/r0uj
 +qiTK4SOjhIKgQww8tO/9KFOhQUbpKIZJugIjcf8OZxtto3WTYtjvFmIss9eD7ZVaqz3
 DaPKGazfvlS4S+qVzTTLBHb65xjGZHfC2/TJSAlx05Zba2ZfDKzM2xTSKzDEXWnXL1UB
 Sd9A==
X-Gm-Message-State: AOAM531OfADMhOLx4VWmDClZylA259jwIw7+pCDVe40sTKP64Xb0MMnR
 IEvt34wHwup+6ZC7bta4e0YZlA==
X-Google-Smtp-Source: ABdhPJxxzSm8F9yAuCYPNJ7VwyOsPI3nlrHt+wWF8Yi1oXum5DsipJf0IZCy+4s0jHrAaXJ2B4JTmA==
X-Received: by 2002:a17:90a:c914:: with SMTP id
 v20mr1190210pjt.112.1605216539672; 
 Thu, 12 Nov 2020 13:28:59 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v191sm7298593pfc.19.2020.11.12.13.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:28:58 -0800 (PST)
Subject: Re: [PATCH v2 4/4] ppc/translate: Raise exceptions after setting the
 cc
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20201110105321.25889-1-thatlemon@gmail.com>
 <20201110105321.25889-5-thatlemon@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15311d53-6ec7-d4df-8eae-e5bdd7e75226@linaro.org>
Date: Thu, 12 Nov 2020 13:28:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110105321.25889-5-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 2:53 AM, LemonBoy wrote:
> The PowerISA reference states that the comparison operators update the
> FPCC, CR and FPSCR and, if VE=1, jump to the exception handler.
> 
> Moving the exception-triggering code after the CC update sequence solves
> the problem.
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  target/ppc/fpu_helper.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


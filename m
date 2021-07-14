Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B63C8484
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 14:37:12 +0200 (CEST)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3e8V-00044I-Ax
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 08:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3e6Y-0002uu-I5
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:35:12 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3e6W-0007fu-Ly
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:35:10 -0400
Received: by mail-qt1-x82f.google.com with SMTP id v14so1687988qtc.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jRSe4IC3Bpno4LxF9iaLeM2nkTMIGEoFaxYXsxPCTJ0=;
 b=cQCoIEMnUF9a/84g5DBFH3E9l7ec0lrxqV5x+jSr3hjtGOrKtoLQoD2R5GNvKcKrJh
 boTorhkKl0c6ADIW59eP6Lqn9kqj8Xkc6+3FbZqU5Sg2Why+t5lvgy0BlMr1dvYw78SX
 hhhzz3dl1ISmV3946OUCTLPq6xzUwJjZQR2clBxCwmtxfllMmurzqNM1zpvmaIL2mY5L
 ozGAYYOprt9/TsLvMJK4NDsgW9VvABWYzD1uvDB7qQOkX4arQdBaUyCase72kCN7RFcg
 4o9R8e6Pzep95ew0A/jaefp3+amoDd96tnXHNvZMTwDL5xFLJgmsGg/njl/CB8N9kV6B
 GsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jRSe4IC3Bpno4LxF9iaLeM2nkTMIGEoFaxYXsxPCTJ0=;
 b=pVRcF0ukiv0XP2AcDoigZ/l8kFJQAfr20lN+y22Yh1PJKLBWRUsZBRPfrzQTfFbm6V
 rhDnY5mm2ny3VbaEyhn89QgoB1v8gIwktPwNhCtKZc5XXrC9rFgRlVY9x0UPo0+mzXsZ
 peE58t2nkkOLmPz8UwEpTNQTUjYaSDBumol706l1e69Erdl2xL2DMumDRtHMvnoz6A93
 vjmk0SLzWr4i38VPDvywV3wQNkDyS9+08R6nMN6Hyf38gKB34xH0E5tSpUzkMt3AkWOJ
 VP+af/IY2nyJBysXuOltk9oejc1EDbwLJVro2NvpVukveL+aNa8QjHV24MkHjm1Af/kl
 8VBA==
X-Gm-Message-State: AOAM5335gOW9gOh45928v5wTuV3F5J7brkbspu3CBZmuw05+D5y0RN2z
 4ohYzxybNlq+8hRpWYJmjm7RkA==
X-Google-Smtp-Source: ABdhPJxnHhL/K5QQA3d4YbIJlfKAwuq7bje4vcWkX/2CyHAKJ3V7GiYrVoekpRJk+/27c84trZ3nBw==
X-Received: by 2002:ac8:5d4f:: with SMTP id g15mr9067790qtx.289.1626266107006; 
 Wed, 14 Jul 2021 05:35:07 -0700 (PDT)
Received: from ?IPv6:2607:fb90:8063:11a8:387a:5ad2:76d5:4536?
 ([2607:fb90:8063:11a8:387a:5ad2:76d5:4536])
 by smtp.gmail.com with ESMTPSA id e24sm716784qtp.41.2021.07.14.05.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 05:35:06 -0700 (PDT)
Subject: Re: [PATCH 2/2] linux-test (tests/tcg/multiarch/linux-test.c) add
 check
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
 <1626205589-19208-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <414412ac-cae3-c82b-2c48-3e0a50ef8bb5@linaro.org>
Date: Wed, 14 Jul 2021 05:35:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626205589-19208-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 12:46 PM, Taylor Simpson wrote:
> Add a check that the SIGSEGV handler is called
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/multiarch/linux-test.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
> index c8c6aed..cb845c9 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -439,10 +439,13 @@ static void sig_alarm(int sig)
>       alarm_count++;
>   }
>   
> +static int sig_segv_called;
> +
>   static void sig_segv(int sig, siginfo_t *info, void *puc)
>   {
>       if (sig != SIGSEGV)
>           error("signal");
> +    sig_segv_called = 1;

Either bool or a count.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

>       longjmp(jmp_env, 1);
>   }
>   
> @@ -492,6 +495,10 @@ static void test_signal(void)
>           *(volatile uint8_t *)0 = 0;
>       }
>   
> +    if (sig_segv_called == 0) {
> +        error("SIGSEGV handler not called");
> +    }
> +
>       act.sa_handler = SIG_DFL;
>       sigemptyset(&act.sa_mask);
>       act.sa_flags = 0;
> 



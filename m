Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF13AD554
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:42:25 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNBw-0006NS-PA
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN9s-0004Ft-3U
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:40:16 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN9o-0005cl-Up
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:40:15 -0400
Received: by mail-pg1-x529.google.com with SMTP id e20so9071311pgg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A/7vGyDtuIhOZqwk9YUG9c7OuQYEf92JV0wmwUA7Lsk=;
 b=yaH4d+78EPuSMKSIwL7NTTgQeFK7+5WVZc3TDFCORNRPetHjwEsOrYtNv+oy+LyMzi
 AxleaMXTCzV+xZHkHLwIeQdN4nMnVWCFqtStRwYDue9W0tseJruaN1JBsESDgHi0X+re
 cSwsmaGNZKI25orTLmKSJhxbYotqgRL5lzKuDOPAe5czwaOEnv0ga46OQWMjZRdcxf++
 wW6SKTRmnbRvFDp4ccsRi8aI/+jnGu+V2hMjTpGXV05h/0wC9t4i57U1whse0+dOFMd4
 dS0oy7fGstKs4R3x+34rq0Twudr3bKAmcFt5dQDcAoR0RG4g/yE9h4/ATwWE0v/bPOpy
 L10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A/7vGyDtuIhOZqwk9YUG9c7OuQYEf92JV0wmwUA7Lsk=;
 b=SJxUGwelJfNnc+emYb1DncOEwsXWd13P/DCjiRPY+ea3bl8xuqf4hgxJFlkYiZlfum
 4XD5xlf4lboY8dGMUzxfH6tSZCt3UWpdxvzQH6j8y4Lg746jLiEwKCCgOpTpJGcebLFl
 PKZ78OQgeZ1kX9Ost07IfpDFIbdtISlwFY8CFbAK/NHbMiceqUQ8vyvgoKsjg2Mr8Kgd
 NbJAkfByYwPVWVqEz6QJCg4QbZ9ZNcraABR51wNJNwAqNh+NAtO3LeOXr7z375tRrupj
 BmnNb+xrCiuOiPY8qjlDImjNW1g7+FAh2W7Xq3fRikhv3axpYwWcctlX1rU/oDDmPh2d
 DTLg==
X-Gm-Message-State: AOAM531ciovcUYsat9LCCdK1y4I6aa//pqAxVsnubmvwEqMMeK9ue8CE
 7bx6JH/pQ9RuQaL+KhaaZxaaQAlgsYN0Dw==
X-Google-Smtp-Source: ABdhPJw8B4rvRbb+Sc0f2HnGwkKtC04rBoNBhMaeHQcNDNQVibLkU5TiyOTc+WyvQzFs7TY6kUAzCg==
X-Received: by 2002:a63:dc06:: with SMTP id s6mr5563888pgg.39.1624056011408;
 Fri, 18 Jun 2021 15:40:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y7sm3067993pja.8.2021.06.18.15.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:40:11 -0700 (PDT)
Subject: Re: [PATCH 7/9] target/mips: Remove microMIPS BPOSGE32 / BPOSGE64
 unuseful cases
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c4a6651-0351-6cc7-8ccb-13b0c86ce34f@linaro.org>
Date: Fri, 18 Jun 2021 15:40:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> These switch cases for the microMIPS BPOSGE32 / BPOSGE64 opcodes have
> been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
> More than 11 years later it is safe to assume there won't be added
> soon. The cases fall back to the default which generates a RESERVED
> INSTRUCTION, so it is safe to remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372443AD558
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:44:22 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNDp-0002o2-58
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luNBs-00080t-Os
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:42:20 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luNBr-0007Dl-7J
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:42:20 -0400
Received: by mail-pj1-x102a.google.com with SMTP id bb20so2404156pjb.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J4XRE4LWAGlaWSTM4T/9lD15bv92cqF+bgQ04d9+Nz8=;
 b=Wc6t+OoMQ0v2/dZtrP+dOhujfz2/VGPKC6dYjm0dvYSuAel7NDEPKktMrEcDca+4KH
 EP/L4+8ubPURPsLurqrvVAFBb4CCyaZtw2HN+h4NbL10E+e4itl6k0PiHNA5YM+w9tsR
 OmuNGgBq8MzYaCIX+PEA2gG1BFNkitFDQZ8ysnFMIUkf2VFnYl/7jAjpYi85vvFC+sMu
 6YXbDH2RJDE+RnLhvgF0fB57StgwAX1/CewBfAYMmol3OZRptnmPLGFFkduwNnNYdY2y
 mZ/JIXPSICeigG0Zrcgf3pOaXcvPVgJE7WATANRg8BSkbTyaLI8boKsdrRYXXLvWEW8j
 reXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J4XRE4LWAGlaWSTM4T/9lD15bv92cqF+bgQ04d9+Nz8=;
 b=TxPrYC9yEMVt4Z5c9KFlwpIGYszZI6P+QQcZdkVCn6IQZq2elKV7I0w7ZylvMvdshE
 Q+gv/sW9CfCxhx56hfiRrM55lIt3l6jcact/vkM4iMmppj/cV1xzHy92/4Omff5hiBE+
 oXra6mPdgiNs3SkmTbVcFL5DlUT5BNcxYrq3hItBrvu3GBfg5l6TcNzK4+dj1GS7bdED
 a/kE1L8uBDb8uvulvgiLH7hVl9KSsw7RtNNU/kDW/c3xWKFBDP35MvYcyorbYerYkgBF
 4Le2j/Xl2jEZM4h6cs00SiWwRfb/ijJSBbA3h0ooPRkYhB3mtzQHPH1sDaBUre0y+cbM
 qisw==
X-Gm-Message-State: AOAM531qQ9sj9s2oNzZV9TrwK8/axhXTCUKqEbkIUyiNz0CWotflAD6I
 rDgUEo6UUWqlqOx8YucV0S6VgQ==
X-Google-Smtp-Source: ABdhPJx1qew8bpwqvpNxZ9AMaxbMiUs5dWJniSUAhdIf3QfkAJ4jkWqWuNIiGXoCk2mVmaL53iEkbA==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr13408023pjn.200.1624056137952; 
 Fri, 18 Jun 2021 15:42:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o16sm8312690pfu.75.2021.06.18.15.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:42:17 -0700 (PDT)
Subject: Re: [PATCH 9/9] target/mips: Optimize regnames[] arrays
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b23cb9e-90b9-6396-6213-ffc57792c226@linaro.org>
Date: Fri, 18 Jun 2021 15:42:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
> Since all entries are no more than 3/4/6 bytes (including nul
> terminator), can save space and pie runtime relocations by
> declaring regnames[] as array of 3/4/6 const char.
> 
> Inspired-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h          | 2 +-
>   target/mips/cpu.c               | 2 +-
>   target/mips/tcg/msa_translate.c | 2 +-
>   target/mips/tcg/mxu_translate.c | 4 ++--
>   target/mips/tcg/translate.c     | 4 ++--
>   5 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


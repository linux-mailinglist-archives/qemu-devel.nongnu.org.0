Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD212DC6E6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:10:23 +0100 (CET)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcBp-0004yf-Lr
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcA9-0004Dg-VC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:08:38 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:40035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpc9u-0007QS-20
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:08:37 -0500
Received: by mail-ot1-x329.google.com with SMTP id j12so24118354ota.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7RAQX7ZG73gHQ3ZTZSw9utTPfQ6ajkU2aqIUuCY/n4k=;
 b=mw55WTN7PUlzhvfJkynf4hA/fdDwnkT8LsqwLSe+m/b3vlXbYo8QpA8jlW7rvI0RPY
 hr3LHlI7vv7zaE7eWYODWPqyiYBUuW7TH3ETq/c8hf2TKBW0HOxugPa6y/79WDNqLfuG
 bjSyOmbR1dQdhkcZVqc6RAyRPwsrWp/VrGjv828bEw6ZseTnsCnQIMXnYmc3bWjSjhBn
 XazWwbP1R156bu4ZTHX3YBGMPONrAB13I8iZ6yq3j5CqE4DTOdWoO8M0ixneKrllj7h2
 9yDyXvdEV596XzVlLDTnlnDnmSSyc8e2Av1RUlxzmyGb4KnKNotNwqCEDDvbeqCCO1R2
 h+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7RAQX7ZG73gHQ3ZTZSw9utTPfQ6ajkU2aqIUuCY/n4k=;
 b=PNoVO5yE5HB42KNwbXVHA5unD2jGT/whnIbSINCMDBIYKfRHsJH2GxS1oG8dybOthb
 Zk+PkcD0niVQ7dr96l9TL3KqE/Qfrdnj5tzHEmGtb2u3dsKd65PzMnfEvEskBBmWUKtd
 LmPHQAu3T0uqe7ehhfcIb8jQ6mJgpjSF+AYbZ3aaTnSjcYNq/b3Ba556lt1rej4gefR1
 YspmadEQi4vSHeRnvMNy/S5Jyk6m/j2StnCAIhnorqmLXzJAbX2egIISUjQ1O1VWRw6G
 iFVQDA1coNDEZ7EKUAT10zXpd+YcmP0cAMoHkhnj6UjRgXJuKSKoMFVpzLXhNm1LF1xA
 o+IQ==
X-Gm-Message-State: AOAM532+KKRDbHD5Og/JXpJ8lgNDz0QvBuGO97QteQuAoCd2rRpO3JOA
 uBBopiwDMmtF9Yqrueriak3jhg==
X-Google-Smtp-Source: ABdhPJyuQW8I2NChEAZSH/2hgFZwJ8/DBWBhygatAh8aitAb8kfMMi5AmF3+6zJikyddfqra63gnFw==
X-Received: by 2002:a9d:614f:: with SMTP id c15mr27044140otk.362.1608145700375; 
 Wed, 16 Dec 2020 11:08:20 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u141sm585563oie.46.2020.12.16.11.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:08:19 -0800 (PST)
Subject: Re: [PATCH v2 02/12] target/mips/mips-defs: Use ISA_MIPS3 for
 ISA_MIPS64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20a9e22d-cc44-71f1-eae8-019a03838c26@linaro.org>
Date: Wed, 16 Dec 2020 13:08:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> MIPS 64-bit ISA is introduced with MIPS3.
> No need for another bit/definition to check for 64-bit.
> 
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 2 +-
>  hw/mips/boston.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
> index f4d76e562d1..ab621a750d5 100644
> --- a/target/mips/mips-defs.h
> +++ b/target/mips/mips-defs.h
> @@ -19,7 +19,7 @@
>   */
>  #define ISA_MIPS1         0x0000000000000001ULL
>  #define ISA_MIPS2         0x0000000000000002ULL
> -#define ISA_MIPS3         0x0000000000000004ULL
> +#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
>  #define ISA_MIPS4         0x0000000000000008ULL
>  #define ISA_MIPS5         0x0000000000000010ULL
>  #define ISA_MIPS32        0x0000000000000020ULL
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index c3b94c68e1b..f44f681fab5 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
>          exit(1);
>      }
>  
> -    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
> +    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);

Find this slightly confusing.

After all of the renaming, I would expect ISA_MIPS64R6 -> ISA_MIPS_R6 |
ISA_MIPS_64, not ISA_MIPS_R6 | ISA_MIPS3.


r~


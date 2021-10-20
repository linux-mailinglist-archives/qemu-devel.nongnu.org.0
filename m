Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B576A434D54
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:19:28 +0200 (CEST)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCRD-0002Kz-R9
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdCGz-00043r-A5
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:08:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdCGu-0001xV-CW
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:08:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id y4so16266051plb.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=siuQKns33SrWGg4rsZhdh33gw76glUF1t6ASC/6a2TY=;
 b=txGIUeG1dys4SAC2GHDtg3i+m752Fuw6ZA9Bpw6rst8bP5ITGT41mI51kwazLqmvqA
 wUd7lOzykBy/LPgwc4XQkj659oTtnZSPogpTX7UuJbye63LUAKwixtAUsL1O3hGN/Shu
 xB4kvTXp9JpXC1jLkf5SrhAq/zHhJ47GYG6HtdqoF+5FH4FSwNs1tjHsp5zKPuUXCcdj
 JDsAZezYosFEFB3g/HJz5hOmte09/5pyqhfKo7xmtzs1cQkkPSXSIvjIAVcyHUT0sjr4
 InhfvtO0/fU11ADsdjqqGz7Zic6rN10iKcGcZdqD4JRfCXBLHAIOb2R3OVS2nrldRvxJ
 IApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=siuQKns33SrWGg4rsZhdh33gw76glUF1t6ASC/6a2TY=;
 b=v6KhZvuiAh64QXTaBR0ZdK8JuRgwU6GuukDSHO7tnVmxMVdHS19nJJtKQgakjLaZaL
 k1U0BemuI8JsMU+BROpeDJdI4xy8+vmCQa0iUX0fvM+MwsU4cT9ICEtzH4rsHz+zZvYX
 rAyq/I8Y1JwIu4fIwMIuyTtcOyxM240eJ+LEGzQhe+eFbV8M1zRlL/HXkREdRLWQMm3V
 8sRLii6Z6Wji/AleV8JIOuGuyspgToIwXNI2qh3hof4g1l3x6jb1VLXGLyv/b9Jxlz+r
 0SRuwub9Zcu88R8rp4vPnQxUUM1yySVqt1a5zYu8YVbjP/rh7iaEl7oTR7iThHNlKLFq
 aGew==
X-Gm-Message-State: AOAM5324o3dqyjGiNfWGJGSZN1e/Om0ac9ygiljMJfhDGL5JbbwxK7uP
 syF27NyQxX6Ou51Nx0EgStljVw==
X-Google-Smtp-Source: ABdhPJxjd9mP71tFDShKU2wZOQxPbCQRdI+x/hK46l/suPUO/UFOT5yFvylHZzASbsNnrREcgfyk3A==
X-Received: by 2002:a17:90a:e54d:: with SMTP id
 ei13mr7667976pjb.65.1634738926631; 
 Wed, 20 Oct 2021 07:08:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c12sm2848799pfc.161.2021.10.20.07.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 07:08:46 -0700 (PDT)
Subject: Re: [PATCH v3 04/21] target/riscv: additional macros to check
 instruction support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-5-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cd0ab2a-1261-066c-cd74-6ce226d1d1b0@linaro.org>
Date: Wed, 20 Oct 2021 07:08:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-5-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> Given that the 128-bit version of the riscv spec adds new instructions, and
> that some instructions that were previously only available in 64-bit mode
> are now available for both 64-bit and 128-bit, we added new macros to check
> for the processor mode during translation.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/translate.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 35245aafa7..121fcd71fe 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -350,6 +350,24 @@ EX_SH(12)
>       }                              \
>   } while (0)
>   
> +#define REQUIRE_128BIT(ctx) do {   \
> +    if (get_xl(ctx) < MXL_RV128) { \
> +        return false;              \
> +    }                              \
> +} while (0)
> +
> +#define REQUIRE_32_OR_64BIT(ctx) do { \
> +    if (get_xl(ctx) == MXL_RV128) {   \
> +        return false;                 \
> +    }                                 \
> +} while (0)
> +
> +#define REQUIRE_64_OR_128BIT(ctx) do { \
> +    if (get_xl(ctx) == MXL_RV32) {     \
> +        return false;                  \
> +    }                                  \
> +} while (0)

So... you've left REQUIRE_64BIT accepting RV128, so that means that your current 
REQUIRE_64_OR_128BIT is redundant.  Is that intentional?

It does seem like all places that accept RV128 should accept RV64, but perhaps that's just 
your "limited" caveat in the cover letter.

You don't use REQUIRE_32_OR_64BIT at all.  Remove it?


r~


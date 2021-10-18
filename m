Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DB4327F2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:49:51 +0200 (CEST)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYdo-0004nB-Kw
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcYcK-0003c1-Fv
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:48:16 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcYcI-0007G8-9U
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:48:16 -0400
Received: by mail-pf1-x433.google.com with SMTP id y7so15562690pfg.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wlEMkuXMIyJbCML+U+ZhdvWUpbge7CtMZ1/LlS3GgEI=;
 b=R2wotcPswfoXm9sGP7FTU+sBbZZu8nPnEh5NYr012bwElbhyynXnG0QgCZ3+MNKWHo
 VpjS8/voeGyJXDKyw3DtPaAHGSKSzO8B7by7S9i7SyuZb1IS6wneLMVBrRGvX37gG7rs
 doXvX9PZZtfpf79iZ1EmMJvfNUYk0wg9pmosphW8fDfNxdWod4do/wEVZ2KblOSjYGAw
 8VDt6vaLxJa4xAu6mXmRlCGxoLk8H5GZdeWQBBoT2acJ5ahZgbAAlwx22MFKgBGV16lG
 zs5p1HRUdwOie1U1D+f3hCd2N1aNmsFkffScMDPbUyBekGxpU//f9ijqJ3m2BYSAo9lK
 shDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wlEMkuXMIyJbCML+U+ZhdvWUpbge7CtMZ1/LlS3GgEI=;
 b=Q2Yhgg1ypa+o1EQ3gbbJepafovDLQOzBM27v2D6c5SFE+4uMtUfb+A3/Fj6TZuVBay
 C2TKhtN4IPElopw7zzxv+YrBDSIIHBbBiF+KEEn6I9sHpMCDZ3l4SVXTVwadWB5fSC0N
 Lxy9Q6LO2J7GfsUYcoUu48whc/JDIXfMjL5eZqxvVE2PlxoBVvDB4M1ETbQC/787bnEr
 8uqjbyjcKfgomWhHmBirvPijtQCDrykotK7qFXFf9JyJvdj9Y5sz3Llk3sVVTxvrXE2/
 mjwUlTbM8hWbc0TVfyNR01MTSTEhX4BBM+GXIxjar6gNjYHTSw9OJxCtkI7w/5Uq5snl
 M07g==
X-Gm-Message-State: AOAM532R5tY47fOfK4MFuqwnvshJc+un6V+KQlOUczCl4y5tryEZkt1n
 gOcL7FsAZ4bV+yHI3IiwRU6HiY249K6tEA==
X-Google-Smtp-Source: ABdhPJw3I91WdZrhuuU92y6y2eoSqkrWg5x8NtV/s5c9H1LN+YoGaqoElhUaLfxcFocFRfKK2ly2fQ==
X-Received: by 2002:a63:9d8f:: with SMTP id
 i137mr25042241pgd.323.1634586490810; 
 Mon, 18 Oct 2021 12:48:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z15sm14511276pfr.92.2021.10.18.12.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 12:48:10 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/sbsa-ref: Fixed cpu type error message typo.
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>, rad@semihalf.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e6c5f18-544c-4ce2-6235-e0b6a4e267b6@linaro.org>
Date: Mon, 18 Oct 2021 12:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 11:36 PM, Shuuichirou Ishii wrote:
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>   hw/arm/sbsa-ref.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 509c5f09b4..358714bd3e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
>       int n, sbsa_max_cpus;
>   
>       if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> +        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
>           exit(1);
>       }

Queued to target-arm.next.

r~



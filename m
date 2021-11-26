Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF545EBE9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 11:50:02 +0100 (CET)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqYnq-0006qd-1z
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 05:50:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYm7-0005gO-E5
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:48:16 -0500
Received: from [2a00:1450:4864:20::42d] (port=36802
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYm5-0006tr-CP
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:48:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s13so17749409wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 02:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mvcXk9nmMbwE3hBqMSVSobRsQN2CVk245LobdY1CtNI=;
 b=d/1rjSQVMiCLj1i3EH/+mrMNucd06CeBEnHLs9Pr48w7R2zIb5wnB1IGVglhC8VhWh
 +efCPQ7L90b0/bdnigTrY4QZx5xO+3gzsubu5hFC10YdhyIc4HTBEglYx8zr7i8rPMbC
 3uZkDT15SQicpiO1RQTf29B286wktyXT8DnHCzzoVsHEPW/4bI1Z5yJhzTX1SV9530Ti
 4aydlRfr811S7vQn93XjHKn1YCntXzXSre3zAdgkUV79Q4Js02AhjUFltLAsaN4c+HQ/
 BYkA8mgbvmP2y6QsTPp6fYyTXtnevd8tc1ZS3fn7MahZCKds3lp0ulTGMLZI+88qQFva
 Fy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mvcXk9nmMbwE3hBqMSVSobRsQN2CVk245LobdY1CtNI=;
 b=6NW/DPjth3gH/kMJo1uNMEkMUgTSPNcSA1M/NVLK25On92mpk6JQxQenzTY5Aht2cg
 ojuK6yyx3LF6L8SMGSM5EXtjWsoibLk/Gz6xFwLlg31gcKCqR4/zMXAR20omboVZBxBu
 U5pBwZfDA0+F8NaY4iENBBkN06HtnYfZ+SLdAxBW3GuK72fNa7WcnMn558/09DlBepk2
 npWQNXeKjGVZQy6Nbex95x6/szLJH1xONjlBiHv8b4iyPJDGAVsFYDYkSExsDl/MyzTe
 LgPmcPddCBb5UVoaQcWSmRpxuvJ4UQm9FebzNP/eKpQFx6qZBKUEDXAtJa5saNPZCTvT
 Qn3w==
X-Gm-Message-State: AOAM533r6vF+KiCiUk4Lu5oiUOQ/FgvHrC8rhNDi1zKQagSD9WTPAtJl
 K32d2bqUHQqt6qcCK84BgzXtzQ==
X-Google-Smtp-Source: ABdhPJxTPF+e55E6gPRVj7WlP/zvFOLo4Rydt8Ed7U0sKSP24x5viQS5dNekdCadmA6EIWpfaZnNvw==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr12503916wro.484.1637923691312; 
 Fri, 26 Nov 2021 02:48:11 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id t11sm5368102wrz.97.2021.11.26.02.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:48:10 -0800 (PST)
Subject: Re: [PATCH v2 2/3] linux-user: target_syscall.h remove definition
 TARGET_MINSIGSTKSZ
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
 <1637893388-10282-3-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <572d5144-0071-add1-c50c-8c5a731df3da@linaro.org>
Date: Fri, 26 Nov 2021 11:48:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637893388-10282-3-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 3:23 AM, Song Gao wrote:
> TARGET_MINSIGSTKSZ has been defined in generic/signal.h
> or target_signal.h, We don't need to define it again.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/aarch64/target_syscall.h    | 1 -
>   linux-user/alpha/target_syscall.h      | 1 -
>   linux-user/arm/target_syscall.h        | 1 -
>   linux-user/cris/target_syscall.h       | 1 -
>   linux-user/hppa/target_syscall.h       | 1 -
>   linux-user/i386/target_syscall.h       | 1 -
>   linux-user/m68k/target_syscall.h       | 1 -
>   linux-user/microblaze/target_syscall.h | 1 -
>   linux-user/mips/target_syscall.h       | 1 -
>   linux-user/mips64/target_syscall.h     | 1 -
>   linux-user/nios2/target_syscall.h      | 1 -
>   linux-user/openrisc/target_syscall.h   | 1 -
>   linux-user/ppc/target_syscall.h        | 1 -
>   linux-user/riscv/target_syscall.h      | 1 -
>   linux-user/s390x/target_syscall.h      | 1 -
>   linux-user/sh4/target_syscall.h        | 1 -
>   linux-user/sparc/target_syscall.h      | 1 -
>   linux-user/x86_64/target_syscall.h     | 1 -
>   18 files changed, 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


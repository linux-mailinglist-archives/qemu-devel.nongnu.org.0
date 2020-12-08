Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156AE2D3665
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:42:22 +0100 (CET)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlgb-0007Kn-24
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlB5-00048L-JS
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:09:47 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlB2-0004yC-RZ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:09:46 -0500
Received: by mail-oi1-x241.google.com with SMTP id s2so249850oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0KbrxKtnPDSH8SVdj2wpe6Rfs00cjVA9d1JCosiF5Ak=;
 b=yUVzhWFQtWT+JxbJmxsNzbXW8IJCkyuzQ0vDkGrTDKLk6BbtmxvBYWa5Huhi5cTCJ6
 IfWP4xlJRbwdMkRnNu1o6nSH1kxhXmaA3b4AtWkBT24SqiyikcoCgxLQjEG5q0f/WqTi
 JFZtzZpUhfewsnWmaua9v4TwZSnYjEdAYsdZuNWR+a1BFQ/wk+ewxvZfqg2QgqXoTZqX
 +h9y2SMu7isivPscwHz7q9lVF6snLPJEp2pFYxvGF8Thplw2q4fyiS54hEqO1FMwlGDE
 dj+s0d7vlIEP1iFVcVct2OHL7l6+VLJfqod4AHSgT+/bVY0bNRYU3Q6QVVv6VnXi7HWM
 +bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0KbrxKtnPDSH8SVdj2wpe6Rfs00cjVA9d1JCosiF5Ak=;
 b=Fk2WnF+5/ourV2UDQEJaCVb6bfhYfprUMkna7j7pHEJq8X4iZ/ElnCsdTY7BWVxo90
 cSLKvwSu6VIjrUGpQ37lSaVrGVMFNa+5ynwz0D19u2grCDb6TFFicOoz6mhRGqRe4t9/
 Le9Jd5arCsQaWe5IoPIKtHoYbCxTIOdXbSao7CjWXiNh1VbKR64htOaGoEloj4CEsLao
 8SEsrD48u9ovfjV+T5QKnaMk/LdMsB9gPzCk0vnZetczHFuybkMqBgjZclAp8ng8zvkB
 /Ki4rI/RcE0/BpwYpAIlo2VF8Jx5Ff/ksl6K53ELfjPLLrJgOSoicgUuvBnL3TF4ZkRx
 HK6w==
X-Gm-Message-State: AOAM530rVenqx4hRAY/RO6x83BPuDZDN1knNg52p5jySu3OaSlW87Glh
 0XLGksMUc6Y1X2C82vkBt9RugA==
X-Google-Smtp-Source: ABdhPJx/t25Z6RHBs5E4yjw12VMSZAzAQn3sf9zyr022JAZE8fy8360W6UhdGJNGOLNWHg63gkwo6g==
X-Received: by 2002:aca:60c4:: with SMTP id u187mr26076oib.42.1607465383552;
 Tue, 08 Dec 2020 14:09:43 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v92sm13045otb.75.2020.12.08.14.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:09:42 -0800 (PST)
Subject: Re: [PATCH 12/19] target/mips: Rename helper.c as tlb_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd601c53-216b-0c44-0dc0-3efac54ecb73@linaro.org>
Date: Tue, 8 Dec 2020 16:09:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> This file contains functions related to TLB management,
> rename it as 'tlb_helper.c'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Maybe I missed some functions not TLB specific...
> ---
>  target/mips/{helper.c => tlb_helper.c} | 2 +-
>  target/mips/meson.build                | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename target/mips/{helper.c => tlb_helper.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


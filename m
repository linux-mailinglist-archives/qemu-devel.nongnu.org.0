Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C696B62F248
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 11:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovyNf-0004zk-IS; Fri, 18 Nov 2022 05:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovyNc-0004yH-8r; Fri, 18 Nov 2022 05:13:52 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovyNZ-000652-5p; Fri, 18 Nov 2022 05:13:52 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-142306beb9aso5376932fac.11; 
 Fri, 18 Nov 2022 02:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mzm9K0TK/UeVWztg2RJzSyS+iQhbfJgdPoBAtI3pzIo=;
 b=kGEyzo+ubs15V66VlOohfqxiNwOVtMoQg0sP4ewSfWnKFlSy1FrVHnLGDywV/eifsF
 smsx/RuBd/OHiVMCK81bUbiKfqxWfb0I9SjMjkLb8csqAOzVkhpk2YA+yTsAayBf2Hiy
 1YMij/C/RjP4YIi4JDZmlcRS4Y2M/Y9Zi5IKvv3KuMjKkrZUns5coHtqB08eEcM8QsQK
 5Lu7/q10QrlPxB2mADgj7cu7G/qWYfchsY9DAH3Qtf+IQVBw9VzmN+aGZAnvHeZbsZOK
 zpirTFd1L2dPsgvwhmBkkAA8Y1vyeej/FCLvsAMiKd21BHKjnC09jaE5WdwrKnH15Geq
 iwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzm9K0TK/UeVWztg2RJzSyS+iQhbfJgdPoBAtI3pzIo=;
 b=Cc2Q8Mw82NMCOCng/lizsfVvO9Zkmc/pdwbJof+PN/imRd33Zf979bHoQk/Z7MlqX9
 8pX+kV3tI2yuKybbIpzvItVtLvWwfXcNMp2VCGSrgU+L8C5AbSDDhDMcSAqKMBSjOVZR
 H/qa01TdS10i5j1+Rp5ojkl/yDK06vWzJs2WNTo/S6XZGBEPxKgoRzNfcNfq1VZFTe1+
 htZndaYOPobvZNf7usWBbBo5MzjqS7+B0g981+oA3hL0OZS2i5Y4MSfr41LEVGVQvJom
 f2W8FMTH7Lk8HandfOb+bT4WKK/CkaLHwc+gEBQ+D8MMqSMOvkjvs5BgTGu+E2L2ctwM
 r4UQ==
X-Gm-Message-State: ANoB5plcDK/tlYlTkM5Zt48LZcK6tAij+0obdzAfwnrvLblxT9/AZPsI
 LyJ3FS87a1+q9OfNS5egPpE=
X-Google-Smtp-Source: AA0mqf4i7CFgutsOlYWdTKN6ifjSzHx641OU3hxW5mnB+FvELF7+iZKeGC1Ly2fAqNR+aPB3AaxHSA==
X-Received: by 2002:a05:6870:d621:b0:13b:f568:bc3d with SMTP id
 a33-20020a056870d62100b0013bf568bc3dmr6594905oaq.90.1668766427589; 
 Fri, 18 Nov 2022 02:13:47 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 f38-20020a05687089a600b00141a2618121sm1684408oaq.56.2022.11.18.02.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:13:47 -0800 (PST)
Message-ID: <ad98f01d-2db3-b119-dd9a-6b52f9b2f6ee@gmail.com>
Date: Fri, 18 Nov 2022 07:13:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 4/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-5-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221118091858.242569-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/18/22 06:18, Richard Henderson wrote:
> In addition, use tcg_enabled instead of !kvm_enabled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Should we strive for this change (tcg_enabled instead of !kvm_enabled)
everywhere when applicable? There's a lot of places in the ppc code where
this can be done.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/helper_regs.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index c0aee5855b..779e7db513 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -22,6 +22,7 @@
>   #include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
>   #include "helper_regs.h"
>   #include "power8-pmu.h"
>   #include "cpu-models.h"
> @@ -203,17 +204,10 @@ void cpu_interrupt_exittb(CPUState *cs)
>   {
>       /*
>        * We don't need to worry about translation blocks
> -     * when running with KVM.
> +     * unless running with TCG.
>        */
> -    if (kvm_enabled()) {
> -        return;
> -    }
> -
> -    if (!qemu_mutex_iothread_locked()) {
> -        qemu_mutex_lock_iothread();
> -        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
> -        qemu_mutex_unlock_iothread();
> -    } else {
> +    if (tcg_enabled()) {
> +        QEMU_IOTHREAD_LOCK_GUARD();
>           cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
>       }
>   }


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B136D9A9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:36:45 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblIy-00050g-5Y
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lblI0-0004UV-Pn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:35:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lblHz-00063f-7h
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:35:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n3-20020a05600c4f83b02901425630b2c2so2693633wmq.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P0UrzXXfDU1NIhaorwKyi9p9/YICu8XeqJ1T+PH/XTs=;
 b=nxKasS1Lh35CSNmc9q4i0dr26btgsl9w04pLBVJxQqMW1R7zU7gTbeaYuj7KZLoJtH
 EpoYncX0eSzqMwW9kakLLQiV5GWVmEAW6bREImXG/Wi3fRg2sm3JVxWs+bT8yvDM17g9
 5SrWDW+qa09xmDFBLOF8YveTEw7JR3OzecocxrBY+IgLohcFtYkDGLbAITT13r+p8ITp
 HkPoF0JYrpeQpiapCOFVU29nRJlMOpWeA4e6RF1JC4Olv9G3MMj7/+F0r9MLqaBLJFwH
 LckNbARP45clcSpAQFIvDNlXeVmyjduwuRzphhQWZKmgXnxZGsNLOs8vNyTLNDpSvKNB
 UwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P0UrzXXfDU1NIhaorwKyi9p9/YICu8XeqJ1T+PH/XTs=;
 b=shSbn1bZ5vc15cCC4wciEbDBS5GPwtvqFyfFfO0zgIezI+IVvYLGY5kwtVZHdFD7Ry
 iI2BzuER9sblQWY3DlqNnTV0h8o0KRgdV9w+muvBbBVDPYZ5kpSxVvUDhMhl7y2wPocH
 UcNJCEjGA7jkniAGy2fIWuAmTb86KY+lfXgw9idG2ev8ZO5vO+oKgT5dcGNdCLqQb7Tl
 zupLwcFZQHKCfMUdX4WwW6KrfWZ9k26EuWPctZuZBmYSHm0sm2tJJAZcvoz46id6e7jJ
 bwX5me5EmRt5W/FpTAqSB6B5iO5mS96sBzzLYrnnJjQ8x9iHV8DJN74PTDf5dhBx9jct
 UJhQ==
X-Gm-Message-State: AOAM5313c8f77+mKJNSYz5uao0WmpZBgSeKGtQLn4XpMRrpORgwZMIrp
 06zjZzfmpp6OZDJqZVfRBw/n4g==
X-Google-Smtp-Source: ABdhPJyBETtC85ETB4sMHMuxkPMx7u8TOhQXiO2GpCeCmViWsuG3HsW7xDTfZtLd42mYzzg8+ZZcSA==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr32359371wmj.100.1619620541595; 
 Wed, 28 Apr 2021 07:35:41 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id m15sm187858wrx.32.2021.04.28.07.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:35:41 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] hw/sparc64: Fix code style for checkpatch.pl
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428141655.387430-1-f4bug@amsat.org>
 <20210428141655.387430-4-f4bug@amsat.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <d40685e9-e655-24f0-d76e-ac53eb61885c@adacore.com>
Date: Wed, 28 Apr 2021 16:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428141655.387430-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 4/28/21 à 4:16 PM, Philippe Mathieu-Daudé a écrit :
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

> ---
>   hw/sparc64/sparc64.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
> index cc0b9bd30d3..fd29a79edc0 100644
> --- a/hw/sparc64/sparc64.c
> +++ b/hw/sparc64/sparc64.c
> @@ -48,14 +48,18 @@ void cpu_check_irqs(CPUSPARCState *env)
>           return;
>       }
>       cs = env_cpu(env);
> -    /* check if TM or SM in SOFTINT are set
> -       setting these also causes interrupt 14 */
> +    /*
> +     * check if TM or SM in SOFTINT are set
> +     * setting these also causes interrupt 14
> +     */
>       if (env->softint & (SOFTINT_TIMER | SOFTINT_STIMER)) {
>           pil |= 1 << 14;
>       }
>   
> -    /* The bit corresponding to psrpil is (1<< psrpil), the next bit
> -       is (2 << psrpil). */
> +    /*
> +     * The bit corresponding to psrpil is (1<< psrpil),
> +     * the next bit is (2 << psrpil).
> +     */
>       if (pil < (2 << env->psrpil)) {
>           if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
>               trace_sparc64_cpu_check_irqs_reset_irq(env->interrupt_index);
> 


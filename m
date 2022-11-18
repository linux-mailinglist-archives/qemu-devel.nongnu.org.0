Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF862F240
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 11:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovyM7-0003rc-Lh; Fri, 18 Nov 2022 05:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovyM5-0003qv-SU; Fri, 18 Nov 2022 05:12:17 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovyM0-0005w9-4Z; Fri, 18 Nov 2022 05:12:17 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 a7-20020a056830008700b0066c82848060so2782370oto.4; 
 Fri, 18 Nov 2022 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BVKp1XhVZw0Sx+mRPvR614/5QX6uY4YZdN9mLvmlRd4=;
 b=m9L0KUFSi730Kj0C7lKOaxK/dBONvoKh29eYmBxkSf33nk+FI4iS8dI6w53/YL3td0
 RCsGGoJ9r8tNghA0oaU+ueeX5mYE08/hGDGEDFr63mbkI5DOEW62vli2W5ck7WTXs6HQ
 zEqbOZKqEcgwigEod3iY5RD9omCHmHNMzGv5rj5r6awnsReeIztlKSil0cz84uOOh/+e
 vQtImU4ukAfAXarTr+LESiJ9jLvruorUrQ1XkHcUidGwECEmRNTjSPPATPohwrABtJvS
 0VQj8vSNZotRWFI/ehRzdMUxUGVlOf0rKtd3vJXoHElW/EY4PizsnaF7JQW3t7Va67is
 5BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVKp1XhVZw0Sx+mRPvR614/5QX6uY4YZdN9mLvmlRd4=;
 b=ojy2ILoq4UP+vJTZ1perfjZxB4wRXQR3/s5Cj5OLbTmbWI+N25VOicGVHCLW24VEBo
 5bmoVRXP/MiqNV5FKlvXLV/AuK/0EiMuznxxcIo2PNXFqT4tbUyHO07DJnNMttys90En
 /wgG9XYG/VwXaO70vlfrvldPs7bFPHoBIAOHf3d5ZDt72ZftOW96UxOQT/b90uEWCpws
 QHRE+LKKR6ptVyRwA/hu97850KZdt4etISVPln5c9qb01UvY6iwCJHArsLRrqDyBBvVM
 arqA33zxsuz0DWLpKI88zHrmIxVFf7iiHfCfl/51/2eRjlqqH/viqRYKvS0ONs174Vni
 twZA==
X-Gm-Message-State: ANoB5pmfqaRfLPdHfzRF+YH7PBLMO0e6lZtxAqqgSJy0YBV3ZnzlOxGh
 /BbFjcfeehcGEIO+T2kcm8A=
X-Google-Smtp-Source: AA0mqf4rQjsRJEgjR25xOxKFycNPF9Tf3azIdrbHKEP94HsFjPPhxl1BL3GF8AX1ua1gPqxMt3FaOA==
X-Received: by 2002:a9d:347:0:b0:66c:9e9a:1f82 with SMTP id
 65-20020a9d0347000000b0066c9e9a1f82mr3255870otv.269.1668766329460; 
 Fri, 18 Nov 2022 02:12:09 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 s27-20020a056870ea9b00b001422f9b5c17sm1733980oap.8.2022.11.18.02.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:12:09 -0800 (PST)
Message-ID: <dd651eff-ead2-b4c8-50c1-b175c943216a@gmail.com>
Date: Fri, 18 Nov 2022 07:12:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 3/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_maybe_interrupt
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-4-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221118091858.242569-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-ppc@nongnu.org
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/excp_helper.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 94adcb766b..8591bb3f73 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2163,22 +2163,13 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
>   void ppc_maybe_interrupt(CPUPPCState *env)
>   {
>       CPUState *cs = env_cpu(env);
> -    bool locked = false;
> -
> -    if (!qemu_mutex_iothread_locked()) {
> -        locked = true;
> -        qemu_mutex_lock_iothread();
> -    }
> +    QEMU_IOTHREAD_LOCK_GUARD();
>   
>       if (ppc_next_unmasked_interrupt(env)) {
>           cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>       } else {
>           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>       }
> -
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
>   }
>   
>   #if defined(TARGET_PPC64)


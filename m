Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE962F249
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 11:14:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovyO4-00054N-5U; Fri, 18 Nov 2022 05:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovyO1-000545-SZ; Fri, 18 Nov 2022 05:14:18 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovyNw-000678-Mu; Fri, 18 Nov 2022 05:14:17 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14279410bf4so3618956fac.8; 
 Fri, 18 Nov 2022 02:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jIx2XSQp0fShZ0Ilt+9wA9UslrBFezDtbJxb1ryNRNE=;
 b=DcFlHGBSBFSk+IsIAvheWUTiNyCDAE1UIg6PUUwSpt4LUOsX7rej1pr1Tr1/JUQpZE
 D5gLrm1W2uSfPJh9S8sVRG7ZktI42ZY1RdH53e5otC8kGv41RREu9QyVSjRbGQqZRXcf
 y70moYK4YZhB3lFKcqZDt1MQZr/T1oy/wvEc71DOwiXwhdi4ALGwNiyfFaviO4ZZW/QA
 5Y/zpLaemXniEXIiFMXbFrEpCDUJ/OErwIraDQUfd1CyVxCruENaM5+/Gw9tsBvzHCoL
 ThnTcqdAf7hWowDOhnwXay9laaiwTNwE929I2qAnjTUCFJr1M7cCvm1B0Ie3PGDGsWHj
 /CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jIx2XSQp0fShZ0Ilt+9wA9UslrBFezDtbJxb1ryNRNE=;
 b=Kyfbfm7uAcXLZBrm3lI0mSRi4FKrIHR4REVINkOxlPDqhhApAe7DtlsO+rRpCU+hwG
 Cj0CQeaowo3u8xiCBc+lDc68Egfgtw3QGEbUjh8WQTbN9+DiBUuaNSkBFmJ7PDOb21jO
 hoHTqv4iOe6XeNRyXSm/QJYMq4mSfC1eO0IjvbZAo68K9lFsqJTaIf+em4ia4RYGdsgw
 jAdmxlMPxr6G/wPfVv2l/GjPszY65govOKloo/hkcrYkhRMAluoOWC9QptP5Q623kT/o
 FzMZgz0om6o19pbZ/Nk8zIo3JdB5NZPTevi8cA3u4NeD99XVSZfGEyBO31ue1ltcY4LQ
 5ORA==
X-Gm-Message-State: ANoB5pmgwdnjTTHxVHAkTal/gDERoM2N8kfHAG65nV7foTAtdq+7J5QT
 pudLoMt9EmuWIGJ9yZZTSO3dHq74HFg=
X-Google-Smtp-Source: AA0mqf6iSoZjmvQo+Hfl4Tbcno1+Gi/1h12CYkJa6fqjJjMfy6lGXN4Hg0BaSWX/WYV4A2mQi0appw==
X-Received: by 2002:a05:6870:b3a6:b0:13b:7e32:2dd5 with SMTP id
 w38-20020a056870b3a600b0013b7e322dd5mr3533137oap.242.1668766450456; 
 Fri, 18 Nov 2022 02:14:10 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056870708700b0013c8ae74a14sm1726899oae.42.2022.11.18.02.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:14:10 -0800 (PST)
Message-ID: <75ed5451-5893-d303-d330-ac95db670650@gmail.com>
Date: Fri, 18 Nov 2022 07:14:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 6/7] hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_set_irq
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-7-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221118091858.242569-7-richard.henderson@linaro.org>
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-ppc@nongnu.org
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index dc86c1c7db..4e816c68c7 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -44,13 +44,9 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
>   {
>       CPUPPCState *env = &cpu->env;
>       unsigned int old_pending;
> -    bool locked = false;
>   
>       /* We may already have the BQL if coming from the reset path */
> -    if (!qemu_mutex_iothread_locked()) {
> -        locked = true;
> -        qemu_mutex_lock_iothread();
> -    }
> +    QEMU_IOTHREAD_LOCK_GUARD();
>   
>       old_pending = env->pending_interrupts;
>   
> @@ -67,10 +63,6 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
>   
>       trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
>                              CPU(cpu)->interrupt_request);
> -
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
>   }
>   
>   /* PowerPC 6xx / 7xx internal IRQ controller */


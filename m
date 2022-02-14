Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2974B52E4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:13:07 +0100 (CET)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJc6E-00005h-Bd
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nJbDz-0005sT-OH; Mon, 14 Feb 2022 08:17:07 -0500
Received: from [2607:f8b0:4864:20::c2b] (port=41589
 helo=mail-oo1-xc2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nJbDy-0002xQ-AC; Mon, 14 Feb 2022 08:17:03 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so19245808ooq.8; 
 Mon, 14 Feb 2022 05:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MCGCvqD1nLou3fCKluYhjdM9d4psib4efrijEU50msI=;
 b=qhI7qdKAbSTqJcOyd0D6CiILZvnvQHdGKolpUFDC05vO2FjFZdx+bxFm7o9uCyQU5U
 HSdZmc96qMHNXuhqSFqT4AVvzBSptJfhCOJfb/sSsA7JOJg0Se/QwoTvOPvVkzjSPiaj
 FbCRTy7eZqt54cJ/gdmwOUk0ysDGU8z3g10h4JhmvjjVXjPzpLAho/y7OHSWTDeOljJx
 4qnp5N10kjOSIwut5r1acZcVva9LgiwIiVGTTuZbZU21QvLi4nXsK3OCHgoU6HbFHXp4
 nOA9UirsCY1T3hw7XTgk3pJ6dFwjyrMMrx1K92X6mCZ7U/wgVDlYkETy8NhmRxn0qt1o
 zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MCGCvqD1nLou3fCKluYhjdM9d4psib4efrijEU50msI=;
 b=50FYH9Bj2GFpagGDkYAFOXjuNjCnqaIxsxXJ4J3NZpbpSBoUuR/2eYkGWnK3Qm5fHS
 emIlyxp9rhWXwV3FraRU4MpZnwTefsueK5Nt7n1a64YkQKcjjXz0FP/8jEpsj2fjA3NT
 0DVo0dkxRQ6aAWK2ZwDJdbNzvPGSxjx65YHhwRAEaaaphBixg4W6iXUY1lOJ+f+hw1yR
 yh9uMpWPScnxBc2rvKsIbQl7yAnpoJqpp1qWOPqdre1AJ9Zrj7OZRCF73L2ADOYBiQdq
 bY6Rtvx7NTPfY1zTuxsfVtT3QzWQmaNkoLHUW+QkvOwyBGNyuvi4piq1HrrmWm1jDFLq
 JVdg==
X-Gm-Message-State: AOAM533tKRW66+tnSBlUa3aK1wZW38+edGKMn5at67pA8XpRyNJLny94
 9pWP9AZoIDKAeimDl9Oji5A=
X-Google-Smtp-Source: ABdhPJw8h41KlTui9tQMvGibvJQBzJHWvNUcw1Cq2yStvoYnwwbnWGWxqbpZFnyuooS3IXQAEdUvtQ==
X-Received: by 2002:a05:6870:339a:: with SMTP id
 w26mr1414620oae.134.1644844616859; 
 Mon, 14 Feb 2022 05:16:56 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id o13sm747284oiw.17.2022.02.14.05.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 05:16:56 -0800 (PST)
Message-ID: <6145d2c0-ea7b-6c74-c4ef-54ba080cdbca@gmail.com>
Date: Mon, 14 Feb 2022 10:16:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] spapr: prevent hdec timer being set up under virtual
 hypervisor
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20220214123116.1546406-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220214123116.1546406-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/22 09:31, Nicholas Piggin wrote:
> The spapr virtual hypervisor does not require the hdecr timer.
> Remove it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc.c            | 2 +-
>   hw/ppc/spapr_cpu_core.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 462c87dba8..a7c262db93 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1072,7 +1072,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>       }
>       /* Create new timer */
>       tb_env->decr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_decr_cb, cpu);
> -    if (env->has_hv_mode) {
> +    if (env->has_hv_mode && !cpu->vhyp) {
>           tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
>                                                   cpu);
>       } else {
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index a781e97f8d..ed84713960 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -261,12 +261,12 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>           return false;
>       }
>   
> -    /* Set time-base frequency to 512 MHz */
> -    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
> -
>       cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
>       kvmppc_set_papr(cpu);
>   
> +    /* Set time-base frequency to 512 MHz. vhyp must be set first. */
> +    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
> +
>       if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
>           qdev_unrealize(DEVICE(cpu));
>           return false;


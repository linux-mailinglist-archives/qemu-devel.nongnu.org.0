Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347A479799
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:39:45 +0100 (CET)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMpE-0004qp-OL
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:39:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMnS-0002oi-G7; Fri, 17 Dec 2021 18:37:54 -0500
Received: from [2a00:1450:4864:20::430] (port=46980
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMnF-0002qI-65; Fri, 17 Dec 2021 18:37:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id i22so6780545wrb.13;
 Fri, 17 Dec 2021 15:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HOPTAh6m5GDI/CIXJitGyoUDnldaGQ9D0CTfu8psJhM=;
 b=QyIaOkSLFtHICor4cOCoMCJQ7EdRXI4B673RWqLWoOkwC4BQKUxUKjjrWl7/VuJiIF
 GJxOn1rvGx5PzUf+y1mEunpen7x+FZ+47+gxif76HsAOQZX6sqMmjIoaatG9+B+d10PJ
 vMUlUXVCSy+QCQ7rFDxeesveYFjsIhWdrdYxhrpE6RSiD2mbNhvv3Q4xlrSzVtY9bVFl
 B279XoLfly9BEhDcb+YlMBKamxgZTwaHgqpaiRB6cf1/XEKt/5xj82s2IduRjA98NMyj
 FklrAsGAauYDvIdXJoigg9yV4m8wJaVmQCH4+3x6Z7ccpWp3bPmPzO68VKTgZ/JR6gcd
 7PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HOPTAh6m5GDI/CIXJitGyoUDnldaGQ9D0CTfu8psJhM=;
 b=BQx4eC0CyMWY9/2qpD+6PdX/9gjouZeE1jZB3mf9dOALgLrU/JoyuN+8mgto0HBcKp
 KNWRucD3S71RNBLi/OQreC0BWE72w/ItHvHgAgFIDDQzxc3p+3JFgwwE3vICBZ6v45iv
 FCckEYuN0XALvliJ6Clo66gbn3rJ4A2rIC5eW0v9dEh43NfqESVrTNOnhEBtvzzBSHlC
 ZVbtJRuD9BRc8Mwn0ulFVlr8VqExxi/h1h0GVhb3ukChlst5Oha8SlSIRJNGXbgjIP4o
 vgQzphw1automUJCLbr/exYzjHj/fG7JLyYrY6rBMksgb9L4/x+u9C57qW/mocK5sJHL
 lJrA==
X-Gm-Message-State: AOAM532FmTgq8XHaV2CZjrxin/Xy6U8OPUqoGj8SmG6EVR3DVOWbJY/G
 oO5o6+AEi8hPC7uiCOifHz448H6cARU=
X-Google-Smtp-Source: ABdhPJwq+5Zk1c5zJ1GOCFOCUVTI7zgI6tpLzuuR1oyi/ThS+mOaDtbOPirACxHcIaVUidssN8ceXA==
X-Received: by 2002:adf:e706:: with SMTP id c6mr4295809wrm.228.1639784257719; 
 Fri, 17 Dec 2021 15:37:37 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f19sm13550716wmq.34.2021.12.17.15.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:37:37 -0800 (PST)
Message-ID: <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
Date: Sat, 18 Dec 2021 00:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211106105623.510868-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211106105623.510868-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 11/6/21 11:56, Philippe Mathieu-Daudé wrote:
> Add the vmstate for the ETRAX timers.
> This is in theory a migration compatibility break
> for the 'AXIS devboard 88' CRIS machine.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/timer/etraxfs_timer.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 4ba662190de..139e5b86a44 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -26,6 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> +#include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
>  #include "hw/irq.h"
> @@ -64,7 +65,7 @@ struct ETRAXTimerState {
>      ptimer_state *ptimer_t1;
>      ptimer_state *ptimer_wd;
>  
> -    int wd_hits;
> +    uint32_t wd_hits;
>  
>      /* Control registers.  */
>      uint32_t rw_tmr0_div;
> @@ -83,6 +84,36 @@ struct ETRAXTimerState {
>      uint32_t r_masked_intr;
>  };
>  
> +static const VMStateDescription vmstate_etraxfs = {
> +    .name = "etraxfs",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PTIMER(ptimer_t0, ETRAXTimerState),
> +        VMSTATE_PTIMER(ptimer_t1, ETRAXTimerState),
> +        VMSTATE_PTIMER(ptimer_wd, ETRAXTimerState),
> +
> +        VMSTATE_UINT32(wd_hits, ETRAXTimerState),
> +
> +        VMSTATE_UINT32(rw_tmr0_div, ETRAXTimerState),
> +        VMSTATE_UINT32(r_tmr0_data, ETRAXTimerState),
> +        VMSTATE_UINT32(rw_tmr0_ctrl, ETRAXTimerState),
> +
> +        VMSTATE_UINT32(rw_tmr1_div, ETRAXTimerState),
> +        VMSTATE_UINT32(r_tmr1_data, ETRAXTimerState),
> +        VMSTATE_UINT32(rw_tmr1_ctrl, ETRAXTimerState),
> +
> +        VMSTATE_UINT32(rw_wd_ctrl, ETRAXTimerState),
> +
> +        VMSTATE_UINT32(rw_intr_mask, ETRAXTimerState),
> +        VMSTATE_UINT32(rw_ack_intr, ETRAXTimerState),
> +        VMSTATE_UINT32(r_intr, ETRAXTimerState),
> +        VMSTATE_UINT32(r_masked_intr, ETRAXTimerState),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static uint64_t
>  timer_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> @@ -357,6 +388,7 @@ static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>  
>      dc->realize = etraxfs_timer_realize;
> +    dc->vmsd = &vmstate_etraxfs;
>      rc->phases.enter = etraxfs_timer_reset_enter;
>      rc->phases.hold = etraxfs_timer_reset_hold;
>  }
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D6504A32
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 02:26:21 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngFDg-0007qh-1s
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 20:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngFCN-00075l-79
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 20:24:59 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngFCL-0001zO-Jl
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 20:24:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so12724729pja.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bSLVZu4kEojhUwmcp8aXGxF6EpCHL+vCdFuUHcRkjCA=;
 b=WEFxRHNA1QZA6JOZk2XIQcvAWB3HacoKj+QtI7uH9Mm7WIhVliXenH9PQ/jKiLAGA4
 xD5WkNlIOsIIVLwc5ZzRJkDaW/aXDW6yr/28YEj2ZrCSCyEH0iO4DDzyGYX0CFIsS5Nz
 A5jmk7QaQC5cqH7qmMMEquLA75GAPPoaIy6atj9pSb8aKKUtbMZdWSGoVf1YIyux8UC9
 /3TktSB0Dzqvdz7mOySk79MljiFr1k8K24mcnlT4OWjkPS1koM7t3dbZVReaqhDKgK6H
 6Mm/aE739VoDxlEH0rPSiPOFWdGQVzHMK6ALdavf0nkPP2C2Pm2OTJab8QeQpJ3fbYoe
 7RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bSLVZu4kEojhUwmcp8aXGxF6EpCHL+vCdFuUHcRkjCA=;
 b=n7tJHpDJsFozAZ2nw/haAx/rMMpI49cXWX538PIdF4Uu1Paije8RRRs4ih0g/SPQcE
 atY8xexMcc6hElHGt8/nQp3PMH2AKQCwFKY/d+cUNo3SEjg0oOwnFbHrZfGNX3WAUkjI
 Sn5Zv2ixdCxrR+fKXvzWuoZgjAnPRPyO33Ec5o8nOnmOb4fLfmXT++aEnIKF/3ceh8oB
 W7bhQ46sRY878/jfSeJBiqISF8NH1Xa3lxe11VzI6Cec9UEiJoJ7euUXX5zC5/t/QEuz
 57EmNUlzfWRY+j60QDOcMFQWoV2LwRfiRThDcHXXN5GNgCPWQIl4wXCkTXOuovFTEoWu
 pFlQ==
X-Gm-Message-State: AOAM531+T5uIZGMzLNemmXkHX17BQ1kQIbbrws9p8317gWFkIfyzkcAs
 2p+Sx8ziaZCovDRTpKKdP7clxQ==
X-Google-Smtp-Source: ABdhPJyTjlVJHArRqMG3jOPGt+0lKbhF+5BUPRIcXAg1M++mVhQG3XY5KSIqX3DBv8wLjrPXw8dKAQ==
X-Received: by 2002:a17:902:7c01:b0:158:3dd6:d1ba with SMTP id
 x1-20020a1709027c0100b001583dd6d1bamr8522182pll.120.1650241495917; 
 Sun, 17 Apr 2022 17:24:55 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a17090a728600b001cb646a4adfsm14521431pjg.52.2022.04.17.17.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 17:24:55 -0700 (PDT)
Message-ID: <69e01fa9-3200-4f38-ed1e-2cb4b9301582@linaro.org>
Date: Sun, 17 Apr 2022 17:24:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 32/43] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-33-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-33-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +static const VMStateDescription vmstate_loongarch_ipi = {
> +    .name = TYPE_LOONGARCH_IPI,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }

Why are there no fields here?  There's definitely state you should be saving.


> diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
> new file mode 100644
> index 0000000000..d57b0c6192
> --- /dev/null
> +++ b/include/hw/intc/loongarch_ipi.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch ipi interrupt header files
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LOONGARCH_IPI_H
> +#define HW_LOONGARCH_IPI_H
> +
> +#include "hw/sysbus.h"
> +
> +/* Mainy used by iocsr read and write */
> +#define SMP_IPI_MAILBOX      0x1000ULL
> +#define CORE_STATUS_OFF       0x0
> +#define CORE_EN_OFF           0x4
> +#define CORE_SET_OFF          0x8
> +#define CORE_CLEAR_OFF        0xc
> +#define CORE_BUF_20           0x20
> +#define CORE_BUF_28           0x28
> +#define CORE_BUF_30           0x30
> +#define CORE_BUF_38           0x38
> +#define IOCSR_IPI_SEND        0x40
> +
> +#define MAX_IPI_CORE_NUM      16

So... 16 cores, but...

> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> index ffe10edc65..a659be2a7f 100644
> --- a/include/hw/loongarch/loongarch.h
> +++ b/include/hw/loongarch/loongarch.h
> @@ -12,6 +12,7 @@
>   #include "qemu-common.h"
>   #include "hw/boards.h"
>   #include "qemu/queue.h"
> +#include "hw/intc/loongarch_ipi.h"
>   
>   #define LOONGARCH_MAX_VCPUS     4

... only 4 cpus.

>   
> @@ -41,6 +42,7 @@ struct LoongArchMachineState {
>       /*< private >*/
>       MachineState parent_obj;
>   
> +    IPICore ipi_core[MAX_IPI_CORE_NUM];

So why 16 cores here?


r~


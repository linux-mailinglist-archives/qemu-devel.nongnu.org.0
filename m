Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB644A3B51
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:37:57 +0100 (CET)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJlb-0005Mm-Ss
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJjj-0003wu-8L; Sun, 30 Jan 2022 18:35:59 -0500
Received: from [2a00:1450:4864:20::32e] (port=38682
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJjh-000416-OD; Sun, 30 Jan 2022 18:35:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so12456430wms.3; 
 Sun, 30 Jan 2022 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nPalRgcqo1Kumyk7q0Lwa8WrfJYIRLfzwdSN7zYWjQQ=;
 b=Tvmyx0wvGHo2hAABTEBfaoboG0ivcoPRgMNYm4HX9aRE9thkg6Yvip74ww1yYhQfRP
 nOK8N9xR0ZMMJE5A27kBorhS0+CSIusWL5vNGdIVak0BAKK28RQd68pV9DqsGDoUY1xM
 DFyKExZxTmhWKL+7/r0pkx6MTY9aTzH9af4NMvVnq/LczSiZ2TV3zOY3E2/onOv5WVYb
 cuoXoeU2nb366a993+w6oiaMKL77OThOmhnyxxnyJPYOonkssGW1NA+Vfe71BNEi2ySN
 3Y7/E4WRI2Ia3fLCtDnmj4ENQq7WPeQTxvJZvIe4MQYCdGgtGw3idEspGvNslzPp6Il2
 BvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nPalRgcqo1Kumyk7q0Lwa8WrfJYIRLfzwdSN7zYWjQQ=;
 b=UlMFKn7BsPxWA20CDJDjffrSBXxUKO4BL6ox+3d68tvx81tgaPfY7rfKsIpGtJ7Bre
 paTqUH9g4WnXFwlaAsauX55kcJlvQP2EGKVdWai/KBH0O6dy/pZ8Gs7Ng0YsPfUj4UpY
 lcgVHJArQFRFQjI9udxVkDvQnbvcpDW6QbO39gxD5GrGqsaf65lCkFVQsORe1juwAw7l
 aeFbFNIxZ4U2edy2Z4AEdcnYewsNCZCzHuFEOW20h1nYydBsYiub/9cJJXwOW0CBgydh
 br2PialZDoDGqO8xoeC1/5wWdmI0ApqNCFBGPEA/nv27c90PZKZzIPQZEOWU1Q/r5LVO
 JKEg==
X-Gm-Message-State: AOAM530ZyXljscZaexk/jW1p4knOUb2c1aP4S0cHGd8NoqM/9FDyPQzl
 pzAQzxRZ5XBbiz4VgzHVndg=
X-Google-Smtp-Source: ABdhPJyml4TVzYm35AIT2j3DxkrfwaiXmBqNRq+EL7RqehrWuv+bCK9lXJ+l3oP3dXUawNXUsSnPgA==
X-Received: by 2002:a05:600c:4c95:: with SMTP id
 g21mr24864322wmp.109.1643585755995; 
 Sun, 30 Jan 2022 15:35:55 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r7sm7712950wma.39.2022.01.30.15.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:35:55 -0800 (PST)
Message-ID: <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
Date: Mon, 31 Jan 2022 00:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU
 Control
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-6-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-6-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 00:12, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add a model of the Xilinx ZynqMP APU Control.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
>   hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++++
>   hw/misc/meson.build                    |   1 +
>   3 files changed, 349 insertions(+)
>   create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
>   create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
> 
> diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> new file mode 100644
> index 0000000000..44bf264cef
> --- /dev/null
> +++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> @@ -0,0 +1,91 @@
> +/*
> + * QEMU model of ZynqMP APU Control.
> + *
> + * Copyright (c) 2013-2022 Xilinx Inc
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
> + * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + *
> + */
> +
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "target/arm/cpu.h"
> +
> +#define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
> +
> +#define XLNX_ZYNQMP_APU(obj) \
> +     OBJECT_CHECK(XlnxZynqMPAPUCtrl, (obj), TYPE_XLNX_ZYNQMP_APU_CTRL)
...

> +#define APU_R_MAX ((R_PWRSTAT) + 1)
> +
> +#define NUM_CPUS 4

Hmm isn't it APU_MAX_CPU?

> +typedef struct XlnxZynqMPAPUCtrl {
> +    SysBusDevice busdev;
> +
> +    ARMCPU *cpus[NUM_CPUS];
> +    /* WFIs towards PMU. */
> +    qemu_irq wfi_out[4];
> +    /* CPU Power status towards INTC Redirect. */
> +    qemu_irq cpu_power_status[4];
> +    qemu_irq irq_imr;
> +
> +    uint8_t cpu_pwrdwn_req;
> +    uint8_t cpu_in_wfi;
> +
> +    RegisterInfoArray *reg_array;
> +    uint32_t regs[APU_R_MAX];
> +    RegisterInfo regs_info[APU_R_MAX];
> +} XlnxZynqMPAPUCtrl;


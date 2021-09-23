Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1E415B73
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:51:43 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLOI-0000FG-NL
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLMb-0007xJ-0P
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:49:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLMY-0004ND-Tl
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:49:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t28so2056321wra.7
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DmsN/SgdONrcGGkbnhJS0qh+gUnUuZco+KwAhGqsJOM=;
 b=IEwUtdySeGUaTatH+W8x2QHA8TKiQOBS/m9i5HlqLkherlIFlV+cXlzr6gF7UloHrY
 BOUL/U+ZzDlLz2bxL5vVeNrrLm5o5LIRK5jEpKeXY3q61o10XyPKM+YRhlGK2rQCK+Li
 gKusdywag6tANumM4RVLF6ygpV/Cn3c4fkqLNhxJ0+h77wo9oS/OkkOPJNX7pEGelah/
 7RTjO8YnmbUAPxL8LXmRS46ZqsmaEeKnwOJX/1tzlKzeKtwga0qgJ4uP7blxhkLFHtfz
 hr2kIi6IAhJT3WFlubeidcmWVjxnKm5A6yErni0p/P8rFYuqx4HZL0uKlH2HDiQL8QY+
 TxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DmsN/SgdONrcGGkbnhJS0qh+gUnUuZco+KwAhGqsJOM=;
 b=iQjJ4NOcBxtMrxKnCyHugx1CQFUpY6nKpH4MFr9PHtJQgw4t/mcw9NDJvZDPGVqr1M
 TqM3SGzNhnPBub/q5joeC9jka3XseLsol2wudseKi7ZjpfPxf+DMa0ZQYafhb2jbmCkz
 DmcVq7wxrSLLbpLeb0rgKVSxlg9yUEqc9rsOKlnA4UDCxvKRVQ4xF6yviCHINoOTT7ct
 vid4tpZVoOOMjUiayPr2nqc86POz2Di+fjWEupl+lsp4xdWWLUFRi9+s1bcAk8+xzOib
 CW4K1GcLW7q143jI53WHNa0eef52ErGthuhzAoDphqeY0P8gjeDGCX18evcwIDt8umiU
 Aa2A==
X-Gm-Message-State: AOAM533niOOuxZGXK8m5K/+AIbTtpDpmTP+6U1mOrnxVItVvQYywm7FC
 yoLiH88hUTbYwNUZs0B8Ew8=
X-Google-Smtp-Source: ABdhPJzoa8ErErc5+xqKEB8JudF7kXCmtPya/55Q0n0v8o7h2/xxNqrnBmHg1iBPDM7GP7INPLS/FQ==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr4014344wrs.190.1632390593366; 
 Thu, 23 Sep 2021 02:49:53 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t126sm8534792wma.4.2021.09.23.02.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:49:52 -0700 (PDT)
Message-ID: <2e859345-2285-6b29-a3a0-7c888f73cc93@amsat.org>
Date: Thu, 23 Sep 2021 11:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 18/20] nubus: add support for slot IRQs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-19-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210923091308.13832-19-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 11:13, Mark Cave-Ayland wrote:
> Each Nubus slot has an IRQ line that can be used to request service from the
> CPU. Connect the IRQs to the Nubus bridge so that they can be wired up using qdev
> gpios accordingly, and introduce a new nubus_set_irq() function that can be used
> by Nubus devices to control the slot IRQ.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/nubus/nubus-bridge.c  | 2 ++
>   hw/nubus/nubus-device.c  | 8 ++++++++
>   include/hw/nubus/nubus.h | 6 ++++++
>   3 files changed, 16 insertions(+)

>   static Property nubus_bridge_properties[] = {
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 280f40e88a..0f1852f671 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -10,12 +10,20 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/datadir.h"
> +#include "hw/irq.h"
>   #include "hw/loader.h"
>   #include "hw/nubus/nubus.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   
>   
> +void nubus_set_irq(NubusDevice *nd, int level)
> +{
> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
> +

A trace-event could be helpful here, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    qemu_set_irq(nubus->irqs[nd->slot], level);
> +}


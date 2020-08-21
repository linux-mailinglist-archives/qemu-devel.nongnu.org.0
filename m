Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F424D407
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:33:31 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95IY-0001mq-TM
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k94aE-0007jy-Pp; Fri, 21 Aug 2020 06:47:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:32854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k94aD-0004iA-1z; Fri, 21 Aug 2020 06:47:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id p20so1535892wrf.0;
 Fri, 21 Aug 2020 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gTUXUYJh9r4NpY0TQpnZlz7xsFLACmEn8LbRCqPweZg=;
 b=M50H4+1wCfZUO/nLeJXh/oW1ntMenEGD5KwbAGlbcRdmvQW/dtj3bv2UQRxUXYrcMf
 XCLmPe546BmU6MXVm9WNHZx4varVQkxfl+68IDxmNzUhVsQrrqsyA2H1/twsxOzTIDvJ
 HcRbTQ8Pr7fV9p3+m2rLKw8xJFj/noIn/FqwWqgkVG+wLJVMMoGyfZUtD/wVEcIdJQNk
 31jMQpi6KDkqAsWjC3+rOtLNOkoScZCJ5qN4IuMimeKdOzhcInhxRzLMnOOz47pfck7G
 5xQov1A9iRtTcnEbDfZpHNbztwKMn6Y2OtZ4nslUfCIRtJB20RCHSKZUyHw5L4/7O+w1
 NINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gTUXUYJh9r4NpY0TQpnZlz7xsFLACmEn8LbRCqPweZg=;
 b=Zj4C3NiOo/s+jF9I/058zvs0E7Dn07Pl4Yv1Uah88GHvyRYp6C7xn3nSYnzJK1Gwqp
 LHW61un3PMTxXYqzr0f0S/Aj2khRRHs4TBFn9lMizAZeiLLqmhoCmvgA1is6WIcK4sUP
 8dAVmLrhDWIgDGlz8TxlJLI7ymjxOToo82/kNZyCLqH8UwzaNo5dm1jmak6l2hYz4BY+
 86MVu9JqC+ZWKig6KYtAYsiB0ukHV3I3ladLI/0QkQWIBpsn96ZrXZBbudUI9mdzcV5T
 EsY38GU48zSJjm9P6jum8In3jX0QhgqKaCxQ0EiDIvxyHlSA4X7jUfK+hDaps8MApAZg
 101A==
X-Gm-Message-State: AOAM530fMf6c1/MGFnOH5TwcmXZ8qbga//7y9rCOKd8cTYYOR5UE3HWW
 N/w5b2dqxvr/cVjx/NiRDGY=
X-Google-Smtp-Source: ABdhPJyUDp55eiiqTOBX+xmasYIONalpawGIno97y0IAWGss143KQhjRnDnK0wPdi698sz3kgcUSDA==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr2161132wrn.126.1598006857111; 
 Fri, 21 Aug 2020 03:47:37 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 202sm4758012wmb.10.2020.08.21.03.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 03:47:36 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/sbsa-ref: fix typo breaking PCIe IRQs
To: Graeme Gregory <graeme@nuviainc.com>, qemu-arm@nongnu.org
References: <20200821083853.356490-1-graeme@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e90ca59f-91ea-aa6a-94b7-f0bf9160b2f8@amsat.org>
Date: Fri, 21 Aug 2020 12:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821083853.356490-1-graeme@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/20 10:38 AM, Graeme Gregory wrote:
> Fixing a typo in a previous patch that translated an "i" to a 1
> and therefore breaking the allocation of PCIe interrupts. This was
> discovered when virtio-net-pci devices ceased to function correctly.
> 
> Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 570faac6e2..48c7cea291 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -565,7 +565,7 @@ static void create_pcie(SBSAMachineState *sms)
>  
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> -                           qdev_get_gpio_in(sms->gic, irq + 1));
> +                           qdev_get_gpio_in(sms->gic, irq + i));

Oops...
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>          gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
>      }
>  
> 



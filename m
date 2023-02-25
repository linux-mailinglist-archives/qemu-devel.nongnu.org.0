Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2226A2B82
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 20:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW0JG-00011B-0s; Sat, 25 Feb 2023 14:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0JB-00010X-Uu
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:34:14 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0J9-0006ij-1L
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:34:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id p26so1849965wmc.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=282LU7GzK5l9nje7dM6E/iDMuSm6nR1ovljrOUDzKKo=;
 b=E6oCMyJ5uUnFY4gvKbfG6PfvCiupl+9UwTF780iBfl40tMaPp/HYMciZWAVcTk48/4
 ztEmJeY5tVYnF4DeoYXOjfoR7dah4I6WzeqeP5C5wgs52KeZ3zOZ6rcn6GGVgoeriwoW
 1EdpXThOTdUNQEabEboeUfh/+b6k5TB0+gP5BtBbzPOE8XarD7rI0vMeRiRLGeTRSjq6
 o7f+89r3+pcXdHtRynfbwlT7Zi5Uxp7CUdWgSj3MzovKCvVXLkd8Q+VXWbK9hByqgcmY
 q4tvEPs3ZdsAR/dvdQtOkLl6KnP0oKu8ZTRMs6nmTdIAnIHyUjLByKtFn1l+blY65myy
 E9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=282LU7GzK5l9nje7dM6E/iDMuSm6nR1ovljrOUDzKKo=;
 b=R1tUIv4yazJZmSeI2nseFfpQPLsc6/4vwixKPATRi81Gp3nxiBpZQAjzbfIi62fTsQ
 7tYaJ8LSuy0RadaQu/eKXYCe0Q94DXNq71jTH7kxi6WTP3WvokVh57ineKR6D1x603c2
 8OKQ//gCjw5W0o46CMxVuAiDTAygQ77kdFqrbCCngane7ymSfzwzTIiK+9qGNgOYwagq
 tHULgTxbpJ6nvwup6usiZ2AltSyqjiI2IRSA2696Ltxf6ahJKZtfkk/oHy5dpmmQ1Hnd
 o8hoMVsy2N9oQk2dPc8dNdMnTQzl2/dKGQKYGCcBdHitCqYPIn9FEohiVw8KPJQ1o2FH
 HM+A==
X-Gm-Message-State: AO0yUKUCIJe42uQsLGbdkIfuImhZPRJZF6g33dfuFIjTKBVXNbXjC9Kq
 N4yeACSjeaCQ5Ei/42ct51S/hQ==
X-Google-Smtp-Source: AK7set/tQw6gd2dZzEnnxmo+A+ifWhKjRxxHhOC2pZpHCvNBPS0darQQ7IGX2USnKt66kOVJRqezNg==
X-Received: by 2002:a05:600c:319a:b0:3dc:4fd7:31f7 with SMTP id
 s26-20020a05600c319a00b003dc4fd731f7mr14840163wmp.41.1677353649179; 
 Sat, 25 Feb 2023 11:34:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b003dc4fd6e624sm3728984wmq.19.2023.02.25.11.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 11:34:08 -0800 (PST)
Message-ID: <fff5cea4-43e6-60ff-4266-c0753d1dfd38@linaro.org>
Date: Sat, 25 Feb 2023 20:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/5] hw/ppc/pegasos2: Fix PCI interrupt routing
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 21/2/23 19:44, BALATON Zoltan wrote:
> According to the PegasosII schematics the PCI interrupt lines are
> connected to both the gpp pins of the Mv64361 north bridge and the
> PINT pins of the VT8231 south bridge so guests can get interrupts from
> either of these. So far we only had the MV64361 connections which
> worked for on board devices but for additional PCI devices (such as
> network or sound card added with -device) guest OSes expect interrupt
> from the ISA IRQ 9 where the firmware routes these PCI interrupts in
> VT8231 ISA bridge. After the previous patches we can now model this
> and also remove the board specific connection from mv64361. Also
> configure routing of these lines when using Virtual Open Firmware to
> match board firmware for guests that expect this.
> 
> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/pci-host/mv64361.c |  4 ----
>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>   2 files changed, 25 insertions(+), 5 deletions(-)


> +static void pegasos2_pci_irq(void *opaque, int n, int level)
> +{
> +    Pegasos2MachineState *pm = opaque;
> +
> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
> +    qemu_set_irq(pm->mv_pirq[n], level);
> +    qemu_set_irq(pm->via_pirq[n], level);
> +}

See TYPE_SPLIT_IRQ.


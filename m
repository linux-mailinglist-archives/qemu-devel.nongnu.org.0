Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29A301D8F
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 17:47:43 +0100 (CET)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3iYA-0005MK-EL
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 11:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3iXH-0004re-H6
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 11:46:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3iXF-0004mI-Su
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 11:46:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u14so8677599wmq.4
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 08:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FQJ5lM5vdWes5tVzbCYs+wE6UsrFV6jlHAad0vYyoBs=;
 b=AyVlYtO38NgOK6Z0eK8IW7Qj2ouN/HLxbhfZOd+tbYxGNO58lY3ILxWv1AXu9eRavC
 v0tZbD2vlXNVBSlJDroxeavqLdls0vTQjQvEO8tmm5Pm/Vm65mQ1udGO6L8JpPEsroYb
 tuqj9dx3QX9K3nl5jyYzg5bvNg6Zul19R8IBum2NEtHKdZd30DSzxdDh0p46yGReZkSS
 xyjAUV+uCazmxPpSmKXIoWY8MMCBZL4JxnZz5BT3odWUS7jQLK5s5k0z8y/l6K7cjekr
 w97uv6AJVsGJl1SnIf8f3iwrbLqTnVXfIkjHnV2Bdpj9WneJFhGv7DKN5wuJdyc2iik8
 g+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FQJ5lM5vdWes5tVzbCYs+wE6UsrFV6jlHAad0vYyoBs=;
 b=k1GDsncNlHwR62vc9WNS4X+gTc1O8Ii2KKE2U950eC4CKUG201cWw0q8oHHIk0QzTn
 YwrDrJ38c1SKvLbrtPvgVZNswwRDFifyJ7dDrLHmJoQJH5TAsZp907/FFudYts1X5S7L
 gKhz8fXDeo03k6fMyMlyWEnS4WTNtsYxZ9AK5nTb3T7+JBBCVeSs5bjYlqnFjvZaZRLt
 wIwylxrtbkYxwhuYz1cWygdqbSUYBALdh+7n4MT6ICHKEEhhovu5PkRvFxNLqMy0139p
 eD4WvcYawpNPVRBP5Uf4a+egTixSvHyGPDKZsmE09fVFUq1XdZ8jfeTkSF/AnDA/tIHL
 xTRw==
X-Gm-Message-State: AOAM532KgK6YGmXX6CWZN70Iu+EjopAvZ7d/n2mEs4jdq7k8vqYrzQQY
 1szmSGp+q9NxAKcWbBKUmFYNj82733s=
X-Google-Smtp-Source: ABdhPJwZzLKPH6N9Krkshb7KpG++1G9n4MHSADZYvj89f2zvvTjXrJCHqesgo7pPe6FgLv68mooypw==
X-Received: by 2002:a05:600c:2155:: with SMTP id
 v21mr3241750wml.177.1611506803877; 
 Sun, 24 Jan 2021 08:46:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s2sm17815185wmc.12.2021.01.24.08.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 08:46:43 -0800 (PST)
Subject: Re: [PATCH v2 4/7] m68k: add an interrupt controller
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-5-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <32a18f3f-4cf1-d12d-9ff1-5a70adcf09cf@amsat.org>
Date: Sun, 24 Jan 2021 17:46:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-5-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 12/20/20 12:26 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/intc/m68k_irqc.h |  28 +++++++++
>  hw/intc/m68k_irqc.c         | 120 ++++++++++++++++++++++++++++++++++++

Missing MAINTAINERS entries?

>  hw/intc/Kconfig             |   3 +
>  hw/intc/meson.build         |   1 +
>  4 files changed, 152 insertions(+)
>  create mode 100644 include/hw/intc/m68k_irqc.h
>  create mode 100644 hw/intc/m68k_irqc.c
> 
> diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
> new file mode 100644
> index 000000000000..c40b1b4df8fa
> --- /dev/null
> +++ b/include/hw/intc/m68k_irqc.h
> @@ -0,0 +1,28 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * QEMU Motorla 680x0 IRQ Controller

Typo "Motorola".

Are there any specs to refer at?

> + *
> + * (c) 2020 Laurent Vivier <laurent@vivier.eu>
> + *
> + */


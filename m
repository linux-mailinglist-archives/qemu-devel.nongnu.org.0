Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27130190A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 01:18:57 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3T7I-0005FV-VB
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 19:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3T6W-0004nG-V8
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:18:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3T6V-0001oa-GW
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:18:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id p15so2033453wrq.8
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 16:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FLQADUfBA7/k4kaBsg0trVq9yxC7LFIZBPMpP8dzO28=;
 b=bnL3qF/1xlmrtGiS3mHDVymIc3Zpeho9D39Pod9x57TmFUFmqbFnfeBQOtQtZWGUhd
 f6f9Dutx9iAS4Hd5PLDSlieTAoF/yChWn6CwsWd/l3/WQRNrjMFxxNf92pHVJDM1Kt6m
 9hvrDZXwAPp7U3Hkmppc5cmflrkMgvrQGYSWifxctHh/faKjBRMUc6HcGAsr4/yTc1nL
 wYtsGDLY8POKsfMa35DVZi06eaNsXTxx9WRQ2sM7VTSqXECVM911Yvc+B5WsB33t/uyx
 xBn8cT69pvk7imUuNyp6LzYYZNGGREmvgCtUdtdzdbyQXphmYggE3DBQJZP4LvZ+Pgwi
 YChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FLQADUfBA7/k4kaBsg0trVq9yxC7LFIZBPMpP8dzO28=;
 b=dLWqCcJdQy6SY4DZt1iGJ4TFwcu/yCM7RxDPEkGHuutvalemgrWzTYYSA+1t+qUx3r
 Bcq6W6POdqG5aN27xt88ofuX3pVS6sqFOPcQ36JdC0QS/WMwrLQo1W5z4M6Jz3vru8H+
 hl//sKwQ3LcaDWc8gOeLw+UCU+0KpyW0oTDRjAwpo2QdxJ0JTZNZb6lg9YYrrwXPW0Zo
 NmUR+b4FqcQcQh0OqlGWYMaLkeFxANlFdphIsrJpDya3IlMEf4YXhgX8UKd0iqTnK8dc
 dQAoIHRJnn60kJ+lvZs+pfqkakpL4wXzb8jh/3vH14fzoio/d4NEHh9wf3wwinS+HpLe
 h2kA==
X-Gm-Message-State: AOAM530yewrCER8tkqPK+fCh6imyPuFSX9N2MHZ5L3h+96uPXOYQEp6O
 dL7Xp1k2BCVFOHuVmlVJfFrb+6AvhkA=
X-Google-Smtp-Source: ABdhPJwbmuPQQ07IHaaX/N/2ha7lcf7HUx6hOr9EPXFvzB4MnNgVg1pETd6L4TBCv3CKSDb0ysy4jw==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr303303wra.282.1611447485357;
 Sat, 23 Jan 2021 16:18:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g12sm16668104wmh.14.2021.01.23.16.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 16:18:04 -0800 (PST)
Subject: Re: [PATCH v2 7/7] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-8-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dda5766b-8af9-df30-abaf-c4c91c0d5543@amsat.org>
Date: Sun, 24 Jan 2021 01:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-8-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
> The machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
> 
> The machine is created with 128 virtio-mmio bus, and they can
> be used to use serial console, GPU, disk, NIC, HID, ...
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  default-configs/devices/m68k-softmmu.mak      |   1 +
>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>  hw/m68k/virt.c                                | 312 ++++++++++++++++++
>  MAINTAINERS                                   |   9 +
>  hw/m68k/Kconfig                               |  10 +
>  hw/m68k/meson.build                           |   1 +
>  6 files changed, 351 insertions(+)
>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>  create mode 100644 hw/m68k/virt.c
...

> diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
> new file mode 100644
> index 000000000000..81be1e092497
> --- /dev/null
> +++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> +** asm/bootinfo-virt.h -- Virtual-m68k-specific boot information definitions
> +*/
> +
> +#ifndef _UAPI_ASM_M68K_BOOTINFO_VIRT_H
> +#define _UAPI_ASM_M68K_BOOTINFO_VIRT_H
> +
> +#define BI_VIRT_QEMU_VERSION	0x8000
> +#define BI_VIRT_GF_PIC_BASE	0x8001
> +#define BI_VIRT_GF_RTC_BASE	0x8002
> +#define BI_VIRT_GF_TTY_BASE	0x8003
> +#define BI_VIRT_VIRTIO_BASE	0x8004
> +#define BI_VIRT_CTRL_BASE	0x8005
> +
> +#define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
> +
> +#endif /* _UAPI_ASM_M68K_BOOTINFO_MAC_H */

Doesn't this belong to patch #1?


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D535331A16
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:18:46 +0100 (CET)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOD7-00084L-DA
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJOBX-0007XP-6m
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:17:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJOBV-0006id-Ix
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:17:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso4722834wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 14:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h0b/cenWeeiPywT5XUDhauNY0w7yUDFyqPvzkuNNGVU=;
 b=WRJOMYxKhZam57R0RVsDQJkGU6LtVlK0QzWy+A/D5LhjfLzXeU7DjwN9ML+oVs1ohy
 V4gMcdOlkeosMhgYu3MvR+bfQoHW/Xl+UVfqiqe6o047kwnQRaLncnyWUbtklf/G7yKf
 GTb/bnh2+6uAI7qseM7RBHjlZrmvOJmaglttEPCAymf2fyVwRq63s0qXo9kosbZez0AJ
 NGZBQ6DX4r+heZZOJfjDRda7/NdJjdjWfsSN52HgkDhldIv/Ky8t+hEMt4uVeCx7Cabf
 wXN4vYwlKGTkfdF26XJfMrLGIdJ1JESQDO3bPRqxPNbex/3WIXcud1VdsUWF+no5zP5u
 I3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h0b/cenWeeiPywT5XUDhauNY0w7yUDFyqPvzkuNNGVU=;
 b=fkua7yiDzUOBXGekNjf817/wZntaYOBLYsvNuYRbJNp8Mr1oj8X1jzYuoCqRPgdg2i
 gMBQthvXs+CUUJ56FpcuzwnvyB8Av8Kox9zV3pfAPx/Y9pg5lyt24X5EmVBxIDtEhjGV
 Pc4SE1NGYSdGkann5lSMYybFUzH9qeUnO3UhV50wVRkX/sZH6vmoY1OOGytbH2wW0WrW
 /7eiU6MToL9C3+9+3f4K4Dg9v58nNz+6oGMxwBsHLKBsHVZRfF891VUYAdbddLmudjSM
 w+gkrL4Gx3COSFXG2xBJC1CAgz4J2pRc0SJN3YK0vcG9+CMirH45c9C1g06/mwubpGy5
 YfWw==
X-Gm-Message-State: AOAM533qeE2LJ9kU/rSqso8OnMKkBz9VFP4BRKLj6nfSR4VKK+U2Dy/K
 D7ARIHCAa8pccy9HhcdoUtA=
X-Google-Smtp-Source: ABdhPJwfBm9/SJo8r4kirnDliaYHQTpJ9Ib7ZcEInm4JKH90BquYvXVzISOlzbYrKfRUIeXTos0bKw==
X-Received: by 2002:a1c:2857:: with SMTP id o84mr782756wmo.181.1615241823943; 
 Mon, 08 Mar 2021 14:17:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s23sm856786wmc.29.2021.03.08.14.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 14:17:03 -0800 (PST)
Subject: Re: [PATCH v6 5/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210308212501.650740-1-laurent@vivier.eu>
 <20210308212501.650740-6-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5e7838c8-8763-d6cd-1a0f-41196bbb42c4@amsat.org>
Date: Mon, 8 Mar 2021 23:17:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308212501.650740-6-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 10:25 PM, Laurent Vivier wrote:
> The machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
> 
> The machine is created with 128 virtio-mmio bus, and they can
> be used to use serial console, GPU, disk, NIC, HID, ...
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  default-configs/devices/m68k-softmmu.mak      |   1 +
>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>  MAINTAINERS                                   |  13 +
>  hw/m68k/Kconfig                               |  10 +
>  hw/m68k/meson.build                           |   1 +
>  6 files changed, 356 insertions(+)
>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>  create mode 100644 hw/m68k/virt.c

> +config M68K_VIRT
> +    bool
> +    select M68K_IRQC
> +    select VIRT_CTRL
> +    select GOLDFISH_PIC
> +    select GOLDFISH_TTY
> +    select GOLDFISH_RTC
> +    select VIRTIO

You don't seem to use VIRTIO directly but via VIRTIO_MMIO
which already selects VIRTIO, so you could remove this
line (keeping the next one). Just nitpicking...

> +    select VIRTIO_MMIO


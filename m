Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74734AEBC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 19:49:09 +0100 (CET)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPrW8-0007Dg-Mb
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 14:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrTG-0005pD-F0; Fri, 26 Mar 2021 14:46:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrTF-0003Vp-1V; Fri, 26 Mar 2021 14:46:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so6570301wrw.10;
 Fri, 26 Mar 2021 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kuDF9j2QYgI2orYzVwMQfFkUExXm5JdUdAnU54c4cv0=;
 b=haMjWYKGPe5eCEh+ctJmn53XUdIhHahXlyDYuZiR2yNJfpOZXhZ8oRs/JTvEP8Mse7
 zaCcpbqozFH2szQEuPY3eH+UyC1XQ8ZQF/9ET4vKrYtcX0DfHZc3sWpCW8FTHO2a3Yem
 +nm2AC5JWmDbOkNqa5z7dy60f5rabewZ+BPFYPH0h51Zjd9MQaiaTvwDPEQfzrJqLUOT
 8zwxAcdhTnYQPSCPrbjtB8w30DnSVvzwjVrMbZtZ7/3OFXHczYU80Um4aD3FMjdErVmB
 GoGKchIGAezDt/tn4gRpHY/lxbzu3rhE2hrOfr2oDk7H0qsI8klhwTAhiFnrI/lQ2mT9
 qsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuDF9j2QYgI2orYzVwMQfFkUExXm5JdUdAnU54c4cv0=;
 b=C36wTtiIFiEsF8pFhcDcey4ddzouTp4rm2ifRtQ0xkkNNsdKOfCB6wg9WYB8W0MmzB
 hBUYS7upbNPTjkuZEnBnENpfMoHnQW7PtXkRwmT32TRMJorUm6xioXAAno6FOTLH7yT4
 WQmXrZWjA0o8UoE0K44SR57j3TlJqpSOy22dxrJLNk/SkqdqEnaCwJWHTiM9UzwRVLJO
 SZQ/vnZQQ2az0IfbjhadpLVDnsJesE+DflOJjNzx7Gjam+/3ES0r+16p3/yVGGbnCsW9
 ZrqfL8ZxwH5TCo1Dz2bQG8fI/WZ8MRxAe8OUnNEE5QYQqFA0+8UAoSk5tZlAcIyXW+c5
 IjGQ==
X-Gm-Message-State: AOAM533qgoH9B3dlSpzu9EphHg8GeRp6VZNL4VXz16QulKGsMVHtr0Xh
 9+moriONacZ+1u1LOiWKtFw=
X-Google-Smtp-Source: ABdhPJy/bVnYjmJ3Hm7ZNh/9dSCi7i8LxsqIyYeqqA24RISF8ITC4cejxBhTvrH3I1lmlTF6pB6/tg==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr15662680wrw.120.1616784364394; 
 Fri, 26 Mar 2021 11:46:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i4sm11054705wmq.12.2021.03.26.11.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 11:46:03 -0700 (PDT)
Subject: Re: [PATCH] hw: Remove superfluous includes of hw/hw.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210326151848.2217216-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b27cdc2d-544a-ae26-ea1a-41a9a0ac6154@amsat.org>
Date: Fri, 26 Mar 2021 19:46:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326151848.2217216-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 4:18 PM, Thomas Huth wrote:
> The include/hw/hw.h header only has a prototype for hw_error(),
> so it does not make sense to include this in files that do not
> use this function.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/musicpal.c                  | 1 -
>  hw/char/sifive_uart.c              | 1 -
>  hw/display/next-fb.c               | 1 -
>  hw/dma/sifive_pdma.c               | 1 -
>  hw/dma/xlnx_csu_dma.c              | 1 -
>  hw/hppa/lasi.c                     | 1 -
>  hw/input/lasips2.c                 | 1 -
>  hw/m68k/mcf_intc.c                 | 1 -
>  hw/m68k/next-kbd.c                 | 1 -
>  hw/m68k/q800.c                     | 1 -
>  hw/m68k/virt.c                     | 1 -
>  hw/misc/mchp_pfsoc_dmc.c           | 1 -
>  hw/misc/mchp_pfsoc_ioscb.c         | 1 -
>  hw/misc/mchp_pfsoc_sysreg.c        | 1 -
>  hw/misc/sifive_e_prci.c            | 1 -
>  hw/misc/sifive_test.c              | 1 -
>  hw/rx/rx-gdbsim.c                  | 1 -
>  hw/rx/rx62n.c                      | 1 -
>  hw/vfio/pci-quirks.c               | 1 -
>  include/hw/char/avr_usart.h        | 1 -
>  include/hw/misc/avr_power.h        | 1 -
>  include/hw/misc/stm32f4xx_exti.h   | 1 -
>  include/hw/misc/stm32f4xx_syscfg.h | 1 -
>  include/hw/pci-host/i440fx.h       | 1 -
>  include/hw/timer/avr_timer16.h     | 1 -
>  25 files changed, 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


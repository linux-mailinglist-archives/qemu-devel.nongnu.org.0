Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2E32DD78
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:58:50 +0100 (CET)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwvh-0000zy-Mx
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwsx-0006gp-68
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:55:59 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwsv-0007mx-Hc
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:55:58 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m1so46760wml.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yfmz6cV6+qShcYsCdg4lyNBIvsuJE8v6qPZG0oM1Tdg=;
 b=FkQW3jd123GtCjHpuUCr59adYvDcjYixfn4dCOFJpe9OAqJUveHfHKcQwF55p5kJ+k
 dI3pPb2RzHNf7kCAyhG0BpMdWdLMAFlDSFg/kqWlFve7O1oqRazRMOoaLMKV+ORQl+7E
 bn+sLC0x84dsa/fq28frVeCe3/vMi9Hlmu0Oh2d8Oa+bAci90b+vmHOwMQ1Y431PaE91
 NvmrGsCjMF7r2rHYCptn7DtkkrUvaKiIjL182pToQJzBw4Hctz0JmmtkKBx1LLDZ7cmt
 SmRwx4bQYaqE/ixfJ+3N5SChPJwT1/ZPSMwbX73VFwFko5wq5jM/Oj39puQ0ywoplyMC
 V84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfmz6cV6+qShcYsCdg4lyNBIvsuJE8v6qPZG0oM1Tdg=;
 b=lz73F/kW23vL4SiNJnvWcT7x7Av+UUH6C+0Ir7EaH5y0BpKJjutGz1PDWQ1GxIGZtm
 EAOkbZuAKXUAKv85tp6Jc+7HzfNqRQjPTRkJrYlrarYBg3Jz13+TYwyiyl6Bg4r9bkg9
 hNSB8Yurg7j0BCQCFKWdxYmRAIyyMxhj8q34p9cQ6WrpeVUKwBrLDE8RFUab1EiM8QzV
 96N6HclrWicqunF9pevSXiyb29c9820AiSp1cnndZ7Suragfcez2+3+93Dkt1Q+ZzAFa
 KzMbBXeIsV9ewP5BM8hEGoQp4MAvIKIIHHw22aSWvF7FuTwcr+680J2f09oK1VT+gfht
 RMdw==
X-Gm-Message-State: AOAM532r/tk0gr8vP6Qv6qPUB92s05HIHvgADxprdzvhhEb0wNqVRdty
 +X9UvFohO6XwgWZM2IW5gTg=
X-Google-Smtp-Source: ABdhPJyoXIlLC7doLoW00bhwxxYRNgBIjDASbxr/mVchrWE3bw98+gkzoSCtkOO2xqkCbMDVFrP3Kg==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr6009366wmd.130.1614898556148; 
 Thu, 04 Mar 2021 14:55:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d7sm1114222wrs.42.2021.03.04.14.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:55:55 -0800 (PST)
Subject: Re: [PATCH v3 1/5] char: add goldfish-tty
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210304220104.2574112-1-laurent@vivier.eu>
 <20210304220104.2574112-2-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <706df599-58d0-b868-2de7-22ea4cfd71a2@amsat.org>
Date: Thu, 4 Mar 2021 23:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304220104.2574112-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 11:01 PM, Laurent Vivier wrote:
> Implement the goldfish tty device as defined in
> 
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
> 
> and based on the kernel driver code:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/char/goldfish_tty.h |  36 +++++
>  hw/char/goldfish_tty.c         | 266 +++++++++++++++++++++++++++++++++
>  hw/char/Kconfig                |   3 +
>  hw/char/meson.build            |   2 +
>  hw/char/trace-events           |   9 ++
>  5 files changed, 316 insertions(+)
>  create mode 100644 include/hw/char/goldfish_tty.h
>  create mode 100644 hw/char/goldfish_tty.c
> 
> diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
> new file mode 100644
> index 000000000000..84d78f8cff54
> --- /dev/null
> +++ b/include/hw/char/goldfish_tty.h
> @@ -0,0 +1,36 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * Goldfish TTY
> + *
> + * (c) 2020 Laurent Vivier <laurent@vivier.eu>
> + *
> + */
> +
> +#ifndef HW_CHAR_GOLDFISH_TTY_H
> +#define HW_CHAR_GOLDFISH_TTY_H
> +
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_GOLDFISH_TTY "goldfish_tty"
> +OBJECT_DECLARE_SIMPLE_TYPE(GoldfishTTYState, GOLDFISH_TTY)
> +
> +#define GOLFISH_TTY_BUFFER_SIZE 128
> +
> +struct GoldfishTTYState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +    CharBackend chr;
> +
> +    uint32_t data_len;
> +    uint64_t data_ptr;
> +    bool int_enabled;
> +
> +    uint32_t data_in_count;
> +    uint8_t data_in[GOLFISH_TTY_BUFFER_SIZE];
> +    uint8_t data_out[GOLFISH_TTY_BUFFER_SIZE];

Could we use Fifo8 instead?

> +};


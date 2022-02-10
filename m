Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E74B0BD8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:08:49 +0100 (CET)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7Jg-0003JA-A2
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:08:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7GW-0000IT-Hc
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:05:34 -0500
Received: from [2607:f8b0:4864:20::1034] (port=46826
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7GT-000373-8R
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:05:31 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso5168367pjh.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JCLBizvrUaJwIj1npFTzbgzAY+Aq5b1Gyb+tj7xqEpw=;
 b=AgGTxSnbtVIj5pEs7b0rIMLwj3tMJ9ET2qrXLXn93+JBzujUUkGqPNbtOBh3Fy39wg
 UXXpsdecOFCO97hXB2RhhWKzU9EjQcWIR+ar3JoAVKuPPF3jXBglJVJZrjD+vqfbMUfu
 XjWzCZ0LuUufVLOpfxDis40ymuQLtlXeB4t6B/Gh+QH4oKhT+9J6VrQ0Bx5bhZSCQIjn
 ijRanxfuw6ZwOFOWpqvLxWU/tC9OLoQFy10dnVwUeUvZHZgUofoAqpjvHVUG8xlGcO9Z
 Sr0xybZI0jRbZRN8R0fHN4HZ0cQcn3v2kQpI7b4HLdx10m9KmA/aHVFdxlMB+Vxb859U
 8F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JCLBizvrUaJwIj1npFTzbgzAY+Aq5b1Gyb+tj7xqEpw=;
 b=m3eM+pPU/ACn78GT++ZSJdkUt5fvS8VHcWGyYVpHPCgTPzcFR+pW0BILjqbrQkQgqC
 uvUBmLLqeIvkRb1CzamiV7/CC8f78wvG1dQz1zxKv+97qTceu/iXAyNoWwmMpthi5wYW
 9zjsUmR9M6p1aXJDWN0+hKh0KmCAt8IySX82rl4Vo6MvE3iEpzEBHMsI52l27wvyaUOT
 tSHJWEwclc9kpU9vwKaKDNuxqUDf6zi76ggV90mg8lm6jMLc2h2O8yTiAu70U/YTsmZU
 3sLL58gzqZpBkvV9UWNxQAvL+9QuObItPoHYN2BhXFRJv3pWac6SyeK+Wnf6V0GAF9gj
 uLpw==
X-Gm-Message-State: AOAM533lU+2+gs+EVbhGEJ0uliWAxdGIUcA1Nhl2A0OYk/6EZCmq+NIL
 0I9AKXCy2KIqK/Wwp/U8rBNgZYZS1q0=
X-Google-Smtp-Source: ABdhPJzeoEHsBKfn46WXTSM9OW3UiGBjIWITE2g0d3q8TmNJsq1AHkOIuEf7QMP+rJFYL4lApWm0Xg==
X-Received: by 2002:a17:90b:507:: with SMTP id r7mr2234010pjz.78.1644491126229; 
 Thu, 10 Feb 2022 03:05:26 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l4sm23529485pfu.90.2022.02.10.03.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:05:25 -0800 (PST)
Message-ID: <e0ea2b85-1ba3-c9d2-3afb-a3eb3ed4aea3@amsat.org>
Date: Thu, 10 Feb 2022 12:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/4] hw/openrisc/openrisc_sim: Create machine state for
 or1ksim
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Jia Liu <proljc@gmail.com>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-2-shorne@gmail.com>
In-Reply-To: <20220210063009.1048751-2-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 10/2/22 07:30, Stafford Horne wrote:
> This will allow us to attach machine state attributes like
> the device tree fdt.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   hw/openrisc/openrisc_sim.c | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)

> @@ -141,6 +153,7 @@ static void openrisc_sim_init(MachineState *machine)
>       ram_addr_t ram_size = machine->ram_size;
>       const char *kernel_filename = machine->kernel_filename;
>       OpenRISCCPU *cpus[2] = {};
> +    Or1ksimState *s = OR1KSIM_MACHINE(machine);

This change belong to patch #3.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>       MemoryRegion *ram;
>       qemu_irq serial_irq;
>       int n;
> @@ -183,8 +196,10 @@ static void openrisc_sim_init(MachineState *machine)
>       openrisc_load_kernel(ram_size, kernel_filename);
>   }


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93F63DCE7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0RcT-0004fK-S0; Wed, 30 Nov 2022 13:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0RcL-0004dB-6r
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 13:15:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0RcI-0001DD-SG
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 13:15:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso2048559wmo.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 10:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n+w9xat4dBHGB5/WI1ZFcdaTMZn738XokPqqirFMpYU=;
 b=bs65Mu4MXqh2HCmt5kiqFEjRpzyBleG7T/CaphkYIhAMZzCzTmaQibtBGdkbV25ZFa
 3Ar8mxYFWZ9FMlCkSnDx0xnqyXqaD5cVaxueUL+fn7UXVbJZSxCQ9RE8xP88kWNz9ryW
 j+sQb6DNy6IafkjBlS3qRKNR/9FsTByRqM6Gmt9l4wSPObiE8KUWhOhTyctScbyL+/h0
 Ne4AKAmGz9n3WT8NNu9FcmfSrpI4pPZJVGfC2T4T4amt1tugdtiTDDMM9Wi1aSDbSlhx
 UdqsfL40BTzO3d+qdjZti4fMcmlmWZmr3shKU5gURmRmK9W2uWIzdrDGEdKLxv81LnsN
 ytbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+w9xat4dBHGB5/WI1ZFcdaTMZn738XokPqqirFMpYU=;
 b=53woBT+OiuBqWl7X7gB2qzCGM/iDFvBFKZ6yS+8MALR1mAoBAWef4pNvYIt3aInJj8
 JLDHroNoSSOHHrEleQH1+Xg9k00H2q2xEPkSphyshgufhGLko5FNuzA0h9eMc+DM3g6q
 ckQ9IgUWIReYes1ZYk3VLKwhfjLGd5Gs2lPvXxP9LpJmlAoplorrrjhwA7oZWbccHrXD
 /syUR62LrbE527d2pxtQNkItVqAFZhvZFsRlsaz8P4abjREG3OQxEmjoQwM5jLgHre1u
 YyxuOF9QJ5g6wPN8ohuvlFxbj5GODq2jGWub96nL0AT2lymhXYOoQT0hk13G3N1WlEA1
 KnNA==
X-Gm-Message-State: ANoB5pkMGd7sJosr0YVDpd8Ug/tycsomuzD7e8pS4NOj1AOKK8XF0TLS
 DIxwwIGkyEonEDQnTYs/npIjTg==
X-Google-Smtp-Source: AA0mqf5YPu+KBq6/xZs/iSU9ZIb2dzufSzJZpWEV0IcBgEDgqg70rpF1XSLXm+9RQcKL2bU6PVSaEw==
X-Received: by 2002:a05:600c:3ac9:b0:3cf:cfc8:9450 with SMTP id
 d9-20020a05600c3ac900b003cfcfc89450mr32482220wms.99.1669832128912; 
 Wed, 30 Nov 2022 10:15:28 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a05600c4b9900b003cf4ec90938sm2510292wmp.21.2022.11.30.10.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 10:15:28 -0800 (PST)
Message-ID: <5af1cbc2-5897-5e69-a727-6f423c5c08a5@linaro.org>
Date: Wed, 30 Nov 2022 19:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH qemu.git 1/1] hw/arm/virt: make second UART available
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, daniel.thompson@linaro.org
References: <166982763526.10484.9925072056712598801-1@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166982763526.10484.9925072056712598801-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Axel,

On 14/11/22 13:06, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> The first UART always always exists. If the security extensions are
> enabled, the second UART also always exists. Otherwise, it only exists
> if a backend is configured explicitly via '-serial <backend>', where
> 'null' creates a dummy backend. This allows enabling the second UART
> explicitly on demand and does not interfere with any existing setup
> that just expect one (or two if security extensions are enabled)
> UARTs.
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/arm/virt-acpi-build.c | 12 ++++-----
>   hw/arm/virt.c            | 55 ++++++++++++++++++++++++++++++----------
>   include/hw/arm/virt.h    |  4 +--
>   3 files changed, 49 insertions(+), 22 deletions(-)


> @@ -843,6 +843,27 @@ static void create_uart(const VirtMachineState *vms, int uart,
>                           MemoryRegion *mem, Chardev *chr)
>   {
>       char *nodename;
> +    /*
> +     * The first UART always always exists. If the security extensions are
> +     * enabled, the second UART also always exists. Otherwise, it only exists
> +     * if a backend is configured explicitly via '-serial <backend>', where
> +     * 'null' creates a dummy backend. This allows enabling the second UART
> +     * explicitly on demand and does not interfere with any existing setup that
> +     * just expect one (or two if security extensions are enabled) UARTs.
> +     */
> +    switch(uart) {
> +    case VIRT_UART0:
> +        break;
> +    case VIRT_UART1:

Maybe pass a 'is_secure' boolean?

> +        if (!vms->secure && !chr) {
> +            return;
> +        }
> +        break;
> +    default:
> +        error_report("unsupported UART ID %d", uart);
> +        exit(1);
> +    }


> @@ -2222,11 +2248,12 @@ static void machvirt_init(MachineState *machine)
>   
>       fdt_add_pmu_nodes(vms);
>   
> -    create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
> +    create_uart(vms, VIRT_UART0, sysmem, serial_hd(0));
> +    create_uart(vms, VIRT_UART1, vms->secure ? secure_sysmem : sysmem,
> +                serial_hd(1));
>   
>       if (vms->secure) {
>           create_secure_ram(vms, secure_sysmem, secure_tag_sysmem);
> -        create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));

Correct.

>       }
>   
>       if (tag_sysmem) {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 6ec479ca2b..90563c132b 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -69,7 +69,7 @@ enum {
>       VIRT_GIC_ITS,
>       VIRT_GIC_REDIST,
>       VIRT_SMMU,
> -    VIRT_UART,
> +    VIRT_UART0,
>       VIRT_MMIO,
>       VIRT_RTC,
>       VIRT_FW_CFG,
> @@ -79,7 +79,7 @@ enum {
>       VIRT_PCIE_ECAM,
>       VIRT_PLATFORM_BUS,
>       VIRT_GPIO,
> -    VIRT_SECURE_UART,
> +    VIRT_UART1, /* secure UART if vms->secure */
(I'm not sure changing the name is worth the churn).

Regards,

Phil.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD1691F3C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSk6-0005Ah-51; Fri, 10 Feb 2023 07:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSjl-00059U-1R
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:42:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSji-0004fM-TK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:42:44 -0500
Received: by mail-wm1-x333.google.com with SMTP id z13so3742720wmp.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DLKoEOi53ntCRmLckzHQeCiGjeaKRVkSvth34J8SILg=;
 b=NErTfGpYQ69Dp9kJYwD7sxLhh3/8q1y8dpSE63YDS13qLj5bM01asnroWhs7v+3lC+
 dGoapjndgNjOQda13V0Hxlp+zLxgedZiedoXJRX7q9suxyfbpBpaswPOWXDG371V/+Q6
 4oX60YIZLbZOUqrZDGf7QxeoNKf5YwrRGhLg3FAgexc35WP8GkLtXUJooYchBvxAgkg8
 QhWp9t7Uo9j03xuZMZymi3ZWuosohm9F7z6uVkvYVgqVkMjY0YpiBT0NHTBqpymICC3V
 wIpR/PscIq4oU/MBJdalf3820R5L7WViD5PzW4ubccN8f8Ap68W1x14/T0A9MZXJtsSM
 kmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DLKoEOi53ntCRmLckzHQeCiGjeaKRVkSvth34J8SILg=;
 b=MOuRquFJ9BPwWygxNeT0HYVKEsmqib4Sz5a1Jrmwcww3FehSRgm98J8J81LU6xnh/m
 C7HBOOx4vbLUcFaiCsmheuYTz7IYya3EqGk8EOBL8XpfZQ9lnvUJddjBBw/oWKnsO8eg
 FvzlGsdZXXpv2oUqzO7e1z2/pwjPR5OGay9IvMuP5lLiDkMObQikwHQpe+tBRf4oFk1O
 0jmDey32sWoVLd0L+AG2+eO81naLAHU1skfGxbOsxHeTPj5fqnBlz8wkVg6J9ohv0w1g
 gYHSIGJUGrd7ACVbu1SesoTbD9NGGa6z6fRpz6SzRjO+DIZaewxAdClv7bkbhyLBb04a
 XOqQ==
X-Gm-Message-State: AO0yUKXV+hNEH8M0ifi05N+pWWpJMFY4/7VPJd+Lwn2Ez+H0jAbtm5iN
 UWg+MJZQOiCRAn2agn0eo4fmww==
X-Google-Smtp-Source: AK7set+G4ff/Yrqwcl/QBBPki/GxA9JNYr3vh5bthr4RewfC/A6ZKvaaeMlVQIzoVcP90rE8b8R+MQ==
X-Received: by 2002:a05:600c:755:b0:3e0:6c4:6a3a with SMTP id
 j21-20020a05600c075500b003e006c46a3amr12832466wmn.22.1676032956589; 
 Fri, 10 Feb 2023 04:42:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1cf617000000b003db1d9553e7sm7951843wmc.32.2023.02.10.04.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:42:36 -0800 (PST)
Message-ID: <59c5bb4a-ece3-0e70-ea22-ae9408809d04@linaro.org>
Date: Fri, 10 Feb 2023 13:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] include/hw: Do not include "hw/registerfields.h" in
 headers that don't need it
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org, qemu-riscv@nongnu.org
References: <20230210112315.1116966-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210112315.1116966-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 10/2/23 12:23, Thomas Huth wrote:
> Include "hw/registerfields.h" in the .c files instead (if needed).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/arm/smmuv3.h        | 1 -
>   include/hw/char/ibex_uart.h    | 1 -
>   include/hw/ssi/ibex_spi_host.h | 1 -
>   hw/char/ibex_uart.c            | 1 +
>   hw/ssi/ibex_spi_host.c         | 1 +
>   5 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index f1921fdf9e..b6dd087526 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -20,7 +20,6 @@
>   #define HW_ARM_SMMUV3_H
>   
>   #include "hw/arm/smmu-common.h"
> -#include "hw/registerfields.h"

Never required.

>   #define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
> diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
> index a39985516a..9deadf223b 100644
> --- a/include/hw/char/ibex_uart.h
> +++ b/include/hw/char/ibex_uart.h
> @@ -26,7 +26,6 @@
>   #define HW_IBEX_UART_H
>   
>   #include "hw/sysbus.h"
> -#include "hw/registerfields.h"

Missed in bdc36ce649 ("hw/char/ibex_uart: Make the register layout 
private").

>   #include "chardev/char-fe.h"
>   #include "qemu/timer.h"
>   #include "qom/object.h"
> diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
> index 1f6d077766..8089cc1c31 100644
> --- a/include/hw/ssi/ibex_spi_host.h
> +++ b/include/hw/ssi/ibex_spi_host.h
> @@ -32,7 +32,6 @@
>   #include "hw/ssi/ssi.h"
>   #include "qemu/fifo8.h"
>   #include "qom/object.h"
> -#include "hw/registerfields.h"

Never required.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



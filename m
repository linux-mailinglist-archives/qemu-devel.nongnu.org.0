Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8D51EA6B
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 00:09:48 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnScV-0008L4-0Y
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 18:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnSbX-0007gm-8h
 for qemu-devel@nongnu.org; Sat, 07 May 2022 18:08:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnSbV-00014Y-JJ
 for qemu-devel@nongnu.org; Sat, 07 May 2022 18:08:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d22so10600622plr.9
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 15:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nc15w3+s7otaaxS6tdN6geMLP89x/U5eXIQlMmvjjbs=;
 b=lsM9V2APHHccyn9S7OsTegpfN88uf6KvyGanhWJ1estSvDl8VYMYqZODVZCVliCn/W
 Qc58J1b7t7MHQBnLn/AVgm36j9ZVXWZrWSt7shYLojpfSghNlbK+N8FaJ7o5yfkfC5qw
 xG+l7pC4F/J/AllRaFlCOSFmew3h9xwhqmRjeD4qfHlY0guPr6bQ+ZaHnQCMulT3dxa9
 GRKZw8Jog4DVAeBgwUQMohFyrFTo8L3bfBVPNSYFBnJru/lpvn7jkQGKXzjW2/MmJ/dd
 iF/A463A+4QnO0A9VLaH1dnX/6JcQkqrws8BS67ZzmTwcMYB951f4Tn8w6vT9dzDzam4
 8+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nc15w3+s7otaaxS6tdN6geMLP89x/U5eXIQlMmvjjbs=;
 b=f4yorLG1rf/C2w4TeUaXzm27WK/FLX5lXziY+ZrlUfsIWAApPNssBbMnrvXjv1gsJy
 /6CZ/77rzubqblOF+6uFvnW7QlS0rSZwgXUMIpBieax3UYnToY5Yoj8qJKIICMJQR8Wf
 ywh8vgj0P0u6YLV8NJAAwx9Eq1v7tX6LK9VDd8rlO1mE0dZMbZtZo5g+So9LCvoP3Fz+
 yBozLRkKHFDC51NQKKIsVOd33RTSmokYQNK+kZpP5zJnLkHEUynHh48wfZgXeRN+MZWk
 +ScibsO4QQEQo5ABCaW/71Q6Ac/jrMJClR2bprd55OEgSM+ET7Rx6zDeV0hsgLIOisWe
 3+LQ==
X-Gm-Message-State: AOAM531JkteeYdDrLTCTsri42lgASpADsepWPA3xoMQbtM9kJP2iLiDO
 dCqfikqqliv8vxshe5E8piqPlw==
X-Google-Smtp-Source: ABdhPJwLn3dvHOmIBULLgg2BNvS8kutHzTj9oqZwtJMIc5YnkZQN/TSXtBaGpEKmBdLUJ6FZNK3v5g==
X-Received: by 2002:a17:903:2287:b0:15e:99b4:9b0a with SMTP id
 b7-20020a170903228700b0015e99b49b0amr9675380plh.43.1651961323677; 
 Sat, 07 May 2022 15:08:43 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 g4-20020a170902d5c400b0015e8d4eb23fsm4085343plh.137.2022.05.07.15.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 15:08:42 -0700 (PDT)
Message-ID: <969b8628-53c5-4d40-26db-d85ab016c793@linaro.org>
Date: Sat, 7 May 2022 17:08:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 39/43] hw/loongarch: Add LoongArch load elf function.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-40-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429100729.1572481-40-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/29/22 05:07, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/loongson3.c    | 66 +++++++++++++++++++++++++++++++++++--
>   include/hw/loongarch/virt.h |  9 +++++
>   target/loongarch/cpu.h      |  2 ++
>   3 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index 7029d8c8b8..f9ee024f63 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -19,6 +19,8 @@
>   #include "exec/address-spaces.h"
>   #include "hw/irq.h"
>   #include "net/net.h"
> +#include "hw/loader.h"
> +#include "elf.h"
>   #include "hw/intc/loongarch_ipi.h"
>   #include "hw/intc/loongarch_extioi.h"
>   #include "hw/intc/loongarch_pch_pic.h"
> @@ -29,6 +31,36 @@
>   
>   #include "target/loongarch/cpu.h"
>   
> +static struct _loaderparams {
> +    unsigned long ram_size;
> +    const char *kernel_filename;
> +} loaderparams;

Never use "unsigned long", only "uint{32,64}_t" or "size_t".
Otherwise you don't know what the host is going to give you.

> +static int64_t load_kernel_info(void)
> +{
> +    int64_t kernel_entry, kernel_low, kernel_high;

Why are you using signed values here,

> +    long kernel_size;
> +
> +    kernel_size = load_elf(loaderparams.kernel_filename, NULL,
> +                           cpu_loongarch_virt_to_phys, NULL,
> +                           (uint64_t *)&kernel_entry, (uint64_t *)&kernel_low,
> +                           (uint64_t *)&kernel_high, NULL, 0,

and casting them?  Oh, and kernel_size must be ssize_t.

> @@ -237,22 +283,38 @@ static void loongarch_init(MachineState *machine)
>           cpu_create(machine->cpu_type);
>       }
>   
> +    if (ram_size < 1 * GiB) {
> +        error_report("ram_size must be greater than 1G.");
> +        exit(1);
> +    }

Why is this here?  It's certainly not related to load_elf.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD4C657E5F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 16:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAYiU-0006BT-Lg; Wed, 28 Dec 2022 10:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYiS-0006Ah-EQ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 10:51:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYiQ-0005A2-S7
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 10:51:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so9165191wms.0
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 07:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s7aOBbE58dlk+jsjbs0QXUUKnxy70Yq+eJM5YzoaWA4=;
 b=kCNwketJK+QBMGQOscvKFTrzwAqK3N4WWv/a+SWjBxx7E27EHG67z6fI5IXrCbgwy+
 W0gGNRk8eX0EJ652FfVq2oLrm3sM4YHDcGizTGipca065vvvlJRcsWqgnDahNAvgpybP
 bJrolzLXgDfGW3qoUgaKFFTzmXmeZTULBY041LUg+rDA4/svVVUqYu+yuRrB8tc5qQ5L
 mBafW2vv+V7BecZ6uCA7RWDNyN5cbbdSeNiGrwqWwBW/4cstD63lsN13Gatq43POqQxL
 QaNCmPwLSBUQyj74J0HhZxtYXp4dhJOB0LVQnBaZZIqAE/s4aUAl3uhKW4uoMnjk6TVK
 CmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s7aOBbE58dlk+jsjbs0QXUUKnxy70Yq+eJM5YzoaWA4=;
 b=Nn2tZEDpUl07mMFXeUReGAnYfLtVin0sBxrVV3MLPESjZVKrFREZzpJMpu1adY+HFU
 uZevbQ2zHXrQFtOhpc2zjs5N3w6sGx1GI4RDS0juKDmFmQ1eQGNfsflAaMVRxCvTz4va
 fs7EtfNKUbsnqLC+db4JzHvIb8dfgxi2HWl77ZMzwugpPpfB8uT7GMwWasV+jfIG0QPk
 6fqzsQZOUrVUrp8nwZlDBdO5kwDj0t6DJhOepuEn228bcPe+i+1J4XmYcnxI3f04Z9WX
 X0RonzmGrg/6jmH1dDwpoEbPV5gwLQIpA77gQxSwSESnIFm3C2Y0e6dAPKsBCi1rngMd
 2AOQ==
X-Gm-Message-State: AFqh2kpYveTUtceM1YZ6EJjWUL6AvV33UBP+xI81uzAOCMcb7UTGLlzO
 97uWdnRg2Wgb0iWCqmBJO/MFKQ==
X-Google-Smtp-Source: AMrXdXvRY1/vdrqzEzaLCzVdQHQGf/SnOldtdWFkM8QiI6zU9Kxt0HcKFACNLiXyJLG0bXlDMWqfaQ==
X-Received: by 2002:a05:600c:224b:b0:3cf:ae53:b1e0 with SMTP id
 a11-20020a05600c224b00b003cfae53b1e0mr18187218wmm.9.1672242697213; 
 Wed, 28 Dec 2022 07:51:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bd25-20020a05600c1f1900b003cfd4cf0761sm26322051wmb.1.2022.12.28.07.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 07:51:36 -0800 (PST)
Message-ID: <bebabfa6-483c-a604-fe8d-9d0585f505db@linaro.org>
Date: Wed, 28 Dec 2022 16:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 07/10] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-8-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228133336.197467-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 28/12/22 14:33, Daniel Henrique Barboza wrote:
> 'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
> retrieved by the MachineState object for all callers.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>   hw/riscv/boot.c            | 6 ++++--
>   hw/riscv/microchip_pfsoc.c | 3 +--
>   hw/riscv/sifive_u.c        | 3 +--
>   hw/riscv/spike.c           | 3 +--
>   hw/riscv/virt.c            | 3 +--
>   include/hw/riscv/boot.h    | 3 +--
>   6 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index d3c71b3f0b..f7e806143a 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -204,9 +204,11 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>       exit(1);
>   }
>   
> -void riscv_load_initrd(const char *filename, uint64_t mem_size,
> -                       uint64_t kernel_entry, void *fdt)
> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>   {
> +    const char *filename = machine->initrd_filename;

Do we want to check for missing -initrd here? Or simply return quietly
if not provided?

> +    uint64_t mem_size = machine->ram_size;
> +    void *fdt = machine->fdt;
>       hwaddr start, end;
>       ssize_t size;


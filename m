Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E706542E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8MVk-0007l0-MD; Thu, 22 Dec 2022 09:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MVb-0007kU-Al
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:25:20 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MVY-000688-CC
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:25:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so4139826wml.0
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 06:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IenfgQXRReZpGHZHQHXrcB/uJH9iXh0IVb93SrI1Wd0=;
 b=b+AkD9YXtdmkHgfVSs14IvD3QUdRhrPb+qLyJ1aYmUFBGlelqIl1SIwfDn1C8fM6hH
 BTF3bdhbf0wTRIcFJCmpSLpAUr8uLdjugbPIzX4biLiJmtvdLYAVUvIIAE9NC9vnDJQX
 35zvTXj/KzCCiUXo5iM+v8LCY9h+kgMjYnwSowPoZ4cHbUJv1bvXAyMcgfl+mwM/1nyQ
 gb2z1Ltyfh40s5YfBO/8an4JArJgQzwM8B6KwGt+3Z0wmfC1gGBUbCOJi+ZyjD2AaCSM
 bMn2W2J7Np4tE70UEHhP+Ec1a0eCigcwpZMIXrB9uzw7KkbgInWREdO598X33d0/w7H6
 Qp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IenfgQXRReZpGHZHQHXrcB/uJH9iXh0IVb93SrI1Wd0=;
 b=CD7+IcF9IWzEz7uxoZhsr5Klv48CuPyiuwavhdtKnXpt+JatG7R/dyXvU6tpXBMnGT
 gSFS4+9JiPNpeqW30bpQlZ6VjmP6Gl61WdcfT3MOrQ3JuBRzvX918LgUrQalGxSJwPn8
 HNe2+J//u9rNIrZobi4SxV0QxAwkSnxn/k+rQOXCDw54BmSxUIpwZbK9/UhZDazhOAeN
 g1PMCE6QfbY/IwY2zEmPQjT2L2RUv8cxr96EPXkY1hk83ilb7I1YudfGvWsCSOWg0RQW
 nx0r7Mm5nF7xwiS2G9U3NtHJj6/vTjvxLacqoa15FnvRTYct9kTjXHwf1WwOfZhOy31Y
 OIeA==
X-Gm-Message-State: AFqh2kpRWpuyPFbXGvEVrkVmC+OxBofTP8RpkU0rqjofo3TaVrdrg4pT
 tUKEoRXlCcCzZHC8cycbRXC3iA==
X-Google-Smtp-Source: AMrXdXsltapmm4b+gfmgMdE3Z1mllA3WRrvRLRzDxVkVnFB1kuQOB4EU0oaoUkJxB/SM7qilUuMucA==
X-Received: by 2002:a05:600c:3209:b0:3cf:5fd2:87a0 with SMTP id
 r9-20020a05600c320900b003cf5fd287a0mr4572859wmp.40.1671719114263; 
 Thu, 22 Dec 2022 06:25:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003d351a9db76sm6612866wmq.30.2022.12.22.06.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:25:13 -0800 (PST)
Message-ID: <35c460e1-8e4d-eb1a-c25c-71f1a6d7d094@linaro.org>
Date: Thu, 22 Dec 2022 15:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 02/15] hw/riscv/spike: use 'fdt' from MachineState
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> The MachineState object provides a 'fdt' pointer that is already being
> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
> command.
> 
> Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
> instead.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/spike.c         | 12 +++++-------
>   include/hw/riscv/spike.h |  2 --
>   2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 13946acf0d..d96f013e2e 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -52,6 +52,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>                          uint64_t mem_size, const char *cmdline, bool is_32_bit)
>   {
>       void *fdt;
> +    int fdt_size;
>       uint64_t addr, size;
>       unsigned long clint_addr;
>       int cpu, socket;
> @@ -64,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>           "sifive,clint0", "riscv,clint0"
>       };
>   
> -    fdt = s->fdt = create_device_tree(&s->fdt_size);
> +    fdt = mc->fdt = create_device_tree(&fdt_size);

We use 'ms' for MachineState and 'mc' for MachineClass. I first got
scared while looking at that patch that a class field was used. The
variable is simply badly named. Possible future cleanup: s/mc/ms/.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



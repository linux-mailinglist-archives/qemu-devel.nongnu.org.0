Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F366BA3B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:26:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLke-0005Lv-2V; Mon, 16 Jan 2023 04:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLk7-0005Jj-JH
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:25:27 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLk3-0004QK-ST
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:25:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d2so6700423wrp.8
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d+EPBrH5xWH0oOLlkRWeAJXGBeq6L8Ejk8ixZ1YFNUw=;
 b=l5/BbfITpEAZWb2UhyPcbI+EF0c/MKWgk/EfCJ4MPPpTP0QbKJ/+xJqVWfyTkcWdTv
 tbzjlYn+AD9XKVGrlc0tq4cv/coCRC5Ljy9g3mgxVDMIUi7AjEN1w4URpoErj2TsIAc4
 2bcqUQPJhMUEQ8S669sluMrgwfNwo9YCcpRqsPzZ02+Yp7L9igB4gWJYAqM+1Bvi5gg7
 04CJXJT46wLV/DFTfp9oOIzCdIKpSpX77XYw1y2/IL6+buDShEqWi29Drqo/ccYeHB/m
 etK/w6Oj/vuyx+UIGS+fcZpYG6rMeLtDcZHq5XpGWO2e3AqgWoVeY9jW9QSjRR+jUU2o
 SL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+EPBrH5xWH0oOLlkRWeAJXGBeq6L8Ejk8ixZ1YFNUw=;
 b=MB3utHFOa0nCgqwgNGtR86GeokgZIkEvetxn7s7s1kozEQw0IoK8Vd+DInKPzdOFCs
 rKfLmLP3qs3VLuBNc9QrYm8glxkplIoUStju4qPrRhFdDbvctD90aR0H3Lfnslb8YGAc
 Et4ajzBKOqB8N9Yd2Kae8uYjh8nIrRA0Ht6ZHhDvhkAVstRqn3IHuq4ZTpdFOTVmu5a4
 waNzbrK1r2C4kJqTAPhobmxy2mcydWd4z+o3TI6xiqOHMEdJiukFJAH+penJxgMDlj9u
 lU8z9eOxUInidnnKUCjPARTRR65wSdxG3srVhXxUIqgJUYh6VULbfbKxlHdM2YLeW0UH
 aQYQ==
X-Gm-Message-State: AFqh2ko1GQfFyLL6V6v3UPLxuwH2KObjlL1uL7b2eaYxZjmcUNElud4Q
 4cc7C/vMbyNW4crm6l6OqURE6g==
X-Google-Smtp-Source: AMrXdXuCD6/+h8KXmm8LzbhquqrI3A4wHP68i/q6rfEv3K5NYt6TMUP3KJsO7pVywIYc/Z9mryK0fA==
X-Received: by 2002:a5d:6c69:0:b0:2bd:f651:3a67 with SMTP id
 r9-20020a5d6c69000000b002bdf6513a67mr6987843wrz.64.1673861121480; 
 Mon, 16 Jan 2023 01:25:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b002bdfb97e029sm3637932wrq.19.2023.01.16.01.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:25:21 -0800 (PST)
Message-ID: <1ff4c868-f39f-21e0-2030-a78163143233@linaro.org>
Date: Mon, 16 Jan 2023 10:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-4-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113171805.470252-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/1/23 18:18, Daniel Henrique Barboza wrote:
> Recent hw/risc/boot.c changes caused a regression in an use case with
> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> stopped working. The reason seems to be that Xvisor is using 64 bit to
> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> sign-extending the result with '1's [1].
> 
> This can very well be an issue with Xvisor, but since it's not hard to
> amend it in our side we're going for it. Use a translate_fn() callback
> to be called by load_elf_ram_sym() and clear the higher bits of the
> result if we're running a 32 bit CPU.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 23 ++++++++++++++++++++++-
>   hw/riscv/microchip_pfsoc.c |  4 ++--
>   hw/riscv/opentitan.c       |  3 ++-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        |  4 ++--
>   hw/riscv/spike.c           |  2 +-
>   hw/riscv/virt.c            |  4 ++--
>   include/hw/riscv/boot.h    |  1 +
>   8 files changed, 34 insertions(+), 10 deletions(-)

> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> +{
> +    RISCVHartArrayState *harts = opaque;
> +
> +    /*
> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> +     * it can be padded with '1's) if the hypervisor, for some
> +     * reason, is using 64 bit addresses with 32 bit guests.
> +     *
> +     * Clear the higher bits to avoid the padding if we're
> +     * running a 32 bit CPU.
> +     */
> +    if (riscv_is_32bit(harts)) {
> +        return addr & 0x0fffffff;

Instead of this magic mask, can we add some architectural definition
in target/riscv/cpu_bits.h and use it as:

            return extract64(addr, 0, xxx_ADDR_BITS);

to make the code self-descriptive?

Otherwise LGTM, thanks!

> +    }
> +
> +    return addr;
> +}




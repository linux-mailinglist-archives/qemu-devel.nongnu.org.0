Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524B68C117
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3AK-0003Hx-W8; Mon, 06 Feb 2023 10:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP3AH-0003D0-RD
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:12:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP3AF-0001T5-D3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:12:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d14so10668317wrr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FqzvdRul7AfjIyf4m9xJrzm9eghVm8fVvNt4NLjoK+Y=;
 b=LjkD4l04tJVJJyt2/AXvNi0LYB7EyavQfyDyNCxiYeAtzq5jxv95FapONxbferodcB
 56H3e1ZSaaKNl5aRdL4MSwS92jt7tuASTYJlWyLSewxm3Xj+oM6Q5RXGnHxnH3TJQXgB
 iQ8bA9K4L7DjO9NsnzIJ+TqiZLFMaCK43LiVrgVk6c7dWrju0Rj1Yo9XsPLeDaXSDElk
 iCZOJdLOw3S40OQ3ecRvSmKB2bZKcWtUSsh929DeB8rb3Vttlr45ceRY69YC5SQHiFu7
 3IYlKaMONgd0rlMwQnNa+WKORFmWwSh2SSL1PPWI4FpTb2Inlty3L7R3ylFTQLkNYAek
 i85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FqzvdRul7AfjIyf4m9xJrzm9eghVm8fVvNt4NLjoK+Y=;
 b=mmAV0VlXVHGjW/YigT7xn4JLqcnBPesFPhUOyO+w75+Hlr3icR7dpR9r/68E53N5Kq
 X4IJxHDLRHl0Trf9YVJLkIJBG5FNQS0HwUxDZw6tGmRlY9fzjSEPJSIn7fe502qGtgoD
 iXTkcgg0hPFEV3q2Q9wPMPCryPKfIvjuFX0nrZK+FhQ1gnTqTySQjcoaTBQF3zT7YuPk
 nowfMI01mIU5/orx0R8txaTUIP8cfPgMz307cIrFquNLLkbgAeXGfmxVuK2oBYWS/D0v
 VOjFlGyq9qWEijEf11A9b234QypsAp9XGkUrujh+Ub3yBig2y92HfWW51q36TEO8iv0F
 q9Vg==
X-Gm-Message-State: AO0yUKUlBGUiSMxrridSZ1V9zoFOQ1q3VMBUPLqkkC2Ei06o2gAF7k/9
 7bhIviN9RfsQ2Mn/GCibTUncMr2tabNq0j1e
X-Google-Smtp-Source: AK7set9wmqEeP+tKcuNF6UNq2CkUp8zYIPf+hg7a/bNSlb8n45WyMfgMEcCFUNxq387B0rJE/TebWA==
X-Received: by 2002:adf:f58d:0:b0:2c3:ea92:3494 with SMTP id
 f13-20020adff58d000000b002c3ea923494mr2970450wro.55.1675696333704; 
 Mon, 06 Feb 2023 07:12:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s22-20020a1cf216000000b003dffe312925sm4442463wmc.15.2023.02.06.07.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 07:12:13 -0800 (PST)
Message-ID: <1bb6f2bd-8af8-55b2-4660-9794eabdc0e1@linaro.org>
Date: Mon, 6 Feb 2023 16:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v11 1/3] hw/riscv: handle 32 bit CPUs kernel_entry in
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
 <20230206140022.2748401-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206140022.2748401-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 6/2/23 15:00, Daniel Henrique Barboza wrote:
> Next patch will move all calls to riscv_load_initrd() to
> riscv_load_kernel(). Machines that want to load initrd will be able to
> do via an extra flag to riscv_load_kernel().
> 
> This change will expose a sign-extend behavior that is happening in
> load_elf_ram_sym() when running 32 bit guests [1]. This is currently
> obscured by the fact that riscv_load_initrd() is using the return of
> riscv_load_kernel(), defined as target_ulong, and this return type will
> crop the higher 32 bits that would be padded with 1s by the sign
> extension when running in 32 bit targets. The changes to be done will
> force riscv_load_initrd() to use an uint64_t instead, exposing it to the
> padding when dealing with 32 bit CPUs.
> 
> There is a discussion about whether load_elf_ram_sym() should or should
> not sign extend the value returned by 'lowaddr'. What we can do is to
> prevent the behavior change that the next patch will end up doing.
> riscv_load_initrd() wasn't dealing with 64 bit kernel entries when
> running 32 bit CPUs, and we want to keep it that way.
> 
> One way of doing it is to use target_ulong in 'kernel_entry' in
> riscv_load_kernel() and rely on the fact that this var will not be sign
> extended for 32 bit targets. Another way is to explictly clear the
> higher 32 bits when running 32 bit CPUs for all possibilities of
> kernel_entry.
> 
> We opted for the later. This will allow us to be clear about the design
> choices made in the function, while also allowing us to add a small
> comment about what load_elf_ram_sym() is doing. With this change, the
> consolation patch can do its job without worrying about unintended
> behavioral changes.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 20 +++++++++++++++++---
>   hw/riscv/microchip_pfsoc.c |  3 ++-
>   hw/riscv/opentitan.c       |  3 ++-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        |  3 ++-
>   hw/riscv/spike.c           |  3 ++-
>   hw/riscv/virt.c            |  3 ++-
>   include/hw/riscv/boot.h    |  1 +
>   8 files changed, 30 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCF68C112
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP38p-0000eT-8W; Mon, 06 Feb 2023 10:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP38c-0000Sm-Ph
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:10:35 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP38a-0000xg-EN
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:10:34 -0500
Received: by mail-wm1-x334.google.com with SMTP id z13so1430031wmp.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ndw8I+0Rl2gqHgORiHopVlytR94xTgJJoxNES21UmI=;
 b=jmqABeqGMwkQYLUrKv2BtLscci9sdGXtnmaXl5/vbtWlbzCFHrKbpsypBVbZly4HnW
 vXNzAdTmdWHl5iK56Ckagvq5w6YCt6vNlYHj8dxB8yVp77lY5pU29JWpl2jkHT+4BgSj
 BmDobHkz7r/r1fudxtvoz3cW/l1Wxt2+fZp3LB92yJFK3whsU0qe1KaSFZeKeaRh13NP
 YmdPgwHcaFXYBdnEaNIzXVsisvD0LKnkSLss9r2emcLglKcLW+6c+/F0cAGjgxmwbnVc
 iiJICw7zV/p7wIA2B+MFj94K9k4y1XlZffKQMAE2wnaguiGsP9Itgey1cD6sSam3dmDY
 yQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ndw8I+0Rl2gqHgORiHopVlytR94xTgJJoxNES21UmI=;
 b=rb6b7Uc2LFxqnbDl/QD5cSiAbjpyobmrnb1UDYtyA2/A8Lf4HEdCqN+hB+uDnI83HV
 GyOca1RxhBMuDOJdOpFWCTw+xpr6qczhkYNx+xJFLVTv33RigsKT3cAbugeqjw8sQq8Z
 XeXOyWXiW0TyXfiB1mfKQ4qFZ+zip2eMyzeIu2qiNw3S+XFCB+JXYwLkj15j6vzSV6Ou
 ZueRonXgPYsxWZEceAxND/MDf5KjihFoRScGtLiIbrzKlgEiqGwJcoJWGxgUztqpKkSH
 iLNdjbQTwN7uv6gwK8YVysp43WgW7/DAe0JeJIZrWbgPl+m+1J5N1jdSgNapMvJJWGpP
 ps9g==
X-Gm-Message-State: AO0yUKXYbiat8qhv82/+C/0va0V1aJGYqmkI/gFIRhnxgZggIHKf+Hwq
 ZQDmAYOSyXnhU7/p3G1Z5NSsGA==
X-Google-Smtp-Source: AK7set/CqND6M+x6lFOHQcAHxpJYFQYh96L0OwBZnu9ng100qQDpxVfgEqZZEh0c+SRSatzMrv3b8A==
X-Received: by 2002:a05:600c:2e8a:b0:3e0:114:62ee with SMTP id
 p10-20020a05600c2e8a00b003e0011462eemr71901wmn.8.1675696230676; 
 Mon, 06 Feb 2023 07:10:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003e00c9888besm240057wmo.30.2023.02.06.07.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 07:10:29 -0800 (PST)
Message-ID: <672e6576-4fbd-2a17-a855-642ad80427dc@linaro.org>
Date: Mon, 6 Feb 2023 16:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v11 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
 <20230206140022.2748401-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206140022.2748401-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
> 
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline
> 
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. To not change the behavior of boards that aren't calling
> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> allow these boards to opt out from initrd loading.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 11 +++++++++++
>   hw/riscv/microchip_pfsoc.c | 11 +----------
>   hw/riscv/opentitan.c       |  3 ++-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        | 11 +----------
>   hw/riscv/spike.c           | 11 +----------
>   hw/riscv/virt.c            | 11 +----------
>   include/hw/riscv/boot.h    |  1 +
>   8 files changed, 20 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



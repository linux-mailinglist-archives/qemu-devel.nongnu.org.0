Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D975863BE9F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 12:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozyST-00012p-I6; Tue, 29 Nov 2022 06:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozySR-000120-4f
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:07:23 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozySP-00068Q-FG
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:07:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id o5so12493254wrm.1
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 03:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RSSAWDw23nrbGjkvDWGNzya11TNLKgFLbcPR0BekNvM=;
 b=rO0hwB1nP46Y46fEQo8XYUseA4kq/UHj3NrNQdmPQE+tN8/b1pPkjYntaRIz7b60mM
 1lmdaXlHRocBBLpesN+w6e2xvYm7cMP0wKw0sQGbtwiCcx/MGop4L8QHfhQbwZuv6Eku
 EOlshXKsuz46iv/UNTmLUK94KsNStH46SmlFVNQSX4cJPpiXFPBwAIqcI5ZTT/EOG3gk
 dJ/rwPxqjMmpf/t5DvPyj+UZQgXhfzjqaXe9wBwftf8G0KTNcLA0/H4bWFaRxtEoVFYY
 Z+cx4e5GU53/DUwYVVJQCIo/5JO5YKTL+4fRv1Y1grukN5t6hbs8JrIAP/RAS5YWBviY
 3P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RSSAWDw23nrbGjkvDWGNzya11TNLKgFLbcPR0BekNvM=;
 b=QAL6K/MMFUmffeeJmbZMrTnmziGqrSCVFZhUJQk2r2DG3xO152gRysRC8426d1eLnu
 yVg7RzUlPZQJE18KzwXKXJTaCtcXMmhVg6MkAv+6uHcS6GSIJ0Pu5uzNTmV1JeL1CIxc
 TLOU0wAKubV6F5e9V90feqQjePC9EJXks6bqezJgFbmZ2LhH5eSXCXA447I9NTncJDvb
 EJeC+LXU16/LmuNqSEszoiLPHhjccnOGomlN4kx2yIIqo95Ar0fcmwypRmXKv6SxmZ4a
 a3zSZKiA9AaP/qaod3+PjDnWHjoUn5g88Ahd+qt5OxujwYZuI5sTye8hYtx+h0P69zoL
 sMqQ==
X-Gm-Message-State: ANoB5pmWvKTy4MeJ847n1s0HTOoj+o0LjjFZckGAotZWJ20QFoQggorc
 xHNOiBJuBqJqTpqybNd3NN0p7w==
X-Google-Smtp-Source: AA0mqf4za13tjwwtyqOGTnMFEdX1BeV+DRnokAiQxj0ODonPpg7n9WeuYgR4/4syQftmMl2ZZBJ+mA==
X-Received: by 2002:adf:e8c6:0:b0:242:d3c:3746 with SMTP id
 k6-20020adfe8c6000000b002420d3c3746mr9587579wrn.397.1669720039327; 
 Tue, 29 Nov 2022 03:07:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d6508000000b0022eafed36ebsm13145824wru.73.2022.11.29.03.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 03:07:18 -0800 (PST)
Message-ID: <84913eb8-75c3-5175-401f-9f4cc8409442@linaro.org>
Date: Tue, 29 Nov 2022 12:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/1] hw/arm/boot: set initrd with #[address/size]-cells
 type in fdt
Content-Language: en-US
To: Schspa Shi <schspa@gmail.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20221129104809.84860-1-schspa@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221129104809.84860-1-schspa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 29/11/22 11:48, Schspa Shi wrote:
> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning.
> 
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] initrd not fully accessible via the linear mapping -- please check your bootloader ...
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_memblock_init+0x158/0x244
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.1.0-rc3-13250-g30a0b95b1335-dirty #28
> [    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : arm64_memblock_init+0x158/0x244
> [    0.000000] lr : arm64_memblock_init+0x158/0x244
> [    0.000000] sp : ffff800009273df0
> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 0000800000000000
> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff800008b46000
> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff800008a53000
> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000ffff1020
> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616d207261
> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 0000000000000000
> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e20647274696e69
> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff800009273a88
> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 0000000000000056
> [    0.000000] Call trace:
> [    0.000000]  arm64_memblock_init+0x158/0x244
> [    0.000000]  setup_arch+0x164/0x1cc
> [    0.000000]  start_kernel+0x94/0x4ac
> [    0.000000]  __primary_switched+0xb4/0xbc
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
> 
> To fix it, we can change it to #[address/size]-cells type.
> 
> Signed-off-by: Schspa Shi <schspa@gmail.com>
> 

Something is odd with this patch, using Thunderbird + Colored Diffs 
add-on can't see the patch content, but I can see it archived:
https://lore.kernel.org/qemu-devel/20221129104809.84860-1-schspa@gmail.com/

Maybe because you used '--' instead of the git '---' separator?


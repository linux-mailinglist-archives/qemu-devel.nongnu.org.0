Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94400666BAC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 08:38:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFs9T-0001dZ-V3; Thu, 12 Jan 2023 02:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFs8m-0001Sw-Iw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 02:36:50 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFs8j-00029v-R3
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 02:36:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso14319119wmq.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 23:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ku7Z7JgLvP0982PiOzy3agxyNF3nYPcDl3GT2hD2snU=;
 b=xrGl07BLBjE2/H/7kfCL93Z55OMMaSo3IqpYEOiEKyLmWSj7ZHEtIQzcM9ofd+68+G
 g90kDdU066qcoALa9XvpLBaA+FvPGkRShKFLY/kq34k7+o/h3BcNsx8Kd8AbCi9JwQvD
 0uiFxeqxBqAWisrIBowmFTGvu7MlScFO6L+D1YUnRI7amFdpQJJ+HWsnjuMIvl2c8zuU
 G2vfbZks1igXwzGQHszmn5aNtAeGv7UA9gKUIOHZ+H3IBGx6T74LGFONL2VldgV7QoCQ
 IbhQYczw2+JDE1zFHtI5yWtPIVTtam2GgpActq9uTX17a3g+6S4g/WOZDRVq5lScIqyu
 9p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ku7Z7JgLvP0982PiOzy3agxyNF3nYPcDl3GT2hD2snU=;
 b=yGaw8Jq7CjDtztJCFdTglSeoxXeP6sawepfOkggtiFIEj6L4b+vUvHr91BE55jF/I+
 S1dL7RrzI7Fk7F7nfyzVn2Zv9C42fZ8ZdReK5Y7jYO58etIOkbYUQgzCQAvX+DjMPhQW
 +BDt7B776uxDe+S40dbVzqsXkWXJrWzethONrQ9VhBwOp2gCpnKDW1BLXTB7lqlAawgI
 Djee24TidM8l7SVYZiR8IIitvnVrSH2FzBRX60aSAXk4Bvmru2LOIdRaoAHrrX9xb5V1
 wHlqqjdfdER3faPDAKeq+WUvzszTE/V1LHpRQPq+qx2phlmZJYmn0mTVEwa69VOAviWR
 fSAQ==
X-Gm-Message-State: AFqh2kpWhuETQeC7jm5eegipP1VWa3967dogYt/xXATC21fi82sz4i93
 sB/EnpNiKn40qe+b1/UPd5HQGA==
X-Google-Smtp-Source: AMrXdXsnoKHskgOAy8HXPkS6INgKQ8bGZGQrr1eETmirGAmGF3aat12fVqSzb3lEJmJ3GUb7nRW6Ww==
X-Received: by 2002:a05:600c:a4e:b0:3d1:baf7:ceae with SMTP id
 c14-20020a05600c0a4e00b003d1baf7ceaemr54109388wmq.39.1673509004105; 
 Wed, 11 Jan 2023 23:36:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c2cdb00b003a84375d0d1sm27817202wmc.44.2023.01.11.23.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 23:36:43 -0800 (PST)
Message-ID: <e21e37ff-6043-1726-6ad0-a0c6b2097558@linaro.org>
Date: Thu, 12 Jan 2023 08:36:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/10] riscv: create_fdt() related cleanups
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 11/1/23 18:09, Daniel Henrique Barboza wrote:
> Hi,
> 
> This is a follow-up of:
> 
> "[PATCH v5 00/11] riscv: OpenSBI boot test and cleanups"
> 
> Patches were based on top of riscv-to-apply.next [1] + the series above.
> 
> The recent FDT changes made in hw/riscv (all machines are now using the
> FDT via MachineState::fdt) allowed for most of the cleanups made here.
> 
> Patches 9 and 10 were based on a suggestion made by Phil a few weeks ago.
> I decided to go for it.
> 
> [1] https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> 
> Daniel Henrique Barboza (10):
>    hw/riscv/spike.c: simplify create_fdt()
>    hw/riscv/virt.c: simplify create_fdt()
>    hw/riscv/sifive_u.c: simplify create_fdt()
>    hw/riscv/virt.c: remove 'is_32_bit' param from
>      create_fdt_socket_cpus()
>    hw/riscv: use MachineState::fdt in riscv_socket_fdt_write_id()
>    hw/riscv: use ms->fdt in riscv_socket_fdt_write_distance_matrix()
>    hw/riscv: simplify riscv_load_fdt()
>    hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
>    hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
>    hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

Patch 7 likely needs rework (problem predating your series).

Meanwhile for patches 1-6 & 8-10:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks for this cleanup!


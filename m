Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3196F9F23
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:38:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtYz-0005ta-Q8; Mon, 08 May 2023 01:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1pvtYx-0005tN-SZ
 for qemu-devel@nongnu.org; Mon, 08 May 2023 01:37:31 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1pvtYv-0007uQ-Ti
 for qemu-devel@nongnu.org; Mon, 08 May 2023 01:37:31 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9A6373F177
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 05:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1683524246;
 bh=MzRImdjqHazZE0HxBZlmAaOTkaR/HV0jJpJy+q+wHG4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=nC6KtisEuBEz+dWVMGkAidLpdtCGK1UQKRL5dAG3aAdyjx5AEzRPUiXVIjwjuEAcI
 CsF3rKh5/II2JMoSi56c8MySM/uZOsUJVKwt6ywr5xrgES7136VlEdpTm6Q9aOsoHr
 3kZqCgM3a+YQe7m7rKZoR9cntweaEKmtqrh2AGetz4owY+kxSVApy8cepi7zOIGv3H
 CH8Dc9w7SZJWaIEnaZFF9O4fW25GPiBGB2nm3+JpzrWmdRbquU33y6GO09X+TdgsOF
 F/hJ9VtIybeYfAyLe+eOnOj/CFS/nbN6p/B73J5Vg/cEG0lanc5vEVnL/dwXBM87n2
 b+LnJTpK46yCg==
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3063394ae41so1318060f8f.2
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 22:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683524245; x=1686116245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MzRImdjqHazZE0HxBZlmAaOTkaR/HV0jJpJy+q+wHG4=;
 b=Ojjns4O0RBrZp7LeYGlhzRB5u0GwjBK6EFzDODlzku0vnBiQepxHtdrMuRPzPmyr71
 QXiK8N+Tvqsm8NK6XZyjwK5QdWGXapewogzYYRVT1uNsKaOUp6ZQVQ6cRuoI0RLOAIPa
 i7qaiEUgVbf14YBIdfFGsqx5GBRr7h+olSDyODE21TheCcxvqfGjPqLnMf8EfJegM4f+
 B0ioMzGLHojk9DR/AAcFkaluKGW0Ts5Cwc3OpI3TVIGl/w+vFcOw1vBEEGLPDwWldDOS
 VebCc59aJ+ZcW7TQQnNdrrTFQY7qESdnPxYfEUhzDZi3f7DpgX848CLDucpX3c1tDDbE
 TpQw==
X-Gm-Message-State: AC+VfDy9d6uotcFDe/btSK6v/SQlFqY3Lbt6hAEM/jGHm08vPNqBanBt
 fjDhegbtMMiniYx7LhzgWj5FwXIdojv8n7AikUL1Yp1FJ4Yn4Owj5OfTFMW0s0bufBFlRwD+AWD
 hmwl4B2g6zZlb0MA9+OElHP4ysHo6GlQk
X-Received: by 2002:a5d:6d49:0:b0:2f7:8779:3bc3 with SMTP id
 k9-20020a5d6d49000000b002f787793bc3mr6286384wri.11.1683524245347; 
 Sun, 07 May 2023 22:37:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6A36OXYsuCGEg1Jl1XWNYt0GCfFdwTM99Me1vKPj4kkG2EMrgMLeX6WQpaQ2qXqbeiM+Myag==
X-Received: by 2002:a5d:6d49:0:b0:2f7:8779:3bc3 with SMTP id
 k9-20020a5d6d49000000b002f787793bc3mr6286374wri.11.1683524244908; 
 Sun, 07 May 2023 22:37:24 -0700 (PDT)
Received: from [192.168.123.94] (ip-088-152-145-137.um26.pools.vodafone-ip.de.
 [88.152.145.137]) by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4d82000000b003078681a1e8sm7070601wru.54.2023.05.07.22.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 22:37:24 -0700 (PDT)
Message-ID: <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
Date: Mon, 8 May 2023 07:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20230425102545.162888-1-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/25/23 12:25, Sunil V L wrote:
> Currently, virt machine supports two pflash instances each with
> 32MB size. However, the first pflash is always assumed to
> contain M-mode firmware and reset vector is set to this if
> enabled. Hence, for S-mode payloads like EDK2, only one pflash
> instance is available for use. This means both code and NV variables
> of EDK2 will need to use the same pflash.
> 
> The OS distros keep the EDK2 FW code as readonly. When non-volatile
> variables also need to share the same pflash, it is not possible
> to keep it as readonly since variables need write access.
> 
> To resolve this issue, the code and NV variables need to be separated.
> But in that case we need an extra flash. Hence, modify the convention
> such that pflash0 will contain the M-mode FW only when "-bios none"
> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> This enables both pflash instances available for EDK2 use.
> 
> Example usage:
> 1) pflash0 containing M-mode FW
> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> or
> qemu-system-riscv64 -bios none \
> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> 
> 2) pflash0 containing S-mode payload like EDK2
> qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -pflash <smode_fw_vars> \
> -pflash <smode_fw_code> \

On amd64 and arm64 unit=0 is used for code and unit=1 is used for 
variables. Shouldn't riscv64 do the same?

Best regards

Heinrich

> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=0 \
> -drive file=<smode_fw_code>,if=pflash,format=raw,unit=1,readonly=on  \
> -machine virt
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> The issue is reported at
> https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1e53c619ce60587f6
> 
> The patch is based on Alistair's riscv-to-apply.next branch.
> 
> Changes since v1:
> 	1) Simplified the fix such that it doesn't break current EDK2.
> 
>   hw/riscv/virt.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..ca445d3d02 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1296,10 +1296,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
>           kernel_entry = 0;
>       }
>   
> -    if (drive_get(IF_PFLASH, 0, 0)) {
> +    if (drive_get(IF_PFLASH, 0, 0) &&
> +                 machine->firmware && !strcmp(machine->firmware, "none")) {
>           /*
> -         * Pflash was supplied, let's overwrite the address we jump to after
> -         * reset to the base of the flash.
> +         * Pflash0 was supplied with "-bios none", let's overwrite the address
> +         * we jump to after reset to the base of the flash.
>            */
>           start_addr = virt_memmap[VIRT_FLASH].base;
>       }



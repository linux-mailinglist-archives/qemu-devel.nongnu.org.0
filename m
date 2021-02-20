Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303873204EA
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 11:38:32 +0100 (CET)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDPeg-0002Je-Ow
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 05:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDPdx-0001u7-8W
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 05:37:45 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDPdv-0001T1-Q7
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 05:37:44 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w1so20110892ejf.11
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=loPtZxLAFSJDDaLmOa/VgYQN02akXgl5UYQNYhGK8EQ=;
 b=JjTmqX6iVFkQvElGxPpJXo2fV9tyoPD4h0MQlPAjUWVFWPBDc++7aLVZ+j4vBnULDP
 cB2xAihrWL/zQpJtBszssIxuoEkGPoNnFrIG5FDU9RH+PtBMFwBHB8YX/Cps0J6C2atV
 ZC3dJmnsDb4258Y7oAmNVZ6VTVlhwhJW/tBt41/vYjZ1Z6zRSZTBnXsk+ktjB4JoXRE1
 eQMsIAzXYritVlHMYiB1mmAWw9G0FOlbSTEmyG5eKRLj0nHzOgedFRzr0ZgYmQeMyuYc
 9J22M4P0I+TYiNjx/QQjyUIwxkCYUe+tc5+s6ZbbD7/Dy36xzRAxAh0vK+G5cPYT/uir
 wUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=loPtZxLAFSJDDaLmOa/VgYQN02akXgl5UYQNYhGK8EQ=;
 b=Ef8JSIqJQs0S8Rph8bgJL6jImTI3/DwOAtyJ8zms8+zp9gqVOAm08xnGpPiBlMWnrX
 qE5EyNftgOylNwwVBWi930xDUq6o0jHRqcG5QLVX8PCx3/96w7G+XaIlvSoIUP9MRCfe
 EkBkgrmHA4m29WMR59Knm2runUwgUZJL6ZzJQD8RxpB8B6dYiyv8ys31uLphdVgczCdr
 t5h91Hz9vnOgsV7woFZI/Z7LXZKmrgpi4d/PL7XZfmgqmU/WSz0AUlzG212bcN8RHq5F
 1GJRJVMnSkENuwkBW29sjsI5Ds4srjyZBiFCQNpxDWRUMn+/Oe/jp6xuCpzwl2LrEEyR
 Dj0g==
X-Gm-Message-State: AOAM532HgD4JYZwvw8kkTRRDam1RYjsqiB14Zsxc52b64uBlaSRhJAlt
 8UWR+KIW26W1wWdQ30c26YHcaGgGjNtBc9umG+jKgA==
X-Google-Smtp-Source: ABdhPJyVfroxe5mNpTuZvScvF3q+aZjr11MsMM4tu/QyUJbuMb0W9jIcWj5hbbG/Y2aaLNaXtDQpdjzT1jbV1Qgg2yE=
X-Received: by 2002:a17:906:3556:: with SMTP id
 s22mr11783305eja.85.1613817462213; 
 Sat, 20 Feb 2021 02:37:42 -0800 (PST)
MIME-Version: 1.0
References: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
 <1613749155-84250-4-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1613749155-84250-4-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Feb 2021 10:37:31 +0000
Message-ID: <CAFEAcA9dvMT=4RGztaxshtNHaT-Bm4w0gK-S_zv9aJO_e3AVFA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 16:10, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> RV32 supports 34-bit physical address hence the maximum RAM size
> should be limitted. Limit the RAM size to 10 GiB, which leaves
> some room for PCIe high mmio space.
>
> For 32-bit host, this is not needed as machine->ram_size cannot
> represent a RAM size that big. Use a #if size test to only do
> the size limitation for the 64-bit host.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - Use a #if size test to only do the size limitation for the 64-bit host
>
>  hw/riscv/virt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1d05bb3..fc90bc8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -590,6 +590,16 @@ static void virt_machine_init(MachineState *machine)
>          }
>      }
>
> +    if (riscv_is_32bit(&s->soc[0])) {
> +#if HOST_LONG_BITS == 64
> +        /* limit RAM size in a 32-bit system */
> +        if (machine->ram_size > 10 * GiB) {
> +            machine->ram_size = 10 * GiB;
> +            error_report("Limitting RAM size to 10 GiB");

"Limiting"

> +        }
> +#endif
> +    }
> +
>      /* register system main memory (actual RAM) */
>      memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
>                             machine->ram_size, &error_fatal);
> --
> 2.7.4

-- PMM


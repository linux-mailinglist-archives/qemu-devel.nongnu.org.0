Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678B63176D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 00:46:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owu0A-0003DL-Q3; Sun, 20 Nov 2022 18:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owu00-0003By-SP; Sun, 20 Nov 2022 18:45:22 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtzy-00056Q-5H; Sun, 20 Nov 2022 18:45:19 -0500
Received: by mail-ua1-x92f.google.com with SMTP id y15so3523065uan.6;
 Sun, 20 Nov 2022 15:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0rqkzyxvGJzv05iKHkaZZIaa1mj/Roj3+0MDeJwAIrI=;
 b=oX6GmNE1nwhpp18jBgFTgWFCqGg+S60ZyS0FCmzgIhBYzFdFPobnn6Tzc4r24ngirF
 hdzBK5DwCSo9FbWUPlyYw8TZVy59f5aJxLgVopjb9S5fifh1mSOf5Iqkv7wzj3XYjOtg
 41IC0HHJkG058hOvLoT8BcagdORuXEnuwTOM20ESP6jcwy5vD7JZ+fUo5R8RAj5JfZEL
 AhW9yEHXZonC4ou+92fjuaDgmTifqWuaI502Lmu3PDmmXvo0+Tq8KP891BqrJE3sgeUK
 +2OTfQW+5rp+fyvTcMdMmLXNerSFrpLf7zjrPlEeqs3i91zELlphf+rrjJm0uK0QcHHK
 4DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0rqkzyxvGJzv05iKHkaZZIaa1mj/Roj3+0MDeJwAIrI=;
 b=Q1b3A5dkAJZf6/Wj8zRYAM03mZ0ezH91s4CztyxbUd65uWPNtdaUKBQxooxGbGcvce
 gnPZ0CfX1WJktyWvGNFK40QkUeppREo4IDg+py3Au3EugOhHiCRlCNExS46hQAQL4ez2
 w8o+/8bgv7UQGFjLON2KZp/thjXXnAS4h2RPsjtPvbHphTzNfX520//io0l2upuR0WFZ
 +scPffVmg0p0H26299xOeJR9epu3SM3Xu8IKMfKcy0OFxHpl4iSO65cTnpfguXk4Y3Vj
 HspS/9eI6WS8OwIs8lshJxSK7bsIRffgO1bwA5oEd9XY6yrtqglNB9CIR2Z4Jzxe8ky1
 nc5w==
X-Gm-Message-State: ANoB5pnSl5ebk8GCcLl4ybt0Jh1uVlcUagN3KJJwiCqJsZI5mvj1bhFE
 oabZ9gj68Evk/C6whOxh/JnrwYeiUeeuKC6eWtg=
X-Google-Smtp-Source: AA0mqf6yRwxrcJboSSiavde1nBXmWqk98RyWDYUwYeY2K5jVovLSXNskZ0mPkFJMgsceSdeDUVSdaCKxbYK8hf0Sf3Q=
X-Received: by 2002:ab0:6592:0:b0:408:fefb:c1a9 with SMTP id
 v18-20020ab06592000000b00408fefbc1a9mr7955949uam.38.1668987916679; Sun, 20
 Nov 2022 15:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20221113095101.3395628-1-atishp@rivosinc.com>
In-Reply-To: <20221113095101.3395628-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 09:44:50 +1000
Message-ID: <CAKmqyKPgC+Jwn=-sq0MQaVyhYq75+6a3EY1r7tgqdg0PacZC7w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Remove the redundant ipi-id property
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sun, Nov 13, 2022 at 7:52 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> The imsic DT binding[1] has changed and no longer require an ipi-id.
> The latest IMSIC driver dynamically allocates ipi id if slow-ipi
> is not defined.
>
> Get rid of the unused dt property which may lead to confusion.
>
> [1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 2 --
>  include/hw/riscv/virt.h | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b412..0bc0964e42a8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>          riscv_socket_count(mc) * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
>          VIRT_IRQCHIP_NUM_MSIS);
> -    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
> -        VIRT_IRQCHIP_IPI_MSI);
>      if (riscv_socket_count(mc) > 1) {
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
>              imsic_num_bits(imsic_max_hart_per_socket));
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index be4ab8fe7f71..62513e075c47 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -93,7 +93,6 @@ enum {
>
>  #define VIRT_PLATFORM_BUS_NUM_IRQS 32
>
> -#define VIRT_IRQCHIP_IPI_MSI 1
>  #define VIRT_IRQCHIP_NUM_MSIS 255
>  #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
>  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> --
> 2.25.1
>
>


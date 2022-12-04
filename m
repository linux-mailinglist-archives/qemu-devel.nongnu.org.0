Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EB642004
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 23:24:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1xOo-0000g3-R4; Sun, 04 Dec 2022 17:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xOn-0000fv-4N
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 17:23:49 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xOl-0004vg-Ol
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 17:23:48 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id z23so600122vkb.12
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 14:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9qO7HDRcoF8IXhFdFVAxp+4adYiViBCjZX+8xgCxomQ=;
 b=CJp3AzH4Bflr1iwzPp9OZA5dSNrGsbKq2rOa/FXVqeR5sFyCkHzT/6IDkOi0RqOJ7Q
 JdqPOvp07Zq9DV7Tw/rdHJrtYseTuba2f477SOr/dFH9/wq+Cfi2N2TKNwKgg1lHuDNG
 +jGgeUJOgfQL9ME65BxyR7rPIrTGIG8mZ1rkoGoiJfmeROoG+YibS/GQhPZtg/dvzKpJ
 2Bov0Ar+eY3/8e5i01Y9Dk3AxqD3MVgeLkNBMQ0OB84rtA/1PuZ5Bqeyvd0VTRyQ+64k
 EvrXSV9Zcwz1wzktY0l9F6HqYeORXZyRgLatcScGpdGge86WBbv5ouBFZIrBSATSe6wG
 /1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qO7HDRcoF8IXhFdFVAxp+4adYiViBCjZX+8xgCxomQ=;
 b=jXDx9J08eYqWvDlPw49xxTFOdT9ALxJe63G5/8SO9P5SnfqeYpHe1dt3Xly5jXfiDD
 antA05bhSaIDcEYOv59hGwNivA8RzZgKOKpmJvaR+O64WSADDblg7X/WxNJzkB/H7FGw
 PcztVQIvBTx3aNYPdXsyWxZypeWNYGKeJ5u+Kib//oqlVQ5ntTMNd4V6r+ouIWhxUzQs
 jnl3DlJfniMPY5pJ//JFDvaSztejBEMOKmCu8/AmZXu3EWDnCD1hIngpugwzNgnJrWVH
 dmsbUwOZgCLcu8ZiJBRvD8V8UkRWQ2O4OPhCYWpAty2p0+aiMpymWdyq9U4K09Zk/x9p
 B8Dw==
X-Gm-Message-State: ANoB5pmZ0bD2P6KMTtpK8kApyNvVMpexYxV8XGMNirBVaBQVJ5duZRVt
 aRZgq30czBpFggJC0wdqUiluAnvo7xEAM/jM9YY=
X-Google-Smtp-Source: AA0mqf53MN8OcJNH2h4rl0PnunqL+OPbgsYvoxfNo48uAgZLN5IrehpVtpD2SFXgVngw1FmyMLsSOG8BVyEu4W8XGzE=
X-Received: by 2002:a1f:e3c6:0:b0:3b8:ba98:bd43 with SMTP id
 a189-20020a1fe3c6000000b003b8ba98bd43mr37554024vkh.34.1670192626767; Sun, 04
 Dec 2022 14:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-2-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-2-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Dec 2022 08:23:20 +1000
Message-ID: <CAKmqyKPBfUaqNz6pFy9oS-dzNY0xJcr5G5VEH8OeZ3oc4tk-0w@mail.gmail.com>
Subject: Re: [PATCH 02/15] hw/intc: Select MSI_NONBROKEN in RISC-V AIA
 interrupt controllers
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Fri, Dec 2, 2022 at 12:12 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
> controllers regardless of how MSI is implemented. msi_nonbroken is
> initialized to true in both riscv_aplic_realize() and
> riscv_imsic_realize().
>
> Select MSI_NONBROKEN in RISCV_APLIC and RISCV_IMSIC.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/intc/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 1d4573e803..21441d0a0c 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -72,9 +72,11 @@ config RISCV_ACLINT
>
>  config RISCV_APLIC
>      bool
> +    select MSI_NONBROKEN
>
>  config RISCV_IMSIC
>      bool
> +    select MSI_NONBROKEN
>
>  config SIFIVE_PLIC
>      bool
> --
> 2.34.1
>
>


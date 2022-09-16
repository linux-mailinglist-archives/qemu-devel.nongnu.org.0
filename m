Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C25BA6AE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 08:18:19 +0200 (CEST)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ4g6-00068w-A1
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 02:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ4e1-0004cQ-J1; Fri, 16 Sep 2022 02:16:09 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:35768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ4dz-000342-37; Fri, 16 Sep 2022 02:16:08 -0400
Received: by mail-qt1-x829.google.com with SMTP id g23so10722387qtu.2;
 Thu, 15 Sep 2022 23:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6nPurTmvPyDZH/msdVb85URRLWvA9bM8d+c3s63iHY8=;
 b=d1inDe3xrjyGnPM96/bA6U8h2ZNiqebACrq1jQBEM9VyIfMOWpxGjNxdjEUSiLRTvy
 FofMoTOEL9TohB1vsEMSsClzCdBBrv+BXTnx83qoiuW9O04LEG6BtfaApREMCJdghb4H
 NG1JrMcdk0Vt9anWsAFpVeuqM9NAFJwJaz+FQyJe2ROT9Nc+XJkVV7Z8PZZCPhrS3QoH
 TvmZFywQr1Ya1V4WuKBQcE+f/zpmQTKey25Sk/Db2DYX4jFJBLRq+O/Qlvj+g32e1wGM
 I+5e27BH4984HQMTDL08AMAu6PrzLDgUH336FaIbcGaOyfw3xWkC/3pZklyWlCRFjR0u
 X5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6nPurTmvPyDZH/msdVb85URRLWvA9bM8d+c3s63iHY8=;
 b=Ao8rQ8WW5Sc27x8mv2CFKxcIQ1Y39L7z9Vw1Ut/bdqjjA9qsaVXHJjMMtloUq3L8Ou
 N5in0h5o9FfGYlt4sQ/KqaCZFiJmySFPU2B6TmypKZp664T7tj5Fc3DJmkVtc6yWVWx2
 NCvmaEBB3/kTOmLeh7C12eik533VuZ0Ahm3JMlJOMl9rttQbG/nNdKL7M+c8/FlKgwVh
 11aUcdivF/e4Tf7EenblPTClePLwb/rsGijD9MJBZiAho7X+FgDAs8CcuUdNUlOorWEv
 sXP1tPKnbrAOEtOtYvxPkXerFGBNJr7nx76RL+qsx2P3bjCmZbYVOHzq7+4xNAwI8uNU
 tNMg==
X-Gm-Message-State: ACrzQf1vqrlhMjzZWOL8cLrQ6utCTzodUck1z/5lVozla5kQruzUbHzs
 9bEtC3B53eYp++y3beeduRjtX8iwWlMgmhlITXE=
X-Google-Smtp-Source: AMsMyM76g5U8OazSEECYCObtwTxJXT7LQK5TjsDDmyfx5ski4PXV+abmp07oDlSN4it+DN/yIt0nfXNpewXwApa6Ax4=
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr3168837qtc.334.1663308964914; Thu, 15
 Sep 2022 23:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-5-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-5-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 14:15:53 +0800
Message-ID: <CAEUhbmW6Zu3Uv5Qo=7cwFeydW7zkeOGkE5jVP04HiExJy9wOHQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] hw/ppc/mpc8544ds: Add platform bus
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 11:29 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Models the real device more closely.

Please describe the source (e.g.: I assume it's MPC8544DS board manual
or something like that?) that describe such memory map for the
platform bus.

Is this the eLBC bus range that includes the NOR flash device?

>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ppc/mpc8544ds.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
> index 81177505f0..cd6cd04bef 100644
> --- a/hw/ppc/mpc8544ds.c
> +++ b/hw/ppc/mpc8544ds.c
> @@ -14,6 +14,7 @@
>  #include "sysemu/device_tree.h"
>  #include "hw/ppc/openpic.h"
>  #include "qemu/error-report.h"
> +#include "qemu/units.h"
>  #include "cpu.h"
>
>  static void mpc8544ds_fixup_devtree(void *fdt)
> @@ -45,6 +46,11 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
>      pmc->pci_nr_slots = 2;
>      pmc->fixup_devtree = mpc8544ds_fixup_devtree;
>      pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
> +    pmc->has_platform_bus = true;
> +    pmc->platform_bus_base = 0xEC000000ULL;
> +    pmc->platform_bus_size = 128 * MiB;
> +    pmc->platform_bus_first_irq = 5;
> +    pmc->platform_bus_num_irqs = 10;
>      pmc->ccsrbar_base = 0xE0000000ULL;
>      pmc->pci_mmio_base = 0xC0000000ULL;
>      pmc->pci_mmio_bus_base = 0xC0000000ULL;
> --

Regards,
Bin


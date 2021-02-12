Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7031A6FC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:39:48 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgAF-0007a6-TM
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg8b-000741-GH; Fri, 12 Feb 2021 16:38:05 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:46956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg8W-000579-Tq; Fri, 12 Feb 2021 16:38:05 -0500
Received: by mail-io1-xd31.google.com with SMTP id u8so626316ior.13;
 Fri, 12 Feb 2021 13:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOmoE7zi427RHBKICipuZu1VZf9BQN87g76ZH5EYk1M=;
 b=KDYWXARY1/rhyZeS91ait1+Ad9N8WviyhOBBhu4asPjkr2x9grssyhlnMLXGlrXPsZ
 Zrjj8fCXuf/aCFahPcv18A+v+zv+lfvf42hdtQhf9U936DXKsfV465JG/Fj2nMogh2PA
 zO/MYXUTELOhpVXDMA+4wchdirDcQAQVIFJS48rDRBJ9Zx8mxdusariEv9NKsOvZPuQS
 N30WnbUzSUBMJcUgc+iQ3jyLYk/r2xULCWTeaFYUm3UIWtXEFUmiIPrYTGcbXBLM9PWn
 QLX26TV7/v0FzpkfCu5v9nphTu+Hun3kH/6XglwWSLax02LGuhJegbpfbWeagP3Y1fgO
 M3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOmoE7zi427RHBKICipuZu1VZf9BQN87g76ZH5EYk1M=;
 b=awLMkkRajq4MQ74eicMDryh80+gALCsikkKHkAMj9XSglTOwspIraG69RUXXP6A811
 Wf9/ep+Vh78ybdIRZWVGDuN1LFvr5R99zpO+jP4t/K39rhsjs3CKh0MaN3IVW5wgBOMg
 LXwcs8Q8gM0eUGVFZMbCUDF+eYnvdibN9UeRnrEVP9nKsrz+wYTRSekBrDeZtvH8Myxy
 nUU5fCryWVj3iHyBaPFntPXXCTKQ+7Ufps2txgCdr7hK9fT6YlEM5zcv43YOL3ldWQFU
 A23ZPr+tM3HnL8o1cobMb1CrI3DnhwyjVJzpwEavjr2KawoAVTbM+aillpl+ZCtZZ9r6
 mExQ==
X-Gm-Message-State: AOAM531CMwPphoKvGbYoAKvxZ7H2b8HP+y5IX8kiY0276SiUcZiVBfZ8
 oH5QG15UMv6UdQAoSuiQFvbzXNBllgj0braCNrU=
X-Google-Smtp-Source: ABdhPJwvR1ZGgWEwMLSKB2WNYz7hMp0mg7iE7vIhc3iZyRrP0YB6HZtQyMtdiaum8+KRWqJY7nZJCPYFNxo9QxJvN/M=
X-Received: by 2002:a6b:d207:: with SMTP id q7mr3742756iob.42.1613165879336;
 Fri, 12 Feb 2021 13:37:59 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-16-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-16-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:37:18 -0800
Message-ID: <CAKmqyKMx7aLD9zz5TvHfvL2bfrfe3Emo44p4s+SZeKndrAE8qA@mail.gmail.com>
Subject: Re: [RFC PATCH 15/15] arm: xlnx-versal: Add emmc to versal
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:36 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Configuring SDHCI-0 to act as eMMC controller.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c | 16 +++++++++++-----
>  hw/arm/xlnx-versal.c      | 14 ++++++++++++--
>  2 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 8482cd6..18489e4 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -333,6 +333,13 @@ static void fdt_add_sd_nodes(VersalVirt *s)
>          qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
>                                       2, addr, 2, MM_PMC_SD0_SIZE);
>          qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +        /*
> +         * eMMC specific properties
> +         */
> +        if (i == 0) {
> +            qemu_fdt_setprop(s->fdt, name, "non-removable", NULL, 0);
> +            qemu_fdt_setprop_sized_cells(s->fdt, name, "bus-width", 1, 8);
> +        }
>          g_free(name);
>      }
>  }
> @@ -512,7 +519,7 @@ static void create_virtio_regions(VersalVirt *s)
>      }
>  }
>
> -static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
> +static void sd_plugin_card(SDHCIState *sd, DriveInfo *di, bool emmc)
>  {
>      BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
>      DeviceState *card;
> @@ -520,6 +527,7 @@ static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
>      card = qdev_new(TYPE_SD_CARD);
>      object_property_add_child(OBJECT(sd), "card[*]", OBJECT(card));
>      qdev_prop_set_drive_err(card, "drive", blk, &error_fatal);
> +    object_property_set_bool(OBJECT(card), "emmc", emmc, &error_fatal);
>      qdev_realize_and_unref(card, qdev_get_child_bus(DEVICE(sd), "sd-bus"),
>                             &error_fatal);
>  }
> @@ -528,7 +536,6 @@ static void versal_virt_init(MachineState *machine)
>  {
>      VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
>      int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> -    int i;
>
>      /*
>       * If the user provides an Operating System to be loaded, we expect them
> @@ -581,10 +588,9 @@ static void versal_virt_init(MachineState *machine)
>      memory_region_add_subregion_overlap(get_system_memory(),
>                                          0, &s->soc.fpd.apu.mr, 0);
>
> +    sd_plugin_card(&s->soc.pmc.iou.sd[0], drive_get_next(IF_EMMC), true);
>      /* Plugin SD cards.  */
> -    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
> -        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
> -    }
> +    sd_plugin_card(&s->soc.pmc.iou.sd[1], drive_get_next(IF_SD), false);
>
>      s->binfo.ram_size = machine->ram_size;
>      s->binfo.loader_start = 0x0;
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b077716..3498dd9 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -230,9 +230,14 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
>  }
>
>  #define SDHCI_CAPABILITIES  0x280737ec6481 /* Same as on ZynqMP.  */
> +#define SDHCI0_CAPS ((SDHCI_CAPABILITIES & ~(3 << 30)) | \
> +                     (1 << 30))
> +#define SDHCI1_CAPS SDHCI_CAPABILITIES
> +
>  static void versal_create_sds(Versal *s, qemu_irq *pic)
>  {
>      int i;
> +    uint64_t caps[] = {SDHCI0_CAPS, SDHCI1_CAPS};
>
>      for (i = 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
>          DeviceState *dev;
> @@ -244,9 +249,14 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
>
>          object_property_set_uint(OBJECT(dev), "sd-spec-version", 3,
>                                   &error_fatal);
> -        object_property_set_uint(OBJECT(dev), "capareg", SDHCI_CAPABILITIES,
> +        object_property_set_uint(OBJECT(dev), "capareg", caps[i],
>                                   &error_fatal);
> -        object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
> +        /*
> +         * UHS is not applicable for eMMC
> +         */
> +        if (i == 1) {
> +            object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
> +        }
>          sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
>
>          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> --
> 2.7.4
>
>


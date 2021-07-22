Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C23D1FE7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:36:44 +0200 (CEST)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6UCB-0006dz-Ss
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6UBB-0005tU-Ez
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6UB9-0004hU-8c
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626942934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oi77IXZ/MnCBxBP2IgyLv6dHigLO8pt8t/rKpSiNsOs=;
 b=KqO6wV+GdEKy6Dgi3aC3qmVFzSf4v5nHSpgIDTIYkX1y4Tt3q1UABigrzrt4yTzSjqOj4A
 hwNY2l0a8/Q/7viGCv/+Z7e/SLq4aGUufnPKU3ZoW5CJDM1hGkryPmp72QSGxvZGK9yj3/
 KKXTbytqYileb2kb0Nx4r5oojzWBJ3E=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-_e-U4vpsMCqEqhMUWgk9Qg-1; Thu, 22 Jul 2021 04:35:32 -0400
X-MC-Unique: _e-U4vpsMCqEqhMUWgk9Qg-1
Received: by mail-pj1-f71.google.com with SMTP id
 z5-20020a17090a7b85b0290173d3902d78so3684118pjc.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 01:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oi77IXZ/MnCBxBP2IgyLv6dHigLO8pt8t/rKpSiNsOs=;
 b=R3MqQkwBaR3BwXQl8kMek7EIQu4iZE2i/K5qMMOHhZ96zISlASi9zvWZFIjDW+Y3Qt
 p8CobgHS4JtJSLli2nbhmOlg4WOtqoHqF13RrWtaWHF8khShRCIpL5eQm70+m37VKcwU
 Amb3qXbscDTOczSBy0ygWHEElv0zS41r5VEpj7AJnHmGWhErpDBW5khQtZxfV84M5r09
 eMG7y0VVlCUvnJnT/y7ABbYbtfLHeg37CU65Kpll9IUeEYYKzuM0Qpvpkqbu7HtIN22f
 VJWTdd/wWMtq3y5rzUuJQMlYOtrKPdxo06xenpJnlBt0CbU41hCjTtvXLbgNt+mF1wI4
 usRQ==
X-Gm-Message-State: AOAM530jlApwGgBZHHbJ9AONKfRDF/6gMNc1cUes2wFs/osqW8lrCle6
 bvCreFbEePjj2+eLlGOjXuMRj6e5KySKPUaFr+VjDkbxthJIxwM8jPtVAbkoN+724/ITngoV5OF
 +b1KeVmhgxlrMWmU=
X-Received: by 2002:a17:903:2450:b029:12b:30eb:1139 with SMTP id
 l16-20020a1709032450b029012b30eb1139mr30912776pls.21.1626942931627; 
 Thu, 22 Jul 2021 01:35:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGGpGC5UVKiUVXo/QWYvuEzU/6Geh9EipKqqK2Q32SU8TCGmJLBKphdWvbXvVA3x7o4lM5og==
X-Received: by 2002:a17:903:2450:b029:12b:30eb:1139 with SMTP id
 l16-20020a1709032450b029012b30eb1139mr30912750pls.21.1626942931241; 
 Thu, 22 Jul 2021 01:35:31 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u2sm29435754pfh.61.2021.07.22.01.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 01:35:30 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20210721041504.464403-1-bmeng.cn@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <90da3b5f-4aa3-220d-cf39-f048fe18f7dd@redhat.com>
Date: Thu, 22 Jul 2021 16:35:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721041504.464403-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/21 ÏÂÎç12:15, Bin Meng Ð´µÀ:
> From: Christina Wang <christina.wang@windriver.com>
>
> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> the manual and real hardware.
>
> While Linux e1000 driver always writes VET register to 0x8100, it is
> not always the case for everyone. Drivers relying on the reset value
> of VET won't be able to transmit and receive VLAN frames in QEMU.
>
> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v3:
> - add a "init-vet" property for versioned machines
>
>   hw/core/machine.c | 27 +++++++++++++++++++++++++--
>   hw/net/e1000.c    | 26 ++++++++++++++++++--------
>   2 files changed, 43 insertions(+), 10 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 775add0795..29982c1ef1 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,6 +41,7 @@ GlobalProperty hw_compat_6_0[] = {
>       { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>       { "i8042", "extended-state", "false"},
>       { "nvme-ns", "eui64-default", "off"},
> +    { "e1000", "init-vet", "off" },


Doing this for 6.0 is sufficient. See patch 2.


>   };
>   const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
>   
> @@ -49,6 +50,7 @@ GlobalProperty hw_compat_5_2[] = {
>       { "PIIX4_PM", "smm-compat", "on"},
>       { "virtio-blk-device", "report-discard-granularity", "off" },
>       { "virtio-net-pci", "vectors", "3"},
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>   
> @@ -62,6 +64,7 @@ GlobalProperty hw_compat_5_1[] = {
>       { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
>       { "pl011", "migrate-clk", "off" },
>       { "virtio-pci", "x-ats-page-aligned", "off"},
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
>   
> @@ -73,6 +76,7 @@ GlobalProperty hw_compat_5_0[] = {
>       { "vmport", "x-report-vmx-type", "off" },
>       { "vmport", "x-cmds-v2", "off" },
>       { "virtio-device", "x-disable-legacy-check", "true" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
>   
> @@ -89,11 +93,13 @@ GlobalProperty hw_compat_4_2[] = {
>       { "qxl-vga", "revision", "4" },
>       { "fw_cfg", "acpi-mr-restore", "false" },
>       { "virtio-device", "use-disabled-flag", "false" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>   
>   GlobalProperty hw_compat_4_1[] = {
>       { "virtio-pci", "x-pcie-flr-init", "off" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
>   
> @@ -106,6 +112,7 @@ GlobalProperty hw_compat_4_0[] = {
>       { "virtio-device", "use-started", "false" },
>       { "virtio-balloon-device", "qemu-4-0-config-size", "true" },
>       { "pl031", "migrate-tick-offset", "false" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
>   
> @@ -123,10 +130,13 @@ GlobalProperty hw_compat_3_1[] = {
>       { "virtio-blk-device", "write-zeroes", "false" },
>       { "virtio-balloon-device", "qemu-4-0-config-size", "false" },
>       { "pcie-root-port-base", "disable-acs", "true" }, /* Added in 4.1 */
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_3_1_len = G_N_ELEMENTS(hw_compat_3_1);
>   
> -GlobalProperty hw_compat_3_0[] = {};
> +GlobalProperty hw_compat_3_0[] = {
> +    { "e1000", "init-vet", "off" },
> +};
>   const size_t hw_compat_3_0_len = G_N_ELEMENTS(hw_compat_3_0);
>   
>   GlobalProperty hw_compat_2_12[] = {
> @@ -136,6 +146,7 @@ GlobalProperty hw_compat_2_12[] = {
>       { "VGA", "global-vmstate", "true" },
>       { "vmware-svga", "global-vmstate", "true" },
>       { "qxl-vga", "global-vmstate", "true" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_12_len = G_N_ELEMENTS(hw_compat_2_12);
>   
> @@ -144,12 +155,14 @@ GlobalProperty hw_compat_2_11[] = {
>       { "virtio-blk-pci", "vectors", "2" },
>       { "vhost-user-blk-pci", "vectors", "2" },
>       { "e1000", "migrate_tso_props", "off" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_11_len = G_N_ELEMENTS(hw_compat_2_11);
>   
>   GlobalProperty hw_compat_2_10[] = {
>       { "virtio-mouse-device", "wheel-axis", "false" },
>       { "virtio-tablet-device", "wheel-axis", "false" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_10_len = G_N_ELEMENTS(hw_compat_2_10);
>   
> @@ -158,6 +171,7 @@ GlobalProperty hw_compat_2_9[] = {
>       { "intel-iommu", "pt", "off" },
>       { "virtio-net-device", "x-mtu-bypass-backend", "off" },
>       { "pcie-root-port", "x-migrate-msix", "false" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_9_len = G_N_ELEMENTS(hw_compat_2_9);
>   
> @@ -172,6 +186,7 @@ GlobalProperty hw_compat_2_8[] = {
>       { "virtio-pci", "x-pcie-pm-init", "off" },
>       { "cirrus-vga", "vgamem_mb", "8" },
>       { "isa-cirrus-vga", "vgamem_mb", "8" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_8_len = G_N_ELEMENTS(hw_compat_2_8);
>   
> @@ -181,6 +196,7 @@ GlobalProperty hw_compat_2_7[] = {
>       { "ioapic", "version", "0x11" },
>       { "intel-iommu", "x-buggy-eim", "true" },
>       { "virtio-pci", "x-ignore-backend-features", "on" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
>   
> @@ -189,6 +205,7 @@ GlobalProperty hw_compat_2_6[] = {
>       /* Optional because not all virtio-pci devices support legacy mode */
>       { "virtio-pci", "disable-modern", "on",  .optional = true },
>       { "virtio-pci", "disable-legacy", "off", .optional = true },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_6_len = G_N_ELEMENTS(hw_compat_2_6);
>   
> @@ -198,6 +215,7 @@ GlobalProperty hw_compat_2_5[] = {
>       { "pvscsi", "x-disable-pcie", "on" },
>       { "vmxnet3", "x-old-msi-offsets", "on" },
>       { "vmxnet3", "x-disable-pcie", "on" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_5_len = G_N_ELEMENTS(hw_compat_2_5);
>   
> @@ -205,6 +223,7 @@ GlobalProperty hw_compat_2_4[] = {
>       /* Optional because the 'scsi' property is Linux-only */
>       { "virtio-blk-device", "scsi", "true", .optional = true },
>       { "e1000", "extra_mac_registers", "off" },
> +    { "e1000", "init-vet", "off" },
>       { "virtio-pci", "x-disable-pcie", "on" },
>       { "virtio-pci", "migrate-extra", "off" },
>       { "fw_cfg_mem", "dma_enabled", "off" },
> @@ -222,10 +241,13 @@ GlobalProperty hw_compat_2_3[] = {
>       { "migration", "send-configuration", "off" },
>       { "migration", "send-section-footer", "off" },
>       { "migration", "store-global-state", "off" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_3_len = G_N_ELEMENTS(hw_compat_2_3);
>   
> -GlobalProperty hw_compat_2_2[] = {};
> +GlobalProperty hw_compat_2_2[] = {
> +    { "e1000", "init-vet", "off" },
> +};
>   const size_t hw_compat_2_2_len = G_N_ELEMENTS(hw_compat_2_2);
>   
>   GlobalProperty hw_compat_2_1[] = {
> @@ -236,6 +258,7 @@ GlobalProperty hw_compat_2_1[] = {
>       { "usb-mouse", "usb_version", "1" },
>       { "usb-kbd", "usb_version", "1" },
>       { "virtio-pci", "virtio-pci-bus-master-bug-migration", "on" },
> +    { "e1000", "init-vet", "off" },
>   };
>   const size_t hw_compat_2_1_len = G_N_ELEMENTS(hw_compat_2_1);
>   
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index 4f75b44cfc..543c4fbb02 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -29,6 +29,7 @@
>   #include "hw/pci/pci.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
> +#include "net/eth.h"
>   #include "net/net.h"
>   #include "net/checksum.h"
>   #include "sysemu/sysemu.h"
> @@ -130,10 +131,13 @@ struct E1000State_st {
>   #define E1000_FLAG_MIT_BIT 1
>   #define E1000_FLAG_MAC_BIT 2
>   #define E1000_FLAG_TSO_BIT 3
> +#define E1000_FLAG_VET_BIT 4
>   #define E1000_FLAG_AUTONEG (1 << E1000_FLAG_AUTONEG_BIT)
>   #define E1000_FLAG_MIT (1 << E1000_FLAG_MIT_BIT)
>   #define E1000_FLAG_MAC (1 << E1000_FLAG_MAC_BIT)
>   #define E1000_FLAG_TSO (1 << E1000_FLAG_TSO_BIT)
> +#define E1000_FLAG_VET (1 << E1000_FLAG_VET_BIT)
> +
>       uint32_t compat_flags;
>       bool received_tx_tso;
>       bool use_tso_for_migration;
> @@ -141,7 +145,7 @@ struct E1000State_st {
>   };
>   typedef struct E1000State_st E1000State;
>   
> -#define chkflag(x)     (s->compat_flags & E1000_FLAG_##x)
> +#define chkflag(s, x)     (s->compat_flags & E1000_FLAG_##x)
>   
>   struct E1000BaseClass {
>       PCIDeviceClass parent_class;
> @@ -176,7 +180,7 @@ e1000_autoneg_done(E1000State *s)
>   static bool
>   have_autoneg(E1000State *s)
>   {
> -    return chkflag(AUTONEG) && (s->phy_reg[PHY_CTRL] & MII_CR_AUTO_NEG_EN);
> +    return chkflag(s, AUTONEG) && (s->phy_reg[PHY_CTRL] & MII_CR_AUTO_NEG_EN);
>   }
>   
>   static void
> @@ -298,7 +302,7 @@ set_interrupt_cause(E1000State *s, int index, uint32_t val)
>           if (s->mit_timer_on) {
>               return;
>           }
> -        if (chkflag(MIT)) {
> +        if (chkflag(s, MIT)) {
>               /* Compute the next mitigation delay according to pending
>                * interrupts and the current values of RADV (provided
>                * RDTR!=0), TADV and ITR.
> @@ -386,6 +390,10 @@ static void e1000_reset(void *opaque)
>       }
>   
>       e1000x_reset_mac_addr(d->nic, d->mac_reg, macaddr);
> +
> +    if (chkflag(d, VET)) {
> +        d->mac_reg[VET] = ETH_P_VLAN;
> +    }
>   }
>   
>   static void
> @@ -1397,7 +1405,7 @@ static int e1000_pre_save(void *opaque)
>       }
>   
>       /* Decide which set of props to migrate in the main structure */
> -    if (chkflag(TSO) || !s->use_tso_for_migration) {
> +    if (chkflag(s, TSO) || !s->use_tso_for_migration) {
>           /* Either we're migrating with the extra subsection, in which
>            * case the mig_props is always 'props' OR
>            * we've not got the subsection, but 'props' was the last
> @@ -1418,7 +1426,7 @@ static int e1000_post_load(void *opaque, int version_id)
>       E1000State *s = opaque;
>       NetClientState *nc = qemu_get_queue(s->nic);
>   
> -    if (!chkflag(MIT)) {
> +    if (!chkflag(s, MIT)) {
>           s->mac_reg[ITR] = s->mac_reg[RDTR] = s->mac_reg[RADV] =
>               s->mac_reg[TADV] = 0;
>           s->mit_irq_level = false;
> @@ -1461,21 +1469,21 @@ static bool e1000_mit_state_needed(void *opaque)
>   {
>       E1000State *s = opaque;
>   
> -    return chkflag(MIT);
> +    return chkflag(s, MIT);
>   }
>   
>   static bool e1000_full_mac_needed(void *opaque)
>   {
>       E1000State *s = opaque;
>   
> -    return chkflag(MAC);
> +    return chkflag(s, MAC);
>   }
>   
>   static bool e1000_tso_state_needed(void *opaque)
>   {
>       E1000State *s = opaque;
>   
> -    return chkflag(TSO);
> +    return chkflag(s, TSO);
>   }


Let's introduce a e1000_vet_init_need(void *opaque)

Then we don't need to touch the other compatibility flags.

Thanks


>   
>   static const VMStateDescription vmstate_e1000_mit_state = {
> @@ -1737,6 +1745,8 @@ static Property e1000_properties[] = {
>                       compat_flags, E1000_FLAG_MAC_BIT, true),
>       DEFINE_PROP_BIT("migrate_tso_props", E1000State,
>                       compat_flags, E1000_FLAG_TSO_BIT, true),
> +    DEFINE_PROP_BIT("init-vet", E1000State,
> +                    compat_flags, E1000_FLAG_VET_BIT, true),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   



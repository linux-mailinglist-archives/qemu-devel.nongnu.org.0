Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9C4D4119
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 07:24:07 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSCDV-0002WL-Ly
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 01:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nSCBM-0000mj-E3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 01:21:52 -0500
Received: from [2a00:1450:4864:20::632] (port=38822
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nSCBK-00014m-EU
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 01:21:52 -0500
Received: by mail-ej1-x632.google.com with SMTP id r13so9860570ejd.5
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OyKh3YjeKI9RY5E+BkrbWBwn+lV2LmofuZF5Q59mKQs=;
 b=mqHENbMRKas9MJsMNbJYgxWDQ3gUNlX6CXlgdHq0vqsluU4eJgJ/RMkHVCBvD+TjX+
 B8AEjMdjZoQJ8wWttOFZV1LkiWrlpE0/ZrbXxhdT8mB7uBGK8deYM/CxdFKAQCxgLplU
 lvnw7aNVOjNmelVLIcUPxUo+kaOga3pTv4aE/5e/BqcPE0VucdXR5mUQBlRTWTY93x87
 umyyYWcCa5Ae2LV+UgV+1Azh3qCucZmMfx7sdG13AEv861g42qPPeXOpw3hB6KJAyTSg
 m4RDHaIkOlqhas9Xq52GA+m5cxSHP8WrBUunbUghjOekMEqqjhc30O1pwj2if+XQ5Qbs
 OxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OyKh3YjeKI9RY5E+BkrbWBwn+lV2LmofuZF5Q59mKQs=;
 b=IXmf6dVtDa+82nSMEFFtpDXPl8Juyi+eq+5Ejsy7wd4rKwtcwnntVRYLZJN6VbclS0
 EsqNfh35C0FJ3YW1HdCJJYdzlc2ED8WRCf8x+BADZarsBEKHshgV1h1klPd+gReLXd5+
 Lii/pBTowkLJ7nZc0MBcdYPku3o4WgIol/amhY3EOWxRwr6CNYopvSbtcqQ0X7MhJsuN
 REuCVkyYDia1ojxYRPNinICN4aEgXrO72qvYzNPPwmVX+LSZ5IKl9+3+UbmFpBerLHyg
 yH3INq2M82SOA3vCtavAU/C2wNs8sDGZ4IkslQQFcriihFxG4wSzcDpDSkAb76mQgWqv
 2xRQ==
X-Gm-Message-State: AOAM533Lx7hq8LjQtZd9Q2hWbxGqBiZJTopB+9vbE7ZVUQ+REh7X5lkF
 88DZZW8YyAqB1BqfDZkuE9ncHD3nnuoStyt6ULlafQ==
X-Google-Smtp-Source: ABdhPJwj16WBqujy7E7glAxdgEHBiYs+ybagnqeCzo1BnKQtwnUj0ZS36IBhorl9cTyWb2HHDXDiB7OgvKX0R/vPapQ=
X-Received: by 2002:a17:906:3a18:b0:6cd:ba45:995f with SMTP id
 z24-20020a1709063a1800b006cdba45995fmr2944217eje.328.1646893308046; Wed, 09
 Mar 2022 22:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20220228152620.1474806-1-ani@anisinha.ca>
In-Reply-To: <20220228152620.1474806-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 10 Mar 2022 11:51:37 +0530
Message-ID: <CAARzgwxwu1BOFGGOnfxaixrS+WdY57QdiujQgnBj7DxBvEPqNw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/i386/e820: remove legacy reserved entries for e820
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Sergio Lopez <slp@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 8:56 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> e820 reserved entries were used before the dynamic entries with fw config files
> were intoduced into qemu with the following change:
> 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
>
> Identical support was introduced into seabios as well with the following commit:
> ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
>
> Both the above commits are now quite old. Seabios uses fw config files and
> dynamic e820 entries by default and only falls back to using reserved entries
> when it has to work with old qemu (versions earlier than 1.7). Please see
> functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
> FW_CFG_E820_TABLE and associated code. It would be incredibly rare to run the
> latest qemu version with a very old version of seabios that did not support
> fw config files for e820.
>
> As far as I could see, edk2/ovfm never supported reserved entries and uses fw
> config files from the beginning. So there should be no incompatibilities with
> ovfm as well.

Igor, Gerd, as I had replied in the other thread, I am not sure if we
need the compatibility dance in order to do this. I think we can't
carry this legacy stuff on forever.
Please advice.

>
> CC: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/i386/e820_memory_layout.c | 20 +-------------------
>  hw/i386/e820_memory_layout.h |  8 --------
>  hw/i386/fw_cfg.c             |  3 ---
>  hw/i386/fw_cfg.h             |  1 -
>  hw/i386/microvm.c            |  2 --
>  5 files changed, 1 insertion(+), 33 deletions(-)
>
> diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> index bcf9eaf837..06970ac44a 100644
> --- a/hw/i386/e820_memory_layout.c
> +++ b/hw/i386/e820_memory_layout.c
> @@ -11,29 +11,11 @@
>  #include "e820_memory_layout.h"
>
>  static size_t e820_entries;
> -struct e820_table e820_reserve;
>  struct e820_entry *e820_table;
>
>  int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
>  {
> -    int index = le32_to_cpu(e820_reserve.count);
> -    struct e820_entry *entry;
> -
> -    if (type != E820_RAM) {
> -        /* old FW_CFG_E820_TABLE entry -- reservations only */
> -        if (index >= E820_NR_ENTRIES) {
> -            return -EBUSY;
> -        }
> -        entry = &e820_reserve.entry[index++];
> -
> -        entry->address = cpu_to_le64(address);
> -        entry->length = cpu_to_le64(length);
> -        entry->type = cpu_to_le32(type);
> -
> -        e820_reserve.count = cpu_to_le32(index);
> -    }
> -
> -    /* new "etc/e820" file -- include ram too */
> +    /* new "etc/e820" file -- include ram and reserved entries */
>      e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
>      e820_table[e820_entries].address = cpu_to_le64(address);
>      e820_table[e820_entries].length = cpu_to_le64(length);
> diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
> index 2a0ceb8b9c..daf41cc4b4 100644
> --- a/hw/i386/e820_memory_layout.h
> +++ b/hw/i386/e820_memory_layout.h
> @@ -16,20 +16,12 @@
>  #define E820_NVS        4
>  #define E820_UNUSABLE   5
>
> -#define E820_NR_ENTRIES 16
> -
>  struct e820_entry {
>      uint64_t address;
>      uint64_t length;
>      uint32_t type;
>  } QEMU_PACKED __attribute((__aligned__(4)));
>
> -struct e820_table {
> -    uint32_t count;
> -    struct e820_entry entry[E820_NR_ENTRIES];
> -} QEMU_PACKED __attribute((__aligned__(4)));
> -
> -extern struct e820_table e820_reserve;
>  extern struct e820_entry *e820_table;
>
>  int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index a283785a8d..72a42f3c66 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
>          {FW_CFG_ACPI_TABLES, "acpi_tables"},
>          {FW_CFG_SMBIOS_ENTRIES, "smbios_entries"},
>          {FW_CFG_IRQ0_OVERRIDE, "irq0_override"},
> -        {FW_CFG_E820_TABLE, "e820_table"},
>          {FW_CFG_HPET, "hpet"},
>      };
>
> @@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
>  #endif
>      fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
>
> -    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
> -                     &e820_reserve, sizeof(e820_reserve));
>      fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
>                      sizeof(struct e820_entry) * e820_get_num_entries());
>
> diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
> index 275f15c1c5..86ca7c1c0c 100644
> --- a/hw/i386/fw_cfg.h
> +++ b/hw/i386/fw_cfg.h
> @@ -17,7 +17,6 @@
>  #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
>  #define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
>  #define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
> -#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
>  #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
>
>  FWCfgState *fw_cfg_arch_create(MachineState *ms,
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 4b3b1dd262..f2101e7293 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>      fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
>      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
> -    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
> -                     &e820_reserve, sizeof(e820_reserve));
>      fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
>                      sizeof(struct e820_entry) * e820_get_num_entries());
>
> --
> 2.25.1
>


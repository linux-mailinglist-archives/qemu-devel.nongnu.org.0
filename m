Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA285B043D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 14:51:20 +0200 (CEST)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVuWV-0000jj-JL
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 08:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVuTm-00066d-Ty
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 08:48:30 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVuTk-0007BN-Px
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 08:48:30 -0400
Received: by mail-ej1-x631.google.com with SMTP id r17so2716855ejy.9
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 05:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=99cw/N1QcGzkUAAdB/ij1fxcWOhg0FmxFbOI4QmbW6E=;
 b=epHaLHsr+avRgBATvOUaKnPh39UIkbU/IpkUkgpLAMO1zA+AA1P9Cr5C3xvIjuos6S
 AKJ7+GTTZ1HbYgFmKDQSxGP2SrCjKzGvfTLN/qWdVwZyad7Q9VchbNgjUNWwGwNlqLqn
 +LYJ9HV216oliT6zQoju1HudKFUNQIMJ0fALxwto2K8gcGL5tqyWzRQ75QFqT02cGAPf
 yIs/2D/OkThuO/SvjLD3GRJaCuXPNFWekoMfZZp8UgcTiNh/1VhCJemZDRmRCKf1x5xZ
 EKTLfINPWgPN5Uma0PvM60RBZqd3SstfEWNiNWApEylDJWAoXk/D1SQE8v3uHQl/GFWr
 jU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=99cw/N1QcGzkUAAdB/ij1fxcWOhg0FmxFbOI4QmbW6E=;
 b=v/9oWEsTDw2FDouGOHJEOsyS7SuY6BPYkShn8y9VTUlP/jkkQsUgyeER0D2bTaqx6b
 uqyBmRdycQSzzVdjuWu8fzuyLAu39g5XNgHgZPWgqWLaWxdlIiAz4ZsRn8xDPagejZLx
 99Zn+SpiG+paCQCQIyn53VxvtR8rH2pt3V5RRDRwe+6Z5betn1A5ppfZOMkVg7UfK9l7
 K/BLlTCM4wGFG6EPyayZA/XaMH1/N4jcj9IgyZSIrcofAHlp3OehKiptbLHHLatlnaSO
 FFvblbaz6qLkBiinmaxPJgptPGhgRNmjyrua+cl9BBE16WcDWLXn7+t04rqArSHkmxHv
 LExQ==
X-Gm-Message-State: ACgBeo0OkATD7Q2S86/YgP6OMqxP2wrR2kKPMeG9jcoWq83HzOdahSqO
 Z5Nw52cnIwxuHYXKhxLCEgyAZRN/q6ytBq5QBMZwdA==
X-Google-Smtp-Source: AA6agR6UjpN36zQ8hB7gDfo1r0J7Be2qHAUe0GN4diElZkt+XOhYxcttleWkjJIjuTVydaP+oXBTRUtDTtVDpHe+i8o=
X-Received: by 2002:a17:906:9be4:b0:741:480a:387a with SMTP id
 de36-20020a1709069be400b00741480a387amr2172421ejc.147.1662554906728; Wed, 07
 Sep 2022 05:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220831045311.33083-1-ani@anisinha.ca>
In-Reply-To: <20220831045311.33083-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 7 Sep 2022 18:18:15 +0530
Message-ID: <CAARzgwz8vFEs06U--LWuFrXO_oN3beynysedMxpDZ6EFpJDXQg@mail.gmail.com>
Subject: Re: [PATCH REPOST] hw/i386/e820: remove legacy reserved entries for
 e820
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 31, 2022 at 10:23 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> e820 reserved entries were used before the dynamic entries with fw config files
> were intoduced. Please see the following change:
> 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
>
> Identical support was introduced into seabios as well with the following commit:
> ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
>
> Both the above commits are now quite old. QEMU machines 1.7 and newer no longer
> use the reserved entries. Seabios uses fw config files and
> dynamic e820 entries by default and only falls back to using reserved entries
> when it has to work with old qemu (versions earlier than 1.7). Please see
> functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
> FW_CFG_E820_TABLE and associated code now as QEMU 7.0 has deprecated i440fx
> machines 1.7 and older. It would be incredibly rare to run the latest qemu
> version with a very old version of seabios that did not support fw config files
> for e820.
>
> As far as I could see, edk2/ovfm never supported reserved entries and uses fw
> config files from the beginning. So there should be no incompatibilities with
> ovfm as well.
>
> CC: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

michael, please pick this one as well for the next pull. thanks.

> ---
>  hw/i386/e820_memory_layout.c | 20 +-------------------
>  hw/i386/e820_memory_layout.h |  8 --------
>  hw/i386/fw_cfg.c             |  3 ---
>  hw/i386/fw_cfg.h             |  1 -
>  hw/i386/microvm.c            |  2 --
>  5 files changed, 1 insertion(+), 33 deletions(-)
>
> Please see:
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20220420043904.1225153-1-ani@anisinha.ca/
> for the previous post. Now that we are in 7.2 devel cycle, time to push
> this patch.
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
> index 04f93780f9..7c239aa033 100644
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
> index 52cafa003d..a591161c02 100644
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
> 2.34.1
>


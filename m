Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4251958CA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 15:18:51 +0100 (CET)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHpov-0002lK-T2
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 10:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jHpnu-0002Js-IY
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 10:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jHpnq-0004KG-AU
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 10:17:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:54575)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jHpnl-0004Dd-0V
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 10:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585318656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLjDASbEDUzqWF9+JEd8xHxUsDXiuxJlNOmXXAfpuuo=;
 b=Af9cPeUZgJEef0KSKDNLoHW0Bu4qPReojrRs9OK7rPAeM5v6B9Q3bjCeAxporqaB59Zdpe
 PspDMQdfNgCS/bMPmr3p0A45GWMS2lf/v1bK7xVF3TvZNRrQHc9VedLRAZxWcRpPK+t//Z
 HgEhBlkioCc5fk/HCzIYvjsNpQdF8+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424--FBCFGIINWSREW-LEjb45Q-1; Fri, 27 Mar 2020 10:17:32 -0400
X-MC-Unique: -FBCFGIINWSREW-LEjb45Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D5B21005514;
 Fri, 27 Mar 2020 14:17:31 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3992907FF;
 Fri, 27 Mar 2020 14:17:24 +0000 (UTC)
Date: Fri, 27 Mar 2020 15:17:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/6] acpi: split hw/i386/acpi-build.c
Message-ID: <20200327151722.01f6bded@redhat.com>
In-Reply-To: <20200327121111.1530-2-kraxel@redhat.com>
References: <20200327121111.1530-1-kraxel@redhat.com>
 <20200327121111.1530-2-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Mar 2020 13:11:06 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Split hw/i386/acpi-build.c into pieces:
I just suggested slightly different split/generalization on 'microvm: add acpi support' thread

basic idea is to move common arm/pc pieces to hw/acpi/

leave alone acpi_setup() in acpi-build.c as it has too much of legacy/non necessary features
and generalize ARM's acpi_setup() to make it reusable with microvm
(put it somewhere in hw/acpi/)


> 
> acpi-build-internal.h
>   Internal header file for acpi-buid-*.c
> 
> acpi-build-core.c
>   The acpi_setup() function + dependencies.
>   The acpi_build() function simply calls acpi_build_pc() for now,
>   at some point in the future this will dispatch into machine-type
>   specific build functions.
> 
> acpi-build-pc.c
>   The acpi_build_pc() function + dependencies.
>   The bulk of the old acpi-build.c file is here now.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/acpi-build-internal.h             |  35 ++++
>  hw/i386/acpi-build-core.c                 | 191 ++++++++++++++++++++++
>  hw/i386/{acpi-build.c => acpi-build-pc.c} | 175 +-------------------
>  hw/i386/Makefile.objs                     |   3 +-
>  4 files changed, 230 insertions(+), 174 deletions(-)
>  create mode 100644 hw/i386/acpi-build-internal.h
>  create mode 100644 hw/i386/acpi-build-core.c
>  rename hw/i386/{acpi-build.c => acpi-build-pc.c} (94%)
> 
> diff --git a/hw/i386/acpi-build-internal.h b/hw/i386/acpi-build-internal.h
> new file mode 100644
> index 000000000000..5e783d85dde6
> --- /dev/null
> +++ b/hw/i386/acpi-build-internal.h
> @@ -0,0 +1,35 @@
> +
> +#ifndef HW_I386_ACPI_BUILD_INTERNAL_H
> +#define HW_I386_ACPI_BUILD_INTERNAL_H
> +
> +#include "hw/acpi/aml-build.h"
> +
> +/* #define DEBUG_ACPI_BUILD */
> +#ifdef DEBUG_ACPI_BUILD
> +#define ACPI_BUILD_DPRINTF(fmt, ...)        \
> +    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
> +#else
> +#define ACPI_BUILD_DPRINTF(fmt, ...)
> +#endif
> +
> +typedef
> +struct AcpiBuildState {
> +    /* Copy of table in RAM (for patching). */
> +    MemoryRegion *table_mr;
> +    /* Is table patched? */
> +    uint8_t patched;
> +    void *rsdp;
> +    MemoryRegion *rsdp_mr;
> +    MemoryRegion *linker_mr;
> +} AcpiBuildState;
> +
> +typedef struct FwCfgTPMConfig {
> +    uint32_t tpmppi_address;
> +    uint8_t tpm_version;
> +    uint8_t tpmppi_version;
> +} QEMU_PACKED FwCfgTPMConfig;

Is it going to be used by microvm?
(at that rate of migrating features we are going to make full PC out of it :) )

> +
> +/* acpi-build-pc.c */
> +void acpi_build_pc(AcpiBuildTables *tables, MachineState *machine);
> +
> +#endif
> diff --git a/hw/i386/acpi-build-core.c b/hw/i386/acpi-build-core.c
> new file mode 100644
> index 000000000000..f0968b4bb594
> --- /dev/null
> +++ b/hw/i386/acpi-build-core.c
> @@ -0,0 +1,191 @@
> +/* Support for generating ACPI tables and passing them to Guests
> + *
> + * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
> + * Copyright (C) 2006 Fabrice Bellard
> + * Copyright (C) 2013 Red Hat Inc
> + *
> + * Author: Michael S. Tsirkin <mst@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +
> +#include "exec/memory.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "hw/acpi/tpm.h"
> +#include "hw/acpi/utils.h"
> +#include "hw/acpi/vmgenid.h"
> +#include "hw/boards.h"
> +#include "hw/i386/pc.h"
> +#include "migration/vmstate.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/tpm.h"
> +
> +#include "acpi-build.h"
> +#include "acpi-build-internal.h"
> +
> +static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> +{
> +    acpi_build_pc(tables, machine);
> +}
> +
> +static void acpi_ram_update(MemoryRegion *mr, GArray *data)
> +{
> +    uint32_t size = acpi_data_len(data);
> +
> +    /* Make sure RAM size is correct - in case it got changed e.g. by migration */
> +    memory_region_ram_resize(mr, size, &error_abort);
> +
> +    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
> +    memory_region_set_dirty(mr, 0, size);
> +}
> +
> +static void acpi_build_update(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    AcpiBuildTables tables;
> +
> +    /* No state to update or already patched? Nothing to do. */
> +    if (!build_state || build_state->patched) {
> +        return;
> +    }
> +    build_state->patched = 1;
> +
> +    acpi_build_tables_init(&tables);
> +
> +    acpi_build(&tables, MACHINE(qdev_get_machine()));
> +
> +    acpi_ram_update(build_state->table_mr, tables.table_data);
> +
> +    if (build_state->rsdp) {
> +        memcpy(build_state->rsdp, tables.rsdp->data, acpi_data_len(tables.rsdp));
> +    } else {
> +        acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> +    }
> +
> +    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
> +    acpi_build_tables_cleanup(&tables, true);
> +}
> +
> +static void acpi_build_reset(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    build_state->patched = 0;
> +}
> +
> +static const VMStateDescription vmstate_acpi_build = {
> +    .name = "acpi_build",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(patched, AcpiBuildState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +void acpi_setup(void)
> +{
> +    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    AcpiBuildTables tables;
> +    AcpiBuildState *build_state;
> +    Object *vmgenid_dev;
> +    TPMIf *tpm;
> +    static FwCfgTPMConfig tpm_config;
> +
> +    if (!x86ms->fw_cfg) {
> +        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
> +        return;
> +    }
> +
> +    if (!pcms->acpi_build_enabled) {
> +        ACPI_BUILD_DPRINTF("ACPI build disabled. Bailing out.\n");
> +        return;
> +    }
> +
> +    if (!acpi_enabled) {
> +        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
> +        return;
> +    }
> +
> +    build_state = g_malloc0(sizeof *build_state);
> +
> +    acpi_build_tables_init(&tables);
> +    acpi_build(&tables, MACHINE(pcms));
> +
> +    /* Now expose it all to Guest */
> +    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
> +                                              build_state, tables.table_data,
> +                                              ACPI_BUILD_TABLE_FILE,
> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
> +    assert(build_state->table_mr != NULL);
> +
> +    build_state->linker_mr =
> +        acpi_add_rom_blob(acpi_build_update, build_state,
> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
> +
> +    fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
> +                    tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> +
> +    tpm = tpm_find();
> +    if (tpm && object_property_get_bool(OBJECT(tpm), "ppi", &error_abort)) {
> +        tpm_config = (FwCfgTPMConfig) {
> +            .tpmppi_address = cpu_to_le32(TPM_PPI_ADDR_BASE),
> +            .tpm_version = tpm_get_version(tpm),
> +            .tpmppi_version = TPM_PPI_VERSION_1_30
> +        };
> +        fw_cfg_add_file(x86ms->fw_cfg, "etc/tpm/config",
> +                        &tpm_config, sizeof tpm_config);
> +    }
> +
> +    vmgenid_dev = find_vmgenid_dev();
> +    if (vmgenid_dev) {
> +        vmgenid_add_fw_cfg(VMGENID(vmgenid_dev), x86ms->fw_cfg,
> +                           tables.vmgenid);
> +    }
> +
> +    if (!pcmc->rsdp_in_ram) {
> +        /*
> +         * Keep for compatibility with old machine types.
> +         * Though RSDP is small, its contents isn't immutable, so
> +         * we'll update it along with the rest of tables on guest access.
> +         */
> +        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
> +
> +        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
> +        fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
> +                                 acpi_build_update, NULL, build_state,
> +                                 build_state->rsdp, rsdp_size, true);
> +        build_state->rsdp_mr = NULL;
> +    } else {
> +        build_state->rsdp = NULL;
> +        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
> +                                                 build_state, tables.rsdp,
> +                                                 ACPI_BUILD_RSDP_FILE, 0);
> +    }
> +
> +    qemu_register_reset(acpi_build_reset, build_state);
> +    acpi_build_reset(build_state);
> +    vmstate_register(NULL, 0, &vmstate_acpi_build, build_state);
> +
> +    /* Cleanup tables but don't free the memory: we track it
> +     * in build_state.
> +     */
> +    acpi_build_tables_cleanup(&tables, false);
> +}
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build-pc.c
> similarity index 94%
> rename from hw/i386/acpi-build.c
> rename to hw/i386/acpi-build-pc.c
> index 9a19c14e661b..cad44160ff3a 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build-pc.c
> @@ -24,6 +24,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qmp/qnum.h"
>  #include "acpi-build.h"
> +#include "acpi-build-internal.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/error-report.h"
>  #include "hw/pci/pci.h"
> @@ -81,14 +82,6 @@
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> -/* #define DEBUG_ACPI_BUILD */
> -#ifdef DEBUG_ACPI_BUILD
> -#define ACPI_BUILD_DPRINTF(fmt, ...)        \
> -    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
> -#else
> -#define ACPI_BUILD_DPRINTF(fmt, ...)
> -#endif
> -
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
> @@ -120,12 +113,6 @@ typedef struct AcpiBuildPciBusHotplugState {
>      bool pcihp_bridge_en;
>  } AcpiBuildPciBusHotplugState;
>  
> -typedef struct FwCfgTPMConfig {
> -    uint32_t tpmppi_address;
> -    uint8_t tpm_version;
> -    uint8_t tpmppi_version;
> -} QEMU_PACKED FwCfgTPMConfig;
> -
>  static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg);
>  
>  static void init_common_fadt_data(MachineState *ms, Object *o,
> @@ -2710,17 +2697,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
>                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>  }
>  
> -typedef
> -struct AcpiBuildState {
> -    /* Copy of table in RAM (for patching). */
> -    MemoryRegion *table_mr;
> -    /* Is table patched? */
> -    uint8_t patched;
> -    void *rsdp;
> -    MemoryRegion *rsdp_mr;
> -    MemoryRegion *linker_mr;
> -} AcpiBuildState;
> -
>  static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>  {
>      Object *pci_host;
> @@ -2746,8 +2722,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      return true;
>  }
>  
> -static
> -void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> +void acpi_build_pc(AcpiBuildTables *tables, MachineState *machine)
>  {
>      PCMachineState *pcms = PC_MACHINE(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> @@ -2948,149 +2923,3 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
>  }
> -
> -static void acpi_ram_update(MemoryRegion *mr, GArray *data)
> -{
> -    uint32_t size = acpi_data_len(data);
> -
> -    /* Make sure RAM size is correct - in case it got changed e.g. by migration */
> -    memory_region_ram_resize(mr, size, &error_abort);
> -
> -    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
> -    memory_region_set_dirty(mr, 0, size);
> -}
> -
> -static void acpi_build_update(void *build_opaque)
> -{
> -    AcpiBuildState *build_state = build_opaque;
> -    AcpiBuildTables tables;
> -
> -    /* No state to update or already patched? Nothing to do. */
> -    if (!build_state || build_state->patched) {
> -        return;
> -    }
> -    build_state->patched = 1;
> -
> -    acpi_build_tables_init(&tables);
> -
> -    acpi_build(&tables, MACHINE(qdev_get_machine()));
> -
> -    acpi_ram_update(build_state->table_mr, tables.table_data);
> -
> -    if (build_state->rsdp) {
> -        memcpy(build_state->rsdp, tables.rsdp->data, acpi_data_len(tables.rsdp));
> -    } else {
> -        acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> -    }
> -
> -    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
> -    acpi_build_tables_cleanup(&tables, true);
> -}
> -
> -static void acpi_build_reset(void *build_opaque)
> -{
> -    AcpiBuildState *build_state = build_opaque;
> -    build_state->patched = 0;
> -}
> -
> -static const VMStateDescription vmstate_acpi_build = {
> -    .name = "acpi_build",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_UINT8(patched, AcpiBuildState),
> -        VMSTATE_END_OF_LIST()
> -    },
> -};
> -
> -void acpi_setup(void)
> -{
> -    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
> -    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> -    X86MachineState *x86ms = X86_MACHINE(pcms);
> -    AcpiBuildTables tables;
> -    AcpiBuildState *build_state;
> -    Object *vmgenid_dev;
> -    TPMIf *tpm;
> -    static FwCfgTPMConfig tpm_config;
> -
> -    if (!x86ms->fw_cfg) {
> -        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
> -        return;
> -    }
> -
> -    if (!pcms->acpi_build_enabled) {
> -        ACPI_BUILD_DPRINTF("ACPI build disabled. Bailing out.\n");
> -        return;
> -    }
> -
> -    if (!acpi_enabled) {
> -        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
> -        return;
> -    }
> -
> -    build_state = g_malloc0(sizeof *build_state);
> -
> -    acpi_build_tables_init(&tables);
> -    acpi_build(&tables, MACHINE(pcms));
> -
> -    /* Now expose it all to Guest */
> -    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
> -                                              build_state, tables.table_data,
> -                                              ACPI_BUILD_TABLE_FILE,
> -                                              ACPI_BUILD_TABLE_MAX_SIZE);
> -    assert(build_state->table_mr != NULL);
> -
> -    build_state->linker_mr =
> -        acpi_add_rom_blob(acpi_build_update, build_state,
> -                          tables.linker->cmd_blob, "etc/table-loader", 0);
> -
> -    fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
> -                    tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> -
> -    tpm = tpm_find();
> -    if (tpm && object_property_get_bool(OBJECT(tpm), "ppi", &error_abort)) {
> -        tpm_config = (FwCfgTPMConfig) {
> -            .tpmppi_address = cpu_to_le32(TPM_PPI_ADDR_BASE),
> -            .tpm_version = tpm_get_version(tpm),
> -            .tpmppi_version = TPM_PPI_VERSION_1_30
> -        };
> -        fw_cfg_add_file(x86ms->fw_cfg, "etc/tpm/config",
> -                        &tpm_config, sizeof tpm_config);
> -    }
> -
> -    vmgenid_dev = find_vmgenid_dev();
> -    if (vmgenid_dev) {
> -        vmgenid_add_fw_cfg(VMGENID(vmgenid_dev), x86ms->fw_cfg,
> -                           tables.vmgenid);
> -    }
> -
> -    if (!pcmc->rsdp_in_ram) {
> -        /*
> -         * Keep for compatibility with old machine types.
> -         * Though RSDP is small, its contents isn't immutable, so
> -         * we'll update it along with the rest of tables on guest access.
> -         */
> -        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
> -
> -        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
> -        fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
> -                                 acpi_build_update, NULL, build_state,
> -                                 build_state->rsdp, rsdp_size, true);
> -        build_state->rsdp_mr = NULL;
> -    } else {
> -        build_state->rsdp = NULL;
> -        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
> -                                                 build_state, tables.rsdp,
> -                                                 ACPI_BUILD_RSDP_FILE, 0);
> -    }
> -
> -    qemu_register_reset(acpi_build_reset, build_state);
> -    acpi_build_reset(build_state);
> -    vmstate_register(NULL, 0, &vmstate_acpi_build, build_state);
> -
> -    /* Cleanup tables but don't free the memory: we track it
> -     * in build_state.
> -     */
> -    acpi_build_tables_cleanup(&tables, false);
> -}
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index 8ce1b265335b..e777f1ac9fc3 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -16,4 +16,5 @@ obj-$(CONFIG_VMMOUSE) += vmmouse.o
>  obj-$(CONFIG_PC) += port92.o
>  
>  obj-y += kvmvapic.o
> -obj-$(CONFIG_PC) += acpi-build.o
> +obj-$(CONFIG_PC) += acpi-build-core.o
> +obj-$(CONFIG_PC) += acpi-build-pc.o



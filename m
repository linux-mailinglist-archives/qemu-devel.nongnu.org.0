Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A382D451
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 05:38:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVpQF-00016v-Di
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 23:38:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVpP9-0000m8-PJ
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVpP7-0005Wy-AV
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:37:31 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hVpP7-0005Lm-53
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:37:29 -0400
Received: by mail-qk1-f193.google.com with SMTP id b18so530690qkc.9
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 20:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Frp9O6ViuwEiiHHsCKfDQx9F8k6pchl2la4j/2oanio=;
	b=ZACJFmJKwEgringWCE9J9AzrEJcEzDdE85/qJTEgwixwhPTmRZ8d9TZdon+Kv4hNsg
	BibdRoT/NWgwVCTu6N8pesgw5jrjgUG6qpOkgE303JV+b9uw1i2xgY9RJTSeitrguMbE
	LVdgK0i8+RmChRi4uIUoBI0rkCNCNjCxmoSU9FvuqPSNf8no9J9Mlzp8x3eXQBzAEnFw
	W4+52ECnQX9SCC1I/zeMwXscxSEiV1CsNobQJ+UsTjy+UVM3j0yhVNXkUz4YK4la2ry+
	r/u7JuB8sQXbWjRV5F3rjWxBwUYmetvFYRwtO6gmjidcvgW81ilY1qega78JrcX8C6b+
	djFg==
X-Gm-Message-State: APjAAAVNtEWDNcJFnC0ShJxVOys6Xzg66cHXI2V5aGEUbRRhYNc+Ku39
	rihXXxez0z3/XVEtFAuHsim4hw==
X-Google-Smtp-Source: APXvYqw13QqZINX0vqsTqczbexpwS7dgj5SQjPTvHl27mzVKF4YP76F71uOIj0PAcDcqekaAAFgoYg==
X-Received: by 2002:a37:8d84:: with SMTP id p126mr54782552qkd.72.1559101045729;
	Tue, 28 May 2019 20:37:25 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	k65sm4862077qkf.46.2019.05.28.20.37.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 28 May 2019 20:37:24 -0700 (PDT)
Date: Tue, 28 May 2019 23:37:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <20190528233131-mutt-send-email-mst@kernel.org>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
	<1557832703-42620-8-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557832703-42620-8-git-send-email-gengdongjiu@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.193
Subject: Re: [Qemu-devel] [PATCH v17 07/10] ACPI: Add APEI GHES table
 generation support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
	mtosatti@redhat.com, qemu-devel@nongnu.org, linuxarm@huawei.com,
	shannon.zhaosl@gmail.com, zhengxiang9@huawei.com,
	qemu-arm@nongnu.org, james.morse@arm.com,
	jonathan.cameron@huawei.com, imammedo@redhat.com,
	pbonzini@redhat.com, xuwei5@huawei.com, lersek@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 14, 2019 at 04:18:20AM -0700, Dongjiu Geng wrote:
> This implements APEI GHES Table generation via fw_cfg blobs.
> Now it only support GPIO-Signal and ARMv8 SEA two types of GHESv2 error
> source. Afterwards, we can extend the supported types if needed. For the
> CPER section type, currently it is memory section because kernel
> mainly wants userspace to handle the memory errors.
> 
> This patch follows the spec ACPI 6.2 to build the Hardware Error Source
> table, for the detailed information, please refer to document:
> docs/specs/acpi_hest_ghes.txt
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/acpi/Kconfig                 |   4 +
>  hw/acpi/Makefile.objs           |   1 +
>  hw/acpi/acpi_ghes.c             | 171 ++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/aml-build.c             |   2 +
>  hw/arm/virt-acpi-build.c        |  12 +++
>  include/hw/acpi/acpi_ghes.h     |  79 +++++++++++++++++++
>  include/hw/acpi/aml-build.h     |   1 +
>  8 files changed, 271 insertions(+)
>  create mode 100644 hw/acpi/acpi_ghes.c
>  create mode 100644 include/hw/acpi/acpi_ghes.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 613d19a..7b33ae9 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -160,3 +160,4 @@ CONFIG_MUSICPAL=y
>  
>  # for realview and versatilepb
>  CONFIG_LSI_SCSI_PCI=y
> +CONFIG_ACPI_APEI=y
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index eca3bee..5228a4b 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -23,6 +23,10 @@ config ACPI_NVDIMM
>      bool
>      depends on ACPI
>  
> +config ACPI_APEI
> +    bool
> +    depends on ACPI
> +
>  config ACPI_VMGENID
>      bool
>      default y
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 2d46e37..5099ada 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
>  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
>  common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
>  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
> +common-obj-$(CONFIG_ACPI_APEI) += acpi_ghes.o
>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>  
>  common-obj-y += acpi_interface.o
> diff --git a/hw/acpi/acpi_ghes.c b/hw/acpi/acpi_ghes.c
> new file mode 100644
> index 0000000..d03e797
> --- /dev/null
> +++ b/hw/acpi/acpi_ghes.c
> @@ -0,0 +1,171 @@
> +/* Support for generating APEI tables and record CPER for Guests
> + *
> + * Copyright (C) 2017 HuaWei Corporation.
> + *
> + * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/acpi_ghes.h"
> +#include "hw/nvram/fw_cfg.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/error-report.h"
> +
> +/* Build table for the hardware error fw_cfg blob */
> +void build_hardware_error_table(GArray *hardware_errors, BIOSLinker *linker)
> +{
> +    int i;
> +
> +    /*
> +     * | +--------------------------+
> +     * | |    error_block_address   |
> +     * | |      ..........          |
> +     * | +--------------------------+
> +     * | |    read_ack_register     |
> +     * | |     ...........          |
> +     * | +--------------------------+
> +     * | |  Error Status Data Block |
> +     * | |      ........            |
> +     * | +--------------------------+
> +     */
> +
> +    /* Build error_block_address */
> +    build_append_int_noprefix((void *)hardware_errors, 0,
> +                    GHES_ADDRESS_SIZE * ACPI_HEST_ERROR_SOURCE_COUNT);

Why are you casting everything to void *?

C type safety goes out the window ...

> +
> +    /* Build read_ack_register */
> +    for (i = 0; i < ACPI_HEST_ERROR_SOURCE_COUNT; i++)
> +        /* Initialize the value of read_ack_register to 1, so GHES can be
> +         * writeable in the first time
> +         */
> +        build_append_int_noprefix((void *)hardware_errors, 1, GHES_ADDRESS_SIZE);
> +
> +     /* Build Error Status Data Block */
> +    build_append_int_noprefix((void *)hardware_errors, 0,
> +                    GHES_MAX_RAW_DATA_LENGTH * ACPI_HEST_ERROR_SOURCE_COUNT);
> +
> +    /* Allocate guest memory for the hardware error fw_cfg blob */
> +    bios_linker_loader_alloc(linker, GHES_ERRORS_FW_CFG_FILE, hardware_errors,
> +                            1, false);
> +}
> +
> +/* Build Hardware Error Source Table */
> +void build_apei_hest(GArray *table_data, GArray *hardware_errors,
> +                                            BIOSLinker *linker)
> +{
> +    uint32_t i, error_status_block_offset, length = table_data->len;
> +
> +    /* Reserve Hardware Error Source Table header size */
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    /* Set the error source counts */
> +    build_append_int_noprefix(table_data, ACPI_HEST_ERROR_SOURCE_COUNT, 4);
> +
> +    for (i = 0; i < ACPI_HEST_ERROR_SOURCE_COUNT; i++) {
> +        /* Generic Hardware Error Source version 2(GHESv2 - Type 10)
> +         */
> +        build_append_int_noprefix(table_data,
> +            ACPI_HEST_SOURCE_GENERIC_ERROR_V2, 2); /* type */
> +        build_append_int_noprefix(table_data, cpu_to_le16(i), 2); /* source id */
> +        build_append_int_noprefix(table_data, 0xffff, 2); /* related source id */
> +        build_append_int_noprefix(table_data, 0, 1); /* flags */
> +
> +        build_append_int_noprefix(table_data, 1, 1); /* enabled */
> +
> +        /* Number of Records To Pre-allocate */
> +        build_append_int_noprefix(table_data, 1, 4);
> +        /* Max Sections Per Record */
> +        build_append_int_noprefix(table_data, 1, 4);
> +        /* Max Raw Data Length */
> +        build_append_int_noprefix(table_data, GHES_MAX_RAW_DATA_LENGTH, 4);
> +
> +        /* Build error status address*/
> +        build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0, 4 /* QWord access */, 0);
> +        bios_linker_loader_add_pointer(linker,
> +            ACPI_BUILD_TABLE_FILE, ERROR_STATUS_ADDRESS_OFFSET(length, i),
> +            GHES_ADDRESS_SIZE, GHES_ERRORS_FW_CFG_FILE, i * GHES_ADDRESS_SIZE);
> +
> +        /* Build Hardware Error Notification
> +         * Now only enable GPIO-Signal and ARMv8 SEA notification types
> +         */
> +        if (i == 0) {
> +            build_append_ghes_notify(table_data, ACPI_HEST_NOTIFY_GPIO, 28,
> +                                     0, 0, 0, 0, 0, 0, 0);
> +        } else if (i == 1) {
> +            build_append_ghes_notify(table_data, ACPI_HEST_NOTIFY_SEA, 28, 0,
> +                                     0, 0, 0, 0, 0, 0);
> +        }
> +
> +        /* Error Status Block Length */
> +        build_append_int_noprefix(table_data,
> +            cpu_to_le32(GHES_MAX_RAW_DATA_LENGTH), 4);
> +
> +        /* Build Read ACK register
> +         * ACPI 6.1/6.2: 18.3.2.8 Generic Hardware Error Source
> +         * version 2 (GHESv2 - Type 10)
> +         */
> +        build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0, 4 /* QWord access */, 0);
> +        bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> +            READ_ACK_REGISTER_ADDRESS_OFFSET(length, i), GHES_ADDRESS_SIZE,
> +            GHES_ERRORS_FW_CFG_FILE,
> +            (ACPI_HEST_ERROR_SOURCE_COUNT + i) * GHES_ADDRESS_SIZE);
> +
> +        /* Build Read Ack Preserve and Read Ack Writer */
> +        build_append_int_noprefix(table_data, cpu_to_le64(ReadAckPreserve), 8);
> +        build_append_int_noprefix(table_data, cpu_to_le64(ReadAckWrite), 8);
> +    }
> +
> +    /* Generic Error Status Block offset in the hardware error fw_cfg blob */
> +    error_status_block_offset = GHES_ADDRESS_SIZE * 2 *
> +                                ACPI_HEST_ERROR_SOURCE_COUNT;
> +
> +    for (i = 0; i < ACPI_HEST_ERROR_SOURCE_COUNT; i++)
> +        /* Patch address of Error Status Data Block into
> +         * the error_block_address of hardware_errors fw_cfg blob
> +         */
> +        bios_linker_loader_add_pointer(linker,
> +            GHES_ERRORS_FW_CFG_FILE, GHES_ADDRESS_SIZE * i, GHES_ADDRESS_SIZE,
> +            GHES_ERRORS_FW_CFG_FILE,
> +            error_status_block_offset + i * GHES_MAX_RAW_DATA_LENGTH);
> +
> +    /* write address of hardware_errors fw_cfg blob into the
> +     * hardware_errors_addr fw_cfg blob.
> +     */
> +    bios_linker_loader_write_pointer(linker, GHES_DATA_ADDR_FW_CFG_FILE,
> +        0, GHES_ADDRESS_SIZE, GHES_ERRORS_FW_CFG_FILE, 0);
> +
> +    build_header(linker, table_data,
> +        (void *)(table_data->data + length), "HEST",
> +        table_data->len - length, 1, NULL, "GHES");
> +}
> +
> +static GhesState ges;
> +void ghes_add_fw_cfg(FWCfgState *s, GArray *hardware_error)
> +{
> +
> +    size_t size = 2 * GHES_ADDRESS_SIZE + GHES_MAX_RAW_DATA_LENGTH;
> +    size_t request_block_size = ACPI_HEST_ERROR_SOURCE_COUNT * size;
> +
> +    /* Create a read-only fw_cfg file for GHES */
> +    fw_cfg_add_file(s, GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
> +                    request_block_size);
> +
> +    /* Create a read-write fw_cfg file for Address */
> +    fw_cfg_add_file_callback(s, GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL, NULL,
> +        &ges.ghes_addr_le, sizeof(ges.ghes_addr_le), false);
> +}
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ce90970..3f2b84f 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1645,6 +1645,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
>      tables->table_data = g_array_new(false, true /* clear */, 1);
>      tables->tcpalog = g_array_new(false, true /* clear */, 1);
>      tables->vmgenid = g_array_new(false, true /* clear */, 1);
> +    tables->hardware_errors = g_array_new(false, true /* clear */, 1);
>      tables->linker = bios_linker_loader_init();
>  }
>  
> @@ -1655,6 +1656,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
>      g_array_free(tables->table_data, true);
>      g_array_free(tables->tcpalog, mfre);
>      g_array_free(tables->vmgenid, mfre);
> +    g_array_free(tables->hardware_errors, mfre);
>  }
>  
>  /*
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bf9c0bc..54f4ba5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -45,6 +45,7 @@
>  #include "hw/arm/virt.h"
>  #include "sysemu/numa.h"
>  #include "kvm_arm.h"
> +#include "hw/acpi/acpi_ghes.h"
>  
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> @@ -808,6 +809,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    if (!vmc->no_ras) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_hardware_error_table(tables->hardware_errors, tables->linker);
> +        build_apei_hest(tables_blob, tables->hardware_errors, tables->linker);
> +    }
> +
>      if (nb_numa_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_srat(tables_blob, tables->linker, vms);
> @@ -901,6 +908,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
>  
>  void virt_acpi_setup(VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      AcpiBuildTables tables;
>      AcpiBuildState *build_state;
>  
> @@ -932,6 +940,10 @@ void virt_acpi_setup(VirtMachineState *vms)
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>  
> +    if (!vmc->no_ras) {
> +        ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
> +    }
> +
>      build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>                                                ACPI_BUILD_RSDP_FILE, 0);
>  
> diff --git a/include/hw/acpi/acpi_ghes.h b/include/hw/acpi/acpi_ghes.h
> new file mode 100644
> index 0000000..38fd87c
> --- /dev/null
> +++ b/include/hw/acpi/acpi_ghes.h
> @@ -0,0 +1,79 @@
> +/* Support for generating APEI tables and record CPER for Guests
> + *
> + * Copyright (C) 2017 HuaWei Corporation.
> + *
> + * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
> +#ifndef ACPI_GHES_H
> +#define ACPI_GHES_H
> +
> +#include "hw/acpi/bios-linker-loader.h"
> +
> +#define GHES_ERRORS_FW_CFG_FILE         "etc/hardware_errors"
> +#define GHES_DATA_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> +
> +/* The size of Address field in Generic Address Structure,
> + * ACPI 2.0/3.0: 5.2.3.1 Generic Address Structure.
> + */
> +#define GHES_ADDRESS_SIZE           8
> +
> +#define GHES_DATA_LENGTH            72
> +#define GHES_CPER_LENGTH            80


Don't see above two used anywhere in this patch.
Pls move to patch that uses them.

> +
> +#define ReadAckPreserve             0xfffffffe
> +#define ReadAckWrite                0x1

Why are these macros not all upper case?
I suggest just open-coding at use point
and adding a comment:

        build_append_int_noprefix(table_data, cpu_to_le64(0xfffffffe), 8); /* ReadAckPreserve */
        build_append_int_noprefix(table_data, cpu_to_le64(0x1), 8); /* ReadAckWrite */

> +
> +/* The max size in bytes for one error block */
> +#define GHES_MAX_RAW_DATA_LENGTH        0x1000
> +/* Now only have GPIO-Signal and ARMv8 SEA notification types error sources
> + */
> +#define ACPI_HEST_ERROR_SOURCE_COUNT    2


Please prefix everything with acpi_ghes_

Or move to acpi/ghes.h and then prefix with ghes_ 

> +
> +/*
> + * | +--------------------------+ 0
> + * | |        Header            |
> + * | +--------------------------+ 40---+-
> + * | | .................        |      |
> + * | | error_status_address-----+ 60   |
> + * | | .................        |      |
> + * | | read_ack_register--------+ 104  92
> + * | | read_ack_preserve        |      |
> + * | | read_ack_write           |      |
> + * + +--------------------------+ 132--+-
> + *
> + * From above GHES definition, the error status address offset is 60;
> + * the Read ack register offset is 104, the whole size of GHESv2 is 92
> + */
> +
> +/* The error status address offset in GHES */
> +#define ERROR_STATUS_ADDRESS_OFFSET(start_addr, n)     (start_addr + 60 + \
> +                    offsetof(struct AcpiGenericAddress, address) + n * 92)
> +
> +/* The read Ack register offset in GHES */
> +#define READ_ACK_REGISTER_ADDRESS_OFFSET(start_addr, n) (start_addr + 104 + \
> +                    offsetof(struct AcpiGenericAddress, address) + n * 92)
> +
> +typedef struct GhesState {
> +    uint64_t ghes_addr_le;
> +} GhesState;
> +
> +void build_apei_hest(GArray *table_data, GArray *hardware_error,
> +                     BIOSLinker *linker);
> +
> +void build_hardware_error_table(GArray *hardware_errors, BIOSLinker *linker);
> +void ghes_add_fw_cfg(FWCfgState *s, GArray *hardware_errors);
> +#endif
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1ec7e1b..78c0252 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -220,6 +220,7 @@ struct AcpiBuildTables {
>      GArray *rsdp;
>      GArray *tcpalog;
>      GArray *vmgenid;
> +    GArray *hardware_errors;
>      BIOSLinker *linker;
>  } AcpiBuildTables;
>  
> -- 
> 1.8.3.1


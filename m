Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391533E5728
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:38:09 +0200 (CEST)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDOD1-0006mN-Q5
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mDOBn-0005uO-Rb; Tue, 10 Aug 2021 05:36:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mDOBl-0002Id-4F; Tue, 10 Aug 2021 05:36:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B9776108C;
 Tue, 10 Aug 2021 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628588206;
 bh=tS60AhbzNxEfqhjc5GDGvaVPboYSLi6Vsq8VfQJtXhk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YqCT47/UITPrLvlFC7KmQ2Hi4XFGK0VUCS0UykJU1xYtHQt9Oc1H7ZRZkHD1PVV+j
 S9nuLmwL0FPEbTTJNMFLgA/r2x9rDUaI7mvwp7dAMvtfHd0SNaEsMTQJLNPCCicWnP
 X2a4RwNv+FKKQiknGmVjRJv41uRk96DETgsQSISpJ/izwMuFw4uPmTuy+6VZIiSpp8
 ULYgj5SlcoR4aY1456lR2XBxtXX1esjnqoSOHlPU7VYz0Q1/Bb0Ni02kNe8OCYVCI2
 BdjNh+3ZgmPZHcMzV0mtxol0Mz4bwmx5TnQQcYpA7NEBFfK7yVJYxnj6OzRD0ESksI
 8vxtrA0xr3kLg==
Received: by mail-ot1-f51.google.com with SMTP id
 r19-20020a0568301353b029050aa53c3801so4339822otq.2; 
 Tue, 10 Aug 2021 02:36:46 -0700 (PDT)
X-Gm-Message-State: AOAM531e+bDNS5JyYZ7LWp1BNWlDiTwiD+fp8Rt6eyXxZbmFmJUumXB2
 bEVdQ5/gVc+LKIp/tlTnxI8+jjxG97KE+VChnmE=
X-Google-Smtp-Source: ABdhPJzEnldI54Hr07jXk8wLK+ECuRgeWmUJtsW6moIKFep2YhvhnHCOo2Fp+4t4S5VR+mmLqU+J0SQ55J6fvNsCtF0=
X-Received: by 2002:a9d:5c2:: with SMTP id 60mr19564426otd.77.1628588205523;
 Tue, 10 Aug 2021 02:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210810083057.99651-1-eric.auger@redhat.com>
In-Reply-To: <20210810083057.99651-1-eric.auger@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 10 Aug 2021 11:36:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
Message-ID: <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 10:31, Eric Auger <eric.auger@redhat.com> wrote:
>
> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
> this latter allows to describe one or more debug ports.
>
> Generate an DBG2 table featuring a single debug port, the PL011.
>
> The DBG2 specification can be found at:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
>

Have the legal issues around this table been resolved in the mean
time? Also, any clue why this table is mandatory to begin with? The
SBBR has been very trigger happy lately with making things mandatory
that aren't truly required from a functional perspective.


> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> Tested by comparing the content with the table generated
> by EDK2 along with the SBSA-REF machine (code generated by
> DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).
>
> I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
> bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
> dword access. Also the name exposed by acpica tools is different:
> 'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
> ---
>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
>  include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
>  2 files changed, 126 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82..35f27b41df 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>
> +#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
> +
> +/* DBG2 */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> +    struct AcpiGenericAddress *base_address;
> +    int dbg2_start = table_data->len;
> +    AcpiDbg2Device *dbg2dev;
> +    char name[] = "COM0";
> +    AcpiDbg2Table *dbg2;
> +    uint32_t *addr_size;
> +    uint8_t *namespace;
> +
> +    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
> +    dbg2->info_offset = sizeof *dbg2;
> +    dbg2->info_count = 1;
> +
> +    /* debug device info structure */
> +
> +    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
> +
> +    dbg2dev->revision = 0;
> +    namespace_length = sizeof name;
> +    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
> +                      4 + namespace_length;
> +    dbg2dev->register_count = 1;
> +
> +    addr_offset = sizeof *dbg2dev;
> +    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
> +    namespace_offset = addrsize_offset + 4;
> +
> +    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
> +    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
> +    dbg2dev->oem_data_length = cpu_to_le16(0);
> +    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
> +    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
> +    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
> +
> +    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
> +    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
> +
> +    /*
> +     * variable length content:
> +     * BaseAddressRegister[1]
> +     * AddressSize[1]
> +     * NamespaceString[1]
> +     */
> +
> +    base_address = acpi_data_push(table_data,
> +                                  sizeof(struct AcpiGenericAddress));
> +
> +    base_address->space_id = AML_SYSTEM_MEMORY;
> +    base_address->bit_width = 8;
> +    base_address->bit_offset = 0;
> +    base_address->access_width = 1;
> +    base_address->address = cpu_to_le64(uart_memmap->base);
> +
> +    addr_size = acpi_data_push(table_data, sizeof *addr_size);
> +    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
> +
> +    namespace = acpi_data_push(table_data, namespace_length);
> +    memcpy(namespace, name, namespace_length);
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + dbg2_start), "DBG2",
> +                 table_data->len - dbg2_start, 3, vms->oem_id,
> +                 vms->oem_table_id);
> +}
> +
>  /* MADT */
>  static void
>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>
> @@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index cf9f44299c..bdb2ebed2c 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -618,4 +618,54 @@ struct AcpiIortRC {
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
>
> +/* DBG2 */
> +
> +/* Types for port_type field above */
> +
> +#define ACPI_DBG2_SERIAL_PORT       0x8000
> +#define ACPI_DBG2_1394_PORT         0x8001
> +#define ACPI_DBG2_USB_PORT          0x8002
> +#define ACPI_DBG2_NET_PORT          0x8003
> +
> +/* Subtypes for port_subtype field above */
> +
> +#define ACPI_DBG2_16550_COMPATIBLE  0x0000
> +#define ACPI_DBG2_16550_SUBSET      0x0001
> +#define ACPI_DBG2_ARM_PL011         0x0003
> +#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
> +#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
> +#define ACPI_DBG2_ARM_DCC           0x000F
> +#define ACPI_DBG2_BCM2835           0x0010
> +
> +#define ACPI_DBG2_1394_STANDARD     0x0000
> +
> +#define ACPI_DBG2_USB_XHCI          0x0000
> +#define ACPI_DBG2_USB_EHCI          0x0001
> +
> +/* Debug Device Information Subtable */
> +
> +struct AcpiDbg2Device {
> +    uint8_t  revision;
> +    uint16_t length;
> +    uint8_t  register_count; /* Number of base_address registers */
> +    uint16_t namepath_length;
> +    uint16_t namepath_offset;
> +    uint16_t oem_data_length;
> +    uint16_t oem_data_offset;
> +    uint16_t port_type;
> +    uint16_t port_subtype;
> +    uint8_t  reserved[2];
> +    uint16_t base_address_offset;
> +    uint16_t address_size_offset;
> +}  QEMU_PACKED;
> +typedef struct AcpiDbg2Device AcpiDbg2Device;
> +
> +struct AcpiDbg2Table {
> +    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
> +    uint32_t info_offset; /* offset to the first debug struct */
> +    uint32_t info_count;  /* number of debug device info struct entries */
> +    uint8_t  dbg2_device_info[];
> +} QEMU_PACKED;
> +typedef struct AcpiDbg2Table AcpiDbg2Table;
> +
>  #endif
> --
> 2.26.3
>


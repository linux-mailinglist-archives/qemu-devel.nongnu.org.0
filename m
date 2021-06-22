Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8BD3B0919
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:30:42 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviML-0000dj-Aq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lviLK-0008NC-3d
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lviLF-0001Qh-8D
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624375771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zMC2ll6EGL+3s9bvOUHfxe0aldtzFWgvLmL7M7awnA=;
 b=L2ZnoZ8/aur2pmm4xdw5hBqmKnTkUTOhzksB+kuxHTw0eQDlrOsjgADgSgDO/rIKP8j0HS
 Sp4kjG/5a7P0hiUIEM9+/1HleXW5ejsoW7wFHB44l8SyhgTK9c1Xr4E34zTXPII/9p96aP
 J19I3cPP4byaiSQ2+9tov3ckdSP3ruM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-8Tf5zqCwONS5IAA4AIf1NA-1; Tue, 22 Jun 2021 11:29:21 -0400
X-MC-Unique: 8Tf5zqCwONS5IAA4AIf1NA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD41824F8D;
 Tue, 22 Jun 2021 15:29:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B95A25B826;
 Tue, 22 Jun 2021 15:29:15 +0000 (UTC)
Date: Tue, 22 Jun 2021 17:29:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v4 3/6] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210622172914.089275d4@redhat.com>
In-Reply-To: <1623436283-20213-4-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
 <1623436283-20213-4-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Jun 2021 14:31:20 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change implements the support for the ACPI ERST feature[1,2].
> 
> To utilize ACPI ERST, a memory-backend-file object and acpi-erst
> device must be created, for example:
> 
>  qemu ...
>  -object memory-backend-file,id=erstram,mem-path=acpi-erst.backing,
>   size=0x10000,shared=on
>  -device acpi-erst,memdev=erstram,bus=pcie.0
> 
> For proper operation, the ACPI ERST device needs a memory-backend-file
> object with the following parameters mem-path, size, and shared.
> 
>  - id: The id of the memory-backend-file object is used to associate
>    this memory with the acpi-erst device.
> 
>  - size: The size of the ACPI ERST backing storage. This parameter is
>    required.
>  - mem-path: The location of the ACPI ERST backing storage file. This
>    parameter is also required.
> 
>  - shared: The shared=on parameter is required so that updates to the
>    ERST back store are written to the file immediately as well. Without
>    it, updates the the backing file are unpredictable and may not
>    properly persist (eg. if qemu should crash).
> 
> The ACPI ERST device is a simple PCI device, and requires these two
> parameters:
> 
>  - memdev: Is the object id of the memory-backend-file.
> 
>  - bus: The name of the pci bus to which to connect.

isn't it picked automatically for you if omitted?

> 
> This change also includes erst.c in the build of general ACPI support.
> 
> [1] "Advanced Configuration and Power Interface Specification",
>     version 6.2, May 2017.
>     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
for specifications it's usually sufficient to point out its name and revision,
that provides enough info to find document.
(as links tend to go stale)

> 
> [2] "Unified Extensible Firmware Interface Specification",
>     version 2.8, March 2019.
>     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c      | 880 ++++++++++++++++++++++++++++++++++++++++++++++++++++

To simplify review, please split patch in 2 parts at least,
  1: hw (device implementation)
  2: ACPI tables

Also spec (ERST) is rather (maybe intentionally) vague on specifics,
so it would be better that before a patch that implements hw part
were a doc patch describing concrete implementation. As model
you can use docs/specs/acpi_hest_ghes.rst or other docs/specs/acpi_* files.
I'd start posting/discussing that spec within these thread
to avoid spamming list until doc is settled up.

It shall describe ABI exposed to guest (mapping of MMIO regions)
and what is actually supported/implemented. It would be good
if it would give general understanding how new interface is
supposed to work. Maybe describe backed file layout.

Seem more comments below, mostly ACPI parts and
I just skimmed through MMIO registers handling and will leave it
out until there is a doc describing implementation.

>  hw/acpi/meson.build |   1 +
>  2 files changed, 881 insertions(+)
>  create mode 100644 hw/acpi/erst.c
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> new file mode 100644
> index 0000000..1a72fad
> --- /dev/null
> +++ b/hw/acpi/erst.c
> @@ -0,0 +1,880 @@
> +/*
> + * ACPI Error Record Serialization Table, ERST, Implementation
> + *
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * See ACPI specification,
> + * "ACPI Platform Error Interfaces" : "Error Serialization"
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>
> + */
> +
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-core.h"
> +#include "exec/memory.h"
> +#include "qom/object.h"
> +#include "hw/pci/pci.h"
> +#include "qom/object_interfaces.h"
> +#include "qemu/error-report.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/hostmem.h"
> +#include "hw/acpi/erst.h"
> +


> +#ifdef _ERST_DEBUG
> +#define erst_debug(fmt, ...) \
> +    do { fprintf(stderr, fmt, ## __VA_ARGS__); fflush(stderr); } while (0)
> +#else
> +#define erst_debug(fmt, ...) do { } while (0)
> +#endif
see docs/devel/tracing.rst for how to do tracing with current QEMU


> +/* See UEFI spec, Appendix N Common Platform Error Record */
spec should include revision,
see comment above acpi_ghes_build_append_mem_cper()


> +/* UEFI CPER allows for an OSPM book keeping area in the record */
not sure what, it's about references to spec please.


> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
> +#define UEFI_CPER_SIZE_OFFSET 20U
> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
> +#define IS_UEFI_CPER_RECORD(ptr) \
> +    (((ptr)[0] == 'C') && \
> +     ((ptr)[1] == 'P') && \
> +     ((ptr)[2] == 'E') && \
> +     ((ptr)[3] == 'R'))
> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
> +
> +#define ERST_INVALID_RECORD_ID (~0UL)
> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
> +#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
> +#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
> +
> +/*
> + * As ERST_IOMEM_SIZE is used to map the ERST into the guest,
> + * it should/must be an integer multiple of PAGE_SIZE.
> + * NOTE that any change to this value will make any pre-
> + * existing backing files, not of the same ERST_IOMEM_SIZE,
> + * unusable to the guest.
> + */
> +#define ERST_IOMEM_SIZE (2UL * 4096)
comment probably should say, why it must be PAGE_SIZE ans 2x at that?

> +
> +/*
> + * This implementation is an ACTION (cmd) and VALUE (data)
> + * interface consisting of just two 64-bit registers.
> + */
> +#define ERST_REG_LEN (2UL * sizeof(uint64_t))
> +
> +/*
> + * The space not utilized by the register interface is the
> + * buffer for exchanging ERST record contents.
> + */
> +#define ERST_RECORD_SIZE (ERST_IOMEM_SIZE - ERST_REG_LEN)
> +
> +/*
> + * Mode to be used for backing file
> + */
> +#define ACPIERST(obj) \
> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
> +#define ACPIERST_CLASS(oc) \
> +    OBJECT_CLASS_CHECK(ERSTDeviceStateClass, (oc), TYPE_ACPI_ERST)
> +#define ACPIERST_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(ERSTDeviceStateClass, (obj), TYPE_ACPI_ERST)
> +
> +typedef struct {
> +    PCIDevice parent_obj;
> +    HostMemoryBackend *hostmem;
> +
> +    MemoryRegion iomem;
> +    uint32_t prop_size;
> +    hwaddr prop_base;
> +
> +    uint8_t operation;
> +    uint8_t busy_status;
> +    uint8_t command_status;
> +    uint32_t record_offset;
> +    uint32_t record_count;
> +    uint64_t reg_action;
> +    uint64_t reg_value;
> +    uint64_t record_identifier;
> +
> +    unsigned next_record_index;
> +    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest */
> +    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation buffer */
> +
> +} ERSTDeviceState;
> +
> +static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
> +{
> +    /* Read an nvram entry into tmp_record */
> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> +    off_t offset = (index * ERST_RECORD_SIZE);
> +
> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
> +        MemoryRegion *mr;
> +        mr = host_memory_backend_get_memory(s->hostmem);
> +        if (mr) {
> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(mr);
> +            memcpy(s->tmp_record, p + offset, ERST_RECORD_SIZE);
> +            rc = ACPI_ERST_STATUS_SUCCESS;
> +        }
> +    }
> +    return rc;
> +}
> +
> +static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned index)
> +{
> +    /* Write entry in tmp_record into nvram, and backing file */
> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> +    off_t offset = (index * ERST_RECORD_SIZE);
> +
> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
> +        MemoryRegion *mr;
> +        mr = host_memory_backend_get_memory(s->hostmem);
> +        if (mr) {
> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(mr);
> +            memcpy(p + offset, s->tmp_record, ERST_RECORD_SIZE);
> +            rc = ACPI_ERST_STATUS_SUCCESS;
> +        }
> +    }
> +    return rc;
> +}
> +
> +static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
> +    uint64_t record_identifier, bool *record_found, bool alloc_for_write)
> +{
> +    int rc = -1;
> +    int empty_index = -1;
> +    int index = 0;
> +    unsigned rrc;
> +
> +    *record_found = 0;
> +
> +    do {
> +        rrc = copy_from_nvram_by_index(s, (unsigned)index);
reading from backing file was necessary when you used file API
directly. However with memory mapped file, shouldn't it be possible
to lookup in corresponding memory region directly without need-less
copying?

> +        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
> +            uint64_t this_identifier;
> +            this_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
> +            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
> +                (this_identifier == record_identifier)) {
> +                rc = index;
> +                *record_found = 1;
> +                break;
> +            }
> +            if ((this_identifier == ERST_INVALID_RECORD_ID) &&
> +                (empty_index < 0)) {
> +                empty_index = index; /* first available for write */
> +            }
> +        }
> +        ++index;
> +    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
> +
> +    /* Record not found, allocate for writing */
> +    if ((rc < 0) && alloc_for_write) {
> +        rc = empty_index;
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned clear_erst_record(ERSTDeviceState *s)
> +{
> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> +    bool record_found;
> +    int index;
> +
> +    index = lookup_erst_record_by_identifier(s,
> +        s->record_identifier, &record_found, 0);
> +    if (record_found) {
> +        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
> +        rc = copy_to_nvram_by_index(s, (unsigned)index);
> +        if (rc == ACPI_ERST_STATUS_SUCCESS) {
> +            s->record_count -= 1;
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned write_erst_record(ERSTDeviceState *s)
> +{
> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> +
> +    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
> +        uint64_t record_identifier;
> +        uint8_t *record = &s->record[s->record_offset];
> +        bool record_found;
> +        int index;
> +
> +        record_identifier = (s->record_identifier == ERST_INVALID_RECORD_ID)
> +            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
> +
> +        index = lookup_erst_record_by_identifier(s,
> +            record_identifier, &record_found, 1);
> +        if (index < 0) {
> +            rc = ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
> +        } else {
> +            if (0 != s->record_offset) {
> +                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offset],
> +                    0xFF, s->record_offset);
> +            }
> +            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_offset);
> +            rc = copy_to_nvram_by_index(s, (unsigned)index);
> +            if (rc == ACPI_ERST_STATUS_SUCCESS) {
> +                if (!record_found) { /* not overwriting existing record */
> +                    s->record_count += 1; /* writing new record */
> +                }
> +            }
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned next_erst_record(ERSTDeviceState *s,
> +    uint64_t *record_identifier)
> +{
> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> +    unsigned index;
> +    unsigned rrc;
> +
> +    *record_identifier = ERST_INVALID_RECORD_ID;
> +
> +    index = s->next_record_index;
> +    do {
> +        rrc = copy_from_nvram_by_index(s, (unsigned)index);
> +        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
> +            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
> +                s->next_record_index = index + 1; /* where to start next time */
> +                *record_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
> +                rc = ACPI_ERST_STATUS_SUCCESS;
> +                break;
> +            }
> +            ++index;
> +        } else {
> +            if (s->next_record_index == 0) {
> +                rc = ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
> +            }
> +            s->next_record_index = 0; /* at end, reset */
> +        }
> +    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
> +
> +    return rc;
> +}
> +
> +static unsigned read_erst_record(ERSTDeviceState *s)
> +{
> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> +    bool record_found;
> +    int index;
> +
> +    index = lookup_erst_record_by_identifier(s,
> +        s->record_identifier, &record_found, 0);
> +    if (record_found) {
> +        rc = copy_from_nvram_by_index(s, (unsigned)index);
> +        if (rc == ACPI_ERST_STATUS_SUCCESS) {
> +            if (s->record_offset < ERST_RECORD_SIZE) {
> +                memcpy(&s->record[s->record_offset], s->tmp_record,
> +                    ERST_RECORD_SIZE - s->record_offset);
> +            }
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned get_erst_record_count(ERSTDeviceState *s)
> +{
> +    /* Compute record_count */
> +    unsigned index = 0;
> +
> +    s->record_count = 0;
> +    while (copy_from_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
> +        uint8_t *ptr = &s->tmp_record[0];
> +        uint64_t record_identifier = THE_UEFI_CPER_RECORD_ID(ptr);
> +        if (IS_UEFI_CPER_RECORD(ptr) &&
> +            (ERST_INVALID_RECORD_ID != record_identifier)) {
> +            s->record_count += 1;
> +        }
> +        ++index;
> +    }
> +    return s->record_count;
> +}
> +
> +static uint64_t erst_rd_reg64(hwaddr addr,
> +    uint64_t reg, unsigned size)
> +{
> +    uint64_t rdval;
> +    uint64_t mask;
> +    unsigned shift;
> +
> +    if (size == sizeof(uint64_t)) {
> +        /* 64b access */
> +        mask = 0xFFFFFFFFFFFFFFFFUL;
> +        shift = 0;
> +    } else {
> +        /* 32b access */
> +        mask = 0x00000000FFFFFFFFUL;
> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
> +    }
> +
> +    rdval = reg;
> +    rdval >>= shift;
> +    rdval &= mask;
> +
> +    return rdval;
> +}
> +
> +static uint64_t erst_wr_reg64(hwaddr addr,
> +    uint64_t reg, uint64_t val, unsigned size)
> +{
> +    uint64_t wrval;
> +    uint64_t mask;
> +    unsigned shift;
> +
> +    if (size == sizeof(uint64_t)) {
> +        /* 64b access */
> +        mask = 0xFFFFFFFFFFFFFFFFUL;
> +        shift = 0;
> +    } else {
> +        /* 32b access */
> +        mask = 0x00000000FFFFFFFFUL;
> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
> +    }
> +
> +    val &= mask;
> +    val <<= shift;
> +    mask <<= shift;
> +    wrval = reg;
> +    wrval &= ~mask;
> +    wrval |= val;
> +
> +    return wrval;
> +}
> +
> +static void erst_write(void *opaque, hwaddr addr,
> +    uint64_t val, unsigned size)
> +{
> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> +
> +    if (addr < ERST_REG_LEN) {
> +        /*
> +         * NOTE: All actions/operations/side effects happen on the WRITE,
> +         * by design. The READs simply return the reg_value contents.
> +         */
> +        erst_debug("ERST write %016lx: val %016lx sz %u\n", addr, val, size);
> +        /* The REGISTER region */
> +        switch (addr) {
> +        case ERST_CSR_VALUE + 0:
> +        case ERST_CSR_VALUE + 4:
> +            s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
> +            break;
> +        case ERST_CSR_ACTION + 0:
> +/*      case ERST_CSR_ACTION+4: as coded, not really a 64b register */
> +            switch (val) {
> +            case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +            case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +            case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +            case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +            case ACPI_ERST_ACTION_END_OPERATION:
> +                s->operation = val;
> +                break;
> +            case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> +                s->record_offset = s->reg_value;
> +                break;
> +            case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> +                if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
> +                    s->busy_status = 1;
> +                    switch (s->operation) {
> +                    case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +                        s->command_status = write_erst_record(s);
> +                        break;
> +                    case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +                        s->command_status = read_erst_record(s);
> +                        break;
> +                    case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +                        s->command_status = clear_erst_record(s);
> +                        break;
> +                    case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +                        s->command_status = ACPI_ERST_STATUS_SUCCESS;
> +                        break;
> +                    case ACPI_ERST_ACTION_END_OPERATION:
> +                        s->command_status = ACPI_ERST_STATUS_SUCCESS;
> +                        break;
> +                    default:
> +                        s->command_status = ACPI_ERST_STATUS_FAILED;
> +                        break;
> +                    }
> +                    s->record_identifier = ERST_INVALID_RECORD_ID;
> +                    s->busy_status = 0;
> +                }
> +                break;
> +            case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> +                s->reg_value = s->busy_status;
> +                break;
> +            case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> +                s->reg_value = s->command_status;
> +                break;
> +            case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> +                s->command_status = next_erst_record(s, &s->reg_value);
> +                break;
> +            case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> +                s->record_identifier = s->reg_value;
> +                break;
> +            case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> +                s->reg_value = s->record_count;
> +                break;
> +            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> +                s->reg_value = s->prop_base + ERST_REG_LEN;
> +                break;
> +            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> +                s->reg_value = ERST_RECORD_SIZE;
> +                break;
> +            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> +                s->reg_value = 0; /* correct/intended value */
> +                break;
> +            case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> +                /*
> +                 * 100UL is max, 10UL is nominal
> +                 */
> +                s->reg_value = ((100UL << 32) | (10UL << 0));
> +                break;
> +            case ACPI_ERST_ACTION_RESERVED:
> +            default:
> +                /*
> +                 * NOP
> +                 */
> +                break;
> +            }
> +            break;
> +        default:
> +            /*
> +             * All other register writes are NO-OPs
> +             */
> +            break;
> +        }
> +    } else {
> +        /* The RECORD region */
> +        unsigned offset = addr - ERST_REG_LEN;
> +        uint8_t *ptr = &s->record[offset];
> +        switch (size) {
> +        default:
> +        case sizeof(uint8_t):
> +            *(uint8_t *)ptr = (uint8_t)val;
> +            break;
> +        case sizeof(uint16_t):
> +            *(uint16_t *)ptr = (uint16_t)val;
> +            break;
> +        case sizeof(uint32_t):
> +            *(uint32_t *)ptr = (uint32_t)val;
> +            break;
> +        case sizeof(uint64_t):
> +            *(uint64_t *)ptr = (uint64_t)val;
> +            break;
> +        }
> +    }
> +}
> +
> +static uint64_t erst_read(void *opaque, hwaddr addr,
> +                                unsigned size)
> +{
> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> +    uint64_t val = 0;
> +
> +    if (addr < ERST_REG_LEN) {
> +        switch (addr) {
> +        case ERST_CSR_ACTION + 0:
> +        case ERST_CSR_ACTION + 4:
> +            val = erst_rd_reg64(addr, s->reg_action, size);
> +            break;
> +        case ERST_CSR_VALUE + 0:
> +        case ERST_CSR_VALUE + 4:
> +            val = erst_rd_reg64(addr, s->reg_value, size);
> +            break;
> +        default:
> +            break;
> +        }
> +    } else {
> +        /*
> +         * The RECORD region
> +         */
> +        uint8_t *ptr = &s->record[addr - ERST_REG_LEN];
> +        switch (size) {
> +        default:
> +        case sizeof(uint8_t):
> +            val = *(uint8_t *)ptr;
> +            break;
> +        case sizeof(uint16_t):
> +            val = *(uint16_t *)ptr;
> +            break;
> +        case sizeof(uint32_t):
> +            val = *(uint32_t *)ptr;
> +            break;
> +        case sizeof(uint64_t):
> +            val = *(uint64_t *)ptr;
> +            break;
> +        }
> +    }
> +    erst_debug("ERST read  %016lx: val %016lx sz %u\n", addr, val, size);
> +    return val;
> +}
> +

spec comment with the earliest revision where this is defined
and chapter/table reference  should be here, for example see
build_append_gas()

> +static size_t build_erst_action(GArray *table_data,
> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t width,
> +    uint64_t address,
> +    uint64_t value,
> +    uint64_t mask)
> +{
> +    /* See ACPI spec, Error Serialization */
preferred comment style for table elements could be found
in build_amd_iommu(), field name in comment should be copied
as is from spec so it would be easier to find it in spec.

if hard-coded or one off values are used to fill table entries
it's better to use them as is instead of using defines or some other indirection.
That way it's easier to compare entries with spec tables side by side
and one doesn't have to chase jump around code to find out
actually used value.

> +    uint8_t access_width = 0;
> +    build_append_int_noprefix(table_data, serialization_action, 1);
> +    build_append_int_noprefix(table_data, instruction         , 1);
> +    build_append_int_noprefix(table_data, flags               , 1);
> +    build_append_int_noprefix(table_data, 0                   , 1);

there is build_append_gas/build_append_gas_from_struct so use that
instead of re implementing it.
I'd probably use build_append_gas_from_struct() and pass address
structure as parameter to build_erst_action.

> +    /* GAS space_id */
> +    build_append_int_noprefix(table_data, AML_SYSTEM_MEMORY   , 1);
> +    /* GAS bit_width */
> +    build_append_int_noprefix(table_data, width               , 1);
> +    /* GAS bit_offset */
> +    build_append_int_noprefix(table_data, 0                   , 1);
> +    /* GAS access_width */
> +    switch (width) {
> +    case 8:
> +        access_width = 1;
> +        break;
> +    case 16:
> +        access_width = 2;
> +        break;
> +    case 32:
> +        access_width = 3;
> +        break;
> +    case 64:
> +        access_width = 4;
> +        break;
> +    default:
> +        access_width = 0;
> +        break;
> +    }
> +    build_append_int_noprefix(table_data, access_width        , 1);
> +    /* GAS address */
> +    build_append_int_noprefix(table_data, address, 8);
> +    /* value */
> +    build_append_int_noprefix(table_data, value  , 8);
> +    /* mask */
> +    build_append_int_noprefix(table_data, mask   , 8);
> +
> +    return 1;
> +}
> +
> +static const MemoryRegionOps erst_rw_ops = {
> +    .read = erst_read,
> +    .write = erst_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +void build_erst(GArray *table_data, BIOSLinker *linker,
> +    const char *oem_id, const char *oem_table_id)
> +{
> +    unsigned action, insns = 0;
> +    unsigned erst_start = table_data->len;
> +    unsigned iec_offset = 0;
> +    Object *obj;
> +    hwaddr base = 0x0UL;
> +
> +    obj = object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
> +    if (obj) {
move this check up the stack to the caller 

> +        pcibus_t addr = pci_get_bar_addr(PCI_DEVICE(obj), 0);
> +        ACPIERST(obj)->prop_base = base = (hwaddr)addr;
> +        erst_debug("ERST PCI BAR 0: %016llx\n", (unsigned long long)addr);
> +    } else {
> +        return;
> +    }
> +
> +    /* See ACPI spec, Error Serialization */
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    /* serialization_header_length */
> +    build_append_int_noprefix(table_data, 48, 4);
> +    /* reserved */
> +    build_append_int_noprefix(table_data,  0, 4);
> +    iec_offset = table_data->len;
> +    /* instruction_entry_count (placeholder) */
> +    build_append_int_noprefix(table_data,  0, 4);
> +
> +#define BEA(I, F, W, ADDR, VAL, MASK) \
> +    build_erst_action(table_data, action, \
> +        ACPI_ERST_INST_##I, F, W, base + ADDR, VAL, MASK)
> +#define MASK8  0x00000000000000FFUL
> +#define MASK16 0x000000000000FFFFUL
> +#define MASK32 0x00000000FFFFFFFFUL
> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> +
> +    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
> +        switch (action) {
> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);

I'd use build_erst_action() directly instead of hiding it behind BEA

> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_END_OPERATION:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> +            insns += BEA(WRITE_REGISTER      , 0, 32,
> +                ERST_CSR_VALUE , 0, MASK32);
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER_VALUE , 0, 32,
> +                ERST_CSR_VALUE, 0x01, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 32,
> +                ERST_CSR_VALUE, 0, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK64);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> +            insns += BEA(WRITE_REGISTER      , 0, 64,
> +                ERST_CSR_VALUE , 0, MASK64);
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 32,
> +                ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_RESERVED:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK64);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 32,
> +                ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> +            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns += BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK64);
> +        default:
> +            insns += BEA(NOOP, 0, 0, 0, action, 0);
> +            break;
> +        }
> +    }
> +
> +    /* acpi_data_push() within BEA() can result in new GArray pointer */
> +    *(uint32_t *)(table_data->data + iec_offset) = cpu_to_le32(insns);
can 'insns' be calculated in advance?

I'd try to avoid pointer arithmetic and use build_append_int_noprefix()
instead it position it supposed to be.

> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + erst_start),
> +                 "ERST", table_data->len - erst_start,
> +                 1, oem_id, oem_table_id);
> +}
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +static int erst_post_load(void *opaque, int version_id)
> +{
> +    erst_debug("+erst_post_load(%d)\n", version_id);
> +    /*
> +     * Ensure nvram persists into backing file.
> +     * The vmstate_register_ram_global() puts the memory in
> +     * migration stream, where it is written back to the memory
> +     * upon reaching the destination, which causes the backing
> +     * file to be updated (with shared=on).
> +     */
> +    erst_debug("-erst_post_load()\n");
> +    return 0;
> +}

drop it, since it does nothing 

> +
> +static const VMStateDescription erst_vmstate  = {
> +    .name = "acpi-erst",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .post_load = erst_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(operation, ERSTDeviceState),
> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
> +        VMSTATE_UINT32(record_count, ERSTDeviceState),
> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),

> +        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
> +        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZE),
if you expose hostmem memory region to guest directly, these
will be not necessary. (for details see below)

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
> +{
> +    ERSTDeviceState *s = ACPIERST(pci_dev);
> +    unsigned index = 0;
> +
> +    erst_debug("+erst_realizefn()\n");
> +    if (!s->hostmem) {
> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
> +        return;
> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
> +        error_setg(errp, "can't use already busy memdev: %s",
> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
> +        return;
> +    }
you can cache memory region here instead of calling
host_memory_backend_get_memory() every time you need access it.
It aren't going to change during device life cycle.

> +
> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
> +    s->prop_size = object_property_get_int(OBJECT(s->hostmem), "size", &error_fatal);
> +
> +    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
> +    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);

also check that hostmem.shared=on and bail out with error if it's not.

> +    /*
> +     * MemoryBackend initializes contents to zero, but we actually
> +     * want contents initialized to 0xFF, ERST_INVALID_RECORD_ID.
> +     */
> +    if (copy_from_nvram_by_index(s, 0) == ACPI_ERST_STATUS_SUCCESS) {
> +        if (s->tmp_record[0] == 0x00) {
> +            memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
> +            index = 0;
> +            while (copy_to_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
> +                ++index;
> +            }
> +        }
> +    }
> +
> +    /* Initialize record_count */
> +    get_erst_record_count(s);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_rw_ops, s,
> +                          TYPE_ACPI_ERST, ERST_IOMEM_SIZE);
> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);

also I see you are copying records a lot (which in some places could use in-place
access instead of copying), which were partly (originally) dictated
by storage not being accessible to guest (since you used file API to read /store
records). i.e.  variants in spec that mention storage types other than
non-volatile RAM.

However there spec mentions non-volatile RAM storage as well, where records
copying is not necessary.
To go this route you can expose 2 BARs to guest:
 1. MMIO BAR with control registers
 2. RAM BAR through which you expose hostmem memory region directly to guest
    so it writes records directly into it and you won't have to copy them
    back and forth. From guest point of view this region will serve as
    nvram, with all guest writes automatically ending up in the attached
    backing storage.

this should simplify MMIO part quite a bit as you won't need to marshal
records themselves threw slow IO interface and should simplify actions as well.

> +    vmstate_register_ram_global(host_memory_backend_get_memory(s->hostmem));
> +
> +    erst_debug("size %x\n", s->prop_size);
> +
> +    erst_debug("-erst_realizefn()\n");
> +}
> +
> +static void erst_reset(DeviceState *dev)
> +{
> +    ERSTDeviceState *s = ACPIERST(dev);
> +
> +    erst_debug("+erst_reset(%p) %d\n", s, s->record_count);
> +    s->operation = 0;
> +    s->busy_status = 0;
> +    s->command_status = ACPI_ERST_STATUS_SUCCESS;
> +    /* indicate empty/no-more until further notice */
> +    s->record_identifier = ERST_INVALID_RECORD_ID;
> +    s->record_offset = 0;
> +    s->next_record_index = 0;
> +    /* NOTE: record_count and nvram are initialized elsewhere */
> +    erst_debug("-erst_reset()\n");
> +}
> +
> +static Property erst_properties[] = {
> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void erst_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    erst_debug("+erst_class_init()\n");
> +    k->realize = erst_realizefn;
> +    k->vendor_id = 0x1337;
> +    k->device_id = 0x0001;
> +    k->revision = 0x00;
> +    k->class_id = PCI_CLASS_OTHERS;
> +    dc->reset = erst_reset;
> +    dc->vmsd = &erst_vmstate;
> +    dc->user_creatable = true;
> +    device_class_set_props(dc, erst_properties);
> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    erst_debug("-erst_class_init()\n");
> +}
> +
> +static const TypeInfo erst_type_info = {
> +    .name          = TYPE_ACPI_ERST,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .class_init    = erst_class_init,
> +    .instance_size = sizeof(ERSTDeviceState),
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
why it's necessary?

> +        { }
> +    }
> +};
> +
> +static void erst_register_types(void)
> +{
> +    type_register_static(&erst_type_info);
> +}
> +
> +type_init(erst_register_types)
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index dd69577..262a8ee 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -4,6 +4,7 @@ acpi_ss.add(files(
>    'aml-build.c',
>    'bios-linker-loader.c',
>    'utils.c',
> +  'erst.c',
>  ))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280223CF977
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:19:02 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oiD-00082G-6V
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5oga-0006Jb-9w
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5ogV-00024x-2P
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626783434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bo15Sz/Qjox2mC42guuYCEQEel4Ul/jBkLYJPvMTo/4=;
 b=Vny8z+YalLHd/lLdqSvnf4ztyxs/AEPZMwgMDVFBKrVGVBLQPijK8mEKujl8lHkX0da2LJ
 mn0nlhHLCAu2sI5QiGUTl4Ck9kJrMM/sd1BsvcRF/38LjvyoJ9dwQDyAWTGeB/9A7IIqtt
 3u/ea3pMok1I0wsvIbAq3Uy+GlXSbJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-D47gau4NPTa2rOsnuzhJYQ-1; Tue, 20 Jul 2021 08:17:12 -0400
X-MC-Unique: D47gau4NPTa2rOsnuzhJYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3981481C85D;
 Tue, 20 Jul 2021 12:17:11 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B18360877;
 Tue, 20 Jul 2021 12:17:05 +0000 (UTC)
Date: Tue, 20 Jul 2021 14:17:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210720141704.381734cc@redhat.com>
In-Reply-To: <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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

On Wed, 30 Jun 2021 15:07:16 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change implements the support for the ACPI ERST feature.
Drop this

> 
> This implements a PCI device for ACPI ERST. This implments the
s/implments/implements/

> non-NVRAM "mode" of operation for ERST.
add here why non-NVRAM "mode" is implemented.

Also even if this non-NVRAM implementation, there is still
a lot of not necessary data copying (see below) so drop it
or justify why it's there.
 
> This change also includes erst.c in the build of general ACPI support.
Drop this as well


> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c      | 704 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build |   1 +
>  2 files changed, 705 insertions(+)
>  create mode 100644 hw/acpi/erst.c
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> new file mode 100644
> index 0000000..6e9bd2e
> --- /dev/null
> +++ b/hw/acpi/erst.c
> @@ -0,0 +1,704 @@
> +/*
> + * ACPI Error Record Serialization Table, ERST, Implementation
> + *
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
> + * ACPI Platform Error Interfaces : Error Serialization
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
> +#include "trace.h"
> +
> +/* UEFI 2.1: Append N Common Platform Error Record */
> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
> +#define IS_UEFI_CPER_RECORD(ptr) \
> +    (((ptr)[0] == 'C') && \
> +     ((ptr)[1] == 'P') && \
> +     ((ptr)[2] == 'E') && \
> +     ((ptr)[3] == 'R'))
> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
> +
> +/*
> + * This implementation is an ACTION (cmd) and VALUE (data)
> + * interface consisting of just two 64-bit registers.
> + */
> +#define ERST_REG_SIZE (2UL * sizeof(uint64_t))

> +#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
> +#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
what's meaning of CRS?
Looking at patch both should be called ERST_[ACTION|VALUE]_OFFSET 
pls use explicit offset values instead of shifting bit.


> +/*
> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
> + * record contents. Thus, it defines the maximum record size.
> + * As this is mapped through a PCI BAR, it must be a power of
> + * two, and should be at least PAGE_SIZE.
> + * Records are stored in the backing file in a simple fashion.
> + * The backing file is essentially divided into fixed size
> + * "slots", ERST_RECORD_SIZE in length, with each "slot"
> + * storing a single record. No attempt at optimizing storage
> + * through compression, compaction, etc is attempted.
> + * NOTE that any change to this value will make any pre-
> + * existing backing files, not of the same ERST_RECORD_SIZE,
> + * unusable to the guest.
> + */
> +/* 8KiB records, not too small, not too big */
> +#define ERST_RECORD_SIZE (2UL * 4096)
> +
> +#define ERST_INVALID_RECORD_ID (~0UL)
> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
> +
> +/*
> + * Object cast macro
> + */
> +#define ACPIERST(obj) \
> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
> +
> +/*
> + * Main ERST device state structure
> + */
> +typedef struct {
> +    PCIDevice parent_obj;
> +
> +    HostMemoryBackend *hostmem;
> +    MemoryRegion *hostmem_mr;
> +
> +    MemoryRegion iomem; /* programming registes */
> +    MemoryRegion nvmem; /* exchange buffer */
> +    uint32_t prop_size;
s/^^^/storage_size/

> +    hwaddr bar0; /* programming registers */
> +    hwaddr bar1; /* exchange buffer */
why do you need to keep this addresses around?
Suggest to drop these fields and use local variables or pci_get_bar_addr() at call site.

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
drop these see [**] below

> +
> +} ERSTDeviceState;
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +
> +static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
> +{
> +    /* Read an nvram entry into tmp_record */
> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> +    off_t offset = (index * ERST_RECORD_SIZE);
> +
> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
> +        if (s->hostmem_mr) {
> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
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
> +        if (s->hostmem_mr) {
> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
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

you have direct access to backend memory so there is no need
whatsoever to copy records from it to an intermediate buffer
everywhere. Almost all operations with records can be done
in place modulo EXECUTE_OPERATION action in BEGIN_[READ|WRITE]
context, where record is moved between backend and guest buffer.

So please eliminate all not necessary copying.
(for fun, time operations and set backend size to some huge
value to see how expensive this code is)

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
> +/*******************************************************************/
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
(I see in next patch it's us defining access width in the ACPI tables)
so question is: do we have to have mixed register width access?
can't all register accesses be 64-bit?

> +static void erst_reg_write(void *opaque, hwaddr addr,
> +    uint64_t val, unsigned size)
> +{
> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> +
> +    /*
> +     * NOTE: All actions/operations/side effects happen on the WRITE,
> +     * by design. The READs simply return the reg_value contents.
> +     */
> +    trace_acpi_erst_reg_write(addr, val, size);
> +
> +    switch (addr) {
> +    case ERST_CSR_VALUE + 0:
> +    case ERST_CSR_VALUE + 4:
> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
> +        break;
> +    case ERST_CSR_ACTION + 0:
> +/*  case ERST_CSR_ACTION+4: as coded, not really a 64b register */
> +        switch (val) {
> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +        case ACPI_ERST_ACTION_END_OPERATION:
> +            s->operation = val;
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> +            s->record_offset = s->reg_value;
> +            break;
> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
> +                s->busy_status = 1;
> +                switch (s->operation) {
> +                case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +                    s->command_status = write_erst_record(s);
> +                    break;
> +                case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +                    s->command_status = read_erst_record(s);
> +                    break;
> +                case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +                    s->command_status = clear_erst_record(s);
> +                    break;
> +                case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
> +                    break;
> +                case ACPI_ERST_ACTION_END_OPERATION:
> +                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
> +                    break;
> +                default:
> +                    s->command_status = ACPI_ERST_STATUS_FAILED;
> +                    break;
> +                }
> +                s->record_identifier = ERST_INVALID_RECORD_ID;
> +                s->busy_status = 0;
> +            }
> +            break;
> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> +            s->reg_value = s->busy_status;
> +            break;
> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> +            s->reg_value = s->command_status;
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> +            s->command_status = next_erst_record(s, &s->reg_value);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> +            s->record_identifier = s->reg_value;
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> +            s->reg_value = s->record_count;
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> +            s->reg_value = s->bar1;
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> +            s->reg_value = ERST_RECORD_SIZE;
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
> +            break;
> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> +            /*
> +             * 100UL is max, 10UL is nominal
100/10 of what, also add reference to spec/table it comes from
and explain in comment why theses values were chosen 

> +             */
> +            s->reg_value = ((100UL << 32) | (10UL << 0));
> +            break;
> +        case ACPI_ERST_ACTION_RESERVED:
not necessary, it will be handled by 'default:' 

> +        default:
> +            /*
> +             * Unknown action/command, NOP
> +             */
> +            break;
> +        }
> +        break;
> +    default:
> +        /*
> +         * This should not happen, but if it does, NOP
> +         */
> +        break;
> +    }
> +}
> +
> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
> +                                unsigned size)
> +{
> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> +    uint64_t val = 0;
> +
> +    switch (addr) {
> +    case ERST_CSR_ACTION + 0:
> +    case ERST_CSR_ACTION + 4:
> +        val = erst_rd_reg64(addr, s->reg_action, size);
> +        break;
> +    case ERST_CSR_VALUE + 0:
> +    case ERST_CSR_VALUE + 4:
> +        val = erst_rd_reg64(addr, s->reg_value, size);
> +        break;
> +    default:
> +        break;
> +    }
> +    trace_acpi_erst_reg_read(addr, val, size);
> +    return val;
> +}
> +
> +static const MemoryRegionOps erst_reg_ops = {
> +    .read = erst_reg_read,
> +    .write = erst_reg_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void erst_mem_write(void *opaque, hwaddr addr,
> +    uint64_t val, unsigned size)
> +{
> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;

> +    uint8_t *ptr = &s->record[addr - 0];
> +    trace_acpi_erst_mem_write(addr, val, size);
> +    switch (size) {
> +    default:
> +    case sizeof(uint8_t):
> +        *(uint8_t *)ptr = (uint8_t)val;
> +        break;
> +    case sizeof(uint16_t):
> +        *(uint16_t *)ptr = (uint16_t)val;
> +        break;
> +    case sizeof(uint32_t):
> +        *(uint32_t *)ptr = (uint32_t)val;
> +        break;
> +    case sizeof(uint64_t):
> +        *(uint64_t *)ptr = (uint64_t)val;
> +        break;
> +    }
> +}
> +
> +static uint64_t erst_mem_read(void *opaque, hwaddr addr,
> +                                unsigned size)
> +{
> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> +    uint8_t *ptr = &s->record[addr - 0];
> +    uint64_t val = 0;
> +    switch (size) {
> +    default:
> +    case sizeof(uint8_t):
> +        val = *(uint8_t *)ptr;
> +        break;
> +    case sizeof(uint16_t):
> +        val = *(uint16_t *)ptr;
> +        break;
> +    case sizeof(uint32_t):
> +        val = *(uint32_t *)ptr;
> +        break;
> +    case sizeof(uint64_t):
> +        val = *(uint64_t *)ptr;
> +        break;
> +    }
> +    trace_acpi_erst_mem_read(addr, val, size);
> +    return val;
> +}
> +
> +static const MemoryRegionOps erst_mem_ops = {
> +    .read = erst_mem_read,
> +    .write = erst_mem_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +
> +static const VMStateDescription erst_vmstate  = {
> +    .name = "acpi-erst",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
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
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
> +{
> +    ERSTDeviceState *s = ACPIERST(pci_dev);
> +    unsigned index = 0;
> +    bool share;
> +
> +    trace_acpi_erst_realizefn_in();
> +
> +    if (!s->hostmem) {
> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
> +        return;
> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
> +        error_setg(errp, "can't use already busy memdev: %s",
> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
> +        return;
> +    }
> +
> +    share = object_property_get_bool(OBJECT(s->hostmem), "share", &error_fatal);
s/&error_fatal/errp/

> +    if (!share) {
> +        error_setg(errp, "ACPI ERST requires hostmem property share=on: %s",
> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
> +    }
This limits possible to use backends to file|memfd only, so
I wonder if really need this limitation, what if user doesn't
care about preserving it across QEMU restarts. (i.e. usecase
where storage is used as a means to troubleshoot guest crash
i.e. QEMU is not restarted in between)

Maybe instead of enforcing we should just document that if user
wishes to preserve content they should use file|memfd backend with
share=on option.

> +
> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
> +
> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
> +    s->prop_size = object_property_get_int(OBJECT(s->hostmem), "size", &error_fatal);
s/&error_fatal/errp/

> +
> +    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
> +    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);

pls, no fixups on behalf of user, if size is not what it should be
error out with suggestion how to fix it.

> +
> +    /*
> +     * MemoryBackend initializes contents to zero, but we actually
> +     * want contents initialized to 0xFF, ERST_INVALID_RECORD_ID.
> +     */
> +    if (copy_from_nvram_by_index(s, 0) == ACPI_ERST_STATUS_SUCCESS) {
> +        if (s->tmp_record[0] == 0x00) {
> +            memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
this doesn't scale,
(set backend size to more than host physical RAM, put it on slow storage and have fun.)

Is it possible to use 0 as invalid record id or change storage format
so you would not have to rewrite whole file at startup (maybe some sort
of metadata header/records book-keeping table before actual records.
And initialize file only if header is invalid.)

> +            index = 0;
> +            while (copy_to_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
> +                ++index;
> +            }
also back&forth copying here is not really necessary.

> +        }
> +    }
> +
> +    /* Initialize record_count */
> +    get_erst_record_count(s);
why not put it into reset?

> +
> +    /* BAR 0: Programming registers */
> +    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops, s,
> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
> +

> +    /* BAR 1: Exchange buffer memory */
> +    memory_region_init_io(&s->nvmem, OBJECT(pci_dev), &erst_mem_ops, s,
> +                          TYPE_ACPI_ERST, ERST_RECORD_SIZE);
> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->nvmem);

**)
instead of using mmio for buffer where each write causes
guest exit to QEMU, map memory region directly to guest.
see ivshmem_bar2, the only difference with ivshmem, you'd
create memory region manually (for example you can use
memory_region_init_resizeable_ram)

this way you can speedup access and drop erst_mem_ops and
[tmp_]record intermediate buffers.

Instead of [tmp_]record you can copy record content
directly between buffer and backend memory regions.

> +    /*
> +     * The vmstate_register_ram_global() puts the memory in
> +     * migration stream, where it is written back to the memory
> +     * upon reaching the destination, which causes the backing
> +     * file to be updated (with share=on).
> +     */
> +    vmstate_register_ram_global(s->hostmem_mr);
> +
> +    trace_acpi_erst_realizefn_out(s->prop_size);
> +}
> +
> +static void erst_reset(DeviceState *dev)
> +{
> +    ERSTDeviceState *s = ACPIERST(dev);
> +
> +    trace_acpi_erst_reset_in(s->record_count);
> +    s->operation = 0;
> +    s->busy_status = 0;
> +    s->command_status = ACPI_ERST_STATUS_SUCCESS;

> +    /* indicate empty/no-more until further notice */
pls rephrase, I'm not sure what it's trying to say

> +    s->record_identifier = ERST_INVALID_RECORD_ID;
> +    s->record_offset = 0;
> +    s->next_record_index = 0;

> +    /* NOTE: record_count and nvram are initialized elsewhere */
> +    trace_acpi_erst_reset_out(s->record_count);
> +}
> +
> +static Property erst_properties[] = {
> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void erst_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    trace_acpi_erst_class_init_in();
> +    k->realize = erst_realizefn;
> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
> +    k->revision = 0x00;
> +    k->class_id = PCI_CLASS_OTHERS;
> +    dc->reset = erst_reset;
> +    dc->vmsd = &erst_vmstate;
> +    dc->user_creatable = true;
> +    device_class_set_props(dc, erst_properties);
> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    trace_acpi_erst_class_init_out();
> +}
> +
> +static const TypeInfo erst_type_info = {
> +    .name          = TYPE_ACPI_ERST,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .class_init    = erst_class_init,
> +    .instance_size = sizeof(ERSTDeviceState),
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
what is this for here?

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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BC3471A70
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 14:46:55 +0100 (CET)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwPBl-0001Gc-Tl
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 08:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwP8S-0007q7-R5
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 08:43:28 -0500
Received: from [2a00:1450:4864:20::536] (port=43579
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwP8Q-0000sx-9h
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 08:43:28 -0500
Received: by mail-ed1-x536.google.com with SMTP id o20so44527071eds.10
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 05:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdU9PB4tIOQ3qWvKq+tY6bIt34LHM/WAlNgwtlFnIxA=;
 b=BfXRxgpMudnBCYRQBmCL64tJHJsx9CKoyBQgvDYtsjSTkR94c1Rd0wh3IeVsgsSTbf
 TzMvXViLoLTBNxKjjVGx9tmFJs9fLIMnNnNrsWEAgVNk4+TPlPsZFj6CVnSQokB+mXW1
 u84W3EWlXPRXTiPDTxmrJPNxSacafPS8rZEDOBeK9GGYAy9BWyx15gDUCp6A1Y/22C02
 HlU27IbUgrCxr3Oju1RAnwjy8zjmWSLyPUH3Yy+TbHf0l0CZGdC2+R4ovfjq8UGz3TYL
 rmt8c3Dh8MGBKMkeaReDQhfBWEZkxCR61jtH/mETnmivvMhyIG9J7bw32J26fUcmBjfh
 Hizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdU9PB4tIOQ3qWvKq+tY6bIt34LHM/WAlNgwtlFnIxA=;
 b=wTcVOKZj+aWQMWrr8pN6P3zPMzjumFSpvos98nNQb1o0wR+J36HntzAfO0gJaSQimd
 mngKVKhakq54XMJ7E7wRoGuAYgbe/GS+t2W41D1xDU8yI3kdsU69Z5bL4o8uDAJlKOFU
 eDCrMDbDii6Adw00kNZxb7JPbXQ89ed5geA0VO0LMqH91ViFT0BpIWK9URT3PtLFPkR7
 hvH8dbymDFqFXhSBfTjDxiSrJKbBWcs8QpvqmL12deihhClf4ETGaNwGobgGHQPjriMV
 56WC0NyrzWsDbWHHdpDP6p0G509dQQkgGTnBj7mVD2lB7ZaQJrXbYeVUQtmSnCg2nFr5
 gSSA==
X-Gm-Message-State: AOAM5327pJ8iAJIZzMl4KUuX6biNUounKu8rLwj1Bt/aPefUefLLLiVU
 U8woMBKU2XIhd6eWcX6UrDDot7o6Dmsx9FZEUqm7uA==
X-Google-Smtp-Source: ABdhPJxFtgvgTKOGrjh+Gd4RZHssr8NqyJRON1w7j0kn9bTXmXaLDJ75vxAnbTqoSfdXgxkVz2lhFmdFq3+vU94es+M=
X-Received: by 2002:a50:f18a:: with SMTP id x10mr54516082edl.193.1639316600893; 
 Sun, 12 Dec 2021 05:43:20 -0800 (PST)
MIME-Version: 1.0
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 12 Dec 2021 19:13:10 +0530
Message-ID: <CAARzgwxqBfk4jSdH7EDzUHjVPBr7DiLkKSeq7grvFOX_AX3hgQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.

On Thu, Dec 9, 2021 at 11:28 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.

This patch starts in the middle of pci device code addition, between
erst_reg_ops and erst_post_load. I do not like this :(

>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 241 insertions(+)
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index 81f5435..753425a 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +
> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> +#define INST_READ_REGISTER                 0x00
> +#define INST_READ_REGISTER_VALUE           0x01
> +#define INST_WRITE_REGISTER                0x02
> +#define INST_WRITE_REGISTER_VALUE          0x03
> +#define INST_NOOP                          0x04
> +#define INST_LOAD_VAR1                     0x05
> +#define INST_LOAD_VAR2                     0x06
> +#define INST_STORE_VAR1                    0x07
> +#define INST_ADD                           0x08
> +#define INST_SUBTRACT                      0x09
> +#define INST_ADD_VALUE                     0x0A
> +#define INST_SUBTRACT_VALUE                0x0B
> +#define INST_STALL                         0x0C
> +#define INST_STALL_WHILE_TRUE              0x0D
> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> +#define INST_GOTO                          0x0F
> +#define INST_SET_SRC_ADDRESS_BASE          0x10
> +#define INST_SET_DST_ADDRESS_BASE          0x11
> +#define INST_MOVE_DATA                     0x12

I prefer these definitions to come at the top of the file along with
other definitions.

> +
> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction_entry(GArray *table_data,

This function and buiild_erst() can come at the end of erst.c. They go
together and are doing a common but different operation from the
operations of the pci device - building the erst table. Hence, ther
code should be separate from pci device code. A new file would be an
overkill at this state IMHO but in the future if erst table generation
code gains more weight, it can be split into two files.

> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t register_bit_width,
> +    uint64_t register_address,
> +    uint64_t value,
> +    uint64_t mask)
> +{
> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> +    struct AcpiGenericAddress gas;
> +
> +    /* Serialization Action */
> +    build_append_int_noprefix(table_data, serialization_action, 1);
> +    /* Instruction */
> +    build_append_int_noprefix(table_data, instruction         , 1);
> +    /* Flags */
> +    build_append_int_noprefix(table_data, flags               , 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0                   , 1);
> +    /* Register Region */
> +    gas.space_id = AML_SYSTEM_MEMORY;
> +    gas.bit_width = register_bit_width;
> +    gas.bit_offset = 0;
> +    switch (register_bit_width) {
> +    case 8:
> +        gas.access_width = 1;
> +        break;
> +    case 16:
> +        gas.access_width = 2;
> +        break;
> +    case 32:
> +        gas.access_width = 3;
> +        break;
> +    case 64:
> +        gas.access_width = 4;
> +        break;
> +    default:
> +        gas.access_width = 0;
> +        break;
> +    }
> +    gas.address = register_address;
> +    build_append_gas_from_struct(table_data, &gas);
> +    /* Value */
> +    build_append_int_noprefix(table_data, value  , 8);
> +    /* Mask */
> +    build_append_int_noprefix(table_data, mask   , 8);
> +}
> +
> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> +    const char *oem_id, const char *oem_table_id)
> +{
> +    GArray *table_instruction_data;
> +    unsigned action;
> +    pcibus_t bar0, bar1;
> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    trace_acpi_erst_pci_bar_0(bar0);
> +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
> +    trace_acpi_erst_pci_bar_1(bar1);
> +
> +#define MASK8  0x00000000000000FFUL
> +#define MASK16 0x000000000000FFFFUL
> +#define MASK32 0x00000000FFFFFFFFUL
> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> +
> +    /*
> +     * Serialization Action Table
> +     * The serialization action table must be generated first
> +     * so that its size can be known in order to populate the
> +     * Instruction Entry Count field.
> +     */
> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> +
> +    /* Serialization Instruction Entries */
> +    action = ACTION_BEGIN_WRITE_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_BEGIN_READ_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_END_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_SET_RECORD_OFFSET;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER      , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_EXECUTE_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_CHECK_BUSY_STATUS;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER_VALUE , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
> +
> +    action = ACTION_GET_COMMAND_STATUS;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
> +
> +    action = ACTION_GET_RECORD_IDENTIFIER;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> +
> +    action = ACTION_SET_RECORD_IDENTIFIER;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER      , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_GET_RECORD_COUNT;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> +
> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> +
> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> +
> +    /* Serialization Header */
> +    acpi_table_begin(&table, table_data);
> +
> +    /* Serialization Header Size */
> +    build_append_int_noprefix(table_data, 48, 4);
> +
> +    /* Reserved */
> +    build_append_int_noprefix(table_data,  0, 4);
> +
> +    /*
> +     * Instruction Entry Count
> +     * Each instruction entry is 32 bytes
> +     */
> +    build_append_int_noprefix(table_data,
> +        (table_instruction_data->len / 32), 4);
> +
> +    /* Serialization Instruction Entries */
> +    g_array_append_vals(table_data, table_instruction_data->data,
> +        table_instruction_data->len);
> +    g_array_free(table_instruction_data, TRUE);
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  /*******************************************************************/
>  /*******************************************************************/
>  static int erst_post_load(void *opaque, int version_id)
> --
> 1.8.3.1
>


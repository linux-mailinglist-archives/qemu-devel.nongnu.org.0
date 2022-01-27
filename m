Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66AD49DCAC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:39:10 +0100 (CET)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0JB-0000em-P3
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nD0GY-0006et-TB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:36:26 -0500
Received: from [2607:f8b0:4864:20::1033] (port=50781
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nD0GW-0007XJ-PD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:36:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id o11so2258377pjf.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rYHCgWbbFwKVEqdufD2LeeFYyyQ340XmV5rTXZd5puw=;
 b=qIuAAHOWkGxlkoD10bPVEVR5xAY+dvuw3LfpF2VIaKAnIp3BQ5U2sTL3FANALvy5jl
 w7Hk09rp1Aw1Afmi4arkmT/KVwLayYuDpYLCXDWc10yv7D3/N0NqlT4tyeAoPXMc+lqF
 mnlDGlYQtQqKlLIOWs2DBGGtPhjhpa80rPvoTKZN6yiqC3L1go7qMYEnKFgfSrVGvkU5
 AVZ8RsBdWXJOa/Ww9Cdq2dme2B6omrNC8Swypv3mQOTCTsvZp9bTwUFXp41AUYUyYFww
 GQyJU3sPG+rchW3gKW8GxZ/kolaKyynTQ/0b7rclDOdT2VRJWqc6RUrgVfL54be6nJxh
 DZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rYHCgWbbFwKVEqdufD2LeeFYyyQ340XmV5rTXZd5puw=;
 b=BIr/2EfP0vlLFyYXuIYTrtxpUROhBTybsIIZZnmCInFFs1FzrEX1H8yjqVHQlEP4nj
 AeLBa9bhHZigUVeMBFPh2MuKYE1VyRvyOUX2GUdW0WV+Iv9mqGAJiGm6lsoNapzpKtM1
 La3K3avOXggm/aBN2RgXlqZC2/9xSbo33NWVwM+wi9CWnQxCJt2AEE+2gX7tfqD4TiK7
 cxn2Iow0M63+z/R1v/3dxu6zBRusA150aOoD64sr9QnRfHkZo88GQQ+VYtZiTXItPa+k
 0IvFWIiGFKNL+7LGMet4J0xkpOTh1FAcEM5ecQ7pweWo2qpdBbpec5aJ3Uc875REjU30
 OZ+w==
X-Gm-Message-State: AOAM53168unWPIps7YM5GU5D39pjlMi4al4pPzfHGmT8mJhIzdqH8Lz4
 2pN07KhHxrWKQBfbDArXPzeHJw==
X-Google-Smtp-Source: ABdhPJwgz17mtlMTQCsHwKS4a42Z3HFfcgVBCxg+c88vMOH/GQ9SJI01LTC9zKKIZRfKvdLPUO/uTQ==
X-Received: by 2002:a17:903:247:: with SMTP id
 j7mr2445147plh.105.1643272582663; 
 Thu, 27 Jan 2022 00:36:22 -0800 (PST)
Received: from [10.5.18.6] ([91.219.213.7])
 by smtp.googlemail.com with ESMTPSA id ha11sm6587817pjb.3.2022.01.27.00.36.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:36:22 -0800 (PST)
Date: Thu, 27 Jan 2022 14:06:15 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
In-Reply-To: <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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



On Wed, 26 Jan 2022, Eric DeVolder wrote:

> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.

There might be more optimizations possible but I think we have messaged
this code enough. We can further rework the code if needed in subsequent
patches once this is pushed.

>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

with some minor comments,

Reviewed-by: Ani Sinha <ani@anisinha.ca>

>  hw/acpi/erst.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index fe9ba51..5d5a639 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -59,6 +59,27 @@
>  #define STATUS_RECORD_STORE_EMPTY     0x04
>  #define STATUS_RECORD_NOT_FOUND       0x05
>
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
> +
>  /* UEFI 2.1: Appendix N Common Platform Error Record */
>  #define UEFI_CPER_RECORD_MIN_SIZE 128U
>  #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> @@ -172,6 +193,210 @@ typedef struct {
>
>  /*******************************************************************/
>  /*******************************************************************/
> +typedef struct {
> +    GArray *table_data;
> +    pcibus_t bar;
> +    uint8_t instruction;
> +    uint8_t flags;
> +    uint8_t register_bit_width;
> +    pcibus_t register_offset;
> +} BuildSerializationInstructionEntry;
> +
> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction(
> +    BuildSerializationInstructionEntry *e,
> +    uint8_t serialization_action,
> +    uint64_t value)
> +{
> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> +    struct AcpiGenericAddress gas;
> +    uint64_t mask;
> +
> +    /* Serialization Action */
> +    build_append_int_noprefix(e->table_data, serialization_action, 1);
> +    /* Instruction */
> +    build_append_int_noprefix(e->table_data, e->instruction, 1);
> +    /* Flags */
> +    build_append_int_noprefix(e->table_data, e->flags, 1);
> +    /* Reserved */
> +    build_append_int_noprefix(e->table_data, 0, 1);
> +    /* Register Region */
> +    gas.space_id = AML_SYSTEM_MEMORY;
> +    gas.bit_width = e->register_bit_width;
> +    gas.bit_offset = 0;
> +    gas.access_width = ctz32(e->register_bit_width) - 2;

Should this be casted as unit8_t?

> +    gas.address = (uint64_t)(e->bar + e->register_offset);
> +    build_append_gas_from_struct(e->table_data, &gas);
> +    /* Value */
> +    build_append_int_noprefix(e->table_data, value, 8);
> +    /* Mask */
> +    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
> +    build_append_int_noprefix(e->table_data, mask, 8);
> +}
> +
> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> +    const char *oem_id, const char *oem_table_id)
> +{
> +    /*
> +     * Serialization Action Table
> +     * The serialization action table must be generated first
> +     * so that its size can be known in order to populate the
> +     * Instruction Entry Count field.
> +     */
> +    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +    /* Contexts for the different ways ACTION and VALUE are accessed */
> +    BuildSerializationInstructionEntry rd_value_32_val = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_READ_REGISTER_VALUE,
> +        .flags = 0,
> +        .register_bit_width = 32,
> +        .register_offset = ERST_VALUE_OFFSET,
> +    };
> +    BuildSerializationInstructionEntry rd_value_32 = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_READ_REGISTER,
> +        .flags = 0,
> +        .register_bit_width = 32,
> +        .register_offset = ERST_VALUE_OFFSET,
> +    };
> +    BuildSerializationInstructionEntry rd_value_64 = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_READ_REGISTER,
> +        .flags = 0,
> +        .register_bit_width = 64,
> +        .register_offset = ERST_VALUE_OFFSET,
> +    };
> +    BuildSerializationInstructionEntry wr_value_32_val = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_WRITE_REGISTER_VALUE,
> +        .flags = 0,
> +        .register_bit_width = 32,
> +        .register_offset = ERST_VALUE_OFFSET,
> +    };
> +    BuildSerializationInstructionEntry wr_value_32 = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_WRITE_REGISTER,
> +        .flags = 0,
> +        .register_bit_width = 32,
> +        .register_offset = ERST_VALUE_OFFSET,
> +    };
> +    BuildSerializationInstructionEntry wr_value_64 = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_WRITE_REGISTER,
> +        .flags = 0,
> +        .register_bit_width = 64,
> +        .register_offset = ERST_VALUE_OFFSET,
> +    };
> +    BuildSerializationInstructionEntry wr_action = {
> +        .table_data = table_instruction_data,
> +        .bar = bar0,
> +        .instruction = INST_WRITE_REGISTER_VALUE,
> +        .flags = 0,
> +        .register_bit_width = 32,
> +        .register_offset = ERST_ACTION_OFFSET,
> +    };

We can probably write a macro to simply generating these structs. I see
.bar and .flags are the same in all structs. The .bit_width can be a param
into the macro etc.

> +    unsigned action;
> +
> +    trace_acpi_erst_pci_bar_0(bar0);
> +
> +    /* Serialization Instruction Entries */
> +    action = ACTION_BEGIN_WRITE_OPERATION;
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_BEGIN_READ_OPERATION;
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_END_OPERATION;
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_SET_RECORD_OFFSET;
> +    build_serialization_instruction(&wr_value_32, action, 0);
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_EXECUTE_OPERATION;
> +    build_serialization_instruction(&wr_value_32_val, action,
> +        ERST_EXECUTE_OPERATION_MAGIC);
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_CHECK_BUSY_STATUS;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_32_val, action, 0x01);
> +
> +    action = ACTION_GET_COMMAND_STATUS;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_32, action, 0);
> +
> +    action = ACTION_GET_RECORD_IDENTIFIER;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_64, action, 0);
> +
> +    action = ACTION_SET_RECORD_IDENTIFIER;
> +    build_serialization_instruction(&wr_value_64, action, 0);
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_GET_RECORD_COUNT;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_32, action, 0);
> +
> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> +    build_serialization_instruction(&wr_action, action, action);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_64, action, 0);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_64, action, 0);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_32, action, 0);
> +
> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> +    build_serialization_instruction(&wr_action, action, action);
> +    build_serialization_instruction(&rd_value_64, action, 0);
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
> +    g_assert((table_instruction_data->len) % 32 == 0);
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
> +/*******************************************************************/
> +/*******************************************************************/
>  static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>  {
>      uint8_t *rc = NULL;
> --
> 1.8.3.1
>
>


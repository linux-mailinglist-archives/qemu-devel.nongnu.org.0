Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97949B28B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:05:12 +0100 (CET)
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJdP-0001S3-B7
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:05:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nCJSe-0001sy-08
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:54:06 -0500
Received: from [2607:f8b0:4864:20::62a] (port=44792
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nCJSa-00021v-Sl
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:54:03 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c9so18886303plg.11
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=grB040HWijdZ4ohE0KQ3r0IT5ZGWHqP0xwYk0pzTg58=;
 b=oFNvspUhuxJFr78V7aGTiQOWVTfnMbxuCDP2gjpoZELrHqh8tSfCYwPmIfZUEIhq9P
 pxN0PfSb4fl5bJzmM/7yBcx0QM8ClxxW9B4oLaLwOXjedI8nZBsEEaqfuoKFyO7SMMDq
 6qt/f39Ax7Jb8NaRUYBCPJo1zlieMxhrb02Vab9Q+/MJUUVet0pRpKPwgUlOrL4EUcMW
 P35H9IoSHvbj5/MHfNXhtVeDdVLBogNMeXiozPfme6Ul8B/wc6EpIfcDoJHafxx1Ao6k
 ckxWHpEp8PG19evZbvh0quM6tgvtoTKwoPDOLONTPRXoEwKU2RnojudomjjhGOLik2vb
 kYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=grB040HWijdZ4ohE0KQ3r0IT5ZGWHqP0xwYk0pzTg58=;
 b=ljzbDRqA2Mle/WBF13aLZtAe92tqrhpHBKIsoX7M228/kA6lGMZOtnCGMKSNapDdWd
 ZyqHS+XWbrbcahJAyiH/DHDI12ozjNZgrrdYYcZQRNo621hBj/st0fDCqf/0NeOp6i6K
 y1ezU7sQZeStLIbdXUr2lS3i2MjgMMrbLchpESnI3zUXLp4giYyUNRZe5va93e5o0DF7
 QKXSjrhpjM4n1KeSr8b6+N4arPllvgdeMyZEgDrjrs+GVxIqhnPUEv9Jguenj7+41xvj
 EHD/57Rt058v2be32kBEBJsvStyCjHBPVmbnpYH55R6ecT9Vne/KvmCkaizOELOhLc0z
 6WBA==
X-Gm-Message-State: AOAM531NLdJ9wW91BS6NczzXOuWgef+wo2WES6E6eu+O10Ob826zsMh/
 ZrtPMsjXWECup5Lp9bbj2jeRzQ==
X-Google-Smtp-Source: ABdhPJxwJX3OKZKymcIsSbPecdf81BUUdJzvX6PY9Y+apcjGCARDCkCqiOcik3uo1pbNxQVYNZT6Ag==
X-Received: by 2002:a17:90a:2b85:: with SMTP id
 u5mr2798598pjd.197.1643108036710; 
 Tue, 25 Jan 2022 02:53:56 -0800 (PST)
Received: from anisinha-lenovo ([203.212.247.250])
 by smtp.googlemail.com with ESMTPSA id y12sm3786952pfa.132.2022.01.25.02.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:53:56 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 25 Jan 2022 16:23:49 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
In-Reply-To: <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
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
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 24 Jan 2022, Eric DeVolder wrote:

> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 188 insertions(+)
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index fe9ba51..b0c7539 100644
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
> @@ -172,6 +193,173 @@ typedef struct {
>
>  /*******************************************************************/
>  /*******************************************************************/
> +
> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction_entry(GArray *table_data,
> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t register_bit_width,
> +    uint64_t register_address,
> +    uint64_t value)
> +{
> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> +    struct AcpiGenericAddress gas;
> +    uint64_t mask;
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
> +    gas.access_width = ctz32(register_bit_width) - 2;
> +    gas.address = register_address;
> +    build_append_gas_from_struct(table_data, &gas);
> +    /* Value */
> +    build_append_int_noprefix(table_data, value  , 8);
> +    /* Mask */
> +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
> +    build_append_int_noprefix(table_data, mask  , 8);
> +}
> +
> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> +    const char *oem_id, const char *oem_table_id)
> +{
> +    GArray *table_instruction_data;
> +    unsigned action;
> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    trace_acpi_erst_pci_bar_0(bar0);
> +
> +    /*
> +     * Serialization Action Table
> +     * The serialization action table must be generated first
> +     * so that its size can be known in order to populate the
> +     * Instruction Entry Count field.
> +     */
> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> +
> +    /*
> +     * Macros for use with construction of the action instructions
> +     */
> +#define BUILD_READ_REGISTER(width_in_bits, reg) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_READ_REGISTER, 0, width_in_bits, \
> +        bar0 + reg, 0)
> +
> +#define BUILD_READ_REGISTER_VALUE(width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +    /* Serialization Instruction Entries */
> +    action = ACTION_BEGIN_WRITE_OPERATION;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_BEGIN_READ_OPERATION;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_END_OPERATION;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_SET_RECORD_OFFSET;
> +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_EXECUTE_OPERATION;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
> +        ERST_EXECUTE_OPERATION_MAGIC);

except here, on all cases we have
BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);

We should treat the above as special case and simplify the rest of the
calls (eliminate repeated common arguments).

> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_CHECK_BUSY_STATUS;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
> +
> +    action = ACTION_GET_COMMAND_STATUS;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_RECORD_IDENTIFIER;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_SET_RECORD_IDENTIFIER;
> +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);

This one seems reverted. Should this be
BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);

like others?

> +
> +    action = ACTION_GET_RECORD_COUNT;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> +

BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
argument. WE should eliminate this repeated passing of same argument.


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


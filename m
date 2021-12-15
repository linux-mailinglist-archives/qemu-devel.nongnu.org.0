Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165E475D91
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:35:44 +0100 (CET)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXFm-0000JX-H2
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:35:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mxXDZ-0007Jv-FY
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:33:25 -0500
Received: from [2a00:1450:4864:20::52a] (port=46899
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mxXDV-0002ha-Rz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:33:25 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y13so76680601edd.13
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9x/6TcQzo8FqbXThCdD77+mSOTNt+X6QnkMdxa0MOsk=;
 b=MNGzWN34OCjrbuFVgikeege0dDSEGaTqGqCwEqlQohF3VggxVrq7FNbR/h4rZjW733
 hoezDnnBCOsBSTzx/Q6wKFMyT5UHA+e/OAITUQxtP0mD9D893TNjTbHVewELUmx1xfAy
 0tYoLxD+NVmYQyp5eK2z6+NeL9XPCtQ/RqtH5jfbMWFPxjaiwadhFos0hC5Gzc+cEHZQ
 0ka3dVjwxVdsfT4IBEMUpJR0D9EBBk0xVsJ3Tq7JS/75Zwe+qDc68hJ7FkoI6lBnwc3Z
 E6R6BJPpAi0a6E5ilMmPcFvVNyNffFZ26flmM1CiSa6wy0jxeK/9WlqQrjOSVHMI4pRe
 tu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9x/6TcQzo8FqbXThCdD77+mSOTNt+X6QnkMdxa0MOsk=;
 b=BSqKNHpVMLVpY91/tp86G6JKF7tXrg1kJDMMW7fBvTJeQn9QtIs2D4MYwzM8jYPFuL
 PzBBBY+r5EC6L8f0HxyAKPV6qYozoxFWs0n8XZgAZxvLCrnx6VoDcUhzYn8moMpLmqrM
 N6CiQVg8LGD6RRC2eO0tMqLhtYwmoOGb7mqmFalp19v4k2H7my5RI+qVqCvK/9nKheBq
 vUtAtGbi5DaEsedj7puE+bjTv1ytYg8pP2b4FQ5+edqSzpcL6u6Dbn3L1lZaXFZEqLAp
 8PB3g0I/bRQy9GoAj3WW0TukBwcxdEme9rsublT+4S6gFaTVCbbU06asC5pQ4eR50CWF
 5q8Q==
X-Gm-Message-State: AOAM533YXgJn8z2iMcRls1dgivLGLqRVX1J9NPhFZl7iOZ9zWmGaLjRV
 9Nc0wCCg7BK75HxKGG3fKzpyR8js7jNbUpD8xqmZog==
X-Google-Smtp-Source: ABdhPJyKh3QBn6Bju0MBErihDwSbTXy3uDq6B90E88Tn4vk2FvEoXX2fuLr7/G06AxkHxpcxOwuDxlMEYgT9tg5pfBU=
X-Received: by 2002:a05:6402:16cd:: with SMTP id
 r13mr15672232edx.264.1639586000116; 
 Wed, 15 Dec 2021 08:33:20 -0800 (PST)
MIME-Version: 1.0
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
 <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 15 Dec 2021 22:03:08 +0530
Message-ID: <CAARzgwy0qBE2rBtsjFaW6ED_bWW4SjV0JNfVYmc=P7groLJthw@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] ACPI ERST: build the ACPI ERST table
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
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

On Wed, Dec 15, 2021 at 9:08 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 188 insertions(+)
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index bb6cad4..05177b3 100644
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

This variable can be eliminated (see below).

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
> +#define build_read_register(action, width_in_bits, reg) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_READ_REGISTER, 0, width_in_bits, \
> +        bar0 + reg, 0)
> +
> +#define build_read_register_value(action, width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +#define build_write_register(action, width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +#define build_write_register_value(action, width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +    /* Serialization Instruction Entries */
> +    action = ACTION_BEGIN_WRITE_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_BEGIN_READ_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_END_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_SET_RECORD_OFFSET;
> +    build_write_register(action, 32, ERST_VALUE_OFFSET, 0);
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_EXECUTE_OPERATION;
> +    build_write_register_value(action, 32, ERST_VALUE_OFFSET,
> +        ERST_EXECUTE_OPERATION_MAGIC);
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);



> +
> +    action = ACTION_CHECK_BUSY_STATUS;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register_value(action, 32, ERST_VALUE_OFFSET, 0x01);
> +
> +    action = ACTION_GET_COMMAND_STATUS;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_RECORD_IDENTIFIER;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_SET_RECORD_IDENTIFIER;
> +    build_write_register(action, 64, ERST_VALUE_OFFSET, 0);
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_GET_RECORD_COUNT;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);

if I am reading this right, build_write_register_value() is called
with the same parameters, except that action is changing. We can
optimize repetative calls with the same parameters.

build_read_register can be split into build_read_register_32() and
build_read_register_64().
So we can have :
build_write_register_value(ACTION_GET_EXECUTE_OPERATION_TIMINGS);
build_read_register_64(ACTION_GET_EXECUTE_OPERATION_TIMINGS);

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


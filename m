Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD94693FB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:32:21 +0100 (CET)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBIB-0007Dp-NO
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1muBH1-0006YA-D1
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:31:07 -0500
Received: from [2a00:1450:4864:20::532] (port=34697
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1muBGv-0000vI-Ia
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:31:06 -0500
Received: by mail-ed1-x532.google.com with SMTP id x15so41106031edv.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HOP0NO08W5zPy367YNOwJqNa1spCNzBgT1DuxcTT88=;
 b=OB3NZxRRZj1wzYsUNGTqZaZj3gW1pq6ASIZvpGAYFXLqE2jyTly9Tt6XUOxntpL2w1
 TfrKOAb5X1utsXEathzc0TD1LOrUcQ9VQGl+gpm9ch/WpTAYfwA/8eEjtW2MuOyMH9oM
 Fp1yl2f1oXxrfWdfuJ0JcsUIYzGmwT6SoD5qXv3gk65PMyp0PS67QnIyXptfZzvtZRqT
 H+IStg0j79itQ5HE929rZvUuWlhc0WcgM4NxPKhSKOnT0CHC+r4t6ojtfftXq1etNNKO
 rokAZ7aJiFtUOlPYUl4tziiCIfzn+0drUGVqLYRToHaAIuMxEZENFVKuNqyOazT+m6dS
 BpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HOP0NO08W5zPy367YNOwJqNa1spCNzBgT1DuxcTT88=;
 b=QBPWWVqbhImNtNPAWZgWBiBeCKn9qZefc6P2qNiwgBCCEln6ycWW0HHue5KDbbosrL
 uRiSg9bpREqnJwSX7O1KYotflSDoCBnFdX7ksDiVq/ng6CR4UbXAr0dOlR/lwR3vir9Z
 bj7krpY8reig6ZQEl/XetNaeAw/HX8e+bbBNRvllbvhhXI6pOjnp6rO7+H8F5DTjsttv
 CwPaAzJJErOvdZWtQE8MXkrI1iUdHnEApQU5Ua6flMQjlAx0hQzNw8XCIIcGMtzm14BE
 v5FeLMtzIRpLMS4IUtSKT4mHnrNCJr9dpz0XxsSpH/GHAu0rVFwKV6CbeRee88aFFjM3
 GZlw==
X-Gm-Message-State: AOAM5318ImhaEnsTJuQ3WzVDH2llNj7VCg2if3PsQbMV6o9lcSCjY7XQ
 ymrTtJbX/hTLQhUv63zmTTzCX+yQpEqbMvkNY6Qg4g==
X-Google-Smtp-Source: ABdhPJyZjEauZvonVbGQ2F5fyu0FmLOGmgDdGWjpDCzNWzVvlTH3YgZ4RtOgUSBT8cIq1uS0xWHuzs6s4AwsUrl4xwo=
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr43783920eji.132.1638786659240; 
 Mon, 06 Dec 2021 02:30:59 -0800 (PST)
MIME-Version: 1.0
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-7-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1638472142-14396-7-git-send-email-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 6 Dec 2021 16:00:48 +0530
Message-ID: <CAARzgwyKyk+J71esb_U5m8gDsU9PZ3FKps9fEtyomuJB_GJwdg@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] ACPI ERST: build the ACPI ERST table
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
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

On Fri, Dec 3, 2021 at 12:40 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 241 insertions(+)
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index 4304f55..06a87af 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -701,6 +701,247 @@ static const MemoryRegionOps erst_reg_ops = {
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
> +
> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction_entry(GArray *table_data,
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
> +    hwaddr bar0, bar1;

I would rather have pcibus_t here as opposed to hwaddr although
currently they are both unint64_t. Just in case they diverge in
future.

> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    trace_acpi_erst_pci_bar_0(bar0);
> +    bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
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


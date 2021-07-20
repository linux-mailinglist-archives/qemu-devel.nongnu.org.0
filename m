Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C73CFA6C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:19:16 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5peV-0007be-3w
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pcF-0004l6-Et
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pcB-0004yO-1c
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626787009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsjlBnqSLV+Z9qhGi3pZEiLWmZLJnXbj7FRP+FSWjwg=;
 b=i+PLINnlUDQcF6i2o1zcMw/xGSpTixaM9tF6ctK6/PXBkt454FpNaoRbJqlrz1rZ3b3Cwu
 OftUK/oOY0z//Qk/rbkmUHomiLIO2C4JW+OvzFqG+TVaxDyi2l9G+AeIKJ5aVVkq+6vLe5
 Cf1QxWvT1eKUsgtVy06YDPoLeaOsVr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-ts9zrhDiM1uFnPySg0KaaA-1; Tue, 20 Jul 2021 09:16:48 -0400
X-MC-Unique: ts9zrhDiM1uFnPySg0KaaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 081FA9F92B;
 Tue, 20 Jul 2021 13:16:47 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4963D60C82;
 Tue, 20 Jul 2021 13:16:41 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:16:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20210720151640.2d682f57@redhat.com>
In-Reply-To: <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Wed, 30 Jun 2021 15:07:17 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This code is called from the machine code (if ACPI supported)
> to generate the ACPI ERST table.
should be along lines:
This builds ACPI ERST table /spec ref/ to inform OSMP
how to communicate with ... device.

> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 214 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index 6e9bd2e..1f1dbbc 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -555,6 +555,220 @@ static const MemoryRegionOps erst_mem_ops = {
>  /*******************************************************************/
>  /*******************************************************************/
>  
> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction_entry(GArray *table_data,
> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t register_bit_width,
> +    uint64_t register_address,
> +    uint64_t value,
> +    uint64_t mask)
like I mentioned in previous patch, It could be simplified
a lot if it's possible to use fixed 64-bit access with every
action and the same width mask. 

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
> +    ERSTDeviceState *s = ACPIERST(erst_dev);

globals are not welcomed in new code,
pass erst_dev as argument here (ex: find_vmgenid_dev)

> +    unsigned action;
> +    unsigned erst_start = table_data->len;
> +

> +    s->bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    trace_acpi_erst_pci_bar_0(s->bar0);
> +    s->bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);

just store pci_get_bar_addr(PCI_DEVICE(erst_dev), 0) in local variable,
Bar 1 is not used in this function so you don't need it here.


> +    trace_acpi_erst_pci_bar_1(s->bar1);
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    /* serialization_header_length */
comments documenting table entries should be verbatim copy from spec,
see build_amd_iommu() as example of preferred style.

> +    build_append_int_noprefix(table_data, 48, 4);
> +    /* reserved */
> +    build_append_int_noprefix(table_data,  0, 4);
> +    /*
> +     * instruction_entry_count - changes to the number of serialization
> +     * instructions in the ACTIONs below must be reflected in this
> +     * pre-computed value.
> +     */
> +    build_append_int_noprefix(table_data, 29, 4);
a bit fragile as it can easily diverge from actual number later on.
maybe instead of building instruction entries in place, build it
in separate array and when done, use actual count to fill instruction_entry_count.
pseudo code could look like:

     /* prepare instructions in advance because ... */
     GArray table_instruction_data;
     build_serialization_instruction_entry(table_instruction_data,...);;
     ...
     build_serialization_instruction_entry(table_instruction_data,...);
     /* instructions count */
     build_append_int_noprefix(table_data, table_instruction_data.len/entry_size, 4);
     /* copy prepared in advance instructions */
     g_array_append_vals(table_data, table_instruction_data.data, table_instruction_data.len);          
   

> +
> +#define MASK8  0x00000000000000FFUL
> +#define MASK16 0x000000000000FFFFUL
> +#define MASK32 0x00000000FFFFFFFFUL
> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> +
> +    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
I'd unroll this loop and just directly code entries in required order.
also drop reserved and nop actions/instructions or explain why they are necessary.

> +        switch (action) {
> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
given these names will/should never be exposed outside of hw/acpi/erst.c
I'd drop ACPI_ERST_ACTION_/ACPI_ERST_INST_ prefixes (i.e. use names as defined in spec)
if it doesn't cause build issues.

> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_END_OPERATION:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 32,
> +                s->bar0 + ERST_CSR_VALUE , 0, MASK32);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER_VALUE , 0, 32,
> +                s->bar0 + ERST_CSR_VALUE, 0x01, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 64,
> +                s->bar0 + ERST_CSR_VALUE , 0, MASK64);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_RESERVED:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
> +        default:
> +            build_serialization_instruction_entry(table_data, action,
> +                ACPI_ERST_INST_NOOP, 0, 0, 0, action, 0);
> +            break;
> +        }
> +    }
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + erst_start),
> +                 "ERST", table_data->len - erst_start,
> +                 1, oem_id, oem_table_id);
> +}
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +
>  static const VMStateDescription erst_vmstate  = {
>      .name = "acpi-erst",
>      .version_id = 1,



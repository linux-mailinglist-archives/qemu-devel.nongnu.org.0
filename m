Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5849B389
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:14:38 +0100 (CET)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKib-000556-1P
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:14:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCKaA-0001SG-6E
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCKZw-0000Jq-PH
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643112339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AnnR9AdcdudLfYC0/PisyxncU+mKU/x42eYmDWV7diU=;
 b=h1SOQm5Q2FlL2or60hwTrPhVXF5kk3/Z0u0dPVzivn+XkEJoaClzFPumMYQ6YkfpQzZZqp
 AJnKvAu2eF4z8hlbSBWlw4BKYgIW8+mfgb+dj1zzTbCvnvWBPLxF9Ij4z8IjUWOuA7wWmI
 rLqF15KZdpgyqw+e3OgOCw+wzvTwcdI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-AM6qaqhCPLKtdfBVqRqk9Q-1; Tue, 25 Jan 2022 07:05:38 -0500
X-MC-Unique: AM6qaqhCPLKtdfBVqRqk9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a1ca503000000b0035056b042deso1382256wme.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 04:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AnnR9AdcdudLfYC0/PisyxncU+mKU/x42eYmDWV7diU=;
 b=xSafceds7j8MGpbVSv11zxT1EIijHkCJq3GrjH1hV7WcCoXVXztc/rEFcLOGmlcvWN
 MLG6o91Ypzv6IWy5mtU6FSV4RhDst8NfFgo9JoVK+zEe/+5kRgOL2+PqBBUTl+DLZQ2v
 8ZLQ54w4x8Z717nUgcpK9RfAN32LlMPCsJvIVGisNRJ/toUp4SWnUyQeyYKPNQcjXICP
 08GynTjwl3j3CcPiMQ6vRzevCv2reJzOt69iHl24pas6K3e8TbqYwfcYetwBTR3ri/Fu
 YVF/yA5whORLefAiAsmsVJbRZHt8nIxrgSYZPNWWvcBu8Dr4ircWq3HcuEzLztUySHLe
 TXuw==
X-Gm-Message-State: AOAM533gxoO93FT/1zZVRhNrWHM64lj3mm/ApCUdz8XghMGT0/3pPLr7
 d+LSMqyRi4n8mfwGWmzbmUhSQ/8dIG6V9iwV7wqTYaEWp/d1aSlJZat/vdAiF4plq5Bs5nQOsl+
 Bem9Hp48nKELKrIc=
X-Received: by 2002:a5d:58f7:: with SMTP id f23mr1042420wrd.7.1643112336662;
 Tue, 25 Jan 2022 04:05:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq8g/fjDpYDmFV000UgcI1Tkfj5uELsuIOJYdD2wyNqoFl2G6U+/FbS7gzQY5w25uQkOq+ug==
X-Received: by 2002:a5d:58f7:: with SMTP id f23mr1042389wrd.7.1643112336348;
 Tue, 25 Jan 2022 04:05:36 -0800 (PST)
Received: from redhat.com ([2.55.22.56])
 by smtp.gmail.com with ESMTPSA id z1sm162527wma.20.2022.01.25.04.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 04:05:35 -0800 (PST)
Date: Tue, 25 Jan 2022 07:05:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20220125070221-mutt-send-email-mst@kernel.org>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, Eric DeVolder <eric.devolder@oracle.com>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 04:23:49PM +0530, Ani Sinha wrote:
> 
> 
> On Mon, 24 Jan 2022, Eric DeVolder wrote:
> 
> > This builds the ACPI ERST table to inform OSPM how to communicate
> > with the acpi-erst device.
> >
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > ---
> >  hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 188 insertions(+)
> >
> > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > index fe9ba51..b0c7539 100644
> > --- a/hw/acpi/erst.c
> > +++ b/hw/acpi/erst.c
> > @@ -59,6 +59,27 @@
> >  #define STATUS_RECORD_STORE_EMPTY     0x04
> >  #define STATUS_RECORD_NOT_FOUND       0x05
> >
> > +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> > +#define INST_READ_REGISTER                 0x00
> > +#define INST_READ_REGISTER_VALUE           0x01
> > +#define INST_WRITE_REGISTER                0x02
> > +#define INST_WRITE_REGISTER_VALUE          0x03
> > +#define INST_NOOP                          0x04
> > +#define INST_LOAD_VAR1                     0x05
> > +#define INST_LOAD_VAR2                     0x06
> > +#define INST_STORE_VAR1                    0x07
> > +#define INST_ADD                           0x08
> > +#define INST_SUBTRACT                      0x09
> > +#define INST_ADD_VALUE                     0x0A
> > +#define INST_SUBTRACT_VALUE                0x0B
> > +#define INST_STALL                         0x0C
> > +#define INST_STALL_WHILE_TRUE              0x0D
> > +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> > +#define INST_GOTO                          0x0F
> > +#define INST_SET_SRC_ADDRESS_BASE          0x10
> > +#define INST_SET_DST_ADDRESS_BASE          0x11
> > +#define INST_MOVE_DATA                     0x12
> > +
> >  /* UEFI 2.1: Appendix N Common Platform Error Record */
> >  #define UEFI_CPER_RECORD_MIN_SIZE 128U
> >  #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> > @@ -172,6 +193,173 @@ typedef struct {
> >
> >  /*******************************************************************/
> >  /*******************************************************************/
> > +
> > +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> > +static void build_serialization_instruction_entry(GArray *table_data,
> > +    uint8_t serialization_action,
> > +    uint8_t instruction,
> > +    uint8_t flags,
> > +    uint8_t register_bit_width,
> > +    uint64_t register_address,
> > +    uint64_t value)
> > +{
> > +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> > +    struct AcpiGenericAddress gas;
> > +    uint64_t mask;
> > +
> > +    /* Serialization Action */
> > +    build_append_int_noprefix(table_data, serialization_action, 1);
> > +    /* Instruction */
> > +    build_append_int_noprefix(table_data, instruction         , 1);
> > +    /* Flags */
> > +    build_append_int_noprefix(table_data, flags               , 1);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0                   , 1);
> > +    /* Register Region */
> > +    gas.space_id = AML_SYSTEM_MEMORY;
> > +    gas.bit_width = register_bit_width;
> > +    gas.bit_offset = 0;
> > +    gas.access_width = ctz32(register_bit_width) - 2;
> > +    gas.address = register_address;
> > +    build_append_gas_from_struct(table_data, &gas);
> > +    /* Value */
> > +    build_append_int_noprefix(table_data, value  , 8);
> > +    /* Mask */
> > +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
> > +    build_append_int_noprefix(table_data, mask  , 8);
> > +}
> > +
> > +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> > +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> > +    const char *oem_id, const char *oem_table_id)
> > +{
> > +    GArray *table_instruction_data;
> > +    unsigned action;
> > +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> > +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> > +                        .oem_table_id = oem_table_id };
> > +
> > +    trace_acpi_erst_pci_bar_0(bar0);
> > +
> > +    /*
> > +     * Serialization Action Table
> > +     * The serialization action table must be generated first
> > +     * so that its size can be known in order to populate the
> > +     * Instruction Entry Count field.
> > +     */
> > +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> > +
> > +    /*
> > +     * Macros for use with construction of the action instructions
> > +     */
> > +#define BUILD_READ_REGISTER(width_in_bits, reg) \
> > +    build_serialization_instruction_entry(table_instruction_data, \
> > +        action, INST_READ_REGISTER, 0, width_in_bits, \
> > +        bar0 + reg, 0)
> > +
> > +#define BUILD_READ_REGISTER_VALUE(width_in_bits, reg, value) \
> > +    build_serialization_instruction_entry(table_instruction_data, \
> > +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
> > +        bar0 + reg, value)
> > +
> > +#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
> > +    build_serialization_instruction_entry(table_instruction_data, \
> > +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
> > +        bar0 + reg, value)
> > +
> > +#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
> > +    build_serialization_instruction_entry(table_instruction_data, \
> > +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
> > +        bar0 + reg, value)


I think these macros which in a hidden way use the bar0 variable really
should be replaced with inline functions, improving type safety.




> > +
> > +    /* Serialization Instruction Entries */
> > +    action = ACTION_BEGIN_WRITE_OPERATION;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_BEGIN_READ_OPERATION;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_BEGIN_CLEAR_OPERATION;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_END_OPERATION;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_SET_RECORD_OFFSET;
> > +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_EXECUTE_OPERATION;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
> > +        ERST_EXECUTE_OPERATION_MAGIC);
> 
> except here, on all cases we have
> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> 
> We should treat the above as special case and simplify the rest of the
> calls (eliminate repeated common arguments).
> 
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_CHECK_BUSY_STATUS;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
> > +
> > +    action = ACTION_GET_COMMAND_STATUS;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > +
> > +    action = ACTION_GET_RECORD_IDENTIFIER;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > +
> > +    action = ACTION_SET_RECORD_IDENTIFIER;
> > +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> 
> This one seems reverted. Should this be
> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> 
> like others?
> 
> > +
> > +    action = ACTION_GET_RECORD_COUNT;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > +
> > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +
> > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > +
> > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > +
> > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > +
> > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > +
> 
> BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
> argument. WE should eliminate this repeated passing of same argument.
> 
> 
> > +    /* Serialization Header */
> > +    acpi_table_begin(&table, table_data);
> > +
> > +    /* Serialization Header Size */
> > +    build_append_int_noprefix(table_data, 48, 4);
> > +
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data,  0, 4);
> > +
> > +    /*
> > +     * Instruction Entry Count
> > +     * Each instruction entry is 32 bytes
> > +     */
> > +    g_assert((table_instruction_data->len) % 32 == 0);
> > +    build_append_int_noprefix(table_data,
> > +        (table_instruction_data->len / 32), 4);
> > +
> > +    /* Serialization Instruction Entries */
> > +    g_array_append_vals(table_data, table_instruction_data->data,
> > +        table_instruction_data->len);
> > +    g_array_free(table_instruction_data, TRUE);
> > +
> > +    acpi_table_end(linker, &table);
> > +}
> > +
> > +/*******************************************************************/
> > +/*******************************************************************/
> >  static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
> >  {
> >      uint8_t *rc = NULL;
> > --
> > 1.8.3.1
> >
> >



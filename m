Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8192473B38
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 04:00:50 +0100 (CET)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwy3d-0005TU-8c
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 22:00:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwy1u-0004fp-5D
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 21:59:02 -0500
Received: from [2a00:1450:4864:20::52b] (port=45665
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwy1l-0007ex-5O
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 21:59:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id y12so57559936eda.12
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 18:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URNt2VHRAlWxvgm9FD3PkSttZ8XRDvmoz18rVXAJuRk=;
 b=7ozrKByGmheBAbRYz+hm7DKUuFFGvN3O2JAqyQTu8X6C0XUU9CXn+DgLXQF9PcNC7U
 S/Y7VRsqvPBRUtNee8Ui2a7jSDK7mtEUb5Txpwm5zrWrKpyL8KPycc4R/6I15acCK//b
 A+RUG0VVgE6djwtxSVyi8BqOP2PCLCp6t78McI1wTddPz+iFJRF8ukn0PItHGsZ86CTK
 lXxh23lFbrGsPw+TPUKHd1hVN02d/4U2V6BgEiAw/NAr9vL3vHqgkCaycmLnzamSrMU2
 b3dXDECDLBbbXeWUMW7YShHjoM0d0S/fS1wDDaFrEmmJvmtyUKebZMp2IZi4YRUgDnnj
 sRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URNt2VHRAlWxvgm9FD3PkSttZ8XRDvmoz18rVXAJuRk=;
 b=qzGVDrUiRHfgQh+RssTRrD2oGoX81dhbXGIXB3WwNkuo2k0jZRPmKujsA45yyD3l3/
 jt/0dIifDNvEMb4ushMaMhtNZIx1Naaj32HZdrQAldh7mwG9ORvnfxQG9S3TerXVubX8
 m1/qSynlc9GDt1jA/pJGoXl+sTpW0/MfgVMYcbXlbFqAXP/YCoHh+q/ICc/SAlF9kEw7
 mX7PrFyK1nn4icFXeEZgt6sPIFZX2oARwPQxGD0V2297X+W4F3vuRQm2L2WE6Z0/gOGe
 cI8QGv85vYVquUVR76CowFrbkMKEUm5NYdckIrW+0QtVx5ak8qZNoD580dcHphqb+hnX
 I/5w==
X-Gm-Message-State: AOAM533UGIrozP3h/2J2OeXMitTQe2RHeHJzwlzuomQ4OTBHrq1MkEFx
 HHlRHxpQNWTC1sEigsYtRcKsdiRJEbbFYCrg8z5J/A==
X-Google-Smtp-Source: ABdhPJyjd0NYUAPnwtC8G6tj6BhrkiJU+ax+C3kuQg+u+1cJIJI0m1BoGIDG1EoID93hAbPK/FbIEcAi2LGA2b4KjFc=
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr2778132ejc.328.1639450730084; 
 Mon, 13 Dec 2021 18:58:50 -0800 (PST)
MIME-Version: 1.0
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
 <CAARzgwxqBfk4jSdH7EDzUHjVPBr7DiLkKSeq7grvFOX_AX3hgQ@mail.gmail.com>
 <45a36fcb-d778-e077-a1ac-522d75e79af8@oracle.com>
In-Reply-To: <45a36fcb-d778-e077-a1ac-522d75e79af8@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 14 Dec 2021 08:28:39 +0530
Message-ID: <CAARzgwzrxmArMNHhG32ZFe-ryC2t3YHfsPcFt+tvYnOcOF5v_Q@mail.gmail.com>
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On Tue, Dec 14, 2021 at 2:57 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> Hi Ani,
> inline response below.
> Eric
>
> On 12/12/21 07:43, Ani Sinha wrote:
> > .
> >
> > On Thu, Dec 9, 2021 at 11:28 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
> >>
> >> This builds the ACPI ERST table to inform OSPM how to communicate
> >> with the acpi-erst device.
> >
> > This patch starts in the middle of pci device code addition, between
> > erst_reg_ops and erst_post_load. I do not like this :(
>
> Below you suggest moving the contents of this patch to the bottom of erst.c.
> Before I do that, consider moving the contents to the top of the file instead, I believe that would
> address the concerns cited here, and it would allow for the last line of the file to be the
> type_init(), like other files.
>
> I'll move it, just let me know if top or bottom.

Moving to the top is fine.

> Thanks!
> eric
>
>
> >
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >>   hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 241 insertions(+)
> >>
> >> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> >> index 81f5435..753425a 100644
> >> --- a/hw/acpi/erst.c
> >> +++ b/hw/acpi/erst.c
> >> @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
> >>       .endianness = DEVICE_NATIVE_ENDIAN,
> >>   };
> >>
> >> +
> >> +/*******************************************************************/
> >> +/*******************************************************************/
> >> +
> >> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> >> +#define INST_READ_REGISTER                 0x00
> >> +#define INST_READ_REGISTER_VALUE           0x01
> >> +#define INST_WRITE_REGISTER                0x02
> >> +#define INST_WRITE_REGISTER_VALUE          0x03
> >> +#define INST_NOOP                          0x04
> >> +#define INST_LOAD_VAR1                     0x05
> >> +#define INST_LOAD_VAR2                     0x06
> >> +#define INST_STORE_VAR1                    0x07
> >> +#define INST_ADD                           0x08
> >> +#define INST_SUBTRACT                      0x09
> >> +#define INST_ADD_VALUE                     0x0A
> >> +#define INST_SUBTRACT_VALUE                0x0B
> >> +#define INST_STALL                         0x0C
> >> +#define INST_STALL_WHILE_TRUE              0x0D
> >> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> >> +#define INST_GOTO                          0x0F
> >> +#define INST_SET_SRC_ADDRESS_BASE          0x10
> >> +#define INST_SET_DST_ADDRESS_BASE          0x11
> >> +#define INST_MOVE_DATA                     0x12
> >
> > I prefer these definitions to come at the top of the file along with
> > other definitions.
> >
> >> +
> >> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> >> +static void build_serialization_instruction_entry(GArray *table_data,
> >
> > This function and buiild_erst() can come at the end of erst.c. They go
> > together and are doing a common but different operation from the
> > operations of the pci device - building the erst table. Hence, ther
> > code should be separate from pci device code. A new file would be an
> > overkill at this state IMHO but in the future if erst table generation
> > code gains more weight, it can be split into two files.
> >
> >> +    uint8_t serialization_action,
> >> +    uint8_t instruction,
> >> +    uint8_t flags,
> >> +    uint8_t register_bit_width,
> >> +    uint64_t register_address,
> >> +    uint64_t value,
> >> +    uint64_t mask)
> >> +{
> >> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> >> +    struct AcpiGenericAddress gas;
> >> +
> >> +    /* Serialization Action */
> >> +    build_append_int_noprefix(table_data, serialization_action, 1);
> >> +    /* Instruction */
> >> +    build_append_int_noprefix(table_data, instruction         , 1);
> >> +    /* Flags */
> >> +    build_append_int_noprefix(table_data, flags               , 1);
> >> +    /* Reserved */
> >> +    build_append_int_noprefix(table_data, 0                   , 1);
> >> +    /* Register Region */
> >> +    gas.space_id = AML_SYSTEM_MEMORY;
> >> +    gas.bit_width = register_bit_width;
> >> +    gas.bit_offset = 0;
> >> +    switch (register_bit_width) {
> >> +    case 8:
> >> +        gas.access_width = 1;
> >> +        break;
> >> +    case 16:
> >> +        gas.access_width = 2;
> >> +        break;
> >> +    case 32:
> >> +        gas.access_width = 3;
> >> +        break;
> >> +    case 64:
> >> +        gas.access_width = 4;
> >> +        break;
> >> +    default:
> >> +        gas.access_width = 0;
> >> +        break;
> >> +    }
> >> +    gas.address = register_address;
> >> +    build_append_gas_from_struct(table_data, &gas);
> >> +    /* Value */
> >> +    build_append_int_noprefix(table_data, value  , 8);
> >> +    /* Mask */
> >> +    build_append_int_noprefix(table_data, mask   , 8);
> >> +}
> >> +
> >> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> >> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> >> +    const char *oem_id, const char *oem_table_id)
> >> +{
> >> +    GArray *table_instruction_data;
> >> +    unsigned action;
> >> +    pcibus_t bar0, bar1;
> >> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> >> +                        .oem_table_id = oem_table_id };
> >> +
> >> +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> >> +    trace_acpi_erst_pci_bar_0(bar0);
> >> +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
> >> +    trace_acpi_erst_pci_bar_1(bar1);
> >> +
> >> +#define MASK8  0x00000000000000FFUL
> >> +#define MASK16 0x000000000000FFFFUL
> >> +#define MASK32 0x00000000FFFFFFFFUL
> >> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> >> +
> >> +    /*
> >> +     * Serialization Action Table
> >> +     * The serialization action table must be generated first
> >> +     * so that its size can be known in order to populate the
> >> +     * Instruction Entry Count field.
> >> +     */
> >> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> >> +
> >> +    /* Serialization Instruction Entries */
> >> +    action = ACTION_BEGIN_WRITE_OPERATION;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_BEGIN_READ_OPERATION;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_END_OPERATION;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_SET_RECORD_OFFSET;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER      , 0, 32,
> >> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_EXECUTE_OPERATION;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_CHECK_BUSY_STATUS;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER_VALUE , 0, 32,
> >> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
> >> +
> >> +    action = ACTION_GET_COMMAND_STATUS;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 32,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
> >> +
> >> +    action = ACTION_GET_RECORD_IDENTIFIER;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 64,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> >> +
> >> +    action = ACTION_SET_RECORD_IDENTIFIER;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER      , 0, 64,
> >> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_GET_RECORD_COUNT;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 32,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> >> +
> >> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +
> >> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 64,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> >> +
> >> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 64,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> >> +
> >> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 32,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> >> +
> >> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> >> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> >> +    build_serialization_instruction_entry(table_instruction_data,
> >> +        action, INST_READ_REGISTER       , 0, 64,
> >> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> >> +
> >> +    /* Serialization Header */
> >> +    acpi_table_begin(&table, table_data);
> >> +
> >> +    /* Serialization Header Size */
> >> +    build_append_int_noprefix(table_data, 48, 4);
> >> +
> >> +    /* Reserved */
> >> +    build_append_int_noprefix(table_data,  0, 4);
> >> +
> >> +    /*
> >> +     * Instruction Entry Count
> >> +     * Each instruction entry is 32 bytes
> >> +     */
> >> +    build_append_int_noprefix(table_data,
> >> +        (table_instruction_data->len / 32), 4);
> >> +
> >> +    /* Serialization Instruction Entries */
> >> +    g_array_append_vals(table_data, table_instruction_data->data,
> >> +        table_instruction_data->len);
> >> +    g_array_free(table_instruction_data, TRUE);
> >> +
> >> +    acpi_table_end(linker, &table);
> >> +}
> >> +
> >>   /*******************************************************************/
> >>   /*******************************************************************/
> >>   static int erst_post_load(void *opaque, int version_id)
> >> --
> >> 1.8.3.1
> >>


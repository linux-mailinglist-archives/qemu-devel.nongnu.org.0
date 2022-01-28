Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C649FF9B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:34:50 +0100 (CET)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDV97-0001bR-9a
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nDV0E-0001cI-RG
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:25:40 -0500
Received: from [2a00:1450:4864:20::636] (port=40782
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nDV00-00075T-4m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:25:38 -0500
Received: by mail-ej1-x636.google.com with SMTP id p15so18202146ejc.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVxbFD4W8fpvH5mducz4ED+L4HQBWhYfeiG9iyucs3o=;
 b=yJGnDSbWLaWAt7tC1Et0AzbWI5jgDZ2JXrxMA1oeYmEmrNMYC/NLv0ldDi8zwCQ68p
 vCVi/69qlUMA6PYtsi6T6yKy/BJyqdNvemjxl70cwltPNgtZ3Otjj60ERUvk5EKwuByb
 6cs1EJ3Cu9fXCmEl5efIfQ6alA7j3vrQCeugYaxMYRUYRw7lXGbPU+D5k8Cc183Qh34z
 6Ud6Mo4r1M4q3ZdxiNc6My3TddnurTIWOzs2W8mb0lqZJQfnU4H0RqhawKhFVx0R4e2L
 CVF29mRs+yxg2mmav5g7Lj2z7HHbmAFCm02HgfN+VLCTU+wJCoJw7ms7w7UayFP3Ewcu
 4LbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVxbFD4W8fpvH5mducz4ED+L4HQBWhYfeiG9iyucs3o=;
 b=XpcWUIcVuPo2TOZeYunmslCIrwmLms9egOU7JL4QTMIDHX5NqeKMdUjLiLNZVW8V3L
 /GU8Kpl+O/h407bw15zXdHwOyB8bQ07eEWS/ilFNZnQoU4tjG8ulC6JdecPfc1yQJJF0
 /ARn4wph8MpoZNXo8jp7I2b0Kwmfa77RXrZBeH0e8516+CT1sjItfjB69W6H4VQP+FNS
 EUib7nPKSNnPEMZPcUnZFxHV59ErfaNpeGtDcYu/DkkjV39Vfz5bhm9l/2kDBFbxZSkC
 VAAI9qwkUWeVxnAB/YPB4FtW69EygMHokV1WIXLQGde8IF8+a7Ua15zml/dpEwT99kCN
 a58Q==
X-Gm-Message-State: AOAM530kMP8Mz47ORrnWR1KwR7TuYfdgizk67Sbly3xc5sdMVTKWIMhR
 hES84GaDtwDFzhVWIWXKoxlwWzRyFvCHTHTC3L1rbg==
X-Google-Smtp-Source: ABdhPJwiGwjyAN+HSQVnC+IfK/5R182CIuokfKCSuQ6Y0SjeMBGFE4DJk+o9VMkNVo1xCj3Y7vvCJO05IUVD9y6L1xs=
X-Received: by 2002:a17:907:9493:: with SMTP id
 dm19mr7664643ejc.51.1643390715602; 
 Fri, 28 Jan 2022 09:25:15 -0800 (PST)
MIME-Version: 1.0
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
 <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
 <20220127193136-mutt-send-email-mst@kernel.org>
 <c5460e4e-61dd-78ad-6703-e518a8302097@oracle.com>
 <20220128105311-mutt-send-email-mst@kernel.org>
 <db012849-b7ec-eecc-bf41-a6b211c021f0@oracle.com>
 <20220128111327-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220128111327-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 28 Jan 2022 22:55:04 +0530
Message-ID: <CAARzgwx-5p2bvjs-4csWEo2yKkg4CSgKhhbnmESfGmojS775=g@mail.gmail.com>
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d4c5a105d6a7b702"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000d4c5a105d6a7b702
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 28, 2022 at 9:44 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Jan 28, 2022 at 10:01:18AM -0600, Eric DeVolder wrote:
> > Michael, thanks! See inline response below, please.
> > eric
> >
> > On 1/28/22 09:54, Michael S. Tsirkin wrote:
> > > On Fri, Jan 28, 2022 at 09:11:41AM -0600, Eric DeVolder wrote:
> > > > Michael,
> > > > Thanks for examining this. Inline response below.
> > > > eric
> > > >
> > > > On 1/27/22 18:37, Michael S. Tsirkin wrote:
> > > > > On Thu, Jan 27, 2022 at 04:02:07PM -0600, Eric DeVolder wrote:
> > > > > > Ani,
> > > > > > Thanks for the RB! Inline responses below.
> > > > > > eric
> > > > > >
> > > > > > On 1/27/22 02:36, Ani Sinha wrote:
> > > > > > >
> > > > > > >
> > > > > > > On Wed, 26 Jan 2022, Eric DeVolder wrote:
> > > > > > >
> > > > > > > > This builds the ACPI ERST table to inform OSPM how to
> communicate
> > > > > > > > with the acpi-erst device.
> > > > > > >
> > > > > > > There might be more optimizations possible but I think we have
> messaged
> > > > > > > this code enough. We can further rework the code if needed in
> subsequent
> > > > > > > patches once this is pushed.
> > > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > > > > >
> > > > > > > with some minor comments,
> > > > > > >
> > > > > > > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > > > > > >
> > > > > > > >     hw/acpi/erst.c | 225
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >     1 file changed, 225 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > > > > > > index fe9ba51..5d5a639 100644
> > > > > > > > --- a/hw/acpi/erst.c
> > > > > > > > +++ b/hw/acpi/erst.c
> > > > > > > > @@ -59,6 +59,27 @@
> > > > > > > >     #define STATUS_RECORD_STORE_EMPTY     0x04
> > > > > > > >     #define STATUS_RECORD_NOT_FOUND       0x05
> > > > > > > >
> > > > > > > > +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> > > > > > > > +#define INST_READ_REGISTER                 0x00
> > > > > > > > +#define INST_READ_REGISTER_VALUE           0x01
> > > > > > > > +#define INST_WRITE_REGISTER                0x02
> > > > > > > > +#define INST_WRITE_REGISTER_VALUE          0x03
> > > > > > > > +#define INST_NOOP                          0x04
> > > > > > > > +#define INST_LOAD_VAR1                     0x05
> > > > > > > > +#define INST_LOAD_VAR2                     0x06
> > > > > > > > +#define INST_STORE_VAR1                    0x07
> > > > > > > > +#define INST_ADD                           0x08
> > > > > > > > +#define INST_SUBTRACT                      0x09
> > > > > > > > +#define INST_ADD_VALUE                     0x0A
> > > > > > > > +#define INST_SUBTRACT_VALUE                0x0B
> > > > > > > > +#define INST_STALL                         0x0C
> > > > > > > > +#define INST_STALL_WHILE_TRUE              0x0D
> > > > > > > > +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> > > > > > > > +#define INST_GOTO                          0x0F
> > > > > > > > +#define INST_SET_SRC_ADDRESS_BASE          0x10
> > > > > > > > +#define INST_SET_DST_ADDRESS_BASE          0x11
> > > > > > > > +#define INST_MOVE_DATA                     0x12
> > > > > > > > +
> > > > > > > >     /* UEFI 2.1: Appendix N Common Platform Error Record */
> > > > > > > >     #define UEFI_CPER_RECORD_MIN_SIZE 128U
> > > > > > > >     #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> > > > > > > > @@ -172,6 +193,210 @@ typedef struct {
> > > > > > > >
> > > > > > > >
>  /*******************************************************************/
> > > > > > > >
>  /*******************************************************************/
> > > > > > > > +typedef struct {
> > > > > > > > +    GArray *table_data;
> > > > > > > > +    pcibus_t bar;
> > > > > > > > +    uint8_t instruction;
> > > > > > > > +    uint8_t flags;
> > > > > > > > +    uint8_t register_bit_width;
> > > > > > > > +    pcibus_t register_offset;
> > > > > > > > +} BuildSerializationInstructionEntry;
> > > > > > > > +
> > > > > > > > +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> > > > > > > > +static void build_serialization_instruction(
> > > > > > > > +    BuildSerializationInstructionEntry *e,
> > > > > > > > +    uint8_t serialization_action,
> > > > > > > > +    uint64_t value)
> > > > > > > > +{
> > > > > > > > +    /* ACPI 4.0: Table 17-18 Serialization Instruction
> Entry */
> > > > > > > > +    struct AcpiGenericAddress gas;
> > > > > > > > +    uint64_t mask;
> > > > > > > > +
> > > > > > > > +    /* Serialization Action */
> > > > > > > > +    build_append_int_noprefix(e->table_data,
> serialization_action, 1);
> > > > > > > > +    /* Instruction */
> > > > > > > > +    build_append_int_noprefix(e->table_data,
> e->instruction, 1);
> > > > > > > > +    /* Flags */
> > > > > > > > +    build_append_int_noprefix(e->table_data, e->flags, 1);
> > > > > > > > +    /* Reserved */
> > > > > > > > +    build_append_int_noprefix(e->table_data, 0, 1);
> > > > > > > > +    /* Register Region */
> > > > > > > > +    gas.space_id = AML_SYSTEM_MEMORY;
> > > > > > > > +    gas.bit_width = e->register_bit_width;
> > > > > > > > +    gas.bit_offset = 0;
> > > > > > > > +    gas.access_width = ctz32(e->register_bit_width) - 2;
> > > > > > >
> > > > > > > Should this be casted as unit8_t?
> > > > > > OK, done.
> > > > > >
> > > > > > >
> > > > > > > > +    gas.address = (uint64_t)(e->bar + e->register_offset);
> > > > > > > > +    build_append_gas_from_struct(e->table_data, &gas);
> > > > > > > > +    /* Value */
> > > > > > > > +    build_append_int_noprefix(e->table_data, value, 8);
> > > > > > > > +    /* Mask */
> > > > > > > > +    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
> > > > > > > > +    build_append_int_noprefix(e->table_data, mask, 8);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> > > > > > > > +void build_erst(GArray *table_data, BIOSLinker *linker,
> Object *erst_dev,
> > > > > > > > +    const char *oem_id, const char *oem_table_id)
> > > > > > > > +{
> > > > > > > > +    /*
> > > > > > > > +     * Serialization Action Table
> > > > > > > > +     * The serialization action table must be generated
> first
> > > > > > > > +     * so that its size can be known in order to populate
> the
> > > > > > > > +     * Instruction Entry Count field.
> > > > > > > > +     */
> > > > > > > > +    GArray *table_instruction_data = g_array_new(FALSE,
> FALSE, sizeof(char));
> > > > > > > > +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev),
> 0);
> > > > > > > > +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id =
> oem_id,
> > > > > > > > +                        .oem_table_id = oem_table_id };
> > > > > > > > +    /* Contexts for the different ways ACTION and VALUE are
> accessed */
> > > > > > > > +    BuildSerializationInstructionEntry rd_value_32_val = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_READ_REGISTER_VALUE,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 32,
> > > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > > +    };
> > > > > > > > +    BuildSerializationInstructionEntry rd_value_32 = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_READ_REGISTER,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 32,
> > > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > > +    };
> > > > > > > > +    BuildSerializationInstructionEntry rd_value_64 = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_READ_REGISTER,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 64,
> > > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > > +    };
> > > > > > > > +    BuildSerializationInstructionEntry wr_value_32_val = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_WRITE_REGISTER_VALUE,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 32,
> > > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > > +    };
> > > > > > > > +    BuildSerializationInstructionEntry wr_value_32 = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_WRITE_REGISTER,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 32,
> > > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > > +    };
> > > > > > > > +    BuildSerializationInstructionEntry wr_value_64 = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_WRITE_REGISTER,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 64,
> > > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > > +    };
> > > > > > > > +    BuildSerializationInstructionEntry wr_action = {
> > > > > > > > +        .table_data = table_instruction_data,
> > > > > > > > +        .bar = bar0,
> > > > > > > > +        .instruction = INST_WRITE_REGISTER_VALUE,
> > > > > > > > +        .flags = 0,
> > > > > > > > +        .register_bit_width = 32,
> > > > > > > > +        .register_offset = ERST_ACTION_OFFSET,
> > > > > > > > +    };
> > > > > > >
> > > > > > > We can probably write a macro to simply generating these
> structs. I see
> > > > > > > .bar and .flags are the same in all structs. The .bit_width
> can be a param
> > > > > > > into the macro etc.
> > > > > > Agree, however the request was to NOT hide the use of local
> variables in
> > > > > > macros, so while .flags is always 0, .instruction,
> .register_bit_width and .register_offset
> > > > > > would be parameters, that leaves .table_data and .bar which just
> need the local
> > > > > > variables. Is the following acceptable (which hides the use of
> the local variables)?
> > > > >
> > > > > You can just use assignment:
> > > > >
> > > > >      BuildSerializationInstructionEntry entry = {
> > > > >          .table_data = table_instruction_data,
> > > > >          .bar = bar0,
> > > > >          .flags = 0,
> > > > >          .register_bit_width = 32,
> > > > >      };
> > > > >      BuildSerializationInstructionEntry rd_value_32_val = entry;
> > > > >      rd_value_32_val.action = INST_READ_REGISTER_VALUE;
> > > > >      rd_value_32_val.register_offset = ERST_ACTION_OFFSET;
> > > > >
> > > > > and so on.
> > > > > not sure it's worth it, it's just a couple of lines.
> > > > >
> > > >
> > > > OK, here is the equivalent using struct assignment, is this what you
> were after?
> > > >
> > > >      BuildSerializationInstructionEntry base = {
> > > >          .table_data = table_instruction_data,
> > > >          .bar = bar0,
> > > >          .instruction = INST_WRITE_REGISTER,
> > > >          .flags = 0,
> > > >          .register_bit_width = 32,
> > > >          .register_offset = ERST_VALUE_OFFSET,
> > > >      };
> > > >      BuildSerializationInstructionEntry rd_value_32_val = base;
> > > >      rd_value_32_val.instruction = INST_READ_REGISTER_VALUE;
> > > >      BuildSerializationInstructionEntry rd_value_32 = base;
> > > >      rd_value_32.instruction = INST_READ_REGISTER;
> > > >      BuildSerializationInstructionEntry rd_value_64 = base;
> > > >      rd_value_64.instruction = INST_READ_REGISTER;
> > > >      rd_value_64.register_bit_width = 64;
> > > >      BuildSerializationInstructionEntry wr_value_32_val = base;
> > > >      wr_value_32_val.instruction = INST_WRITE_REGISTER_VALUE;
> > > >      BuildSerializationInstructionEntry wr_value_32 = base;
> > > >      BuildSerializationInstructionEntry wr_value_64 = base;
> > > >      wr_value_64.register_bit_width = 64;
> > > >      BuildSerializationInstructionEntry wr_action = base;
> > > >      wr_action.instruction = INST_WRITE_REGISTER_VALUE;
> > > >      wr_action.register_offset = ERST_ACTION_OFFSET;
> > > >
> > >
> > > That's what I described, yes. We should have some empty lines here I
> > > guess. I'm ok with the original one too, there's not too much
> > > duplication.
> >
> > Are the blank lines referring to spacing out the setup of each of the 7
> accesors?
> > If so, I could put a one line comment between each setup? Or is a blank
> line also
> > needed?
>
> A blank line between declarations and code is usually a good idea.
>
>
> > Is it OK to post v15 with the struct assignment approach? Or would you
> prefer the
> > explicit structs (which is what I think you mean by 'the original one')?


I prefer the explicit structs as you had posted before.


> >
> > Thanks!
> > eric
>
> I don't care either way.
>
> > >
> > >
> > > >
> > > > >
> > > > >
> > > > > > #define SERIALIZATIONINSTRUCTIONCTX(name, \
> > > > > >       inst, bit_width, offset) \
> > > > > >       BuildSerializationInstructionEntry name = { \
> > > > > >           .table_data = table_instruction_data, \
> > > > > >           .bar = bar0, \
> > > > > >           .instruction = inst, \
> > > > > >           .flags = 0, \
> > > > > >           .register_bit_width = bit_width, \
> > > > > >           .register_offset = offset, \
> > > > > >       }
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
> > > > > >           INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
> > > > > >           INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
> > > > > >           INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
> > > > > >           INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
> > > > > >           INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
> > > > > >           INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
> > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_action,
> > > > > >           INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);
> > > > > >
> > > > > > These are the 7 accessors needed.
> > > > >
> > > > > not at all sure this one is worth the macro mess.
> > > >
> > > > I'm hoping to produce a v15 with the style you want.
> > > > eric
> > > >
> > > > >
> > > > > > >
> > > > > > > > +    unsigned action;
> > > > > > > > +
> > > > > > > > +    trace_acpi_erst_pci_bar_0(bar0);
> > > > > > > > +
> > > > > > > > +    /* Serialization Instruction Entries */
> > > > > > > > +    action = ACTION_BEGIN_WRITE_OPERATION;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_BEGIN_READ_OPERATION;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_BEGIN_CLEAR_OPERATION;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_END_OPERATION;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_SET_RECORD_OFFSET;
> > > > > > > > +    build_serialization_instruction(&wr_value_32, action,
> 0);
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_EXECUTE_OPERATION;
> > > > > > > > +    build_serialization_instruction(&wr_value_32_val,
> action,
> > > > > > > > +        ERST_EXECUTE_OPERATION_MAGIC);
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_CHECK_BUSY_STATUS;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_32_val,
> action, 0x01);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_COMMAND_STATUS;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_32, action,
> 0);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_RECORD_IDENTIFIER;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_64, action,
> 0);
> > > > > > > > +
> > > > > > > > +    action = ACTION_SET_RECORD_IDENTIFIER;
> > > > > > > > +    build_serialization_instruction(&wr_value_64, action,
> 0);
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_RECORD_COUNT;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_32, action,
> 0);
> > > > > > > > +
> > > > > > > > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_64, action,
> 0);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_64, action,
> 0);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_32, action,
> 0);
> > > > > > > > +
> > > > > > > > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> > > > > > > > +    build_serialization_instruction(&wr_action, action,
> action);
> > > > > > > > +    build_serialization_instruction(&rd_value_64, action,
> 0);
> > > > > > > > +
> > > > > > > > +    /* Serialization Header */
> > > > > > > > +    acpi_table_begin(&table, table_data);
> > > > > > > > +
> > > > > > > > +    /* Serialization Header Size */
> > > > > > > > +    build_append_int_noprefix(table_data, 48, 4);
> > > > > > > > +
> > > > > > > > +    /* Reserved */
> > > > > > > > +    build_append_int_noprefix(table_data,  0, 4);
> > > > > > > > +
> > > > > > > > +    /*
> > > > > > > > +     * Instruction Entry Count
> > > > > > > > +     * Each instruction entry is 32 bytes
> > > > > > > > +     */
> > > > > > > > +    g_assert((table_instruction_data->len) % 32 == 0);
> > > > > > > > +    build_append_int_noprefix(table_data,
> > > > > > > > +        (table_instruction_data->len / 32), 4);
> > > > > > > > +
> > > > > > > > +    /* Serialization Instruction Entries */
> > > > > > > > +    g_array_append_vals(table_data,
> table_instruction_data->data,
> > > > > > > > +        table_instruction_data->len);
> > > > > > > > +    g_array_free(table_instruction_data, TRUE);
> > > > > > > > +
> > > > > > > > +    acpi_table_end(linker, &table);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >
> +/*******************************************************************/
> > > > > > > >
> +/*******************************************************************/
> > > > > > > >     static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState
> *s, unsigned index)
> > > > > > > >     {
> > > > > > > >         uint8_t *rc = NULL;
> > > > > > > > --
> > > > > > > > 1.8.3.1
> > > > > > > >
> > > > > > > >
> > > > >
> > >
>
>

--000000000000d4c5a105d6a7b702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 28, 2022 at 9:44 PM Michael S. Tsirkin &lt;<a h=
ref=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">On Fri, Jan 28, 2022 at 10:01:18AM -0600, Eric DeVolder wrote:<b=
r>
&gt; Michael, thanks! See inline response below, please.<br>
&gt; eric<br>
&gt; <br>
&gt; On 1/28/22 09:54, Michael S. Tsirkin wrote:<br>
&gt; &gt; On Fri, Jan 28, 2022 at 09:11:41AM -0600, Eric DeVolder wrote:<br=
>
&gt; &gt; &gt; Michael,<br>
&gt; &gt; &gt; Thanks for examining this. Inline response below.<br>
&gt; &gt; &gt; eric<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 1/27/22 18:37, Michael S. Tsirkin wrote:<br>
&gt; &gt; &gt; &gt; On Thu, Jan 27, 2022 at 04:02:07PM -0600, Eric DeVolder=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; Ani,<br>
&gt; &gt; &gt; &gt; &gt; Thanks for the RB! Inline responses below.<br>
&gt; &gt; &gt; &gt; &gt; eric<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On 1/27/22 02:36, Ani Sinha wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, 26 Jan 2022, Eric DeVolder wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; This builds the ACPI ERST table to infor=
m OSPM how to communicate<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; with the acpi-erst device.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; There might be more optimizations possible bu=
t I think we have messaged<br>
&gt; &gt; &gt; &gt; &gt; &gt; this code enough. We can further rework the c=
ode if needed in subsequent<br>
&gt; &gt; &gt; &gt; &gt; &gt; patches once this is pushed.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Eric DeVolder &lt;<a href=
=3D"mailto:eric.devolder@oracle.com" target=3D"_blank">eric.devolder@oracle=
.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; with some minor comments,<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:=
ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0hw/acpi/erst.c | 225 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01 file changed, 225 i=
nsertions(+)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/hw/acpi/erst.c b/hw/acpi/er=
st.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; index fe9ba51..5d5a639 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/hw/acpi/erst.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/hw/acpi/erst.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -59,6 +59,27 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0#define STATUS_RECORD=
_STORE_EMPTY=C2=A0 =C2=A0 =C2=A00x04<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0#define STATUS_RECORD=
_NOT_FOUND=C2=A0 =C2=A0 =C2=A0 =C2=A00x05<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +/* ACPI 4.0: Table 17-19 Serialization =
Instructions */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_READ_REGISTER=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_READ_REGISTER_VALUE=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_WRITE_REGISTER=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_WRITE_REGISTER_VALUE=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_NOOP=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_LOAD_VAR1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x05<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_LOAD_VAR2=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x06<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_STORE_VAR1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x07<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_ADD=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x08<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_SUBTRACT=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x09<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_ADD_VALUE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0A<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_SUBTRACT_VALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0B<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_STALL=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_STALL_WHILE_TRUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_SKIP_NEXT_INSTRUCTION_IF_T=
RUE 0x0E<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_GOTO=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0F<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_SET_SRC_ADDRESS_BASE=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_SET_DST_ADDRESS_BASE=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x11<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define INST_MOVE_DATA=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x12<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0/* UEFI 2.1: Appendix=
 N Common Platform Error Record */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0#define UEFI_CPER_REC=
ORD_MIN_SIZE 128U<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0#define UEFI_CPER_REC=
ORD_LENGTH_OFFSET 20U<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -172,6 +193,210 @@ typedef struct {<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0/********************=
***********************************************/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0/********************=
***********************************************/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +typedef struct {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 GArray *table_data;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pcibus_t bar;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t instruction;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t flags;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t register_bit_widt=
h;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pcibus_t register_offset;=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +} BuildSerializationInstructionEntry;<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +/* ACPI 4.0: 17.4.1.2 Serialization Ins=
truction Entries */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +static void build_serialization_instruc=
tion(<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry *e,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t serialization_act=
ion,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint64_t value)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* ACPI 4.0: Table 17-18 =
Serialization Instruction Entry */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 struct AcpiGenericAddress=
 gas;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint64_t mask;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Serialization Action *=
/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(e-&gt;table_data, serialization_action, 1);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Instruction */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(e-&gt;table_data, e-&gt;instruction, 1);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Flags */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(e-&gt;table_data, e-&gt;flags, 1);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Reserved */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(e-&gt;table_data, 0, 1);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Register Region */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gas.space_id =3D AML_SYST=
EM_MEMORY;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gas.bit_width =3D e-&gt;r=
egister_bit_width;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gas.bit_offset =3D 0;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gas.access_width =3D ctz3=
2(e-&gt;register_bit_width) - 2;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Should this be casted as unit8_t?<br>
&gt; &gt; &gt; &gt; &gt; OK, done.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gas.address =3D (uint64_t=
)(e-&gt;bar + e-&gt;register_offset);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_gas_from_str=
uct(e-&gt;table_data, &amp;gas);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Value */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(e-&gt;table_data, value, 8);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Mask */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mask =3D (1ULL &lt;&lt; (=
e-&gt;register_bit_width - 1) &lt;&lt; 1) - 1;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(e-&gt;table_data, mask, 8);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +/* ACPI 4.0: 17.4.1 Serialization Actio=
n Table */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +void build_erst(GArray *table_data, BIO=
SLinker *linker, Object *erst_dev,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const char *oem_id, const=
 char *oem_table_id)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Serialization Act=
ion Table<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* The serialization=
 action table must be generated first<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* so that its size =
can be known in order to populate the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Instruction Entry=
 Count field.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 GArray *table_instruction=
_data =3D g_array_new(FALSE, FALSE, sizeof(char));<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pcibus_t bar0 =3D pci_get=
_bar_addr(PCI_DEVICE(erst_dev), 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 AcpiTable table =3D { .si=
g =3D &quot;ERST&quot;, .rev =3D 1, .oem_id =3D oem_id,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .oem_table_id =3D oem_table_i=
d };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Contexts for the diffe=
rent ways ACTION and VALUE are accessed */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry rd_value_32_val =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_READ_REGISTER_VALUE,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 32,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_VALUE_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry rd_value_32 =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_READ_REGISTER,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 32,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_VALUE_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry rd_value_64 =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_READ_REGISTER,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 64,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_VALUE_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry wr_value_32_val =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_WRITE_REGISTER_VALUE,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 32,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_VALUE_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry wr_value_32 =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_WRITE_REGISTER,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 32,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_VALUE_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry wr_value_64 =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_WRITE_REGISTER,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 64,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_VALUE_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 BuildSerializationInstruc=
tionEntry wr_action =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data=
 =3D table_instruction_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D ba=
r0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instructio=
n =3D INST_WRITE_REGISTER_VALUE,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D =
0,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_b=
it_width =3D 32,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_o=
ffset =3D ERST_ACTION_OFFSET,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; We can probably write a macro to simply gener=
ating these structs. I see<br>
&gt; &gt; &gt; &gt; &gt; &gt; .bar and .flags are the same in all structs. =
The .bit_width can be a param<br>
&gt; &gt; &gt; &gt; &gt; &gt; into the macro etc.<br>
&gt; &gt; &gt; &gt; &gt; Agree, however the request was to NOT hide the use=
 of local variables in<br>
&gt; &gt; &gt; &gt; &gt; macros, so while .flags is always 0, .instruction,=
 .register_bit_width and .register_offset<br>
&gt; &gt; &gt; &gt; &gt; would be parameters, that leaves .table_data and .=
bar which just need the local<br>
&gt; &gt; &gt; &gt; &gt; variables. Is the following acceptable (which hide=
s the use of the local variables)?<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; You can just use assignment:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry =
entry =3D {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data =3D table=
_instruction_data,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D bar0,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D 0,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_bit_width =
=3D 32,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry =
rd_value_32_val =3D entry;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rd_value_32_val.action =3D INST_REA=
D_REGISTER_VALUE;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rd_value_32_val.register_offset =3D=
 ERST_ACTION_OFFSET;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; and so on.<br>
&gt; &gt; &gt; &gt; not sure it&#39;s worth it, it&#39;s just a couple of l=
ines.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; OK, here is the equivalent using struct assignment, is this =
what you were after?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry base =
=3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .table_data =3D table_inst=
ruction_data,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar =3D bar0,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .instruction =3D INST_WRIT=
E_REGISTER,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D 0,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_bit_width =3D 32=
,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .register_offset =3D ERST_=
VALUE_OFFSET,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry rd_va=
lue_32_val =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rd_value_32_val.instruction =3D INST_REA=
D_REGISTER_VALUE;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry rd_va=
lue_32 =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rd_value_32.instruction =3D INST_READ_RE=
GISTER;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry rd_va=
lue_64 =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rd_value_64.instruction =3D INST_READ_RE=
GISTER;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 rd_value_64.register_bit_width =3D 64;<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry wr_va=
lue_32_val =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 wr_value_32_val.instruction =3D INST_WRI=
TE_REGISTER_VALUE;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry wr_va=
lue_32 =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry wr_va=
lue_64 =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 wr_value_64.register_bit_width =3D 64;<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 BuildSerializationInstructionEntry wr_ac=
tion =3D base;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 wr_action.instruction =3D INST_WRITE_REG=
ISTER_VALUE;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 wr_action.register_offset =3D ERST_ACTIO=
N_OFFSET;<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; That&#39;s what I described, yes. We should have some empty lines=
 here I<br>
&gt; &gt; guess. I&#39;m ok with the original one too, there&#39;s not too =
much<br>
&gt; &gt; duplication.<br>
&gt; <br>
&gt; Are the blank lines referring to spacing out the setup of each of the =
7 accesors?<br>
&gt; If so, I could put a one line comment between each setup? Or is a blan=
k line also<br>
&gt; needed?<br>
<br>
A blank line between declarations and code is usually a good idea.<br>
<br>
<br>
&gt; Is it OK to post v15 with the struct assignment approach? Or would you=
 prefer the<br>
&gt; explicit structs (which is what I think you mean by &#39;the original =
one&#39;)?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I pref=
er the explicit structs as you had posted before.</div><div dir=3D"auto"><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)" dir=3D"auto"><br>
&gt; <br>
&gt; Thanks!<br>
&gt; eric<br>
<br>
I don&#39;t care either way.<br>
<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; #define SERIALIZATIONINSTRUCTIONCTX(name, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inst, bit_width, offset)=
 \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BuildSerializationInstru=
ctionEntry name =3D { \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.table_dat=
a =3D table_instruction_data, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bar =3D b=
ar0, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.instructi=
on =3D inst, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D=
 0, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.register_=
bit_width =3D bit_width, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.register_=
offset =3D offset, \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(rd_value_32_val,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_READ_=
REGISTER_VALUE, 32, ERST_VALUE_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(rd_value_32,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_READ_=
REGISTER, 32, ERST_VALUE_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(rd_value_64,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_READ_=
REGISTER, 64, ERST_VALUE_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(wr_value_32_val,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_WRITE=
_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(wr_value_32,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_WRITE=
_REGISTER, 32, ERST_VALUE_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(wr_value_64,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_WRITE=
_REGISTER, 64, ERST_VALUE_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SERIALIZATIONINSTRUCTION=
CTX(wr_action,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INST_WRITE=
_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; These are the 7 accessors needed.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; not at all sure this one is worth the macro mess.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;m hoping to produce a v15 with the style you want.<br>
&gt; &gt; &gt; eric<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 unsigned action;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 trace_acpi_erst_pci_bar_0=
(bar0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Serialization Instruct=
ion Entries */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_W=
RITE_OPERATION;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_R=
EAD_OPERATION;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_C=
LEAR_OPERATION;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_END_OPE=
RATION;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_SET_REC=
ORD_OFFSET;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_value_32, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_EXECUTE=
_OPERATION;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_value_32_val, action,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERST_EXECUT=
E_OPERATION_MAGIC);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_CHECK_B=
USY_STATUS;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_32_val, action, 0x01);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_COM=
MAND_STATUS;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_32, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_REC=
ORD_IDENTIFIER;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_64, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_SET_REC=
ORD_IDENTIFIER;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_value_64, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_REC=
ORD_COUNT;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_32, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_D=
UMMY_WRITE_OPERATION;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_ERR=
OR_LOG_ADDRESS_RANGE;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_64, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_ERR=
OR_LOG_ADDRESS_LENGTH;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_64, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_ERR=
OR_LOG_ADDRESS_RANGE_ATTRIBUTES;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_32, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_EXE=
CUTE_OPERATION_TIMINGS;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;wr_action, action, action);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_serialization_instr=
uction(&amp;rd_value_64, action, 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Serialization Header *=
/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 acpi_table_begin(&amp;tab=
le, table_data);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Serialization Header S=
ize */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(table_data, 48, 4);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Reserved */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(table_data,=C2=A0 0, 4);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Instruction Entry=
 Count<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Each instruction =
entry is 32 bytes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert((table_instructi=
on_data-&gt;len) % 32 =3D=3D 0);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 build_append_int_noprefix=
(table_data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (table_inst=
ruction_data-&gt;len / 32), 4);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Serialization Instruct=
ion Entries */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 g_array_append_vals(table=
_data, table_instruction_data-&gt;data,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 table_instr=
uction_data-&gt;len);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 g_array_free(table_instru=
ction_data, TRUE);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 acpi_table_end(linker, &a=
mp;table);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +/**************************************=
*****************************/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +/**************************************=
*****************************/<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0static uint8_t *get_n=
vram_ptr_by_index(ERSTDeviceState *s, unsigned index)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t=
 *rc =3D NULL;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 1.8.3.1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--000000000000d4c5a105d6a7b702--


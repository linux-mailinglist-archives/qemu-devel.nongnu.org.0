Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1C47615E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:15:51 +0100 (CET)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZkj-0003KZ-R8
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:15:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mxYfZ-0004Mw-VM
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:06:25 -0500
Received: from [2a00:1450:4864:20::536] (port=45805
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mxYfW-00086U-Jz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:06:25 -0500
Received: by mail-ed1-x536.google.com with SMTP id y12so76875181eda.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6VOxcoL/DzC8yPZbfPab6x66LRyaBK0WD6BYPkzqImc=;
 b=VmHbP0/R6zKOiE54lcA6qNzqZcPf67R+OYSjOwJg9IXNy3V3uS7GvH3ikfHXfjEQ33
 e8fDeEJDVVVI9uF+PwmsQmi2tqvBN3jXIIKABuNbtpVkVdoUJ7jZSgfQgJli3nv6z++O
 sI8MvrHww6oFvO8hAX4wxMGwT/SJbBg+csbP/nLeBQYuj2ChnEtKB50VCMtgiIinkSlg
 UFPzePyhFd4opudN4MOynvVUcKv0ZYdISnJllulbDMFgELohQyFzxe1H28/w2P2NKDWQ
 rXKFo3vzpVJ4g3g0m+Tc1MNsfLFATpKu0QT3MYGWT230QUbnj8leBzzqgStAO8oSShZk
 4mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VOxcoL/DzC8yPZbfPab6x66LRyaBK0WD6BYPkzqImc=;
 b=DSf3Sqv1v99ZOIyuqg9snIyJv1QENQS1v25HuVecDXBOIuay4oIHnBek4h7Fufiidi
 z8EWO5ZSzlh/qj+ZSVMxuT8vI0bOqukTQTadkMELctAd+aAIuCNqdJGFtyFf1FHBWU9h
 KZY3HbViyn7HYw5OBO11jrWnBCiTYWzxbaGSk/IzE8BymCnPO0/jvchvX0FlPvSqQPuI
 dnDs/59UkgQSgb00RbCITzMaxpv322ZXi5+cZUHZCqfYJg+KXNaIm6wJqpfIASGDGknb
 jNMXeHCVEq83pXPZVNpRG68iKy5Lp+xpg9F46O4U2Q0EdnCvtn2HJUtzqCXuJzSM0G6+
 PySA==
X-Gm-Message-State: AOAM532b1kiy45Jorim2f6sl39neYrCw6mQDp9k2yT/2+o5YaHujbGtI
 SGrTDL0itxzvV6C+JRVT9xbjqmphrtSXa4cYcD0/PA==
X-Google-Smtp-Source: ABdhPJwXvJ77iNNYJodvNW9foBYocKIQ2VldgpH7QEo8Z4Rqh5hXLvJdy0xpdrTQh1s1UBysZfjITapMjXEVqAta7oM=
X-Received: by 2002:a17:907:608e:: with SMTP id
 ht14mr12292316ejc.259.1639591580523; 
 Wed, 15 Dec 2021 10:06:20 -0800 (PST)
MIME-Version: 1.0
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
 <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
 <CAARzgwy0qBE2rBtsjFaW6ED_bWW4SjV0JNfVYmc=P7groLJthw@mail.gmail.com>
 <2596427e-7c29-3d23-a0d4-3a0a8c960153@oracle.com>
In-Reply-To: <2596427e-7c29-3d23-a0d4-3a0a8c960153@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 15 Dec 2021 23:36:09 +0530
Message-ID: <CAARzgwzDzLLvxfwha9owVN3ArGEx52tsJRFdCY+odqu6fKV0cw@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] ACPI ERST: build the ACPI ERST table
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000bbfb8f05d333293c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 mst@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bbfb8f05d333293c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 23:27 Eric DeVolder <eric.devolder@oracle.com>
wrote:

> Hi Ani,
> Thanks for such quick feedback! One inline response below.
> eric
>
> On 12/15/21 10:33, Ani Sinha wrote:
> > On Wed, Dec 15, 2021 at 9:08 PM Eric DeVolder <eric.devolder@oracle.com=
>
> wrote:
> >>
> >> This builds the ACPI ERST table to inform OSPM how to communicate
> >> with the acpi-erst device.
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >>   hw/acpi/erst.c | 188
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 188 insertions(+)
> >>
> >> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> >> index bb6cad4..05177b3 100644
> >> --- a/hw/acpi/erst.c
> >> +++ b/hw/acpi/erst.c
> >> @@ -59,6 +59,27 @@
> >>   #define STATUS_RECORD_STORE_EMPTY     0x04
> >>   #define STATUS_RECORD_NOT_FOUND       0x05
> >>
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
> >> +
> >>   /* UEFI 2.1: Appendix N Common Platform Error Record */
> >>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
> >>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> >> @@ -172,6 +193,173 @@ typedef struct {
> >>
> >>   /*******************************************************************=
/
> >>   /*******************************************************************=
/
> >> +
> >> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> >> +static void build_serialization_instruction_entry(GArray *table_data,
> >> +    uint8_t serialization_action,
> >> +    uint8_t instruction,
> >> +    uint8_t flags,
> >> +    uint8_t register_bit_width,
> >> +    uint64_t register_address,
> >> +    uint64_t value)
> >> +{
> >> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> >> +    struct AcpiGenericAddress gas;
> >> +    uint64_t mask;
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
> >> +    gas.space_id =3D AML_SYSTEM_MEMORY;
> >> +    gas.bit_width =3D register_bit_width;
> >> +    gas.bit_offset =3D 0;
> >> +    gas.access_width =3D ctz32(register_bit_width) - 2;
> >> +    gas.address =3D register_address;
> >> +    build_append_gas_from_struct(table_data, &gas);
> >> +    /* Value */
> >> +    build_append_int_noprefix(table_data, value  , 8);
> >> +    /* Mask */
> >> +    mask =3D (1ULL << (register_bit_width - 1) << 1) - 1;
> >> +    build_append_int_noprefix(table_data, mask  , 8);
> >> +}
> >> +
> >> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> >> +void build_erst(GArray *table_data, BIOSLinker *linker, Object
> *erst_dev,
> >> +    const char *oem_id, const char *oem_table_id)
> >> +{
> >> +    GArray *table_instruction_data;
> >> +    unsigned action;
> >
> > This variable can be eliminated (see below).
> >
> >> +    pcibus_t bar0 =3D pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> >> +    AcpiTable table =3D { .sig =3D "ERST", .rev =3D 1, .oem_id =3D oe=
m_id,
> >> +                        .oem_table_id =3D oem_table_id };
> >> +
> >> +    trace_acpi_erst_pci_bar_0(bar0);
> >> +
> >> +    /*
> >> +     * Serialization Action Table
> >> +     * The serialization action table must be generated first
> >> +     * so that its size can be known in order to populate the
> >> +     * Instruction Entry Count field.
> >> +     */
> >> +    table_instruction_data =3D g_array_new(FALSE, FALSE, sizeof(char)=
);
> >> +
> >> +    /*
> >> +     * Macros for use with construction of the action instructions
> >> +     */
> >> +#define build_read_register(action, width_in_bits, reg) \
> >> +    build_serialization_instruction_entry(table_instruction_data, \
> >> +        action, INST_READ_REGISTER, 0, width_in_bits, \
> >> +        bar0 + reg, 0)
> >> +
> >> +#define build_read_register_value(action, width_in_bits, reg, value) =
\
> >> +    build_serialization_instruction_entry(table_instruction_data, \
> >> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
> >> +        bar0 + reg, value)
> >> +
> >> +#define build_write_register(action, width_in_bits, reg, value) \
> >> +    build_serialization_instruction_entry(table_instruction_data, \
> >> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
> >> +        bar0 + reg, value)
> >> +
> >> +#define build_write_register_value(action, width_in_bits, reg, value)=
 \
> >> +    build_serialization_instruction_entry(table_instruction_data, \
> >> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
> >> +        bar0 + reg, value)
> >> +
> >> +    /* Serialization Instruction Entries */
> >> +    action =3D ACTION_BEGIN_WRITE_OPERATION;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_BEGIN_READ_OPERATION;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_BEGIN_CLEAR_OPERATION;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_END_OPERATION;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_SET_RECORD_OFFSET;
> >> +    build_write_register(action, 32, ERST_VALUE_OFFSET, 0);
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_EXECUTE_OPERATION;
> >> +    build_write_register_value(action, 32, ERST_VALUE_OFFSET,
> >> +        ERST_EXECUTE_OPERATION_MAGIC);
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >
> >
> >
> >> +
> >> +    action =3D ACTION_CHECK_BUSY_STATUS;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register_value(action, 32, ERST_VALUE_OFFSET, 0x01);
> >> +
> >> +    action =3D ACTION_GET_COMMAND_STATUS;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> >> +
> >> +    action =3D ACTION_GET_RECORD_IDENTIFIER;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> >> +
> >> +    action =3D ACTION_SET_RECORD_IDENTIFIER;
> >> +    build_write_register(action, 64, ERST_VALUE_OFFSET, 0);
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_GET_RECORD_COUNT;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> >> +
> >> +    action =3D ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +
> >> +    action =3D ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> >> +
> >> +    action =3D ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> >> +
> >> +    action =3D ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> >> +
> >> +    action =3D ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> >> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action=
);
> >> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> >
> > if I am reading this right, build_write_register_value() is called
> > with the same parameters, except that action is changing. We can
> > optimize repetative calls with the same parameters.
> >
> > build_read_register can be split into build_read_register_32() and
> > build_read_register_64().
> > So we can have :
> > build_write_register_value(ACTION_GET_EXECUTE_OPERATION_TIMINGS);
> > build_read_register_64(ACTION_GET_EXECUTE_OPERATION_TIMINGS);
> >
>
> If I understand correctly, you are essentially asking for appropriate
> accessor functions.
> I did an inventory and the following would be the list of unique accessor=
s
> needed:
>
> To ACTION register:
>   write_value_32
>
> To VALUE register:
>   write_value_32
>   write_32
>   write_64
>   read_value_32
>   read_32
>   read_64
>
> So that is 7 accessors, which must spell out the access type and register
> name in the macro.
>
> With respect to the comment on eliminating the action variable. Given the
> current code I did miss an
> optimization to avoid passing 'action' as the first parameter to the
> macros; I should have just used
> it directly within the macro. Plus the 'action' assignment acts as
> documentation to inform you as to
> which action is being constructed. But in other places, 'action' is being
> used as a true parameter
> to the macros as the value to write.
>
> If you think that going to more accessors is simpler/more clear, then I'l=
l
> do so.


Let=E2=80=99s wait and see what Michael thinks about this.


>
> Thanks!
> eric
>
>
>
>
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
> >> +    g_assert((table_instruction_data->len) % 32 =3D=3D 0);
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
> >> +/*******************************************************************/
> >> +/*******************************************************************/
> >>   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned
> index)
> >>   {
> >>       uint8_t *rc =3D NULL;
> >> --
> >> 1.8.3.1
> >>
>

--000000000000bbfb8f05d333293c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 15, 2021 at 23:27 Eric DeVolder &lt;<a href=3D"=
mailto:eric.devolder@oracle.com">eric.devolder@oracle.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">Hi Ani,<br>
Thanks for such quick feedback! One inline response below.<br>
eric<br>
<br>
On 12/15/21 10:33, Ani Sinha wrote:<br>
&gt; On Wed, Dec 15, 2021 at 9:08 PM Eric DeVolder &lt;<a href=3D"mailto:er=
ic.devolder@oracle.com" target=3D"_blank">eric.devolder@oracle.com</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; This builds the ACPI ERST table to inform OSPM how to communicate<=
br>
&gt;&gt; with the acpi-erst device.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Eric DeVolder &lt;<a href=3D"mailto:eric.devolder@o=
racle.com" target=3D"_blank">eric.devolder@oracle.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 188 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c<br>
&gt;&gt; index bb6cad4..05177b3 100644<br>
&gt;&gt; --- a/hw/acpi/erst.c<br>
&gt;&gt; +++ b/hw/acpi/erst.c<br>
&gt;&gt; @@ -59,6 +59,27 @@<br>
&gt;&gt;=C2=A0 =C2=A0#define STATUS_RECORD_STORE_EMPTY=C2=A0 =C2=A0 =C2=A00=
x04<br>
&gt;&gt;=C2=A0 =C2=A0#define STATUS_RECORD_NOT_FOUND=C2=A0 =C2=A0 =C2=A0 =
=C2=A00x05<br>
&gt;&gt;<br>
&gt;&gt; +/* ACPI 4.0: Table 17-19 Serialization Instructions */<br>
&gt;&gt; +#define INST_READ_REGISTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x00<br>
&gt;&gt; +#define INST_READ_REGISTER_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x01<br>
&gt;&gt; +#define INST_WRITE_REGISTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x02<br>
&gt;&gt; +#define INST_WRITE_REGISTER_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x03<br>
&gt;&gt; +#define INST_NOOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br>
&gt;&gt; +#define INST_LOAD_VAR1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x05<br>
&gt;&gt; +#define INST_LOAD_VAR2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x06<br>
&gt;&gt; +#define INST_STORE_VAR1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x07<br>
&gt;&gt; +#define INST_ADD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
&gt;&gt; +#define INST_SUBTRACT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x09<br>
&gt;&gt; +#define INST_ADD_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0A<br>
&gt;&gt; +#define INST_SUBTRACT_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x0B<br>
&gt;&gt; +#define INST_STALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C<br>
&gt;&gt; +#define INST_STALL_WHILE_TRUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x0D<br>
&gt;&gt; +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E<br>
&gt;&gt; +#define INST_GOTO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0F<br>
&gt;&gt; +#define INST_SET_SRC_ADDRESS_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x10<br>
&gt;&gt; +#define INST_SET_DST_ADDRESS_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x11<br>
&gt;&gt; +#define INST_MOVE_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x12<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0/* UEFI 2.1: Appendix N Common Platform Error Record *=
/<br>
&gt;&gt;=C2=A0 =C2=A0#define UEFI_CPER_RECORD_MIN_SIZE 128U<br>
&gt;&gt;=C2=A0 =C2=A0#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U<br>
&gt;&gt; @@ -172,6 +193,173 @@ typedef struct {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0/*****************************************************=
**************/<br>
&gt;&gt;=C2=A0 =C2=A0/*****************************************************=
**************/<br>
&gt;&gt; +<br>
&gt;&gt; +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */<br>
&gt;&gt; +static void build_serialization_instruction_entry(GArray *table_d=
ata,<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t serialization_action,<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t instruction,<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t flags,<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t register_bit_width,<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t register_address,<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t value)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 /* ACPI 4.0: Table 17-18 Serialization Instruction =
Entry */<br>
&gt;&gt; +=C2=A0 =C2=A0 struct AcpiGenericAddress gas;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t mask;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Serialization Action */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, serialization=
_action, 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Instruction */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, instruction=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0, 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Flags */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, flags=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0, 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Reserved */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, 0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0, 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Register Region */<br>
&gt;&gt; +=C2=A0 =C2=A0 gas.space_id =3D AML_SYSTEM_MEMORY;<br>
&gt;&gt; +=C2=A0 =C2=A0 gas.bit_width =3D register_bit_width;<br>
&gt;&gt; +=C2=A0 =C2=A0 gas.bit_offset =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 gas.access_width =3D ctz32(register_bit_width) - 2;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 gas.address =3D register_address;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_gas_from_struct(table_data, &amp;gas);=
<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Value */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, value=C2=A0 ,=
 8);<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Mask */<br>
&gt;&gt; +=C2=A0 =C2=A0 mask =3D (1ULL &lt;&lt; (register_bit_width - 1) &l=
t;&lt; 1) - 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, mask=C2=A0 , =
8);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +/* ACPI 4.0: 17.4.1 Serialization Action Table */<br>
&gt;&gt; +void build_erst(GArray *table_data, BIOSLinker *linker, Object *e=
rst_dev,<br>
&gt;&gt; +=C2=A0 =C2=A0 const char *oem_id, const char *oem_table_id)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 GArray *table_instruction_data;<br>
&gt;&gt; +=C2=A0 =C2=A0 unsigned action;<br>
&gt; <br>
&gt; This variable can be eliminated (see below).<br>
&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 pcibus_t bar0 =3D pci_get_bar_addr(PCI_DEVICE(erst_=
dev), 0);<br>
&gt;&gt; +=C2=A0 =C2=A0 AcpiTable table =3D { .sig =3D &quot;ERST&quot;, .r=
ev =3D 1, .oem_id =3D oem_id,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 .oem_table_id =3D oem_table_id };<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 trace_acpi_erst_pci_bar_0(bar0);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Serialization Action Table<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* The serialization action table must be gene=
rated first<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* so that its size can be known in order to p=
opulate the<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Instruction Entry Count field.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 table_instruction_data =3D g_array_new(FALSE, FALSE=
, sizeof(char));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Macros for use with construction of the act=
ion instructions<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +#define build_read_register(action, width_in_bits, reg) \<br>
&gt;&gt; +=C2=A0 =C2=A0 build_serialization_instruction_entry(table_instruc=
tion_data, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 action, INST_READ_REGISTER, 0, width_=
in_bits, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bar0 + reg, 0)<br>
&gt;&gt; +<br>
&gt;&gt; +#define build_read_register_value(action, width_in_bits, reg, val=
ue) \<br>
&gt;&gt; +=C2=A0 =C2=A0 build_serialization_instruction_entry(table_instruc=
tion_data, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 action, INST_READ_REGISTER_VALUE, 0, =
width_in_bits, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bar0 + reg, value)<br>
&gt;&gt; +<br>
&gt;&gt; +#define build_write_register(action, width_in_bits, reg, value) \=
<br>
&gt;&gt; +=C2=A0 =C2=A0 build_serialization_instruction_entry(table_instruc=
tion_data, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 action, INST_WRITE_REGISTER, 0, width=
_in_bits, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bar0 + reg, value)<br>
&gt;&gt; +<br>
&gt;&gt; +#define build_write_register_value(action, width_in_bits, reg, va=
lue) \<br>
&gt;&gt; +=C2=A0 =C2=A0 build_serialization_instruction_entry(table_instruc=
tion_data, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 action, INST_WRITE_REGISTER_VALUE, 0,=
 width_in_bits, \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bar0 + reg, value)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Serialization Instruction Entries */<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_WRITE_OPERATION;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_READ_OPERATION;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_CLEAR_OPERATION;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_END_OPERATION;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_SET_RECORD_OFFSET;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register(action, 32, ERST_VALUE_OFFSET,=
 0);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_EXECUTE_OPERATION;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_VALUE_O=
FFSET,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERST_EXECUTE_OPERATION_MAGIC);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_CHECK_BUSY_STATUS;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register_value(action, 32, ERST_VALUE_OF=
FSET, 0x01);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_COMMAND_STATUS;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 32, ERST_VALUE_OFFSET);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_RECORD_IDENTIFIER;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 64, ERST_VALUE_OFFSET);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_SET_RECORD_IDENTIFIER;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register(action, 64, ERST_VALUE_OFFSET,=
 0);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_RECORD_COUNT;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 32, ERST_VALUE_OFFSET);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_BEGIN_DUMMY_WRITE_OPERATION;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_ERROR_LOG_ADDRESS_RANGE;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 64, ERST_VALUE_OFFSET);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 64, ERST_VALUE_OFFSET);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRI=
BUTES;<br>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 32, ERST_VALUE_OFFSET);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 action =3D ACTION_GET_EXECUTE_OPERATION_TIMINGS;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 build_write_register_value(action, 32, ERST_ACTION_=
OFFSET, action);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_read_register(action, 64, ERST_VALUE_OFFSET);=
<br>
&gt; <br>
&gt; if I am reading this right, build_write_register_value() is called<br>
&gt; with the same parameters, except that action is changing. We can<br>
&gt; optimize repetative calls with the same parameters.<br>
&gt; <br>
&gt; build_read_register can be split into build_read_register_32() and<br>
&gt; build_read_register_64().<br>
&gt; So we can have :<br>
&gt; build_write_register_value(ACTION_GET_EXECUTE_OPERATION_TIMINGS);<br>
&gt; build_read_register_64(ACTION_GET_EXECUTE_OPERATION_TIMINGS);<br>
&gt; <br>
<br>
If I understand correctly, you are essentially asking for appropriate acces=
sor functions.<br>
I did an inventory and the following would be the list of unique accessors =
needed:<br>
<br>
To ACTION register:<br>
=C2=A0 write_value_32<br>
<br>
To VALUE register:<br>
=C2=A0 write_value_32<br>
=C2=A0 write_32<br>
=C2=A0 write_64<br>
=C2=A0 read_value_32<br>
=C2=A0 read_32<br>
=C2=A0 read_64<br>
<br>
So that is 7 accessors, which must spell out the access type and register n=
ame in the macro.<br>
<br>
With respect to the comment on eliminating the action variable. Given the c=
urrent code I did miss an <br>
optimization to avoid passing &#39;action&#39; as the first parameter to th=
e macros; I should have just used <br>
it directly within the macro. Plus the &#39;action&#39; assignment acts as =
documentation to inform you as to <br>
which action is being constructed. But in other places, &#39;action&#39; is=
 being used as a true parameter <br>
to the macros as the value to write.<br>
<br>
If you think that going to more accessors is simpler/more clear, then I&#39=
;ll do so.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Let=E2=
=80=99s wait and see what Michael thinks about this.=C2=A0</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Thanks!<br>
eric<br>
<br>
<br>
<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Serialization Header */<br>
&gt;&gt; +=C2=A0 =C2=A0 acpi_table_begin(&amp;table, table_data);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Serialization Header Size */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data, 48, 4);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Reserved */<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data,=C2=A0 0, 4);<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Instruction Entry Count<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Each instruction entry is 32 bytes<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 g_assert((table_instruction_data-&gt;len) % 32 =3D=
=3D 0);<br>
&gt;&gt; +=C2=A0 =C2=A0 build_append_int_noprefix(table_data,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (table_instruction_data-&gt;len / 32)=
, 4);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Serialization Instruction Entries */<br>
&gt;&gt; +=C2=A0 =C2=A0 g_array_append_vals(table_data, table_instruction_d=
ata-&gt;data,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 table_instruction_data-&gt;len);<br>
&gt;&gt; +=C2=A0 =C2=A0 g_array_free(table_instruction_data, TRUE);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 acpi_table_end(linker, &amp;table);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +/****************************************************************=
***/<br>
&gt;&gt; +/****************************************************************=
***/<br>
&gt;&gt;=C2=A0 =C2=A0static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState=
 *s, unsigned index)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *rc =3D NULL;<br>
&gt;&gt; --<br>
&gt;&gt; 1.8.3.1<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000bbfb8f05d333293c--


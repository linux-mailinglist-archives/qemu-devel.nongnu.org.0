Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0C49FFC8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:51:37 +0100 (CET)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVPM-0004ZA-Cu
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:51:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDUPr-00070p-G7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:48:03 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDUPo-0000uU-6m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:48:03 -0500
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Jljv81lLXz67Wgc;
 Sat, 29 Jan 2022 00:43:16 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 17:47:42 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 16:47:41 +0000
Date: Fri, 28 Jan 2022 16:47:40 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Dan Williams
 <dan.j.williams@intel.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>
Subject: Re: [PATCH v4 10/42] hw/cxl/device: Add log commands (8.2.9.4) + CEL
Message-ID: <20220128164740.00001707@huawei.com>
In-Reply-To: <87zgnh9yno.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-11-Jonathan.Cameron@huawei.com>
 <87zgnh9yno.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 27 Jan 2022 11:55:47 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > CXL specification provides for the ability to obtain logs from the
> > device. Logs are either spec defined, like the "Command Effects Log"
> > (CEL), or vendor specific. UUIDs are defined for all log types.
> >
> > The CEL is a mechanism to provide information to the host about which
> > commands are supported. It is useful both to determine which spec'd
> > optional commands are supported, as well as provide a list of vendor
> > specified commands that might be used. The CEL is already created as
> > part of mailbox initialization, but here it is now exported to hosts
> > that use these log commands.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-mailbox-utils.c | 67 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index cea4b2a59c..0ab0592e6c 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -46,6 +46,9 @@ enum {
> >      TIMESTAMP   =3D 0x03,
> >          #define GET           0x0
> >          #define SET           0x1
> > +    LOGS        =3D 0x04,
> > +        #define GET_SUPPORTED 0x0
> > +        #define GET_LOG       0x1
> >  };
> > =20
> >  /* 8.2.8.4.5.1 Command Return Codes */
> > @@ -122,6 +125,8 @@ define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_=
POLICY, 4);
> >  define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
> >  declare_mailbox_handler(TIMESTAMP_GET);
> >  declare_mailbox_handler(TIMESTAMP_SET);
> > +declare_mailbox_handler(LOGS_GET_SUPPORTED);
> > +declare_mailbox_handler(LOGS_GET_LOG);
> > =20
> >  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> >  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
> > @@ -137,6 +142,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] =3D {
> >      CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
> >      CXL_CMD(TIMESTAMP, GET, 0, 0),
> >      CXL_CMD(TIMESTAMP, SET, 8, IMMEDIATE_POLICY_CHANGE),
> > +    CXL_CMD(LOGS, GET_SUPPORTED, 0, 0),
> > +    CXL_CMD(LOGS, GET_LOG, 0x18, 0),
> >  };
> > =20
> >  #undef CXL_CMD
> > @@ -188,6 +195,66 @@ define_mailbox_handler(TIMESTAMP_SET)
> > =20
> >  QemuUUID cel_uuid;
> > =20
> > +/* 8.2.9.4.1 */
> > +define_mailbox_handler(LOGS_GET_SUPPORTED)
> > +{ =20
>=20
> Here is where I get a bit wary of the define_mailbox_handler define
> which from what I can tell just hides the declarations. This makes the
> handling of things like *cmd rather opaque. There is an argument for the
> boilerplate definitions (_nop and _zeroed) but perhaps not these.

Agreed. I think these macros got a bit too clever.

I debated keeping the CXL_CMD one but that then forces us to have
ugly mixed lower case and upper case function names, so I've dropped that
as well.

I'm debating whether to go with
[EVENTS][GET] =3D ...
[EVENTS][SET] =3D ...

vs=20
[EVENTS] =3D {
    [GET] =3D { ..
    [SET] =3D { ..
},

For now I'll go with the [][] variant. The other one may make more
sense as we add more commands.

Reorganizing the code a little gets rid of the need for the forward
declarations as well so end result is less code than with the macros
even if a few corners are a little repetitive.

Thanks,

Jonathan

>=20
> > +    struct {
> > +        uint16_t entries;
> > +        uint8_t rsvd[6];
> > +        struct {
> > +            QemuUUID uuid;
> > +            uint32_t size;
> > +        } log_entries[1];
> > +    } __attribute__((packed)) *supported_logs =3D (void *)cmd->payload;
> > +    _Static_assert(sizeof(*supported_logs) =3D=3D 0x1c, "Bad supported=
 log size");
> > +
> > +    supported_logs->entries =3D 1;
> > +    supported_logs->log_entries[0].uuid =3D cel_uuid;
> > +    supported_logs->log_entries[0].size =3D 4 * cxl_dstate->cel_size;
> > +
> > +    *len =3D sizeof(*supported_logs);
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +
> > +/* 8.2.9.4.2 */
> > +define_mailbox_handler(LOGS_GET_LOG)
> > +{
> > +    struct {
> > +        QemuUUID uuid;
> > +        uint32_t offset;
> > +        uint32_t length;
> > +    } __attribute__((packed, __aligned__(16))) *get_log =3D (void *)cm=
d->payload;
> > +
> > +    /*
> > +     * 8.2.9.4.2
> > +     *   The device shall return Invalid Parameter if the Offset or Le=
ngth
> > +     *   fields attempt to access beyond the size of the log as report=
ed by Get
> > +     *   Supported Logs.
> > +     *
> > +     * XXX: Spec is wrong, "Invalid Parameter" isn't a thing.
> > +     * XXX: Spec doesn't address incorrect UUID incorrectness.
> > +     *
> > +     * The CEL buffer is large enough to fit all commands in the emula=
tion, so
> > +     * the only possible failure would be if the mailbox itself isn't =
big
> > +     * enough.
> > +     */
> > +    if (get_log->offset + get_log->length > cxl_dstate->payload_size) {
> > +        return CXL_MBOX_INVALID_INPUT;
> > +    }
> > +
> > +    if (!qemu_uuid_is_equal(&get_log->uuid, &cel_uuid)) {
> > +        return CXL_MBOX_UNSUPPORTED;
> > +    }
> > +
> > +    /* Store off everything to local variables so we can wipe out the =
payload */
> > +    *len =3D get_log->length;
> > +
> > +    memmove(cmd->payload, cxl_dstate->cel_log + get_log->offset,
> > +           get_log->length);
> > +
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +
> >  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> >  {
> >      uint16_t ret =3D CXL_MBOX_SUCCESS; =20
>=20
>=20



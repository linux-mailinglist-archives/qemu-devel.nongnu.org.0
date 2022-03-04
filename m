Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B854CD539
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:34:07 +0100 (CET)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ84M-0007rB-U9
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQ7ne-0001rQ-D9
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:16:52 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQ7nb-0006p6-VA
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:16:50 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K97dD29hJz67PfY;
 Fri,  4 Mar 2022 21:15:28 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Fri, 4 Mar 2022 14:16:43 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.21; Fri, 4 Mar
 2022 13:16:43 +0000
Date: Fri, 4 Mar 2022 13:16:42 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 .  Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 20/43] hw/cxl/device: Add some trivial commands
Message-ID: <20220304131642.000059b9@huawei.com>
In-Reply-To: <875yoxld3j.fsf@linaro.org>
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-21-Jonathan.Cameron@huawei.com>
 <875yoxld3j.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
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

On Tue, 01 Mar 2022 18:46:30 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > GET_FW_INFO and GET_PARTITION_INFO, for this emulation, is equivalent to
> > info already returned in the IDENTIFY command. To have a more robust
> > implementation, add those.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hi Alex,

> > ---
> >  hw/cxl/cxl-mailbox-utils.c | 69 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 68 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index 808faec114..d022711b2a 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -44,6 +44,8 @@ enum {
> >          #define CLEAR_RECORDS   0x1
> >          #define GET_INTERRUPT_POLICY   0x2
> >          #define SET_INTERRUPT_POLICY   0x3
> > +    FIRMWARE_UPDATE =3D 0x02,
> > +        #define GET_INFO      0x0
> >      TIMESTAMP   =3D 0x03,
> >          #define GET           0x0
> >          #define SET           0x1
> > @@ -52,6 +54,8 @@ enum {
> >          #define GET_LOG       0x1
> >      IDENTIFY    =3D 0x40,
> >          #define MEMORY_DEVICE 0x0
> > +    CCLS        =3D 0x41,
> > +        #define GET_PARTITION_INFO     0x0
> >  };
> > =20
> >  /* 8.2.8.4.5.1 Command Return Codes */
> > @@ -114,6 +118,39 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
> >  DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
> >  DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
> > =20
> > +/* 8.2.9.2.1 */
> > +static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
> > +                                             CXLDeviceState *cxl_dstat=
e,
> > +                                             uint16_t *len)
> > +{
> > +    struct {
> > +        uint8_t slots_supported;
> > +        uint8_t slot_info;
> > +        uint8_t caps;
> > +        uint8_t rsvd[0xd];
> > +        char fw_rev1[0x10];
> > +        char fw_rev2[0x10];
> > +        char fw_rev3[0x10];
> > +        char fw_rev4[0x10];
> > +    } __attribute__((packed)) *fw_info;
> > +    _Static_assert(sizeof(*fw_info) =3D=3D 0x50, "Bad firmware info
> > size"); =20
>=20
> note: we have QEMU_PACKED, QEMU_BUILD_BUG_ON and friends in compiler.h wh=
ich are
> preferred for potential compiler portability reasons.

Replaced all instances of alignment, packed and Static_assert in the
patch set with the compiler.h equivalents. Not that has minor
affect on some earlier patch sets but feels trivial enough
that I've kept RBs etc.

>=20
> > +
> > +    if (cxl_dstate->pmem_size < (256 << 20)) {
> > +        return CXL_MBOX_INTERNAL_ERROR;
> > +    }
> > +
> > +    fw_info =3D (void *)cmd->payload;
> > +    memset(fw_info, 0, sizeof(*fw_info));
> > +
> > +    fw_info->slots_supported =3D 2;
> > +    fw_info->slot_info =3D BIT(0) | BIT(3);
> > +    fw_info->caps =3D 0;
> > +    snprintf(fw_info->fw_rev1, 0x10, "BWFW VERSION %02d", 0); =20
>=20
> Given you have a fixed string here could you not:
>=20
>   pstrcpy(fw_info->fw_rev1, 0x10, "BWFW VERSION 0");

Make sense.

>  =20
> > +
> > +    *len =3D sizeof(*fw_info);
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +
> >  /* 8.2.9.3.1 */
> >  static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
> >                                    CXLDeviceState *cxl_dstate,
> > @@ -260,6 +297,33 @@ static ret_code cmd_identify_memory_device(struct =
cxl_cmd *cmd,
> >      return CXL_MBOX_SUCCESS;
> >  }
> > =20
> > +static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
> > +                                           CXLDeviceState *cxl_dstate,
> > +                                           uint16_t *len)
> > +{
> > +    struct {
> > +        uint64_t active_vmem;
> > +        uint64_t active_pmem;
> > +        uint64_t next_vmem;
> > +        uint64_t next_pmem;
> > +    } __attribute__((packed)) *part_info =3D (void *)cmd->payload;
> > +    _Static_assert(sizeof(*part_info) =3D=3D 0x20, "Bad get partition =
info size");
> > +    uint64_t size =3D cxl_dstate->pmem_size;
> > +
> > +    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> > +        return CXL_MBOX_INTERNAL_ERROR;
> > +    }
> > +
> > +    /* PMEM only */
> > +    part_info->active_vmem =3D 0;
> > +    part_info->next_vmem =3D 0;
> > +    part_info->active_pmem =3D size / (256 << 20);
> > +    part_info->next_pmem =3D part_info->active_pmem;
> > +
> > +    *len =3D sizeof(*part_info);
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +
> >  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> >  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
> >  #define IMMEDIATE_LOG_CHANGE (1 << 4)
> > @@ -273,15 +337,18 @@ static struct cxl_cmd cxl_cmd_set[256][256] =3D {
> >          cmd_events_get_interrupt_policy, 0, 0 },
> >      [EVENTS][SET_INTERRUPT_POLICY] =3D { "EVENTS_SET_INTERRUPT_POLICY",
> >          cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
> > +    [FIRMWARE_UPDATE][GET_INFO] =3D { "FIRMWARE_UPDATE_GET_INFO",
> > +        cmd_firmware_update_get_info, 0, 0 },
> >      [TIMESTAMP][GET] =3D { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
> >      [TIMESTAMP][SET] =3D { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMME=
DIATE_POLICY_CHANGE },
> >      [LOGS][GET_SUPPORTED] =3D { "LOGS_GET_SUPPORTED", cmd_logs_get_sup=
ported, 0, 0 },
> >      [LOGS][GET_LOG] =3D { "LOGS_GET_LOG", cmd_logs_get_log, 0x18, 0 },
> >      [IDENTIFY][MEMORY_DEVICE] =3D { "IDENTIFY_MEMORY_DEVICE",
> >          cmd_identify_memory_device, 0, 0 },
> > +    [CCLS][GET_PARTITION_INFO] =3D { "CCLS_GET_PARTITION_INFO",
> > +        cmd_ccls_get_partition_info, 0, 0 },
> >  };
> > =20
> > -
Also fixed this bit of rebasing mess up.

Thanks,

Jonathan

> >  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> >  {
> >      uint16_t ret =3D CXL_MBOX_SUCCESS; =20
>=20
>=20



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C394CC46E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:55:02 +0100 (CET)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpfJ-0002kc-UV
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:55:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPpe6-0001nE-QH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:53:46 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPpe3-0008A8-VM
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:53:46 -0500
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K8dqJ4Yrwz67Zy6;
 Fri,  4 Mar 2022 01:52:28 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 18:53:40 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 3 Mar
 2022 17:53:39 +0000
Date: Thu, 3 Mar 2022 17:53:38 +0000
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
Subject: Re: [PATCH v6 18/43] qtests/cxl: Add initial root port and CXL
 type3 tests
Message-ID: <20220303175338.0000093d@Huawei.com>
In-Reply-To: <87h78hlewu.fsf@linaro.org>
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-19-Jonathan.Cameron@huawei.com>
 <87h78hlewu.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 01 Mar 2022 18:11:25 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > At this stage we can boot configurations with host bridges,
> > root ports and type 3 memory devices, so add appropriate
> > tests.
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  tests/qtest/cxl-test.c | 126 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 126 insertions(+)
> >
> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> > index 1006c8ae4e..1436de40e2 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -8,6 +8,47 @@
> >  #include "qemu/osdep.h"
> >  #include "libqtest-single.h"
> > =20
> > +#define QEMU_PXB_CMD "-machine q35,cxl=3Don " \
> > +                     "-device pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=
=3D52 "
> > +
> > +#define QEMU_2PXB_CMD "-machine q35,cxl=3Don " \
> > +                      "-device pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=
=3D52 "  \
> > +                      "-device pxb-cxl,id=3Dcxl.1,bus=3Dpcie.0,bus_nr=
=3D53 "
> > +
> > +#define QEMU_RP "-device cxl-rp,id=3Drp0,bus=3Dcxl.0,chassis=3D0,slot=
=3D0 "
> > +
> > +/* Dual ports on first pxb */
> > +#define QEMU_2RP "-device cxl-rp,id=3Drp0,bus=3Dcxl.0,chassis=3D0,slot=
=3D0 " \
> > +                 "-device cxl-rp,id=3Drp1,bus=3Dcxl.0,chassis=3D0,slot=
=3D1 "
> > +
> > +/* Dual ports on each of the pxb instances */
> > +#define QEMU_4RP "-device cxl-rp,id=3Drp0,bus=3Dcxl.0,chassis=3D0,slot=
=3D0 " \
> > +                 "-device cxl-rp,id=3Drp1,bus=3Dcxl.0,chassis=3D0,slot=
=3D1 " \
> > +                 "-device cxl-rp,id=3Drp2,bus=3Dcxl.1,chassis=3D0,slot=
=3D2 " \
> > +                 "-device cxl-rp,id=3Drp3,bus=3Dcxl.1,chassis=3D0,slot=
=3D3 "
> > +
> > +#define QEMU_T3D "-object memory-backend-file,id=3Dcxl-mem0,mem-path=
=3D%s,size=3D256M " \
> > +                 "-device cxl-type3,bus=3Drp0,memdev=3Dcxl-mem0,id=3Dc=
xl-pmem0,size=3D256M "
> > +
> > +#define QEMU_2T3D "-object memory-backend-file,id=3Dcxl-mem0,mem-path=
=3D%s,size=3D256M "    \
> > +                  "-device cxl-type3,bus=3Drp0,memdev=3Dcxl-mem0,id=3D=
cxl-pmem0,size=3D256M " \
> > +                  "-object memory-backend-file,id=3Dcxl-mem1,mem-path=
=3D%s,size=3D256M "    \
> > +                  "-device cxl-type3,bus=3Drp1,memdev=3Dcxl-mem1,id=3D=
cxl-pmem1,size=3D256M "
> > +
> > +#define QEMU_4T3D "-object memory-backend-file,id=3Dcxl-mem0,mem-path=
=3D%s,size=3D256M "    \
> > +                  "-device cxl-type3,bus=3Drp0,memdev=3Dcxl-mem0,id=3D=
cxl-pmem0,size=3D256M " \
> > +                  "-object memory-backend-file,id=3Dcxl-mem1,mem-path=
=3D%s,size=3D256M "    \
> > +                  "-device cxl-type3,bus=3Drp1,memdev=3Dcxl-mem1,id=3D=
cxl-pmem1,size=3D256M " \
> > +                  "-object memory-backend-file,id=3Dcxl-mem2,mem-path=
=3D%s,size=3D256M "    \
> > +                  "-device cxl-type3,bus=3Drp2,memdev=3Dcxl-mem2,id=3D=
cxl-pmem2,size=3D256M " \
> > +                  "-object memory-backend-file,id=3Dcxl-mem3,mem-path=
=3D%s,size=3D256M "    \
> > +                  "-device cxl-type3,bus=3Drp3,memdev=3Dcxl-mem3,id=3D=
cxl-pmem3,size=3D256M "
> > +
> > +static void cxl_basic_hb(void)
> > +{
> > +    qtest_start("-machine q35,cxl=3Don");
> > +    qtest_end();
> > +}
> > =20
> >  static void cxl_basic_pxb(void)
> >  {
> > @@ -15,9 +56,94 @@ static void cxl_basic_pxb(void)
> >      qtest_end();
> >  }
> > =20
> > +static void cxl_pxb_with_window(void)
> > +{
> > +    qtest_start(QEMU_PXB_CMD);
> > +    qtest_end();
> > +}
> > +
> > +static void cxl_2pxb_with_window(void)
> > +{
> > +    qtest_start(QEMU_2PXB_CMD);
> > +    qtest_end();
> > +}
> > +
> > +static void cxl_root_port(void)
> > +{
> > +    qtest_start(QEMU_PXB_CMD QEMU_RP);
> > +    qtest_end();
> > +}
> > +
> > +static void cxl_2root_port(void)
> > +{
> > +    qtest_start(QEMU_PXB_CMD QEMU_2RP);
> > +    qtest_end();
> > +}
> > +
> > +static void cxl_t3d(void)
> > +{
> > +    GString *cmdline;
> > +    char template[] =3D "/tmp/cxl-test-XXXXXX";
> > +    const char *tmpfs;
> > +
> > +    tmpfs =3D mkdtemp(template);
> > +
> > +    cmdline =3D g_string_new(NULL);
> > +    g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs);
> > +
> > +    qtest_start(cmdline->str);
> > +    qtest_end();
> > +
> > +    g_string_free(cmdline, TRUE); =20
>=20
> For future reference you could do:
>=20
>   g_autoptr(GString) cmdline =3D g_string_new(NULL);
>=20
> and drop the free ;-)

nice. Done here and in later qtest patches.

Thanks,

Jonathan


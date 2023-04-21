Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D66EAC08
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:48:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppr7F-0002go-KY; Fri, 21 Apr 2023 09:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppr7E-0002gP-6z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:47:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppr7C-0008HH-11
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:47:55 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2wkh1dCbz6J6vf
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 21:45:00 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 14:47:51 +0100
Date: Fri, 21 Apr 2023 14:47:51 +0100
To: RAGHU H <raghuhack78@gmail.com>
CC: <qemu-devel@nongnu.org>
Subject: Re: Error : "cxl_pci 0000:0d:00.0: Failed to get interrupt for
 event Info log"
Message-ID: <20230421144751.0000200d@Huawei.com>
In-Reply-To: <CAGWUp4qOD=K31_OgrvzkjU+g7PA_Z1erN+yne==uynZ64mrm5w@mail.gmail.com>
References: <CAGWUp4oHxtj69B=gCtUAS_Fp0p6=wBjK_gViYKRqwkVBteCdeQ@mail.gmail.com>
 <20230421133546.000073e3@Huawei.com>
 <CAGWUp4qOD=K31_OgrvzkjU+g7PA_Z1erN+yne==uynZ64mrm5w@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Apr 2023 19:14:05 +0530
RAGHU H <raghuhack78@gmail.com> wrote:

> Hi Jonathan,
>=20
> The log is from the upstream version.
> I have your repo, I can work on it if you provide some basic details
> like the commit ID.

I tag the latest branch with cxl-YYYY-MM-DD=20
https://gitlab.com/jic23/qemu cxl-2023-04-19

should work for you.

>=20
> Regards
> Raghu
>=20
> On Fri, Apr 21, 2023 at 6:05=E2=80=AFPM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Thu, 20 Apr 2023 18:07:40 +0530
> > RAGHU H <raghuhack78@gmail.com> wrote:
> > =20
> > > Hello,
> > >
> > > I am using qemu config listed in CXL documentation to emulate CXL dev=
ice
> > >
> > >
> > > -object memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/=
cxltest.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-mem2,share=3Don,mem-path=3D/tmp/=
cxltest2.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-mem3,share=3Don,mem-path=3D/tmp/=
cxltest3.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-mem4,share=3Don,mem-path=3D/tmp/=
cxltest4.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp/=
lsa.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-lsa2,share=3Don,mem-path=3D/tmp/=
lsa2.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-lsa3,share=3Don,mem-path=3D/tmp/=
lsa3.raw,size=3D256M
> > > \
> > > -object memory-backend-file,id=3Dcxl-lsa4,share=3Don,mem-path=3D/tmp/=
lsa4.raw,size=3D256M
> > > \
> > > -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
> > > -device pxb-cxl,bus_nr=3D222,bus=3Dpcie.0,id=3Dcxl.2 \
> > > -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slot=
=3D2 \
> > > -device cxl-type3,bus=3Droot_port13,memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1,=
id=3Dcxl-pmem0 \
> > > -device cxl-rp,port=3D1,bus=3Dcxl.1,id=3Droot_port14,chassis=3D0,slot=
=3D3 \
> > > -device cxl-type3,bus=3Droot_port14,memdev=3Dcxl-mem2,lsa=3Dcxl-lsa2,=
id=3Dcxl-pmem1 \
> > > -device cxl-rp,port=3D0,bus=3Dcxl.2,id=3Droot_port15,chassis=3D0,slot=
=3D5 \
> > > -device cxl-type3,bus=3Droot_port15,memdev=3Dcxl-mem3,lsa=3Dcxl-lsa3,=
id=3Dcxl-pmem2 \
> > > -device cxl-rp,port=3D1,bus=3Dcxl.2,id=3Droot_port16,chassis=3D0,slot=
=3D6 \
> > > -device cxl-type3,bus=3Droot_port16,memdev=3Dcxl-mem4,lsa=3Dcxl-lsa4,=
id=3Dcxl-pmem3 \
> > > -M cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.targets.1=3Dcxl.2,cxl-fmw.0.=
size=3D4G,cxl-fmw.0.interleave-granularity=3D8k
> > >
> > > Kernel logs show cxl_pci module error while setting up irq
> > > (cxl_event_irqsetup in drivers/cxl/pci.c)
> > >
> > > cxl_pci 0000:0d:00.0: Failed to get interrupt for event Info log
> > > [    3.984800] cxl_pci 0000:e0:00.0: Failed to get interrupt for even=
t Info log
> > > [    3.984841] cxl_pci 0000:df:00.0: Failed to get interrupt for even=
t Info log
> > >
> > >
> > > Is this expected in an emulated environment? =20
> >
> > Upstream QEMU? Or a version of my staging tree?
> >
> > Upstream doesn't support events logs yet, so this may the outcome of th=
at.
> > It missed the 8.0 cycle due to some problems with other series that I'd
> > based it on top of.  Hopefully will start to get those resolved shortly
> > and get as far as events support this cycle.
> >
> > Thanks,
> >
> > Jonathan
> > =20
> > >
> > > Regards
> > > Raghu =20
> > =20



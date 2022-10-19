Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEB604092
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:04:48 +0200 (CEST)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5wL-000211-Ua
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ol5l2-0004Pq-Me
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:53:05 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ol5ky-0005hP-4v
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:53:04 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MsmGS11bwz688yr;
 Wed, 19 Oct 2022 17:51:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 11:52:48 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 10:52:47 +0100
Date: Wed, 19 Oct 2022 10:52:46 +0100
To: Viacheslav A.Dubeyko <viacheslav.dubeyko@bytedance.com>
CC: Adam Manzanares <a.manzanares@samsung.com>, Cong Wang
 <cong.wang@bytedance.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>
Subject: Re: [External] CXL emulation in QEMU contribution
Message-ID: <20221019105246.00002dbe@huawei.com>
In-Reply-To: <2DECB41B-DB90-47DF-BA8E-BEE6869BADFD@bytedance.com>
References: <20221011095228.00001546@huawei.com>
 <31569DD4-6502-4188-8962-08E0A15B08FF@bytedance.com>
 <20221013160902.00001c32@huawei.com>
 <2DECB41B-DB90-47DF-BA8E-BEE6869BADFD@bytedance.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 18 Oct 2022 14:26:41 -0700
"Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com> wrote:

> Hi Jonathan,
>=20
> > On Oct 13, 2022, at 8:09 AM, Jonathan Cameron <Jonathan.Cameron@huawei.=
com> wrote:
> >  =20
>=20
> <skipped>
>=20
> >> So, I would like to contribute to QEMU emulation of CXL memory
> >> support. And I would like to see a TODO list. I hope this list could
> >> be useful not only for me. As far as I can see, we can summarize: =20
> >=20
> > Absolutely agree on need for a TODO now there are multiple groups invol=
ved =20
>=20
> As far as I can see, Fabric Management looks like =E2=80=9Cuncharted terr=
itory=E2=80=9D with=20
> a lot of work. I think it=E2=80=99s pretty interesting direction for me t=
o start.=20
> I can read Compute Express Link Specification (Revision 3.0, Version 1.0)=
.=20
> Could you recommend some other docs or links to take a look?

So far the spec is all I'm aware of at the level of actually talking to the=
 hardware.
Probably some wooly presentations on what people 'might build'.

There are some other efforts that may be related to higher level - e.g. what
talks to the FM that then talks to the CXL devices.

I've not looked into them but google feeds me:
https://www.dmtf.org/documents/redfish-spmf/redfish-cxl-device-management-m=
odels-bundle-08wip
https://www.dmtf.org/content/dmtf-and-cxl-consortium-establish-work-register

One interesting diversion in this space would be to get the MCTP interfaces
up and running (perhaps via i2c).  The last time I looked at that,
the issue was that there wasn't any overlap between suitable I2C controllers
(need to support master and subordinate roles) and ones with ACPI bindings.
Doing it over PCIe VDMs is also an option.  The interest here would be to
put a second transport option in place so that any userspace FM code would
work well with that and via the mailbox interfaces.

Early work on the i2c approach at:
https://lore.kernel.org/qemu-devel/20220520165909.4369-1-Jonathan.Cameron@h=
uawei.com/

For now I've abandoned that as CXL 3.0 got published with the Switch mailbox
path (+ support for tunneling commands via a normal mailbox on multi head d=
evices).

>=20
> By the way, I see ARM64 support in TODO list. But nothing related to RISC=
-V.
> Do we need to consider RISC-V too?

I'm only going to focus on architectures I have reason to support
- there's enough work to keep me busy without adding more!

More than happy to review / comment on support for risc-v though. The
same applies to Power (no idea on IBM's plans, but they are a BoD level
member of CXL so I assume they may have some.)

Jonathan

>=20
> Thanks,
> Slava.
>=20
>=20
>=20



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E85637CB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:24:20 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JRL-0004hk-NH
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o7JCT-0004m9-Jk
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:08:57 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o7JCQ-0005Qo-MQ
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:08:57 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LZKlc4ZHzz67wTn;
 Sat,  2 Jul 2022 00:04:44 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 18:08:50 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Jul
 2022 17:08:49 +0100
Date: Fri, 1 Jul 2022 17:08:48 +0100
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Brice Goglin <Brice.Goglin@inria.fr>, Igor Mammedov <imammedo@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi <jingqi.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, <hesham.almatary@huawei.com>
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220701170848.000043b7@huawei.com>
In-Reply-To: <20220630092934-mutt-send-email-mst@kernel.org>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
 <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
 <20220630092934-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 30 Jun 2022 09:30:58 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jun 30, 2022 at 02:40:13PM +0200, Brice Goglin wrote:
> >=20
> > Le 30/06/2022 =E0 14:23, Igor Mammedov a =E9crit=A0: =20
> > > On Thu, 30 Jun 2022 09:36:47 +0200
> > > Brice Goglin <Brice.Goglin@inria.fr> wrote:
> > >  =20
> > > > Allow -numa without initiator value when hmat=3Don so that we may
> > > > build more complex topologies, e.g. NUMA nodes whose best initiators
> > > > are not just another single node.
> > > >  =20
> > > patches looks fine code-wise,
> > > however something wrong with them, i.e. 'git am' doesn't like them
> > > nor ./scripts/checkpatch (which one should use before sending patches=
).
> > >=20
> > > I've checked it's not my mail server/client issue(or whatever)
> > > that corrupts them (ones downloaded from patchew are broken as well) =
=20
> >=20
> >=20
> > I don't know what's going on. These 4 patches are in
> > https://github.com/bgoglin/qemu/commits/hmat-noinitiator (rebased on ma=
ster
> > 10mn ago). =20
>=20
> It's the commit log that's corrupted.
>=20
> > Do whatever you want with them. I am not allowed to spend more time on =
this.
> >=20
> > Brice =20
>=20
> Maybe someone will fix up the log and repost. One can hope ..
>=20

We are planning to send out arm/virt support shortly including a similar te=
st
that uses this series.  So if no one else gets to it before hand we'll incl=
ude
fixed up version of Brice's series with that.

Jonathan


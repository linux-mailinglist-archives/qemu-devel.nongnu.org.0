Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646A5578B7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 13:30:38 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4L2i-0005U6-Qo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 07:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4KxW-00035H-Vr
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:25:15 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4KxU-0008C2-CS
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:25:14 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LTHvz40r0z689Mk;
 Thu, 23 Jun 2022 19:24:31 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 23 Jun 2022 13:24:59 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 23 Jun
 2022 12:24:59 +0100
Date: Thu, 23 Jun 2022 12:24:57 +0100
To: Brice Goglin <Brice.Goglin@inria.fr>
CC: Igor Mammedov <imammedo@redhat.com>, <qemu-devel@nongnu.org>, "Eduardo
 Habkost" <eduardo@habkost.net>, Liu Jingqi <jingqi.liu@intel.com>, Tao Xu
 <tao3.xu@intel.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
Message-ID: <20220623122457.0000646b@Huawei.com>
In-Reply-To: <7eb4ef82-1e03-1135-2160-9673d2576849@inria.fr>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
 <20220620152757.5dd721b9@redhat.com>
 <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
 <20220620180549.787983ec@redhat.com>
 <7eb4ef82-1e03-1135-2160-9673d2576849@inria.fr>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml712-chm.china.huawei.com (10.201.108.63) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 21 Jun 2022 12:49:09 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> Le 20/06/2022 =E0 18:05, Igor Mammedov a =E9crit=A0:
> > On Mon, 20 Jun 2022 17:24:18 +0200
> > Brice Goglin <Brice.Goglin@inria.fr> wrote:
> > =20
> >> Le 20/06/2022 =E0 15:27, Igor Mammedov a =E9crit Machine (2966MB total=
) +
> >> Package P#0 =20
> >>>>      NUMANode P#2 (979MB)
> >>>>      Group0
> >>>>        NUMANode P#0 (980MB)
> >>>>        Core P#0 + PU P#0
> >>>>        Core P#1 + PU P#1
> >>>>      Group0
> >>>>        NUMANode P#1 (1007MB)
> >>>>        Core P#2 + PU P#2
> >>>>        Core P#3 + PU P#3 =20
> >>> here should be a dis-assembled dump of generated HMAT table =20
> >>
> >> Hello
> >>
> >> Like what I added at the end of
> >> https://github.com/bgoglin/qemu/commit/d9b3f5cb1514adafa644afcc2a363f2=
dc9795a32
> >> ? =20
> > yep, only full version including headers. =20
>=20
>=20
> Thanks,
>=20
> I split the patch adding the new test in 3 patches, reduced memory to=20
> 128M total, etc.
>=20
> I am not sure I understood what I am supposed to put in commit messages.=
=20
> Can you check the 4 patches on top of=20
> https://github.com/bgoglin/qemu/commits/hmat-noinitiator before I resend=
=20
> them to the list?
>=20
> Brice
>=20

I left a couple of trivial comments on github, but basically looks good
to me.

Jonathan


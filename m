Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33386920A7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 11:49:23 +0200 (CEST)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzeHy-0000ku-9i
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 05:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hzeGq-00087C-VY
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:48:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hzeGp-0001zW-TC
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:48:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2255 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hzeGd-0001oJ-No; Mon, 19 Aug 2019 05:48:00 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 87C8F8D8563844FDA1F3;
 Mon, 19 Aug 2019 17:47:52 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 19 Aug 2019
 17:47:46 +0800
Date: Mon, 19 Aug 2019 10:47:30 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190819104730.0000234a@huawei.com>
In-Reply-To: <CAFEAcA8cLy+QfswCD6iGHcQywDA6hHYaBdxT9Zfa2zAzSotm_w@mail.gmail.com>
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA8cLy+QfswCD6iGHcQywDA6hHYaBdxT9Zfa2zAzSotm_w@mail.gmail.com>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-devel] [RFC PATCH 0/7] qemu: CCIX pcie config space
 emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jon Masters <jcm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Aug 2019 13:59:02 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 25 Jun 2019 at 12:28, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > CCIX topologies are 'layered' on top of PCIe tree topologies.
> > This is done primarily by allowing a single CCIX device to appear as
> > multiple disjoint nodes in the PCIe tree. =20
>=20
> > This patch is being distributed by the CCIX Consortium, Inc. (CCIX) to
> > you and other parties that are paticipating (the "participants") in
> > qemu with the understanding that the participants will use CCIX's
> > name and trademark only when this patch is used in association with
> > qemu.
> >
> > CCIX is also distributing this patch to these participants with the
> > understanding that if any portion of the CCIX specification will be
> > used or referenced in qemu, the participants will not modify the cited
> > portion of the CCIX specification and will give CCIX propery copyright
> > attribution by including the following copyright notice with
> > the cited part of the CCIX specification:
> > "=A9 2019 CCIX CONSORTIUM, INC. ALL RIGHTS RESERVED." =20
>=20
> (Apologies for replying to this now quite old email, but your
> more recent followup email drew it to my attention.)
>=20
> I think that as a project, QEMU can't take patches which come
> with this kind of additional constraint on top of the GPL. Could
> you drop these extra legal clauses, please?

Jon, if you could raise this with CCIX legal that would be great.

Thanks,

Jonathan
=20
>=20
> thanks
> -- PMM




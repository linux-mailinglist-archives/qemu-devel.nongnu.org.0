Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95FAE8D2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 13:05:38 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7dxp-0001Au-MV
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 07:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i7dtv-000810-QJ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i7dtu-0004YB-IH
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:01:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54850)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i7dtq-0004X6-1C; Tue, 10 Sep 2019 07:01:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B4E883082B40;
 Tue, 10 Sep 2019 11:01:28 +0000 (UTC)
Received: from dhcp-4-67.tlv.redhat.com (dhcp-4-67.tlv.redhat.com [10.35.4.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DEE019C4F;
 Tue, 10 Sep 2019 11:01:26 +0000 (UTC)
Message-ID: <04d84d46138e2f7ceee0d65ed49efdc0ca116374.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Tue, 10 Sep 2019 14:01:25 +0300
In-Reply-To: <20190909103542.GD24509@redhat.com>
References: <20190906195750.17651-1-mlevitsk@redhat.com>
 <20190906195750.17651-4-mlevitsk@redhat.com>
 <20190909103542.GD24509@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 10 Sep 2019 11:01:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/3] qemu-iotests: Add test for bz
 #1745922
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-stable <qemu-stable@nongnu.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-09-09 at 11:35 +0100, Daniel P. Berrang=C3=A9 wrote:
> On Fri, Sep 06, 2019 at 10:57:50PM +0300, Maxim Levitsky wrote:
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  tests/qemu-iotests/263     | 75 ++++++++++++++++++++++++++++++++++++=
++
> >  tests/qemu-iotests/263.out | 19 ++++++++++
> >  tests/qemu-iotests/group   |  1 +
> >  3 files changed, 95 insertions(+)
> >  create mode 100755 tests/qemu-iotests/263
> >  create mode 100644 tests/qemu-iotests/263.out
> >=20
> > diff --git a/tests/qemu-iotests/263 b/tests/qemu-iotests/263
> > new file mode 100755
> > index 0000000000..36951ff7b4
> > --- /dev/null
> > +++ b/tests/qemu-iotests/263
> > @@ -0,0 +1,75 @@
> > +#!/usr/bin/env bash
> > +#
> > +# Test encrypted write that crosses cluster boundary of two unalloca=
ted clusters
> > +# Based on 188
> > +#
> > +# Copyright (C) 2019 Red Hat, Inc.
> > +#
> > +# This program is free software; you can redistribute it and/or modi=
fy
> > +# it under the terms of the GNU General Public License as published =
by
> > +# the Free Software Foundation; either version 2 of the License, or
> > +# (at your option) any later version.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> > +# along with this program.  If not, see <http://www.gnu.org/licenses=
/>.
> > +#
> > +
> > +# creator
> > +owner=3Dmlevitsk@redhat.com
> > +
> > +seq=3D`basename $0`
> > +echo "QA output created by $seq"
> > +
> > +status=3D1	# failure is the default!
> > +
> > +_cleanup()
> > +{
> > +	_cleanup_test_img
> > +}
> > +trap "_cleanup; exit \$status" 0 1 2 3 15
> > +
> > +# get standard environment, filters and checks
> > +. ./common.rc
> > +. ./common.filter
> > +
> > +_supported_fmt qcow2
> > +_supported_proto generic
> > +_supported_os Linux
> > +
> > +
> > +size=3D1M
> > +
> > +SECRET=3D"secret,id=3Dsec0,data=3Dastrochicken"
> > +
> > +_make_test_img --object $SECRET -o "encrypt.format=3Dluks,encrypt.ke=
y-secret=3Dsec0,encrypt.iter-time=3D10,cluster_size=3D64K" $size
> > +
> > +IMGSPEC=3D"driver=3D$IMGFMT,encrypt.key-secret=3Dsec0,file.filename=3D=
$TEST_IMG"
> > +
> > +QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
> > +
> > +echo
> > +echo "=3D=3D reading the whole image =3D=3D"
> > +$QEMU_IO --object $SECRET -c "read -P 0 0 $size" --image-opts $IMGSP=
EC | _filter_qemu_io | _filter_testdir
> > +
> > +echo
> > +echo "=3D=3D write two 512 byte sectors on a cluster boundary =3D=3D=
"
> > +$QEMU_IO --object $SECRET -c "write -P 0xAA 0xFE00 0x400" --image-op=
ts $IMGSPEC | _filter_qemu_io | _filter_testdir
> > +
> > +echo
> > +echo "=3D=3D verify that the rest of the image is not changed =3D=3D=
"
> > +$QEMU_IO --object $SECRET -c "read -P 0x00 0x00000 0xFE00" --image-o=
pts $IMGSPEC | _filter_qemu_io | _filter_testdir
> > +$QEMU_IO --object $SECRET -c "read -P 0xAA 0x0FE00 0x400" --image-op=
ts $IMGSPEC | _filter_qemu_io | _filter_testdir
> > +$QEMU_IO --object $SECRET -c "read -P 0x00 0x10200 0xEFE00" --image-=
opts $IMGSPEC | _filter_qemu_io | _filter_testdir
>=20
> This tests LUKS encryption, but the code you'r changing/fixing also use=
d
> for the traditionl qcow2 encryption. The difference in IV handling for
> these two methods is what made this code confusing, so I'd like to see
> that the test also covers traditional qcow2 encryption.
This is very good idea. Done.

>=20
> Also can you confirm that the test succeeds when run on a qemu
> built against 8c1ecb590497b0349c550607db923972b37f6963  (the change
> immediately before Vladimir's threading series) ?
Yes, the test fails with this commit. It also fails on master and works
with my fix (both encryption case).

>=20
>=20
> Regards,
> Daniel


Best regards,
	Maxim Levitsky




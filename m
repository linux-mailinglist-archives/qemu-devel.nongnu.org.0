Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09EC65D658
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4zN-00042z-8f; Wed, 04 Jan 2023 09:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pD4zH-00042h-CF; Wed, 04 Jan 2023 09:43:27 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pD4zE-0002T4-7P; Wed, 04 Jan 2023 09:43:27 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230104144313euoutp01eb5d0db4c4b101ad91415e5514e242ac~3IjP9XdFi0748507485euoutp01b;
 Wed,  4 Jan 2023 14:43:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230104144313euoutp01eb5d0db4c4b101ad91415e5514e242ac~3IjP9XdFi0748507485euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1672843393;
 bh=KIvE6X1Ez+LvnELWXdt7BNVNHjk9oBI8OtQZzZGp18Y=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=AJKoDAbpRyB0/BBetirxNCdOIKliAuoFWPhUF0gVyKJe8UkplJ/xxaGFs3YmCzYuE
 OqidsjxWQ4t1Dd8JBdQOPFvzWuOuhzBATD2dImZjq5wUoXh/CBwG1M0e54VmlGa47O
 cB1GG8hBHCB3KL/B/BzcJfeQ4lruq2c+A9fgAPmM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230104144313eucas1p229772c8d2ca1555d3f72cd3b36bcbdfd~3IjP1MjD30256402564eucas1p2t;
 Wed,  4 Jan 2023 14:43:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id F8.10.43884.08095B36; Wed,  4
 Jan 2023 14:43:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230104144312eucas1p2dee4a7c020b5b140e4bd0a6c83990624~3IjPfluJa0054200542eucas1p20;
 Wed,  4 Jan 2023 14:43:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230104144312eusmtrp123671ff79a6a03b7c5dc05f2213f553d~3IjPfA7ke0579505795eusmtrp1q;
 Wed,  4 Jan 2023 14:43:12 +0000 (GMT)
X-AuditID: cbfec7f5-25bff7000000ab6c-4b-63b590807d93
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.26.23420.08095B36; Wed,  4
 Jan 2023 14:43:12 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230104144312eusmtip1bc64d1b8768e185d5c986dac9efbedc1~3IjPTDC_51149411494eusmtip1L;
 Wed,  4 Jan 2023 14:43:12 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 4 Jan 2023 14:43:12 +0000
Date: Wed, 4 Jan 2023 15:43:17 +0100
From: Joel Granados <j.granados@samsung.com>
To: Christoph Hellwig <hch@infradead.org>
CC: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>,
 <qemu-block@nongnu.org>, <linux-nvme@lists.infradead.org>,
 <kbusch@kernel.org>
Subject: Re: [PATCH v2 0/3] Add OCP extended log to nvme QEMU
Message-ID: <20230104144317.dxvaqtcocgessnwe@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="axvto4zh4bjphurv"
Content-Disposition: inline
In-Reply-To: <Y6VbSjV3l+/3CWmb@infradead.org>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSe0hTcRTH+W1316u1uq2VB20lS3r5KHs5SEOhQCiohCIj0DGvD5zTNqc9
 yCxDzVdrvdaozKWbWUptaVPTSjErV2bl1BDF0qipi1bLlr3crpHQf5/zPd/zO+cLP4LJucvy
 IhIlaZRUIhTzcQ+s9qGjI+Cooka0ql6JBO0KDUOgbDYjQYl22E2gtubigrYiIxbGijBUrIjQ
 V57AIwxlRyKGzAbGdmyPR0gsJU5Mp6QrN8Z4JFSPj7NSdbz9GlslKwt1euYjdwLItVD/apiZ
 jzwIDlmBoK7AgdPFFwRthZ3I6eKQnxF0K5l/J0xNvW60SYegq/UbRheTpuzi+qmOAcFb2wvX
 OEb6gr63HHMyTvpDx2if6ykuuRxe63Jdy5lkLoKr6n6WszGXDIVS4x3cyWwyGBwvT03xHHh8
 Ycj1EJPcD409xxn5iJhkb9D9IpyyOxkAP9/m4PSpfLCPFrFoPgxVD02u44DMdoe8cROiG5tg
 ZNjBoHkuWNpuu9G8ANpPF2I0J0Hdmfqp/KmgfnwWd+4FcgMUm8S0HA7vflhZtDwLesbm0FfO
 AmXteSYtsyEvh0O7l4DxWA1SoMXqabnU03Kp/+WiZX+40mDD/5P9QFs6wqQ5FKqrP2JXkFsl
 8qTksuR4SrZGQmUEyoTJMrkkPlCUkqxHk5+q/Veb3YgqLJ8CmxGDQM3Id3L4zc3rz5EXJkmR
 UHwuW/leL+KwY4UHDlLSlGipXEzJmpE3gfE92aqaEhGHjBemUUkUlUpJ/3YZhLtXFuN4JHcQ
 V9tubbPzyPA6Q1/3VlXB4pi6jP6mBnOPZnfVxSBOlPbbSd2PkI4bds2+IK62U/AoNkrly+6V
 Nlbl+aiCVu84Mv92SFU3sSfh/tM+y1Awy+i1c5HimrEk3TemxaelZlf+lrgljkszzvhFfojL
 yYze0jU8OPY9SbuOF6DLvbhUnnMpTqbyi45be+hTuJJ/eXaRT1lCUuD64MGWez+1D15GZYoH
 CkwzRxm7v3IHLLbotFAzL9Pamkecszyy7zU/qfVeGJJo2XzA4tmV9WQj9/0r601jWG//RJMu
 pVM+cV64SdegKcfQ78QNeu4zeTsved6yjO4To1prIyXqUvAxWYIwaAVTKhP+Acla62/PAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xu7oNE7YmG8xt17Q4PWERk8WkQ9cY
 LeYve8puMetdO5vF8d4dLA6sHptXaHlsWtXJ5rF5Sb3Hk2ubmQJYovRsivJLS1IVMvKLS2yV
 og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyJr9dylywVLbi3pubTA2M58W7
 GDk5JARMJM7su8nexcjFISSwlFHi/NHdrBAJGYlPVz6yQ9jCEn+udbFBFH1klDjwYhsrhLOZ
 UeL48qNsIFUsAioSm24uZQGx2QR0JM6/ucMMYosIaErcWt7ODNLALNDKKLH69FawscICthIL
 d2wHa+YVMJf4eXkimC0ksIVR4uVTJYi4oMTJmU/AhjILlEk8enUQqIYDyJaWWP6PAyTMKaAr
 8fdxGxvEpUoSX9/0Qn1QK/Hq/m7GCYzCs5BMmoVk0iyESRBhLYkb/14yYQhrSyxb+JoZwraV
 WLfuPcsCRvZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgTG77djPzTsY5736qHeIkYmD8RCj
 ClDnow2rLzBKseTl56UqifBOerEpWYg3JbGyKrUoP76oNCe1+BCjKTAUJzJLiSbnA5NJXkm8
 oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDU6Pbyfxt6v387KunmWif
 Y7m9q91bKfifxvdtS5aVTtwgLcG7t3CvRlVEV8envUlv+dNVd29clbCbQfXCkpP/5pzd8W7X
 sweaN3bllPc+f5Xn1lbLm9vfGumQL7jym2vEi5qFp+6HFV5mXbJo0omG4lWR+aGft982Mk6d
 vu35io6N08RerA6wmORss9xuh/kN/42qL4PrpW/yBHw8YhtUtGaViaqCwU4Pa6ZPl0P4P20P
 uRiTYOOi27RCev/BvStylrtVr+x0rZUq/Tf1BOuGoh/NU1d+MWP3/MCot9adZaaOdxQfZ5jh
 JV/9v4KbPuiXMDSpPb/EoGAttkYu3uUaxyJZ9f1SL9vPpASVzuY1VGIpzkg01GIuKk4EAJU+
 THJuAwAA
X-CMS-MailID: 20230104144312eucas1p2dee4a7c020b5b140e4bd0a6c83990624
X-Msg-Generator: CA
X-RootMTR: 20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0
References: <CGME20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0@eucas1p2.samsung.com>
 <20221114135043.2958100-1-j.granados@samsung.com>
 <Y6VbSjV3l+/3CWmb@infradead.org>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--axvto4zh4bjphurv
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2022 at 11:39:54PM -0800, Christoph Hellwig wrote:
> Please don't do this.  OCP is acting as a counter standard to the
> proper NVMe standard here and should in absolutely no way be supported
> by open source projects that needs to stick to the actual standards.
>=20
> Please work with the NVMe technical working group to add this (very
> useful) functionality to NVMe proper first.

This is a very good point. Regardless of what OCP's ultimate objective,
having this in the NVMe specification would reach more cases. We can
even use existing values like the "Media Bytes with Metadata Written" in
the statistics log page of the newly ratified FDP TP.

Thx for the review

Best

Joel

>=20
> On Mon, Nov 14, 2022 at 02:50:40PM +0100, Joel Granados wrote:
> > The motivation and description are contained in the last patch in this =
set.
> > Will copy paste it here for convenience:
> >=20
> >     In order to evaluate write amplification factor (WAF) within the st=
orage
> >     stack it is important to know the number of bytes written to the
> >     controller. The existing SMART log value of Data Units Written is t=
oo
> >     coarse (given in units of 500 Kb) and so we add the SMART health
> >     information extended from the OCP specification (given in units of =
bytes).
> >=20
> >     To accommodate different vendor specific specifications like OCP, w=
e add a
> >     multiplexing function (nvme_vendor_specific_log) which will route t=
o the
> >     different log functions based on arguments and log ids. We only ret=
urn the
> >     OCP extended smart log when the command is 0xC0 and ocp has been tu=
rned on
> >     in the args.
> >=20
> >     Though we add the whole nvme smart log extended structure, we only =
populate
> >     the physical_media_units_{read,written}, log_page_version and
> >     log_page_uuid.
> >=20
> > V1 changes:
> > 1. I moved the ocp parameter from the namespace to the subsystem as it =
is
> >    defined there in the OCP specification
> > 2. I now accumulate statistics from all namespaces and report them back=
 on
> >    the extended log as per the spec.
> > 3. I removed the default case in the switch in nvme_vendor_specific_log=
 as
> >    it does not have any special function.
> >=20
> > Joel Granados (3):
> >   nvme: Move adjustment of data_units{read,written}
> >   nvme: Add ocp to the subsys
> >   nvme: Add physical writes/reads from OCP log
> >=20
> >  hw/nvme/ctrl.c       | 70 ++++++++++++++++++++++++++++++++++++++++----
> >  hw/nvme/nvme.h       |  1 +
> >  hw/nvme/subsys.c     |  4 +--
> >  include/block/nvme.h | 36 +++++++++++++++++++++++
> >  4 files changed, 103 insertions(+), 8 deletions(-)
> >=20
> > --=20
> > 2.30.2
> >=20
> >=20
> ---end quoted text---

--axvto4zh4bjphurv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmO1kH8ACgkQupfNUreW
QU94Pgv/VVbG5a11dxiOo9KnmmPZGSRii/URzIlB1ugJiyjuK88mytE1qDKIxT5z
BI0IVpDqcDjnuFtOuNGR/TTkVNImrjF3E4OIXTf7XqyA648aFx/rs9k91EUlf4hh
CrurVu1X5hn6plEUjxS3GNfGVUCoX+TNX7wTw0+HtlQzu9agMaXTNalA+9iMZM5q
smd4pJDB3whTddIZUHPE0O/PzmcDKoWLd0PaBX9hE0e/WfrFUuuhrWk7tuW982qy
+KARvvC7drRBvNlfd46+gaj6gxP58UoUXkkxSjRACool62fi6+NfagaitMnRDKIE
qi5nf6Mz2DBD2N3ht5QfghaQfoM3iQATDbsyFhoyLAbIVvtLs7Dj4LmSBdZ1HiO3
krM4QaB0Ct+1YZJ4g92Bh1PzOUVenSa99ZVBLzwrb+RJ5vvBuV6ciJvFCHAX/ja0
WQI38OF8zTKDMGpwKe4krCgx+82xFAO5jktKqSIldJo3+ZWMPImBISMa+6hfkf2F
p0SQcBEx
=2g1/
-----END PGP SIGNATURE-----

--axvto4zh4bjphurv--


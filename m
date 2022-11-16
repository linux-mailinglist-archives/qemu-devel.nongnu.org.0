Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BD62C1BE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJwg-0005Yk-N3; Wed, 16 Nov 2022 10:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovJwU-0005Sq-LE; Wed, 16 Nov 2022 10:03:13 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovJwS-0005HY-1o; Wed, 16 Nov 2022 10:03:10 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116150254euoutp01de0282001ca694ad7d0e2440780668be~oGNcw_qu12915229152euoutp01y;
 Wed, 16 Nov 2022 15:02:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116150254euoutp01de0282001ca694ad7d0e2440780668be~oGNcw_qu12915229152euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668610974;
 bh=+uS1QFzChYfQSGx4Enb+s5lsh6B0h1NyUcgjpy/mTuA=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=sG/HZsQ5GqIUWk0dBsgsteX0EJ5gh/ulw66FY7XFXVKG6K3e9tLV0WpqdzZdUgLJF
 wEvGEj/4VLG5PK+sY5JPXKshv6poS0unJX+7ilCvKr5TD+5RFtIYasi63247EbpCfB
 /GAhahuGS1BS5LKc1Ix8bO19+ggw9xKajeKNSzZw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221116150254eucas1p1657104dafe0d9aa3dbde8dffc6c5091f~oGNcngEGE2471124711eucas1p1T;
 Wed, 16 Nov 2022 15:02:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 09.86.09561.E9BF4736; Wed, 16
 Nov 2022 15:02:54 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221116150254eucas1p1d0070bad1cd94c2cbb5da508c6dd2da2~oGNcWrQQP2502925029eucas1p1H;
 Wed, 16 Nov 2022 15:02:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221116150254eusmtrp112f2ecde7c0d765c2216d7479b63c364~oGNcWKJuV0616306163eusmtrp1w;
 Wed, 16 Nov 2022 15:02:54 +0000 (GMT)
X-AuditID: cbfec7f2-0c9ff70000002559-5f-6374fb9e70fb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.CD.09026.D9BF4736; Wed, 16
 Nov 2022 15:02:53 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221116150253eusmtip1d5181e811dcab676edb26523d92b6045~oGNcMGZ890793907939eusmtip1q;
 Wed, 16 Nov 2022 15:02:53 +0000 (GMT)
Received: from localhost (106.210.248.19) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Nov 2022 15:02:52 +0000
Date: Wed, 16 Nov 2022 16:02:51 +0100
From: Joel Granados <j.granados@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] nvme: Add ocp to the subsys
Message-ID: <20221116150251.qtrgjbcncbjjjjin@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="il4qoeqqxnlwg7fj"
Content-Disposition: inline
In-Reply-To: <Y3Nz9ieSaj0mHvRy@cormorant.local>
X-Originating-IP: [106.210.248.19]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7rzfpckGxxcwmux/+A3VotZ79rZ
 LI737mBxYPY4t+M8u8eTa5uZApiiuGxSUnMyy1KL9O0SuDI2rH3BUrBHrOJcg0oD40WhLkZO
 DgkBE4mPXWuYuxi5OIQEVjBKnP15jQXC+cIosfP4KkYI5zOjxMJTz9lgWr5+mMMEkVjOKHH/
 7FU2uKrtKx5ADdvCKDH/1hSwFhYBVYmZz2ewg9hsAjoS59/cYQaxRQRUJJ7+28sCYjML+EjM
 ndPEBGILC5hLNHccB7N5gezWfc9ZIGxBiZMzn0DVV0h8PwkyhwPIlpZY/o8DJMwpoC9xo62d
 BeJSJYlnG6ezQti1EmuPnWEHuU1C4A6HxOGupUwgvRICLhINx+QhaoQlXh3fwg5hy0icntwD
 NSdbYueUXcwQdoHErJNT2SBarSX6zuRAhB0lOp/0MEOE+SRuvBWEOJJPYtK26VBhXomONmio
 q0nsaNrKOIFReRaSt2YheWsWwlsQYR2JBbs/sWEIa0ssW/iaGcK2lVi37j3LAkb2VYziqaXF
 uempxYZ5qeV6xYm5xaV56XrJ+bmbGIEJ6PS/4592MM599VHvECMTB+MhRhWg5kcbVl9glGLJ
 y89LVRLhzZ9ckizEm5JYWZValB9fVJqTWnyIUZqDRUmcl22GVrKQQHpiSWp2ampBahFMlomD
 U6qByVj2hW2xpkZXpNSiJwdt5N7OXLp2CpOG7UIFh64vrzk/3TXfz/1e78Fei/W7yrNX/pgV
 yfLySXFP71zRJ0H1yktWzN9bt81tWn0f36pdO3wWX7J5o6Ai/OTy8dqqn2dkp1rw6+Tw5s+O
 Fr1Wb3WPQXPDo+NrDf4xNjFvCc/IuPFq7fEnJsf0/S6tX6L4j62WQd2nu2rFbpZTlWunntt8
 +AoD5+X8k7cPhTywltHdV2Dy989FX5NtujMbHyd+T/v9o9fkiuMc+SNzbaaErMx8zsJvd+31
 j4YlXeypobXnH9x8sf66fanw5fr92d7H7E6dfsy931RQ/+65Kcd/HAtWtJpc+/7jr4L2PXca
 JX8xcW9SYinOSDTUYi4qTgQAn/ZPgrsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7pzf5ckGzS9t7TYf/Abq8Wsd+1s
 Fsd7d7A4MHuc23Ge3ePJtc1MAUxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehnNe+4xF+wSq+jeN5exgfG8UBcjJ4eEgInE1w9zmLoYuTiEBJYy
 SkzYvZkJIiEj8enKR3YIW1jiz7UuNoiij4wSa35egnK2MEocbd7MDFLFIqAqMfP5DLAONgEd
 ifNv7oDFRQRUJJ7+28sCYjML+EjMndMEtkFYwFyiueM4mM0LZLfue84CMfQVo8TaV6eZIRKC
 EidnPoFqLpN4uu010GYOIFtaYvk/DpAwp4C+xI22dhaIS5Uknm2czgph10q8ur+bcQKj8Cwk
 k2YhmTQLYRJEWEvixr+XTBjC2hLLFr5mhrBtJdate8+ygJF9FaNIamlxbnpusZFecWJucWle
 ul5yfu4mRmA8bjv2c8sOxpWvPuodYmTiYDzEqALU+WjD6guMUix5+XmpSiK8+ZNLkoV4UxIr
 q1KL8uOLSnNSiw8xmgJDcSKzlGhyPjBR5JXEG5oZmBqamFkamFqaGSuJ83oWdCQKCaQnlqRm
 p6YWpBbB9DFxcEo1MPW97F3+IvT/p89J8TO2t+zS+bk47kKy+KLpDF6OM44a/LRXdpz3aEaj
 OwNviYvl9f8yFw4ecxA46dz1XsaKS/mk20bNfUeDjEWDDR0jpu/e63rk9DllhnMmomyzwx3F
 zYXbFdR/lpYdqDsQ/e+4ue/jrrf63LIVS8zv3d3+p/tqftSW6J6KlY/WBDByeW8UXrLrxXXf
 vaHubHxGD6LmyOv5FOR/FNVKDrzhXxiwZabDqnPVLtZTlioxPT5xq/yoYNCGU9Yvhfefj+xf
 U7DixZ0Qjp/bu0XKK9+wH2XrtV1pYdjW9bRKeu/OTPkpp5vmuYp9mMR373zBbq1an0l1W+QF
 tibqP9K6lctZ0zw1QomlOCPRUIu5qDgRAJjkeiZcAwAA
X-CMS-MailID: 20221116150254eucas1p1d0070bad1cd94c2cbb5da508c6dd2da2
X-Msg-Generator: CA
X-RootMTR: 20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb@eucas1p1.samsung.com>
 <20221114135043.2958100-3-j.granados@samsung.com>
 <Y3Nz9ieSaj0mHvRy@cormorant.local>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--il4qoeqqxnlwg7fj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2022 at 12:11:50PM +0100, Klaus Jensen wrote:
> On Nov 14 14:50, Joel Granados wrote:
> > The Open Compute Project defines a Datacenter NVMe SSD Spec that sits on
> > top of the NVMe spec. Additional commands and NVMe behaviors specific f=
or
> > the Datacenter. This is a preparation patch that introduces an argument=
 to
> > activate OCP in nvme.
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > ---
> >  hw/nvme/nvme.h   | 1 +
> >  hw/nvme/subsys.c | 4 ++--
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > index 79f5c281c2..aa99c0c57c 100644
> > --- a/hw/nvme/nvme.h
> > +++ b/hw/nvme/nvme.h
> > @@ -56,6 +56,7 @@ typedef struct NvmeSubsystem {
> > =20
> >      struct {
> >          char *nqn;
> > +        bool ocp;
> >      } params;
> >  } NvmeSubsystem;
> > =20
> > diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> > index 9d2643678b..ecca28449c 100644
> > --- a/hw/nvme/subsys.c
> > +++ b/hw/nvme/subsys.c
> > @@ -129,8 +129,8 @@ static void nvme_subsys_realize(DeviceState *dev, E=
rror **errp)
> > =20
> >  static Property nvme_subsystem_props[] =3D {
> >      DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
> > -    DEFINE_PROP_END_OF_LIST(),
> > -};
> > +    DEFINE_PROP_BOOL("ocp", NvmeSubsystem, params.ocp, false),
>=20
> It is the controller that implements the OCP specification, not the
> namespace or the subsystem. The parameter should be on the controller
> device.
Makes sense. I'll put the option in hw/nvme/ctrl.c

>=20
> We discussed that the Get Log Page was subsystem scoped and not
> namespace scoped, but that is unrelated to this.
Yep, this was the confusion. Thx for clarifying.

>=20
> > +    DEFINE_PROP_END_OF_LIST(), };
> > =20
> >  static void nvme_subsys_class_init(ObjectClass *oc, void *data)
> >  {
> > --=20
> > 2.30.2
> >=20
> >=20



--il4qoeqqxnlwg7fj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmN0+5gACgkQupfNUreW
QU9dvAv+Ps/JVolH6/Xya4rlJqScyfQtreIKX6QfU3iCJEtui2nFM3lqlRvqpX9B
bOM9Wj5lviTTdH+ZpNhsuNfDkyEnYotOClSUxQdzAgjN9yX/LbU/P+R10EGf6fxz
wTiUld0Ijh6ogqqWaajo8Yzmjpwvx8KTPS5FSn28cqypJ4hz6d2nyq6+Tz43KKLc
RARuj2JagZI6b3TeayLn9d+CfAExzuKq15tpecKY3yYmgku/krR3bsvWWc0QZh0W
nprvWJ7b89BqyZFSkrvgSn8C0vQjq24JnA5dReh55/DMnvLiN6gpF4G78UVUkCGe
xsmf2W/88SmkhaS7Spy7HwDkEiT+4KnqtafudmH/N9hK/vr+JQIJalSu4ywl3Pvj
BQXefROvExfXa+Yj/CIYdfbVIJf/Wk1Ojdms8PEqi3EBSEi/GVa91o84f/OSsbpm
WmvkNrNUNUHdRFbnJ7zofgh9hbj7PCKOfufYOtDbIV4h+aUTiIOWIA8M7ms6yOJK
o50RfInS
=6Bxe
-----END PGP SIGNATURE-----

--il4qoeqqxnlwg7fj--


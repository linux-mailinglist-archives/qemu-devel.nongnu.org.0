Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099862DFBF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:22:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovghk-0002t8-Kk; Thu, 17 Nov 2022 10:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovghd-0002nn-Jz; Thu, 17 Nov 2022 10:21:24 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovghX-00065n-BJ; Thu, 17 Nov 2022 10:21:21 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221117152102euoutp02336aa70ed76e44f8c47aef7be8576ea9~oaGkTYFhg2865428654euoutp029;
 Thu, 17 Nov 2022 15:21:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221117152102euoutp02336aa70ed76e44f8c47aef7be8576ea9~oaGkTYFhg2865428654euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668698462;
 bh=fWdqwzz89qRvf627l6XAeLtEO1pc2otmm0PZCdV4Zsk=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=sn256Cwvk7508k4+fHC8YmSr7JumFLL7K+W+MIIUtop+se8E6MmX8SBR5DGEh/DiP
 Mem5+GqYBgX/NBAtPG+SqvPdEAS/eoUJ5864KXbvFphM0mFrd4hkyk64ve3l51hJ6D
 m5TS8BdoYBM7HQMRfDu6uZB8koBA6NpPXMef83tA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221117152102eucas1p1de44e264e2aec445923a4f95474f39ca~oaGkKtZEH0363003630eucas1p1N;
 Thu, 17 Nov 2022 15:21:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F2.2F.09561.E5156736; Thu, 17
 Nov 2022 15:21:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221117152101eucas1p1d77e4839f870beb2cf47cef5e90105c7~oaGjtoIas2136021360eucas1p1r;
 Thu, 17 Nov 2022 15:21:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221117152101eusmtrp1cbd0ca07ed4d0c83e881abfda0c1828a~oaGjs9VcN1385213852eusmtrp10;
 Thu, 17 Nov 2022 15:21:01 +0000 (GMT)
X-AuditID: cbfec7f2-0c9ff70000002559-66-6376515e7250
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B4.FF.09026.D5156736; Thu, 17
 Nov 2022 15:21:01 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221117152101eusmtip18d321e749bd84a97c9dadaf849ab2bcf~oaGjQk4Ns0136501365eusmtip1p;
 Thu, 17 Nov 2022 15:21:01 +0000 (GMT)
Received: from localhost (106.210.248.19) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Nov 2022 15:21:00 +0000
Date: Thu, 17 Nov 2022 16:20:59 +0100
From: Joel Granados <j.granados@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, <k.jensen@samsung.com>
Subject: Re: [PATCH v3 2/2] nvme: Add physical writes/reads from OCP log
Message-ID: <20221117152059.lwqf5ctjlfhndtu3@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="p5mjc5xuadc4ujwt"
Content-Disposition: inline
In-Reply-To: <Y3XjJiE87sp1hy7f@cormorant.local>
X-Originating-IP: [106.210.248.19]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSWUwTURSGc2em7dBYMh1QTlojWusSRMCoEUWNRh+QKOoDwWhEa5kAQlvS
 UkTjggvWVCGoaKFqhFLAaATBDffQYCtSwF02g0txKa5sxqAow9Vo4tt3vvOf3HOSS5NsqUBG
 J2nTOL1WlaIQiqlLzm+NU+NWpqvDThXT4bdq+gXh1o8mYbgru5paQEY2VjeJIj1PzhMriNXi
 ufFcSlI6pw+dv16c2D9wmUp9ODOjJbeAyERXg8zIhwZmBhTnt4vMSEyzzCkE7/ObCVz0IqgY
 uC7ARQ+C3vvnhH9GHuU8I3GjDEHf2y4B3xhOldQlYL6AoCUbeKaYCfCi9gDFs5AJhqb37STP
 /owSOgdvDHuSWQo17q5h78dEwo9bfUOepiXMLOgzRfFawkihrsDzO54BrXf4OD3EcigbpHnt
 w4RC234TgddUwOtKiwDzNjjrdIswP6fBlaXGvBg+Oq8gzH7gdV34nRkN9YfxxsAkw5W8qyTm
 VLDWHRHyzwITATnuFKwXQtFeiwhrX2j+IMVL+sKhSxYSawns28vi9ESo3nUR5aLx1n/Osv5z
 lvXvWVgHQ+G1buF/egqUFvFpnudBefknqhCJTqMAzmjQJHCGaVpuU4hBpTEYtQkhap2mCg19
 n/pBV3c1OuH9EuJABI0cSDk0/PLcmXtIRml1Wk7hL9HcN6pZSbxq8xZOr1unN6ZwBgeS05Qi
 QCLMD1KzTIIqjUvmuFRO/6dL0D6yTIIa++LkjUDPpOVNt+1SYtb3npjcrwdbD9uV47tLxOm5
 zlGPtnU5ApNKlKKKPQNek3nfl+zYzySryusI61SPdI+ojI6w2B7Ij9lybvZHx7Sw3lZ779hl
 3MYC/555xW/Q06P3wk/QlRWP37kLR5qm21yWEa889rdRW7tqtnSUT9/anNU2uCPSNnmRRif/
 vkpVN7fCaC+bMC4uShprjk0L9s0abYtYs6j2Q2dG/UTW1vFG1+fffTfpU86Mtpbj4+StSLNk
 86SdfvGHVh2NUu92zk5s2G2QBW5oL8qMqbqdl/l6jqNB6vHaVpZulzT8lJkDE9daD6Talc39
 IT/HhGrZ6LO1CsqQqJoWROoNql9jO2N3uQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7qxgWXJBluvSlnsP/iN1WLWu3Y2
 i+O9O1gcmD3O7TjP7vHk2mamAKYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYw396+zFlw0rbhx8jVbA+MOrS5GTg4JAROJK313mbsYuTiEBJYy
 Skxr38MIkZCR+HTlIzuELSzx51oXG4gtJPCRUWLrJzUIewujxOlnzCA2i4CqxMMjPSwgNpuA
 jsT5N3fA4iICKhJP/+0FizML+EgcPPMaLC4s4CHxd/9XoDgHB6+AucTXdi+IG14xSlxqaQHb
 xSsgKHFy5hOo3jKJNQdXsYPUMwtISyz/xwES5hTQl7jd3c4EcaaSxLON01kh7FqJV/d3M05g
 FJ6FZNIsJJNmIUyCCGtJ3Pj3kglDWFti2cLXzBC2rcS6de9ZFjCyr2IUSS0tzk3PLTbSK07M
 LS7NS9dLzs/dxAiMxG3Hfm7Zwbjy1Ue9Q4xMHIyHGFWAOh9tWH2BUYolLz8vVUmEN/diabIQ
 b0piZVVqUX58UWlOavEhRlNgIE5klhJNzgemiLySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0
 xJLU7NTUgtQimD4mDk6pBib90swXNSf41O6u2s1vaXTjqZbthjdSMpM3ed6v3NfZGPWX47C5
 nF/37uV+MsfnH3XTun8pqWmayDWVbxtFSg23+jecyytN6+9UCXwsrNu1nWOn4bn6yk7b58mV
 +x/1St2eWalR9nHZLIuVCw+55x/64ijXcDuCuzhb+6ar9wcmXbFpGxnDxLicDga1yLwyWnBf
 5d4+zopXsR4ej+7kNi3ni1dqWT5RtvavVyzDIYfmehe1M5/K90SpG62I21u14Vjc1QdPZhiK
 m9V9WLS45OUbhwf7L2xKn+L0Ky1K7STn1bkR9ZtP9zZl/BBderrh0zIbhrOKkydv39va9mW5
 ubYFd0xIx3K5GCb+6MMtdkosxRmJhlrMRcWJAMOUKqBZAwAA
X-CMS-MailID: 20221117152101eucas1p1d77e4839f870beb2cf47cef5e90105c7
X-Msg-Generator: CA
X-RootMTR: 20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3
References: <20221116171455.3401086-1-j.granados@samsung.com>
 <CGME20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3@eucas1p1.samsung.com>
 <20221116171455.3401086-3-j.granados@samsung.com>
 <Y3XjJiE87sp1hy7f@cormorant.local>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=j.granados@samsung.com; helo=mailout2.w1.samsung.com
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

--p5mjc5xuadc4ujwt
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 08:30:46AM +0100, Klaus Jensen wrote:
> On Nov 16 18:14, Joel Granados wrote:
> > In order to evaluate write amplification factor (WAF) within the storage
> > stack it is important to know the number of bytes written to the
> > controller. The existing SMART log value of Data Units Written is too
> > coarse (given in units of 500 Kb) and so we add the SMART health
> > information extended from the OCP specification (given in units of byte=
s)
> >=20
> > We add a controller argument (ocp) that toggles on/off the SMART log
> > extended structure.  To accommodate different vendor specific specifica=
tions
> > like OCP, we add a multiplexing function (nvme_vendor_specific_log) whi=
ch
> > will route to the different log functions based on arguments and log id=
s.
> > We only return the OCP extended SMART log when the command is 0xC0 and =
ocp
> > has been turned on in the args.
> >=20
> > Though we add the whole nvme SMART log extended structure, we only popu=
late
> > the physical_media_units_{read,written}, log_page_version and
> > log_page_uuid.
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > ---
> >  docs/system/devices/nvme.rst |  7 +++++
> >  hw/nvme/ctrl.c               | 55 ++++++++++++++++++++++++++++++++++++
> >  hw/nvme/nvme.h               |  1 +
> >  include/block/nvme.h         | 36 +++++++++++++++++++++++
> >  4 files changed, 99 insertions(+)
> >=20
> > diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
> > index 30f841ef62..1cc5e52c00 100644
> > --- a/docs/system/devices/nvme.rst
> > +++ b/docs/system/devices/nvme.rst
> > @@ -53,6 +53,13 @@ parameters.
> >    Vendor ID. Set this to ``on`` to revert to the unallocated Intel ID
> >    previously used.
> > =20
> > +``ocp`` (default: ``off``)
> > +  The Open Compute Project defines the Datacenter NVMe SSD Specificati=
on that
> > +  sits on top of NVMe. It describes additional commands and NVMe behav=
iors
> > +  specific for the Datacenter. When this option is ``on`` OCP features=
 such as
> > +  the SMART / Health information extended log become available in the
> > +  controller.
> > +
> >  Additional Namespaces
> >  ---------------------
> > =20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index bf291f7ffe..c7215a4ed1 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -4455,6 +4455,41 @@ static void nvme_set_blk_stats(NvmeNamespace *ns=
, struct nvme_stats *stats)
> >      stats->write_commands +=3D s->nr_ops[BLOCK_ACCT_WRITE];
> >  }
> > =20
> > +static uint16_t nvme_ocp_extended_smart_info(NvmeCtrl *n, uint8_t rae,
> > +                                             uint32_t buf_len, uint64_=
t off,
> > +                                             NvmeRequest *req)
> > +{
> > +    NvmeNamespace *ns =3D NULL;
> > +    NvmeSmartLogExtended smart_l =3D { 0 };
> > +    struct nvme_stats stats =3D { 0 };
> > +    uint32_t trans_len;
> > +
> > +    if (off >=3D sizeof(smart_l)) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    /* accumulate all stats from all namespaces */
> > +    for (int i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> > +        ns =3D nvme_ns(n, i);
> > +        if (ns) {
> > +            nvme_set_blk_stats(ns, &stats);
> > +        }
> > +    }
> > +
> > +    smart_l.physical_media_units_written[0] =3D cpu_to_le32(stats.unit=
s_written);
> > +    smart_l.physical_media_units_read[0] =3D cpu_to_le32(stats.units_r=
ead);
>=20
> These are uint64s, so should be cpu_to_le64().
Good catch

>=20
> > +    smart_l.log_page_version =3D 0x0003;
> > +    smart_l.log_page_uuid[0] =3D 0xA4F2BFEA2810AFC5;
> > +    smart_l.log_page_uuid[1] =3D 0xAFD514C97C6F4F9C;
>=20
> Technically the field is called the "Log Page GUID", not the UUID.
Yep, that was all me. My brain just automatically completed UUID. Sorry
about that.
> Perhaps this is a bit of Microsoft leaking in, or it is to differentiate
> it from the UUID Index functionality, who knows.
>=20
> It looks like you byte swapped the two 64 bit parts, but not the
> individual bytes. It's super confusing when the spec just says "shall be
Individual bytes are also swapped. I actually tested this with nvme cli
and it successfully checks these 128 bytes. I got inspired by nvme-cli
(plugins/ocp/ocp-nvme.c) where the opc number appears.

> set to VALUE". Is that VALUE already in little endian? Sigh.
The spec says "All values in logs shall be little endian format". Which
still does not say if the value that appears in the pdf is in little or
big endian. Yes a bit confusing, see my final comment

>=20
> Anyway, I think it is fair to assume that, so just make
> log_page_uuid/guid a uint8_t 16-array and do something like:
>=20
> 	static const uint8_t uuid[16] =3D {
> 		0xAF, 0xD5, 0x14, 0xC9, 0x7C, 0x6F, 0x4F, 0x9C,
> 		0xA4, 0xF2, 0xBF, 0xEA, 0x28, 0x10, 0xAF, 0xC5,
> 	};

If I use this order the nvme-cli command will fail.
The order should be this one to be consistent with nvme-cli:

{
0xC5, 0xAF, 0x10, 0x28, 0xEA, 0xBF, 0xF2, 0xA4,
0x9C, 0x4F, 0x6F, 0x7C, 0xC9, 0x14, 0xD5, 0xAF
}

This means that nvme-cli interpreted the value that appeared on the spec
pdf as big endian and then changed it to little endian following the
spec. Another thing that could have been done is to interpret what appears =
in
the PDF as little endian just push it through without swapping it.
Is there something in the spec that can give clarity as to what endianess
the values in the pdf should be by default?

I see two options here:
1. We go with the interpretation of nvme-cli (big endian in pdf, little
   endian in code)
2. or we change nvme-cli (little endian in pdf, little endian in code)

What do you think?


>=20
> 	memcpy(smart_l.log_page_guid, uuid, sizeof(smart_l.log_page_guid));



--p5mjc5xuadc4ujwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmN2UVgACgkQupfNUreW
QU/aBAv/TfjOFTRvnCNB1LHT8WwtUdheTy3ROOtMM+vPGgonGPMWU2sPmPERUDgy
oRxkfD6/2XeQ4zQEr7t/FzIkc8S70hakcrP5lE1FW2fRL0otTJdrJ8WzEE5drlsz
0FdZqDxaN//ATxHaWYiutrsNiz+U8A3e11Se5EiZio3Z+xXCj5KbFL25hr6M2q1Y
8BND9C/klAqbBhMsqc3paKQYZR9rJ8U5+U9WbP5BqEiURNRZxMzJee/IT+AxBI+0
SiNbfdwFqEBvYL9Ypn6UQI60fR+pdG7QCF4FhtCBd0PeNPHu5uEeeKSd82akZG3B
XZAjdtKVYx6di3ZMOlcGKdNn81JoYI4ibvFmoddGBIx4sKu62AZXCak3HsTC6SNt
NYtCm5uMkPnYPX14oEo2/vexeA3RuexEVgxFHaB9GHXIf8D0N24PEKIvqz9n1gxt
F/7Ccm57Y1UfoKXDkJX7xU6XvCEZZUkr9nUEBg8P/lG5mRrcN1fDhZBAZQMtLqLL
fZ7S2xNI
=l5xR
-----END PGP SIGNATURE-----

--p5mjc5xuadc4ujwt--


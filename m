Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8046473F1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 17:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3JT9-0005tj-N9; Thu, 08 Dec 2022 11:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1p3JT6-0005tG-P7; Thu, 08 Dec 2022 11:09:52 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1p3JT0-0004WX-MO; Thu, 08 Dec 2022 11:09:52 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221208160934euoutp013aae73ca3944aa81ddae0307214d9c8f~u3T8S5KbT1237812378euoutp016;
 Thu,  8 Dec 2022 16:09:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221208160934euoutp013aae73ca3944aa81ddae0307214d9c8f~u3T8S5KbT1237812378euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670515774;
 bh=aYNK6P6FN1htFxlnwIgwq/HYIMUGtiO7htPwsKmgQ04=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=DD8nbgDK48+HD0DvNNZLZLsM44Y1rbbf3vE227ceHxn9v//5w4UeIrRNBbSEhiKCL
 8phr6jZiFLP4AUMeLG2Qocx9Uq09kYJ/KAs49v51y2UqpgNy/CKCFa9BrHFOQB43Tw
 PYb7uFy0C/FLwED/kfVDY5UciDM1cdZfpuSaFtA0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221208160934eucas1p178dd7ecc363d1efee541d4206bc77d70~u3T8EqD7p1814018140eucas1p1h;
 Thu,  8 Dec 2022 16:09:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4D.6E.10112.E3C02936; Thu,  8
 Dec 2022 16:09:34 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221208160934eucas1p1b485752fe9aee81d2a875d8a8ab7cb3b~u3T7vl9eh0481104811eucas1p1R;
 Thu,  8 Dec 2022 16:09:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221208160934eusmtrp2d7a3880a94d8d1e4f65fd0a30000a2b9~u3T7vDOj31856118561eusmtrp2C;
 Thu,  8 Dec 2022 16:09:34 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-cd-63920c3e4557
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F6.E5.08916.E3C02936; Thu,  8
 Dec 2022 16:09:34 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221208160934eusmtip2f94fcf4a561eb35a30a0b570904db24d~u3T7lXyf21367113671eusmtip2t;
 Thu,  8 Dec 2022 16:09:34 +0000 (GMT)
Received: from localhost (106.210.248.100) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 8 Dec 2022 16:09:33 +0000
Date: Thu, 8 Dec 2022 17:09:31 +0100
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
Subject: Re: [PATCH v4 0/2] Add OCP extended log to nvme QEMU
Message-ID: <20221208160931.dljdvslolrrognsa@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="ka3vi24n4xu7zhgk"
Content-Disposition: inline
In-Reply-To: <20221125094808.1856024-1-j.granados@samsung.com>
X-Originating-IP: [106.210.248.100]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djP87p2PJOSDR59lbGY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBlbD/FUnBJsWLj23nMDYx3pLoYOTkkBEwkVn56wNrF
 yMUhJLCCUeLhvBY2COcLo8T/yRsZIZzPjBLXO6ayw7T0rp4BVbWcUeLn78dMcFX/jp2Cymxh
 lFhyfgsjSAuLgIrE8aZDTCA2m4COxPk3d5hBbBEBH4kVs9eCxYUFbCUunLgFVs8rYC5x+fA5
 ZghbUOLkzCcsIDazQIXE/xsgcQ4gW1pi+T8OkDCngJ3EvRmzoa5TljizbSYbhF0rcWrLLbDj
 JAROcEhM/PmABSLhIvGw8zlUkbDEq+NboJplJP7vnM8EYWdL7JyyixnCLpCYdXIqG8heCQFr
 ib4zORBhR4ltR6+xQ4T5JG68FYS4kk9i0rbpzBBhXomONiGIajWJHU1bGSHCMhJP1yhMYFSa
 heTFWUhenIXwIkRYR2LB7k9sGMLaEssWvmaGsG0l1q17z7KAkX0Vo3hqaXFuemqxUV5quV5x
 Ym5xaV66XnJ+7iZGYLI5/e/4lx2My1991DvEyMTBeIhRBaj50YbVFxilWPLy81KVRHiXLZuY
 LMSbklhZlVqUH19UmpNafIhRmoNFSZx3xZSOZCGB9MSS1OzU1ILUIpgsEwenVAPTnOdRB5Zr
 3F7mOlfaSJQ3dPHy9Jff6zefC7rwVPj3j4ch/Db3z7x5uu+J1/O1t/YdUQzs/SzvO6FQ0/R/
 0Fd9DxvVWScfNCraMN9NfZJu21Km3rgu1V7YUV7qofCN87rvuQUvWqtHnkgOzJ71enJQbqe3
 8u9UyxcF66Qz711+9fvH7Xkvf8i9DYkPNlRIXu25003M8nWPW6BU2i8LxWeml4yW3LZ5oBql
 qJ1zKeit1APHttiVVf2TXvoZu/03WNoZ9Uf3U2SX9hl/F8uTjEqMEowruGqqNqX27XjFry3S
 Pu/tzlszVQKcn4flbub8Ns3+7dwj6xIq2AoKnsR1HFkyPXxDqZiSP2sL25OmVROVWIozEg21
 mIuKEwGlB/YWsQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7p2PJOSDa5dZLOY9a6dzeJ47w4W
 ByaPJ9c2MwUwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehlrNg8hanggmLF1bdNjA2Mt6S6GDk5JARMJHpXz2DrYuTiEBJYyiixo6+dFSIhI/Hp
 ykd2CFtY4s+1Lqiij4wSD9samSCcLYwSd65MZgKpYhFQkTjedAjMZhPQkTj/5g4ziC0i4COx
 YvZasLiwgK3EhRO3GEFsXgFzicuHz4HVCAHFX5zcChUXlDg58wkLiM0sUCbx7+0voCs4gGxp
 ieX/OEDCnAJ2EvdmzIY6TlnizLaZbBB2rcTnv88YJzAKzUIyaRaSSbMQJkGEtSRu/HvJhCGs
 LbFs4WtmCNtWYt269ywLGNlXMYqklhbnpucWG+oVJ+YWl+al6yXn525iBEbYtmM/N+9gnPfq
 o94hRiYOxkOMKkCdjzasvsAoxZKXn5eqJMK7bNnEZCHelMTKqtSi/Pii0pzU4kOMpsCAm8gs
 JZqcD4z9vJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGphKWe2Xq
 2z623Hu1uuNN8ZXGpYUvDe0CVwT86nLfN5+z8t6yeQ/u2K59fPhl3QxvE2OliW8fbTkWO8/3
 w4Wmht21t88+mz038M7FTzqC12963zkRuqbUhiGo++je3ctulyQ7HPwg6KOqzhmVkxnwgXO9
 9zbfdTulnOqvPRSoi3Q6qmn/Z1b7g0VnH/w0KGi4lcikPP+61sknMbPmTmm18+L8fyrTYtPb
 ALNIz/j3L7u9Vkw32z3np6iE0KytmVoHclvUt6hPN+P6fS9dNkPWNerTq3+TXnqqZv2cbz5B
 7fcVR82dnCzvzzMJNx740fEnPW/arx/BfO0W805PXHtA+fRRgZ5Nqx68N80xT18R8m6aEktx
 RqKhFnNRcSIAMRiDgEUDAAA=
X-CMS-MailID: 20221208160934eucas1p1b485752fe9aee81d2a875d8a8ab7cb3b
X-Msg-Generator: CA
X-RootMTR: 20221208160934eucas1p1b485752fe9aee81d2a875d8a8ab7cb3b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221208160934eucas1p1b485752fe9aee81d2a875d8a8ab7cb3b
References: <20221125094808.1856024-1-j.granados@samsung.com>
 <CGME20221208160934eucas1p1b485752fe9aee81d2a875d8a8ab7cb3b@eucas1p1.samsung.com>
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

--ka3vi24n4xu7zhgk
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

ping.

Is the solution to the guid constant ok?

Best

On Fri, Nov 25, 2022 at 10:48:06AM +0100, Joel Granados wrote:
> The motivation and description are contained in the last patch in this se=
t.
> Will copy paste it here for convenience:
>=20
>     In order to evaluate write amplification factor (WAF) within the stor=
age
>     stack it is important to know the number of bytes written to the
>     controller. The existing SMART log value of Data Units Written is too
>     coarse (given in units of 500 Kb) and so we add the SMART health
>     information extended from the OCP specification (given in units of by=
tes).
>=20
>     To accommodate different vendor specific specifications like OCP, we =
add a
>     multiplexing function (nvme_vendor_specific_log) which will route to =
the
>     different log functions based on arguments and log ids. We only retur=
n the
>     OCP extended smart log when the command is 0xC0 and ocp has been turn=
ed on
>     in the args.
>=20
>     Though we add the whole nvme smart log extended structure, we only po=
pulate
>     the physical_media_units_{read,written}, log_page_version and
>     log_page_uuid.
>=20
> V4 changes:
> 1. Fixed cpu_to_le64 instead of cpu_to_le32
> 2. Variable naming : uuid -> guid
> 3. Changed how the guid value appears in the code:
>    Used to be:
>         smart_l.log_page_uuid[0] =3D 0xA4F2BFEA2810AFC5;
>         smart_l.log_page_uuid[1] =3D 0xAFD514C97C6F4F9C;
>=20
>    Now is:
>         static const uint8_t guid[16] =3D {
>             0xC5, 0xAF, 0x10, 0x28, 0xEA, 0xBF, 0xF2, 0xA4,
>             0x9C, 0x4F, 0x6F, 0x7C, 0xC9, 0x14, 0xD5, 0xAF
>         };
>=20
>    This is different from what @klaus suggested because I want to keep it
>    consistent to what nvme-cli currently implements. I think here we can
>    either change both nvme-cli and this patch or leave the order of the
>    bytes as they are here. This all depends on how you interpret the Spec
>    (which is ambiguous)
>=20
> V3 changes:
> 1. Corrected a bunch of checkpatch issues. Since I changed the first patch
>    I did not include the reviewed-by.
> 2. Included some documentation in nvme.rst for the ocp argument
> 3. Squashed the ocp arg changes into the main patch.
> 4. Fixed several comments and an open parenthesis
> 5. Hex values are now in lower case.
> 6. Change the reserved format to rsvd<BYTEOFFSET>
> 7. Made sure that NvmeCtrl is the first arg in all the functions.
> 8. Fixed comment on commit of main patch
>=20
> V2 changes:
> 1. I moved the ocp parameter from the namespace to the subsystem as it is
>    defined there in the OCP specification
> 2. I now accumulate statistics from all namespaces and report them back on
>    the extended log as per the spec.
> 3. I removed the default case in the switch in nvme_vendor_specific_log as
>    it does not have any special function.
>=20
> Joel Granados (2):
>   nvme: Move adjustment of data_units{read,written}
>   nvme: Add physical writes/reads from OCP log
>=20
>  docs/system/devices/nvme.rst |  7 ++++
>  hw/nvme/ctrl.c               | 73 +++++++++++++++++++++++++++++++++---
>  hw/nvme/nvme.h               |  1 +
>  include/block/nvme.h         | 36 ++++++++++++++++++
>  4 files changed, 111 insertions(+), 6 deletions(-)
>=20
> --=20
> 2.30.2
>=20

--ka3vi24n4xu7zhgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmOSDDcACgkQupfNUreW
QU83Uwv+OItjGCQqMSYNDdZ1gJfbDr4CKq4kDiQMn5F3OsvfUQ+Hy3H76Flv7n07
mHCYLKBWrm63NLC7rV6ZyWVtvJJ5hi3f1UbQxFB9tuCfCP3qfYKR1eEc2EcZt+xf
P1mfBnA1WxFCZ8WwYDQ/rUk/kzOiHZQjaELlvGRc5vBgkt/OVY06YSoHEykmdiqc
aQKLU00OWwLbAshjcuuIWhXFbUMdskfxtnd29oqaUOudycq+Bd5a9nP1QQ7eqOmd
7Z1queM55bYJmgIjszUq3BDUNLtY66+8vTIDTIRua6VDORPZFrsGHzJcqH3PMlHv
IPS7gjj4fLUG5Z5y3oVv61fvzvanR5IdVXcKOIqhnUK01rj4jSjtoeNdqqGl6iMi
siiUTuvZTXFGyjexQUCsrdK4Y8UQvbh418G4Gx7qZjrQoLLB6tXyZiAAMahGDOOI
XikmHN/5r8BlYmPAFeHrwGkHRjWRzrsxcyUCM2Ilt5KsakBVjN8mhpuHffSQ86C1
NyiXb070
=dlvZ
-----END PGP SIGNATURE-----

--ka3vi24n4xu7zhgk--


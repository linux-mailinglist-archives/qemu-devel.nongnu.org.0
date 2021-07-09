Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D383C1FD4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:07:14 +0200 (CEST)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kbR-0005B2-K8
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1kTB-0006J5-Hh; Fri, 09 Jul 2021 02:58:41 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1kT8-000817-3P; Fri, 09 Jul 2021 02:58:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 55024320085B;
 Fri,  9 Jul 2021 02:58:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Jul 2021 02:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=8w/i1MqR1Bsl/ssGQB+EwSMnk15
 D98vImqt+zns/wB8=; b=hducb+P1tOXNQum2EdT+rX6T4AUGX1v7n1miZfBpdMw
 Lvaehi/GqmzgJckMTJj1OrX6Ed8tJUK/qStRGSlLCO1K9pZr5BSFLrVxBkmHw7e6
 pJuT+v7a/vHSOAaV3lIs+/7pmOnL81AhO+xf8CUHmbWZXxutmIvtTloOCWAQFGL0
 lKO/91mshJHf2B4sU8Wf/r8BfC84zhbokpJSSED5KqI/RVHLkuAUxRtammjm2/bE
 oCo/Rocfpm79UMOTtBdOF0nGlvsPqLNjzqlUPFk+R31hximLQ1a2dqCVU6VsyUVe
 r2Pv++65MqFxwdaGh2RtQSu23aAtsiOAzY/RUl8sMpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8w/i1M
 qR1Bsl/ssGQB+EwSMnk15D98vImqt+zns/wB8=; b=rQJD8qvAASsO9zH/8STL45
 GC+Y4g2UdGQ7+n3rq19fd0Lra0iG/ayzzA/WvEmXwOFI3HBH4mh9NyaXxGFUj92y
 YMVQkdMNo7sr4kjXjTutOF5sI6cfu2fYkqqRVH59PceKvlNQSpS7wtSdsemwB4ar
 8Sc4E+VMIAr0+xhHgv0CLbm/qSyPe2vFHI24lsEe0PUPVaLeZqhJW4CIdz23FuC0
 AXZoOUI194t1TlBeAip8JpI9LBK3BiUuFOgTNSQO5xGkgtklJ3z1wJ2KNpVbZ+Dl
 3R/HRlLPp4GO0mvhT70X0w7ZHSwPCqGnIxLalXQKRAfAjgangKLD9NjYMx1P0dHg
 ==
X-ME-Sender: <xms:mvPnYNwZL1AXhZzy4lu6aA-wbHQlDVvpKqmREybhaK2kP57149LYUw>
 <xme:mvPnYNTGD1wIz0Pt9s0bF53mE4dUwuwN_r1Ubxsj0i7T4ZAxCEUXTHfnwRi457H7J
 v1ehaa3zpbY1xRn3xg>
X-ME-Received: <xmr:mvPnYHV4Knr2e4WICFO0uuGdzNB5QxgA3X4HN-OY3gFz6_9yqydGnoVMWGiI3vUs0-0iuGNRu_zq-E9JPDNb_nkjsdCFTrYPRG0PlNGd7-DPJuLr_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghv
 rghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeuleetve
 ejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:mvPnYPjTDfPGIckuP329b_ERwgKPVgwfTPpenV9EeZ-XOWE8fy-s4g>
 <xmx:mvPnYPDUN54js5-ET3fc_nth5tI0u6v62KQLzRzG4Q3CoKkTYp4xwQ>
 <xmx:mvPnYILmO3X2IfKU73iww7I-mGocAoTEvVlfoQqdsDKRLic1mvUFBQ>
 <xmx:mvPnYBCuCAo7GR3O9dAbkgqzGEM9QuAbKQSq5j0kKdqGKZnw7rycAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 02:58:32 -0400 (EDT)
Date: Fri, 9 Jul 2021 08:58:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] tests/qtest/nvme-test: add persistent memory region test
Message-ID: <YOfzlwIELqy0Ovu7@apples.localdomain>
References: <CGME20210618103850epcas5p49b85b7dc6e5f14b03b2bf35c10b3bdda@epcas5p4.samsung.com>
 <20210618103431.9951-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XoHh0cEdvLM0bVaS"
Content-Disposition: inline
In-Reply-To: <20210618103431.9951-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XoHh0cEdvLM0bVaS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 18 16:04, Gollu Appalanaidu wrote:
>This will test the PMR functionality.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> tests/qtest/nvme-test.c | 78 ++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 77 insertions(+), 1 deletion(-)
>
>diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
>index d32c953a38..6d557be6ca 100644
>--- a/tests/qtest/nvme-test.c
>+++ b/tests/qtest/nvme-test.c
>@@ -13,6 +13,7 @@
> #include "libqos/libqtest.h"
> #include "libqos/qgraph.h"
> #include "libqos/pci.h"
>+#include "include/block/nvme.h"
>
> typedef struct QNvme QNvme;
>
>@@ -21,6 +22,9 @@ struct QNvme {
>     QPCIDevice dev;
> };
>
>+static char *t_path;
>+#define TEST_IMAGE_SIZE (2 * 1024 * 1024)
>+
> static void *nvme_get_driver(void *obj, const char *interface)
> {
>     QNvme *nvme =3D obj;
>@@ -66,12 +70,77 @@ static void nvmetest_oob_cmb_test(void *obj, void *dat=
a, QGuestAllocator *alloc)
>     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=3D, 0x4=
4332211);
> }
>
>+static void nvmetest_pmr_reg_test(void *obj, void *data, QGuestAllocator =
*alloc)
>+{
>+    QNvme *nvme =3D obj;
>+    QPCIDevice *pdev =3D &nvme->dev;
>+    QPCIBar pmr_bar, nvme_bar;
>+    uint32_t pmrcap, pmrsts;
>+
>+    qpci_device_enable(pdev);
>+    pmr_bar =3D qpci_iomap(pdev, 4, NULL);
>+
>+    /* Without Enabling PMRCTL check bar enablemet */
>+    qpci_io_writel(pdev, pmr_bar, 0, 0xccbbaa99);
>+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), !=3D, 0x99);
>+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), !=3D, 0xaa99);
>+
>+    /* Map NVMe Bar Register to Enable the Mem Region */
>+    nvme_bar =3D qpci_iomap(pdev, 0, NULL);
>+
>+    pmrcap =3D qpci_io_readl(pdev, nvme_bar, 0xe00);
>+    g_assert_cmpint(NVME_PMRCAP_RDS(pmrcap), =3D=3D, 0x1);
>+    g_assert_cmpint(NVME_PMRCAP_WDS(pmrcap), =3D=3D, 0x1);
>+    g_assert_cmpint(NVME_PMRCAP_BIR(pmrcap), =3D=3D, 0x4);
>+    g_assert_cmpint(NVME_PMRCAP_PMRWBM(pmrcap), =3D=3D, 0x2);
>+    g_assert_cmpint(NVME_PMRCAP_CMSS(pmrcap), =3D=3D, 0x1);
>+
>+    /* Enable PMRCTRL */
>+    qpci_io_writel(pdev, nvme_bar, 0xe04, 0x1);
>+
>+    qpci_io_writel(pdev, pmr_bar, 0, 0x44332211);
>+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), =3D=3D, 0x11);
>+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), =3D=3D, 0x2211);
>+    g_assert_cmpint(qpci_io_readl(pdev, pmr_bar, 0), =3D=3D, 0x44332211);
>+
>+    pmrsts =3D qpci_io_readl(pdev, nvme_bar, 0xe08);
>+    g_assert_cmpint(NVME_PMRSTS_NRDY(pmrsts), =3D=3D, 0x0);
>+
>+    /* Disable PMRCTRL */
>+    qpci_io_writel(pdev, nvme_bar, 0xe04, 0x0);
>+
>+    qpci_io_writel(pdev, pmr_bar, 0, 0x88776655);
>+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), !=3D, 0x55);
>+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), !=3D, 0x6655);
>+    g_assert_cmpint(qpci_io_readl(pdev, pmr_bar, 0), !=3D, 0x88776655);
>+
>+    pmrsts =3D qpci_io_readl(pdev, nvme_bar, 0xe08);
>+    g_assert_cmpint(NVME_PMRSTS_NRDY(pmrsts), =3D=3D, 0x1);
>+
>+    qpci_iounmap(pdev, nvme_bar);
>+    qpci_iounmap(pdev, pmr_bar);
>+}
>+
> static void nvme_register_nodes(void)
> {
>+    int fd, ret;
>+    t_path =3D g_strdup("/tmp/qtest.XXXXXX");
>+
>+    /* Create a temporary raw image*/
>+    fd =3D mkstemp(t_path);
>+    g_assert(fd >=3D 0);
>+    ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>+    g_assert(ret =3D=3D 0);
>+    close(fd);
>+
>+    char *pmr_cmd_line =3D g_strdup_printf("-object memory-backend-file,i=
d=3Dpmr0,"
>+                                         "share=3Don,mem-path=3D%s,size=
=3D8", t_path);
>+
>     QOSGraphEdgeOptions opts =3D {
>         .extra_device_opts =3D "addr=3D04.0,drive=3Ddrv0,serial=3Dfoo",
>         .before_cmd_line =3D "-drive id=3Ddrv0,if=3Dnone,file=3Dnull-co:/=
/,"
>-                           "file.read-zeroes=3Don,format=3Draw",
>+                           "file.read-zeroes=3Don,format=3Draw ",
>+                           pmr_cmd_line,
>     };
>
>     add_qpci_address(&opts, &(QPCIAddress) { .devfn =3D QPCI_DEVFN(4, 0) =
});
>@@ -83,6 +152,13 @@ static void nvme_register_nodes(void)
>     qos_add_test("oob-cmb-access", "nvme", nvmetest_oob_cmb_test, &(QOSGr=
aphTestOptions) {
>         .edge.extra_device_opts =3D "cmb_size_mb=3D2"
>     });
>+
>+    qos_add_test("pmr-test-access", "nvme", nvmetest_pmr_reg_test,
>+                 &(QOSGraphTestOptions) {
>+        .edge.extra_device_opts =3D "pmrdev=3Dpmr0"
>+    });
>+
>+    unlink(t_path);
> }
>
> libqos_init(nvme_register_nodes);
>--=20
>2.17.1
>

Applied to nvme-next. I swapped the memory-backend-file with a=20
memory-backend-ram so we don't need to setup an actual file.

--XoHh0cEdvLM0bVaS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDn85UACgkQTeGvMW1P
DemMgQf/YEyZl/7nuM58oH2vXUeObNtZIWVrpbWbxlrVccpggqpgN0/RYeqgjbS8
Qz4i38pHgt/bdZEmHIPMMjCinxn3spvLRDHpIvQbEiyi2nMAa2+oBx5WSleAi9Ja
DvjD0+U9BTq6/N+us5+jmI3KiJXisY+HsgraSuzks5J1eGuCqGOy6M+9pUW/MreV
dM2dgDxVjW/28CkNVQL5Oi9imErwQEL5+hdhsfahh9Kd0TAwwGmyEaCEHzSyViuk
AFBVrH0sMEtCbodSLxFYvy9tQWxqFWUqCvPoeoCCjpVGPPm+vPdes2y2Ss5nfOKM
NIejoRp7qy8OE1HNdDUYH5JRPt7PxQ==
=5etj
-----END PGP SIGNATURE-----

--XoHh0cEdvLM0bVaS--


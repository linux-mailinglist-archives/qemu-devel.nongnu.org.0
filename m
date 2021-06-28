Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4783B6764
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:13:45 +0200 (CEST)
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxupM-0000TR-NR
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxujm-00065s-BS; Mon, 28 Jun 2021 13:07:58 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:51503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxujk-0005u6-C0; Mon, 28 Jun 2021 13:07:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A89A5C00B8;
 Mon, 28 Jun 2021 13:07:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Jun 2021 13:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=87SYpR2taVqsRxr2ayT30k8oZcO
 LzjvkHdpy9ULfCfs=; b=bzGEA/udxUdaZ6aQP5Vngjl7QF0L5mQ10st7MfCcAZ5
 oBEIw2B6lsOA3IDfezeHIhWNmSe+h2dXFOI33W1XbMyHreAD9UvWwjS9Lj6IvSdJ
 2RQlNPhng//cRHXMcpx4UX6PaD4ES3mBCcapuW1fk3S4uXgEI0tuwGKhDTzfrNzg
 hnH1nKeBoevR7n57FJwZKNXZOvvM8K9BbDWUhyqmCmE3m5yEvcs30o/m+g/UAMyC
 gF/UqZPod8yRKLQ2bNHz84e6YFEThIAmkX5+w7hB6qWbFCIT7qSGK7uAc34y3wRf
 cNi0fWSJ32UG19d/r9Em3Ult7eI5lt/I6W0WeVFjVxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=87SYpR
 2taVqsRxr2ayT30k8oZcOLzjvkHdpy9ULfCfs=; b=LH15MQOUIXtGR5kqFvNf7j
 MU+iH3a3odt2YCxiFwysuxmS34lYQznYw0N+1WoovUbvX78RNAyl/Q5biQgsPid3
 QX2SHRKSoIP4Rt2EB11YTqEztTSSOS871Tj06/fQGNhmhb2cWN+lcrydWVlvBlEX
 50tXwFt5Fzgm+Yz2YXKINH+7JO3SCEP7rImiFZjjU3azBGxRF+7T2zwgEZ9EzdVw
 ZLd1Dw8yf6c2tFlAYTCe8G9p3b/WcwPAqvKpbEOp9hu3wCIP6O0Rn+Og19ldNvUg
 6gSHwTq2ZYmGY/9aEAPvVpaOLOMdHndlC+5EICdSPBUY3x900l3NXE0PqWmcQH0A
 ==
X-ME-Sender: <xms:6gHaYFRncH1-gMja7yCDmJghC2YH6KBwdtX11G-DpoKOanXxovxHTw>
 <xme:6gHaYOySF8dVh196D9ulrGh8mEPmN0Ix3_63LW6nNlNqB-8J5dK7Y6nB2Gd8dxwh2
 5RQFSjMVuN3nv9226Q>
X-ME-Received: <xmr:6gHaYK3u-QMcxSs3zCeX3MlkJq3nAUBUnxMcgVtWjnroTBVXDXp9kKSwj_iZlyylmO_6uypa1hWVplIY8YY9ZTC5-jv80gZbEiX-MkqQfgs4qgBYpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6gHaYNB5OZCgHy2-2v-rXt6Su0VqR1BkORoTqESR9Fy64mKU9dld_w>
 <xmx:6gHaYOiB7fMFZdPsr1qoeWc5pAvBp7f2lrP_fIa6TLxvSMegYNzNDg>
 <xmx:6gHaYBpcnbHgwhiFmACABedRgs9b02E-4QcFend-iSVgY6Nm5SXoAA>
 <xmx:6wHaYCiwe8EBit-N_qLi7ZYNDx5OnnitmLoxl2xHdMlz6ZxFzTTovQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 13:07:52 -0400 (EDT)
Date: Mon, 28 Jun 2021 19:07:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] tests/qtest/nvme-test: add persistent memory region test
Message-ID: <YNoB51AY9aV+w7rz@apples.localdomain>
References: <CGME20210618103850epcas5p49b85b7dc6e5f14b03b2bf35c10b3bdda@epcas5p4.samsung.com>
 <20210618103431.9951-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QZrx6ju7nQYQqY14"
Content-Disposition: inline
In-Reply-To: <20210618103431.9951-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--QZrx6ju7nQYQqY14
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

An extra test is always nice and looks fine,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--QZrx6ju7nQYQqY14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDaAeQACgkQTeGvMW1P
DelXkwf9HqAYRtLSZvUM+PMjjt53XrARFI/DGtdJWMRA3Iu8q6g94q1PUwgvvl0P
UtaOUXtjHYufA+FCcgiqujd5uMX29PQ8GhW46xW6CER7R10p2HtoEHSV+/vfKW18
PldDqNI+UX0G46Nk7Abgy8deV5l9jk+9ixxMSOYtJRwwQnPF3tAqZxpCxCpSUJM1
DjIMeZZXm2pNqhvJ+KIH6QryP3kmLrcGK/1P1EIWM8NWc12wXJwxtlQBnMqKh2rN
PzxXuNTEUMB9ogOzg2iHm4zdm1r9yOrBdtz4y1R7347hHVjQkI903e40UOCij+EA
6obbLU4Hybx8W5Te+9/rGxBFphVzwQ==
=Ib88
-----END PGP SIGNATURE-----

--QZrx6ju7nQYQqY14--


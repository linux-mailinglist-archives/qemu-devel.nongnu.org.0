Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E97397976
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:48:32 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8VC-0006aZ-VI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo8Qk-0004l6-0E; Tue, 01 Jun 2021 13:43:54 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo8Qi-00045j-1e; Tue, 01 Jun 2021 13:43:53 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BC39DF49;
 Tue,  1 Jun 2021 13:43:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 01 Jun 2021 13:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3UCoXJ57Di7dOt0WDb/B7+d8//H
 lLtXLEpEOXr4mxic=; b=FmDtxzpp/tsog71bZAta0tV8/Q/RO3XuaajiF06ZoOw
 VkSFXWcsluBPr8qao9o5+JfzzY/QYphFddy77BvH++oCOK7qK5z7IxUdbQJeopZz
 I/RiV3P6qcsBANb1/bTqkY0I1QTZbkpQ3iWmluaQzx5c+yWOdz1qLGF/hNczFMC9
 WLnhalJj+hXoh6TD3iF2XRN+Sd4uuy2Lt/vKPRUYr/B7vB9v0+5MEP/eHlXknBs2
 dLlHBm1O/w6fpC310DlO4kNsDNVsKOkf3pmeR6zJ29tlDuB1ZEUUNapJZ1nsq/tk
 CIGuQbyOyL63nJLUqXo1ncFL6VgYXjUKR18M0O3fcEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3UCoXJ
 57Di7dOt0WDb/B7+d8//HlLtXLEpEOXr4mxic=; b=LVaYJilgesQ91HyUnAsKze
 0WOYdDH4L7IaeH9OvwFf/rFIX0E1dli4D6MmjUL1kkkhlZVC3Itcxde6Oa9hLM0m
 wXYILORmDAs7i4y4W8laEMpdeLKZXCGV+KvC1pUS+NuK64IepGlePjIwQb6uh6YK
 1gkogrMakROb1Zl8COXO4QECYS1DSk9e5E6sDJaQ8oceIqHmH59Pz6y19r2Ugxv1
 FJjlrwBTpJWn2EfP9MLyKiZNPZdK1RZE+9AC2K9Jv0wEgbEP1boVy40wec/cuL+H
 NOaX40IkehiICNybgZZf7WZgnflMApkxnzCTeLD9BJnF8qLZSaSR41c1pVX+87GQ
 ==
X-ME-Sender: <xms:1HG2YDzmK-7i5A_16RkNurqYqzP3mt3-3XwgPTpeC7qJbmw7w9Epew>
 <xme:1HG2YLQL0WjTQbGQX7Iy1VVv9TiCKrGYUW-ktbisq1CAMEslLGjYCRFqgSZ2_ltF9
 1enIZsJBcD3wqekZPQ>
X-ME-Received: <xmr:1HG2YNUL1kq0fKV5-glY4W6SpQ0M8klnLNDiiF7gRDe43_wogo9gUcK4oQGOW38L3lthJzJ5MD1cCvjoIEQDfxBoalU4waNUALSK1umTrbPvpZY8ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1HG2YNjTAw_tpz0K-Y3aQI0FWztV7JSlPd7rZldLuflGUCKWg05yYg>
 <xmx:1HG2YFAHWay-TdjzduJDCKrYnT4bw-13Wup82Dx7hZx5m5ttGRqrbA>
 <xmx:1HG2YGKZIP25lAnksKz4GGeMzPMd5CvofzdvVzIJonXgjcUcw8gK4A>
 <xmx:1XG2YPDqJP-px1oHVK7XD07pFaX70Zh4NTQoWod1p1ml8X-JBTiu5w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 13:43:46 -0400 (EDT)
Date: Tue, 1 Jun 2021 19:43:45 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2 2/2] tests/qtest/nvme-test: add boot partition read test
Message-ID: <YLZx0W8qPtj87Ubz@apples.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144242epcas5p1292f656f45aebd1b9c75fe54797d6b46@epcas5p1.samsung.com>
 <20210601143749.1669-3-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j8Du62J4mzMfZvkw"
Content-Disposition: inline
In-Reply-To: <20210601143749.1669-3-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--j8Du62J4mzMfZvkw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  1 20:07, Gollu Appalanaidu wrote:
>Add a test case for reading an NVMe Boot Partition without
>enabling the controller.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> tests/qtest/nvme-test.c | 118 +++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 117 insertions(+), 1 deletion(-)
>
>diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
>index d32c953a38..39d2e26f76 100644
>--- a/tests/qtest/nvme-test.c
>+++ b/tests/qtest/nvme-test.c
>@@ -13,6 +13,19 @@
> #include "libqos/libqtest.h"
> #include "libqos/qgraph.h"
> #include "libqos/pci.h"
>+#include "libqos/pci-pc.h"
>+#include "libqos/malloc-pc.h"
>+#include "libqos/malloc.h"
>+#include "libqos/libqos.h"
>+#include "include/block/nvme.h"
>+#include "include/hw/pci/pci.h"
>+
>+#define NVME_BPINFO_BPSZ_UNITS  (128 * KiB)
>+#define NVME_BRS_BPSZ_UNITS     (4 * KiB)
>+#define NVME_BRS_READ_MAX_TIME  1000000
>+#define TEST_IMAGE_SIZE         (2 * 128 * KiB)
>+
>+static char *t_path;
>
> typedef struct QNvme QNvme;
>
>@@ -44,6 +57,13 @@ static void *nvme_create(void *pci_bus, QGuestAllocator=
 *alloc, void *addr)
>     return &nvme->obj;
> }
>
>+static void drive_destroy(void *path)
>+{
>+    unlink(path);
>+    g_free(path);
>+    qos_invalidate_command_line();
>+}
>+
> /* This used to cause a NULL pointer dereference.  */
> static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator =
*alloc)
> {
>@@ -66,12 +86,100 @@ static void nvmetest_oob_cmb_test(void *obj, void *da=
ta, QGuestAllocator *alloc)
>     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=3D, 0x4=
4332211);
> }
>
>+static void nvmetest_bp_read_test(void *obj, void *data, QGuestAllocator =
*alloc)
>+{
>+    uint16_t test_size =3D 32;
>+    size_t bp_test_len =3D test_size * NVME_BRS_BPSZ_UNITS;
>+    uint8_t *read_buf =3D g_malloc(bp_test_len);
>+    uint8_t *cmp_buf =3D g_malloc(bp_test_len);
>+    QNvme *nvme =3D obj;
>+    QPCIDevice *pdev =3D &nvme->dev;
>+    QPCIBar nvme_bar;
>+    uint8_t brs =3D 0;
>+    uint64_t sleep_time =3D 0;
>+    uintptr_t guest_buf;
>+    uint64_t buf_addr;
>+
>+    memset(cmp_buf, 0x42, bp_test_len);

This one byte pattern is too simple and won't catch a lot of possible=20
bugs.

The test case should use generate_pattern() (see=20
tests/qtest/libqos/libqos.h).

>+
>+    guest_buf =3D guest_alloc(alloc, bp_test_len);
>+    buf_addr =3D cpu_to_le64(guest_buf);
>+
>+    qpci_device_enable(pdev);
>+    nvme_bar =3D qpci_iomap(pdev, 0, NULL);
>+
>+    /* BPINFO */
>+    uint32_t bpinfo =3D qpci_io_readl(pdev, nvme_bar, 0x40);
>+    uint16_t single_bp_size =3D bpinfo & BPINFO_BPSZ_MASK;
>+    uint8_t active_bpid =3D bpinfo >> BPINFO_ABPID_SHIFT;
>+    uint8_t read_select =3D (bpinfo >> BPINFO_BRS_SHIFT) & BPINFO_BRS_MAS=
K;
>+
>+    g_assert_cmpint(single_bp_size, =3D=3D, 0x1);
>+    g_assert_cmpint(active_bpid, =3D=3D, 0);
>+    g_assert_cmpint(read_select, =3D=3D, NVME_BPINFO_BRS_NOREAD);
>+
>+    /* BPMBL */
>+    uint64_t bpmbl =3D buf_addr;
>+    uint32_t bpmbl_low =3D bpmbl & 0xffffffff;
>+    uint32_t bpmbl_hi =3D (bpmbl >> 32) & 0xffffffff;
>+    qpci_io_writel(pdev, nvme_bar, 0x48, bpmbl_low);
>+    qpci_io_writel(pdev, nvme_bar, 0x4c, bpmbl_hi);
>+
>+    /* BPRSEL */
>+    qpci_io_writel(pdev, nvme_bar, 0x44, 32);
>+
>+    while (true) {
>+        usleep(1000);
>+        sleep_time +=3D 1000;
>+        brs =3D qpci_io_readb(pdev, nvme_bar, 0x43) & BPINFO_BRS_MASK;
>+        if (brs =3D=3D NVME_BPINFO_BRS_SUCCESS || brs =3D=3D NVME_BPINFO_=
BRS_ERROR ||
>+            sleep_time =3D=3D NVME_BRS_READ_MAX_TIME) {
>+            break;
>+        }
>+    }
>+    g_assert_cmpint(brs, =3D=3D, NVME_BPINFO_BRS_SUCCESS);
>+
>+    qtest_memread(pdev->bus->qts, guest_buf, read_buf, bp_test_len);
>+    g_assert_cmpint(memcmp(cmp_buf, read_buf, bp_test_len), =3D=3D, 0);
>+
>+    g_free(cmp_buf);
>+    g_free(read_buf);
>+    g_test_queue_destroy(drive_destroy, t_path);
>+}
>+
> static void nvme_register_nodes(void)
> {
>+    int fd;
>+    FILE *fh;
>+    uint16_t bpsz =3D 2;
>+    size_t bp_len =3D NVME_BPINFO_BPSZ_UNITS * bpsz;
>+    size_t ret;
>+    uint8_t *pattern =3D g_malloc(bp_len);
>+
>+    t_path =3D g_strdup("/tmp/qtest.XXXXXX");
>+
>+    /* Create a temporary raw image */
>+    fd =3D mkstemp(t_path);
>+    g_assert_cmpint(fd, >=3D, 0);
>+    ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>+    g_assert_cmpint(ret, =3D=3D, 0);
>+    close(fd);
>+
>+    memset(pattern, 0x42, bp_len);
>+
>+    fh =3D fopen(t_path, "w+");
>+    ret =3D fwrite(pattern, NVME_BPINFO_BPSZ_UNITS, bpsz, fh);
>+    g_assert_cmpint(ret, =3D=3D, bpsz);
>+    fclose(fh);
>+
>+    char *bp_cmd_line =3D g_strdup_printf("-drive id=3Dbp0,file=3D%s,if=
=3Dnone,"
>+                                        "format=3Draw", t_path);
>+
>     QOSGraphEdgeOptions opts =3D {
>         .extra_device_opts =3D "addr=3D04.0,drive=3Ddrv0,serial=3Dfoo",
>         .before_cmd_line =3D "-drive id=3Ddrv0,if=3Dnone,file=3Dnull-co:/=
/,"
>-                           "file.read-zeroes=3Don,format=3Draw",
>+                           "file.read-zeroes=3Don,format=3Draw ",
>+                           bp_cmd_line,
>     };
>
>     add_qpci_address(&opts, &(QPCIAddress) { .devfn =3D QPCI_DEVFN(4, 0) =
});
>@@ -83,6 +191,14 @@ static void nvme_register_nodes(void)
>     qos_add_test("oob-cmb-access", "nvme", nvmetest_oob_cmb_test, &(QOSGr=
aphTestOptions) {
>         .edge.extra_device_opts =3D "cmb_size_mb=3D2"
>     });
>+
>+    qos_add_test("bp-read-access", "nvme", nvmetest_bp_read_test,
>+                 &(QOSGraphTestOptions) {
>+        .edge.extra_device_opts =3D "bootpart=3Dbp0"
>+    });
>+
>+    /* Clean Up */
>+    g_free(pattern);
> }
>
> libqos_init(nvme_register_nodes);
>--=20
>2.17.1
>
>

--j8Du62J4mzMfZvkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC2cc8ACgkQTeGvMW1P
DekiTAgAkZWhzE5lxK2/jRg76hrO4soVOyc5zpwkowcCyuwqjLKfpNK0nYxBqXBk
gaqe7FNPBTq+OOiSlLaCtPY8mrpnX+qmoZo0CPhboKwYEtMquk4ZfAeb9PJ1z68C
FC9C5Y7x/fyBW62KcTmtrl7nHO0i4v0SXyXtpewJffi2dP8ln272Ounr9Px5PmoJ
S/6+2FzTS0aXGI/KUEbJDRPE+UureHLOx+w2/CNodO+l/9tZ7CDIjzxLs7djTpQU
p2/Ftooif8C6B2Cfh3YmSByYgNQfZOMj4A7SZbVgNzvczmY+wkfJYjdfZyEJhjZS
jg+M+1ki2MoQLhrGmDDtCWtVh7TyWA==
=rPwL
-----END PGP SIGNATURE-----

--j8Du62J4mzMfZvkw--


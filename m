Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C63ACAAF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 14:17:05 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luDQm-0004VC-A1
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 08:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1luDOj-0002x1-OO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:14:57 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:32916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1luDOg-0007XJ-Mp
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:14:57 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210618121444epoutp04c207a46a027a4b4be85bc45c5d767555~JrDUQvsJ11248412484epoutp04W
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:14:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210618121444epoutp04c207a46a027a4b4be85bc45c5d767555~JrDUQvsJ11248412484epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1624018484;
 bh=8mNqHQHIT99TpveTKxVYSCp5KeX+SQCURQCctUNlgdU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=T2lL2X3tIkAR1lAI38HW5Da1YuZh2ktYSzpxDt8fhSiBC9VzyJ5WSto4HPzwPaM1w
 fEluYsp0EW8ZZhBZUJjd/SwGeWY6aCTYhsLdQw56Tcm2nOm+C8EuPeDjrKmGZuu2t6
 KM5msUXmKUSr1a0Ht3RZjyAfegbBOn+PU+EfZFKM=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210618121444epcas5p4d55a5a490dba2f1c6b9e81ce753de42a~JrDUBmi1-2463324633epcas5p41;
 Fri, 18 Jun 2021 12:14:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 57.FF.09606.43E8CC06; Fri, 18 Jun 2021 21:14:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210618103850epcas5p49b85b7dc6e5f14b03b2bf35c10b3bdda~Jpvk_r_lI1058910589epcas5p4I;
 Fri, 18 Jun 2021 10:38:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210618103850epsmtrp16a200f96e66ec555d160ea4d9c648535~Jpvk96vvj2049520495epsmtrp1O;
 Fri, 18 Jun 2021 10:38:50 +0000 (GMT)
X-AuditID: b6c32a49-bf1ff70000002586-a6-60cc8e3419ef
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 12.FE.08163.9B77CC06; Fri, 18 Jun 2021 19:38:49 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210618103848epsmtip1bb85cb8f95f9b76b922db3df91763a9f~Jpvjok3N62217322173epsmtip19;
 Fri, 18 Jun 2021 10:38:48 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/nvme-test: add persistent memory region test
Date: Fri, 18 Jun 2021 16:04:31 +0530
Message-Id: <20210618103431.9951-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7bCmhq5J35kEgz0veSxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErow5kz4zFnxQrOj4eJq5gfG0VBcjJ4eE
 gInEgRML2LoYuTiEBHYzSrzf188C4XxilPjw5A0zSJWQwGdGieanXjAdE05dZIUo2sUosXHH
 YWYIp5NJ4tqPCSwgVWwCRhKz375hBLFFBCQlfnedBpvEDLLj21ydLkYODmEBT4nO6SEgJouA
 qsSjXwogFbwCNhJbv/9mgdglL7F6wwFmCPsYu8SeH1kQtovE1s3NrBC2sMSr41vYIWwpiZf9
 bUA2O5BdLXG4COQwCYEORoljlzewQZTYS/x7No0RZCuzgKbE+l36EGFZiamn1jFB3Mgn0fv7
 CRNEnFdixzwYW01iwa3vUJtkJGb+uQ11gYdE36dzrJCQipV4vPAU+wRG2VkIGxYwMq5ilEwt
 KM5NTy02LTDMSy3XK07MLS7NS9dLzs/dxAhOBlqeOxjvPvigd4iRiYPxEKMEB7OSCC9n5pkE
 Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxL2Q8lCAmkJ5akZqemFqQWwWSZODilGpiUpy0rO1IT
 EhWRNdVTWvHfjsXxFREfc1kC38wImGqjozzh58+SIjePyokd2uKcelf+2LU5OVfI6n8tyf1v
 8EliRWfIhaTNO5/4Xkjv7LSWNkjMFtiVlrTg0Y/N/xYwpHRlF0W7pM10TyiZ6Ly4/t3xl78m
 L/514o2k3SJZZc/5szedPmaWVumSWngrmUn24r+e07E1U2W8vn9cOylDwb1pb9Ex00diC27F
 9+1rczi4xN3EuX22TeK0AO7DByV+3Kjc13H4ZlfMfaG2rNMJC1jitDMtSovlHjg8ERZ/Vb5F
 fOVyrQnR83yyndjrz/5sTH95u0ojfGvZjLM6kSrCRZU8c687zVBwbK9iXrI+XImlOCPRUIu5
 qDgRAGEg7yV1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJTndn+ZkEg1ut1havdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8acSZ8ZCz4oVnR8PM3cwHhaqouRk0NC
 wERiwqmLrF2MXBxCAjsYJaZ8vsIOkZCR+HVqKjOELSyx8t9zdoiidiaJfdc6WEESbAJGErPf
 vmEEsUUEJCV+d51mBiliFjjKKHG5fTJLFyMHh7CAp0Tn9BAQk0VAVeLRLwWQcl4BG4mt33+z
 QMyXl1i94QDzBEaeBYwMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxggNMS2sH455V
 H/QOMTJxMB5ilOBgVhLh5cw8kyDEm5JYWZValB9fVJqTWnyIUZqDRUmc90LXyXghgfTEktTs
 1NSC1CKYLBMHp1QDk+yOlBUGfXvdVhf3ey6uamrq5J+pvLg70ejTtnPV0g13W31rN+uxGt1s
 z+ipPGckMUF+kZn78vbHZ//3PN3651Hq+x83808UxX6OY1TZWn/khuT9w2mrr4t72+6P+LRR
 0ntVecpbDWZOU98jEz/xnda8XWbYuyX5Z2bRPXFhxeNGCVt7e4Mmz/JILgru1/+eP8fu/6e1
 N/T25E/b8H9F+OSr32z2SCx7YB52qjNCaYXdhMtxcntnvdL0+Bh+r/VCrOJToc4daxValNia
 akOeNE9775luc6VP1dpb8vWGOFHdyScvlZzVEzDOecy+5K1NT47CpTzJ/v9zzlxVmvPLjPe/
 bsPN9D+HrRwYxdh/K7EUZyQaajEXFScCAG/i/i6fAgAA
X-CMS-MailID: 20210618103850epcas5p49b85b7dc6e5f14b03b2bf35c10b3bdda
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210618103850epcas5p49b85b7dc6e5f14b03b2bf35c10b3bdda
References: <CGME20210618103850epcas5p49b85b7dc6e5f14b03b2bf35c10b3bdda@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will test the PMR functionality.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 tests/qtest/nvme-test.c | 78 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
index d32c953a38..6d557be6ca 100644
--- a/tests/qtest/nvme-test.c
+++ b/tests/qtest/nvme-test.c
@@ -13,6 +13,7 @@
 #include "libqos/libqtest.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
+#include "include/block/nvme.h"
 
 typedef struct QNvme QNvme;
 
@@ -21,6 +22,9 @@ struct QNvme {
     QPCIDevice dev;
 };
 
+static char *t_path;
+#define TEST_IMAGE_SIZE (2 * 1024 * 1024)
+
 static void *nvme_get_driver(void *obj, const char *interface)
 {
     QNvme *nvme = obj;
@@ -66,12 +70,77 @@ static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=, 0x44332211);
 }
 
+static void nvmetest_pmr_reg_test(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QNvme *nvme = obj;
+    QPCIDevice *pdev = &nvme->dev;
+    QPCIBar pmr_bar, nvme_bar;
+    uint32_t pmrcap, pmrsts;
+
+    qpci_device_enable(pdev);
+    pmr_bar = qpci_iomap(pdev, 4, NULL);
+
+    /* Without Enabling PMRCTL check bar enablemet */
+    qpci_io_writel(pdev, pmr_bar, 0, 0xccbbaa99);
+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), !=, 0x99);
+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), !=, 0xaa99);
+
+    /* Map NVMe Bar Register to Enable the Mem Region */
+    nvme_bar = qpci_iomap(pdev, 0, NULL);
+
+    pmrcap = qpci_io_readl(pdev, nvme_bar, 0xe00);
+    g_assert_cmpint(NVME_PMRCAP_RDS(pmrcap), ==, 0x1);
+    g_assert_cmpint(NVME_PMRCAP_WDS(pmrcap), ==, 0x1);
+    g_assert_cmpint(NVME_PMRCAP_BIR(pmrcap), ==, 0x4);
+    g_assert_cmpint(NVME_PMRCAP_PMRWBM(pmrcap), ==, 0x2);
+    g_assert_cmpint(NVME_PMRCAP_CMSS(pmrcap), ==, 0x1);
+
+    /* Enable PMRCTRL */
+    qpci_io_writel(pdev, nvme_bar, 0xe04, 0x1);
+
+    qpci_io_writel(pdev, pmr_bar, 0, 0x44332211);
+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), ==, 0x11);
+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), ==, 0x2211);
+    g_assert_cmpint(qpci_io_readl(pdev, pmr_bar, 0), ==, 0x44332211);
+
+    pmrsts = qpci_io_readl(pdev, nvme_bar, 0xe08);
+    g_assert_cmpint(NVME_PMRSTS_NRDY(pmrsts), ==, 0x0);
+
+    /* Disable PMRCTRL */
+    qpci_io_writel(pdev, nvme_bar, 0xe04, 0x0);
+
+    qpci_io_writel(pdev, pmr_bar, 0, 0x88776655);
+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), !=, 0x55);
+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), !=, 0x6655);
+    g_assert_cmpint(qpci_io_readl(pdev, pmr_bar, 0), !=, 0x88776655);
+
+    pmrsts = qpci_io_readl(pdev, nvme_bar, 0xe08);
+    g_assert_cmpint(NVME_PMRSTS_NRDY(pmrsts), ==, 0x1);
+
+    qpci_iounmap(pdev, nvme_bar);
+    qpci_iounmap(pdev, pmr_bar);
+}
+
 static void nvme_register_nodes(void)
 {
+    int fd, ret;
+    t_path = g_strdup("/tmp/qtest.XXXXXX");
+
+    /* Create a temporary raw image*/
+    fd = mkstemp(t_path);
+    g_assert(fd >= 0);
+    ret = ftruncate(fd, TEST_IMAGE_SIZE);
+    g_assert(ret == 0);
+    close(fd);
+
+    char *pmr_cmd_line = g_strdup_printf("-object memory-backend-file,id=pmr0,"
+                                         "share=on,mem-path=%s,size=8", t_path);
+
     QOSGraphEdgeOptions opts = {
         .extra_device_opts = "addr=04.0,drive=drv0,serial=foo",
         .before_cmd_line = "-drive id=drv0,if=none,file=null-co://,"
-                           "file.read-zeroes=on,format=raw",
+                           "file.read-zeroes=on,format=raw ",
+                           pmr_cmd_line,
     };
 
     add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
@@ -83,6 +152,13 @@ static void nvme_register_nodes(void)
     qos_add_test("oob-cmb-access", "nvme", nvmetest_oob_cmb_test, &(QOSGraphTestOptions) {
         .edge.extra_device_opts = "cmb_size_mb=2"
     });
+
+    qos_add_test("pmr-test-access", "nvme", nvmetest_pmr_reg_test,
+                 &(QOSGraphTestOptions) {
+        .edge.extra_device_opts = "pmrdev=pmr0"
+    });
+
+    unlink(t_path);
 }
 
 libqos_init(nvme_register_nodes);
-- 
2.17.1



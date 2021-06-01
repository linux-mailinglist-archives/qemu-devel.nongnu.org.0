Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1239769E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:27:13 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6IS-0008A2-E8
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo60z-0000NT-7G
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:09 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:62153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo60w-0007vR-O7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:08 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210601150904epoutp035753b0f4069b21d5dda4ff532a9330d3~EfdrJLSTV2577025770epoutp03C
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 15:09:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210601150904epoutp035753b0f4069b21d5dda4ff532a9330d3~EfdrJLSTV2577025770epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622560144;
 bh=Ncto7ClWAglzPp4Om2esFHybaji7Bzo5kRJQOkI7GKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lb6eauGhs4iVCiByN7oc9eK2cWSr5yo1oZI2daOEKPq4TP3DaeFB2TyLHquG8gmYL
 30SEpPCWs5uNyIGxJBzGujP9KK5Uci3E4fAPHNMJJh2j8I08FZYqBArzktuQmK5skn
 Nkmeu1k6qWWBGBeCYmvrHmCq+wvNJj6B1DsiW4q8=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210601150903epcas5p33a5d5c12408f8389a94b72b0a04665f1~EfdqoqPfa1234012340epcas5p3A;
 Tue,  1 Jun 2021 15:09:03 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4E.9C.09835.F8D46B06; Wed,  2 Jun 2021 00:09:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210601144242epcas5p1292f656f45aebd1b9c75fe54797d6b46~EfGp5XRQy1311913119epcas5p1a;
 Tue,  1 Jun 2021 14:42:42 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210601144242epsmtrp1fa1e040bd0c8d1bfadebca57d0be2c14~EfGp4bC1X0060600606epsmtrp1g;
 Tue,  1 Jun 2021 14:42:42 +0000 (GMT)
X-AuditID: b6c32a4b-7dfff7000000266b-25-60b64d8f43ad
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 25.B5.08163.26746B06; Tue,  1 Jun 2021 23:42:42 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210601144241epsmtip1ea6bd92e4957a28d5ccb5d1fdc221124~EfGoiod4A3260032600epsmtip1d;
 Tue,  1 Jun 2021 14:42:40 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests/qtest/nvme-test: add boot partition read test
Date: Tue,  1 Jun 2021 20:07:49 +0530
Message-Id: <20210601143749.1669-3-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601143749.1669-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7bCmlm6/77YEg/kH9C1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowFDStZCvq1Ko5c/sTYwLhDoYuRk0NC
 wETiY9sMli5GLg4hgd2MEs2bpjJDOJ8YJXqurWUDqRIS+MwocX9PDkzH/wknoIp2MUrMXfmf
 FcLpZJJ49a+LCaSKTcBIYvbbN4wgtoiApMTvrtPMIDYzyI5vc3W6GDk4hAW8JZ41JoOEWQRU
 JU5N/84KYvMK2EhsnrWSFWKZvMTqDQfAWjkFbCWe/NvLCLJLQuARu8SRnslMEEUuEtt3LWWD
 sIUlXh3fwg5hS0m87G8DstmB7GqJw0UQrR2MEscub4Aqt5f492waI8g5zAKaEut36UOEZSWm
 nlrHBHExn0Tv7ydQm3gldsyDsdUkFtz6DrVJRmLmn9tQJ3tIzJr6AhpuExglZs+0ncAoNwth
 wwJGxlWMkqkFxbnpqcWmBcZ5qeV6xYm5xaV56XrJ+bmbGMGJQst7B+OjBx/0DjEycTAeYpTg
 YFYS4XXP25ogxJuSWFmVWpQfX1Sak1p8iFGag0VJnHfFw8kJQgLpiSWp2ampBalFMFkmDk6p
 BqaGTTfunezP1ldYzn3j3i83x8apb3fWKnaovRKs7tWP+74m+ONbs/7G5kOvs98aJumt6mZX
 FZb/OEcqNnnmHZVN8zY3WdXvm6m/6F5HY6YcxxGGm5xWvOWz+vad65tn7TIrZULtvIMX/2a/
 XGRREBP9nulgh+z60kO/KsX1j7Q+46sxavjCpbNrh+iCSabqMWurivoC4i/NVO/5GmEuZ2oh
 0qGYs9zgZKrhLvlDlk82JmpmbbKefOp6/+0j80/t/5H+5bHuJF8n/hWCL2Y11j3kdz0//RWH
 4koFHQbemItPdu3pUjnptzGi34Q3bnX1jbu3vhm9XR318d4JlS1hX1d/2ibev6/A++W3TQxy
 OTFKLMUZiYZazEXFiQAV3C2IgwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSnG6S+7YEg6sXJSxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowFDStZCvq1Ko5c/sTYwLhDoYuRk0NC
 wETi/4QTzF2MXBxCAjsYJTY+n84EkZCR+HVqKjOELSyx8t9zdoiidiaJGzsngBWxCRhJzH77
 hhHEFhGQlPjddRpsErPAUUaJy+2TWboYOTiEBbwlnjUmg9SwCKhKnJr+nRXE5hWwkdg8ayUr
 xAJ5idUbDoAt4xSwlXjyby/YTCGgmrajkxknMPItYGRYxSiZWlCcm55bbFhglJdarlecmFtc
 mpeul5yfu4kRHJJaWjsY96z6oHeIkYmD8RCjBAezkgive97WBCHelMTKqtSi/Pii0pzU4kOM
 0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqY4v79v7PwUuPphWXWF6b+ZFt8d+pBz4Um
 T7/smLM1hlVafKWNj1BuzUH7rIXJtb8Pxbkd3nXltN+akzsXWJf08ApYc86MFZol+KrC8U/E
 dd25WpVvrkzXiTxkEZ4Yd+H1LeFHmW/ehX/b2c/F/Xjqvacpi5+s4TX/aXJRbdX/0msfxDw7
 8rVDUoVyireofV+4OVSZcdVMxdWqrn+aQ7W2GG/O68u+8i/i5ZVJztXn183rt32Ze7Tg9bM2
 s/PmnqeKefquKlptbLrx+2aHq8/nvV4brB6++6mc5/ua456Ke2X/V+E1189dONVq57+O72y9
 Z3d6x0udl9m5ch/2rb2+QVTwMvchb8FGtlWS4lXLriixFGckGmoxFxUnAgBdKTbNuAIAAA==
X-CMS-MailID: 20210601144242epcas5p1292f656f45aebd1b9c75fe54797d6b46
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210601144242epcas5p1292f656f45aebd1b9c75fe54797d6b46
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144242epcas5p1292f656f45aebd1b9c75fe54797d6b46@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test case for reading an NVMe Boot Partition without
enabling the controller.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 tests/qtest/nvme-test.c | 118 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
index d32c953a38..39d2e26f76 100644
--- a/tests/qtest/nvme-test.c
+++ b/tests/qtest/nvme-test.c
@@ -13,6 +13,19 @@
 #include "libqos/libqtest.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
+#include "libqos/pci-pc.h"
+#include "libqos/malloc-pc.h"
+#include "libqos/malloc.h"
+#include "libqos/libqos.h"
+#include "include/block/nvme.h"
+#include "include/hw/pci/pci.h"
+
+#define NVME_BPINFO_BPSZ_UNITS  (128 * KiB)
+#define NVME_BRS_BPSZ_UNITS     (4 * KiB)
+#define NVME_BRS_READ_MAX_TIME  1000000
+#define TEST_IMAGE_SIZE         (2 * 128 * KiB)
+
+static char *t_path;
 
 typedef struct QNvme QNvme;
 
@@ -44,6 +57,13 @@ static void *nvme_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
     return &nvme->obj;
 }
 
+static void drive_destroy(void *path)
+{
+    unlink(path);
+    g_free(path);
+    qos_invalidate_command_line();
+}
+
 /* This used to cause a NULL pointer dereference.  */
 static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -66,12 +86,100 @@ static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=, 0x44332211);
 }
 
+static void nvmetest_bp_read_test(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t test_size = 32;
+    size_t bp_test_len = test_size * NVME_BRS_BPSZ_UNITS;
+    uint8_t *read_buf = g_malloc(bp_test_len);
+    uint8_t *cmp_buf = g_malloc(bp_test_len);
+    QNvme *nvme = obj;
+    QPCIDevice *pdev = &nvme->dev;
+    QPCIBar nvme_bar;
+    uint8_t brs = 0;
+    uint64_t sleep_time = 0;
+    uintptr_t guest_buf;
+    uint64_t buf_addr;
+
+    memset(cmp_buf, 0x42, bp_test_len);
+
+    guest_buf = guest_alloc(alloc, bp_test_len);
+    buf_addr = cpu_to_le64(guest_buf);
+
+    qpci_device_enable(pdev);
+    nvme_bar = qpci_iomap(pdev, 0, NULL);
+
+    /* BPINFO */
+    uint32_t bpinfo = qpci_io_readl(pdev, nvme_bar, 0x40);
+    uint16_t single_bp_size = bpinfo & BPINFO_BPSZ_MASK;
+    uint8_t active_bpid = bpinfo >> BPINFO_ABPID_SHIFT;
+    uint8_t read_select = (bpinfo >> BPINFO_BRS_SHIFT) & BPINFO_BRS_MASK;
+
+    g_assert_cmpint(single_bp_size, ==, 0x1);
+    g_assert_cmpint(active_bpid, ==, 0);
+    g_assert_cmpint(read_select, ==, NVME_BPINFO_BRS_NOREAD);
+
+    /* BPMBL */
+    uint64_t bpmbl = buf_addr;
+    uint32_t bpmbl_low = bpmbl & 0xffffffff;
+    uint32_t bpmbl_hi = (bpmbl >> 32) & 0xffffffff;
+    qpci_io_writel(pdev, nvme_bar, 0x48, bpmbl_low);
+    qpci_io_writel(pdev, nvme_bar, 0x4c, bpmbl_hi);
+
+    /* BPRSEL */
+    qpci_io_writel(pdev, nvme_bar, 0x44, 32);
+
+    while (true) {
+        usleep(1000);
+        sleep_time += 1000;
+        brs = qpci_io_readb(pdev, nvme_bar, 0x43) & BPINFO_BRS_MASK;
+        if (brs == NVME_BPINFO_BRS_SUCCESS || brs == NVME_BPINFO_BRS_ERROR ||
+            sleep_time == NVME_BRS_READ_MAX_TIME) {
+            break;
+        }
+    }
+    g_assert_cmpint(brs, ==, NVME_BPINFO_BRS_SUCCESS);
+
+    qtest_memread(pdev->bus->qts, guest_buf, read_buf, bp_test_len);
+    g_assert_cmpint(memcmp(cmp_buf, read_buf, bp_test_len), ==, 0);
+
+    g_free(cmp_buf);
+    g_free(read_buf);
+    g_test_queue_destroy(drive_destroy, t_path);
+}
+
 static void nvme_register_nodes(void)
 {
+    int fd;
+    FILE *fh;
+    uint16_t bpsz = 2;
+    size_t bp_len = NVME_BPINFO_BPSZ_UNITS * bpsz;
+    size_t ret;
+    uint8_t *pattern = g_malloc(bp_len);
+
+    t_path = g_strdup("/tmp/qtest.XXXXXX");
+
+    /* Create a temporary raw image */
+    fd = mkstemp(t_path);
+    g_assert_cmpint(fd, >=, 0);
+    ret = ftruncate(fd, TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    close(fd);
+
+    memset(pattern, 0x42, bp_len);
+
+    fh = fopen(t_path, "w+");
+    ret = fwrite(pattern, NVME_BPINFO_BPSZ_UNITS, bpsz, fh);
+    g_assert_cmpint(ret, ==, bpsz);
+    fclose(fh);
+
+    char *bp_cmd_line = g_strdup_printf("-drive id=bp0,file=%s,if=none,"
+                                        "format=raw", t_path);
+
     QOSGraphEdgeOptions opts = {
         .extra_device_opts = "addr=04.0,drive=drv0,serial=foo",
         .before_cmd_line = "-drive id=drv0,if=none,file=null-co://,"
-                           "file.read-zeroes=on,format=raw",
+                           "file.read-zeroes=on,format=raw ",
+                           bp_cmd_line,
     };
 
     add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
@@ -83,6 +191,14 @@ static void nvme_register_nodes(void)
     qos_add_test("oob-cmb-access", "nvme", nvmetest_oob_cmb_test, &(QOSGraphTestOptions) {
         .edge.extra_device_opts = "cmb_size_mb=2"
     });
+
+    qos_add_test("bp-read-access", "nvme", nvmetest_bp_read_test,
+                 &(QOSGraphTestOptions) {
+        .edge.extra_device_opts = "bootpart=bp0"
+    });
+
+    /* Clean Up */
+    g_free(pattern);
 }
 
 libqos_init(nvme_register_nodes);
-- 
2.17.1



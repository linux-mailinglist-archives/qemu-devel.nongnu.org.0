Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A64C38F87E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:08:50 +0200 (CEST)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llNR3-0001bK-AW
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNOh-0007FJ-Qu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:23 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:31474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNOf-0001ru-18
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:23 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210525030617epoutp03871a7627442554ef5e906080d2655bd3~CMFmkETsT1831618316epoutp03o
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:06:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210525030617epoutp03871a7627442554ef5e906080d2655bd3~CMFmkETsT1831618316epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621911977;
 bh=aUuX7RWDWcOU7t85eMlP/aQ7+cbnNpTbI7wdp2DZtxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kpouVvcRc3xezBCuwlw0LfzxHOSUUktPHl45TwnJAhNUVwwggbvKgpbMamdI4du2B
 7c0zECtId507q39mBbghstiktMxF0lMBJGSLsFBPL2gEU8fH1e/WcvDVat36TM5WyO
 WZ1YawlK38DGhEAEbcxzbHFwj3TfkK3P5ZAvEGqs=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210525030616epcas5p2ab10f5c9b07b455cd4b0827540acc706~CMFmHsgw90270602706epcas5p2C;
 Tue, 25 May 2021 03:06:16 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.63.09697.8A96CA06; Tue, 25 May 2021 12:06:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210524212845epcas5p18d606ec98a28aaf6086b84d19b3dc47f~CHe5TQ8Qd1906619066epcas5p17;
 Mon, 24 May 2021 21:28:45 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210524212845epsmtrp2bbaf27ecc4157a78fc6a946f9f106479~CHe5SfzSv2698226982epsmtrp2E;
 Mon, 24 May 2021 21:28:45 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-7d-60ac69a8aeba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.CE.08163.D8A1CA06; Tue, 25 May 2021 06:28:45 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210524212843epsmtip1fe47481ea59542b30fa681aa64382b6d~CHe36_4wr0279302793epsmtip1p;
 Mon, 24 May 2021 21:28:43 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/qtest/nvme-test: add boot partition read test
Date: Tue, 25 May 2021 02:54:16 +0530
Message-Id: <20210524212416.26652-3-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524212416.26652-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7bCmuu6KzDUJBpduGVi83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBn7ji5mKZioVdF55QxrA+MuhS5GDg4J
 AROJL+8Nuhi5OIQEdjNKTDy1jA3C+cQosf7iddYuRk4g5zOjxOEnASA2SMO2f09ZIIp2MUrc
 +P+JHcLpZJJ439XLBlLFJmAkMfvtG0YQW0RAUuJ312lmEJsZZMe3uTogtrCAh8T3J3OZQGwW
 AVWJlo5rLCA2r4CtxJTrLUwQ2+QlVm84ANbLKWAnsa1rAtgyCYFb7BLb1r5nhvjBRWLTFE2I
 emGJV8e3sEPYUhKf3+0FuocdyK6WOFwE0dnBKHHs8gY2iBJ7iX/PpjGCTGEW0JRYv0sfIiwr
 MfXUOiaIi/kken8/gbqGV2LHPBhbTWLBre9Qm2QkZv65zQphe0hMaGmChs9EoF0rf7FMYJSb
 hbBiASPjKkbJ1ILi3PTUYtMCo7zUcr3ixNzi0rx0veT83E2M4ESh5bWD8eGDD3qHGJk4GA8x
 SnAwK4nw/u1bmSDEm5JYWZValB9fVJqTWnyIUZqDRUmcd8XDyQlCAumJJanZqakFqUUwWSYO
 TqkGJt7q0yyOHe9rWVQWVE8JN25pZfVkuDxl5dyQt/s9dk3d+jRrQrwzWxtbhLtyV98N/YjD
 3Gu3Jb7I9brLnCgowviSTejms/tlq6ulZgZ+36An3KHMH3NCdO6addPK6h3Yl1RsbHiVZB8d
 881QyzI0JerLYt/vocmle9+LGgqzhBj/fjXfl8eN2bNy+R5XKR3hmWu2N7xtV3+Toa8+6bvp
 0wi5qrMWGvmWjRxl02asdNBevi0nTE/yvsYKl9nWJh4tv3X+68hqBAuX5Abk+6/+xvWLycLD
 r1nblW+yqdim/yc9PdNdXn679OjHKpGqFyo9DBs0fCbM/n76x7TJO/Y/3Vz79sHRhTsDebIk
 lNSUWIozEg21mIuKEwFaJ6/YgwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSnG6v1JoEg30fWS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErox9RxezFEzUqui8coa1gXGXQhcjJ4eE
 gInEtn9PWUBsIYEdjBIfXyVBxGUkfp2aygxhC0us/PecvYuRC6imnUliT/9JNpAEm4CRxOy3
 bxhBbBEBSYnfXaeZQYqYBY4ySlxunww2VVjAQ+L7k7lMIDaLgKpES8c1sDivgK3ElOstTBAb
 5CVWbzgAto1TwE5iW9cEdoiLbCVOLj7KPIGRbwEjwypGydSC4tz03GLDAqO81HK94sTc4tK8
 dL3k/NxNjOCQ1NLawbhn1Qe9Q4xMHIyHGCU4mJVEeP/2rUwQ4k1JrKxKLcqPLyrNSS0+xCjN
 waIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgekoX2Tsjv8Zy3T+fD4p4FEfoR40tyt1goeZ
 C/PsC4sX3GScEceV/uBPsp/kXzVF42rRr40SqwU085lP1ih2h/Yu/uoR/tFnpazrFNNfX50O
 Pk2Ys/utiNoalqf14tZJiXcMJe1iF68zmcn/Scvr9sF6ly1L9vHfdZD9nhyY5zF1T5J2ccb9
 50zZ6wVvCCi0py7atm6y+zwNYYHVl/9eyu3J7vCue2XjesgoJrZUvkbhwvODTq+slC72TyzY
 /8nw86J/jZzz1ZwfMAs+LmOzvHT6n4TCowDJgpS0t39qZsd7fH2SP7fR4x3zZL6lZwVWsV3Y
 MTEq9tnRR4Ua9jtrbv+zfHX2XUNm7/fgvDQhfiWW4oxEQy3mouJEAK7JcPC4AgAA
X-CMS-MailID: 20210524212845epcas5p18d606ec98a28aaf6086b84d19b3dc47f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210524212845epcas5p18d606ec98a28aaf6086b84d19b3dc47f
References: <20210524212416.26652-1-anaidu.gollu@samsung.com>
 <CGME20210524212845epcas5p18d606ec98a28aaf6086b84d19b3dc47f@epcas5p1.samsung.com>
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
index d32c953a38..8409adac04 100644
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
+    g_assert_cmpint(active_bpid, ==, 0x1);
+    g_assert_cmpint(read_select, ==, NVME_BPINFO_BRS_NOREAD);
+
+    /* BPMBL */
+    uint64_t bpmbl = buf_addr;
+    uint32_t bpmbl_low = bpmbl & 0xffffffff;
+    uint32_t bpmbl_hi = (bpmbl >> 32) & 0xffffffff;
+    qpci_io_writel(pdev, nvme_bar, 0x48, bpmbl_low);
+    qpci_io_writel(pdev, nvme_bar, 0x4B, bpmbl_hi);
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



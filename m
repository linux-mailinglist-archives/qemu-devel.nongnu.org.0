Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE548837
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:04:36 +0200 (CEST)
Received: from localhost ([::1]:48842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcu7X-0004C3-IN
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctHT-0003Kd-PP
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctHP-0001df-Qi
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:47 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctHF-0001Ue-B9; Mon, 17 Jun 2019 11:10:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3wXF008786;
 Mon, 17 Jun 2019 15:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=w/cOuN1BbelShft7xtXe73Ofy362XkV9IkyYB9bN76U=;
 b=ujmjFvunWAsGlIBMNLjS3BALYRANhMMqE7HV9yIpAMMuVViiKvBNiAUCwlExu0W1r+WP
 bfDiikPLhnG6NmapYciLfBjMcMkSpUDjWabvSDjHpxjpSoDAnAadFB7/aLhu7J7i9fAn
 QiYjNNPrCBLct91r5+1rkr6N7XlI6s8xhvDv3B494P9Qy0IE6lvH4/JJPFbDNlpO3l2y
 krjfl2BZU5Djogo0+MuP94Xs30vi4uOt+riVm/HwTO6rdQGKbYAQk6NqeqsbWPtoJaMu
 Y43qnEW9lHx0c880u4Y7xIyvZp7RNPCwb5s7nPFKzOnumbbxpv37Wixk7Wz8HWkha766 GA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2t4saq73gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF99dP016015;
 Mon, 17 Jun 2019 15:10:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t5cpdgehv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:30 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5HFASOL003913;
 Mon, 17 Jun 2019 15:10:29 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:10:27 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:09:50 +0300
Message-Id: <20190617150950.5264-9-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
References: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [QEMU] [PATCH v3 8/8] hd-geo-test: Add tests for lchs
 override
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
Cc: liran.alon@oracle.com, shmuel.eiderman@oracle.com, karl.heubaum@oracle.com,
 arbel.moshe@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add QTest tests to check the logical geometry override option.

The tests in hd-geo-test are out of date - they only test IDE and do not
test interesting MBRs.

I added a few helper functions which will make adding more tests easier.

QTest's fw_cfg helper functions support only legacy fw_cfg, so I had to
read the new fw_cfg layout on my own.

Creating qcow2 disks with specific size and MBR layout is currently
unused - we only use a default empty MBR.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 tests/Makefile.include |   2 +-
 tests/hd-geo-test.c    | 566 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 567 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 46a36c2c95..55ea165ed4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -765,7 +765,7 @@ tests/ide-test$(EXESUF): tests/ide-test.o $(libqos-pc-obj-y)
 tests/ahci-test$(EXESUF): tests/ahci-test.o $(libqos-pc-obj-y) qemu-img$(EXESUF)
 tests/ipmi-kcs-test$(EXESUF): tests/ipmi-kcs-test.o
 tests/ipmi-bt-test$(EXESUF): tests/ipmi-bt-test.o
-tests/hd-geo-test$(EXESUF): tests/hd-geo-test.o
+tests/hd-geo-test$(EXESUF): tests/hd-geo-test.o $(libqos-obj-y)
 tests/boot-order-test$(EXESUF): tests/boot-order-test.o $(libqos-obj-y)
 tests/boot-serial-test$(EXESUF): tests/boot-serial-test.o $(libqos-obj-y)
 tests/bios-tables-test$(EXESUF): tests/bios-tables-test.o \
diff --git a/tests/hd-geo-test.c b/tests/hd-geo-test.c
index 62eb624726..8c523d51e6 100644
--- a/tests/hd-geo-test.c
+++ b/tests/hd-geo-test.c
@@ -17,7 +17,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/bswap.h"
+#include "qapi/qmp/qlist.h"
 #include "libqtest.h"
+#include "libqos/fw_cfg.h"
+#include "libqos/libqos.h"
+#include "standard-headers/linux/qemu_fw_cfg.h"
 
 #define ARGV_SIZE 256
 
@@ -388,6 +393,552 @@ static void test_ide_drive_cd_0(void)
     qtest_quit(qts);
 }
 
+typedef struct {
+    bool active;
+    uint32_t head;
+    uint32_t sector;
+    uint32_t cyl;
+    uint32_t end_head;
+    uint32_t end_sector;
+    uint32_t end_cyl;
+    uint32_t start_sect;
+    uint32_t nr_sects;
+} MBRpartitions[4];
+
+static MBRpartitions empty_mbr = { {false, 0, 0, 0, 0, 0, 0, 0, 0},
+                                   {false, 0, 0, 0, 0, 0, 0, 0, 0},
+                                   {false, 0, 0, 0, 0, 0, 0, 0, 0},
+                                   {false, 0, 0, 0, 0, 0, 0, 0, 0} };
+
+static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
+{
+    const char *template = "/tmp/qtest.XXXXXX";
+    char *raw_path = strdup(template);
+    char *qcow2_path = strdup(template);
+    char cmd[100 + 2 * PATH_MAX];
+    uint8_t buf[512];
+    int i, ret, fd, offset;
+    uint64_t qcow2_size = sectors * 512;
+    uint8_t status, parttype, head, sector, cyl;
+
+    offset = 0xbe;
+
+    for (i = 0; i < 4; i++) {
+        status = mbr[i].active ? 0x80 : 0x00;
+        g_assert(mbr[i].head < 256);
+        g_assert(mbr[i].sector < 64);
+        g_assert(mbr[i].cyl < 1024);
+        head = mbr[i].head;
+        sector = mbr[i].sector + ((mbr[i].cyl & 0x300) >> 2);
+        cyl = mbr[i].cyl & 0xff;
+
+        buf[offset + 0x0] = status;
+        buf[offset + 0x1] = head;
+        buf[offset + 0x2] = sector;
+        buf[offset + 0x3] = cyl;
+
+        parttype = 0;
+        g_assert(mbr[i].end_head < 256);
+        g_assert(mbr[i].end_sector < 64);
+        g_assert(mbr[i].end_cyl < 1024);
+        head = mbr[i].end_head;
+        sector = mbr[i].end_sector + ((mbr[i].end_cyl & 0x300) >> 2);
+        cyl = mbr[i].end_cyl & 0xff;
+
+        buf[offset + 0x4] = parttype;
+        buf[offset + 0x5] = head;
+        buf[offset + 0x6] = sector;
+        buf[offset + 0x7] = cyl;
+
+        (*(uint32_t *)&buf[offset + 0x8]) = cpu_to_le32(mbr[i].start_sect);
+        (*(uint32_t *)&buf[offset + 0xc]) = cpu_to_le32(mbr[i].nr_sects);
+
+        offset += 0x10;
+    }
+
+    fd = mkstemp(raw_path);
+    g_assert(fd);
+    close(fd);
+
+    fd = open(raw_path, O_WRONLY);
+    g_assert(fd >= 0);
+    ret = write(fd, buf, sizeof(buf));
+    g_assert(ret == sizeof(buf));
+    close(fd);
+
+    fd = mkstemp(qcow2_path);
+    g_assert(fd);
+    close(fd);
+
+    ret = snprintf(cmd, sizeof(cmd),
+                   "$QTEST_QEMU_IMG convert -f raw -O qcow2 %s %s > /dev/null",
+                   raw_path, qcow2_path);
+    g_assert((0 < ret) && (ret <= sizeof(cmd)));
+    ret = system(cmd);
+    g_assert(ret == 0);
+
+    ret = snprintf(cmd, sizeof(cmd),
+                   "$QTEST_QEMU_IMG resize %s %" PRIu64 " > /dev/null",
+                   qcow2_path, qcow2_size);
+    g_assert((0 < ret) && (ret <= sizeof(cmd)));
+    ret = system(cmd);
+    g_assert(ret == 0);
+
+    unlink(raw_path);
+    free(raw_path);
+
+    return qcow2_path;
+}
+
+struct QemuCfgFile {
+    uint32_t  size;        /* file size */
+    uint16_t  select;      /* write this to 0x510 to read it */
+    uint16_t  reserved;
+    char name[56];
+};
+
+static uint16_t find_fw_cfg_file(QFWCFG *fw_cfg,
+                                 const char *filename)
+{
+    struct QemuCfgFile qfile;
+    uint32_t count, e;
+    uint16_t select;
+
+    count = qfw_cfg_get_u32(fw_cfg, FW_CFG_FILE_DIR);
+    count = be32_to_cpu(count);
+    for (select = 0, e = 0; e < count; e++) {
+        qfw_cfg_read_data(fw_cfg, &qfile, sizeof(qfile));
+        if (!strcmp(filename, qfile.name)) {
+            select = be16_to_cpu(qfile.select);
+        }
+    }
+
+    return select;
+}
+
+static void read_fw_cfg_file(QFWCFG *fw_cfg,
+                             const char *filename,
+                             void *data,
+                             size_t len)
+{
+    uint16_t select = find_fw_cfg_file(fw_cfg, filename);
+
+    g_assert(select);
+
+    qfw_cfg_get(fw_cfg, select, data, len);
+}
+
+#define BIOS_GEOMETRY_MAX_SIZE 10000
+
+typedef struct {
+    uint32_t c;
+    uint32_t h;
+    uint32_t s;
+} CHS;
+
+typedef struct {
+    const char *dev_path;
+    CHS chs;
+} CHSResult;
+
+static void read_bootdevices(QFWCFG *fw_cfg, CHSResult expected[])
+{
+    char *buf = g_malloc0(BIOS_GEOMETRY_MAX_SIZE);
+    void *cur;
+    char *name;
+    CHS *chs;
+    GList *results = NULL, *cur_result;
+    CHSResult *r;
+    int i;
+    bool found;
+
+    read_fw_cfg_file(fw_cfg, "bios-geometry", buf, BIOS_GEOMETRY_MAX_SIZE);
+
+    cur = buf;
+
+    while (strlen(cur)) {
+        name = cur;
+        chs = cur + strlen(cur) + 1;
+
+        r = g_malloc0(sizeof(*r));
+        r->dev_path = name;
+        r->chs.c = le32_to_cpu(chs->c);
+        r->chs.h = le32_to_cpu(chs->h);
+        r->chs.s = le32_to_cpu(chs->s);
+
+        results = g_list_prepend(results, r);
+
+        cur += strlen(cur) + 1 + sizeof(*chs);
+    }
+
+    i = 0;
+
+    while (expected[i].dev_path) {
+        found = false;
+        cur_result = results;
+        while (cur_result) {
+            r = cur_result->data;
+            if (!strcmp(r->dev_path, expected[i].dev_path) &&
+                !memcmp(&(r->chs), &(expected[i].chs), sizeof(r->chs))) {
+                found = true;
+                break;
+            }
+            cur_result = g_list_next(cur_result);
+        }
+        g_assert(found);
+        g_free(cur_result->data);
+        results = g_list_delete_link(results, cur_result);
+        i++;
+    }
+
+    g_assert(results == NULL);
+
+    g_free(buf);
+}
+
+#define MAX_DRIVES 30
+
+typedef struct {
+    char **argv;
+    int argc;
+    char **drives;
+    int n_drives;
+    int n_scsi_disks;
+    int n_scsi_controllers;
+    int n_virtio_disks;
+} TestArgs;
+
+static TestArgs *create_args(void)
+{
+    TestArgs *args = g_malloc0(sizeof(*args));
+    args->argv = g_new0(char *, ARGV_SIZE);
+    args->argc = append_arg(args->argc, args->argv,
+                            ARGV_SIZE, g_strdup("-nodefaults"));
+    args->drives = g_new0(char *, MAX_DRIVES);
+    return args;
+}
+
+static void add_drive_with_mbr(TestArgs *args,
+                               MBRpartitions mbr, uint64_t sectors)
+{
+    char *img_file_name;
+    char part[300];
+    int ret;
+
+    g_assert(args->n_drives < MAX_DRIVES);
+
+    img_file_name = create_qcow2_with_mbr(mbr, sectors);
+
+    args->drives[args->n_drives] = img_file_name;
+    ret = snprintf(part, sizeof(part),
+                   "-drive file=%s,if=none,format=qcow2,id=disk%d",
+                   img_file_name, args->n_drives);
+    g_assert((0 < ret) && (ret <= sizeof(part)));
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, g_strdup(part));
+    args->n_drives++;
+}
+
+static void add_ide_disk(TestArgs *args,
+                         int drive_idx, int bus, int unit, int c, int h, int s)
+{
+    char part[300];
+    int ret;
+
+    ret = snprintf(part, sizeof(part),
+                   "-device ide-hd,drive=disk%d,bus=ide.%d,unit=%d,"
+                   "lcyls=%d,lheads=%d,lsecs=%d",
+                   drive_idx, bus, unit, c, h, s);
+    g_assert((0 < ret) && (ret <= sizeof(part)));
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, g_strdup(part));
+}
+
+static void add_scsi_controller(TestArgs *args,
+                                const char *type,
+                                const char *bus,
+                                int addr)
+{
+    char part[300];
+    int ret;
+
+    ret = snprintf(part, sizeof(part),
+                   "-device %s,id=scsi%d,bus=%s,addr=%d",
+                   type, args->n_scsi_controllers, bus, addr);
+    g_assert((0 < ret) && (ret <= sizeof(part)));
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, g_strdup(part));
+    args->n_scsi_controllers++;
+}
+
+static void add_scsi_disk(TestArgs *args,
+                          int drive_idx, int bus,
+                          int channel, int scsi_id, int lun,
+                          int c, int h, int s)
+{
+    char part[300];
+    int ret;
+
+    ret = snprintf(part, sizeof(part),
+                   "-device scsi-hd,id=scsi-disk%d,drive=disk%d,"
+                   "bus=scsi%d.0,"
+                   "channel=%d,scsi-id=%d,lun=%d,"
+                   "lcyls=%d,lheads=%d,lsecs=%d",
+                   args->n_scsi_disks, drive_idx, bus, channel, scsi_id, lun,
+                   c, h, s);
+    g_assert((0 < ret) && (ret <= sizeof(part)));
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, g_strdup(part));
+    args->n_scsi_disks++;
+}
+
+static void add_virtio_disk(TestArgs *args,
+                            int drive_idx, const char *bus, int addr,
+                            int c, int h, int s)
+{
+    char part[300];
+    int ret;
+
+    ret = snprintf(part, sizeof(part),
+                   "-device virtio-blk-pci,id=virtio-disk%d,"
+                   "drive=disk%d,bus=%s,addr=%d,"
+                   "lcyls=%d,lheads=%d,lsecs=%d",
+                   args->n_virtio_disks, drive_idx, bus, addr, c, h, s);
+    g_assert((0 < ret) && (ret <= sizeof(part)));
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, g_strdup(part));
+    args->n_virtio_disks++;
+}
+
+static void test_override(TestArgs *args, CHSResult expected[])
+{
+    char *joined_args;
+    QFWCFG *fw_cfg;
+    int i;
+
+    joined_args = g_strjoinv(" ", args->argv);
+
+    qtest_start(joined_args);
+    fw_cfg = pc_fw_cfg_init(global_qtest);
+
+    read_bootdevices(fw_cfg, expected);
+
+    g_free(joined_args);
+    qtest_end();
+
+    g_free(fw_cfg);
+
+    for (i = 0; i < args->n_drives; i++) {
+        unlink(args->drives[i]);
+        free(args->drives[i]);
+    }
+    g_free(args->drives);
+    g_strfreev(args->argv);
+    g_free(args);
+}
+
+static void test_override_ide(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/ide@1,1/drive@0/disk@0", {10000, 120, 30} },
+        {"/pci@i0cf8/ide@1,1/drive@0/disk@1", {9000, 120, 30} },
+        {"/pci@i0cf8/ide@1,1/drive@1/disk@0", {0, 1, 1} },
+        {"/pci@i0cf8/ide@1,1/drive@1/disk@1", {1, 0, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_ide_disk(args, 0, 0, 0, 10000, 120, 30);
+    add_ide_disk(args, 1, 0, 1, 9000, 120, 30);
+    add_ide_disk(args, 2, 1, 0, 0, 1, 1);
+    add_ide_disk(args, 3, 1, 1, 1, 0, 0);
+    test_override(args, expected);
+}
+
+static void test_override_scsi(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/scsi@3/channel@0/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/scsi@3/channel@0/disk@1,0", {9000, 120, 30} },
+        {"/pci@i0cf8/scsi@3/channel@0/disk@2,0", {1, 0, 0} },
+        {"/pci@i0cf8/scsi@3/channel@0/disk@3,0", {0, 1, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "lsi53c895a", "pci.0", 3);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
+    add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
+    add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
+    test_override(args, expected);
+}
+
+static void test_override_scsi_2_controllers(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/scsi@3/channel@0/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/scsi@3/channel@0/disk@1,0", {9000, 120, 30} },
+        {"/pci@i0cf8/scsi@4/channel@0/disk@0,1", {1, 0, 0} },
+        {"/pci@i0cf8/scsi@4/channel@0/disk@1,2", {0, 1, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "lsi53c895a", "pci.0", 3);
+    add_scsi_controller(args, "virtio-scsi-pci", "pci.0", 4);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
+    add_scsi_disk(args, 2, 1, 0, 0, 1, 1, 0, 0);
+    add_scsi_disk(args, 3, 1, 0, 1, 2, 0, 1, 0);
+    test_override(args, expected);
+}
+
+static void test_override_virtio_blk(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/scsi@3/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/scsi@4/disk@0,0", {9000, 120, 30} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_virtio_disk(args, 0, "pci.0", 3, 10000, 120, 30);
+    add_virtio_disk(args, 1, "pci.0", 4, 9000, 120, 30);
+    test_override(args, expected);
+}
+
+static void test_override_zero_chs(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_ide_disk(args, 0, 1, 1, 0, 0, 0);
+    test_override(args, expected);
+}
+
+static void test_override_scsi_hot_unplug(void)
+{
+    char *joined_args;
+    QFWCFG *fw_cfg;
+    QDict *response;
+    int i;
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/scsi@2/channel@0/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/scsi@2/channel@0/disk@1,0", {20, 20, 20} },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {"/pci@i0cf8/scsi@2/channel@0/disk@1,0", {20, 20, 20} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "virtio-scsi-pci", "pci.0", 2);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
+
+    joined_args = g_strjoinv(" ", args->argv);
+
+    qtest_start(joined_args);
+    fw_cfg = pc_fw_cfg_init(global_qtest);
+
+    read_bootdevices(fw_cfg, expected);
+
+    /* unplug device an restart */
+    response = qmp("{ 'execute': 'device_del',"
+                   "  'arguments': {'id': 'scsi-disk0' }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
+    response = qmp("{ 'execute': 'system_reset', 'arguments': { }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
+
+    qtest_qmp_eventwait(global_qtest, "RESET");
+
+    read_bootdevices(fw_cfg, expected2);
+
+    g_free(joined_args);
+    qtest_end();
+
+    g_free(fw_cfg);
+
+    for (i = 0; i < args->n_drives; i++) {
+        unlink(args->drives[i]);
+        free(args->drives[i]);
+    }
+    g_free(args->drives);
+    g_strfreev(args->argv);
+    g_free(args);
+}
+
+static void test_override_virtio_hot_unplug(void)
+{
+    char *joined_args;
+    QFWCFG *fw_cfg;
+    QDict *response;
+    int i;
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/scsi@2/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/scsi@3/disk@0,0", {20, 20, 20} },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {"/pci@i0cf8/scsi@3/disk@0,0", {20, 20, 20} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_virtio_disk(args, 0, "pci.0", 2, 10000, 120, 30);
+    add_virtio_disk(args, 1, "pci.0", 3, 20, 20, 20);
+
+    joined_args = g_strjoinv(" ", args->argv);
+
+    qtest_start(joined_args);
+    fw_cfg = pc_fw_cfg_init(global_qtest);
+
+    read_bootdevices(fw_cfg, expected);
+
+    /* unplug device an restart */
+    response = qmp("{ 'execute': 'device_del',"
+                   "  'arguments': {'id': 'virtio-disk0' }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
+    response = qmp("{ 'execute': 'system_reset', 'arguments': { }}");
+    g_assert(response);
+    g_assert(!qdict_haskey(response, "error"));
+    qobject_unref(response);
+
+    qtest_qmp_eventwait(global_qtest, "RESET");
+
+    read_bootdevices(fw_cfg, expected2);
+
+    g_free(joined_args);
+    qtest_end();
+
+    g_free(fw_cfg);
+
+    for (i = 0; i < args->n_drives; i++) {
+        unlink(args->drives[i]);
+        free(args->drives[i]);
+    }
+    g_free(args->drives);
+    g_strfreev(args->argv);
+    g_free(args);
+}
+
 int main(int argc, char **argv)
 {
     Backend i;
@@ -413,6 +964,21 @@ int main(int argc, char **argv)
     qtest_add_func("hd-geo/ide/device/mbr/chs", test_ide_device_mbr_chs);
     qtest_add_func("hd-geo/ide/device/user/chs", test_ide_device_user_chs);
     qtest_add_func("hd-geo/ide/device/user/chst", test_ide_device_user_chst);
+    if (have_qemu_img()) {
+        qtest_add_func("hd-geo/override/ide", test_override_ide);
+        qtest_add_func("hd-geo/override/scsi", test_override_scsi);
+        qtest_add_func("hd-geo/override/scsi_2_controllers",
+                       test_override_scsi_2_controllers);
+        qtest_add_func("hd-geo/override/virtio_blk", test_override_virtio_blk);
+        qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
+        qtest_add_func("hd-geo/override/scsi_hot_unplug",
+                       test_override_scsi_hot_unplug);
+        qtest_add_func("hd-geo/override/virtio_hot_unplug",
+                       test_override_virtio_hot_unplug);
+    } else {
+        g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
+                       "skipping hd-geo/override/* tests");
+    }
 
     ret = g_test_run();
 
-- 
2.13.3



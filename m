Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C64B4E5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 11:27:58 +0200 (CEST)
Received: from localhost ([::1]:36106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdWsn-0002IM-BQ
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 05:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hdWpE-0000FI-TF
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 05:24:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hdWpD-0002Xm-El
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 05:24:16 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hdWpA-0002S6-PT; Wed, 19 Jun 2019 05:24:13 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9O9OA078119;
 Wed, 19 Jun 2019 09:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=XYssG+J/294GjGfqMpD5KUXLrc6cguktTtRRpAjXxbY=;
 b=y9Ik4do3tfeJEdpTvORrk7TpPmT8/LZgIF3u6owYv4l8dJRJvh8x94HfGAdvBxesM/hY
 wPHWOCERy2ILfHET0G99Rr26UEmVf02CxdwMM7MuYnGLL4jPs9kaEuR9WMrZDqCOd0iR
 ig4m99gZ3wLBB23HXRO2IDCJn7ilUJB4lIK4LC/WGlnuJmXRsi0Kzo9rGtVIK6RzlVZ/
 OFIVQ4mc+Yb8GnpmG/pHAX1eeqIdsC1+ExyGVD5PBq5bENKTYg/eclPtKB2y2b+SxmGe
 s7dt9ec7oQEmYR1hIorRgNlO/AL2Oh5Y6++uIj/Kbwsbgo3S+qXeiEjsbgY0dn+OPC/2 4w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t7809a81d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:24:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9NDfo114792;
 Wed, 19 Jun 2019 09:24:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2t77yn7rt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:24:09 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5J9O8OU008584;
 Wed, 19 Jun 2019 09:24:08 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 02:24:07 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Wed, 19 Jun 2019 12:23:49 +0300
Message-Id: <20190619092352.23583-2-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190619092352.23583-1-shmuel.eiderman@oracle.com>
References: <20190619092352.23583-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190077
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
Subject: [Qemu-devel] [SeaBIOS] [PATCH v3 1/4] geometry: Read LCHS from
 fw_cfg
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

Read bios geometry for boot devices from fw_cfg.

By receiving LCHS values directly from QEMU through fw_cfg we will be
able to support logical geometries which can not be inferred by SeaBIOS
itself.
(For instance: A 8GB virtio-blk hard drive which was originally created
as an IDE and must report LCHS of */32/63 for its operating system to
function will always break under SeaBIOS since a LARGE/LBA translation
will be used, causing the number of reported logical heads to be > 32.)

The only LCHS paravirtual interface available at the moment is for IDE
disks (rtc_read() in get_translation()) and it's limited to a maximum
of 4 disks (this code existed in SeaBIOS's translation function before
SCSI and VirtIO were even introduced).
This is why we create a new interface which allows passing LCHS
information per hdd.

Boot device information is serialized in the following way:
    * device_path lcyls lheads lsecs\n
    ...
    * device_path lcyls lheads lsecs\0

Device path is a null terminated string in the "Open Firmware" device
path format, the same path as used in bootorder.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 src/boot.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/src/boot.c b/src/boot.c
index 5acf94fe..a2cb167c 100644
--- a/src/boot.c
+++ b/src/boot.c
@@ -24,6 +24,79 @@
 
 
 /****************************************************************
+ * Boot device logical geometry
+ ****************************************************************/
+
+typedef struct BootDeviceLCHS {
+    char *name;
+    u32 lcyls;
+    u32 lheads;
+    u32 lsecs;
+} BootDeviceLCHS;
+
+static BootDeviceLCHS *BiosGeometry VARVERIFY32INIT;
+static int BiosGeometryCount;
+
+static char *
+parse_u32(char *cur, u32 *n)
+{
+    u32 m = 0;
+    if (cur) {
+        while ('0' <= *cur && *cur <= '9') {
+            m = 10 * m + (*cur - '0');
+            cur++;
+        }
+        if (*cur != '\0')
+            cur++;
+    }
+    *n = m;
+    return cur;
+}
+
+static void
+loadBiosGeometry(void)
+{
+    char *f = romfile_loadfile("bios-geometry", NULL);
+    if (!f)
+        return;
+
+    int i = 0;
+    BiosGeometryCount = 1;
+    while (f[i]) {
+        if (f[i] == '\n')
+            BiosGeometryCount++;
+        i++;
+    }
+    BiosGeometry = malloc_tmphigh(BiosGeometryCount * sizeof(BootDeviceLCHS));
+    if (!BiosGeometry) {
+        warn_noalloc();
+        free(f);
+        BiosGeometryCount = 0;
+        return;
+    }
+
+    dprintf(1, "bios geometry:\n");
+    i = 0;
+    do {
+        BootDeviceLCHS *d = &BiosGeometry[i];
+        d->name = f;
+        f = strchr(f, '\n');
+        if (f)
+            *(f++) = '\0';
+        char *chs_values = strchr(d->name, ' ');
+        if (chs_values)
+            *(chs_values++) = '\0';
+        chs_values = parse_u32(chs_values, &d->lcyls);
+        chs_values = parse_u32(chs_values, &d->lheads);
+        chs_values = parse_u32(chs_values, &d->lsecs);
+        dprintf(1, "%s: (%u, %u, %u)\n",
+                d->name, d->lcyls, d->lheads, d->lsecs);
+        i++;
+    } while (f);
+}
+
+
+/****************************************************************
  * Boot priority ordering
  ****************************************************************/
 
@@ -288,6 +361,7 @@ boot_init(void)
     BootRetryTime = romfile_loadint("etc/boot-fail-wait", 60*1000);
 
     loadBootOrder();
+    loadBiosGeometry();
 }
 
 
-- 
2.13.3



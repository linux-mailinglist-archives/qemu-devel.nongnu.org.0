Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C8487E4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:52:17 +0200 (CEST)
Received: from localhost ([::1]:48720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hctvc-0003QZ-QQ
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55505)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctBu-0006z8-1a
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctBs-0005lP-Et
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:05:01 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60254)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctBl-0005f2-0v; Mon, 17 Jun 2019 11:04:53 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3n4P194596;
 Mon, 17 Jun 2019 15:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=9eBfBHXMqkKaaT/COYD7EQTS6Y2vHmPdziB2LuFlQyg=;
 b=ZvVUQr+gELqwPnaphER11fpfKIkEX4Rvu4MhKIKMVEHN7oZ/8XbR5I5RQeOP/VlZ0hgk
 uE+wae3k44Fl/JtqT22Xhl1Q18A13E8KahD1Y0XSbIvuSFJ7kyJ4LU/YtCIFoxAWJdaP
 fimKdhcq6iFnCMo0ZqwDeDBjK+poG+u9O0taAGgwbIDAw88DwFrtX4vFCknoQPu/UjsZ
 u9X46NSugxBtasDFm7HfD0uL9lu8vQLP0VXb+m+3iDsFEadYbZEW6GW7racw890Y91GK
 XiUOoenvE14MDAM3D4q1J0rB2+gGouoz9pNY1zrOQsx+hfkHLBcbP12J2r1D3VISEnar 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t4r3tf5wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:04:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF4OBW057663;
 Mon, 17 Jun 2019 15:04:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2t5mgbd5vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:04:49 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HF4nwp022303;
 Mon, 17 Jun 2019 15:04:49 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:04:49 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:04:16 +0300
Message-Id: <20190617150419.4953-3-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20190617150419.4953-1-shmuel.eiderman@oracle.com>
References: <20190617150419.4953-1-shmuel.eiderman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: [Qemu-devel] [SeaBIOS] [PATCH v2 2/5] boot: Reorder functions in
 boot.c
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

Currently glob_prefix() and build_pci_path() are under the "Boot
priority ordering" section.
Move them to a new "Helper search functions" section since we will reuse
them in the next commit.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
---
 src/boot.c | 94 ++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/src/boot.c b/src/boot.c
index b4382041..78d2c530 100644
--- a/src/boot.c
+++ b/src/boot.c
@@ -22,6 +22,55 @@
 #include "util.h" // irqtimer_calc
 #include "tcgbios.h" // tpm_*
 
+/****************************************************************
+ * Helper search functions
+ ****************************************************************/
+
+// See if 'str' starts with 'glob' - if glob contains an '*' character
+// it will match any number of characters in str that aren't a '/' or
+// the next glob character.
+static char *
+glob_prefix(const char *glob, const char *str)
+{
+    for (;;) {
+        if (!*glob && (!*str || *str == '/'))
+            return (char*)str;
+        if (*glob == '*') {
+            if (!*str || *str == '/' || *str == glob[1])
+                glob++;
+            else
+                str++;
+            continue;
+        }
+        if (*glob != *str)
+            return NULL;
+        glob++;
+        str++;
+    }
+}
+
+#define FW_PCI_DOMAIN "/pci@i0cf8"
+
+static char *
+build_pci_path(char *buf, int max, const char *devname, struct pci_device *pci)
+{
+    // Build the string path of a bdf - for example: /pci@i0cf8/isa@1,2
+    char *p = buf;
+    if (pci->parent) {
+        p = build_pci_path(p, max, "pci-bridge", pci->parent);
+    } else {
+        p += snprintf(p, buf+max-p, "%s", FW_PCI_DOMAIN);
+        if (pci->rootbus)
+            p += snprintf(p, buf+max-p, ",%x", pci->rootbus);
+    }
+
+    int dev = pci_bdf_to_dev(pci->bdf), fn = pci_bdf_to_fn(pci->bdf);
+    p += snprintf(p, buf+max-p, "/%s@%x", devname, dev);
+    if (fn)
+        p += snprintf(p, buf+max-p, ",%x", fn);
+    return p;
+}
+
 
 /****************************************************************
  * Boot device logical geometry
@@ -146,29 +195,6 @@ loadBootOrder(void)
     } while (f);
 }
 
-// See if 'str' starts with 'glob' - if glob contains an '*' character
-// it will match any number of characters in str that aren't a '/' or
-// the next glob character.
-static char *
-glob_prefix(const char *glob, const char *str)
-{
-    for (;;) {
-        if (!*glob && (!*str || *str == '/'))
-            return (char*)str;
-        if (*glob == '*') {
-            if (!*str || *str == '/' || *str == glob[1])
-                glob++;
-            else
-                str++;
-            continue;
-        }
-        if (*glob != *str)
-            return NULL;
-        glob++;
-        str++;
-    }
-}
-
 // Search the bootorder list for the given glob pattern.
 static int
 find_prio(const char *glob)
@@ -181,28 +207,6 @@ find_prio(const char *glob)
     return -1;
 }
 
-#define FW_PCI_DOMAIN "/pci@i0cf8"
-
-static char *
-build_pci_path(char *buf, int max, const char *devname, struct pci_device *pci)
-{
-    // Build the string path of a bdf - for example: /pci@i0cf8/isa@1,2
-    char *p = buf;
-    if (pci->parent) {
-        p = build_pci_path(p, max, "pci-bridge", pci->parent);
-    } else {
-        p += snprintf(p, buf+max-p, "%s", FW_PCI_DOMAIN);
-        if (pci->rootbus)
-            p += snprintf(p, buf+max-p, ",%x", pci->rootbus);
-    }
-
-    int dev = pci_bdf_to_dev(pci->bdf), fn = pci_bdf_to_fn(pci->bdf);
-    p += snprintf(p, buf+max-p, "/%s@%x", devname, dev);
-    if (fn)
-        p += snprintf(p, buf+max-p, ",%x", fn);
-    return p;
-}
-
 int bootprio_find_pci_device(struct pci_device *pci)
 {
     if (CONFIG_CSM)
-- 
2.13.3



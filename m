Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8683CEB90
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:03:30 +0200 (CEST)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZU9-0000u9-QL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRl-0006QT-7m
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRi-0005kG-SP
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:00 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuV6E015843; Mon, 19 Jul 2021 20:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3Bsyd2HEbENxiOohTS0Bfm+QZAsTYYNrMTL9j9LWH68=;
 b=B9mGixpX0v5vQENU3Q/yUGfTGsaenSYoUyivsJnBG3fB79K/lze5r0FuWfMEKlTuMQdy
 yIWSs2Q+qO2vDEf8EHgRxGgYBoFwIa0s5JKBpANR59LApGYP+XIp5JCvE8+ZbqLNyDqh
 qU1HyAu6u43OtZJ5cropwgvjZSOHiamnJOppHDIdFcT1hz4FimeVzcQaj1HhBmtTzz0j
 pXizrasL5dsMTGR9DFOr4k7yCaxa5p1vWlmg0dNL02vLZC3Wc6VSJMxc0iJMhafDFeya
 H8Gvq21BSyabBdXyLktmv6lgyf7XiTJ2OZI2I+nZdO5HvKb3pzat8nEZj8foKCYpJZ/m 7Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3Bsyd2HEbENxiOohTS0Bfm+QZAsTYYNrMTL9j9LWH68=;
 b=ZLop9p4LrtkYCBX1iIz8NAHlEJzrkocsZEI8sRy7eY2UaRlyRIcfC6m+vxkauKaZtDSF
 qcsGoU0QQukm3Q8n7pJ2peUx6RL8imhueR3Ekdl1cbv9ifSBZsaQjeXZJ2L0tiLIv76p
 aUTOoh0IlC6fIyHhVFEt9ebomWHdxchUU9P9RH7lgR/jd17mS/tDf5gZS1wq7VUDJKcI
 2kHox+b1mnMuoBfW0lukCP00n+rbo54Ym8tqvi4J8L1CabZ4tj16PlmisYsRoCZ4FJgr
 pnW39FlcpuGmNysyCg60qlbkZtSsN3EkeU8ZyTgQySSiSKq0wtWUDitbXoakzhUr1Xkk AA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vqm9a98y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0WYx127596;
 Mon, 19 Jul 2021 20:00:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by userp3020.oracle.com with ESMTP id 39v8ytbghn-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmoyvhZaAW+IvtFI49t+2RHuOzx1u4d95Aip4kRy4pfF6QzAoGVcnDZb1MKPC3mqvZamkKd49ssGvqafe7Dg7viM13yy/1vnUXTkyrRGFNAtrLydqRPPlu25F0owz7HixbOTAfpOCPhwY4Xn6oizfsHFx+ILPuFbUOkOoboMq/jnSDGtEUQbm08S+HBZYk36J8HYasYyHHjSa4EQarFHNE2M+3hUmHcEfsyd2gjqjUZyQM4sbIE8ntxgtRrEE7iaWsRKuGdzEOUuWcq0twwDy7kDgv+qJbpXJlaxRhcu4HNAfaZLHXiIzPImjwQlmdGQ/mFZI9nNb1WCgIKjAhTioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bsyd2HEbENxiOohTS0Bfm+QZAsTYYNrMTL9j9LWH68=;
 b=T+JjQQoKIt9d0Nzhmv8S4hGxS37KP5SH+sNp2HmUyseAs4ygnWVSL3TaHANt6g2y93gfojfX8Yn3KeHiDkuC/iFZQRC3NuMrJAnm0EYEYG3Doct2tyPNMfQ/bNq7nr5ULWWL8ABTk6TyB3QGmeinNVYxAXX53YL95dTUz0TYRgjUyTpPJ7cr/cltgDGEWiD426XjGY7CBzY7mTWl20YuiApAwa2RG6ww1QujDlUxMUlA0o5GNJNQ3/GCcJO4YlniepUQl1YEG2GKvRrT2bYLUQ8TIgwzyChmnTdIR4UfXviR2ubC1OHwgOdme6lHtuNzE2luhUlBgXhZJOFp5UA3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bsyd2HEbENxiOohTS0Bfm+QZAsTYYNrMTL9j9LWH68=;
 b=HhB9ZhYEX+CvG2DIiYXHPV1NsZb5xqhHoFHykZXMdPWPf7i+ILPBB/w99LVAnKTtDtZX4+eo1sHo29Vf3eVwa4vx8SNRiUg7zyOxeKekkO3z5GfoDQKE4mZW9zmb+dfQbbnVwljLORUNCpdJInWFNQC9x3qL04or/t8G+weYblc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4240.namprd10.prod.outlook.com (2603:10b6:208:1d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:00:20 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:20 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 02/11] vfio-user: define vfio-user object
Date: Mon, 19 Jul 2021 16:00:04 -0400
Message-Id: <190ed3e058c4eb49ade982394b23853a9ad76552.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5610aafc-531b-4719-8695-08d94aefd627
X-MS-TrafficTypeDiagnostic: MN2PR10MB4240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB4240B9B48D6E7A0E90FEB2EC90E19@MN2PR10MB4240.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aip0fn18J5B23H8Uzmvc1ywSzEGu56ChuZsT+wF9y+GAadDE1Ul0GlfEs5qEjkm+p9zsid6CkU7Xs60uQz87LlrunAKC0RVQlHmrI63hFB1dziK2IrkL9q02iVz2A1qqDpNQe9JxDs+X1ecElYGyIbzZICXL2n4cSOQUYIURILODBMcgwaYG0Ml/Z+bjBDHRdAD1t7ihviBh0IMxs4w3iPdCAq+/u3AybiqRh4SXhGXm0s4MTsVgS5yXQghtwlmEeqx4a7Yf56X+T6KBx9YYz2PladT4lAMPazP35LxZqvgYjaaHar97TBQhpRm28J2hQX1ogHg5MKSIgbKBYcmv7w8P4d1Ep8w+nawbnSxt2mTSfCwmmtDLorzBjUpn8t3EnNgGS5N80swW3JFv+uDXLelO6fsPjry0XDefT14dp3P5B7fwklpdZZ4cEDJJaiDKfGh/thTmIF6b9invZXzpIExpz/SbmoFl6Z2H1zoPxfIMF57GMUp97TT6C7OY/AietJrLNtZLT87fFT0Krk/onv+Y10pJtxTcn/siuGpY3+uLcuQTy6yzPqjVypGtHKDwt/bnGayaX994B6l9L4XrrYs/bNrCLXSQt2mEDz8S8I1zZQi2Z/1JH+f5NF+BgVw8wdKYNHENiuhUhLmXMHfAAdv29qrR2BwRVNHoMYKQD4GG7LyNCfPE+0ERP6CMgKfy0PM/tpWfbdNedJBYAOgcOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(136003)(376002)(66476007)(66556008)(8936002)(6486002)(66946007)(36756003)(478600001)(52116002)(38350700002)(7696005)(4326008)(38100700002)(316002)(107886003)(6666004)(6916009)(2906002)(5660300002)(186003)(26005)(83380400001)(8676002)(86362001)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9qxem7G7BehYbxAMRUIW45lrql5X62OEULQ7zQ07qlYDMSVI+K8NKcysQHv0BE3N0nkMR9p9TSOPKxAxsHxyetUaKrZan/ha/jNDa+k6y48KbE6/kfiiB33Ki5uySAGumN96AAC6xH9p81xwJvtRKa6+W+IDjnCHyTaiIqfP7AX6K8ej7G2tX6XU8wjd3OTgRnwKR/Fe8kTHrne3lKNzzYNPcCtR6geBxAqG/cp39/slGyJsIW2OHYjWDr52930167Fagl9iXh5AtdIhDpbhOQtP1fqzMJaV6kSoSbK8Q0CHfGSplSrWCyAu7Ny8GOXTR7Z6Od0KDSYALd9TeSLwCKP6KcuaY/8OcLmKS1cUdtx0qk2VEWui8rUzJWiZWGFPgxT6HL14l9CcKNLk1xemRpCPMACHMUPQmmTt22vaBmi5BfWAknGLLJo6JpxyOY9JbQoZiTkHfaQ2OIXioY2ancEhICVn6TY/n/9ZuIDFVW9dMMmA/AgpsZFSCbRQtKypDhYjXLaXc9R7TvLhkKwJryqHxrNrBGRm9L8+4vhFaidj4+SaGHugzCBKlPT/V3pGfsVb1C5UvtFVBMfM/ssow2aTWX9O9jAFmI6oXtB7WZFUSPm8c0gfI6DvPfeWsZHxJjFMGw5pt7nfLy48fjc9h4trCNWAauQfFPiPQzmOqMf2dBoXDgzSnlZT4FOs+C8bflNMxNTSMoTXtLKyOsJXbS9oGfBtILUKb4kJsSWBUOuCyamX8IbR4a16gOEAx/y6
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5610aafc-531b-4719-8695-08d94aefd627
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:20.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6n8gT2+PAZl9nSCL3NYHmPoaU0akMzThijJjn/se96U6u+QTxEqnxW7eb13y812PhggGFo07guQhq5T6Fnijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4240
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: vtFSPLejk8--e7GNXdnRG8nY_KSld1rb
X-Proofpoint-ORIG-GUID: vtFSPLejk8--e7GNXdnRG8nY_KSld1rb
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json             |  20 ++++++-
 hw/remote/vfio-user-obj.c | 141 ++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 hw/remote/meson.build     |   1 +
 hw/remote/trace-events    |   3 +
 5 files changed, 164 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index 652be31..e0716d2 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -684,6 +684,20 @@
   'data': { 'fd': 'str', 'devid': 'str' } }
 
 ##
+# @VfioUserProperties:
+#
+# Properties for vfio-user objects.
+#
+# @socket: path to be used as socket by the libvfiouser library
+#
+# @devid: the id of the device to be associated with the file descriptor
+#
+# Since: 6.0
+##
+{ 'struct': 'VfioUserProperties',
+  'data': { 'socket': 'str', 'devid': 'str' } }
+
+##
 # @RngProperties:
 #
 # Properties for objects of classes derived from rng.
@@ -807,7 +821,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    'x-remote-object'
+    'x-remote-object',
+    'vfio-user'
   ] }
 
 ##
@@ -863,7 +878,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'vfio-user':                  'VfioUserProperties'
   } }
 
 ##
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000..5098169
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,141 @@
+/*
+ * QEMU vfio-user server object
+ *
+ * Copyright © 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object vfio-user,id=<id>,socket=<socket-path>,devid=<pci-dev-id>
+ *
+ * Note that vfio-user object must be used with x-remote machine only. This
+ * server could only support PCI devices for now.
+ *
+ * socket is path to a file. This file will be created by the server. It is
+ * a required option
+ *
+ * devid is the id of a PCI device on the server. It is also a required option.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_VFU_OBJECT "vfio-user"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+
+    /* Maximum number of devices the server could support*/
+    unsigned int max_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    char *socket;
+    char *devid;
+};
+
+static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->socket);
+
+    o->socket = g_strdup(str);
+
+    trace_vfu_prop("socket", str);
+}
+
+static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->devid);
+
+    o->devid = g_strdup(str);
+
+    trace_vfu_prop("devid", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+
+    /* Add test for remote machine and PCI device */
+
+    if (k->nr_devs >= k->max_devs) {
+        error_report("Reached maximum number of vfio-user devices: %u",
+                     k->max_devs);
+        return;
+    }
+
+    k->nr_devs++;
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    g_free(o->socket);
+    g_free(o->devid);
+
+    if (k->nr_devs == 0) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    /* Limiting maximum number of devices to 1 until IOMMU support is added */
+    k->max_devs = 1;
+    k->nr_devs = 0;
+
+    object_class_property_add_str(klass, "socket", NULL,
+                                  vfu_object_set_socket);
+    object_class_property_add_str(klass, "devid", NULL,
+                                  vfu_object_set_devid);
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 99646e7..46ab6b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3380,6 +3380,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index fb35fb8..cd44dfc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974..7da12f0 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
1.8.3.1



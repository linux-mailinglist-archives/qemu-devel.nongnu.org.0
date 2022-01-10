Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D748A330
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:49:21 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73Tb-0004Ia-OA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:49:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73NA-0004hu-Hm
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N7-0001qy-Hk
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:40 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJlWGq020775; 
 Mon, 10 Jan 2022 22:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wNCBwsIwJh+aINunDayBl5YJcFgrB4R4o1AgPGpxoMs=;
 b=twzKh+g9UlIti/zJ6whXSHu6jQIFTV68Wg7WUQ/jRw29Om4NIjN6aj6Eb+3nZHKr2wNF
 Zle+2D0TjfGjpGBoehSvHefBqNIvQ2ERjXz+ncPVh7j4OQ/kQaiLEU/YYIVZEyhVnIG2
 Mu4E3Y7tKSsR+NwccqZP1lbtflEk2B/wYWAw0PNFnNOjEpYPaukOMsmtAdMfrtUifbSn
 7lr1WasT/SBUvy0W74ny++SQZm/ubkVG5zYrzyie9fuqQ9QSHeluJLEpnRHmDe7z0yTq
 kwliXq3YLRfX7Rr+rESU4CWfs+3KYfyTGlUU+oLiEHvdbsdoMlDr/IfBjagBD8hLqjhX hQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk99kkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZZ4T009118;
 Mon, 10 Jan 2022 22:42:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3020.oracle.com with ESMTP id 3df42kpj9a-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwmGCBmPQgMVwnCp7x63S2CfLk2Bl1R78Mi357P4Re4UqUidbgY1wPFsrLbfaD5T/fOVaVlFPQUABLMsl5/7aGNxqFitgkNA1KvRS38VhtYT11Qg4s7U17g11z265mBB2nrtnuDnD7leD3PeVurs0ilf0IZijQ5L5ec6+OIH2XZ/gVcDp5AALJ5rZ/AmEjOs0GwLHTRXUpdF3EzF5IIu7kj8qRqUj0qiUM1WOnW/UjlZkuF07N4ucnb6iw/hKYDKMZZidyrQ3lFpjB/hsUJBQRcyVqR/OTUXkqSFFPzT83gAZBmzzvAINlv/O+3XIEPGKSYSvdws0XLYDyjZWmTOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNCBwsIwJh+aINunDayBl5YJcFgrB4R4o1AgPGpxoMs=;
 b=QYVD2GEvOFmwO0s/VMH5jEGlOO5QLEJLHTxbbjcF4YQO24tAT16r6f02WfgopPc2Rt0Mk9Y7W09sn5DJXZ3n3l1XgaBc0OuKZSS//5sbl7ChAPFWp07+TyVHyuqBuHTMkoriB5g0dy1bsSzQY5gsiqW45MD2nUDic7jaeZba7N0Fk2M+pfIj35k9uYSW9HnibAnfapvolW0OWOBUDiXSlD7G5L4pM5kZlDGquOx2vQz1TMkmXG9OxID8emb7fv42tuSYaHNH1kk4PRFwgrnXDCY7oarieYKsH0lq3m+Z351rMgRbram3dGJXNBqPBRdLJPh60zmSIMN5ON/X6ERzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNCBwsIwJh+aINunDayBl5YJcFgrB4R4o1AgPGpxoMs=;
 b=P7ZeZMickBGZYBJRrOga3NAMPm/TjJsWY4xuXb+imD2/nPegOHyfuMmYnUCbF4ifk1wLIa19ox75fCyI5f3pR+2ozFkdKPD6S3xQhJRAw9dKInM14M3un9D99RBQqv1NkvxghbFp2gm0NzSOLWEgRhrgbBRt9p12gms6jLgxQGU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1600.namprd10.prod.outlook.com (2603:10b6:300:27::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:32 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 8/9] ACPI ERST: qtest for ERST
Date: Mon, 10 Jan 2022 17:42:03 -0500
Message-Id: <1641854524-11009-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8db7d9bd-a92d-4489-f9d1-08d9d48a7d6e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1600:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1600CD34EF40A4D05ECF888C97509@MWHPR10MB1600.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiMZTf9fFh3NYtPO7CTdrNrAMvWzr2q0vXHaQ4MkItt+vGGNUbNPvHX6Zc7572uZXz+lntFaAHgH2+Am+7pEaaEaPvCYKad9E/w84KxV1KAQN/+7e9TxV/Gqt08tdJjzIO8PsnZgisDOUCsmxv+d4l1wYFUDmucdS5UywjiY1LeEycZFcok+3Kqxq31FUaUU3NrAOHRbM3Y8FsEkAJGn2FLueBNmBQVJGv+VQwcJ/PKqSzqql6yN4U3flj3J5Fu6S7qKgrLClw1M9/ZYt3HlgZ7vNKJXwNt+FobQw00EXgv6Eb5dtzjom21UfYOy/whwNuAw09cZkF1XblU+7eMZKLJjNKtKG5X5w3zgJU+ONRMaFAXGnBzAaGXKtHea7ywth9LlpAO6vrecDTo5z4pGd7+18Wt3jTEATvwGvu5l66f1Bdv8hvPM3KhvB7a2OXzRkYcPjUtb58Vh0Mye2uyNfSmN245MyVIaKjRrx2EZjihZpuaZf6tMBOu8KypjZWQAfidsef2OP/WJ6+bcWFXLnLXMjuqO0FOKM4teVSy3XmIOdRvmqIs6iCInq4PCuS046V7Mcq5vbn4tpJFTiw6hjcjY6E0Uy9L+c3nKYy6PsUaJRJPbJHiygfQPaSpFZi8KiF3FiKpnTck9uzEaUKfvTbInBmBaS5LMkySB7fycv8+AxPnQov0lJ0FjPPlJXm0n0oWDbRIiwMLXtuH1Nkvv9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(8676002)(6486002)(66556008)(38100700002)(38350700002)(36756003)(8936002)(66946007)(316002)(2906002)(6916009)(5660300002)(66476007)(52116002)(6506007)(107886003)(186003)(508600001)(26005)(4326008)(6666004)(83380400001)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tc3O7UipKujY+oCCy3jiTguklaqxWOdtE0N3w7POLaYR1bliEVbmB26Ylb3N?=
 =?us-ascii?Q?bMq66PaEa1cjDyUiITO3aO7Xx/SzvmoG6/+IUbfTlkV5ULMerv2T7y2BzKfE?=
 =?us-ascii?Q?oTiHoLKn9cO1rbBIWaP036TSkO8nsSwq6F2e3CRFE1WfrMltH2RLDb1/67vs?=
 =?us-ascii?Q?xHi04qI0E7olXN7QYiiubtSxxtgHxSpnqJW6cZ0M6FCBmhZE3KNRs4PiZjDu?=
 =?us-ascii?Q?V0HU8YTbFdM/tCB+i54jR88YgeamQAulTHh89II/e8X8xE7ymL5wxm4Y0fDC?=
 =?us-ascii?Q?UaIuFKFpKmXH2XuhoKOsdxsDQd7g8iDo+Kjlnr3gdhBVVp9e5twOI5KadwBm?=
 =?us-ascii?Q?hZkeMtrrOWRufmy4BjQhiNUAazDqwWrEaw1lmIGEMPqCNcmKwLlnV+pch4U7?=
 =?us-ascii?Q?wD2ACJGqq9EUOajB0Gkifsh03vC8GK1DBuP+MQdHw25h5OO8Mw3d24scDkCy?=
 =?us-ascii?Q?vifWtP8ZFfzPlJ5jpo2ut356S19NlzU++Vm7QniEyfNzAr06ZmNZhAwRyKfO?=
 =?us-ascii?Q?Lagkhrb/r83adFlTkrgqsna2sH4D7e1k4xNPqP0v4qBLKYOnSRXSVHGv8Ncr?=
 =?us-ascii?Q?nuYq4OqLrJz5X0sEnMUT3Ujhhh/cpK+RLGVTRZ22vMS1mytTBuc55PumachQ?=
 =?us-ascii?Q?ZfakL5J9/Sl5wbGVeq0PD2lAkmi4xfb4HsT7UZW7ew/orzi+6VvFvOa0GwNz?=
 =?us-ascii?Q?qMA7Y82vuXt7bXabjugK6hKFYR37lgeoUj8vurFzzbAzdpJum5YmEoHOke0v?=
 =?us-ascii?Q?gUd/Ytgk2BLrhxCcHL+MUntkG7rd2YDu0i5BVPgK9S7BYkzoBBF/CgSecwAL?=
 =?us-ascii?Q?S5h8nXgKTSO9OqBwlGUQYgMhSNlIjexGM2oleIuOIRYtyrliHkAPmPdwldcH?=
 =?us-ascii?Q?o5C0tNP2BwLe+b37xjvgW0xkdwGCqxfgoYYwa3+ENn3aGFMbhQwX2RpEMMB3?=
 =?us-ascii?Q?5vkDDcFwSRCRURgH0unAn9z6jWz4momr94FCmXHaTOpC3n7nVdymnAroXF3G?=
 =?us-ascii?Q?Egu7gixDRPqKvRDFb3cuAGLklupk0QBVEcAsKZzJwRluHBwklLGTjMaqS66t?=
 =?us-ascii?Q?DK7stTB0Gf+0isv9LQOR11znZ0D2ALHBRTBD+QBeciLO4/1iDGQI0t3wfHnc?=
 =?us-ascii?Q?lYt5ZD7qudmWW5MfxPG8MOq2ovJF3xGJXvBPgRkE2aQnLG355U5tidsb/+Nc?=
 =?us-ascii?Q?5IGqIOfxsmBa8ZyjtNyFO7XagLTUpCK5vWYvgVBbqH/BywGHWVjbsNqi5R+K?=
 =?us-ascii?Q?MTfxz60sElsURWUWpJ2ryow0c6PVkRYNXHbY85m9WE+wjewl237dEBJdJWLV?=
 =?us-ascii?Q?rvbIbI0UjinKwRDnC6POYCoNe09maCGPcxUQ/H6d3Q8WFHb6KT5/mSUIWJRC?=
 =?us-ascii?Q?zJ3Y8/jn2t6uFDpickVLr8gUwbb4kobv2gpwS6J4jNrtTeVlX+WbyZWFWkWT?=
 =?us-ascii?Q?sfbiahUYMlgAAMskQNZ+xJEy0a/U2j07GllWTja6vZOB+BNCBb3epzjxkXM5?=
 =?us-ascii?Q?4uGT/eAfp2vYyPNGy06eOCOxGMsfF+yPXT3d2lVFKuk/c38oPEaoen700a+t?=
 =?us-ascii?Q?lUltgSGlzUPIrnUpBAimt+SXim261SjVQX875n3cHe2niCB3dqO9r7f7VEAj?=
 =?us-ascii?Q?VqGfo3y27zvmHRjsMQYW2+LKcUqRv/r4Xj/5GgoX/+ozP2UnkSKTHqdvHXdC?=
 =?us-ascii?Q?YqLo1w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db7d9bd-a92d-4489-f9d1-08d9d48a7d6e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:32.6666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gI9QB/aNe6s4ACAaqKTQ3nQqDLt4jjzrHJH7u3VmSZKUkXdSo+C0WgJKlpq3QAWrnGoLHuveZSl3vYrdr2bpgKYYp659KRZvIv3D0wyMAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1600
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: N0-7MEbAkELYMphSh814VqHDLChnnXL0
X-Proofpoint-ORIG-GUID: N0-7MEbAkELYMphSh814VqHDLChnnXL0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/erst-test.c | 172 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 174 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..f9ad3c9
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,172 @@
+/*
+ * QTest testcase for acpi-erst
+ *
+ * Copyright (c) 2021 Oracle
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include "libqos/libqos-pc.h"
+#include "libqos/libqtest.h"
+#include "qemu-common.h"
+
+#include "hw/pci/pci.h"
+
+static void save_fn(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice **pdev = (QPCIDevice **) data;
+
+    *pdev = dev;
+}
+
+static QPCIDevice *get_erst_device(QPCIBus *pcibus)
+{
+    QPCIDevice *dev;
+
+    dev = NULL;
+    qpci_device_foreach(pcibus,
+        PCI_VENDOR_ID_REDHAT,
+        PCI_DEVICE_ID_REDHAT_ACPI_ERST,
+        save_fn, &dev);
+    g_assert(dev != NULL);
+
+    return dev;
+}
+
+typedef struct _ERSTState {
+    QOSState *qs;
+    QPCIBar reg_bar, mem_bar;
+    uint64_t reg_barsize, mem_barsize;
+    QPCIDevice *dev;
+} ERSTState;
+
+#define ACTION 0
+#define VALUE 8
+
+static const char *reg2str(unsigned reg)
+{
+    switch (reg) {
+    case 0:
+        return "ACTION";
+    case 8:
+        return "VALUE";
+    default:
+        return NULL;
+    }
+}
+
+static inline uint32_t in_reg32(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint32_t res;
+
+    res = qpci_io_readl(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %08x", name, res);
+
+    return res;
+}
+
+static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint64_t res;
+
+    res = qpci_io_readq(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
+
+    return res;
+}
+
+static inline void out_reg32(ERSTState *s, unsigned reg, uint32_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%08x -> *%s", v, name);
+    qpci_io_writel(s->dev, s->reg_bar, reg, v);
+}
+
+static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%016llx -> *%s", (unsigned long long)v, name);
+    qpci_io_writeq(s->dev, s->reg_bar, reg, v);
+}
+
+static void cleanup_vm(ERSTState *s)
+{
+    g_free(s->dev);
+    qtest_shutdown(s->qs);
+}
+
+static void setup_vm_cmd(ERSTState *s, const char *cmd)
+{
+    const char *arch = qtest_get_arch();
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        s->qs = qtest_pc_boot(cmd);
+    } else {
+        g_printerr("erst-test tests are only available on x86\n");
+        exit(EXIT_FAILURE);
+    }
+    s->dev = get_erst_device(s->qs->pcibus);
+
+    s->reg_bar = qpci_iomap(s->dev, 0, &s->reg_barsize);
+    g_assert_cmpuint(s->reg_barsize, ==, 16);
+
+    s->mem_bar = qpci_iomap(s->dev, 1, &s->mem_barsize);
+    g_assert_cmpuint(s->mem_barsize, ==, 0x2000);
+
+    qpci_device_enable(s->dev);
+}
+
+static void test_acpi_erst_basic(void)
+{
+    ERSTState state;
+    uint64_t log_address_range;
+    uint64_t log_address_length;
+    uint32_t log_address_attr;
+
+    setup_vm_cmd(&state,
+        "-object memory-backend-file,"
+            "mem-path=acpi-erst.XXXXXX,"
+            "size=64K,"
+            "share=on,"
+            "id=nvram "
+        "-device acpi-erst,"
+            "memdev=nvram");
+
+    out_reg32(&state, ACTION, 0xD);
+    log_address_range = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xE);
+    log_address_length = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xF);
+    log_address_attr = in_reg32(&state, VALUE);
+
+    /* Check log_address_range is not 0, ~0 or base */
+    g_assert_cmpuint(log_address_range, !=,  0ULL);
+    g_assert_cmpuint(log_address_range, !=, ~0ULL);
+    g_assert_cmpuint(log_address_range, !=, state.reg_bar.addr);
+    g_assert_cmpuint(log_address_range, ==, state.mem_bar.addr);
+
+    /* Check log_address_length is bar1_size */
+    g_assert_cmpuint(log_address_length, ==, state.mem_barsize);
+
+    /* Check log_address_attr is 0 */
+    g_assert_cmpuint(log_address_attr, ==, 0);
+
+    cleanup_vm(&state);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/acpi-erst/basic", test_acpi_erst_basic);
+    ret = g_test_run();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa..d2b4ed2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
@@ -278,6 +279,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1



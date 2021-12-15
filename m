Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A030475C89
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:01:12 +0100 (CET)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWiN-00033E-Kz
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:01:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMr-0000qo-J6
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:57 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMn-0000Ut-O9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:57 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEMpfb023149; 
 Wed, 15 Dec 2021 15:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=DzFAoNcTOiArfIyC3rbOirfZlQ80ienWmkqI5N7tyNC+bB50zUfrphNfHTGjTgSctVF8
 YohDnF9D3QS5cMaiwY6MdnQiIZ6MG3zQCby6cPpL73XHtERQOfmDjOLTeRzfMYuOz8Ke
 kWtRhsrhkRdOCxyr7vo1SxW3desJ71tLXPQGJE7GkzUDtAW3vMBkrvudHvcKtnShG0BN
 Kx3aDOunqdfcITwXTW3pyqLV5IW2x2ApTw8zlys5S6QFoH4xL8cwjOBAbgNJjSMowC5O
 5yexfwKnjQZv8hTaUFxneM33ZnCv0VzkFG7+kR5nWf4TgYIBDQX9tyjOBJoYWyimFAyG Yw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py77es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFVi2n127809;
 Wed, 15 Dec 2021 15:38:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by userp3020.oracle.com with ESMTP id 3cvnes2g32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KB9ecSTNd0QyT9srX/pOhO1ThwDBHeqG5Shkye5UD3GhBqRnznF6Z7hIF/LrLNa9vglVcjhI9ov8mj8nIFrwfKcOfG2edQlHtt+o+qZLrDo53mqKxzrhpoQIjMzoubHClCFT9NMfYnTmUa4f8Jv1h4tmcht9PRCX89Pkn9rTNzaWKW03Zhj0fxRYRlypaLlleQb/5omKrseNuqg9nU5n1pY9MAcfuTK4k+uQ7lckUgAagWBXDfSlmyaMD5ltnPTwyn30mNL8+9duo0vX5kCVczZztdX5mjPexC69SPudVzHY5y3bBvO0shUHGtGGKSjz8jbItV9gvnpTtsPDA5EDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=c3Oxds7T3uQuWx/E/30/wqM0VFPlH+DIIOHhn+w8T0zZ36PDuWdj537qGE8rClM5Eat32VW8p4PDl/wESJ4i97RPd3zoDqq7EVvVcLeeUInFf7+V16BEcPPZltN4GOljZFc4IIrBUiU9RRGT4DKOCjrGh0DPIoFzCRqhYEVf2iiwUo5YdxCjOMfk4GV7rcMcNSkgEAsLMqAOC7rv2eaTr7rq6UOIFw02WHb6zOhkVh8WrJtxosGjRe3JOjvafJSEuVCyAASXSomwj1jJas4PTY+L7UlgqjghcDeBS5oC+bHKF8dEO371SCf6sEM6jXnlIHdwIw/xmUnvU6XiraDuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=mNhihqYZvKc9X5XRoVrev8fK0tGs/UoS4BHdCPgBjptCzjOcxyCSGY0nZdSrjO4IczPPSPGymtJMsVQGpkoAvYxRWWC9hq/QUlH9xvv/AxiQaS1s9WLpvFx4HAzbKOpE/S87TDfo+rmgOyzlvS3W5dlZqAlY+pB+K+eco1GhIy4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2349.namprd10.prod.outlook.com (2603:10b6:301:30::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:43 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:43 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 08/10] ACPI ERST: qtest for ERST
Date: Wed, 15 Dec 2021 10:38:13 -0500
Message-Id: <1639582695-7328-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eecd8ec8-f94f-4e34-f220-08d9bfe0f9cb
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2349:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2349CC87CCA46A924058012C97769@MWHPR1001MB2349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EHpZ/kJ1TNqBe5Tbfs+JXpTywqcScu5RkL3xhcQQ5AYMHf2FnwKrcxKBwstxlroSbHqkC5Un5R5MT98as9jrDFGm6fnUecPecvu3pU7DE7Rwbaltj/09TBIcReeh7nLF7w2sHsn3Xs6F/3VJMLAOopv7sfyWn4hm9zz8feiBanP+bGOKwoAmoqW5FDZFDQ5Wh1sTtNpnlcfm2KXRpz3QjxM+jgOO4su4/hyl0M6DlbaoCiwcb8rXRALlCIw4kZ5KaiB/FWzmC2XEp+IEFGHw7ENqwkSib4j22RyYeGCDSozmeG/R71UAD0eZ02CIcVxtMW62ejGvRgBcqQBr34t/c/KOggdwcSKy5be7a/bxfXoWk65cZVFc2edcz8gy1pXyhcnrDSTs3xHwl3qoQu9DFy5zx9EvHoQZU2xCRX+lOncAqgiG3ilzA2bJTgG4b0b9hAUbcPkOUz0pJxTDcY8hKJZmQDxsTylZ8s993UNvwjNutzIoRwBJBQnlA5GT4GHVVhCthA/qFmRWdmW8JcjZcVERKykmJoNFaMgsdz6b0HhrWIi6UZo7ReUkTPAy60NsRSaTFaHpMzlLp2FPLSyR/lmVngt7WG06XBXap2IfOJyhzx1vkdB1cAZipYPjlnNO9Wg91WGIwN6ryBMJvZhw2XkpxKLNvWjtjyoU05Z2SpWavKT2G46EfPqt3uOI7Do/XZ5GFPDdxv8D25FeeqzNAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6666004)(6506007)(6512007)(2616005)(6916009)(66476007)(66556008)(83380400001)(5660300002)(66946007)(2906002)(36756003)(8936002)(52116002)(107886003)(316002)(4326008)(38350700002)(38100700002)(8676002)(508600001)(26005)(6486002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRYszf+0bWJ1DXIh1onsZ9TR7CwTQA8sfkTSQw4lNFsLHROb1olpXPDPLpKn?=
 =?us-ascii?Q?ywAuzMbBju2gkfk75KcqL3D5upibAeRkClu2ssYSCHz1BgkyeZ0SMLzmaold?=
 =?us-ascii?Q?whX9cDfi36vi6OBkO8WBkRvOGqcbXpAFAU1GyxfcC4KFXNLFMMt+oIUGCTO3?=
 =?us-ascii?Q?7hctQEWFiJu5VLYjA7HGKQs1t9UD98jSJuVxcNeJyNpk2GtKlJlx9fRp9xUu?=
 =?us-ascii?Q?uz6skfTd0QQFLcuugqEasewvcgs1jEfY7xCueTczxnMBuUxWkAw4da2ESvDX?=
 =?us-ascii?Q?qMJ+TvYjd1rAQoXsucCxE7m8IpOr9zXaXDmdxGIvP80UWenSg4xWJIHjYB7x?=
 =?us-ascii?Q?oIhpJfEDY9Cw2zto87oQsRRbTmjrAW3qLb2J+gnm+FfvKzoQtTa8yCyHJGbm?=
 =?us-ascii?Q?hvf4wsW5KCEPkkuIMjel7MgOOY8vXj6epkOgsA7TnPlVXF7IKx41qZ11/BFh?=
 =?us-ascii?Q?2HC9BufnjONzupVereZs0Dou8L6T1wzQAtr+PMzQX/fq2bHB78+z1EmWhrAn?=
 =?us-ascii?Q?V0gkq/lfkmOoWTAVs2FP7JYlwevWNIMO14Fv+BNKXAno6O6qePnqckA466Dd?=
 =?us-ascii?Q?xz3DrsuYh6RTFwQ/FinVaLWHrvKJlLbCwQkWqfjIiyrSr6Sh5M1BZxejQ22k?=
 =?us-ascii?Q?8lZMEezKx+XAVlbEDuOsr5avZyRMuJRMz+SNxXeoQpC5HT4pQth62U7o8xsS?=
 =?us-ascii?Q?b3X0EmR8QCRiAa9pzkMImwJsnCE1bMxBWoecRqqPYUo02KefT1U2eYfMNAbU?=
 =?us-ascii?Q?7Uf2ssp/f744XFgCwqs+sDGqoqb0LgCLMN/uV71yVHlayweYKBiEgUcjmKN5?=
 =?us-ascii?Q?Y5CHBQqp/YxqufT1EEJLCrqtn92ZxYQQ49//hKelSUpwvymq2YSfaHKu1B5w?=
 =?us-ascii?Q?Cgsfoztj5EbgQ3fwB9s6E2h1yM739wJZb2ULoZWcmK2s4gbaCD6QKgnui0FS?=
 =?us-ascii?Q?K920Zzs9W665ZGoMV405/LF5b92vMTcA+aXVNJPUqcwaVMihlxtsix25pG7c?=
 =?us-ascii?Q?yKADeh0s9NaDyOucYTp1IJml32LA8b1MC47c9j5rRDHmjO66+TX6+NaRoGOc?=
 =?us-ascii?Q?ZzNAYQXfY5zNMteI4RfvJo7nOm4hU8MfXE+MCWPiEsS9F4itUhMSAqcmTEWL?=
 =?us-ascii?Q?B5x2BhxAB5fwpoUxyFoRESue6x5/PbgVNmd+Sw+x6ptfVRj/NE8WrwIFkcqZ?=
 =?us-ascii?Q?nSWDlVXMPTuKDnsIp+rSAxln+QxpHlACsX+2206+qWx2TLcPDblF3WxdpBSO?=
 =?us-ascii?Q?cWqUPOgOOBrsqaPvv9Goep2SUVUG+b14xIzTEqL85ikTNveINfhQle5mATMz?=
 =?us-ascii?Q?DaJsrOecpkv7scYkntUokhZd3BstRXiec/8dkmMIllNF1SNF4UYOy9g5r0oE?=
 =?us-ascii?Q?pHxPG7o7wHLELVJipVsXIQoaPSBP0j1KbznhXf+KbHHPYIwBdJVrd9vb9M1C?=
 =?us-ascii?Q?vJ8VRIGX5MyciSDUFYxX7JzWoL6VXl4HUxXGOX+V7xBx9ovo06wQq+N06adr?=
 =?us-ascii?Q?Jut0VCPUfy60gQgH+uc9FSJ7RQ2xwxNKre2gmTxJVMcVa+pOmiPK1Tjmc1zx?=
 =?us-ascii?Q?L1ZcUkq0DMskAKVXKmfLGtnYHNcgb1m9G1AgcsA3GQZmRXjm1NS9zz0k6SSJ?=
 =?us-ascii?Q?4GP5S2Fzltg96yx9XsRpE/cIRcU8FNw1Id4a2HvnEli65OHNyOy2MCnKnK9a?=
 =?us-ascii?Q?bAeK0A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eecd8ec8-f94f-4e34-f220-08d9bfe0f9cb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:43.5513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbrxRfCVvPeuatuxvDDIVeoULs7U/i1uKD5aJcYQCMDHHUbMmb3Y8YbhSgGJNeu4svg0TyYYeY77JY1+qqXT1xYW34n0KUUKBcIV19hBDW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2349
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: nQ1vdC0MkxkS56fyIqjzeTh4xvXoZRQF
X-Proofpoint-GUID: nQ1vdC0MkxkS56fyIqjzeTh4xvXoZRQF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 tests/qtest/erst-test.c | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 169 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..370c119
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,167 @@
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
+static void save_fn(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice **pdev = (QPCIDevice **) data;
+
+    *pdev = dev;
+}
+
+static QPCIDevice *get_device(QPCIBus *pcibus)
+{
+    QPCIDevice *dev;
+
+    dev = NULL;
+    qpci_device_foreach(pcibus, 0x1b36, 0x0012, save_fn, &dev);
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
+    s->dev = get_device(s->qs->pcibus);
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
index c9d8458..4b01c22 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
   ['fdc-test',
@@ -246,6 +247,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1



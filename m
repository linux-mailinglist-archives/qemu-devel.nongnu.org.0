Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A646F2BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:04:37 +0100 (CET)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNmW-0008Sk-St
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:04:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgT-0008Ad-Oe
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:22 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgR-0002vi-Cy
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:21 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnCA2007294; 
 Thu, 9 Dec 2021 17:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=nWXispT+qErP8QZre6qqYQ+kdWip6vJQA1/FFEcxxx7mAkhJkASLFfHOR25gbt7YSVYT
 jvnG+xCz2MhK9PEur3N0eXJePTAdbvyW64IAyXxNEvdLIYoDaNR5HRN+BBZkA40UluzQ
 /htrPuV5g8kjh+ZiZMERQj2xWNa+XjAA92hK0CCPknZWVAp95XbqECUHlU6IRAHam4T6
 9ovJUOuY3xV85ytY3Na/BJPlpafR2PcRHxfKCpKfny4I3JYF7+0GTZLccUaIp5Y4pIwM
 AabV/MLsJ0d5ZWQMpMIBkTovsRSu/xnCoefcvD4wE9PJFx80Gm0RDzUioQ/zCiLS+e8q eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctt9muxn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpVEA189876;
 Thu, 9 Dec 2021 17:58:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 3csc4whmjc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEBOJC9UwFglwdWQF5ci2+B35yprWOzPRey340Cw8OUFvyKxDvcRY1in7f3fJVL4YL3L1mhZN/M0qY5WYF8TloqQwuXUHYH5OjrOTqNWEgg9t/zvheQHA3nExi+zS7yNshIJKpB9HB/9SzRJzkzlCzmT58TuJAXD16SUg64eKogar5JfL6T04ma+P7plfl5o1J13oA/OJh0ZgYLaHXMU29fxdgSGUQ8lLFl3z+9JpKwZA9qDlKwMgBLq3Pd9Ynei6GsVLSkqmOS1O/Wnys0xJc3RNHBE17YEQo5YqufkpiuRQUnNF91eDcxwKFxqqVCpTiU2xetdbPglimrYrUdmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=L41ls5dwHaUL8QCfNC4BpWCt/CBPexGcZ8/gICPkf8Lrx93yaS412ZUt9L9mqKSomNC08HEmaF8JS3fHKaYkoavnaTr8a6CAJ4icyImFb1NeHcbHyzIfN0qnxoEjZd9hcU6xK14lbit687bPs8ZR2MtOhUPW1apwKfMHHhBGJK6gYcNZ8VhMlb1vrV96dPDtlZ+wdptsPmeUmF9FLcHnRW1OLma4E8c6hCponBy3/auvDRLXIyjtfIPzaP1sPk1LJUZtF6RXP6nMaUWIvXCrs9IBJX7iyn9HKo05vW/z2BVfPS25qLRvqXkmsep/4S8rwExT/YxQ6zY4CUv0aDjlSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=IqTTAEoYxpuEleF+eNUle70PrJrjNboNUEqCJanbWtOJZdavicky7wUUFojG6RXSRmWln4AIC6e7Q0qRRQ7tFjgIuZCKslgCR9S90CCQHcymrBRJttQiJou2iFmLBTNwqE/mCgyfxw/jzGLOqBUphHZYCan16cbDQVuBvg2YsdA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1503.namprd10.prod.outlook.com (2603:10b6:300:22::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:15 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:15 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 08/10] ACPI ERST: qtest for ERST
Date: Thu,  9 Dec 2021 12:57:33 -0500
Message-Id: <1639072655-19271-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:58:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d428d65-1998-4b40-ff6f-08d9bb3d7933
X-MS-TrafficTypeDiagnostic: MWHPR10MB1503:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1503A3B0B899442E0206A28997709@MWHPR10MB1503.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eZj8HNTCmLgLnx37rxW9VyehnWhyvqgUED7G6UAxboy+lRtwAvThX0vdKIBM3PesBvSG+nQiSmcN+8s6/VHyt2hgHsBXi8VxXZQqqXiPB5asQflIhp4HTCdL77H/vhV768epqpNMCltjViFYCiHr92WzGR3N08NaPI3bkb61lWrij+lH8HfEOtRuRO1SnbjBnDLzn74AjLi36IxNy2LJfDLR45SLPW7po5L6gexvi2yoTRNNIWnVZ2HhEcVvHCsw8bGJYiWre5ymiyd5TncaaQ1iptp517bi2HCQ1D6R3ULRyKQkk87nfN4XYhlM9NrwAi6gYDzT0tAyL/pzJ1muCoJP6I82+x0Xqm5ZSTxLsA0WqlNyZffBdp0wYnBaXcZDl+r7TOMqQk6Qsg3oyMAJl4RfLzygLVzsrk8XP/Ny/RAeTdoY9jr8zitORbO080JPbUp/BJtYSoWwfZYrcY8Bmv0thRGs4ZBijVWfxFKWL5TBdY1CE9Yc8X+PaCbQqU+exj0ifNY8eKCm104gkRsH1zTcTFjRQ7IsxYzOJGGonb2xKU/BQre3xacFweT1jKSnuxsc374kiXJ7gOfylMEpJhkyJSQi/0D3FQpDD/x0/OGAoaVte2YTGZeBb/U4Uv4O5d0wnxAq/mCcZqCdwPw5HXSBzfpqMSZmdpcng7s4phc8zZ1szGVhLVVvE2A6pOGsizSY2S+cVmVnzy/MDBQlpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(5660300002)(4326008)(956004)(52116002)(66946007)(38350700002)(8676002)(7696005)(6486002)(83380400001)(107886003)(36756003)(38100700002)(66476007)(26005)(186003)(86362001)(66556008)(508600001)(6666004)(2906002)(8936002)(316002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y7+GuPrnxt803icaBFDmDOQSwEdnAk9s+DOnis2YaZYPXkjmpnSmRNUSspLw?=
 =?us-ascii?Q?SGX0WEPbZazG2W+kL+UIyqwYjgOoKG7AWnj59r2dvCib+hcyFpuhiAPMBuM4?=
 =?us-ascii?Q?gvAOP9eoJyrql8oq+lyJtWAbc44ho0gDUWiPOIBbNyDvnqNcwlaCQhC01pio?=
 =?us-ascii?Q?7Xr1T46rGFtBOnY+uDiHkatefGVQcwScFEFfnAaGNp6x3vxJZvO850mrqG7U?=
 =?us-ascii?Q?XxjDHBkngb98zS+7zSL1U5k4ur37QavRh9S3BXCRVL0NM1Ao0fML09PAHB51?=
 =?us-ascii?Q?9vQD5W4zWc8zKhPYBCd+jrUftZ0pl3eTwT5zlYKU7H+dsxpJ5YkVhoLwWt8Y?=
 =?us-ascii?Q?JgZWjzk4riMP2w01FHUZ4g+Y0CcQ1b5DXHXZwmeINV0cU02LBh+/v44WQcWC?=
 =?us-ascii?Q?DK55cE1cEAT7okFF2MBJIEocF6jfR/EWpVo0NlKF9bsr+6Ji8NM77+vnYhTl?=
 =?us-ascii?Q?uS2IA75U8AWsjvWkaycdAN2fAWCtVQe0Cf/DoyGLogyfdaon25CbdHdMXrg9?=
 =?us-ascii?Q?41SyFe6veVWW3figxz821CZrWYFW1qw187mBHKH25UuhfnuYGdyBJPf9wcog?=
 =?us-ascii?Q?TBfj8+5r2DsTX0Hz5X+YMNaMT7V8mMgsj98osY5OgSCxv4Pjw3hbwaqW88M/?=
 =?us-ascii?Q?NbkZ2RV7D8INaUHwogu7ZG2yOfDVxLEXMqXIxn/DqwPK/lwUoyK72HdtS0GD?=
 =?us-ascii?Q?Jl2Bs/yK8erUk8fcm+q/YuZ8TyUcWrHVxKgx048G86sMdcC9UQFEe6X1DpPa?=
 =?us-ascii?Q?bN0HTmn3lrx3DRT0hxJw0OPActjEbasdwfhE2Thk1XaCmQP84ASttc4CzGsc?=
 =?us-ascii?Q?XRjjDvUzYJOaXBTvDJ9hC+pKogPjCNWJLWdzieZr4x/DRCFktwSFj+WKOs8c?=
 =?us-ascii?Q?hOjhbvXFd1S9BWkMfhrIx0QQFErBk3I75FqJNOlafPJUp41BqNQFKyOnjgTg?=
 =?us-ascii?Q?5wNlJNx7207BUtrhTzCcbp9Dr42BIR0FPjoeBube7JeCa0fPA1+mTwia3b0B?=
 =?us-ascii?Q?mSAZlE4GJyqITujsgrvHqpM2Qc68DP7sF5rWrGzBABSpo22Wi157hDjg1jb4?=
 =?us-ascii?Q?Taien65c5TIC+CF+/Mutpvj0glSJnsdUuDy2HuuvI9SVIeZ8zesunz1YAo8C?=
 =?us-ascii?Q?XO3SewqIKRAoZ7e5WEG4kOWUJBovOViER6m72ItaDRDH6OrFLyQXwi7VQdxb?=
 =?us-ascii?Q?HwSYQs/hp511gDV23SbbiC5NwQa8SW1IPrn8DIRXJBbHHM7tszI1swGaer4P?=
 =?us-ascii?Q?xu5PnQBEReR5EP/Zd8quyo0AJbdh2XA3XjqJ4ODN0wf2Tm8ds93XCy0eiM3T?=
 =?us-ascii?Q?4TR5Id5XZTSw6fAHmZM6JZRChPG8dgQw+rRQ4/25QOSvXXpJRPIvMzZF4j0O?=
 =?us-ascii?Q?dqPZP5ki6+k77dQrUTpUlfPzFlt7H60FFmEDvdv7r5yddGFDMooIX6OiA4Gx?=
 =?us-ascii?Q?lx4GyZI98+9A/Mmz6oBoFsFsO0wlINAYUPE7a/s1sDA4YgnDcZfMnhZuqMYT?=
 =?us-ascii?Q?TUZ+MfyV5IJPxyW9/weCV2/oszJpx1nG///hwVKk39qD4wgZHJ0LtiH8OpDb?=
 =?us-ascii?Q?98mUaGYqVU5kSvcWDp7VmG7+3l2QU94ynnRqHjiv8y83+6kAU7hgbHTjBQfW?=
 =?us-ascii?Q?r6vtfJUL0MtZNs8hvhbdpblsMft9qoG1Ndb/RHI0v4af8AwMFaV8KcnkoecY?=
 =?us-ascii?Q?/zm4xmr2UmnfdkdE7wInBs2OhcE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d428d65-1998-4b40-ff6f-08d9bb3d7933
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:15.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS+Yrvz+okZm6o1rPiMSPqWENlvzIBgQe9ca7BLCouKFWChMXclZDbqWryK23d9S3n2XtOuR+YoTVgdfmXlZOZI8SieFt0TzEkZDBizN5uI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1503
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-GUID: 3D2p4BV7UZKSATpLyepRw4k1G43hU6Xw
X-Proofpoint-ORIG-GUID: 3D2p4BV7UZKSATpLyepRw4k1G43hU6Xw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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



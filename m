Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB7A3144EF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:31:12 +0100 (CET)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Gvv-0002wi-E0
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc3-0000ny-GJ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dbx-0002iB-LS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:27 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118Kv5HL009842;
 Mon, 8 Feb 2021 20:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=j6BRnNCZQPhjjgJ8pvPJxU5tO9nSvEfSiPyzTiveAcE=;
 b=lluu5vA8+v8urEgVBs2NY8wB68sbIP6jLviQVBG+BoeZKfnEJ//b39gNPv/8M0KkGqIP
 JGf07GilgETQdPNNXAlnSEfQmk1FQFuWsaTaE/bhTKAbtmGERvymsEytJu+XZITlInr0
 nDIpF+oSGHUGOHbVFv8CsT3/D1qcV6yRwlI0z57ZuN3waQFt60+YfPXXtAHglY27ehit
 GnymHfD88R/tqQwQD0IWHUjymv+A9YKl3pimXBDU8QfpBDbHr1X78UmxcrwMcN7u6i0A
 bx/n2W+fwcXxhvCj+RbfPHLDDjh3PMq40fe/Y/KI4qd8dm3RQ/xGSZ60OR2wgt+4e89s Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36hk2kdc5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5q7M157095;
 Mon, 8 Feb 2021 20:58:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 36j4pmtyjb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWu4dYRtAWxmuxIRWaCVvrXFSvj5zpSK6TVr/aNZf8H3muwzpTEF1AGt7JuzcN2eoxK1qUiKlL4csHeqwZ3vjlyOY4SeoOLDAXROoUwh4XXaEIZ7rgf+M1u7BVYgYKvWTTr8y0wbSAlAVodhwp8+t0Q2OKDGbz3IBB2lSbP3wa7zMrCPRx2DTRJScqBMYoKWzzYYL+1XefZZoLzSDXlE1CoWyc/NerY613hcBM7O+6Yb1gBgZ8pIaqPieKLRfeJKzlbNwtnBbCAK2PuLhboYwn8chBTwNLMXv6lHTMRVgfQpUg7kusL4Uao17VF6HiG5kXQLRxs2azGw0BtBOvkqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6BRnNCZQPhjjgJ8pvPJxU5tO9nSvEfSiPyzTiveAcE=;
 b=Eh8FDhCv96+Ey7V7UswYPjXxx3kgUcbi5VicBleaJXMGM9NZU6occ06W7H3ve09xL0enkFS0U/G2FX70Lq+g+qithHzhp+BHkYN/2sW5TMM0eoNaiy62b5FIr0c4V1l7vs5W9YPyE4llHue56iA2HDImHufuaY8xO+tVBJwrcy+BKjfVuhWNjzfs1MGn0W+40u2Uq4aVAtTiY0rYeeh3hew/uRMbvyEtTpnQdbLn6GwgvWOmyhpdZAm6YkK6/ue0NmM7X+QkLaHA0TPl/+WA8snvxnY0fcJfXT2F1KUl7Xt5oNk+Wp5E1a/XCH+tAm/Mkw71jfUyOTxNxEpqLpPktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6BRnNCZQPhjjgJ8pvPJxU5tO9nSvEfSiPyzTiveAcE=;
 b=Y/WuPKsyeMSActbGnfc4QSANM9LHPfHVpd6bfNVNJvnrDy7yFPJwzJNWgPM+GDiJQFfXYe8qv8XAKwex60UDs1OEBG8gnvBtlRrW6ndcqcO+m5T3vI4GnYKbevnKLqxA+WkaNDfZrmTBSsI6Y7xYHS6HcVaOInwA+zXri+4bdDk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:15 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:15 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] ACPI ERST: header file for erst
Date: Mon,  8 Feb 2021 15:57:54 -0500
Message-Id: <1612817879-21511-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cca0781-887b-4fc2-13d7-08d8cc744111
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB159947F1314021A0DB546D84978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEC9pdn2k1MpEtsFhZVM2dSYzDBS0oO6m2iPgyPM2eMOYcfeNNABRlG6bm/SPwJ3mkkgZUJR1+9iFjp54uBmLWLPLDG4huE7pqMJAU1AtBG4JU7i8L+A25mgNzM+h1SI/7Vfd3sBMQuuQaXuPmY0ryWYVFTFIehI8KBPj+BNtk0jf0hWZsMjLnGzbMmq/6jaOy8yUdwCU6KKmNPVfwVNcqLAAQWe7WLVPm3ETTJ0UoxseRxgc9GZ6G9QrkkdZ1Dsm5phIvNkuzuJ/9wBRHiw5appX8TNRysyb2lAGBmXrNdhQLZifqTdAejuP5QlvLOnDNGVGiFuMgpbG8c+1F1OUS4VBprl1UiNjBZA2sOEO0Zl+q7RqYusaAR5l1MwiSvLZ6DZf+MvlyoIBjs3ycmqQpj2d47tBXhWTedohrE/kRypGe5o1NNHE7fLWocShRAMt11H4std8FLQcJ8jRPIO/IHAS/BwkZF31u72xp5a8XxwfQUrA3TapXTSiuIuykzMrLwMUJ+EehL0y69IWxpva7FMO8fQfr1ckVGa/e7tEpz7EU7d4VnH9b+h6ovYS6GKXsUCFZrL2mi3RvxqtdXKIftq4eR15gshHwNRyRSpik/8W96NjpwqDasG3XzoyuLhbS+1zl5mXd5tPxYIv70g5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(5660300002)(478600001)(66476007)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HESCG7RDqLYueEulU6dWnwNIp1VbxNmbsdTrd7Jrwx85CaweSAl9AACRApVB?=
 =?us-ascii?Q?aunoM3haVweY7s6UoWjYlJTtDnSdyCtby1YQ0d8m58fxhfkO1/Qqvhqd9n6k?=
 =?us-ascii?Q?0P+zvYVzjMchxL8IEigCip0itfC/HYWn05CoP/X6DSyYCCZyRVq9LVz2OBRh?=
 =?us-ascii?Q?j8hwKkqwaWpZuME0u2vq/UWgzl27ejh341eNBefLOqSI3HVmw+3aIYmtxxh3?=
 =?us-ascii?Q?x8H6h2xOY12DXAurF52NzrxNPT0XDKEC07jejRfOBuJ2oCkkF85GZhrMDjYz?=
 =?us-ascii?Q?bm3Bibk/Ce5sm3jN4AoczeCCfRykFB4flXrpVBXZvLBG1sjevy/dqy8oIgJ6?=
 =?us-ascii?Q?80LFVeDD5hqHXckEtEJr4cD+T3PXf4l97EaXfZULMrDZB50mXffLi1zJFgND?=
 =?us-ascii?Q?nCdDKPsCR6hsf0Tn2rB0dkvZZMnQrw2E9OkW1V9Jfiitb1VZSpAFImmG+VaH?=
 =?us-ascii?Q?U2qacDKudm1CYkvjantbEfX7re/Pv2pG1qmxrPLjUkR5ImuJg2r4OZhqaT6w?=
 =?us-ascii?Q?Y5rRRQHw2TBSI6xnnDAZrTbv5/WIoVjcg2QT7gUQALk+XMA3UlzDKhNCH/8D?=
 =?us-ascii?Q?AkwwWiTMtgESFhrsRMTPK1TMiC3ozUcQC9VRdghmS043zFbjRyvaFGBMDiV1?=
 =?us-ascii?Q?KjjbhmW1G4l/40IQ++5in7VQ10wo//TniNc+5RfgFv2/Xt3mAK9533M0y2ED?=
 =?us-ascii?Q?KBQsXVaR9dqmG/zgywk3UnVUjgF4M9zT9qPDU0CFh8f1J6c1X4TezgATzW8d?=
 =?us-ascii?Q?Eok0Kmcs2aTU1kik7c+aGJgBDR5QrGUa99+ySebWQzdOoyzjAAxqxzcDzhuV?=
 =?us-ascii?Q?2bxcohWZExibDNXteFHxlqDD+SigscSmtBjbpLHg/wSzTTgGlKkx9hPR8nAL?=
 =?us-ascii?Q?+MuIjMAkofg1mKQB3HVHjO/Whi3TXztXfmnCRnblj/ylEmcS3M+TzwM5nKgw?=
 =?us-ascii?Q?4IoaSrm1Cx6SKOoVdgkvRqW/enGwc/Y8ljhJXQQJJFw5329eLOFnzQ886V/Y?=
 =?us-ascii?Q?g29RHi1JGvWomkO69iCYonQLK2QseTV7Bos1U4NnJuMqA+3h4RBSo3xTuljL?=
 =?us-ascii?Q?T5KC46DOrsKsgZjNbaJbWWGLP22AAbcN2nmiNNG2jWPRHt8cBceQ+ki+mnHH?=
 =?us-ascii?Q?OUO16lSqhIDUWv7Hy63Jp3FAZTXFAgDsFbjYz/Q62qpwJ3eebhsI1choUa5a?=
 =?us-ascii?Q?jE668lkxs+SPjkCEK59AJ+T9u2MGhNVkchaWridML0Bv3zKSSbuWHnHrWN0y?=
 =?us-ascii?Q?98pcIVq4NQMvefhi7mbKmBhmyALM+ivNL3MWFX8uZEgw4GPOx5SfiHXWnOab?=
 =?us-ascii?Q?yL2ZXn+9uuLxOSKsOP77mP3Y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cca0781-887b-4fc2-13d7-08d8cc744111
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:15.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wuZxZKf58X8+FF4SrUyBUY87tF2sad0Ps1E3QraRpyuoCcY7/BXNfFF1zWhluVKmFGNOhajH5KHdl4/eys08aP6ui/ROuu4E4mlp+mC6gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces the defintions for ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/acpi/erst.h | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..be9b3fa
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,77 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ *
+ * See ACPI specification, "ACPI Platform Error Interfaces"
+ *  "Error Serialization"
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, hwaddr base);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#define ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION         0x0
+#define ACPI_ERST_ACTION_BEGIN_READ_OPERATION          0x1
+#define ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION         0x2
+#define ACPI_ERST_ACTION_END_OPERATION                 0x3
+#define ACPI_ERST_ACTION_SET_RECORD_OFFSET             0x4
+#define ACPI_ERST_ACTION_EXECUTE_OPERATION             0x5
+#define ACPI_ERST_ACTION_CHECK_BUSY_STATUS             0x6
+#define ACPI_ERST_ACTION_GET_COMMAND_STATUS            0x7
+#define ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER         0x8
+#define ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER         0x9
+#define ACPI_ERST_ACTION_GET_RECORD_COUNT              0xA
+#define ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
+#define ACPI_ERST_ACTION_RESERVED                      0xC
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
+#define ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
+#define ACPI_ERST_MAX_ACTIONS \
+    (ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS + 1)
+
+#define ACPI_ERST_STATUS_SUCCESS                0x00
+#define ACPI_ERST_STATUS_NOT_ENOUGH_SPACE       0x01
+#define ACPI_ERST_STATUS_HARDWARE_NOT_AVAILABLE 0x02
+#define ACPI_ERST_STATUS_FAILED                 0x03
+#define ACPI_ERST_STATUS_RECORD_STORE_EMPTY     0x04
+#define ACPI_ERST_STATUS_RECORD_NOT_FOUND       0x05
+
+#define ACPI_ERST_INST_READ_REGISTER                 0x00
+#define ACPI_ERST_INST_READ_REGISTER_VALUE           0x01
+#define ACPI_ERST_INST_WRITE_REGISTER                0x02
+#define ACPI_ERST_INST_WRITE_REGISTER_VALUE          0x03
+#define ACPI_ERST_INST_NOOP                          0x04
+#define ACPI_ERST_INST_LOAD_VAR1                     0x05
+#define ACPI_ERST_INST_LOAD_VAR2                     0x06
+#define ACPI_ERST_INST_STORE_VAR1                    0x07
+#define ACPI_ERST_INST_ADD                           0x08
+#define ACPI_ERST_INST_SUBTRACT                      0x09
+#define ACPI_ERST_INST_ADD_VALUE                     0x0A
+#define ACPI_ERST_INST_SUBTRACT_VALUE                0x0B
+#define ACPI_ERST_INST_STALL                         0x0C
+#define ACPI_ERST_INST_STALL_WHILE_TRUE              0x0D
+#define ACPI_ERST_INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define ACPI_ERST_INST_GOTO                          0x0F
+#define ACPI_ERST_INST_SET_SRC_ADDRESS_BASE          0x10
+#define ACPI_ERST_INST_SET_DST_ADDRESS_BASE          0x11
+#define ACPI_ERST_INST_MOVE_DATA                     0x12
+
+#endif
+
-- 
1.8.3.1



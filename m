Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C93B891C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:19:31 +0200 (CEST)
Received: from localhost ([::1]:35686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfkA-00069J-He
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZD-00070g-0N
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ7-0005nA-Em
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:09 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ5Ap4024024; Wed, 30 Jun 2021 19:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=DqEajVCTSWeDyVWL7iUwk61lwPCxg+haitGD64zVn0A=;
 b=XMPhlN5Xtz4bH0o+E8OH0IozFvVomb+IOPAYgUhVY5/5j6GxDOkaBd41+S4WBE2myXQP
 Osl0UT5QZy+7E0SSaNCKFgmuR3rRmc35DX5gVbUT4PEx50O5s9ol8W/ouLOE5dEqvZWf
 9rXtMEbp2cHVycfWU47rzxz6mRabVgN1nc0taCxLruYN9y4wEtNMe6rOC0UiuXQjkmpe
 OOlp0aFnZeXyREy4IWJhJ4IOT72Zv2qoQcj8lL21koYhTrugSQRr9nFQARWyyMe/xyia
 +SLi/n7MV+Saq269G9MY6QPKp0oOZTPk49TtdZ0CjiOqR/PzBdtOMC9ialRUUV3OUX5F EQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39grmaruup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UIxvjB089823;
 Wed, 30 Jun 2021 19:08:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 39dv28kymg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzHyMbKA739u3/mbSF0mVCUF1I5S773k6x5lzQVTVEoy7RjaFKmFaqJFHcVR32rjiJjxntAhyQj6MssbAadEsaPzmmlKNfnJLt7K4FxeQPqHzmo7lLElZAQwZ/+l91PKBwkZHGgaaE8cnkWDQJYAwLCzTEDq25tIc9nvV41LSda+0miuTo8xSokPO67Qj3gmtiSM/ImqRWZPR+FBHf0d3izL6Id0Bsx8mktQ0izftwqDYYU7XiGmwl9Jc3YTdF+Mh5NNiLuJE7Ha+N4TcbsYwYqFOdJGWh25MxOsQzEYciCTQ5qAfw4a0FYL4dB5RtCxPAKX4WcTuqYeD8QByq7Bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqEajVCTSWeDyVWL7iUwk61lwPCxg+haitGD64zVn0A=;
 b=e8x/ln79yGb2313zTK8vW4ArADRGLUr2lCkgAMb+nnmFg5/MQXBxWGTNNt9zyoaNbit1TNM+zPhvKTZ8q1OhGgMlzgyjH6iM4m7JvXlY3ZmK7rhm7gGaaYKYpxwGeRpUdEeBiZWHA/fWvc7bpmCr1RYWTkl86WRyJTMvkWCbx69OtQ01JK/9dBY8GBjucRShMtj3sUoEkzpskXw68xyv1mUd90NlWgS+/hB22YQo5pGe5d+9Jz5cJIWrzRbKtioud29MGpFnqcbW+3xkbB5gNFHma1wfntv7+kzz48+TJYNPILInfQdkwNzLELu5whhLZio5Ngn8CSVKtQ/X4eaQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqEajVCTSWeDyVWL7iUwk61lwPCxg+haitGD64zVn0A=;
 b=BsfNCXrx+Bb1vURIoUY+RmvWhoM3USgtuur4n3uk2fmf41dkngctuesuij7orXvloTQE3v94mNa0ZvvUCJbjx1ybskF2YVipIjnAHZlllBryxnx2HKbX9wYm10hYGcBhRUCvTt7uMeBhGWvmbCnCJZDupA8hr/LQYuW9uEW05p0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5473.namprd10.prod.outlook.com (2603:10b6:5:355::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 19:07:59 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:07:59 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
Date: Wed, 30 Jun 2021 15:07:16 -0400
Message-Id: <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f098224b-4f6f-4de9-5e50-08d93bfa604a
X-MS-TrafficTypeDiagnostic: CO6PR10MB5473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB547334E70A2944310FF7E03297019@CO6PR10MB5473.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kbzAIshC+oGN3Uk8Tj2Hi3EYOkhpfxsk+Nf/fV78mgcHL1Oq/MvERO6dfS6dy0H1Q4FA1CXQlC9dYznjJghIQxd1R+Q8s5YkKwQ1Ir2wajjLTsppxewibzqsgT3gx/yd27B6Yl6sviGtFjD0iGgIGA1hFtF9hfBdKB8DTccvN7ITWRO3tqrEObrQv66sRqXD8/YgH+Gat93GaBXgh19kHwliKlgzcNfnzCv/G75KVXJTSDRGFhxydMANMYvNad5o0BY4Q9Jv75sa9RGNmeUgtqvbJLTIu3PXbFMgCHmggMGatGwEYo7sK1/Rp0ZTgKnGivQQAIjukghElFFSyMa22PES2GTd14gH54txtoxszGPRSPveQ3YKEOfedJdIXAa6c8xCr00jYXCjkGvZf70gLPSG9n5+ovK9Qx9ClzID/SN47KWuFBs5r9wywdcV+sy3QU137zdB5cZRssDTrxGpDF4iDFxL/ZblhCkqfrKRvm8dkHCCld5paJsQjRqJipbe8MmWh/HSNFZApndPwpp5FEZeWoyb2Xa5cHwd4ENmgzSFZf2e2VcH30xDwc9hfQmsCDHNj92JvUjWUE6yc5LOBsBfxkj9QmdNn+JFJ/ovDnDUfZg5dOs01zFq4AxVOg5NlQpRayrOiOHXXYFjP29VUw22uGPkRkMT7AkDJ4mpHNmSxTVUvErIPhzK7l2G4fSxjNUoe9rbqayn4cxSTSJrmsL6tmarwuD/tXuQSTMz6N9cB+cmVBXfy7Z3NxDIOZY/KEQnz/5t7NlW1F4hFaFU9q8nKtpO/hkhMZbHmVFcQR4yTPuS18IoU70TfAnLLPygp93cVq3XEPD7X8LqXJ0dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(396003)(346002)(366004)(107886003)(30864003)(2906002)(83380400001)(6666004)(66476007)(66556008)(8936002)(6916009)(8676002)(66946007)(4326008)(2616005)(956004)(7696005)(86362001)(186003)(16526019)(478600001)(26005)(38100700002)(38350700002)(5660300002)(36756003)(316002)(52116002)(6486002)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?79ICvtSCk+mSW+qhkci3/Zn+K6/5LmMs6rc7DP7LKQ8DMa4mfkIQLsvuRM9d?=
 =?us-ascii?Q?RT1P3aKqoO0JMgQwoLwr6duufBNyJ/By7KyPi5EVhW0ftvpogPjUXOh25ZL2?=
 =?us-ascii?Q?TOJ11bDtAHpTPuVQN+UGsnTZvCO6p9H/uk2Nzsd/pLCt3bj2/lxJrOmtrwrq?=
 =?us-ascii?Q?23Kpu1euZ+s3Nl4Xmrg5249MAQw2FcPoRaeTY3MGSR4WNB0rPcG6KINSfrRe?=
 =?us-ascii?Q?KeBU9d6RL1IiE/W/sSvowEcjkehzAddj23nDn6J8gijH3sDkmJtoz7rzFI/q?=
 =?us-ascii?Q?M2yrEpL/YHJ3r9xeFg9dktL1ZPELzRh0rGt1S2f2Av6zqcnXApGDPN+J0pS6?=
 =?us-ascii?Q?a8OAC7p1/5XGm0QeeCe5d3ZHlr4EjgSwWSAOgYr3W1nurBI6r3AXdcOaroo4?=
 =?us-ascii?Q?q1fyMXbzKpL7sCi4RjT6u/rfSEScvqxuOmnvtaDa+j8yjbWfzlxBwQuGlJQ9?=
 =?us-ascii?Q?NGRJ+ta+FrhATjUIsnkm0sUdP393bJa8e+CpAOYswcDaYAkCw+RDLWwyC2/Y?=
 =?us-ascii?Q?j4QqoTEXuXQIpnzsIKdYwFLx3KaGjBnI8k8VNSNduqEtFbCGCoHkYDu1+dJC?=
 =?us-ascii?Q?jM0XeZycIUrqA+f3vHwxzZ6QlSf2VSpaICPGGh7stUMPVoaXcSuOCKkoUXx+?=
 =?us-ascii?Q?addZNcB9rUzHndNwO0+CkYupbwatkjiSBAtf2pO/C4S+p3RjVSSoEJ0veLGy?=
 =?us-ascii?Q?Wr2xZF00pR5YG3vv2tOZH2CjOACRtSkAstz53tMdh3rBAf0Rqwe4lbTND09G?=
 =?us-ascii?Q?gbVsw3d3r6Y7h9JEFhKGbXjdMvoyJDdmUbqKGGdchvmWBxH8ewDGl5kXJPuy?=
 =?us-ascii?Q?IewKIKS4PRXxZv1AIdXH0LGRj3cZJwPaCzZA/DZvDdH59lo+El6G2y6IV0Jo?=
 =?us-ascii?Q?7Tp+d2fwZbmlgEpeERD0+RemcTeo0Zvjs9xsvI+rn3ppfdKCfrwsHvN6Dag/?=
 =?us-ascii?Q?snV/mDEVRWQBZLT07PGzQmUe/M20KLuFYFXdrsLepaXw5/EYUjgdR0Oa99BM?=
 =?us-ascii?Q?I9EaLQW1NVBHKqZbFz3v1kO1B4ts70gSb//zWU6FcJbafxmB6EhuPimVcfk8?=
 =?us-ascii?Q?knPUDs7Td35UtlNEPx0oj6W4Tq2MBtm2Wu7PQEJs4PpdZq3XsOGthS5mvXHJ?=
 =?us-ascii?Q?OjnMA8buQVF4yGhqjFEOPZAk2mZM4b3rCY8c6IhihH1+W7uTs5Czs114Uju/?=
 =?us-ascii?Q?Q624GAy+2DLvAwqNSROocqbnWalGhJe82+xUVWPH/Db2pSM4IeY8F7eDa+/3?=
 =?us-ascii?Q?njYSG+fXz53vd8JMuDycNvD/oIjMWNjbaC4IvweJVG9qWSHM8v5kGkfYN0jX?=
 =?us-ascii?Q?ZgIYILs9wCpUYaveSO5iW/7F?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f098224b-4f6f-4de9-5e50-08d93bfa604a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:07:59.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/d/seBuLIb4WysG1x9dFPXjU1xJMK3N8adzWwGsHHlNof3W/A5ujyPcbYMQl1fEyqzQNJF4+enfQihgxK6GpFmr/gZuAzEkYSDhrZ0ca54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5473
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300106
X-Proofpoint-GUID: xGpfOnTFxLuJEfLPRj-Zgf-dy75wxW1B
X-Proofpoint-ORIG-GUID: xGpfOnTFxLuJEfLPRj-Zgf-dy75wxW1B
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change implements the support for the ACPI ERST feature.

This implements a PCI device for ACPI ERST. This implments the
non-NVRAM "mode" of operation for ERST.

This change also includes erst.c in the build of general ACPI support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c      | 704 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build |   1 +
 2 files changed, 705 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000..6e9bd2e
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,704 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
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
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-core.h"
+#include "exec/memory.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "exec/address-spaces.h"
+#include "sysemu/hostmem.h"
+#include "hw/acpi/erst.h"
+#include "trace.h"
+
+/* UEFI 2.1: Append N Common Platform Error Record */
+#define UEFI_CPER_RECORD_MIN_SIZE 128U
+#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
+#define UEFI_CPER_RECORD_ID_OFFSET 96U
+#define IS_UEFI_CPER_RECORD(ptr) \
+    (((ptr)[0] == 'C') && \
+     ((ptr)[1] == 'P') && \
+     ((ptr)[2] == 'E') && \
+     ((ptr)[3] == 'R'))
+#define THE_UEFI_CPER_RECORD_ID(ptr) \
+    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
+
+/*
+ * This implementation is an ACTION (cmd) and VALUE (data)
+ * interface consisting of just two 64-bit registers.
+ */
+#define ERST_REG_SIZE (2UL * sizeof(uint64_t))
+#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
+#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
+
+/*
+ * ERST_RECORD_SIZE is the buffer size for exchanging ERST
+ * record contents. Thus, it defines the maximum record size.
+ * As this is mapped through a PCI BAR, it must be a power of
+ * two, and should be at least PAGE_SIZE.
+ * Records are stored in the backing file in a simple fashion.
+ * The backing file is essentially divided into fixed size
+ * "slots", ERST_RECORD_SIZE in length, with each "slot"
+ * storing a single record. No attempt at optimizing storage
+ * through compression, compaction, etc is attempted.
+ * NOTE that any change to this value will make any pre-
+ * existing backing files, not of the same ERST_RECORD_SIZE,
+ * unusable to the guest.
+ */
+/* 8KiB records, not too small, not too big */
+#define ERST_RECORD_SIZE (2UL * 4096)
+
+#define ERST_INVALID_RECORD_ID (~0UL)
+#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
+
+/*
+ * Object cast macro
+ */
+#define ACPIERST(obj) \
+    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
+
+/*
+ * Main ERST device state structure
+ */
+typedef struct {
+    PCIDevice parent_obj;
+
+    HostMemoryBackend *hostmem;
+    MemoryRegion *hostmem_mr;
+
+    MemoryRegion iomem; /* programming registes */
+    MemoryRegion nvmem; /* exchange buffer */
+    uint32_t prop_size;
+    hwaddr bar0; /* programming registers */
+    hwaddr bar1; /* exchange buffer */
+
+    uint8_t operation;
+    uint8_t busy_status;
+    uint8_t command_status;
+    uint32_t record_offset;
+    uint32_t record_count;
+    uint64_t reg_action;
+    uint64_t reg_value;
+    uint64_t record_identifier;
+
+    unsigned next_record_index;
+    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest */
+    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation buffer */
+
+} ERSTDeviceState;
+
+/*******************************************************************/
+/*******************************************************************/
+
+static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
+{
+    /* Read an nvram entry into tmp_record */
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+    off_t offset = (index * ERST_RECORD_SIZE);
+
+    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
+        if (s->hostmem_mr) {
+            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
+            memcpy(s->tmp_record, p + offset, ERST_RECORD_SIZE);
+            rc = ACPI_ERST_STATUS_SUCCESS;
+        }
+    }
+    return rc;
+}
+
+static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned index)
+{
+    /* Write entry in tmp_record into nvram, and backing file */
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+    off_t offset = (index * ERST_RECORD_SIZE);
+
+    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
+        if (s->hostmem_mr) {
+            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
+            memcpy(p + offset, s->tmp_record, ERST_RECORD_SIZE);
+            rc = ACPI_ERST_STATUS_SUCCESS;
+        }
+    }
+    return rc;
+}
+
+static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
+    uint64_t record_identifier, bool *record_found, bool alloc_for_write)
+{
+    int rc = -1;
+    int empty_index = -1;
+    int index = 0;
+    unsigned rrc;
+
+    *record_found = 0;
+
+    do {
+        rrc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
+            uint64_t this_identifier;
+            this_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
+            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
+                (this_identifier == record_identifier)) {
+                rc = index;
+                *record_found = 1;
+                break;
+            }
+            if ((this_identifier == ERST_INVALID_RECORD_ID) &&
+                (empty_index < 0)) {
+                empty_index = index; /* first available for write */
+            }
+        }
+        ++index;
+    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
+
+    /* Record not found, allocate for writing */
+    if ((rc < 0) && alloc_for_write) {
+        rc = empty_index;
+    }
+
+    return rc;
+}
+
+static unsigned clear_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    bool record_found;
+    int index;
+
+    index = lookup_erst_record_by_identifier(s,
+        s->record_identifier, &record_found, 0);
+    if (record_found) {
+        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
+        rc = copy_to_nvram_by_index(s, (unsigned)index);
+        if (rc == ACPI_ERST_STATUS_SUCCESS) {
+            s->record_count -= 1;
+        }
+    }
+
+    return rc;
+}
+
+static unsigned write_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+
+    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
+        uint64_t record_identifier;
+        uint8_t *record = &s->record[s->record_offset];
+        bool record_found;
+        int index;
+
+        record_identifier = (s->record_identifier == ERST_INVALID_RECORD_ID)
+            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
+
+        index = lookup_erst_record_by_identifier(s,
+            record_identifier, &record_found, 1);
+        if (index < 0) {
+            rc = ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
+        } else {
+            if (0 != s->record_offset) {
+                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offset],
+                    0xFF, s->record_offset);
+            }
+            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_offset);
+            rc = copy_to_nvram_by_index(s, (unsigned)index);
+            if (rc == ACPI_ERST_STATUS_SUCCESS) {
+                if (!record_found) { /* not overwriting existing record */
+                    s->record_count += 1; /* writing new record */
+                }
+            }
+        }
+    }
+
+    return rc;
+}
+
+static unsigned next_erst_record(ERSTDeviceState *s,
+    uint64_t *record_identifier)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+    unsigned rrc;
+
+    *record_identifier = ERST_INVALID_RECORD_ID;
+
+    index = s->next_record_index;
+    do {
+        rrc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
+            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
+                s->next_record_index = index + 1; /* where to start next time */
+                *record_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
+                rc = ACPI_ERST_STATUS_SUCCESS;
+                break;
+            }
+            ++index;
+        } else {
+            if (s->next_record_index == 0) {
+                rc = ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
+            }
+            s->next_record_index = 0; /* at end, reset */
+        }
+    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
+
+    return rc;
+}
+
+static unsigned read_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    bool record_found;
+    int index;
+
+    index = lookup_erst_record_by_identifier(s,
+        s->record_identifier, &record_found, 0);
+    if (record_found) {
+        rc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rc == ACPI_ERST_STATUS_SUCCESS) {
+            if (s->record_offset < ERST_RECORD_SIZE) {
+                memcpy(&s->record[s->record_offset], s->tmp_record,
+                    ERST_RECORD_SIZE - s->record_offset);
+            }
+        }
+    }
+
+    return rc;
+}
+
+static unsigned get_erst_record_count(ERSTDeviceState *s)
+{
+    /* Compute record_count */
+    unsigned index = 0;
+
+    s->record_count = 0;
+    while (copy_from_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
+        uint8_t *ptr = &s->tmp_record[0];
+        uint64_t record_identifier = THE_UEFI_CPER_RECORD_ID(ptr);
+        if (IS_UEFI_CPER_RECORD(ptr) &&
+            (ERST_INVALID_RECORD_ID != record_identifier)) {
+            s->record_count += 1;
+        }
+        ++index;
+    }
+    return s->record_count;
+}
+
+/*******************************************************************/
+
+static uint64_t erst_rd_reg64(hwaddr addr,
+    uint64_t reg, unsigned size)
+{
+    uint64_t rdval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    rdval = reg;
+    rdval >>= shift;
+    rdval &= mask;
+
+    return rdval;
+}
+
+static uint64_t erst_wr_reg64(hwaddr addr,
+    uint64_t reg, uint64_t val, unsigned size)
+{
+    uint64_t wrval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    val &= mask;
+    val <<= shift;
+    mask <<= shift;
+    wrval = reg;
+    wrval &= ~mask;
+    wrval |= val;
+
+    return wrval;
+}
+
+static void erst_reg_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+
+    /*
+     * NOTE: All actions/operations/side effects happen on the WRITE,
+     * by design. The READs simply return the reg_value contents.
+     */
+    trace_acpi_erst_reg_write(addr, val, size);
+
+    switch (addr) {
+    case ERST_CSR_VALUE + 0:
+    case ERST_CSR_VALUE + 4:
+        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
+        break;
+    case ERST_CSR_ACTION + 0:
+/*  case ERST_CSR_ACTION+4: as coded, not really a 64b register */
+        switch (val) {
+        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+        case ACPI_ERST_ACTION_END_OPERATION:
+            s->operation = val;
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
+            s->record_offset = s->reg_value;
+            break;
+        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
+            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
+                s->busy_status = 1;
+                switch (s->operation) {
+                case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+                    s->command_status = write_erst_record(s);
+                    break;
+                case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+                    s->command_status = read_erst_record(s);
+                    break;
+                case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+                    s->command_status = clear_erst_record(s);
+                    break;
+                case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
+                    break;
+                case ACPI_ERST_ACTION_END_OPERATION:
+                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
+                    break;
+                default:
+                    s->command_status = ACPI_ERST_STATUS_FAILED;
+                    break;
+                }
+                s->record_identifier = ERST_INVALID_RECORD_ID;
+                s->busy_status = 0;
+            }
+            break;
+        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
+            s->reg_value = s->busy_status;
+            break;
+        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
+            s->reg_value = s->command_status;
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
+            s->command_status = next_erst_record(s, &s->reg_value);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
+            s->record_identifier = s->reg_value;
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
+            s->reg_value = s->record_count;
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            s->reg_value = s->bar1;
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            s->reg_value = ERST_RECORD_SIZE;
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            s->reg_value = 0x0; /* intentional, not NVRAM mode */
+            break;
+        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            /*
+             * 100UL is max, 10UL is nominal
+             */
+            s->reg_value = ((100UL << 32) | (10UL << 0));
+            break;
+        case ACPI_ERST_ACTION_RESERVED:
+        default:
+            /*
+             * Unknown action/command, NOP
+             */
+            break;
+        }
+        break;
+    default:
+        /*
+         * This should not happen, but if it does, NOP
+         */
+        break;
+    }
+}
+
+static uint64_t erst_reg_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case ERST_CSR_ACTION + 0:
+    case ERST_CSR_ACTION + 4:
+        val = erst_rd_reg64(addr, s->reg_action, size);
+        break;
+    case ERST_CSR_VALUE + 0:
+    case ERST_CSR_VALUE + 4:
+        val = erst_rd_reg64(addr, s->reg_value, size);
+        break;
+    default:
+        break;
+    }
+    trace_acpi_erst_reg_read(addr, val, size);
+    return val;
+}
+
+static const MemoryRegionOps erst_reg_ops = {
+    .read = erst_reg_read,
+    .write = erst_reg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void erst_mem_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint8_t *ptr = &s->record[addr - 0];
+    trace_acpi_erst_mem_write(addr, val, size);
+    switch (size) {
+    default:
+    case sizeof(uint8_t):
+        *(uint8_t *)ptr = (uint8_t)val;
+        break;
+    case sizeof(uint16_t):
+        *(uint16_t *)ptr = (uint16_t)val;
+        break;
+    case sizeof(uint32_t):
+        *(uint32_t *)ptr = (uint32_t)val;
+        break;
+    case sizeof(uint64_t):
+        *(uint64_t *)ptr = (uint64_t)val;
+        break;
+    }
+}
+
+static uint64_t erst_mem_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint8_t *ptr = &s->record[addr - 0];
+    uint64_t val = 0;
+    switch (size) {
+    default:
+    case sizeof(uint8_t):
+        val = *(uint8_t *)ptr;
+        break;
+    case sizeof(uint16_t):
+        val = *(uint16_t *)ptr;
+        break;
+    case sizeof(uint32_t):
+        val = *(uint32_t *)ptr;
+        break;
+    case sizeof(uint64_t):
+        val = *(uint64_t *)ptr;
+        break;
+    }
+    trace_acpi_erst_mem_read(addr, val, size);
+    return val;
+}
+
+static const MemoryRegionOps erst_mem_ops = {
+    .read = erst_mem_read,
+    .write = erst_mem_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+/*******************************************************************/
+/*******************************************************************/
+
+static const VMStateDescription erst_vmstate  = {
+    .name = "acpi-erst",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(operation, ERSTDeviceState),
+        VMSTATE_UINT8(busy_status, ERSTDeviceState),
+        VMSTATE_UINT8(command_status, ERSTDeviceState),
+        VMSTATE_UINT32(record_offset, ERSTDeviceState),
+        VMSTATE_UINT32(record_count, ERSTDeviceState),
+        VMSTATE_UINT64(reg_action, ERSTDeviceState),
+        VMSTATE_UINT64(reg_value, ERSTDeviceState),
+        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
+        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
+        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
+{
+    ERSTDeviceState *s = ACPIERST(pci_dev);
+    unsigned index = 0;
+    bool share;
+
+    trace_acpi_erst_realizefn_in();
+
+    if (!s->hostmem) {
+        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(s->hostmem)) {
+        error_setg(errp, "can't use already busy memdev: %s",
+                   object_get_canonical_path_component(OBJECT(s->hostmem)));
+        return;
+    }
+
+    share = object_property_get_bool(OBJECT(s->hostmem), "share", &error_fatal);
+    if (!share) {
+        error_setg(errp, "ACPI ERST requires hostmem property share=on: %s",
+                   object_get_canonical_path_component(OBJECT(s->hostmem)));
+    }
+
+    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
+
+    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
+    s->prop_size = object_property_get_int(OBJECT(s->hostmem), "size", &error_fatal);
+
+    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
+    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);
+
+    /*
+     * MemoryBackend initializes contents to zero, but we actually
+     * want contents initialized to 0xFF, ERST_INVALID_RECORD_ID.
+     */
+    if (copy_from_nvram_by_index(s, 0) == ACPI_ERST_STATUS_SUCCESS) {
+        if (s->tmp_record[0] == 0x00) {
+            memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
+            index = 0;
+            while (copy_to_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
+                ++index;
+            }
+        }
+    }
+
+    /* Initialize record_count */
+    get_erst_record_count(s);
+
+    /* BAR 0: Programming registers */
+    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops, s,
+                          TYPE_ACPI_ERST, ERST_REG_SIZE);
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
+
+    /* BAR 1: Exchange buffer memory */
+    memory_region_init_io(&s->nvmem, OBJECT(pci_dev), &erst_mem_ops, s,
+                          TYPE_ACPI_ERST, ERST_RECORD_SIZE);
+    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->nvmem);
+
+    /*
+     * The vmstate_register_ram_global() puts the memory in
+     * migration stream, where it is written back to the memory
+     * upon reaching the destination, which causes the backing
+     * file to be updated (with share=on).
+     */
+    vmstate_register_ram_global(s->hostmem_mr);
+
+    trace_acpi_erst_realizefn_out(s->prop_size);
+}
+
+static void erst_reset(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    trace_acpi_erst_reset_in(s->record_count);
+    s->operation = 0;
+    s->busy_status = 0;
+    s->command_status = ACPI_ERST_STATUS_SUCCESS;
+    /* indicate empty/no-more until further notice */
+    s->record_identifier = ERST_INVALID_RECORD_ID;
+    s->record_offset = 0;
+    s->next_record_index = 0;
+    /* NOTE: record_count and nvram are initialized elsewhere */
+    trace_acpi_erst_reset_out(s->record_count);
+}
+
+static Property erst_properties[] = {
+    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    trace_acpi_erst_class_init_in();
+    k->realize = erst_realizefn;
+    k->vendor_id = PCI_VENDOR_ID_REDHAT;
+    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
+    k->revision = 0x00;
+    k->class_id = PCI_CLASS_OTHERS;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    dc->user_creatable = true;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    trace_acpi_erst_class_init_out();
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_PCI_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577..262a8ee 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -4,6 +4,7 @@ acpi_ss.add(files(
   'aml-build.c',
   'bios-linker-loader.c',
   'utils.c',
+  'erst.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
-- 
1.8.3.1



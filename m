Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D74942DA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:13:18 +0100 (CET)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJCg-0007qd-0b
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjx-0000GV-ES
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjo-0007Q4-Vc
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:32 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJgVKw010655; 
 Wed, 19 Jan 2022 21:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ne0x3EW/znUCIDVdfl4xc6s9TnTcOayv0rBdspSByh0=;
 b=kzmw8aGs84GoxnRtTxCzP/F6FP/1VkXHJgNfSfv9WtH05QpvG9vX5yd6SgZLZOgQ+ETW
 0hpcPICPDgVxjs4DAz9D8LEEZiYwX3pqrArw8fnZRcclzf0Y9I0B3Fw719jk9SHAfifa
 cKlP4vTTS9PEA5TWoi10/I4o58KoLJFkJtVlLCR1mAV+UOpSiDxG0AGfXnbdRkvkIBlu
 cjk97p7EIuOMhJQfH/2CGtyzeg7u/DgYVKqG4sYZKCQndzl5Onxh8NfCQPRpa1iVO9+W
 J6ibNWnwHNIf300CaaGd357DKRb2KAlhwlnnS58OKjas3urQq9Sn4OjxS2L07BDnoWSw ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc52xedv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaTuT030985;
 Wed, 19 Jan 2022 21:43:22 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by aserp3020.oracle.com with ESMTP id 3dkp36kg60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMGgn2umgpuYR9f8yR3T0o4UDTatztlqW9Vd0pbEdaTpiI8Tzzifga7aNMvaoTc3PDCLquSqssd5MhNwdK8jcKTJdeJtUDvqXvHS8hDE7SdYFSj3ERGBo1P7AB/fQXW6uQXIoo0MkXLactERs0Az90+Ixvuwg8FAC6mJV6bn75PkDrH1Sl/gOU6xHQwsX5ciHFtrikKtfbdYTEGQTx/zMMaEWUhP3SP1nkZstJa9JTm7FOnQiLXjzwXuZP76a4ulUSDF6z5bmROLEqa2yCxjlzZUj+HhIa3upZfswC30Hpg+wBvLFQIotUBp8otlFMhVWbo/poVQBAlJohvOVLo1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne0x3EW/znUCIDVdfl4xc6s9TnTcOayv0rBdspSByh0=;
 b=Hofq4tY8zFn1jGTCIxJFLeAR4FeZR2E77R9UkP2rkNi6wU6Q74vpnOcCel0Ii4zRDtmJ6FebgNynnfDMr8G8wnB66NsOXzJY2Ke/dm108CtiuGfsZrSRDd8CiRuFnSZb7lohOEJHQM5FUmOwFQrMKU2ltxlhcHt4wVoowPzIuu7TKBKZytU9cExE8yvVV8fJmSMtHbBGIW1FHR+tsFVlkDRHQT/7D9FolJLqMH/h6cm/vye7/+lZOoTgV7sQzx2UPD08IZgaaEDEYx3dhgZ/3p0Cg++Krp88p3dUHDyXQZk4J/tu/+jyc/Zx370RP3gGds7bfnoK4tR7k26EEc8pHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne0x3EW/znUCIDVdfl4xc6s9TnTcOayv0rBdspSByh0=;
 b=vzEmYLqR+Nlb+o96kA3Lt0SIXRtz50Fb62MHgcPWTxE6fVOQ9GEDWO0sb2Df5ecOYTRAvao5rpfC1fXMoKSjcSVFalhvQZFQhDGTtGOLp242LY9IrIRhDlVAQfSoKZdDi+MBYDKsFA3DxcYpdg9EZbfdEkylOuyhQfJ/rvlNCYo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1497.namprd10.prod.outlook.com (2603:10b6:3:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 21:43:20 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:43:20 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/18] vfio-user: avocado tests for vfio-user
Date: Wed, 19 Jan 2022 16:42:07 -0500
Message-Id: <f7280fecf94e4d77498af62b11f26a2a5043e5b4.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d708ac-3aa9-4f01-8c82-08d9db94b594
X-MS-TrafficTypeDiagnostic: DM5PR10MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1497A69589277C33CE122F0190599@DM5PR10MB1497.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4VdbMui4nApAr5cN7QT7q5iNUkb3Jy/aKSiR4xqrH1TyQl7XD8U5Jw+dafV2IPEAV3VAaN4wu6nnF37GWbJJXhoyd07TWks/VWHlQxwHGBcvR2xRsuft1XOyoXsEwm6kAi061gN3d352TrV0HUsv/WJ5MraTizWuFFqsA/t2K6g4/FuPQLfQI5vc65RWT5x6R775TPIYaaq4inbaP6/MX9pRR/hMrPRxlks6yUoxYfSt+20D2CLymsUpZKQMPXEIGphoq6nasGAr9HYnSZFgTJQDGadQeZCNmU6eNKOyKkbZoRY7V/f6VZ+2aKxfGATQ/OPabpiebHU3vpe7BQ7QwwZhhOHJOZeZkn9by9uuMbp9b5Tj23b5wgNeMcDrnNirG/rnBWl/WxOnrQp8CFkK4g7uaWBiRfxRfEbcK2jFhGeEqIUH8fpy5AyYa4s88Ji/xPDLsTfIqvxN4828fDXcsUZrK5zg+fUsIGCw44LKjSKBGpiXZEN9jQ/TiRyTwJsMZyGFuLspOcsZSCpK8FU9qFw52M0+kopEV8LJ8S9kMJuEPtH9OdvgUIpUTIqjAfk0dNOvUasOR3NXhxDkWawfVqE8jbr9DfXnGVuHDVarN8CEkpIQuRG3ZlaLXv2PCVaq+lWcgmWcpJE3LKMADrWvba0G0kxL+1oNdgMAgn8fK1lW0+8NJulV0IgvjTd8NuXEISeKbO7PuvoMQNDo5uHnTiCchdWVSDAxN1kcOWZVAA5YY1A/5nh3ibWgdoYybsGIsriFbg8K2Hd7P1l6XUbfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(26005)(5660300002)(2906002)(6916009)(8676002)(86362001)(4326008)(36756003)(508600001)(2616005)(6512007)(83380400001)(186003)(8936002)(107886003)(316002)(66556008)(66946007)(66476007)(38100700002)(7416002)(6486002)(52116002)(38350700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IrsrfB0wCl4EVwKH5RphdpCpLgncriWZIGdGZd06j4/MB7uMUzm0sy6Tsw13?=
 =?us-ascii?Q?BXP80fxBf0MeYvOr0MVrGQ5u0wVQIhFPH1YxfXMrYOHQJkNwnNPjQFbH53rN?=
 =?us-ascii?Q?Lbz0VOiLETsi2XxX6y3/1n1KO24neYoXmqAjKYI5V/RnEBqwvMTCf/XuZmKo?=
 =?us-ascii?Q?N9mTHjpIBQoP4l+k8nJaDM69kvuF9dIgdm+j8mfshJHom3k6lLnnC3noySTA?=
 =?us-ascii?Q?u22hMpNsjf9DMwtKKld12DVKbGHiw7+PRkvj76jwt8ZFwqz+IYiVzSmUVfkc?=
 =?us-ascii?Q?PgwaG5HivB4JN/IaeCsaK962DQ7rN4tL779vOP6Cjx5n2azNucwwQZcSAB+p?=
 =?us-ascii?Q?ykeHwI1ONgJ3dK86tvpBrLDpJfJNWlJxt3GYJBNKJtBS9abHytf6zFH6A/bl?=
 =?us-ascii?Q?Ib5rMk5nexYnYzRPZ5xUMc278t8bnIS5v6uHtuOHzNSVfrrVXIB2jVTxNPeL?=
 =?us-ascii?Q?3BnNKpqZjUN5tTjKXkB8NW49B8UFruEY3pgY9GkVJEkS59ETM8EN1QHStmBY?=
 =?us-ascii?Q?33Q76rrH7fy81Ei5M6apfIGT3DY2Z0NrJyzPMvdkpB1fzZG3lVmCT9XAc9jQ?=
 =?us-ascii?Q?0ITjdV4fz21flEyxoj3TLilk8eKnjxpM9fZnWQUVXp2e0AZs0CS9iPdrG95M?=
 =?us-ascii?Q?e3TO9DrMoxPWfUEN6oSPu15lgo/NuxLMXl4+/Xslepl9xtDfdT0OWh37sym+?=
 =?us-ascii?Q?LbyXBbPkpuESNeuVLmL/Av8rzoUosQGcCX2PWhWlB4yXCTw/8+dhY0EPcmWg?=
 =?us-ascii?Q?q6k/8d+0ohxbM4udGF5BJqRbn/V9jOl9mtfCKmKlU9XQdjUy9dhwuQakIkyH?=
 =?us-ascii?Q?AbcifA6yc+EWwx+NLEOXYRBNEeIkPEzUsNcvtoH423mDCEcQSQfFYVQWRq7Y?=
 =?us-ascii?Q?j2u8wxs8A1z2+44y0eGXBUZfDr9ok1RJ65ZS1H07DuffYo/Ot/0Gyq8rx21Z?=
 =?us-ascii?Q?+TwOgC0/f4AOUjwGnFS8AyGwQb9qa4HLPaKI56NVKekv2yAcg5n9Dt5PVAZ9?=
 =?us-ascii?Q?6cCSaKLFUDxLKCdSCsnlmIdHAB4oVFQaHuaANnsUukIeVZdJ1/HYBIC/E2Sk?=
 =?us-ascii?Q?oHNsJ7u2ACQkfKdxsszJqm+rgi0CCdSkKCCJ4/QTtsmswwWGYq0TwWUPWZyd?=
 =?us-ascii?Q?zJZnG+pH7mvEcztCV5kAAJeunjLSrsjkcY8WQQCCdovteoZqlYYtkVLRXgFR?=
 =?us-ascii?Q?nxCjjGAxcaMGOtv2L6xrCNLknHBZVyhcYaLv4OI+JHGtBmSp+nTfW7VIe0fm?=
 =?us-ascii?Q?lwIGMW4MyDdYALGJaUPYAU5joDVF1SJA0dWUP0FgJdUL8tuZCbZEgrZxqleg?=
 =?us-ascii?Q?hgmKGUFqOvXk9OplMq/K3+O9572vfOK7kSotML3JH2R4VnqZIrysJ7laMiab?=
 =?us-ascii?Q?DeStw1fk06B67kwP7+0kPkgKl7seRISIbMkI77Y1iVweB7SsDDmFlU+M15km?=
 =?us-ascii?Q?rh6GYslFGfMSM/G4UCHnsRDquPEu0P1UhlKVKP9sC8xpkKAImrCJ2nbuH6qg?=
 =?us-ascii?Q?IxiwCf0nE/LxK1UMbYdjEwrE8q45h2WGhw2HaSq4hRDaSQcXozeYomQZIPHv?=
 =?us-ascii?Q?qASjS3ST0Sd6pWZKRBLLEmRmZKrPX7BZPsa+NnsAi89wGlNfPouBV0VlDOH+?=
 =?us-ascii?Q?beLXYlWrCK6+CSIU8xd7V2U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d708ac-3aa9-4f01-8c82-08d9db94b594
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:43:19.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzGNAqVlLLiURXUEl3xi+o7atov051Kw9Adja2N9YkNu0mWoxgkOqRYObbPeRTxV9W7jKH/CzpgJzkFFD8Unrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1497
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: Y0cSP6OxJhXykbbL13H9gZk_QjZv7emO
X-Proofpoint-ORIG-GUID: Y0cSP6OxJhXykbbL13H9gZk_QjZv7emO
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado tests for libvfio-user in QEMU - tests startup,
hotplug and migration of the server object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                |   1 +
 tests/avocado/vfio-user.py | 225 +++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+)
 create mode 100644 tests/avocado/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 93bce3fa62..9ef9e1f75a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3488,6 +3488,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: tests/avocado/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/avocado/vfio-user.py b/tests/avocado/vfio-user.py
new file mode 100644
index 0000000000..376c02c41f
--- /dev/null
+++ b/tests/avocado/vfio-user.py
@@ -0,0 +1,225 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+from avocado.utils import network
+from avocado.utils import wait
+
+class VfioUser(QemuSystemTest):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 20
+
+    @staticmethod
+    def migration_finished(vm):
+        res = vm.command('query-migrate')
+        if 'status' in res:
+            return res['status'] in ('completed', 'failed')
+        else:
+            return False
+
+    def _get_free_port(self):
+        port = network.find_free_port()
+        if port is None:
+            self.cancel('Failed to find a free port')
+        return port
+
+    def validate_vm_launch(self, vm):
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing', vm=vm)
+        exec_command(self, 'mount -t sysfs sysfs /sys', vm=vm)
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0012', vm=vm)
+
+    def launch_server_startup(self, socket, *opts):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        server_vm.add_args('-object', 'x-vfio-user-server,id=vfioobj1,'
+                           'type=unix,path='+socket+',device=lsi1')
+        for opt in opts:
+            server_vm.add_args(opt)
+        server_vm.launch()
+        return server_vm
+
+    def launch_server_hotplug(self, socket):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        server_vm.launch()
+        server_vm.command('human-monitor-command',
+                          command_line='object_add x-vfio-user-server,'
+                                       'id=vfioobj,socket.type=unix,'
+                                       'socket.path='+socket+',device=lsi1')
+        return server_vm
+
+    def launch_client(self, kernel_path, initrd_path, kernel_command_line,
+                      machine_type, socket, *opts):
+        client_vm = self.get_vm()
+        client_vm.set_console()
+        client_vm.add_args('-machine', machine_type)
+        client_vm.add_args('-accel', 'kvm')
+        client_vm.add_args('-cpu', 'host')
+        client_vm.add_args('-object',
+                           'memory-backend-memfd,id=sysmem-file,size=2G')
+        client_vm.add_args('--numa', 'node,memdev=sysmem-file')
+        client_vm.add_args('-m', '2048')
+        client_vm.add_args('-kernel', kernel_path,
+                           '-initrd', initrd_path,
+                           '-append', kernel_command_line)
+        client_vm.add_args('-device',
+                           'vfio-user-pci,x-enable-migration=true,'
+                           'socket='+socket)
+        for opt in opts:
+            client_vm.add_args(opt)
+        client_vm.launch()
+        return client_vm
+
+    def do_test_startup(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_startup(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_hotplug(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_hotplug(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_migrate(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        srv_socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(srv_socket):
+            os.remove(srv_socket)
+        dst_socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(dst_socket):
+            os.remove(dst_socket)
+        client_uri = 'tcp:localhost:%u' % self._get_free_port()
+        server_uri = 'tcp:localhost:%u' % self._get_free_port()
+
+        """ Launch destination VM """
+        self.launch_server_startup(dst_socket, '-incoming', server_uri)
+        dst_client = self.launch_client(kernel_path, initrd_path,
+                                        kernel_command_line, machine_type,
+                                        dst_socket, '-incoming', client_uri)
+
+        """ Launch source VM """
+        self.launch_server_startup(srv_socket)
+        src_client = self.launch_client(kernel_path, initrd_path,
+                                        kernel_command_line, machine_type,
+                                        srv_socket)
+        self.validate_vm_launch(src_client)
+
+        """ Kick off migration """
+        src_client.qmp('migrate', uri=client_uri)
+
+        wait.wait_for(self.migration_finished,
+                      timeout=self.timeout,
+                      step=0.1,
+                      args=(dst_client,))
+
+    def test_vfio_user_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_hotplug_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_hotplug(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_migrate_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_migrate(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
-- 
2.20.1



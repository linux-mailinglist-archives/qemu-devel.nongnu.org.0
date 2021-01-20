Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580652FD0F7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:02:10 +0100 (CET)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2D7f-0007BZ-SA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D4o-000674-EV
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:10 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D4k-0002Fq-Qk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:10 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCwZJW147944;
 Wed, 20 Jan 2021 12:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=rCHHXbAp55ez5jmCCjUYEeruZ/HR+xMgHAD+Ph8lUlc=;
 b=zQ0wcsLRsXyGSn5i/R0CRK3lRcrqUYK3/cgAjahbc0EH652o02nVX+xJDA+s4UPhCx89
 qIN3bokKiAVM9kY/lEutj9zxQEF4bcCespFDpYaZIlsNQd2FNPjHNu6aPWDYcFzs8cJQ
 5KWMQsU0XHG6+rIsvgqhdJ0TJvj8C84ucGKdlbEPZeuBBwFCeLZ6h9HpjOFdyyM73/Ee
 7NF9l7jbrhM86MUj/WqyDpvb6NnA7y4T0oMiX9D1tFGZugPCEbRVhEFRWa3GkFzF0MEw
 MmKo6aCkJKIyMuR1NAl0dCLXt/E+8ZDsh9Bg99N+iML+fUPq968kSCb2ya7b33YnDd7z 9w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qraart-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:59:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCaf3I061415;
 Wed, 20 Jan 2021 12:59:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3020.oracle.com with ESMTP id 3668qw5s1p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfUlBvBmOtpMtZ38S4ELrAGc5auE3r3zXUjxopcgD+lJG9T58lhVcXgwxRHXjrYrzhPxt35taiyQPwVHrL0xz8u3w8PWy0nXMvMXJG8Xp+7QDS2FEsVfeJ49rqqeQKS5UDY/XbnH4S/2+rLi0t/ewe5JCsi8IwXIx6NHcjILPmsMcGFOGBB01n/fCqub5mPoY/WfIgzTQwkR/9BmIgJQBrodgsrUyYug2Tp+VY0ZuEWTahgODFU6HowWQXK5tPZbhLMFKMHy56JeHgdLlLXTxsTXRjTdT4WhRv+7xfn2wOfVk9fP0QfQ1SiWnv147pQD6mqypTPJf6tjsbwUUJBu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCHHXbAp55ez5jmCCjUYEeruZ/HR+xMgHAD+Ph8lUlc=;
 b=jibzGZRllib1awl+meqWGH0WhI7ns6GGXz94c4aSnnSUoaXyfVpGNW8JDGqLCh2nMNxQTGDM85h86v+4mVaAiqwAUz+LznWdAgOH0NmpHM8w28RQIrLW7DBcNUNBGyscRa3vXae+InUob1zvvomhOvJkmtw9ByjHao9HZR+0uNAs1XGxrmV6VPvP/KXGhHsTjkJOP+k9v1OGD4yKwGSZDYxDeCb8tJAIMIgMHQx5HNJYfYLSC5Mf+cGxG4/6ifVd7AlUZTldquW7PTBUrGC9SO1QRF00VfDmjVQUQOmIc8rn7h7vAoOGyUr5S/v1TWAsRHgasu4yBDEz4CGgx30GPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCHHXbAp55ez5jmCCjUYEeruZ/HR+xMgHAD+Ph8lUlc=;
 b=iDhHRkkjqfMAD509ooQne2pLGCqMJqfiGBifgYvtp4KNnIxERUSG782w9QQwOyj6c+akcfVL67ccOhx5Hez3L2Ns+zAIFPwV7UOcm7xc9J5CpuZdf6Z1DFtWyK0Mu/xWrBWaUZHfVV5QMw+2lxz8+PCOjm9SNgkdd/LixDcc2Cg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by CO1PR10MB4739.namprd10.prod.outlook.com
 (2603:10b6:303:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 12:59:01 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 12:59:01 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] tests/qtest: add a test case for pvpanic-pci
Date: Wed, 20 Jan 2021 14:11:53 +0200
Message-Id: <1611144713-21433-5-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
References: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SA9PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:806:a7::31) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SA9PR10CA0026.namprd10.prod.outlook.com (2603:10b6:806:a7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 12:59:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 068e885a-a1e5-49f1-1217-08d8bd43288c
X-MS-TrafficTypeDiagnostic: CO1PR10MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB47394500FF7EE06C83CDFFD588A29@CO1PR10MB4739.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nN73HKVbaKi7RyABjqqcUis49Iga5Zxya3EBSYn53N02fN8SeOLBFAvyHdK1nvKutFyypLWn7pvZY1LFDFCbOih+OCeUiDlyW3eoKWFTECzBcZjbKhMc/kGXIW8v9OqTYWW/hIP5EsgiFzGrrtf5mXbMvd4wKtjiHNL7hbHVCE2ZBgugMHbLQQ+pcsXlKkyQUv6KfTXsutp51BU+6pv6J9vfqKvrnQ0J9b4UfQSyrE/4O5G+2vU7Dpq+GN41/4V/QBck07eVDT7M8QCgUh0akUYc0oUJwYBm5nWzbSEZqoGy6/e0xowuXcix/s86uhnPEZGsq4CEB5Kmkuy8Tw+JeRzk2crR8sBmqgC2szOTZpcvtffoVBYbjsSRNDPx9y3nD+w+qUuvp/+TRSLbZuRnYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(6666004)(52116002)(4326008)(2906002)(66946007)(508600001)(66556008)(66476007)(5660300002)(36756003)(2616005)(86362001)(956004)(8936002)(316002)(6512007)(44832011)(107886003)(8676002)(6506007)(6486002)(186003)(26005)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QA4wbITomvxwFmcdcGdW3Dx7ANh6vPHKIr+it3wG8wgqGCXMYXMOIU1nJhdZ?=
 =?us-ascii?Q?0gSOdrEbnnfhm34PQ6aU5Zm3kQbDIzNbGijj53rbtSGc/SswG7oopr7ZlVFV?=
 =?us-ascii?Q?MsATDlQQLAe9Rncv5UdRhvntuqKNyzHRExntUWpn6OPhY4MXMB5lUulijm94?=
 =?us-ascii?Q?Z+/Qj+41JvFzY1LRkisbdOv2fzmuEMEDTPCDzMOFbD8ODhfxTK97+vB3FzhL?=
 =?us-ascii?Q?XseAwi0VWmrxk8WmR8JauPTCirmgIYVd5a31nQsFd/Fso+DV2ToJJP3AtPyK?=
 =?us-ascii?Q?2q5G8xBt7Vt68c+iRkyDFSSkYpeaBj+WzY8tX0syjvZfO+gYmXukDU7iAofz?=
 =?us-ascii?Q?tfLcZZo6MxGpqx7A4DWgOCYW8PwziEcLHwyKsKeoVQK1o5vcXOG4W2wdKvHn?=
 =?us-ascii?Q?DFDG+yIFnR5zvvFScLPNi1f0GG8RMDaED6ubx/PXZnK7ZT9KTMn+8TpLTDsQ?=
 =?us-ascii?Q?X+cwPn6mMDLq1BTbUX92bgQAfiZWnEY1xpB9HxENoLy8Q72ZhmnvhACJGijN?=
 =?us-ascii?Q?isFAVEg2WY/33hdu8bcyWDDcihyklAZ8PePUGRKVOsar/k/PZyVdVckE597/?=
 =?us-ascii?Q?rly37Qt3ULT44OS8aDCNh9fh5A1kuAfCWqv31gzyASlu9DMLiOYTa1sCe5z+?=
 =?us-ascii?Q?6DbCyE/8faESJDwHYkufYArzOapIbK6SKxfW7ZQwsLdcnFgye0lanv1I1DpF?=
 =?us-ascii?Q?Eka8m9WrM5k1dcYSNJLwt6XvwlVicyf7DYfCFitIwqJ+ZXVqqFpVn8xJ1xUp?=
 =?us-ascii?Q?e7mP1v3Kv4RjbHroQh9ErYzEJIrBMH+unlC/dPRtQrGGvPLra9bySJs8f0eS?=
 =?us-ascii?Q?f3tIqjocUftZdClvcG+iwuSlT1BMx2T86qZH9xGKIH4lN8+2AhaLNSjI1XCo?=
 =?us-ascii?Q?fj9M/k8fkhkb8S7XneyV4U2FV+MUaGpuAbV1dXUCMDlXac79KbaS74XI5CM4?=
 =?us-ascii?Q?tbW2wvwvte6rYocwaA/sVmvz2x2uU3qLhbs+D3kmU3SUjlmRQfbfv7o3an54?=
 =?us-ascii?Q?VoAr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068e885a-a1e5-49f1-1217-08d8bd43288c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:59:01.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jer5jZnpgb2aUq0Jell8og3SOG4VzIsvbVaYoAByGj4U/JjtvVdcvB+E4i4LGo2V2RY1Qn8bvyRi5mEBiYykaYxN7K7W7lhBF3R9IFOio74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200075
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 yvugenfi@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test case for pvpanic-pci device. The scenario is the same as pvpanic
ISA device, but is using the PCI bus.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/meson.build        |  1 +
 tests/qtest/pvpanic-pci-test.c | 94 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 tests/qtest/pvpanic-pci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0e85343..12e456c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -20,6 +20,7 @@ endif
 
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
+  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
 qtests_i386 = \
diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
new file mode 100644
index 0000000..3379970
--- /dev/null
+++ b/tests/qtest/pvpanic-pci-test.c
@@ -0,0 +1,94 @@
+/*
+ * QTest testcase for PV Panic PCI device
+ *
+ * Copyright (C) 2020 Oracle
+ *
+ * Authors:
+ *     Mihai Carabas <mihai.carabas@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "libqos/pci.h"
+#include "libqos/pci-pc.h"
+#include "hw/pci/pci_regs.h"
+
+static void test_panic_nopause(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+    QPCIBus *pcibus;
+    QPCIDevice *dev;
+    QPCIBar bar;
+
+    qts = qtest_init("-device pvpanic-pci -action panic=none");
+    pcibus = qpci_new_pc(qts, NULL);
+    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
+    qpci_device_enable(dev);
+    bar = qpci_iomap(dev, 0, NULL);
+
+    qpci_memread(dev, bar, 0, &val, sizeof(val));
+    g_assert_cmpuint(val, ==, 3);
+
+    val = 1;
+    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
+
+    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
+    g_assert(qdict_haskey(response, "data"));
+    data = qdict_get_qdict(response, "data");
+    g_assert(qdict_haskey(data, "action"));
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "run");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
+
+static void test_panic(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+    QPCIBus *pcibus;
+    QPCIDevice *dev;
+    QPCIBar bar;
+
+    qts = qtest_init("-device pvpanic-pci -action panic=pause");
+    pcibus = qpci_new_pc(qts, NULL);
+    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
+    qpci_device_enable(dev);
+    bar = qpci_iomap(dev, 0, NULL);
+
+    qpci_memread(dev, bar, 0, &val, sizeof(val));
+    g_assert_cmpuint(val, ==, 3);
+
+    val = 1;
+    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
+
+    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
+    g_assert(qdict_haskey(response, "data"));
+    data = qdict_get_qdict(response, "data");
+    g_assert(qdict_haskey(data, "action"));
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "pause");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/pvpanic-pci/panic", test_panic);
+    qtest_add_func("/pvpanic-pci/panic-nopause", test_panic_nopause);
+
+    ret = g_test_run();
+
+    return ret;
+}
-- 
1.8.3.1



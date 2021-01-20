Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590F2FCF1A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:23:53 +0100 (CET)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Baa-00055r-3i
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BW5-0001UW-MW
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:19:13 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BW3-0001e6-CP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:19:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBExBV154620;
 Wed, 20 Jan 2021 11:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=rCHHXbAp55ez5jmCCjUYEeruZ/HR+xMgHAD+Ph8lUlc=;
 b=Vj8BCIH01SoPk+IL06F4vxad+GcddW5+ocwicSrl6coWqk5tC9cZF2PiKpJwb4JK3WsQ
 qnvUx+FCqkv3KdhjfGR27EfsjNYwjwbClI/SikltRIEcoSqby+yZ925PKQnEbrf+obJX
 3wodfVyjuJrN2bvco+oDoowf7VoIxEWsrw6iAYhqcw5sbGLvs1h8uhKV9SWFllxr9/Kx
 R4zfskCRahgDVzeNiooIHJBXvvTXjkpM5p6rErgwjUAEH/ZNRjY7eC4dBf7O7t5ymR8X
 tejMDWJPn1u5H77QPvheIQXa5I0X5YRK8rFdpwo6BewkuaLosBR/HTjgHM0Jb97MoFOy tQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qmsy2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBElV3010856;
 Wed, 20 Jan 2021 11:19:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3020.oracle.com with ESMTP id 3668qw0cuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLzYJX81S8sXHth4RP0Zal5YPi2JAcSRj3yHrpQeoUL/Uf2kOIryolTeR39OF4ro7cEdq2b+BhinbP+/Cy3dNU0901OSvJ/zZlOfE6NcKZ9QrfFNfcGiEy3x2fuoWYhBPPHwTbJwIkCl97dAQVx58DqLpVFaSQLKE6cwuaKRymyr7FrmRqfI4ztOhHsP/Wt7CXzxutgvrM4fMzLDxNHKRvaFC1nnKZTQjiLq6IzJtPX3Hd8Meq/0lhNjA6/b8WE3gRz24iy94qNzRs6NSju2R6w1H2AuISSbcJCA0CCRBA3FKz8sTuWZSVEVYjHsUxDt8yt3EJGmSkmY65nMNODZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCHHXbAp55ez5jmCCjUYEeruZ/HR+xMgHAD+Ph8lUlc=;
 b=S8mbvcwMwQnGitdiX3fq8CUhA8B8z8ZVjrgdNCj4rsg3/yXi0yH2RMv962upLoa9C+eflsiivHrjAB8pF5ItH6UVYvHhGjGu2NixyYwgN5FDyLAje2+Ea7DtYvW8ybxlDwX7FpqYqKL+upRNVotwdApSo0Tz4SPAkkXpikkHgYA6FAe4dAG+Cg38qlKQlh3Hkvhm2zph6jdxP9r5IYVsjldsVaZY28TrIjHt+4XPCVEbq0Azp+EKiLrdC50YevyOrFFJo3JsxoGTp7go8tVhsZLslBVi+Ot5QD6eodK3rgk1ycqCJMFLsHAzQLMUGKZb5lWHZYgUOXAJybed2z8HcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCHHXbAp55ez5jmCCjUYEeruZ/HR+xMgHAD+Ph8lUlc=;
 b=cP3FiRN2nOznrnJzWvLXLiVLzjk3YwVZPb3Gbw+HgzG6Gf8HKzcW4fkgsscWOTTs8BIw0Wxbz0hdbWtVCsx9Fz41757WVgprQuXNmgQXFA5hjAEjt/f43XKTGJM20WAyCJvXYvnNNHuqWoT1Nsi5SoqcgBH+GdeBqHqXvgKQKEM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1342.namprd10.prod.outlook.com
 (2603:10b6:300:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 11:19:06 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 11:19:06 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] tests/qtest: add a test case for pvpanic-pci
Date: Wed, 20 Jan 2021 12:31:57 +0200
Message-Id: <1611138717-1672-5-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
References: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SN6PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:805:ca::39) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 11:19:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 786b6e64-4537-4014-5487-08d8bd353284
X-MS-TrafficTypeDiagnostic: MWHPR10MB1342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1342AA455539DB9124DCB4EB88A29@MWHPR10MB1342.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKcd3nwiufktJeKBwQ5JUzF9E7eP+I+38V4fQMd8yJk4k5ZnS8+LaOnXW6qP6OrHMt4+4FZ7CpLxq9jh97mz7at9ucCARyrXaVNbUGHTL7+PO94rotb7qxXMavfjuyr7hdZ4W4t+/T6KZdGXVauio8B3povP/nqxd0AsXXKR1a//S45rQ6b8QUWQ1N3oMMpYV17vVy4iJWO3DRYSfZ7spp66q3fRmDfs50TdbqKyKPuObKfa17kX1l8SOSd8qJwy3hx9xvWpGB8eInUuTx0hbbHtUT1kDol1DA432yMDHwAsmTYQYoF9YwFK0fcTYcLjq8KN2r78DQm00Xltwjg0YTH78hTRqDSo4w/2S2aO5LRTxtEUg1Bzf/meAjVSPxj5PpkZYqG5DF7YOTpFCWBnwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(366004)(136003)(376002)(6486002)(16526019)(6666004)(8676002)(36756003)(2906002)(86362001)(107886003)(6506007)(6916009)(316002)(8936002)(5660300002)(956004)(52116002)(66946007)(44832011)(478600001)(2616005)(6512007)(66556008)(4326008)(186003)(66476007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Qom3B4bpbWlUI+PfGvYtmFijM3hZWPQ25AdR9DmEDuyAFWR9JULU+Fjlpdmk?=
 =?us-ascii?Q?vHHE+juNOmV1Z0j3TRS6mGz0I6CPmQLiAT8JkBUOA6OifMhQ6TCr3uF0jodW?=
 =?us-ascii?Q?sfJX8sB9JMbzmJ5VwoSkhEFOrlSvyCynbLNa45ZCSZWfAVe73R4jV8F6A5Bo?=
 =?us-ascii?Q?hjPrnK3dlpykMHzUfnZ7Fhpif1fhwqlkRbzScHj/+eZgjRKu4I3UzQhAw+ed?=
 =?us-ascii?Q?uVt2Ux9XHsb/G11JSLpv8DyNVreir4C8Y+ny7y+NIqjJb+z+YVvvWo0HqbdJ?=
 =?us-ascii?Q?HWlwGD1LP7DOj0IN62gu9c1jtjeKAU5ccOXQQpLCOrY+ENKSCldfbWBGbjkG?=
 =?us-ascii?Q?JE+fspptDhulZL34a+FtZjRjuUhY7HBwWU0mv3Wk9Seef6NtjdlzvCvZGqGk?=
 =?us-ascii?Q?JbAUiutORnJ83AVtEF6H8kejaCZD8lbkXLl0XiLmiOlfyWGxuS1Qm2XT3C9W?=
 =?us-ascii?Q?gWmSXYipKSGJ1tlPgu99P/4fFdEbHud4UECoXzrv3WfyV02qznMXaS7o3T9/?=
 =?us-ascii?Q?iCi47bXEQHm0ti+UwcO2vN7hXLeRnKdlvHPzjaWiFqCRWaTgqRVgtxeyBdDa?=
 =?us-ascii?Q?WEYcvQrxdHoWLqnu3yHTfxIbfWLpF6h2TFsEYfk73vlTvsrjGvVjNRUoMT+S?=
 =?us-ascii?Q?Qh5L8yEXwXePN85RFoaT3JCzevgJ9la/CghNYq/b87rKjISdH2klcjnIOZw/?=
 =?us-ascii?Q?V7/kl7mvRQpAoMBGZ+tHJrP7IDETpoeiooNk+wJUGYeXPkZJ/yY8XorpWPL5?=
 =?us-ascii?Q?vzSr80/6n5wjairBZoSuXmDmjRfzqCYq4GB+d64sZBxI6rTmi95P5qkfTxjm?=
 =?us-ascii?Q?vo7DfKXqalGIgDFIqZyW0MrWQAwKntS/0W3g7GX7xuwEpr6dmCBq/+b9DX0x?=
 =?us-ascii?Q?f+sIF8vXrKMzfyYFs8CUcZ86iALUijDBxThVLyDdJid8dj9JRh9JKF4u9B4e?=
 =?us-ascii?Q?hhqKrJ53IP5GQgXPi3+vsSH3dalwJVLuLq13pZRQ5k0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786b6e64-4537-4014-5487-08d8bd353284
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 11:19:06.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcOihH5uBJVJCGnwK+HJ9/jwA7jTzTaCxjCcvtTXaHVamZ5k+6PsVOi5reT4eAeVMCkw8V1SLxzQ3AwaeQUbgtxHL6ji4oVgqmGJ0bcHzq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1342
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
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
 kraxel@redhat.com
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



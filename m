Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C051E306024
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:49:24 +0100 (CET)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4n4N-0005ZP-RU
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1y-0003xa-UG
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:54 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1u-0001g2-C1
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:54 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFhsi6014266;
 Wed, 27 Jan 2021 15:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=zYPUbkAwRNmlSzk2fpQUrFg4H0XMyWdJe93bxsHbSHw=;
 b=pW7VYS0BMHEECnFY43MQl4XzkFNdhnouf1xI3fS9JMl9wAXxBkMx9x8fnHtT6hI7MVPv
 CU8AXdJhb6qmNkUjobE0xF+LwhfhUV74YhOAU5j+oM6Ni8e5WiKz8ljXJZ4lL4W9+OPR
 O1/LTe2XO0i8P+/swyNgQBoeBNHYwFp8s74WHKC6VG70qR1N2RGa9n+9S1qrdRWzgL1N
 zXcAnUW/7dxcbUr1ao2QVumXwL5GIn+W88rhLh5HTk41a+r6fHozc90m8t99hayIqH4N
 /S6brgC3y7S9F0NABKW25QDvKs3mqpnTPTSs5qLaf7yXn+TR3XczEXfs72e0M9L6yATW ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 368b7qyw1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFkbAW158486;
 Wed, 27 Jan 2021 15:46:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3020.oracle.com with ESMTP id 368wq0dxu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9i/GEFkpqJWVP0gSfZtlTY9gWvyflvPk17jfVaGHyJdYtvMhRfn9fGvGgkE/x56AV6tdIDBysyPsl+KdoGLA+e1UhYPS2BZWo5Uk0K8ljNIDuL2ZEVYOXyDk91aMr7gLKXNm8RxpKnhRRhvKZ6UUfqIrxtgHpWYHSogEhMY627nHe3UFqQ3c7ezRQaCY3hSb7kWqe11d+dHZvEwE6mdUrmndIuvi3W0BEXSLTegKpMgwRLEKVd5exVlfi97qiBzgT4/HaAWc4MN0evpW5ehjUeB8Y+jZYy7sFHH0JH7QGXUgcoRlRqsU4eIvAj2CjZ30Gez0vX+QythJRL3RpSFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYPUbkAwRNmlSzk2fpQUrFg4H0XMyWdJe93bxsHbSHw=;
 b=frpbz5pLdCcIo8i7VTIXgDEfKYbdksDchDXjhm4Wb5P6XuieuWJXeUEUbrsIY4ViwarJtyEw/DE9jnPwYA4t2aZZJNf6/4mk7KtscWMnx3gF9jdzYUkYV68GAZ6EsF1ew93dGavgjjCDd2mOtqfeQHpZofM/c0KgVxRomHnshDh+aUDVwHvs7aTOuW9nz/9dTNRdc/JpZkqalGunHUlqm8CZvRuRpOuKVxM0LdZFzH+zR9M32YAt4g6LG50Id0bVcbvG41hQAfRRmRYiyV5aIyBWat5XeJ6LIlhDL8h/slF/WDOWJJMKuBoE5SYp3oXXlWNjIMf4qozeciKOTomSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYPUbkAwRNmlSzk2fpQUrFg4H0XMyWdJe93bxsHbSHw=;
 b=KW/Vrf15ssnuYHyv8lc3tW8PWbSE94X+w7Stzzv98A2YVkfdZdcCY/h7ZOKXq6F/2HeSieba0ppzwWB/PDCggTYazYvfp1pnleN4efeFD6O1AAVAehup8jTUyj+uiHuvsyn934jSHXQ3Itm3suKU7ANkzvZED5VOPAElc0OdovE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1693.namprd10.prod.outlook.com
 (2603:10b6:301:a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 27 Jan
 2021 15:46:42 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 15:46:42 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/4] tests/qtest: add a test case for pvpanic-pci
Date: Wed, 27 Jan 2021 16:59:30 +0200
Message-Id: <1611759570-3645-5-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
References: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd6f43c5-7739-4d97-71e9-08d8c2dabe1b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1693041B86E8979A53748AF288BB9@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2V9v0J1JVMtIQc57CGNnHg7/vLncya139pQF8x1XC/670qF5Lv40hiM1Gf04e84VOOXHW+xLXfHlVECDJuU42Dfcf+x9l+zgEUp/SPAY/L3r7V2hMSMIWnTgfW4VUWQ1WYzrfw5aLrDCix/RAnEwLSIbifxJb7V+G+20LCHM7X8T2d0/aNDtbQXMqLnH4lCvvtGGiv0Xeh3HDqABKUafOBY4voTv2BG9nTEyP1Oqu5D6Mkat8cb0PBqmrpyRo3hno0aHGSptjl8nqN+acP2Ym1FS0lxBwFiutd8eYT4k5k69TVNNYf6Lxfjx57SY3Nw/lqLScz3Ov3iMqzQ3ZcruGAK3KTlmiHH0V1FdwOOALHf+2wYBhZIIjEQMY+QBrCP8PidgnUwWnchk3UAuGEM0OLzHK3+ne/HaHP4xK98Pxf3Yj65zc2YdRfhDRZEHoCBBc9q9qIoDQ5NMvRL13Y73Pd9n3seSO62rzHUbs3rTyMI+UUhgBRZgBxpLzrzkKgdo9+yHlTKJW7diRW2LdcYtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(86362001)(16526019)(186003)(8936002)(478600001)(6916009)(2616005)(44832011)(6506007)(66476007)(5660300002)(66556008)(6512007)(4326008)(2906002)(316002)(26005)(6666004)(36756003)(8676002)(107886003)(52116002)(66946007)(956004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NMFjqMBBpGHVfaEKnEK47y0uKVY30/BUboiELnqdzO6mC0Sw75tlOGUCvQfz?=
 =?us-ascii?Q?7ZWW9qkqnVN2JWkHSwJtwwmwOw66nkUTuxqUKFjtG9eil2N17GB94y06HfH3?=
 =?us-ascii?Q?MCLRfEKCZYO5S1YgYN5mKGtj6bmrde2GM2bwD0YqUb+J6UuYjVtu7TqE516s?=
 =?us-ascii?Q?EGvtEdNw/HEGYzRG722x0B1OK9q6cPEHztjeld7vipU+ZynvkYHrULlOeWo0?=
 =?us-ascii?Q?6U+sJFpM81nTxjbcmXWbihm1L4jKRD/hDINKaAAfw65Yoy3At/KU+UdBGm1o?=
 =?us-ascii?Q?0F9mRehoeEArQqGUoYBCmBra2q3MO453bY2rt8Gs/vRSO5n0YubOAq3PpepO?=
 =?us-ascii?Q?KrOjM3nYopV1jZmWLyTf1eViLVZ++AkLDPpO0p9wBWQz3K5XRDmj16QJDI89?=
 =?us-ascii?Q?WW3ccO//n3vOS7CAqSLooPAGHDB87zgB9uJhYHygI1rOFo9NWi4eadBIozxA?=
 =?us-ascii?Q?er9yTZhHfgAYtJKsp4FXcsBkDsCTZqR9kulRmWG5bxiPG5Z6JItBjYl9EQGF?=
 =?us-ascii?Q?qSbUpdWC8jF+qv46NHPvcAOEEogSPMy4E7IhA7UaLkiyPaYcgLjzfihM06t/?=
 =?us-ascii?Q?i5lgDNJtUAicLpUTnAQ9nDmXuHPT1Ob7jgeS/52Sll1dig9d4GtkkyQPx4yQ?=
 =?us-ascii?Q?3bYYgdZRo8xe1vjAqg8u6JIW1S/O13xAvQxUhAoer6kHyPHO+w1kRiIdFX4t?=
 =?us-ascii?Q?IYRv+foWQl8HK9o+D+g1qqgvp6e6l/guGxDX+gmO8/EVidWZuANDBwYvML/F?=
 =?us-ascii?Q?AU4EXyAWcgUbsHX6aaTWN4dHwMarZczg1luRiAdEsEr2o9UOtWA7K0nhqyJJ?=
 =?us-ascii?Q?hAvF8K2LS07iEWEglG1bdYmM9SwIT2qH1PDttjVw42Q1hlyzK9ZdvEgBCZP2?=
 =?us-ascii?Q?M0uCSDe0q5nuinP9RgvZH8vgG5Nw8+wZ81ziNKNjLSNbowFiiLFzm2aC/mUn?=
 =?us-ascii?Q?kSKSHZcT4wZJzKInYTXLTB9upC7tAynzT+yfCTGmly49GbNL/No12GJGWKbu?=
 =?us-ascii?Q?T0yFahNwFRfixMw7QLa4Ivq0JHQujeSwVv1Epqq3mrDF2/pneJQITtIVTjXf?=
 =?us-ascii?Q?Ra9bxOdb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6f43c5-7739-4d97-71e9-08d8c2dabe1b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:46:42.4002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XBEgdSu0NBK20PidPy6UneTOaB+9QJ0sazaD+lYGJ2G2NuO1WwNfUI/9Rh4Y5GeP9Tal6cpuxaVTa3QtnQsdqSOxiLdglJ7pPnLcVqoCZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
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
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 tests/qtest/meson.build        |  1 +
 tests/qtest/pvpanic-pci-test.c | 94 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 tests/qtest/pvpanic-pci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0e85343..7ccdf02 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -34,6 +34,7 @@ qtests_i386 = \
    config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
+  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
new file mode 100644
index 0000000..24b33c6
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
+    qts = qtest_init("-device pvpanic-pci,addr=04.0 -action panic=none");
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
+    qts = qtest_init("-device pvpanic-pci,addr=04.0 -action panic=pause");
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4CE2FD106
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:07:23 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DCk-0002tD-Ge
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D6n-0007S9-CG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:01:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D6h-0002zC-J8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:01:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCxWaA191544;
 Wed, 20 Jan 2021 13:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=oSylka8YwjTRKhz3bo49XfSRtY5/tvHik392NBv4EHgZhELFhSwZSRfAkgBZcvwULzRu
 42TQfdDe9BZ6GpnpUwhyGK8Tbe1R/AEtZi8Y4idF1GLyF7NMYB6l9CBZZAO6z8Xrt5Xp
 KO2y3nwTXOGt+6hmZlfmLsfaJTHy1p4i+90BJiBh3JpAqRLkM6gGUCxyveEpOFwop3EB
 HodqbdbBTab3kFJodkxfr+Un90s5v6PJWPNWyqY+sqVQLTDr/QBhgsTCUJEFZQpBQ2dC
 MmC9DIRPhzj5oHXLUAtcgcaVRf20WdT0UmGqln4fj7GKlHhWrbrR/5umgNW7NfnCufBE yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3668qaab9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 13:00:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCZnKV099518;
 Wed, 20 Jan 2021 12:58:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by aserp3020.oracle.com with ESMTP id 3668rdvpq4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPqOxR2akg/7TX+gPBv3SBB/IdjcvaPSGxuuz++KGnyeYlXNGJkV2aiqbXoH+uMThwiLwo3qtoSFJXkDViWEPGTOfqFZsR46QzITIgo6ZYEykG5/8IWoH5M9AwxdwwQUPG52J9JkQ0lHNSPhLIQmNEkPwQpj/FF1khrumWHtBxzCaGMz8S/b7ZHUb1z+WYYJXEsUnbJcOQR+h0mAIPmpbhtZVM9tpfTmiUAjdqyp6QsYgW9mcTVBnV6FlybtuEMnftyMb7B6T2JJkHKqAQ7GZAtT95I1G9dbnFZImjLIA4Kzjkj3lLjypQZziFULP3kf6FIbYIB04sghWzsbrC6CgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=X92LawJVMPWXUj8bzoV1/gXMLzK9h2DXQvknxcceRkZ3SYVS4p1do+7i9Vop1aAh9HG+2d1ukBXANAvaODfdvotoPahAse+p9tlZTJNDMrmkruf1PCE33w5F7AtCapAUwqvESpJ1LTfBxfNcJVqYFCVZoRWnBAvP+UHn8ggPKcSROzAN1nwkww3llc7+VtBMIOKPsUb84EE4xOpEbAOBnWeO287q1iZBszVqhkeff0sAi7Sy29uFSUDxMxbVR2JYPhDQNeBUCTZMQuGPprQKUVgZxtyyT6qtH+Q+dGamwPJuQt4dSFVdqhrWvUw7b6pH0fEHhVCuPQ6wNeovVrKqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=spdCjx6mCj9rh0+l2etDIHFzxekv6DensBsbHyjFYeIWUx7S1LG035ZjDfB1PTtxRMvG3soERRs/Y8uhNsvj3Qjc0A4vQwciuunPfa1N4afZqHoJr6OA4DBYwk2o4HyHtZpbRXYoltl/aQPkD3fOmoZBMTkX3KGHrMgH25tVOZU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by CO1PR10MB4739.namprd10.prod.outlook.com
 (2603:10b6:303:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 12:58:56 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 12:58:56 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] hw/misc/pvpanic: split-out generic and bus dependent
 code
Date: Wed, 20 Jan 2021 14:11:50 +0200
Message-Id: <1611144713-21433-2-git-send-email-mihai.carabas@oracle.com>
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
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 12:58:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91ddaa63-1386-4771-df90-08d8bd4325a3
X-MS-TrafficTypeDiagnostic: CO1PR10MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4739B55B2FAC283DA897669888A29@CO1PR10MB4739.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewn/HNTT+AaKWCPe8QHDYcydXuVcQhHgWBVNtKsMUJTX5gXz+KvQWpTUUcbblr+d61R9aW0S4FhBbm2lsLUQfh+A+SFpNh66Q6DweEaM1jOq7lsg6Y+XzoQLxdPCrJ7UulcYb0CZ4TC0+UeUKWSHeMW6TsvlrsWQtXcGHHooQowA2yL2sheFp9vUje0RG8qFqdH+iZmNvZ/nlThGCusfBS+/vakEomTvft6BCfQKHCz80GKlUd0XgLzFstbzRy4Aqkufz2ffNzNVEfqcWPiet8e9fltWQKOEbo8lF+uG1w7vU3iAOEmA2kZjc2tE8lXLu62K+9Ybry+46t0Np+TXZZWYlECUl52O1YbIFDIJbZCp0S+Dg0kmLsOwwRGq0f5JM6qMwBCSdGDWNHV9QE2eLn1HvAOwQsBOdnOv8f+4E2XpeqxGmR3FdI0qvEE1tuDJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(6666004)(52116002)(4326008)(2906002)(66946007)(30864003)(508600001)(66556008)(66476007)(5660300002)(36756003)(2616005)(86362001)(956004)(8936002)(316002)(6512007)(44832011)(107886003)(8676002)(6506007)(6486002)(83380400001)(186003)(26005)(16526019)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JSiI9PD8duCSTgBO00CSxIZr8vdZAwgbzSmGByfIIYc7CNbYQLjnlheBMxVA?=
 =?us-ascii?Q?+lsTxYNYe0iqxXxWetVY4trM110Q9+sfO16L0kSO+/GimHtRQxcdVEqvI4MH?=
 =?us-ascii?Q?F21jDJQYzgvGny5nLWkpiS24CqBgixqSnElH8LBiFETX1jasrVYOOk/SIlDL?=
 =?us-ascii?Q?Br5NwvjYiUp5QMbAavqlxlYJ6hoQiy/OU+fzbNMs5Q8tdEEtN3B+Gj5obkdR?=
 =?us-ascii?Q?gVmgZTQO5mUVnq3RijG9w0lrxCxvekgZtuQI9jD23+n7DGGv6o5UAy8swTbu?=
 =?us-ascii?Q?zPNIVatEgZm2Hd2y/WIMRt3/aJgIhxMpZ0OmasnXsFEveP34qrVVlTBnUoPb?=
 =?us-ascii?Q?Pw0976qo/iZYOhZRvXCK2XTkHigwNg2w1495Y9XjfcYgT80W1+wxWOrsIASN?=
 =?us-ascii?Q?1gfAaB08I+7GMdmdMu5NPqFFKxKU7gjyAfJogctvdpReg+ObG7RS4TusKWWH?=
 =?us-ascii?Q?ba395d6RTNziU8u4EkNxWJpJ6RnPPcWJNgTjUH9L0zgPW0Tf2pRwVOUawbcI?=
 =?us-ascii?Q?v8adjnRddqPyFPou2m6aasDsinfb2gd6Y+DoVxz//uFHM+AIgTQt3KiFwiCQ?=
 =?us-ascii?Q?GWOhhXuQgYuvyxzCxYMIVo5w+d6S5rnFuqAQS/XVXHXiipKLiOrkvE3n3zMG?=
 =?us-ascii?Q?5YuV0CLIZbUS6lZWzZorWQQEbEUF7Sah17UECFrttahjs/cONFgTwI+mjoYs?=
 =?us-ascii?Q?gbeJBriYVCQVEFBca87rCVXky2+xvpMWxDpx0jfgy8x61zmLHSjPQXvB8c7o?=
 =?us-ascii?Q?isblfbp9WQPQrCNmFczCinuE/lxIDX7EMrmw+TfQB0K66CLA/I84xRiyaxVb?=
 =?us-ascii?Q?kRFVCJk7BRwy62DuCiLid9A0YMbVadhdK2izGej8ctTXFt1acl+PX8PCyATL?=
 =?us-ascii?Q?Q/VR/geb5NwqpQETSroVKTZlTnfDVXQWJtqQIY6ZSX8/kW6ODPq2NjVYHagE?=
 =?us-ascii?Q?+8fqxzlph5jD1G5d95L76ROuu9sLhhFRZ3/Ql8hDjEhVjYTGtmKrmxLodnyo?=
 =?us-ascii?Q?WIQx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ddaa63-1386-4771-df90-08d8bd4325a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:58:56.6289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KL8LmAkTVWVE1DJRWm4DEVg+3FAjtgaEVYew1dFgdpy5q0VpgC81K6at+j/rKTDK2yNK0GeW7AMzFsA2NPnj8CKR2U/t+U7KwMrQVlUm/io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200075
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

To ease the PCI device addition in next patches, split the code as follows:
- generic code (read/write/setup) is being kept in pvpanic.c
- ISA dependent code moved to pvpanic-isa.c

Also, rename:
- ISA_PVPANIC_DEVICE -> PVPANIC_ISA_DEVICE.
- TYPE_PVPANIC -> TYPE_PVPANIC_ISA.
- MemoryRegion io -> mr.
- pvpanic_ioport_* in pvpanic_*.

Update the build system with the new files and config structure.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/Kconfig           |  2 +-
 hw/misc/Kconfig           |  6 ++-
 hw/misc/meson.build       |  3 +-
 hw/misc/pvpanic-isa.c     | 94 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c         | 85 +++---------------------------------------
 include/hw/misc/pvpanic.h | 23 +++++++++++-
 tests/qtest/meson.build   |  2 +-
 7 files changed, 130 insertions(+), 85 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index eea059f..7f91f30 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -14,7 +14,7 @@ config PC
     imply ISA_DEBUG
     imply PARALLEL
     imply PCI_DEVICES
-    imply PVPANIC
+    imply PVPANIC_ISA
     imply QXL
     imply SEV
     imply SGA
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cf18ac0..23bc978 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -121,9 +121,13 @@ config IOTKIT_SYSCTL
 config IOTKIT_SYSINFO
     bool
 
-config PVPANIC
+config PVPANIC_COMMON
+    bool
+
+config PVPANIC_ISA
     bool
     depends on ISA_BUS
+    select PVPANIC_COMMON
 
 config AUX
     bool
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 607cd38..edaaec2 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -13,6 +13,7 @@ softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
 # ARM devices
 softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
@@ -98,7 +99,7 @@ softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c')
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
-softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
new file mode 100644
index 0000000..27113ab
--- /dev/null
+++ b/hw/misc/pvpanic-isa.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU simulated pvpanic device.
+ *
+ * Copyright Fujitsu, Corp. 2013
+ *
+ * Authors:
+ *     Wen Congyang <wency@cn.fujitsu.com>
+ *     Hu Tao <hutao@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "sysemu/runstate.h"
+
+#include "hw/nvram/fw_cfg.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/pvpanic.h"
+#include "qom/object.h"
+#include "hw/isa/isa.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
+
+/*
+ * PVPanicISAState for ISA device and
+ * use ioport.
+ */
+struct PVPanicISAState {
+    ISADevice parent_obj;
+
+    uint16_t ioport;
+    PVPanicState pvpanic;
+};
+
+static void pvpanic_isa_initfn(Object *obj)
+{
+    PVPanicISAState *s = PVPANIC_ISA_DEVICE(obj);
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 1);
+}
+
+static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
+{
+    ISADevice *d = ISA_DEVICE(dev);
+    PVPanicISAState *s = PVPANIC_ISA_DEVICE(dev);
+    PVPanicState *ps = &s->pvpanic;
+    FWCfgState *fw_cfg = fw_cfg_find();
+    uint16_t *pvpanic_port;
+
+    if (!fw_cfg) {
+        return;
+    }
+
+    pvpanic_port = g_malloc(sizeof(*pvpanic_port));
+    *pvpanic_port = cpu_to_le16(s->ioport);
+    fw_cfg_add_file(fw_cfg, "etc/pvpanic-port", pvpanic_port,
+                    sizeof(*pvpanic_port));
+
+    isa_register_ioport(d, &ps->mr, s->ioport);
+}
+
+static Property pvpanic_isa_properties[] = {
+    DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
+    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = pvpanic_isa_realizefn;
+    device_class_set_props(dc, pvpanic_isa_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_isa_info = {
+    .name          = TYPE_PVPANIC_ISA_DEVICE,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(PVPanicISAState),
+    .instance_init = pvpanic_isa_initfn,
+    .class_init    = pvpanic_isa_class_init,
+};
+
+static void pvpanic_register_types(void)
+{
+    type_register_static(&pvpanic_isa_info);
+}
+
+type_init(pvpanic_register_types)
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 35d6797..e2cb4a5 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -22,18 +22,6 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 
-/* The bit of supported pv event, TODO: include uapi header and remove this */
-#define PVPANIC_F_PANICKED      0
-#define PVPANIC_F_CRASHLOADED   1
-
-/* The pv event value */
-#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
-#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
-
-typedef struct PVPanicState PVPanicState;
-DECLARE_INSTANCE_CHECKER(PVPanicState, ISA_PVPANIC_DEVICE,
-                         TYPE_PVPANIC)
-
 static void handle_event(int event)
 {
     static bool logged;
@@ -54,90 +42,29 @@ static void handle_event(int event)
     }
 }
 
-#include "hw/isa/isa.h"
-
-struct PVPanicState {
-    ISADevice parent_obj;
-
-    MemoryRegion io;
-    uint16_t ioport;
-    uint8_t events;
-};
-
 /* return supported events on read */
-static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
+static uint64_t pvpanic_read(void *opaque, hwaddr addr, unsigned size)
 {
     PVPanicState *pvp = opaque;
     return pvp->events;
 }
 
-static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
+static void pvpanic_write(void *opaque, hwaddr addr, uint64_t val,
                                  unsigned size)
 {
     handle_event(val);
 }
 
 static const MemoryRegionOps pvpanic_ops = {
-    .read = pvpanic_ioport_read,
-    .write = pvpanic_ioport_write,
+    .read = pvpanic_read,
+    .write = pvpanic_write,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
     },
 };
 
-static void pvpanic_isa_initfn(Object *obj)
-{
-    PVPanicState *s = ISA_PVPANIC_DEVICE(obj);
-
-    memory_region_init_io(&s->io, OBJECT(s), &pvpanic_ops, s, "pvpanic", 1);
-}
-
-static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
-{
-    ISADevice *d = ISA_DEVICE(dev);
-    PVPanicState *s = ISA_PVPANIC_DEVICE(dev);
-    FWCfgState *fw_cfg = fw_cfg_find();
-    uint16_t *pvpanic_port;
-
-    if (!fw_cfg) {
-        return;
-    }
-
-    pvpanic_port = g_malloc(sizeof(*pvpanic_port));
-    *pvpanic_port = cpu_to_le16(s->ioport);
-    fw_cfg_add_file(fw_cfg, "etc/pvpanic-port", pvpanic_port,
-                    sizeof(*pvpanic_port));
-
-    isa_register_ioport(d, &s->io, s->ioport);
-}
-
-static Property pvpanic_isa_properties[] = {
-    DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicState, ioport, 0x505),
-    DEFINE_PROP_UINT8("events", PVPanicState, events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
+void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size)
 {
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = pvpanic_isa_realizefn;
-    device_class_set_props(dc, pvpanic_isa_properties);
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    memory_region_init_io(&s->mr, OBJECT(dev), &pvpanic_ops, s, "pvpanic", size);
 }
-
-static TypeInfo pvpanic_isa_info = {
-    .name          = TYPE_PVPANIC,
-    .parent        = TYPE_ISA_DEVICE,
-    .instance_size = sizeof(PVPanicState),
-    .instance_init = pvpanic_isa_initfn,
-    .class_init    = pvpanic_isa_class_init,
-};
-
-static void pvpanic_register_types(void)
-{
-    type_register_static(&pvpanic_isa_info);
-}
-
-type_init(pvpanic_register_types)
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index ae0c818..abc9dde 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -17,13 +17,32 @@
 
 #include "qom/object.h"
 
-#define TYPE_PVPANIC "pvpanic"
+#define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
+/* The bit of supported pv event, TODO: include uapi header and remove this */
+#define PVPANIC_F_PANICKED      0
+#define PVPANIC_F_CRASHLOADED   1
+
+/* The pv event value */
+#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
+#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
+
+/*
+ * PVPanicState for any device type
+ */
+typedef struct PVPanicState PVPanicState;
+struct PVPanicState {
+    MemoryRegion mr;
+    uint8_t events;
+};
+
+void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size);
+
 static inline uint16_t pvpanic_port(void)
 {
-    Object *o = object_resolve_path_type("", TYPE_PVPANIC, NULL);
+    Object *o = object_resolve_path_type("", TYPE_PVPANIC_ISA_DEVICE, NULL);
     if (!o) {
         return 0;
     }
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 16d0462..0e85343 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -33,7 +33,7 @@ qtests_i386 = \
   (config_host.has_key('CONFIG_LINUX') and                                                  \
    config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_PVPANIC') ? ['pvpanic-test'] : []) +                  \
+  (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
-- 
1.8.3.1



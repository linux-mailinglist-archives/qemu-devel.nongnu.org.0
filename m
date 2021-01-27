Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB37306036
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:52:00 +0100 (CET)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4n6t-0000Bi-Im
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1x-0003wz-S8
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:53 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:44288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1u-0001fS-Bx
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:53 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFjBcC147963;
 Wed, 27 Jan 2021 15:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=UuK1CYtChJYVTDywVe6c6p7zF6NBYbbQ6ugWA43rBosl940NnUUVDrcb4gD4N52SHVvL
 3IkUmtxCmD2UFseSYkTJwkB5bXY1v9yNGDip+ZCEJhRKuo005P8FlHhzGCxh3/PhSqdr
 BRIjwhx+kzDx0v9xhio+tGPQtKNVjykphD2YpfkSOGZ0P4chdCA7OmPBUmU1BQF70x7B
 z3oGlGwAnIny4yozfgAVFeD26yE7McqczF3aCXxARDLg7fBmXQ+T5zGAdFvIcZbAVffH
 Bw/nz8i6yi8uTIYKPbah5z6alVQNp2mi+DBTfqkBAvj192cK8DN/1QgTjhhfwrW24xh3 zQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 3689aar206-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFj9e1024983;
 Wed, 27 Jan 2021 15:46:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3030.oracle.com with ESMTP id 368wcpdwp1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc8uG52bj7kCxkV3KpXWn1ktw8vMYmqbukYtskozrSv0kIsdjHQ4U5Q/GWhRcLR0wYVtvaeGC8e9R3TT7xjsuoJMuxXGCYRVTk4Suy0tpdp5icRhCRYOWUJLl03T7PVsYzkj7sRmXguUmVHiZoizUU4tIzh2T4ZcYGiRMQWEuJV2mMJSyc1EiEY5mlLia9fzUVwC8RUHcB75bWX4OpolwU6TGGxFp8AveyWGVevN7jZE3qkSSRiu2PyfkQABcOCCT2E5nSJjYeFV4wqd3qagcAIiZ2n1Ldq2NjzhEZueAmdkHVKPoyYGl4KLaI74d784mwPP/EvWf6t4tipFLth9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=hE+Jxpu+bqCCB0HgxnWpFjb1MvlIejQWMJppcdZb1AVSAfFPOAg28fEBuaYRBzAWMRpCRMGRKwmvjqWPbmSAMQQzDs/LrGhhyjRv62kG1+67zlinIfewCjqIsYfeLV05UMvohtJXyc1DEKiE/onMonrgqyjmAf82ysIjM5r59dFmKs3PO4x2XH2ROgzDG1jkCQ2VyhEWslOmB7klyjSL3SWlbOSfv4xxrwPCQtBE1SV4LVHggq6HTz1EjmetknOX5y+9nkcFkpz4LISubhYvEkH1XDacWQUwn9p4ZrydKkghFIDchQ48fGJAbNhMjgmdnm2dRMnIufm1MzkNh3BQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=T5Vnb8ZcyrkbvidvvNFOGzhMBQHPLePKHDQfSP11psI5TmpzZ3CSUXV2AhUUC3h4SeMl9+KEBgitRgF+nKUzi/y0JATssY54MgD/Z0oyHIooUXMUKs2PSAon9to+/uffhkOm25tM/ybe1AjqUn+T0Ty2CAzX+9GvGlJXYca78Vw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1693.namprd10.prod.outlook.com
 (2603:10b6:301:a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 27 Jan
 2021 15:46:39 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 15:46:39 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/4] hw/misc/pvpanic: split-out generic and bus dependent
 code
Date: Wed, 27 Jan 2021 16:59:27 +0200
Message-Id: <1611759570-3645-2-git-send-email-mihai.carabas@oracle.com>
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
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:46:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9304e0ee-d222-4fbc-898a-08d8c2dabc20
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB169367099BCC8F922DC0D7F388BB9@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RElFXxcB1Q8lPA7/ZzfOs/5UhsvMCeruIvVmm0yDuyjrZnyQ66R/yxRVWmOqkMkgzY1rf8tALOgRiQxBF9Ras6ZoI1oQeJF+CH/9xyuKEccRx74Z6MFxRKaywSyijlgiJU0Md2vPgayEmgaX10/oEghRfl4hpi8373OCpNTAZhSiEca98hmMGru4RFQ4h1bfM6if7mwVeWRxplC678AsS49VP9rOEGPQc66EW8YVQf/fTYAdMvZEeEMtpsQnreoH/kh4pd3q4CQw2mLpXT2cPdZcVGl12hHzJlJVPXp0X4CZ+j1hR43elippXseTtNeaxWPwJ00iPmPLktPY/8H3COs4GGNooCs1km9BmHtIh3lxOHz5RlVHqiRcwh+HKhDlV/PevR24+7Ar4PkHvwnUQwfzOdTVrxzmbYakWLFX80AZm/gCff2F/20VbPH7QW0PPUFP7QMFHRjB11B4PnpjK0qtOvoZZbj1ciQ7vA9D5TSwN+7cvsuUZ0il7WCB/7FonPCl9w5K8dulmHkg35fNoXwApGGFPVB0xkgG/Yh+daU0ud++8NhBpRVNxJchFoAe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(83380400001)(86362001)(16526019)(186003)(8936002)(478600001)(6916009)(2616005)(44832011)(6506007)(66476007)(5660300002)(66556008)(6512007)(4326008)(2906002)(316002)(26005)(30864003)(6666004)(36756003)(8676002)(107886003)(52116002)(66946007)(956004)(6486002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CMay48qQ1zzDZOOQUCTxsug7UDip3MuWEqEtwEPYQnjsl8WtdHTPE5jS5uQH?=
 =?us-ascii?Q?JXt+iac/xX7Vrr5LJ9Jcfxov2chB0LEZ6ht2hAIsFu3t602k4IGEp4PMnU32?=
 =?us-ascii?Q?6JVRMdz4QGVgkuKyhlnKPgRt9SNuwjBTZqPO7NjOPvVYIbs9v9hvX/L1ZpCY?=
 =?us-ascii?Q?99LOG3lmoI22m9PSkt5JVGhDq0kR6HXYtxn0qgQ+XwL/aVppSFOy2Gb5c4b0?=
 =?us-ascii?Q?NTpguA1hhiowKOWW3dskbUkLJGtCpkg8rszdpOI0vbz06h/7KBFJDlRT9wOB?=
 =?us-ascii?Q?TKE8nJvIP6GzNNfgPmRzthdtQULz86kNb+2L6DTmjXirXEl/QAFX3bNyQxy/?=
 =?us-ascii?Q?t3U/AnBrGBvQgaXEsSnp1rQJbeE7SjKnDf2m+WcDRSsiAAbCoD64wcAprmBx?=
 =?us-ascii?Q?LW1rF7FGWsgnHeuCgu0AlgQ9YUFtbU1q/53OF0wTpjuPRckjtSVXqGIXRDzV?=
 =?us-ascii?Q?ks0tjQZN9beVxaP3ik5tooMIAZbpuPtgwIIlNN70O9w3eiwPXWjlxXjtZl74?=
 =?us-ascii?Q?lp/4hy5t+wENv6trcQ/JG7Vc83tQrb9BJJ+eJD1zlV+hqJPpVl/5zAJNjGUM?=
 =?us-ascii?Q?+m3DbRm8Hq8s9/0ZySv/TVUIVtnMEi/2bdmX4mq1U6W0PMhjwWaqOsbVbx0G?=
 =?us-ascii?Q?Cg/9kJOHOD8mCkQQMlUXMGaYAUbqEsCnfZRV15sU/WkrIRinZY5zCpGdSNi2?=
 =?us-ascii?Q?mek8IeeIIyLNpbTlh28XatcwYri5oLckX9O+EvGUDdilFCujoSSypU5s/7KV?=
 =?us-ascii?Q?Yinz56Lyyjbp2jtgapu1a6zcECMapO87rijHD+h4AurFrrpNWVWBiIJgdP9u?=
 =?us-ascii?Q?0Xn5GvsbjwQQ6xRzlgCxGPzT5/ibyV1K47u39wp3bUu1/cREGEKb3X4dpf5g?=
 =?us-ascii?Q?OGmFzZP1RkwsCQ7eeflU87g5ypaHGB/VDsLOTsmBnyYAirKLew7hb6CrMBYe?=
 =?us-ascii?Q?lQ8UNszChRzKbIq4TuGjB4d/DLJ8YRf7tkACBoUN5QlwlYVT940rqszYa3Nv?=
 =?us-ascii?Q?xklBINdF0ASzrwzz6R2fSP7+iBdOIMGiORBPxU6i21qT1iXsTOQO4uhwY2+G?=
 =?us-ascii?Q?EZoc38tN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9304e0ee-d222-4fbc-898a-08d8c2dabc20
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:46:38.9902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWTf5iP5ryu5x3r8PcC8HChFaIDvbA3ACdHsI5uh6KjD+4MidWnYcNvEhG/bI7yCg0YQ37o6FuqgCSiJ8pDbHiSi3eD2jcqRvFLzpG0XQg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
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



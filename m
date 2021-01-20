Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C894F2FCF1B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:23:56 +0100 (CET)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Bad-0005Bt-Q7
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BXx-0002xv-DL
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:21:09 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BXt-0002Gq-Ry
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:21:09 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBEpEZ154553;
 Wed, 20 Jan 2021 11:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=URic0pVh/xIl1b2txMa8SuHmGcvwop9zxidjhZ7od3gVd+NtqYGH8tbXmw4evpW3Jkbq
 tkpeLxqRGEFr76oO1rIyBf1YhxX2lyD8tq144yU1WuJU+jC6ucfucgIgjNz9PeiaaGRS
 7KCdQV5EgIN3q0zO+eRe50cpEX0mX03IHu0ctQh/iZfefUE4v7CxxGV8gHOkelwRLfF8
 J8EqmLBY59en645eKO1zv3nbjUpG0cco3YootP5g6s+kQZJMba9LtBQWaChu4vRd6+oY
 yG6W1vUMT6v1JP/xCrOSNmdpqipKB/eNfpyN8ZtGydlOojGdqRni1dYyPfHjPIXn5VWs oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qmsy8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:21:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBEl7A010918;
 Wed, 20 Jan 2021 11:19:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3020.oracle.com with ESMTP id 3668qw0cqg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIX0YxBGaC6J93vupQUQyEyWyOIslR46tCcDBOTvwl+cQY1xdCZtjWPmCKSIUMebAI7wf0BMw3UsznbSvXmiUGbmC5r+WO3avcKRrC8G5gl++nvn/csSVKytiHH433jizOuyrQjMZ3BTtECUYbttuNhC95oCkpIUDMx7opEF0JVmtnPoHg+Hz1ecSnt3wE322OpuzlwMuQv5TMfsEdoNBpNDWRdLUxFbsxNFoXLwuWg/4JuEc7SJApIxkZt/2PqTKBDFykJGarNUbYvjHFIeQMhxJ+SsL8fSvnqv+l8cBQ6zJI+rtIM5XUxf+2uSJDvpma6g/f7RT0AuH2e4mOnmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=Q0t5/6OynPwRTXXRXn0SFruxPLVV1Xy0CS/NWFtuJASOzlfC9cr1Txk+yg0ap+RFnS+dmm5vH9j3FPzI34M0Z+LSngG07IyvKNRDpus/r9hTsG767IbIKXheV34G0PctwYbZlrINZ8ZV7mONKE5bOlLL5ZHazANOjCmJbtqZuYf8OORf9kcnYOM33fOFyiZ3rX9Fzm8A/VgB4AHqjOMw9FMcv+FBOhXb1ol4vJ/znTJcugAgyU82NSXbhztc3PBDbvQL/ANN6yFkLDxZEOv6H0YAiBNVavG8+59DAcSDkZRlHxB4jVqSusunGiNDXOMT5MZob/90Zt1K5ebivgSW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp/O3xU8k/uWK2I5pmHkAImByeza11AbiTMPXo+7mBI=;
 b=BfcvC3UJT2zB654VdTxFiB/2RNEQHSWavmQve02AI0TDOJbpxXbuCtu7YqV0cq92oZ0R+bYMgScoBWUd++vnWLKQHKPsnSAOVLDfomkP/cGRu2Y4HxA+ww3YzuKb2Z3F07WmVaWCs3eakY+sCtajx0oJDtzlj/YNAgw9Zy2rbwY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1342.namprd10.prod.outlook.com
 (2603:10b6:300:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 11:19:00 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 11:19:00 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] hw/misc/pvpanic: split-out generic and bus dependent
 code
Date: Wed, 20 Jan 2021 12:31:54 +0200
Message-Id: <1611138717-1672-2-git-send-email-mihai.carabas@oracle.com>
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
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 11:18:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d44703f9-d9a8-4535-921b-08d8bd352fa7
X-MS-TrafficTypeDiagnostic: MWHPR10MB1342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1342DF12FC329154407837FA88A29@MWHPR10MB1342.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8/10TKdb3gsHspImxzMzl5W5OGPPWXO64OPPQWGBXs07rRHf75euzW1nnm/7P63SWdLRgQwc+Avje+lV7DowLj5ufwcPnbZcgL6SGVMT3xYFWeoZ/xRVbliJTs50TS42l1JiktB4IGsCdcRFjQVJxU54NDg7jcQJpswcNmvimPKaU5ob0/9ByahqeUoKzPdqIu0I5rdRp17+daHFKgkXdqO8+aOHKhhPAtw+8yAaNeiizCccvFFnoGFGlHZL6oAgAuh/dqFUTFyKz5wncbxqDrQKrGngqdRmbUh/ORFXcykMeLHcUHaV6Ca1tTeXf0UqGVC+3Qu2s7LqLV00BkhnwLGi4Cu3P9QTigtFxv5CLLx8b12RGcVYZ1az12xj+r5a9Hb4jOUAGxh/cJUoVWtXUASN9URj/YoqAJa5mrZ6zpPLsBb04kOFri88vXL8Od1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(366004)(136003)(376002)(6486002)(16526019)(6666004)(8676002)(36756003)(2906002)(86362001)(83380400001)(107886003)(6506007)(30864003)(6916009)(316002)(8936002)(5660300002)(956004)(52116002)(66946007)(44832011)(478600001)(2616005)(6512007)(66556008)(4326008)(186003)(66476007)(26005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Qt4th8u7Nk0t5pHY1dG89n9OO5FSj/+uyOkAgA/xagpZhbtfdk0zTEBRW9lF?=
 =?us-ascii?Q?zNIDVwjsH0Qfy0l0fXltmRGrosA0Bd6lvGuvCJll0fkvPJJGS1DNdhihyEDD?=
 =?us-ascii?Q?83cB/HMUthi6l2pf9o0e8pLpcq319Ur9esT93JM831gBJNZeK8/GaIP8LCg7?=
 =?us-ascii?Q?5egnlJGynyCsM6cWGjQytoBwFh8wqkv8I5VZ6GDi+9q3Pc4upB3FGrW8KgDm?=
 =?us-ascii?Q?2ZvLCQAu0E0+JHClP7QXhW2e/KZc4HJDGSw+WqvSsLm1RcOdgS066USdSV3y?=
 =?us-ascii?Q?UyMzrBQma8E+MDHySQhD+CmbbejKpwNQ+Jv8ZNx1ZLyAWDbePqEzQxtTTSsM?=
 =?us-ascii?Q?GN0Abe35p7quhXw39uWR/GtkCxcmxv4ysbKG8FXwXuVCdw3nK9T7QnOBqTbT?=
 =?us-ascii?Q?RHwkgDz9t2/lmktAz16mC01VHr5pO5FKXEZHAeIpUlxS1chpGz7DFabS7ayd?=
 =?us-ascii?Q?n5naywmCSg7WdA4PTb4/DU0XhiMd0puHx5TQ0BvrnEYEdgp9tWLUtfXk1KG3?=
 =?us-ascii?Q?iwlRwoe+2UfLVg+zopYflAW0yb92y8ByEUC9QS2g/YU8R3nPnnbwnCOFdQOZ?=
 =?us-ascii?Q?yH4rVmJJGLt/rVwDFuL3G+VbHAxJiVehpsABRZISmKqjSkbJnwPnsr+xlWtC?=
 =?us-ascii?Q?kmwzk6EyVpVohfeWE9pfk6AvxIBFQ/qus+en11DnaywRU58MdzFGumZxzt4j?=
 =?us-ascii?Q?ErSVseCLQ7kRvwWFRfz8/Xf/TdysbSktBn2lZJW+7crkXnKnjx72nghY5P2E?=
 =?us-ascii?Q?y/LWLKqJb/AF2+8dw+P4+087zckUVwtMkJz6swO97BygyEYiYJvJZ+hrCZhR?=
 =?us-ascii?Q?4K3DG+3Z+LPya+6jgOq5CZtS7K8IGb11LEkE5FM7TBHAdiFK/YKoa5k/DKEn?=
 =?us-ascii?Q?9Bqg7qoF52gOyf8D0kUJfg5xGLCdoY+ZZZ1W7PbKJU/V8QMZTg5l2/ZkEAPk?=
 =?us-ascii?Q?12JNyI1NyQ8O4OfejIzYjKCW/SxF+iCZjsdtv4ypbbAj+cEtNg+ePYRGo4zb?=
 =?us-ascii?Q?Q3a8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44703f9-d9a8-4535-921b-08d8bd352fa7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 11:19:00.5571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU81AiVRE3iRTcW9K0QBZPKAuZO5cRIFzDROl+lrS+c8jrE9MpXHGEfMBmXytl+qnIOQeJ2NtJ9xZl52mEPEHUOflr6uYALxZPw4myPhd0I=
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



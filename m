Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DD48BBFF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:48:18 +0100 (CET)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RoH-0003ql-Bd
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdZ-0000hn-LW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdW-0005fq-Ap
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:13 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMee0a019911
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=aGb/2Tx+G8Dq8TbOKwSjt3u2SlnUQSIWoy/cU8XQAdw=;
 b=lFUVQGDwg5RgQHOvf2zVnMJVJqCpfztJe06AKPZDfuCfh3E9BPl37OuOi8HeO2xSqN9x
 jcdZBwRmEX5Xaki+vY/F5qGEO1hbb/mzjGKlvKOoUlvXeAlAuIZL2KVyNYfKBapjg3H9
 YkwvLoJPx9+Gdorrde+UWggkUT/403kA1O44tuqGNFRuMJMZAwToyJpzBYb4+iyXosiX
 meKUquIueFLKaO/yNuWnIi8ef4HCcZVEgFv7Bw+jKfg+v5eITnDHQ5Wn0u5yUv5dwNsC
 FPtPEpVS44rJ9nBQJrZss5hK1Rnyz5FQj4kYYlCcsIAcmpk0w+esxTCsaW+/kPSQTkQo OQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KATZ069271
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3030.oracle.com with ESMTP id 3deyqy1gju-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xba+uEYRs/A/h8W1KcUHWO/X4gDMqGooXxIHXowW8tKDhezmH/hC9TeCoVTat4qAu9FEhhPJF/2UAdpbsANPiYCFZcu4EIKlvSDlPWQRONEc93gqGPrZrTZ3EtnfDycn8q2OQgVjAK1hxDvhMAomXqn/psP7yWH8x1XuU5912STHHhhi9K8cBS62701T7OoAh7zSNlm3Jcooq1LBsDfgZXDEUa7YnCMrgBbbf4zojPTzWYnIc06VguBG5UTIuFFpaeh8wvCsoEaU9algSkYmZE3ov1/9ab0SF4sxkQWyO/h/LLEEUsg69blkpHakNJCdxFj7FEBl5IUi7aeKmEZcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGb/2Tx+G8Dq8TbOKwSjt3u2SlnUQSIWoy/cU8XQAdw=;
 b=GhnxJCh4Nd5vI7c9wROslkE06YIA2DZw0iDk0xYdPpEJKU140wxtZu+wYI+wOskVJ963UNzZAhcNwBEMM1PvNGW+050PHkBrBvZslzLXTXjRv/5I8snGCtVfeM2NlaVBlNm1zgs6ZTZldAuagHCcA49r3EcsEDaufDQVmtr3gV4NqNSdeT1/OVpHJE8KB3N5coSgnuWwINvpivXHHYDr8PqxlSYvmA2IVb8qRzVfkxohHyiVC4WM0e2hipACvkIVp3uJlACWAx2RJQ6QBUauFXoHJiqm6CCq2I+hX1etpbW9phPBL3/oYJpNXkV2PTHiBWZyuI0iFb8kOGnbfBYYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGb/2Tx+G8Dq8TbOKwSjt3u2SlnUQSIWoy/cU8XQAdw=;
 b=rZ2w3dfQ8FjjIMPX2177dsyjV0UEAqkLlHlkMKjBsuKEqlm20R+B7iibS/3PtoyXM1TjMw7+d/3sm71jnhrPcVRc+0GdAcFW7qUARDAzlYQNxN9EA3L5nDbxThM19fujD7W0w6o8S9aSNspk0cdAJVGtrddzAwxSDPNzKFZBoRo=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 12 Jan
 2022 00:37:03 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:03 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 02/21] vfio-user: add VFIO base abstract class
Date: Tue, 11 Jan 2022 16:43:38 -0800
Message-Id: <825cf2a915fb0423d9e5930369339c5dc062c73d.1641584316.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39303cd2-6752-41a4-8fd4-08d9d563a753
X-MS-TrafficTypeDiagnostic: PH7PR10MB5813:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB58130F01D07FFCF93DEE909DB6529@PH7PR10MB5813.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:67;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /F1ULGAbziCe9ZmQ0zvlsV8qs5TSfQf3EMTdmi4elpCLo0LvsAAw5HfkJTWhJmI1c1nZtUSuAsSJy3Tm19bdU6dcOuSc5n2YV4iY8dyfx1U9Y9YlrHzDw2+1Ze+mIP6+NtIWlKJggEYfy8KH5WMAwbWJix3YnEkkzJ0SIIWnP29O6zecKwXaE79VotBIJ+NVFDyl1Zpl6eW8W0rMKVsn/1vHmLHv86Bvyx0blIyInKHdH8YzTHRhAMI1G2dP2kZhHdFB2jzu3KuNCECqnSpFUZttf24wnkz7X1QqQ3RBpZQWwiQ1x7kGz+2kjUqV+pdI8z/3emlos8w09YwmThIPJw5nZRvj0tcACXFKK5taWFcTDvqisRjC34YbOXikcPovmb5lXA6konQGjY4ELy2mgH4KJgu2ptTzYWI8+kd6Il5O+U2wmV/4oL6Nh/mC5dh8JdqkEP8zQYcOWn6PAAyLIoYQz/ZzWOHn68WnUNI2rdMLR0mYUnL66xrBcddIzKau/2ejmdtGpX/f4ttFF5BksZzAp6/xyDwjdyg1G7pjlysLib58eUyJagjYRwlViqgAyA/y2OpXjy4yoq1oaz4bmJ7pj+Q5Iu8W9UcBEAYQC4/2vZIM8+OGDkwQBaYQDnb+sgrPxAWNxGjz2ppqdrPA00tDkwbFMKMpOrigMD4QWtOs9SW3+Yq/4CXjS+yJ4KVf7UtU8jSg+YcEYYj7b7XqLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(30864003)(6506007)(8936002)(26005)(6512007)(36756003)(186003)(8676002)(52116002)(6666004)(86362001)(6916009)(6486002)(316002)(508600001)(2616005)(83380400001)(66946007)(5660300002)(38100700002)(66556008)(38350700002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TNiZYnp6AmroblFU6ZotuRPTdVVl+SRDJvYXRT2cVwW4pmULTk2KSiCFVxXT?=
 =?us-ascii?Q?vB/aMy4ExXQPef7rNvhYrOFNBHw3smSrypMmsk7UNh7qu//6hXfcE+DxZKTZ?=
 =?us-ascii?Q?yq3FxpiLDLxj9kTgXh1v+QazwDx2CG9KY0lk5LxjtFh3i6J99rQLRLuoYq/j?=
 =?us-ascii?Q?ghF9X8WG8o+Ct/KeCTuFIkvKIOAdVYYGho/lrZHgQe9fttibGTQFlUevSg3e?=
 =?us-ascii?Q?cj8RPa2TJIE+tXj28xaW3HPi3X3bq14URsu9C7OR7GVdt4kJIB7OVYI41xMX?=
 =?us-ascii?Q?Xy/cnIBgpzesDbyphJ5Hk/CCBPn9ns2uqOhyI8YoJC3oSdMkkozcaAnbqxNX?=
 =?us-ascii?Q?mB/XB/Hbhee8HSf1/KdwzMFTMqs3Fosist0P+6Rifnattx/iQMLAdSMDoywR?=
 =?us-ascii?Q?s1aC3uZj9Sh40c1hDYs2cNoAnTF9ru3ZlzUkPvnvBISPme81TZu6pzOt4tQ6?=
 =?us-ascii?Q?Az8GZfkOLeVgvXVoCdulGRvt++raRkSWvVmer3Awx4pQUcMxja4uyiVhJYzy?=
 =?us-ascii?Q?bp0eMMGGKFfvunpvH/nGwkyZYEstAkZrFFq40MRIIIgeKHd69AtXXlxi8Td2?=
 =?us-ascii?Q?UH+brnE+83lFJezaS+zES+YEW/Zd22kDlJUiVOKEdHs3NEEHsfVrkkvADfcO?=
 =?us-ascii?Q?pp9Ony1JenQcowWR/IeM1/9WK/6MSglMAiK4Ipo3maQNStc1gPzn2wFCdnAs?=
 =?us-ascii?Q?CXtvDCxi+RmEYrKrNZ7QrAVzZ0zRYnSOu6CMVxGbCl3Si8f5iuaMp+Reethy?=
 =?us-ascii?Q?qF7g9QTNLi6gornExIV05I9SklWATb3ONfrGoiKRExtn08LcNpjJkjVwRQ7O?=
 =?us-ascii?Q?GjuuDP7Me7ea5Aqa0clKoMegfZO9a2fmWGKvoenRg5p6NkkisNvYA0g0//4R?=
 =?us-ascii?Q?iCAaaTWw3yqv/KFis2mXYcP7iXrzvIrjLbdjOCMy2tGcesOw7z3hY0ZsLzLw?=
 =?us-ascii?Q?Oy3risqCGfqy7DQpOPcaVNPT7wS384Cy1T3ohVanhXs6zoqVpMMO0cqZ8MNH?=
 =?us-ascii?Q?qBglNlw8W1wiX/L9bJAdBqpA3M9zTtITgGaIMzBXu3YGEUjNEY7nHnIIh58c?=
 =?us-ascii?Q?nc4MPzn4Gf5ethMxMdex+CUIV4I/MPELMhOCXfUwuuMT3HzzZ3/DUHWz25p+?=
 =?us-ascii?Q?/H+h5Jd/d/JpI971SBCGwDLSRBkceYAy8gZdNno2eDpumeMFL4mj6KU/Ebqq?=
 =?us-ascii?Q?4CPxmELeOdlBkJXyKI6b/fLzVY6Tumcxf94z/+wTP6m/XmEmSWGV5TSDLjj2?=
 =?us-ascii?Q?cFRMNCazfhRISOPWvW6QzCoJNKonJO6TwG8/kIuQf10l2E4CAz36IO6rOXT1?=
 =?us-ascii?Q?yjWL6Un1GQF40lej7hJBYGKzOwIL2GWBmKsF2VbDHbjeOQGAqCPMM8xUEEHT?=
 =?us-ascii?Q?Gos+xZcgNCK/tfbe1PocdK/jHwz7D/qMSCFSutt7x07TfO5qcBVgU2nElInS?=
 =?us-ascii?Q?e7NGKMIOv1kCwXDvH7wqJwGFNxIkuKX8nBTZrr07XaOhmO8JVuPbGCApMzo6?=
 =?us-ascii?Q?9R/XqVo47+5S2q5YqEUWvCUxiFZrsYDwLnVMAnV32LcMdGOc21EhWB4KG3BH?=
 =?us-ascii?Q?ru87qmHknqp6vMv9wnCEDH7mIIoiX+xAJs+NmwOdVymYLsXrwd9PS+rB7MpE?=
 =?us-ascii?Q?WUn88XPC6jY08R3xe0iwSWgNa4CNReOaZ/KYgHkLNX1jpQ4Wr2N3lfKbJjZc?=
 =?us-ascii?Q?6P2LSQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39303cd2-6752-41a4-8fd4-08d9d563a753
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:03.6635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5/902lr47Ri7MGl2ojBFpyNl59KF4VIAae9iiM7a+HF9EGu7qPeTpf2DXRqevO9szV95ipGezBo7pfDmnWLsJxrEKrIcZa5OEN+3AINCNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: NJ4Lfg2bwEUJshy6a7mX-OoVakch_yjo
X-Proofpoint-ORIG-GUID: NJ4Lfg2bwEUJshy6a7mX-OoVakch_yjo
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an abstract base class both the kernel driver
and user socket implementations can use to share code.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h |  16 +++++++--
 hw/vfio/pci.c | 106 +++++++++++++++++++++++++++++++++++-----------------------
 2 files changed, 78 insertions(+), 44 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 6477751..bbc78aa 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -114,8 +114,13 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
-#define TYPE_VFIO_PCI "vfio-pci"
-OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
+/*
+ * TYPE_VFIO_PCI_BASE is an abstract type used to share code
+ * between VFIO implementations that use a kernel driver
+ * with those that use user sockets.
+ */
+#define TYPE_VFIO_PCI_BASE "vfio-pci-base"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_BASE)
 
 struct VFIOPCIDevice {
     PCIDevice pdev;
@@ -175,6 +180,13 @@ struct VFIOPCIDevice {
     Notifier irqchip_change_notifier;
 };
 
+#define TYPE_VFIO_PCI "vfio-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOKernPCIDevice, VFIO_PCI)
+
+struct VFIOKernPCIDevice {
+    VFIOPCIDevice device;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7b45353..d00a162 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -231,7 +231,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
 
 static void vfio_intx_routing_notifier(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     PCIINTxRoute route;
 
     if (vdev->interrupt != VFIO_INT_INTx) {
@@ -457,7 +457,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
     int ret;
 
@@ -542,7 +542,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
 
 static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector = &vdev->msi_vectors[nr];
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
@@ -1063,7 +1063,7 @@ static const MemoryRegionOps vfio_vga_ops = {
  */
 static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIORegion *region = &vdev->bars[bar].region;
     MemoryRegion *mmap_mr, *region_mr, *base_mr;
     PCIIORegion *r;
@@ -1109,7 +1109,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
  */
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1142,7 +1142,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
@@ -2799,7 +2799,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
 
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
@@ -3122,7 +3122,7 @@ error:
 
 static void vfio_instance_finalize(Object *obj)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_display_finalize(vdev);
@@ -3142,7 +3142,7 @@ static void vfio_instance_finalize(Object *obj)
 
 static void vfio_exitfn(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
@@ -3161,7 +3161,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
 static void vfio_pci_reset(DeviceState *dev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
 
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
@@ -3201,7 +3201,7 @@ post_reset:
 static void vfio_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
 
     device_add_bootindex_property(obj, &vdev->bootindex,
                                   "bootindex", NULL,
@@ -3218,24 +3218,12 @@ static void vfio_instance_init(Object *obj)
     pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
-static Property vfio_pci_dev_properties[] = {
-    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
-    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+static Property vfio_pci_base_dev_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
                             vbasedev.pre_copy_dirty_page_tracking,
                             ON_OFF_AUTO_ON),
-    DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
-                            display, ON_OFF_AUTO_OFF),
-    DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
-    DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
     DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
                        intx.mmap_timeout, 1100),
-    DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
-                    VFIO_FEATURE_ENABLE_VGA_BIT, false),
-    DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
-                    VFIO_FEATURE_ENABLE_REQ_BIT, true),
-    DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
-                    VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
     DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
                      vbasedev.enable_migration, false),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
@@ -3244,8 +3232,6 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
     DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
     DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
-    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
-                     no_geforce_quirks, false),
     DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
                      false),
     DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
@@ -3256,10 +3242,6 @@ static Property vfio_pci_dev_properties[] = {
                        sub_vendor_id, PCI_ANY_ID),
     DEFINE_PROP_UINT32("x-pci-sub-device-id", VFIOPCIDevice,
                        sub_device_id, PCI_ANY_ID),
-    DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
-    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
-                                   nv_gpudirect_clique,
-                                   qdev_prop_nv_gpudirect_clique, uint8_t),
     DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
                                 OFF_AUTOPCIBAR_OFF),
     /*
@@ -3270,28 +3252,25 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
-    dc->reset = vfio_pci_reset;
-    device_class_set_props(dc, vfio_pci_dev_properties);
-    dc->desc = "VFIO-based PCI device assignment";
+    device_class_set_props(dc, vfio_pci_base_dev_properties);
+    dc->desc = "VFIO PCI base device";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    pdc->realize = vfio_realize;
     pdc->exit = vfio_exitfn;
     pdc->config_read = vfio_pci_read_config;
     pdc->config_write = vfio_pci_write_config;
 }
 
-static const TypeInfo vfio_pci_dev_info = {
-    .name = TYPE_VFIO_PCI,
+static const TypeInfo vfio_pci_base_dev_info = {
+    .name = TYPE_VFIO_PCI_BASE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VFIOPCIDevice),
-    .class_init = vfio_pci_dev_class_init,
-    .instance_init = vfio_instance_init,
-    .instance_finalize = vfio_instance_finalize,
+    .instance_size = 0,
+    .abstract = true,
+    .class_init = vfio_pci_base_dev_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -3299,6 +3278,48 @@ static const TypeInfo vfio_pci_dev_info = {
     },
 };
 
+static Property vfio_pci_dev_properties[] = {
+    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
+    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
+                            display, ON_OFF_AUTO_OFF),
+    DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
+    DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
+    DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
+                    VFIO_FEATURE_ENABLE_VGA_BIT, false),
+    DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
+                    VFIO_FEATURE_ENABLE_REQ_BIT, true),
+    DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
+                    VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
+    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
+                     no_geforce_quirks, false),
+    DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
+    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
+                                   nv_gpudirect_clique,
+                                   qdev_prop_nv_gpudirect_clique, uint8_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    dc->reset = vfio_pci_reset;
+    device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->desc = "VFIO-based PCI device assignment";
+    pdc->realize = vfio_realize;
+}
+
+static const TypeInfo vfio_pci_dev_info = {
+    .name = TYPE_VFIO_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOKernPCIDevice),
+    .class_init = vfio_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_instance_finalize,
+};
+
 static Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
     DEFINE_PROP_END_OF_LIST(),
@@ -3315,12 +3336,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
     .name = TYPE_VFIO_PCI_NOHOTPLUG,
     .parent = TYPE_VFIO_PCI,
-    .instance_size = sizeof(VFIOPCIDevice),
+    .instance_size = sizeof(VFIOKernPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
 
 static void register_vfio_pci_dev_type(void)
 {
+    type_register_static(&vfio_pci_base_dev_info);
     type_register_static(&vfio_pci_dev_info);
     type_register_static(&vfio_pci_nohotplug_dev_info);
 }
-- 
1.8.3.1



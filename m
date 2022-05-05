Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96E51C68C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:51:26 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfdN-0004qK-9v
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0z-0006B8-VM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0s-0002BC-JT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FTMUW030007
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=WJrXH9w4WXzMwxBe2udP8+wGYiE0ysr7klSvd1YyjGg=;
 b=dG5ov3DylixNer4tOQJsJeUwU3IPn+6e1yKl1NVjijNRgr+Xz7rZmDkcoX8NjejoaUXn
 6taxI6KDsjXGBOQZ9S8OOJQwnjxmk3ZwJ9CpvXge0kg48JMntycWWBccY5b8kW3oX5ae
 Z4EqCDmd36Zr+g8R5Hk55VSgp4K9cdQ/ryqjPF+2jy+MYWJTD2FJez8p5l8RwOBdhNyz
 OQB7IAo9Le7tDC0d9Aktzbv6ILormKUCnxrDD38cCs/fDs1GJtRzHemE4su0a6ioAO7B
 h2W9Oqx4IttrBWY5Io0Z5v9JMJ0WDzzejOoumfGsTDOp4/4P9zCnuTIotqu/uVPl3YNR Tg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m36w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:18 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0sqK013487
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4xq8q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX0WM9+LeNsWUkS3ceT+yaiYYVq2vjh+40TpKsPKtoaZ5uZnPAt88lH8cbfsdsZKa4zMgbhFNEzevtzGZGlaioEASFA32IR6QaMrLd9oa6s9EuhPTRm+TtdlbM9IIO477ogy/Z3+egdvCnflHFthstxggk37sqbwcLyzFNU7oJnUC4TfdrmPBwzuVhndUv/2f11/CZqbqThfnvitP+R01PaFXh1c+6MDOKWy+TxyyYp2z6UYMkzyHO5h0sqHDRyL/PTIU4svfWSKrhPA136qcxhIMZ2ZDwzvxwiYi+jeKEcGZJLhfFhJ7/YNp9vs6/usnmJj2TxuqUc77sSwgREcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJrXH9w4WXzMwxBe2udP8+wGYiE0ysr7klSvd1YyjGg=;
 b=jKQjkYGMgdARwyFy4yhAjf7iDj9t1YYQudmeLFKuCkOmFqRuekH/exr8lNHxZI4PasD2AkN9WYP3e+1XHFFEvZtNaqnaaQEjEHneIafi/3/M9ZDbdOvJ6tQz5m3b7Zu4/iJp5flF99KLMZ4tj+xrbwSICwk3I21Bon3D6GzgQK8M3GssgTyCdc4H1YCDdEiEazUsurvjTjDQTshaFrknGWXdjB5z2+Xz2LZmipZDqP1bSy2oi/h+Fu5D+Zs0cZqEdg31cX7BjatPLyiVctsO0vjT97/d/wzXw5yz4KGsMASpBwDPkEhVKNjCb34oGRw7+o0BNo92JkcDxXaWb+3r+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJrXH9w4WXzMwxBe2udP8+wGYiE0ysr7klSvd1YyjGg=;
 b=ztfcr19FFaanLFlZqWiV62avD55seMU32UjgoGjnxbcCw5jnJIqP4n5SqX+Or4MBIj+iHxFkYsN1M+gNYZbGD+L3wXWgM3ULkfdtfWBeHtJJzbYRv7K011JofOB9lGifZL77itaPkCyqglKL7NciXregTGtQfaIrv5oSFvtY3Ck=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:16 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 02/23] vfio-user: add VFIO base abstract class
Date: Thu,  5 May 2022 10:19:45 -0700
Message-Id: <16e96a8cef34aba538588d8a4b2949523622b3d3.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13a2a28d-8d46-41d9-0da5-08da2eba438a
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1867345B73778517DF85EE16B6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ar7WMpji79w2uA9yNPBRdY6XQVEVvwr2pfecUPhXf5HWTYkcrZWCTY2yi7WsZPc6CtfXM8aWb9bdJObPD3eKhVmeBGA/FgyEIDXQQs1wU0iY1o54C+dkmGAQ/LYhVXCbrWLpIDzVAxj3RBj6AJnc4C673cA4OWsj2pHjt5MhQnC3sW3RD79kNlI4jTKB5jd5OGX0zBGalETB+ow0GSljCbq+OflvB1IY61n1FVieES9ezUjJtkpDgKdVYSWmMTd2x+3yMAv0clpG7R2f3y/TmiY7PVRoo/BtYgRZO9XWcOY136+skzR5Ex7+WXn5bXoyo9mjrpesOLEhDQ9ZNHlmoyswTz2av91msvScIMMvPpGianSCR4EB5v4YxBiFgkhpXf5BheXHFhemZ1Q5yXCCOaSFVnH2CIWdm8DMHA8vviZjoqR05Ng4Tf5MvkQxabXi1/4kssnyP8gePDD1j562BsHxVEOlt6+3IqFhXB09N8bO5EutnkxSms+k/WO/DeUZGyHWW0QmMNSKJGhOvnMhssiZz5ZnU0AyC/7UUtImgkWpJCQ8d+0zIhxvvbSn0X4+567+8og7defwpxM/XL22NI5od2VZKzClEQIdVVnVfDRjJ+ufhx52ZR5PXc4Ku2TY/UAA+9ofQUJX62YtHOwmLbhnmxKgwrO34HhbfpL9bVl0VW9K5w8VbmxhR+mGGdIOfLbnkVBrm51HpXmZHVBxhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(30864003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mbos/j91dpuYZ6vejLFjQAKbxbNSKyEbEvFXjvtGlEo9eBJ5motlBPrO2iwb?=
 =?us-ascii?Q?syJLj7YkR2/N/cWjMWFWBsEQY0hfUN6sI50XICttt6j/UzAyNuqidp5xOzUs?=
 =?us-ascii?Q?6iWQLO9FZXRhbYdgBAWGH/QMwIZd5XwaGr7xwiassJdn88ZKOgWIkrZWFWwn?=
 =?us-ascii?Q?fe3Kn7mL4DRhfjrDNtqTr2VLRL+GhDnV7YcD8YaL+Y0bd36BiO8tm4DSe2hT?=
 =?us-ascii?Q?JD2xwcP/Rx8yMvb8x/tUGrTgQt5n2bGRKNqJTsySzeXhZzRLa+zpHvbxDjCa?=
 =?us-ascii?Q?H7J4NZGo/0Y/82+iB8de9KXpy0klFdUz87gy/r0suT1gwWdumxxGMqMrJCE9?=
 =?us-ascii?Q?6BQwIqIfFxgPNzY7YLuta4oslyc+so6IoYCiTQdPTr1NfTsOZnrdGwZyaVI6?=
 =?us-ascii?Q?DsAS+PtPDVf8x1z2wmuIZrJHwd2m4MSoJeXqCNAwFZbMyUF7KnsqKKbLN3Cq?=
 =?us-ascii?Q?6LA4DUu1XpdaihHSGqZr/iI4VSsUbYKZ9X1UDrKNlsf4hWZdwIXnxMfhNfQ1?=
 =?us-ascii?Q?bpd5iy7eDMUdvWgQE6dhAyuHE8iOq1YPDjAUInQI2BVjkFF7/lX5XwEyk8Nt?=
 =?us-ascii?Q?wMd6CYu3Vg/n2K7tLTriqryR2r3SlBWmgB8gInzAqC0E6ypk4sL+5INUDl30?=
 =?us-ascii?Q?XKWxIAv+/Bf8gY0B4/heZa95u55av4wxoPnKnV/Aam7yYMw8qLzdJqAOUJGv?=
 =?us-ascii?Q?fic8ukdvHO3BxOY8BcD2146YCXG8TDxvu/CLuxuNhJZv2RGxuLQJrdyile8J?=
 =?us-ascii?Q?zm0JgZ6BMDX1LgNfCTx+4YvLufr9IpvICR0mB+THuJLPvvoJkID4OsZbquLy?=
 =?us-ascii?Q?2PXL9ZSn/RMDsn6ykK0+v8HjCDLEywqr5IStgh5bn9zbRdNJ6ZP0Nk35LJoA?=
 =?us-ascii?Q?fXlfygBc20MbKAp72xdp+bw2c8uGn9dc+9nt7nXf68Nse1NKSjYHrJGSh4kW?=
 =?us-ascii?Q?g3QqXspw0VpAh9DZmfFJzlQTNNqp1IKng5woV9LnEXpImP61ktU+ze+wfGS+?=
 =?us-ascii?Q?BImRIIrDGSaQOdzmKhLExV1wN7LXZJPMiUhzLYiyeAHUCwA00MPhqxRrWY/k?=
 =?us-ascii?Q?ZE56Au0eVDdZmDUM9PDZ9pzU4A5KLNQzSqWwXzmLbKg2JIZWVZ7z+V4dBKWp?=
 =?us-ascii?Q?Y/pbokOcsYs/yd/bOTtnVjRlFp/T/rs/hf0fMELiWWFqzr0v6Cci3ljWdq+G?=
 =?us-ascii?Q?f13Fno3DDyr3fmrNy2QvT4orpD+MthmxVsSp3tiiaNdDqrYcaYzW/9MoWGaJ?=
 =?us-ascii?Q?XibaSAk90tck2cJQAjdR6p5n38jBZsHghw5YjxCpdfE9BozhmIyD+0cVj7YP?=
 =?us-ascii?Q?v/Q/oYZPMPaBidVMICw73h+Da5Lx8ep+RrUKab/J+/9P53HScPwredd+X57o?=
 =?us-ascii?Q?1hv81GopR5oGyNh66mrlSmpJaRgevBqBuv9xMQrV6mH/ASU8y+viQo8bOfwo?=
 =?us-ascii?Q?Rl2G/yDFdtBGgWkmKlc8WOzRN8tgH7Ui53Fy7V/QU09L8c+9JXqxEq1BsqZc?=
 =?us-ascii?Q?N1IrFFMWfg//G8GAKFccwVbyT/RNDemwE8aRLriDKWFoW2lb33x3/+ErBwpm?=
 =?us-ascii?Q?yBpLo5HuCcUfzCcXpGMRGg7so9om43r4zmWAtahEysiUZQgHEf3cSZ0qa+gy?=
 =?us-ascii?Q?MpuxWB1JI97AxgJsRkMzL2rTd8bJReS0K6ePSFt0SffMx1RdPzaInBxZNgNC?=
 =?us-ascii?Q?LzAhWSOQ7EgqRdhkeP5LwlYEaBemBwWl4cwmlpMsUuj3XnOXlwsoo92Bh8Vo?=
 =?us-ascii?Q?VjJSlDoxaTEU+PXo8YKhQiN6lt/LBOE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a2a28d-8d46-41d9-0da5-08da2eba438a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:15.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY73RMBMmpUDyCPnTet4QgLpLEBY26f9dh94jQcUROv61EiAq+T+kRwUel2wo2yuY69RZCfF5/dmEsj9Kwz/DvGa+5Bz5P7LmmgKW0aCyak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: uoQCkJ_aMrzi_GY8DjbzTr1Tc3NNnSBx
X-Proofpoint-GUID: uoQCkJ_aMrzi_GY8DjbzTr1Tc3NNnSBx
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 9fd9fae..4ee5215 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -231,7 +231,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
 
 static void vfio_intx_routing_notifier(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     PCIINTxRoute route;
 
     if (vdev->interrupt != VFIO_INT_INTx) {
@@ -460,7 +460,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
     int ret;
 
@@ -545,7 +545,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
 
 static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector = &vdev->msi_vectors[nr];
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
@@ -1066,7 +1066,7 @@ static const MemoryRegionOps vfio_vga_ops = {
  */
 static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIORegion *region = &vdev->bars[bar].region;
     MemoryRegion *mmap_mr, *region_mr, *base_mr;
     PCIIORegion *r;
@@ -1112,7 +1112,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
  */
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1145,7 +1145,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
@@ -2802,7 +2802,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
 
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
@@ -3125,7 +3125,7 @@ error:
 
 static void vfio_instance_finalize(Object *obj)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_display_finalize(vdev);
@@ -3145,7 +3145,7 @@ static void vfio_instance_finalize(Object *obj)
 
 static void vfio_exitfn(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
@@ -3164,7 +3164,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
 static void vfio_pci_reset(DeviceState *dev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
 
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
@@ -3204,7 +3204,7 @@ post_reset:
 static void vfio_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
 
     device_add_bootindex_property(obj, &vdev->bootindex,
                                   "bootindex", NULL,
@@ -3221,24 +3221,12 @@ static void vfio_instance_init(Object *obj)
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
@@ -3247,8 +3235,6 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
     DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
     DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
-    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
-                     no_geforce_quirks, false),
     DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
                      false),
     DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
@@ -3259,10 +3245,6 @@ static Property vfio_pci_dev_properties[] = {
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
@@ -3273,28 +3255,25 @@ static Property vfio_pci_dev_properties[] = {
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
@@ -3302,6 +3281,48 @@ static const TypeInfo vfio_pci_dev_info = {
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
@@ -3318,12 +3339,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
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



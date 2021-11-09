Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14795449FFE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:52:29 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFNE-0003cG-5n
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAf-0005gh-TR
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046U-48
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A90AULi025572
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=oiTaCiXWI+82kZlxU01Semjd1b8jMpCvjIjXOp7FoGc=;
 b=QwyQiDbBXM6lRKPfc8fPq2mu2LpLNZbOpBJe/T06xRrOgDmMhBSPRTRfSVo5rv4y4Ope
 G0SPDHuaxd4UUOC0qPPaK4Wt+6eF/PvDfPiTXydnT+FvH9bEODDvJkqpVe6nGXmIT9Vx
 A8UhUH1BERZTJkCPVWnvlSPM5lzEO+vuya55ovzcT3jakeBFohWDxARedOA7cjouJ+5b
 w0Zjn5pTNUT2QRP6ikyNRP7VnnysxQnr9rDb6NQR1bsFIWyyQcyyemVYm5S+CN5SPnju
 xSGPjdiZFje8tad+E3b/9epWiWb6dFc89h42Tzkw+Gur7uYgLNU2QcYw26l76JboEX0L 1A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6t7077j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Zxm1132637
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frd6sqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSb9G8t+yUhPfoc9v6ZoM0K5sXZ7L2gEZBvTr7+2hvGwexKhVa+2KDt1O83H/3xSYrSKoEwU+oUlraGYt7VEzVssTm6r1/oLSmST9SVcEgAZsgZP9QVNh30iblZBDnJoJ8b8nCX62Pd+96UUTQjHkzawkbhaFgWk76tjzuwi4L6jMuIShmQ5FlBkqbGer0iUobURBim5AZor7zkyw8SxcJpwQ9eGnSN/GlTVXAVzPIpFScFTgdMTWYAVuCaSnEc76aoeDSw2QB44GyaTSP2bP7Lx8vLk8zEgod6Rt/7MmdatPhf2Z0eceFgFzLTF4T9k7ksuXQ7qXA/X5B9eROZaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiTaCiXWI+82kZlxU01Semjd1b8jMpCvjIjXOp7FoGc=;
 b=Rw5gwcA+yN5uwhqpdnn2AywIk1K29gFM72z6n1lFAqT0KLu6E/1BDg1jeqRYTUbumRSd4wFBPc1nOXo59RirD5SkaCg5xbS6qA0ycqY2Y3fmCe55M5Y3NtyitBMhOsj+DzpBOUWgGR0I6BI3P7GmOmaiqwWQp4jiOXAmuIS0WwZgRVA5qiCfgo1W67NaEqVfDDkUpbFwvPSFzhd+LI7/H9jmiqN8ApwHAhYAtRr/+vZTr8UqNWdzBLjISFo4/poOYBv1orQEoVlQBh80lB0Jx0LSjnAu5gDImtNpwVzbj1JXOUvG8YLhwD9rZ8go24luDq2CRMhmJ+nQnSspTp6t3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiTaCiXWI+82kZlxU01Semjd1b8jMpCvjIjXOp7FoGc=;
 b=HQN/fd+V2zaeJRQCwytpix+uO8YdN+2uKs4R92iaDv2ekwZXHnxHx8DhgyWpcQbc+iFJcY6haLH1zemUEvOevivOjkKLRsgccdRh0/fnMVo+y0obY55GKBQa+YI97yKikyxveP5i94lyF1zg2aMhV+b1Xuetk4XQZ1Cuo4chygA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:11 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:11 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 05/19] Add validation ops vector
Date: Mon,  8 Nov 2021 16:46:33 -0800
Message-Id: <327df73b51de7a11657aea61295d735fdd0427fb.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c77cc0-dbb4-4e45-3cbb-08d9a3195923
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40688C88D0D0487AD820B1C1B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hc18Nghg92xqvAHbSrbcTPemcYxvnnfl4yVpHbIMDeCk80NPC2TT1NHz+6Gqa9JnWeZv1FgnBO98LxspJK3ICmXu5cKJukcxgrkSnAqWtCSXNskXlPQb9TFm7Pw7IsZbwckh/TByXcf5ssBXsLUSlqNw/jn3cJK8fqbfLalFJ7wi/YfKebaaYK9hYmZpDj7wXMSuRjnwJYVlb9KNCnWlwzw6Rw3SWO5Cb04TJ7tFCgDyW4u1AVCmd0ORE7ztWTMz42d1koqPHzzttR7RoUI/w1LBjeKSBFsHOD7hRKDaTeWVwCtAhXvCcqfQGJWKPdG84ehh/pZHrtsSYJw+bRFfkOFMxZaYql/UqV+TaqbaOVMivBILSlNb/linOVnI7Ik/EK2Q73/nb37m6YDs4VinBIOCQdUR5NX0BtaCzxtJ/eUVfQmPBAgRsbQNYqBNlm7YOV7s159+hkHcK/yqjRPPQ6VGqvP8D7pPpBJ27bpTnW1u/BoDSeRhcgENgjjNXhkPTLC+8OwrxF+35vxcfCHB89ApsGmGcG+dE74AYcDgSqWeoFxoZsNL+o4AHs2MFq8jKk4n9gdBj9YBwtq5qVlfxWlqG8RPX8rFrkUqOMZOIKwm48cNZX1rVXVF2WvPAwu5tT4fHdddIoc7CtVCGyOjXGurZOyTgMy1v26SxP3a7ywfFr4ngB5qYcShKEBoBQFkTGmVQODWBdglMtMMKcy2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkR7qO+Aip/oqpypBjgc6XTTQ6KYFmlqoh1onhE6DMTywPw5Al8xjeR5newh?=
 =?us-ascii?Q?tHStLu+xf5wQywsjSxaxQn9Q7qCMYA4TUg91fchp78SpQGB/BKf3HzfZb8Ic?=
 =?us-ascii?Q?uo7Jw2/XGRpTCfyVn1tuT5XpjvOjXzbU3Vo5lkT65pyvhjOqzoGHrDc6xw0m?=
 =?us-ascii?Q?gaXcJY9EdDjwXCbd9jsDnVPX3D93FlYTnjKfbJEFXh1ioJcyGoWx9e3cGNxV?=
 =?us-ascii?Q?8D5+DDVkTQwDm+NkSDORKPMqTf/CYGH8LZ9W+gn0E6Gnre0Gg0JvqC48ZNjp?=
 =?us-ascii?Q?VUG6QQQVLfYlD9L5W1lSF3HCWTicQyVHNPL/jV8t50mHLE2SIU+BOQypj4sE?=
 =?us-ascii?Q?OT0QMK+ymxXzHpsyA7kkj8iw+kGS43imUbr/5284GEbPeQ+R4p9zp7nWPn06?=
 =?us-ascii?Q?c8Q8i5xXtEJ8Jh30Fp81CStN4Cs44gzqqDAdxzrift+5PMzw+okx4YhiaUdx?=
 =?us-ascii?Q?SBiORev2KbPqRdefRAyBu3Dewcv532H79PIdQiwtuzwZ/7oDntFZ2GNc5br6?=
 =?us-ascii?Q?uLvA51gcQnM2uwnQY6CheksU8YmOxjaIELBND9hBHqV2N1G7Y886IQDEttWs?=
 =?us-ascii?Q?S4eHKKmbSgllDH1St7FQPmI6Mzvn6jt6/OpO7HHN+2klKgpVyxsXrlfXgAz+?=
 =?us-ascii?Q?woh7aa/8s3jUkdaNPG2+nKGT28Eggi4QpzMXVDLLMjJGq1OIfCw0vd8RSfSO?=
 =?us-ascii?Q?FDlFr4ypj2fwpLCzDkeIAG0FUfa7GTKxCE2mKjXWNn/J1iGiZ2y5jIheYQjm?=
 =?us-ascii?Q?IjPKpgxYcDejEF4xKG7SAWNJU+9wRWUbGv8jmFLYgaEeNzyKQy8RIEoegIap?=
 =?us-ascii?Q?7FC5zvFuipXVhAtwurUkRxWssEvvEpfzBH2RtPDgxrEEoIfOsceSKFHyyR9y?=
 =?us-ascii?Q?UAwQ2eWvQVfK/jEOxryw6sF27pW7kjtutlJxh5+1WaZuccLX4+BRbh+QT1Q7?=
 =?us-ascii?Q?Q8AQlD0fobSDcocxZkZaiIZ44VunDJDLo6QByS78w711/1qBGvcXWF84qyZp?=
 =?us-ascii?Q?cmwpufkR/DC7A98ybGgVzAxT+0odbcitYrqfmS8sH7ZNAOQgxi3bfjr/Phnm?=
 =?us-ascii?Q?1a2c/piTz5MDXQD82EcIihu7i3rVDlf0m4Cr9wQwV14qnPHPRVBjNs8XHeDv?=
 =?us-ascii?Q?aoxmd/ofVOTzsBsAbW0UFICDx3C8205IOI2RzNElO8FIEoGr6gbenHH85v/g?=
 =?us-ascii?Q?iycYT7AlhSbk0/if87HaHWxPgtvYLZwgzt86kKPAQ8uQXYtzrWwT7ihCEbqM?=
 =?us-ascii?Q?aleD1NsL8V4b4oHR4Ev3C9G5T12l4ZogiaQ51DV1p1v9s0n0HlfFVIuOhvo6?=
 =?us-ascii?Q?cID51dzyIbJVbWoMXLmSqOamyu3OBDAEmMp8pvIsMtKPwSUnNEMxhy+uf8O2?=
 =?us-ascii?Q?N5EIpTMNg8Rl+mLoaDpN6u+OKL3IIxbMKRDLwRp30xDusXG9EGeE2QOQlLSQ?=
 =?us-ascii?Q?tv2yqG+HQ/XrBgQGnKwEfBVCh3uUI6epmLO23SjuM35fYx232MR81b9yRs43?=
 =?us-ascii?Q?pPcjtOJAEEMCQfYEuuoEHEmBRK6zVTuHdiQYD9bJc1K78uYMiQXu2CXa7CM7?=
 =?us-ascii?Q?z4/UiFUw0fjlsy84DyoDNsyRodnssSZfugc3btnYyJqFE3FJvQOnmd2MfVi5?=
 =?us-ascii?Q?No+y/22D2WKfH2hmoI6eqbiGxKO5eFydiTxQHSFCBPscSyRVQahJxSpfYOvn?=
 =?us-ascii?Q?KTdBaA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c77cc0-dbb4-4e45-3cbb-08d9a3195923
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:11.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zW2DYBjPONCrmXwyF4t5H87JCT8To8hf+ZUz1FltJlRF+CnfsIxZw/u5fyF2I+mpDrSJWftmxOfsJB5W+Xs8sg+kmtIjc2Ijf85igMJ9cfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: Hepw9OuyqnTmFq0cwipdenzR7VuCZLoh
X-Proofpoint-ORIG-GUID: Hepw9OuyqnTmFq0cwipdenzR7VuCZLoh
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Validates cases where the return values aren't fully trusted
(prep work for vfio-user, where the return values from the
remote process aren't trusted)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h | 21 ++++++++++++++
 hw/vfio/pci.c                 | 67 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 43fa948..c0dbbfb 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -125,6 +125,7 @@ typedef struct VFIOHostDMAWindow {
 
 typedef struct VFIODeviceOps VFIODeviceOps;
 typedef struct VFIODevIO VFIODevIO;
+typedef struct VFIOValidOps VFIOValidOps;
 
 typedef struct VFIODevice {
     QLIST_ENTRY(VFIODevice) next;
@@ -141,6 +142,7 @@ typedef struct VFIODevice {
     bool enable_migration;
     VFIODeviceOps *ops;
     VFIODevIO *io_ops;
+    VFIOValidOps *valid_ops;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
@@ -214,6 +216,25 @@ struct VFIOContIO {
 extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
 
+/*
+ * This ops vector allows for bus-specific verification
+ * routines in cases where the server may not be fully
+ * trusted.
+ */
+struct VFIOValidOps {
+    int (*validate_get_info)(VFIODevice *vdev, struct vfio_device_info *info);
+    int (*validate_get_region_info)(VFIODevice *vdev,
+                                    struct vfio_region_info *info, int *fd);
+    int (*validate_get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *info);
+};
+
+#define VDEV_VALID_INFO(vdev, info) \
+    ((vdev)->valid_ops->validate_get_info((vdev), (info)))
+#define VDEV_VALID_REGION_INFO(vdev, info, fd) \
+    ((vdev)->valid_ops->validate_get_region_info((vdev), (info), (fd)))
+#define VDEV_VALID_IRQ_INFO(vdev, irq) \
+    ((vdev)->valid_ops->validate_get_irq_info((vdev), (irq)))
+
 #endif /* CONFIG_LINUX */
 
 typedef struct VFIOGroup {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 28f21f8..6e2ce35 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3371,3 +3371,70 @@ static void register_vfio_pci_dev_type(void)
 }
 
 type_init(register_vfio_pci_dev_type)
+
+
+/*
+ * PCI validation ops - used when return values need
+ * validation before use
+ */
+
+static int vfio_pci_valid_info(VFIODevice *vbasedev,
+                               struct vfio_device_info *info)
+{
+    /* must be PCI */
+    if ((info->flags & VFIO_DEVICE_FLAGS_PCI) == 0) {
+        return -EINVAL;
+    }
+    /* only other valid flag is reset */
+    if (info->flags & ~(VFIO_DEVICE_FLAGS_PCI | VFIO_DEVICE_FLAGS_RESET)) {
+        return -EINVAL;
+    }
+    /* account for extra migration region */
+    if (info->num_regions > VFIO_PCI_NUM_REGIONS + 1) {
+        return -EINVAL;
+    }
+    if (info->num_irqs > VFIO_PCI_NUM_IRQS) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int vfio_pci_valid_region_info(VFIODevice *vbasedev,
+                                          struct vfio_region_info *info,
+                                          int *fd)
+{
+    if (info->flags & ~(VFIO_REGION_INFO_FLAG_READ |
+                        VFIO_REGION_INFO_FLAG_WRITE |
+                        VFIO_REGION_INFO_FLAG_MMAP |
+                        VFIO_REGION_INFO_FLAG_CAPS)) {
+        return -EINVAL;
+    }
+    if (info->index > vbasedev->num_regions) {
+        return -EINVAL;
+    }
+    /* cap_offset in valid area */
+    if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) &&
+        (info->cap_offset < sizeof(*info) || info->cap_offset > info->argsz)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int vfio_pci_valid_irq_info(VFIODevice *vbasedev,
+                                 struct vfio_irq_info *info)
+{
+    if (info->flags & ~(VFIO_IRQ_INFO_EVENTFD | VFIO_IRQ_INFO_MASKABLE |
+                        VFIO_IRQ_INFO_AUTOMASKED | VFIO_IRQ_INFO_NORESIZE)) {
+        return -EINVAL;
+    }
+    if (info->index > vbasedev->num_irqs) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+struct VFIOValidOps vfio_pci_valid_ops = {
+    .validate_get_info = vfio_pci_valid_info,
+    .validate_get_region_info = vfio_pci_valid_region_info,
+    .validate_get_irq_info = vfio_pci_valid_irq_info,
+};
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3140248BC61
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:23:38 +0100 (CET)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SMT-0005J2-At
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:23:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdp-00012K-Bp
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdk-0005h9-4G
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:29 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMYZlh025152
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=CBdoS7bMGDKBaL55hN61apnrk+sRrMB3NXOS/k66Tck=;
 b=r1VFZmdx2wRYWt4NbO0OEugO5iy7UgA+xE8lRc+Xn4bONWV2AzqDMdgbGZ272HZ/ZjhX
 t6eGLxKVeR/4PHJXkOq6dNHVRYXr9C07hjhsSTDhb0lA6mWS48cJdJww6Ps89nbBJ3em
 4gJQrz5sHe4yuiAAfs3O8gMrIUa5XvXgbXwbp8N2jBoqB6oi7tITrIycDVnQDokvURlf
 iAEOUrsw2WkBJe6fEr0c7CIPSUPjHygo0cJW59/D1TuiNhEnu/Nw/vv4HitXYww0NEm6
 mlJV/SYznlTR3y1/VEuutfAYTs01Wj4/JacfvpbMCzCT7Kd26FfDUvKoI1ttPZOrxsRy Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk9crpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBJ196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRrRTfKcmE/C6Hhs4NDXJUODVeR0toYmxrF1ANhhSLRiZiQo8R2UW7DbmenK3I4RVFjuNaTsBfd8lsOBNuhr20cZhaasH6Gy6u7pPMHZeFKPnx8ZcNTy7Dpa+OHB+HabctNx9DEeiV/mChJHFGJP8ES3piAy/aBiVV+OQty8G4TbA3a9riuwzRfkyBNOdP3APCLHGnihaD2MaV4a0uhH8+fYPrE4LHpt3yQ54lFuXsHIrYwFY6KeI5kB+akmB7byQLkJfsHylARn01ba1+ZJj/bZWmGhN/CnpC2Piyjdv659Z5ASN3t0k3OR+2m9uy6nEpgF0fOlXihG6hwPSBmQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBdoS7bMGDKBaL55hN61apnrk+sRrMB3NXOS/k66Tck=;
 b=QKESypaVlZRA/EfNZBfvktoEj94QO8jdO77qBwrYK9nmT/NLZfEi0/0pCBMxWnu8jUSVuyjWhsIpvB0qCCaICwfMlrm0cBi23pOl0BC8PmycfFCizQfUDupI5bEljqWTtfoWJXDi7vzZ3cXbZBkNZ0b/SBsIMAQp5/5MwBNNMxPvKscRjT2gIuZdEGAING75paAl4sTUY7s36IvX+MoNU3u9ZIFLYHgjRVoEpJebMI43KwbNJR2DgGnzBNfNatakCs5Kz8ItkjnU8Jwt6THjE2kWckZrznpzEBk4gXkoI9aatyg1d7GR3M2TBByAup4EUQiK4GBGHIRoGqXTYyYyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBdoS7bMGDKBaL55hN61apnrk+sRrMB3NXOS/k66Tck=;
 b=r2uRT1NpczlX03aGtTSfYiFchltTrODdEDHB9RfrqFbjwOqJ2tsm5KclXsLdY90nlrK/I5oVvzYR2gpqz06mdrUD5+GknPC8YFgaZm6Kw54apHE6yzz/eZEa4zeM8rBkhpuHzTlLwKyS0H/53YOrpBPqxNMF4jBpPjFpRNYSqsg=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:07 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:07 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 14/21] vfio-user: get and set IRQs
Date: Tue, 11 Jan 2022 16:43:50 -0800
Message-Id: <439a724e5f58d950acb320ecf2ad8bc16b5b0acd.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de7a202-fa18-4a1d-8d40-08d9d563a999
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742756AE3A903AE127FBB89B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gegfjub6KIYR6mJlctTC4avCMC03vB6GXPFXXkRMG17b62c11Eczcxyop3Z/cGaPl1xQGVXPrgp67wkNtAczECV4YwC1w0BjbBPRCOjLjCKGfvZINgzW25biCW9hwfat3rI7R+Cn+y+gZV9gr4HfALb6MmfdTRkoBuZTE468Td0lPQ0R0Sr4jCRO2soxrUrZKv9sYEb6Dp2H3gkagKfjs9dxA8ZMASYggNUuK1xEVQoPug0RFPtLk6oZUzv7Kid6rTqOcBnwiYS2RaURruOjKdNU+WS1dsLrcKLCfnVQZFbP+IZTSlSf5F6eRvYsl3KhUstLIHMjoDIndilRhIu+Si8gVtk2gW6bMk7ulT/heF7C/aWq+tffsqBiUfGHOEolJQgFk8rsfopYgQoZpffIO/DzAhZLGy8tCGD1hMRTSw2kOcVld/W1KA+cqzj2H6GAHZVe58EhsWc7jdJTBpLxSmWSQ4G2bGW1992jSnULC2FDczGfDJkzk58bNTaTOxnvMtS0ZVGIhTPf5A0jGyYFx5g9eBB6EPUxIekSzimR5rKMdFL8f8fc+clRCcr08O+uYLsSwkb2Bz6eabo6ohNiiJ6Gw/Vnua0x5g4pGiKa3y4wjY14SGLn1nsgfW5qPEC2DNBXSRefF19Fa3M9VPDGinZxxKpBoBy9HGqd4E3wMx3SUKl6MURARm2Z78qRZTjhnW8QmwWczv3FSHyk3dooQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1L3Ad3B2fjPXuL53ciRwDE0k3YxunwG/B1ksfzL8SWC1dAjHrygCCjl7102O?=
 =?us-ascii?Q?tp8DVGe/POKcv4TjpWqdw9a+EE8vlIJyXXqaFYp8wrbywMug8EsgW+I2IKA5?=
 =?us-ascii?Q?z8uz/c4slFN3SaTySD+OeYRQ1qDKzTmU/6GtK7KtLUns5j1jjfgU9p0CLHbe?=
 =?us-ascii?Q?Ebp+TApeLbZrrlKoGxrIG/JbB2eH5lNCviu9s/AV7T1z2PFOLbsFeL6S10fX?=
 =?us-ascii?Q?+NV0FyWlYsX/bo3GBA/SVlsBasJA+WQBjFzMI8x3m1VPBtl/p46itu3AfMo6?=
 =?us-ascii?Q?ZOvHu5fv5i6KskLeBXTFn4wE5iJDIa8cbD3hW7J6klHQCpyEXtS5Kkb2+k0v?=
 =?us-ascii?Q?nsLhEXknVBsh9SeNTrK6F1ZBkoIg2doksLIrcE+10VGttLtGqXl8XVKhmefS?=
 =?us-ascii?Q?RtgGPIJuvpumFfBvhiFc3G8BOtQnxrHFGU878IAn/03ep8KQusMGQSVOW5Aw?=
 =?us-ascii?Q?9rzB0HYFxbpGix3yPUkPEuBfIXIXZ+ZN0vSgsyslyA58rMZQfrV7z0sim1oJ?=
 =?us-ascii?Q?Gi3gy0qiCT2WTS5YZ7dNiwZLhDZWy0JCRKUV2Hqp9ZXNVRhq6pGv7lLthBau?=
 =?us-ascii?Q?PCbVkixjlK0/yhBS9ljzmLvrfR3i6r6SLjtNvu5+qKYF4DM06oK7SR8tW8k/?=
 =?us-ascii?Q?cidlz5gfQPuohfX3RkVzee9CM6csfwD/h1MyJzJUsqvXlfFNwXleorLNntKZ?=
 =?us-ascii?Q?MTeecDZ/itJcVdqfA+HVn3GG70E13ODZHPxmq9iiTmamaroOzOcdz5N8UxTu?=
 =?us-ascii?Q?DvgOQ+6bAHvkrSP3K236YJoUrnUxOI8/aHuZ0AfDXyNG9O5tryGjC9VfZszh?=
 =?us-ascii?Q?ftPdJBXqz6triSQNghcQrEAFss18KlVGcFZ+c8BFFO0WM3bUwvpOtv+8hhXU?=
 =?us-ascii?Q?sceE2UQOmrrZfp4mDnIlgKhtBgG+KcMFlRV9gq53MrgquqoiYesNX4y3Ghoj?=
 =?us-ascii?Q?3msIR5SPERMej2nHILMqOuPaCXHIZPpbcnRruAdVLfs3iIS3xP54vwypr2sS?=
 =?us-ascii?Q?wMxynMw0ws8MlqDlMbMjz3NKg3TWzxp9xiAFvPmTjXGk/HV7tx24OL8N5TuP?=
 =?us-ascii?Q?gIuuccBDhKcvS0IYek1id42b4ZcplUGS6+vYO1xjOn8rrGC+CuXW9ocY+PWj?=
 =?us-ascii?Q?fsMvD5DHw3R5HLgj+okYzyOhB2NoNaUe7W2VzWCrhT+jzteWcE5W3LZZ7p5y?=
 =?us-ascii?Q?bPXnjYzow4zyZ796cjbqGoWH/UD/MolVy0V8d9BHMFNDylviSpsTRfzPWcAg?=
 =?us-ascii?Q?FwwWJ9vrLSo35sKFOCz7d+zknHVR7agUPPBvO0IVu52RCnDvZWoK00hhl4xQ?=
 =?us-ascii?Q?hkhQHiPxmWvM7x1R2ITjlqLrVfV4Af5eJbWHvjHv84ZTeXix/q0El90E9RQC?=
 =?us-ascii?Q?TzYB/nedzmcBrn0dze+zOa81fj7UKqIw8UTxCoacE2kYh6mANImUg2pMV2Pp?=
 =?us-ascii?Q?ECfQhhjJwhsbE0TkAc7ntbAfdcnoReCJ4bCjtNQ37eKyhyLkW3ZvMQEH6xJI?=
 =?us-ascii?Q?UoWmZDQ4ZdS9BiBy1F99ODiC2Yx6ygf0GJxPmDD/WW2zyUKB0mB9zXzS+cmj?=
 =?us-ascii?Q?G6bWM/F3qSAXLnz/pZaa76mqoIUKrHc/P9wn9lLexFDqsdfLWYTngV87WBxn?=
 =?us-ascii?Q?kuc6v4eazdCI3248OpXofMcq+EJ4OPGwSLaB79cfpmv5QR+anf+2KQ4iXFMd?=
 =?us-ascii?Q?AWhsLg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de7a202-fa18-4a1d-8d40-08d9d563a999
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:07.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4pXMg+8hGtjLpCR+cbxE0e1W44xxjTLV2oPUA9Psi3z5lQjlWAyfRcZ6U88HPM3c+X1z0BJA1EQxCv/dqbp/5LepXIfLZITje8fsG5tmmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: khFUD4grqcyQu5Yz_1w7YEWDL4Crfb_x
X-Proofpoint-ORIG-GUID: khFUD4grqcyQu5Yz_1w7YEWDL4Crfb_x
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  25 +++++++++
 hw/vfio/pci.c           |   9 +++-
 hw/vfio/user.c          | 131 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index b1ea55f..4852882 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -121,6 +121,31 @@ typedef struct {
 } VFIOUserRegionInfo;
 
 /*
+ * VFIO_USER_DEVICE_GET_IRQ_INFO
+ * imported from struct vfio_irq_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t count;
+} VFIOUserIRQInfo;
+
+/*
+ * VFIO_USER_DEVICE_SET_IRQS
+ * imported from struct vfio_irq_set
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t start;
+    uint32_t count;
+} VFIOUserIRQSet;
+
+/*
  * VFIO_USER_REGION_READ
  * VFIO_USER_REGION_WRITE
  */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5c519ee..e918f8d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -514,7 +514,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         vdev->nr_vectors = nr + 1;
         ret = vfio_enable_vectors(vdev, true);
         if (ret) {
-            error_report("vfio: failed to enable vectors, %d", ret);
+            error_report("vfio: failed to enable vectors, %s", strerror(-ret));
         }
     } else {
         Error *err = NULL;
@@ -659,7 +659,8 @@ retry:
     ret = vfio_enable_vectors(vdev, false);
     if (ret) {
         if (ret < 0) {
-            error_report("vfio: Error: Failed to setup MSI fds: %m");
+            error_report("vfio: Error: Failed to setup MSI fds: %s",
+                         strerror(-ret));
         } else if (ret != vdev->nr_vectors) {
             error_report("vfio: Error: Failed to enable %d "
                          "MSI vectors, retry with %d", vdev->nr_vectors, ret);
@@ -2668,6 +2669,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
+
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -3553,6 +3555,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto out_teardown;
     }
 
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
     return;
 
 out_teardown:
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 09132a0..99425ef 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -988,6 +988,113 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_get_irq_info(VFIOProxy *proxy,
+                                  struct vfio_irq_info *info)
+{
+    VFIOUserIRQInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
+                          sizeof(msg), 0);
+    msg.argsz = info->argsz;
+    msg.index = info->index;
+
+    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
+
+static int irq_howmany(int *fdp, int cur, int max)
+{
+    int n = 0;
+
+    if (fdp[cur] != -1) {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] != -1 && n < max_send_fds);
+    } else {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] == -1 && n < max_send_fds);
+    }
+
+    return n;
+}
+
+static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
+{
+    g_autofree VFIOUserIRQSet *msgp = NULL;
+    uint32_t size, nfds, send_fds, sent_fds;
+
+    if (irq->argsz < sizeof(*irq)) {
+        error_printf("vfio_user_set_irqs argsz too small\n");
+        return -EINVAL;
+    }
+
+    /*
+     * Handle simple case
+     */
+    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
+        size = sizeof(VFIOUserHdr) + irq->argsz;
+        msgp = g_malloc0(size);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start;
+        msgp->count = irq->count;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+
+        return 0;
+    }
+
+    /*
+     * Calculate the number of FDs to send
+     * and adjust argsz
+     */
+    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
+    irq->argsz = sizeof(*irq);
+    msgp = g_malloc0(sizeof(*msgp));
+    /*
+     * Send in chunks if over max_send_fds
+     */
+    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
+        VFIOUserFDs *arg_fds, loop_fds;
+
+        /* must send all valid FDs or all invalid FDs in single msg */
+        send_fds = irq_howmany((int *)irq->data, sent_fds, nfds - sent_fds);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
+                              sizeof(*msgp), 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start + sent_fds;
+        msgp->count = send_fds;
+
+        loop_fds.send_fds = send_fds;
+        loop_fds.recv_fds = 0;
+        loop_fds.fds = (int *)irq->data + sent_fds;
+        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, arg_fds, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+    }
+
+    return 0;
+}
+
 static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
                                  uint32_t count, void *data)
 {
@@ -1098,6 +1205,28 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_get_irq_info(VFIODevice *vbasedev,
+                                     struct vfio_irq_info *irq)
+{
+    int ret;
+
+    ret = vfio_user_get_irq_info(vbasedev->proxy, irq);
+    if (ret) {
+        return ret;
+    }
+
+    if (irq->index > vbasedev->num_irqs) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int vfio_user_io_set_irqs(VFIODevice *vbasedev,
+                                 struct vfio_irq_set *irqs)
+{
+    return vfio_user_set_irqs(vbasedev->proxy, irqs);
+}
+
 static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
                                     off_t off, uint32_t size, void *data)
 {
@@ -1115,6 +1244,8 @@ static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .get_irq_info = vfio_user_io_get_irq_info,
+    .set_irqs = vfio_user_io_set_irqs,
     .region_read = vfio_user_io_region_read,
     .region_write = vfio_user_io_region_write,
 };
-- 
1.8.3.1



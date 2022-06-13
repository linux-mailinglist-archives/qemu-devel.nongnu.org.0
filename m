Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCDA549F97
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:40:23 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qrG-0001Di-R8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfZ-0008Mu-UX
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfX-0001uV-L3
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:17 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJXY5N025671;
 Mon, 13 Jun 2022 20:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=3pyG/jPM5VqWezzm2L3INpES3eG9Ud6O0N+XuBe5B+A=;
 b=eBSQI7oFhmnrkDxSdgG/QzoOE69kAfp8nxw3xOjYIDeRB8TjOEuXnlEOLIk3I+nmdAia
 Lo0CBlPAiYfqxsd0+gDrRncFMMjlwWFoP0vmpJx9dfNurJvONTYticbOkfgXObS098lC
 ybN2m5oROPJMiuDSw1nadUcFlh9eOr2P09/CInLMjCnG1esVC4qe4wu6I7ii7iFhG4Tv
 TclTleFLJClrviRJTqIRrwGyOPiIbi4nnTPxAjowOPVOoNtnlU3f3MjqMRoej6eDwcwP
 KZtWO3M+Y5WJ7+8dxyk2/hSdKX3GzyxSxxxYoJVTU6dLZ6pF67WtRKofTPWeumEfFTJ3 Pg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9c1yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:04 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKG5SU007030; Mon, 13 Jun 2022 20:28:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d09aj-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEuZn6V39ddrBxrp03SafEKZloSQ0+qO5fFz8Q2SOkL1fv/nLbWCRLGpve67joiFeg71iHLbCJDyJR2bbdPf/3Z7s+IT3HhhJ4GZDPD9IgNXE/dOK9JWo1xNNenCKRf/QzCf/GozhrYczIZhIAtfQDGUP08tfBXAjwKtR38HtjAsbDEnzC9YFAG3LL8F/sQrrpiiIQj+IW5p3DydI03pD7hnWSaSWM1haxhwDNRw/6mpPy0G+1wSPJyqS2heel04Ttkau947iNnb9dK1qeyuDUq/VVG2fY+SDAf3GXuGpEgWpJBwLVNOsD7sf75L2eiMJAsrICl0SRPApTUq4KYS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pyG/jPM5VqWezzm2L3INpES3eG9Ud6O0N+XuBe5B+A=;
 b=mYnY9EXo4nEFHi46NjqU51ECQpilQrt+dh+cBZXVpg2+4S228ecdVX37vPYzJfznHed6UGHEmGiTXEXZah141yeR6DeP+DN35JN04Qz9rDIDx2YSRoWjXcnYAPmjOELqDNRXOK6x4hCL8z+R54WWkIXgQybYilmv1fVQmEJxrZkW0V/hXmT5P7bwWQOIzDZIamcMm+8XzW65xwg5VoWohAqJJhsu3E6Le0SiI1U5RTImpny7tkNhv6mlVeh+Iv+swHH++0x8qjowRpyRtX+9Jm1UgUpCd47+u8QuwMgHy8ew8ZxZEO1Dl3RGTq5cSgJYve5L+aWww1w0fE4Zg36/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pyG/jPM5VqWezzm2L3INpES3eG9Ud6O0N+XuBe5B+A=;
 b=pACtxNsSTH84mP9ljBHu86CEE3s3JbiTEiKYZsU9YbIwZ4mKNyBmOvxFZNCdOTWjyS7ygDLb/Jrds3j/Luci6wkS1dJlIzV0QwtJ5llbZ3toMUMmArKmBCOqSSzzTy3yhLZtk2kdt6mz6Sc9TdsPFhy7FddmcCfqUPSNCbKyIBM=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 20:27:58 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:58 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 14/14] vfio-user: handle reset of remote device
Date: Mon, 13 Jun 2022 16:26:34 -0400
Message-Id: <112eeadf3bc4c6cdb100bc3f9a6fcfc20b467c1b.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10ba0c9d-dfe1-4102-68ac-08da4d7b3430
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB2045351B7FBF59D840FC4C9790AB9@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UeaOEiM3EJXwh/e9EL5FbZX2GQpkDttWhYHnD5OFVkBvY3XfB3bfiWcONLn6b8RqfWSf2GZJPIZo+IdyK46EOXxdzPnnSs+MlP182gyWkmEZ0HGZo5J/tKLnvVBf27EQdFRz6Tc6hqTCWaZQs4sZL31swIkRe+8kqplIZDu5nqHImVHhu2wb38Vfp17rdPD1SV5/zAnoDLXNIVMpld7dBsSdGd9Pz7wocKSLc5LYd/Ti5A52dgxHv/Xvalyco6JdwrmLRBEkB8wnDWF5yjpsaCeTCDH8yQf500w6DY1KD/nj1MgvrNQgzZ3axF06B6pCFmevwemqs6XG15sbxROXXAe64toR8KfkdobaqsIrTBnxDw7gIpUn92BAoBYlschD1KlzpedvHgoxvLRc4HuKKEtDSXMBGFr3jteGvcM5uxDvnP2ABXPHhAquxcLepbdZazOuSCGAqE44EY8Z2vQf07utTh4YTxXfTiL6puD/vUPj1cpJdR91nDiUaqoRvqUp+wFSuf0f2VKJDaDqBa7TKabisvaacZzXwUjv2RLePeRnlCW4m8GcR0KPvvFzM+EmE/2kiI7tAOhlpXFEmCW2l9U4+kaUC5vg4iqXuEqrpqHjuUwfKqDeBPN3GoRinN/56HTazhkSmff+AcAGFNlUv4erlZICTFE2rLIxg7hXrnSvM4Zz0ejjovdZaWx+dLN0IH+gN7n0yXOY/VrIA0bYcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(7416002)(508600001)(8936002)(6486002)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(2616005)(86362001)(6666004)(186003)(6506007)(52116002)(107886003)(38100700002)(36756003)(6916009)(38350700002)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fj9gEUhTvjmqtS1YGwWqCJZZTO6/Rs5HwhFinYXldYIKiolcvrlN6UEqvBv9?=
 =?us-ascii?Q?smIrMoq6x4/5kcGYLaFl05jpM8uFRjpl3/r+Gm7fYNW+SQ6L7TRcK59H81UE?=
 =?us-ascii?Q?cOlXC7kWtqjO6U+4dN5hSoHMyNUGeg2haEojd7+v6WfuHVrAZL7AKLAlEltC?=
 =?us-ascii?Q?7d87fIbpxyvCylakupE16HSAOrs6HWdZaU6miPU+x6FVHRcq3eB8JEz4csub?=
 =?us-ascii?Q?iea0yn485vsIz+qX9n09pLrZxiUZPv1ACMxNo4bJ0ufZzCNbEDxHfvUQ66um?=
 =?us-ascii?Q?Ls9LZ+t5PxXxqbOkWJpJSu7mG0Pw2HUAhFzqDCT8EZ7l+5FmXeh9caWgh1UP?=
 =?us-ascii?Q?NpFwqY/5AXrAgvEIEoi1y+IIzzxRodoEZZUmdru3yDsj/G7LWbCfq8ZABvfd?=
 =?us-ascii?Q?ZMtCgYZ0tR/leEkSeolZOCS8sOun0fiJQU4N00b5K3UTqlWN3jhVLsoGZRyr?=
 =?us-ascii?Q?jmEr90Mf+on+5SK6exaddS3thqa1LHM/vG+bZSyxep9/S6l1cxmtPCk7Gft2?=
 =?us-ascii?Q?huWoihu2mv7UxWOgnvHfW7oIyGAqkf9hQBQdqg2YYZEuqqBGBxPxBs1b9isu?=
 =?us-ascii?Q?EokWx5mD4J0WkaYSxi+E3NQYGG3pj4YEYj7mrICuEGc6gjrJ70DL+Tw8xks3?=
 =?us-ascii?Q?IBncdha/Ud4aiDIR7TBy7YtE5BzemmI7qz2jbyFHLXR1JsxUK976uqvFYEPl?=
 =?us-ascii?Q?frrKxHzJ2GU/FUsC8075FIyU3FVeq2fO9HkJj1gw0f+KRAg++RANzgeJdHzy?=
 =?us-ascii?Q?OGOv3v8TfoWqh4IUGYhnxSXQP7Vs9+NEq9N5ybGWuMCvkMxur59HB+mBVCmb?=
 =?us-ascii?Q?Q/tJsMde4DrLfzyWzCP3+H/0MPDv67nVFhJNJQIXDbLJB4KpnoE1fekeP/8u?=
 =?us-ascii?Q?06p56DPX3yrQ0EKvJOHOQzZ6+01amjQdjrHKwClo+oeaHiKzAixvsvocT1Lh?=
 =?us-ascii?Q?P38qZU4OZ+Vy2+h50FSoqDMmzlKvLIPrNAg1oCxlSis1J0HfWMVnOK953mo+?=
 =?us-ascii?Q?/FqxC8yrdv0my1Ufp3DWLP9+j+HSsxIsFnyFTMz0LKr9oBSId6pFQa5M+sXj?=
 =?us-ascii?Q?vKpusRwVfPgGkhue/8WXdVYSmWJ8CMGJPkD0NtwZdOnoUR6LHBUyA6l5Ksp/?=
 =?us-ascii?Q?l2s8woj3fjPkLwoc0GtrLqj2beVmk5H6d/uiqclcJIff/pU2TiUmRV87L11K?=
 =?us-ascii?Q?wOCufcumsxvVnKddmL8/SrvQ+aPenEZTTkgfpJ/cxn7YYlt1E3XX32/eFJPI?=
 =?us-ascii?Q?8v8iaPqrTb+ex2/K7uKp4KA7E44X3fVookPBJdDf1gyKxBz43wQw5y9UTSgz?=
 =?us-ascii?Q?DBfWPWGKC7Q2nWLWJctgYSBrwlkTJIvpIraWvk1e8zk6T5yu6Ubr8KdFIe/g?=
 =?us-ascii?Q?p9jseiTBTzWAwhM8B+XUuJJfspw2B+VATXqICOqFG/5LSk8FD4Lxk96o02qv?=
 =?us-ascii?Q?JjECS0C7B9pX9nrkPnH504+YOCq+oYBx+EHW529iqNNGbAfVvZbGFb47M06f?=
 =?us-ascii?Q?1OjwZAZdl5SHgrtq1cNDcyWzw6mmGD3gjIb52lbiD9IIQfB2Cvk3di7Hpf42?=
 =?us-ascii?Q?xiO47WdfvKJiEdMptxRhiqdJvYcyvfvIOUOQQxJF6/CYNJYIF8dlJMyyi4fY?=
 =?us-ascii?Q?VGZptJXoB/fci3Ek2iNpSrml4S4Nvxp3CY/oicJ+hf5QGv+Nh4LMW4Pgc7ux?=
 =?us-ascii?Q?RYbYOYkdI2XZ1s9AmS8k1xQlgwFhHL9Qs/Qpu/lgg0nkZXRKIeFoqn8vLdv9?=
 =?us-ascii?Q?iZzHzbDKAA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ba0c9d-dfe1-4102-68ac-08da4d7b3430
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:58.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkPRYLZzS8yyr0X1XV9WHigxAW+z2lZKOJ3tdsOal3r6Wl0gqmdW1Axv2ye/pbhAD3vphmCq0XyYPwv9jD9btg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-ORIG-GUID: xPjExnL5klZlFKXmGfv6Pt7wNn4mDu2h
X-Proofpoint-GUID: xPjExnL5klZlFKXmGfv6Pt7wNn4mDu2h
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 5ecdec06f6..c6cc53acf2 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -676,6 +676,20 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
                  max_bdf);
 }
 
+static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    /* vfu_object_ctx_run() handles lost connection */
+    if (type == VFU_RESET_LOST_CONN) {
+        return 0;
+    }
+
+    qdev_reset_all(DEVICE(o->pci_dev));
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -795,6 +809,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_reset);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup reset callback");
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8348BC12
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:56:25 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Rw9-00021e-0h
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdn-0000xo-2U
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdi-0005gV-Qk
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:26 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMgqKg005902
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=t1rtfmRWZEaZnMlSY0dEVmNO9mzI6BvH83UDUhmvKN8=;
 b=vAR5XRxbwF+UhH1DPfLpeznLeOKS+YF+08GcCP15vKXRD/R8c71oXsW2vx9z4WeQw+fj
 e1/CsF8hE61BpAYWPQf5++xY9sYN9mXtvgZMU2Cd0QKigB934ivdw3PNUVdOJtpW4Y2j
 8HZvjcEob2p4Q8vHDEvhqUSUyg8X4O2strAG6R7mwL8ndd32najygnrCgJAy7vtjGeit
 Vy55FYxS9oygPUvrtoHjudJcI/ydmP5pnx1LMECEHQ3K6x787i6WVJerf8q42ifb6Xii
 3N42gW3Qi3Qa+2jkIyWCJ6hXxw6r7h6tNf+zCxg2vVoRCxdSe58PhwbqHO1om2L11W4T Yw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBF196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0sOHDou4wHWl4mcRRAPEp7Uc461lBlBN3TL+qb8IV5DLvhCIMRuU62UWKF1xYMt6CN1Rgx2NFXlGVUgEg8JfQdaVNvFP0mYcx+12PrrHEWfKjrUWDsN8HgR+WuVdpMBLVaU4mTYLiKlnHExRN3jZZXUglkE3+XI/fJsmdFNY99Nv2aYxr6XKf5Hw5P1D1z9O6m0i/ekpkrmSbab0CjmGuZhk9XhCKBQQPqYkXzfrT+8zfs1cJsvp1wFFJ7A+C1UyMSnmKhsIxtwqu+QN04JI8mcEIItwB7ZxkOoZmPZwHra+keQ5zIxhH5wJHXErc18LVT5yh4+5AW98YtFjqUZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1rtfmRWZEaZnMlSY0dEVmNO9mzI6BvH83UDUhmvKN8=;
 b=XgLJTQiULctZOtwj1SlSf/l8WfTt7TyszSOr5ZuQ5h02bMTPJYzJ+QT9PN4nsbldcCMOHhGSuZc4auZLDbi0zwlPtCY35e+QsiI2FYo9qf7DGqZQCwmTDVRGHlj7+LmsWR12N8Y6M840jPNTzOYF2qfJj/6WtqQiAdD3njgr/xRFga4Ikmyy9P9b+pFbA1wQpoeeGP3qDpc3HTzzZq1KHEJcULFVBAQ9ZpuhdPto+04WxpTdIVni+hi3J7bdzF9V2tCVo7tQOMx+vvkbBAcsWjNKKzttn37NHNJHzAQnSzb81r20wqZCu9wBMpAnu4+NokDV/O1dIsHCwSTAJZ3lhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1rtfmRWZEaZnMlSY0dEVmNO9mzI6BvH83UDUhmvKN8=;
 b=xC97SPDsdafG58fj6ye0hO240/4XUJhXYsp7qhueuXE9iu1T6r5tFGby0mrc/sqsXsTGTnHJ5XV3kokK+vjBTc6rKwIu5n9FlmxErNnFO3tPPQrjvcjKXN8H5bafyxM1vnrjYlVhgZG2X22+H5txIARfrGLx6Y6e0pdImi3obYQ=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:06 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:06 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 11/21] vfio-user: get region info
Date: Tue, 11 Jan 2022 16:43:47 -0800
Message-Id: <a170cb551f757e2a1fe6bd3276fb7147d1b3da7a.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54d5dcbd-dc83-4ea6-2807-08d9d563a908
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742C6CE72B32D459D2D07DEB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +onYdbqd4LdUs+NIyEhBeVk4T+LdTGhtDAXf8kGPfXjf1ls1ar+dNPJmsiX9GPJ3+zDWzmMr4ReLFNWHQx8L0Vdqu9htCimEkvVwV/YO33rlAQlujAq6SqikMQCSeUVQzs9cjoOGepXzGZcmZjmuDMkuOfm+V37nEqsxOM+xHaFdzrDDbca/w81rV/mNJP2AHOIzWxnvjdi6DrNoYRIRX4WlVXbdns/d26MNd3JQxdAnt1LEgD4eE2E/JpPZzkKXtcJvdfwhZIshwN0/sUFtpAn3QgWxi+NsnCpGx/IwleLjkz5r0VqGRAgC1tvOZHJ/MBrjXF8yllWyDKSd/INmYbLOqwz5RvE0pzXCpZOJi8ZiEZ1/WxPxKfPlncOrgAXNpa3U5bsDyAogF7n1XqXCBYo24lnORy0dFzVgiF8kBvmvNi4DuOw33K7cVuyml+Wol/1bfzQUxeokLkejbo1lkhV8sQAWxAi7BVhRbDAz1eSoZDg+ngJcqmFNNSIVOw/CdcAuGTkdp1GEsdGR4rek4DE01xjMxIjMhlUhm/96wM5ED4F1QDWdxYrnIpwPJ+x29HJjoYRuf9QlzdamuEtz3trzjXXUluAqYUjhdV/YLVdXYKPSvv46VvCsnbvrZKuAhHyk6fgoC/vctyoogqIPdT4IlIuiA0FUlqpeJfuprJInYv7pZRkJxx4ziZGNQY6QBHcDDyN9FQ/zqdpFLQYfdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhUtkCWf4OBn9ZmeV3VNfe0y+2sFJt/3hFDXCMwD/HDrtAVVYNET3/1TtHUD?=
 =?us-ascii?Q?sLSA8C2DSHHaNwfqqy6y2N2QyNertzDcy9EQfxEOo1x797Ss7y5oBYze5Zf2?=
 =?us-ascii?Q?xXbJlphyqDyN+FD1sXstFI5buvsQFU799lswtcsg1Tjkp0IdxWZtA9EqXW5w?=
 =?us-ascii?Q?mM4sBxVGf7mXdOkjf0MwQH5nxq2ArytifKwnSeIfAkbnQy6Kpk/o4WvOvtDT?=
 =?us-ascii?Q?JLRa+EabWlRhkOOjGkcQLTplzlZ0kDJziges3td6dlgYSUeexoADu+Ve00oc?=
 =?us-ascii?Q?oaJHeTTxTDoYGCdtKhVnmVo/RD10Hro+VNC7YTzeUQiDX4CLNRp+8HRs+dNQ?=
 =?us-ascii?Q?mEbiWNq4udiTaLdeT3+u4KIlknqaT1FLuI3dsSDgzQZN323zaRE+UWnH81Ic?=
 =?us-ascii?Q?sPymJk268zzoKCoLbNZhG9Z4blXoFJxqbZTgLIX56Du6NbvSzBJlJ3ovpIKL?=
 =?us-ascii?Q?J+XtJx6FB/fYKKuSF0LXoxVs9uhSoKd7DUvqo1JbnVE6s5eVFAP0EqJQP6o0?=
 =?us-ascii?Q?xrPIx/qRI0ENZTihSdwAmfck1n7tq93JgQ9hZhiHWyfzRFHnk7IGcSgYAyVD?=
 =?us-ascii?Q?guYF9nfK8ZFAYNSGrQRQ8WD22Td27ehzQizxapfFou9D60zbHjK/pqEf2UuO?=
 =?us-ascii?Q?uwBSzEJJA8ZSgfOF3YdtuIXCYioKZ7V/ZBYs1TYsgANzQAPKsQh6oaOaKsti?=
 =?us-ascii?Q?PdwwwwQqkXKNBLV2d5vZJE2B8ENY9t53l4SWt9hZ3Us4taSoV2RE9/bf3Moy?=
 =?us-ascii?Q?gyrTty/l4ZkHdWlPCGu6/jgimqtUDI9f89nRWd1aEd9emjGd8uHu2XGEleKg?=
 =?us-ascii?Q?2h8F91l3sEB1ynMxkjNxj6ettVxRgo61uYUtONEcCwoiWLFeZp+6r1/88DzL?=
 =?us-ascii?Q?4/lxan/rmmGPnNCjvXeb0z49wx+qa3S4TmY2OZRk1XNJDC8vcV3UH6zHcWD8?=
 =?us-ascii?Q?EilKlTP/cjmn9Y+JwGwxRRMw4GR3hFPMC56CWnSUAUF3npk4gEuXy6U/46mC?=
 =?us-ascii?Q?2fxuvpqZXRajnMYbRk/gSUwfTc9s4ELdzMCmRTPRDEE8gPRU+brLdD9YNXZP?=
 =?us-ascii?Q?rt6/jw9Co4w/ucRLO5+zgbqwCXwm2bJ4tGgLdyXOhITXI31+3mhMPHG3MIFv?=
 =?us-ascii?Q?oEvJFWOi8ykGQ3brIFELTf2QJ3efXiUFpNbwdhKZAolxXNrgYiILQ3C5Uc7x?=
 =?us-ascii?Q?1dI+U8RudgAdgoQP30AJLzTgA8VECM6FqFNYEmxG5+XbhdUhbqOIgz/I8wCp?=
 =?us-ascii?Q?HA3Ibw03HRJEyFFQ3eGuoPuLx/tbSuyGFF4gEXrIYXYfGXfZV6ikDMfZ5GCx?=
 =?us-ascii?Q?2qvkgRUayvtlMHj6eTCR4DslUHvgrDIn6uSbp5ZXek/xnDc2c+3a7HTnDpkr?=
 =?us-ascii?Q?cDAGkftxuIROx+e0LPPkMv2SxrHWoutGeUDZXKKldcMe0BN3QClgkioSoKx1?=
 =?us-ascii?Q?yWBUsW3uWjkhzQVUU4pxs1zgaZxigd1VYNuONIYpSqfpfR/1Kgxlrb7dyO6Q?=
 =?us-ascii?Q?nuQSbNgw/gQcDs0e/pV4l+fm5r6K3j7b7lGGjAa1fQZf/Tub5TQrSZIzXomc?=
 =?us-ascii?Q?YWskqgrX3rr1QfCW8pAcibBjor2MLA9F1fC5cxJ+Vdvc71gpFaUjik4xAdsY?=
 =?us-ascii?Q?hFDS3NEZP4RiMa0RDDW/3gJwFzWrU0NGJgiNYFU8t2mMh6Mhv5901aTKgxIQ?=
 =?us-ascii?Q?0NfcvQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d5dcbd-dc83-4ea6-2807-08d9d563a908
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:06.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMYZoCN1jORzdZrptfEJOf1GwDVOdLzV1Vqb/szWXGDmWo8VQzM/6uJJcmn3NbXHgOkFe5jOJ5OGNnSo0Z+8RIWiJDTWeZli/qkSVWkytmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: PprIt6x6Yj2pBeo_FOxReq1GLd0S93mz
X-Proofpoint-ORIG-GUID: PprIt6x6Yj2pBeo_FOxReq1GLd0S93mz
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

Add per-region FD to support mmap() of remote device regions

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h       | 14 ++++++++++
 include/hw/vfio/vfio-common.h |  8 +++---
 hw/vfio/common.c              | 32 ++++++++++++++++++++---
 hw/vfio/user.c                | 59 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 4ad8f45..caa523a 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -106,4 +106,18 @@ typedef struct {
     uint32_t cap_offset;
 } VFIOUserDeviceInfo;
 
+/*
+ * VFIO_USER_DEVICE_GET_REGION_INFO
+ * imported from struct_vfio_region_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t cap_offset;
+    uint64_t size;
+    uint64_t offset;
+} VFIOUserRegionInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 3eb0b19..2552557 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    int fd; /* fd to mmap() region */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -150,6 +151,7 @@ typedef struct VFIODevice {
     OnOffAuto pre_copy_dirty_page_tracking;
     VFIOProxy *proxy;
     struct vfio_region_info **regions;
+    int *regfds;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -172,7 +174,7 @@ struct VFIODeviceOps {
 struct VFIODevIO {
     int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
     int (*get_region_info)(VFIODevice *vdev,
-                           struct vfio_region_info *info);
+                           struct vfio_region_info *info, int *fd);
     int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
     int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
     int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
@@ -183,8 +185,8 @@ struct VFIODevIO {
 
 #define VDEV_GET_INFO(vdev, info) \
     ((vdev)->io_ops->get_info((vdev), (info)))
-#define VDEV_GET_REGION_INFO(vdev, info) \
-    ((vdev)->io_ops->get_region_info((vdev), (info)))
+#define VDEV_GET_REGION_INFO(vdev, info, fd) \
+    ((vdev)->io_ops->get_region_info((vdev), (info), (fd)))
 #define VDEV_GET_IRQ_INFO(vdev, irq) \
     ((vdev)->io_ops->get_irq_info((vdev), (irq)))
 #define VDEV_SET_IRQS(vdev, irqs) \
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f07023c..a50bf4b 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "hw/vfio/user.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -1554,6 +1555,11 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    if (vbasedev->regfds != NULL) {
+        region->fd = vbasedev->regfds[index];
+    } else {
+        region->fd = vbasedev->fd;
+    }
 
     if (region->size) {
         region->mem = g_new0(MemoryRegion, 1);
@@ -1605,7 +1611,7 @@ int vfio_region_mmap(VFIORegion *region)
 
     for (i = 0; i < region->nr_mmaps; i++) {
         region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
-                                     MAP_SHARED, region->vbasedev->fd,
+                                     MAP_SHARED, region->fd,
                                      region->fd_offset +
                                      region->mmaps[i].offset);
         if (region->mmaps[i].mmap == MAP_FAILED) {
@@ -2410,10 +2416,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
         int i;
 
         for (i = 0; i < vbasedev->num_regions; i++) {
+            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
+                close(vbasedev->regfds[i]);
+            }
             g_free(vbasedev->regions[i]);
         }
         g_free(vbasedev->regions);
         vbasedev->regions = NULL;
+        if (vbasedev->regfds != NULL) {
+            g_free(vbasedev->regfds);
+            vbasedev->regfds = NULL;
+        }
     }
 
     if (!vbasedev->group) {
@@ -2429,12 +2442,16 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int fd = -1;
     int ret;
 
     /* create region cache */
     if (vbasedev->regions == NULL) {
         vbasedev->regions = g_new0(struct vfio_region_info *,
                                    vbasedev->num_regions);
+        if (vbasedev->proxy != NULL) {
+            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
+        }
     }
     /* check cache */
     if (vbasedev->regions[index] != NULL) {
@@ -2448,7 +2465,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    ret = VDEV_GET_REGION_INFO(vbasedev, *info);
+    ret = VDEV_GET_REGION_INFO(vbasedev, *info, &fd);
     if (ret != 0) {
         g_free(*info);
         *info = NULL;
@@ -2458,12 +2475,19 @@ retry:
     if ((*info)->argsz > argsz) {
         argsz = (*info)->argsz;
         *info = g_realloc(*info, argsz);
+        if (fd != -1) {
+            close(fd);
+            fd = -1;
+        }
 
         goto retry;
     }
 
     /* fill cache */
     vbasedev->regions[index] = *info;
+    if (vbasedev->regfds != NULL) {
+        vbasedev->regfds[index] = fd;
+    }
 
     return 0;
 }
@@ -2623,10 +2647,12 @@ static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
 }
 
 static int vfio_io_get_region_info(VFIODevice *vbasedev,
-                                   struct vfio_region_info *info)
+                                   struct vfio_region_info *info,
+                                   int *fd)
 {
     int ret;
 
+    *fd = -1;
     ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
 
     return ret < 0 ? -errno : ret;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 671c4f1..1b0c9aa 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -925,6 +925,40 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
     return 0;
 }
 
+static int vfio_user_get_region_info(VFIOProxy *proxy,
+                                     struct vfio_region_info *info,
+                                     VFIOUserFDs *fds)
+{
+    g_autofree VFIOUserRegionInfo *msgp = NULL;
+    uint32_t size;
+
+    /* data returned can be larger than vfio_region_info */
+    if (info->argsz < sizeof(*info)) {
+        error_printf("vfio_user_get_region_info argsz too small\n");
+        return -EINVAL;
+    }
+    if (fds != NULL && fds->send_fds != 0) {
+        error_printf("vfio_user_get_region_info can't send FDs\n");
+        return -EINVAL;
+    }
+
+    size = info->argsz + sizeof(VFIOUserHdr);
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_GET_REGION_INFO,
+                          sizeof(*msgp), 0);
+    msgp->argsz = info->argsz;
+    msgp->index = info->index;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, fds, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    }
+
+    memcpy(info, &msgp->argsz, info->argsz);
+    return 0;
+}
+
 
 /*
  * Socket-based io_ops
@@ -947,7 +981,32 @@ static int vfio_user_io_get_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
+                                        struct vfio_region_info *info,
+                                        int *fd)
+{
+    int ret;
+    VFIOUserFDs fds = { 0, 1, fd};
+
+    ret = vfio_user_get_region_info(vbasedev->proxy, info, &fds);
+    if (ret) {
+        return ret;
+    }
+
+    if (info->index > vbasedev->num_regions) {
+        return -EINVAL;
+    }
+    /* cap_offset in valid area */
+    if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) &&
+        (info->cap_offset < sizeof(*info) || info->cap_offset > info->argsz)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
+    .get_region_info = vfio_user_io_get_region_info,
 };
 
-- 
1.8.3.1



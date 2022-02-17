Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66E4B9A5D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:01:01 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbim-0006c9-St
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:01:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXq-0003nQ-3o
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXl-0004S4-RF
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:41 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4b68H005175; 
 Thu, 17 Feb 2022 07:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=aM2fTm00qKbgVUhNkyvHNh/13RpGeTYVY+goNCYXkzY=;
 b=u29cNIEDHLrLptYCxUQIXCWFB0iPVlwfUfDC7XsFFjURO9ipcTGeRhCi8r6iyHuKEOXd
 aEBR5PVMFNewCkOqBiwGuBmAhlj/yvdg9hKLRPJfLdL+GBiK63uSum0tgItNv5bqcqWg
 AjHx+7Vp5L4uMjfK6WLHJJDBa0z9EMYNMgcsFwBr4zvKu3VrhLxUA3hvuSXQ0ag1nnEG
 5QxF3Enac5s1rNfTvvG0Pn5lMHPen/ZM/GYcu/ShdSckTpZsfjJzamUaXpZ/7BvINVeE
 V8lqrJvuOEi8jSZC7TTg3e+dQc/InTlVRbve4ezhM7jAnAStmGLRBs2uKX6Wzs9xC9YR /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncavqxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gCqT030201;
 Thu, 17 Feb 2022 07:49:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3020.oracle.com with ESMTP id 3e8nvtf6b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9YfmhGXB0Tk0i4OL+HrH77nbRJFAgn9Vr4x/MK4VnMNO/twEAvllehnZfa0UflrddvSSiLvwaJx8Gv79fvPwCzDd84pjGy9bIVLqkLQsQSkwlOxQCI5a6Pan8G24n/R0mTipZ5K7EMLnA3BOILyEPlsbCHrS1DnU7PdfA2gmwBUH1BBwUZ3XpvG4j4iw6zpAggbsj/T6LyQfHiVbTYsdd7hbBxLU4Ho5ZwvTT5//0O3HLp6n23pbQf7jq8W7DhLPLeHhTqM2YLljnVH50SwQmkJFDMNtCZWfxuOPuS7WCiRGW/dStDQMaexeB/xahnA9MR50Kccazkcg6nknXNSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aM2fTm00qKbgVUhNkyvHNh/13RpGeTYVY+goNCYXkzY=;
 b=Qhmf8rRmn2Oc4MAGwUmErF1BjQ0v493UB0imXD+4325kqFRT5clnMml7LsLNZYti5ng1JtAv1XyuWNRIvzK0VVPxt0cB6iNYC+xQbWNRIKiVHXNIlx2nv3Gdzgkwp/QwfvYlP5vXaGQAQdL6brqj17n7ME7XVppMqxJ2W4+6/PUBBXSGNyc0NZ9COlg5sBjk0XoZkIyPHdT72UOx4npUlN6mG+bQIaLu3KC/xJrp7DiqL/CLjykU0qwW/dcnH7ktK8muEbT2lnoaxgPoX1PiEMkU/XtM6ns6l2X7TlVwabSkalF2ZHojjcmvvNnVLFP8CvmjDJ3irIeJxm+5uAjSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM2fTm00qKbgVUhNkyvHNh/13RpGeTYVY+goNCYXkzY=;
 b=sd8rk/9L+wuEqPWp6sZJha2ePYubKVaZ1zUpuY0BTbzw4afjixnKYiDD6ALe7Zc79l1BOBE4c6acLoHmzilIK2/3Fr5nPr37AQYfF9ySnq6gwhnKJH+sB+4fZ7c8A1nJWVfhslQjo9PjQJlrCcay42+E7VVkDvbbP1H9mbBgF68=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:31 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:31 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/19] vfio-user: find and init PCI device
Date: Thu, 17 Feb 2022 02:48:56 -0500
Message-Id: <fcc3548397af6c548d46fdeb1ddeedc1c71f28e2.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ca75ef-6ec8-43c5-27d6-08d9f1ea0875
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB321135A9B19C10F01247EBC690369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4tggT5uSBQpM33+r8YBNENup4QSiGchec7c7U5e+ZvboD86s064BZRQP9UHT8Nwsjzq8CfKAyUyywAHQfPQn6X+5K921Qp5R+af6BVxldm2l/xV/VAeLRURKNSFtj788TPvuJhQ1nPpCYwrsGViXD3+hxpzDQnOUkZ4j7rXzgyZ2tFBRq/W7P3xoK794eSbBCkiYFdt9I5WkV64deLUyuaVM8vBSJ0nHjS5VI+Yr/DIdlfR+qvwKbw9K4zO2ZAn0P7+7AajiZKZ2KotbFO7dUkiJnONcugsQ2w7QH+GEwqIgPv1hf+zrlCHcFCBVngs184/Yy+S/0Etecn+VJZKBbHrYfC+X8NpxoP+iOgPczs8973QBrfREZblhu8kYSAyjx8bwfEk0de2gdSH6xJ02bZiiuGFs+KLoKNtnx3xDnPhDcTEYG5YVJS5j4t9gr5Wmue1MJbn5e9wBTWyqEu5YQD/dLf2R0GFUhZciX0eRTCioPfQLtXB1qjJxm7SUiGLY1MUa+MGSwSdX7CxMWvmueIS2d9jzHgtydarY9oMSeV8y5EOIjoq1vwx5UAlfGPLmNUSOPvA1mfO8u9WhxDsaGVc9q3hWOtdEAg5hzn1I8uceqR7Xfwtv7DrEARMTc3sVqwx8p8rJe/NVqXpzCFoKFKsIIJEBNGOcw09dYKskyd1jKb4FT2zEohi7zdNDfPCXYtBpH7ciYR45p5RcWMqWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Jn+m/n9nP5AitvDR1AF8Chtg+v0j+mYHlrcfWkXe82d3r+7Bnf2Mqexmd38?=
 =?us-ascii?Q?v9L5ZO/GkRqUL2X1VpH4gzTdJFldDjgP9AFywkN0k17tCkhwKv/9cgEzoGcX?=
 =?us-ascii?Q?k1fLiQQI4rmupx8ruDXmsMMzLg5ZC4O2PiQK+MqHbyKWQZyKWPBPiytcH+UX?=
 =?us-ascii?Q?Cvh7SWfL1KFZ59PraZXQFkaQIsMHPH+aEizldUsjMzIIewXuJQdspnaGjmXT?=
 =?us-ascii?Q?gHi+Kq+xHfaJ4VkHeCIQs1GFWgn+9822hfou3GM5jNJcgsxfc3CJhzfEfy+p?=
 =?us-ascii?Q?RI4xeG6UHC+Sz81CpRLqKHisarM5RQFMDAJ1EitjTZhiie77oDZ245MndW26?=
 =?us-ascii?Q?569TNu41PK7oDT44J36WIQkZe5ESFP2XqPBoveykT34pcsXzGzf6wAghf/1Q?=
 =?us-ascii?Q?XfWIGkTs6iU8UHwQfdLa7tV9ddhdKQ0dVtOjSfAbNXnuAEdEHOBnA/V4WZkC?=
 =?us-ascii?Q?eLevce+IPKge9QqbcYNKwPqowJ9MtqXQVmec6muAG78CYGP6Nip4o6HJx0CJ?=
 =?us-ascii?Q?TEgCjJtIaLW8fD4zfaa4aS2RxfwRtccp9qVLahQaoBF3Q1XtIN9qFt17ZD4z?=
 =?us-ascii?Q?feoaOvT0c3agszBJ6APFDky3bxFogY+RsGSHgiEz37l28GZNjjEpVlY05Cvp?=
 =?us-ascii?Q?CqbPGXD+taE6M3EqceU06sj4kKzlSqm4xNMHBq9GuM1xOCZEft5fUry33RUF?=
 =?us-ascii?Q?+Smnh2z2QP/hXqIBE8WjVl0tUeoh/cQl6V8B7SAxiZC88TuoOs9+F6QVowHn?=
 =?us-ascii?Q?6gaDjHFwIObI+8kjgr02GIVr92Trt/+9ATJDmDTV6YXOoJFXinPqT2KTCnPY?=
 =?us-ascii?Q?8mM0o1zFoQbYPtXBtNmmf3KiLdDykuCTiWLgRm0Q6po6pWGN4BGT3hrcYIlw?=
 =?us-ascii?Q?AmYe0L5C16NgmhfexSjshO8L6uPzOl0CbjrpIUqt7EKFy9LW+vcJQHOhFlR3?=
 =?us-ascii?Q?E5mjirR6ki8dR8WMHVzYRg4TNys2CHOGdJmz4T+88UN3f6UseoZMohl6l0de?=
 =?us-ascii?Q?xVb6RxGV4S5xQAKTGbqwxNklENIMTGrXlh+sLi5nya6Z/ZvSVS/choZGOgk8?=
 =?us-ascii?Q?tDoW3FDbK4jVFclJa++1lFpTtZrEyMJpt6fTtHulOO1EPLEGGyjLdCotfKq6?=
 =?us-ascii?Q?aYqu8FEqUfJYVok0rIMfa698d+s3PIWMBHrDZ30DJBt9UzSBWtCg5XNIAvrV?=
 =?us-ascii?Q?Wjy5BAwb5VBPSDUWAez1k0/r5ofc3WrfY1JAnZU8gMmRjoW/HbSOgWZ65Y4V?=
 =?us-ascii?Q?y2aq9lQ7HiKXT08REgejNAm4WpK4PAdfe44c7qqP8ZOGCbKNr21JGi2dtNp3?=
 =?us-ascii?Q?QdDJW13pPaFnM1eNPVZcBXYb+xCWiIoEqTUkiC0Z5IccgumLjnlgCCByvzK8?=
 =?us-ascii?Q?eBTphdXe10T88XhZjAQ88ZJir3tEENb2Z+bvhqMx/akUmWX4aKa0dfmZOrHF?=
 =?us-ascii?Q?r7u28IWokQmAHV4+8Sq8dRATNhUdHvVr3vDsQdjTpKW0YghO+25VRRjZxLMl?=
 =?us-ascii?Q?A4R9HMj80ffanuRIDGfTwc4CCVkuw1vwnAXB0ndjuoC9hmSkNh38EbsWjnLa?=
 =?us-ascii?Q?79knG93SJoDi4YpuSjiVNUn18HvEuqXOgJWh7j3WJ+MNaWaBLKa96s+IR6ol?=
 =?us-ascii?Q?z6YDcGyOkrXo4AGrU/UIG8w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ca75ef-6ec8-43c5-27d6-08d9f1ea0875
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:31.7891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg5Vu7NAfvRehPemF31Ye1Rq1MK2am0MEMInue3N6mwwGVkJ0SvdF5xxLltSlNoc3cLFmDSlym3L3xP/9rpeyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: Y6ndzsdJYpilxoLiLadxl-YcaUjyUKqU
X-Proofpoint-GUID: Y6ndzsdJYpilxoLiLadxl-YcaUjyUKqU
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 496e6c8038..9c76913545 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -89,6 +91,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -163,6 +169,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -181,6 +190,48 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker,
+               "vfu: %s for %s must be deleted before unplugging",
+               TYPE_VFU_OBJECT, o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    o->vfu_ctx = NULL;
+    o->pci_dev = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -221,6 +272,14 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    o->pci_dev = NULL;
+
     if (!k->nr_devs && k->auto_shutdown) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1



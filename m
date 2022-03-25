Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116E4E7A6C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:27:49 +0100 (CET)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpbA-0005Ff-JN
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:27:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUJ-0007x8-E9
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUH-000374-9r
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:43 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHJa1Q031491; 
 Fri, 25 Mar 2022 19:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=cUbEfvClLTx4z5tU28fT3ty879NC0vrjYwLEnf5bLDM=;
 b=EnMATo2SBBLhY3algQ2f+n4JOBqgPT53FwOblsQW0jFVq5JAoupY6VntRPax9/iaaGYX
 izTO5Ge/FmppzXlLHRjQSr0/dcLtih3oX98WPVkoPs0+GeEh8aCdcIbhLwm9BpJjHUlE
 M1iYcHkZIJSJlYNJWLmkibBiXggcUUkoucJqGBCUwYHWExNnlD/YllhR1JGaktkeSbgE
 cU+7zS+zyAllHLht2wLGZ26KjFBtkYNmpj+6ytg5A4wBYl5Tb53sPaK8AMKuxHAGyaZL
 npxoPRv/wDFL+Q+Cpw/g0NUfHPrxCFnOnUsXMUebfBMxujwosPqQ/ae1o09/YHuRjdva HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJFU5I043047;
 Fri, 25 Mar 2022 19:20:24 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
 by userp3030.oracle.com with ESMTP id 3ew49rgq7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhQ460Avn+EmFL+nf7EhU/gEdtdhm/zXDh2l00lzmWYJGVK5i4q69wCGGywOk4a0zLJue8Ab87eQJTTv4pfkNy0Qrvq+bxIdzkUsTqAx06j/ER384Ii2Sajp1yLYIkunQqAstBcpXafKoZwh798IQVcBOm9ZKKxDRV0oVf9l/Tz8P96BFULBl11XY8yPnFIoZZKmJRMqCALceqOi1xEL9YEWnlGnwamHtVj8w/dAO2MaZKKusuFCwn318UwokGUrEXPKiQUOJ2I6CnJyED4jfPMluDM1cyfM64Bvs4VRgUQxQwfR/OhYLox2PhZbW2bsKHZgcBFN3/bfAeUnV/jdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUbEfvClLTx4z5tU28fT3ty879NC0vrjYwLEnf5bLDM=;
 b=Fx2j+Ot+Jp345fnnDIbGf0eA1ARClg+nX7BrxsUh8so+3YtQLeuE1o2FZeqPbqKuUvx2ZBxYvm4mtb4Z48QQCe7NL77/uY9eoyB38bgo5cc6pYZKx8r8OeeExMINtvhdWNoRPPNPJKMd4dF6oYwChI7pxe+bnFsx2rysd0fsLbAbCLHnX/DJl/JXXSYJNGJWSTJ1zaKNUuirEqIoAXKpsv7HLoqLcPt5s1mvfn4BQKNdCljLokZmXZcOK5Q9u5yus5cbKb94VeiCXFnRw14GzMIa3ATOas/dbLekOA+/Ef5CwKM0tpnSoh5J8uMjMv61o4MbYyc+oquxUWhKlwZsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUbEfvClLTx4z5tU28fT3ty879NC0vrjYwLEnf5bLDM=;
 b=MmOFQRtADjHgYm5xpyq3zSAdDoYOH10+5zmXdWtAzqJQ+7KBvlqdTCzzPQyXo2cfN0KfC+JfWqc030ej9juWU1p1r+/tjmUsktI4bfa92EBDxmozLoW3nYZi5E6jIIqaJOpxI86SFKmg9/dc6aYJANzMEG5mTm3EZNmHGz1yDy4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:22 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:22 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/17] vfio-user: handle DMA mappings
Date: Fri, 25 Mar 2022 15:19:42 -0400
Message-Id: <eacbe09bd44ed9642a0ef63f5ff57508768def31.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59a1eef6-8aac-47a1-6125-08da0e94819c
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB52066FA37A6274F60461A8A3901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DWDWU6TrRN3F5pOX71+0ppiuTt7uPkTaIiG7JmhvAltOkJH+qINvWQK5rBqXS0cWhGSO9ML7OChmPCYbiZe7ct70FL4hfxe9k8PwY6yMM0yLgNpMztTGFCSVhKHq4JFdh5NmAdFbN3VX7TkEhAZCEVa2yksq4oQOkeYO6V89SruL5Rw8RQEsgfXWt+7LHjFmBzKLz3wcYPiwTl165FWYrDVLKV+cajaOOeJnnbUnU8W5WnUybBOsglHBYUIlNlt5GKC9+d8UtwGxrBlEmSITKFmZ60LuRttlzh1SPOdgvN7+iwQRvmOStpHciMDImMwZR3aj0JLjsgf3MvKcXi9pcfcpyYPc2DZWyUAhfMj59pq2dwI+n+ZODZIYNdMXkzQBlqPh8OLyBTXtGRADYH9rYeTt3enZVAslqhqH5LcL2CS0J8ejN6c5/+nqskiSfjf12YO8inyytn6flof/IUQ9P2ODVTNPfEPyn5YOANfokDPgpp995bnzA8gDggM5ndH+9ZqcyrF4mThhOPtutNfmQuIos7QQTJVCXz87thvlO82QpebFlr8HPh1hj5HeQbvi5xqXhx8fGLJVgPRUDnIlF/Ts8W/iIVxRuR3ND8zGAouK3TEWhx51FFvxEJSVCCvjAKhiZr22k86SCKkEGKKQprL93aLAQs8BqvXKzXkQfg7zH5/btuo8KfxbeSIeEc9JH5pj5PS2TA8kgK0rNo9+Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hCU7Oa0d4vTZvz4/RvCF+lBGThuxMgaVEry/TL8saOvzIQi9ltQpi9vN2abp?=
 =?us-ascii?Q?v2QiCw9V1Duysgf2unJh6xyft+9PSQJbk0TJ+TCMg9RLAfxPDOHjnZXw8vbB?=
 =?us-ascii?Q?WXv6t2tv7FXuZUUCYcDMCUxWbeFwyGYwidOnhlrdquUBB0SB2G1A8WBCddAe?=
 =?us-ascii?Q?LxZ43jvrynXLTNy9YWypgMZmfLpQePsk8Simpfts8qUZzCujKZohnmEXGonZ?=
 =?us-ascii?Q?Jh/2gBJfuGKa8ZhOqaa+x5Nt+ONlLseEnr+AZtemKVvodDr3VdvNE3dx2YO3?=
 =?us-ascii?Q?9xgHxmAmJGiqOOCdvLCmE0hnhGR458LeTFTFQOwfiNyyXHrO+C6GejQIBZUK?=
 =?us-ascii?Q?PlE3fCj7QpkYVhYMlD9zJesmH0K3gu7+9GrDubJXLXR2cCwq8i+bUHTU55Sp?=
 =?us-ascii?Q?VLmJba0xDQbu29lfMNUI+xLFWbJmsM8GBSCEemPoO0PQ5M+pVM0Q8vvrnFAb?=
 =?us-ascii?Q?wVu3ZSfJ8FyR/eKt7p9vEuz1FqI2GkBBb7t3nVBaOW0h9EXgPCp8r7M78sL+?=
 =?us-ascii?Q?G9yJPuXhr0ClMVb4iiLDPxSxxrUOKlp3Gk4TTZieABleQm0+FWQsG1NHstm9?=
 =?us-ascii?Q?DgUtUtDkbRW4oQIn6rhITshSxhQ9Uv3XDkq3LGyn07ntKnRkKLAcZmCXJiuP?=
 =?us-ascii?Q?rmYGYgfKb93cGzVt/uvLNlQrZPkBHtbqxb6qDy4hDr9b9X9FyiWT9skPRQcu?=
 =?us-ascii?Q?nJ02NZ63MEHllnzRqsJ1jjKAg4hqmon8pwBVPkb13VGZ8R3sdqbwOlfv3ObB?=
 =?us-ascii?Q?61dPRm81l3jZjSng4WKgYlDhsFF4+O3Y6OYIJWh64mAEBk9VoS4GzuRaFjKE?=
 =?us-ascii?Q?TpcIDHFYYoUlcuj6A7X9NXDXH+vdN029ZY9WAVaTZs0dfFlc0QcJG/ksBDzz?=
 =?us-ascii?Q?d8jhHAS+E+Jr5h5ibgBgf8bghima5kxQqnUhRvzDOwmXE6baV8qZvQbYsMhr?=
 =?us-ascii?Q?DsjVHca/JLQnX6bHcXsSlUCh8HbaSurxo/xqSg5nuYMuez0WsWSai2VquzIc?=
 =?us-ascii?Q?fvcBCh8/uz7QsNTxaI7rh19RaOvcQ2AulW78eBoSQlWwYw1GHt4fbZ9GOqYg?=
 =?us-ascii?Q?BBhGU14dqPKytqyuXFvzdvhEL8v9vBFoMQlpOwIsU94omiSXoEOsK7L9o8hr?=
 =?us-ascii?Q?jsvAe9FymAvJW5zd+T5D7twpsLwCC7KEaic1Qg1B+CLC0TMJgC/nB3Datcg4?=
 =?us-ascii?Q?qO+qBdRBW81P4SmTBmKiwZmkquWOTVcrrNx2Y6pBHCZwNXEtWG3njvOSrbAU?=
 =?us-ascii?Q?NBS+8a8M3I0H7Vb9u/5AUMPVDapD348Q4ThW+Yp44l3/3HhMujy+bP0n4MgS?=
 =?us-ascii?Q?Aai4f4O68vr1ocAoi7yVBtG8oJ1gwobVXqRES2rVMXHfEVfFh7QRcIV03ykv?=
 =?us-ascii?Q?0tyuql+0v8mUJ+498IYigAzSOCcgoOZN1KtmWRrnRGI+G7O8aQgjnvWVkVjd?=
 =?us-ascii?Q?XE7uxSf2ILR2sAlh0OURkHdcvdsgnXfHW5bmmNJQe6w2qfME/b79lzboiZyl?=
 =?us-ascii?Q?45HvudvFc6DiR/kzed7d06sG2MOWzOfp4EvGabzRTZhk96pmfW3u9RpF4gNP?=
 =?us-ascii?Q?RCMy+tgnGzLE4q+EQ40cAYmoEU+I3hzZ8xHMT5G+TjmZXrpLdEJHkMs6uRM4?=
 =?us-ascii?Q?y6A53DYqxwYxVqgYvRH5NtFllQWNVmU9j3IeASOtipA5HwWXlkiJMvsx7B0Z?=
 =?us-ascii?Q?IYErJ6GrkxtVQDgBwGVFDFzDaqj+oiNdetjlNABvlzfngoopgDmqZJS6xor3?=
 =?us-ascii?Q?lt6kCcwoUronV11+ILtT+OWprrIjSCI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a1eef6-8aac-47a1-6125-08da0e94819c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:22.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Oo2RG+W98wNOODJB7k8HXjkHwVbQpXNd1CJaLt1KFwO8gX21vXM1RS5nAYzA0f4juLkz71/1vMTxiXKA0iHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: 1KyL5JXZLC5bb6KzalqQ1qcYdOqR7WhG
X-Proofpoint-ORIG-GUID: 1KyL5JXZLC5bb6KzalqQ1qcYdOqR7WhG
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c       |  5 ++++
 hw/remote/vfio-user-obj.c | 55 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 3 files changed, 62 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 70178b222c..67801c3a4d 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -22,6 +22,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
 #include "hw/qdev-core.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -51,6 +52,10 @@ static void remote_machine_init(MachineState *machine)
 
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
+    if (s->vfio_user) {
+        remote_configure_iommu(pci_host->bus);
+    }
+
     remote_iohub_init(&s->iohub);
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 7b863dec4f..425e45e8b2 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -276,6 +276,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("mem-%s-%"PRIx64"", o->device,
+                           (uint64_t)info->vaddr);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_add_subregion(dma_as->root, (hwaddr)iov->iov_base, subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_del_subregion(dma_as->root, mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -365,6 +413,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1



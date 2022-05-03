Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC05186D2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:36:53 +0200 (CEST)
Received: from localhost ([::1]:53130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltdz-0002tH-RJ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLY-0000T7-IX
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLW-0001QM-GE
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:48 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243DAHc5019339;
 Tue, 3 May 2022 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=SKq+lWqOLLS/Mx00DMxGlW7ota6diAEcJ93gdJsbq9I=;
 b=iFKbE/UXTuyHBjIBHSoPsAD+ZsWP69J4HGOK2Cf+OS6TWpltaF7UHHjZCsTPR/QWk4X3
 nTQf/jH4MgqEagB+gS1nE49sD9t2IfplEM9y4qNv7l+FWkX3STtQyHZYru7poIOjJlK6
 /kVBbU/LljgcB8NDuMXLNy2MZWiMn37BZYxp9d4ZmgReD/Y2yTlSuMk+uAuEC2oPYyKG
 ky8EAisCNKOCIqiEtZTlzniRqItPUGby8HpULRvreXLqbivIAtNms6iZc9qF4T6PziN5
 RQL9HsPNB7kwxh6PdBPvw8olEhEAe+KjxYwnXoL2PQDt3l7356u3cn8X7KQGUOOJDY7B PQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwnt5rxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EG1Ve032363; Tue, 3 May 2022 14:17:40 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbmd34p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDPBPvjzQQhscsYBWyIQJNcyU3c0K8tf8IS6X7gwJ4o6b2xsTKuVwq9kxcthneuzJLkNf/f94al6SRs+p0NNtvPyjuQyQ7PcKl3G5Zz0IGBpoaqruU/+2k0DznZ8jOvsX3cVjBHJAQ9GRsyb8qMppfecfjoG2pN1nCT01Yk8wTrCgk/wFySoaad9AJW1BlCuyfCwHPfnbRL9I89Eg8+2VW3q3DdzZLlxqeTHOuxYq5donjqIt5c+GPyBJIJIPMExYjfkFCUHlp+ZAKqi/TIKRk2zWJZFa+DCoHYkLPXy8vLx9p+aNQjCKRq5W3p9DSq35YKvRwoQe0K6yI0+GORkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKq+lWqOLLS/Mx00DMxGlW7ota6diAEcJ93gdJsbq9I=;
 b=UvyWolOds/p/E4Mup6fg0rCY0z6w11HK19A9kgpj8ajPIsrEMCrAlUAiClhwiAimE44JeUskLiTBVgVhgA+0m4k37LAICzV7Nhd/ORSmoFsre3V9YvYMrxfrd1liaYNqtuBzYcGMMZIHe5IL4Y2+54h/GpzX4I6c1U1aJFKXoLiBBtZo8QaBVX98de3aTMMND80IDsuftpaOTpWlXZVmZQ8xe5HIhxbUaJFQUqzPczNrAp6jQyHJHYLmqmjPET9ITwB8dVMfefI+Xb9KWug0dkvT2+I8PB4+OQkz0rLx/W2l0/PEIY2mXlcGUc26jet4xU4eK4xUdg4Zy1YZY9TqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKq+lWqOLLS/Mx00DMxGlW7ota6diAEcJ93gdJsbq9I=;
 b=wdCn8qwR1eijc54kCfxcYbo7TWZBCbVAJ760VQ2aCPduzf3zQuCIl/WO4VM6o84TKLrqntn2L/UTjB6BPw848ux+T9I7PObAa9eaucMNxMWfA9i0mGmECd7CF8qumB03Z/81lAndyZDdzU2EC2003w+dk3oBfDevsULBBT4vcC8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BYAPR10MB2600.namprd10.prod.outlook.com (2603:10b6:a02:aa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:38 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:38 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 13/17] vfio-user: handle DMA mappings
Date: Tue,  3 May 2022 10:16:54 -0400
Message-Id: <12e7a02ffeafd9f50cf61cba092c7207e328c23e.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d4db23-1c33-4051-a259-08da2d0fad44
X-MS-TrafficTypeDiagnostic: BYAPR10MB2600:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB260036F567AFEAC3A1719A6D90C09@BYAPR10MB2600.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFm/uSb1oaTI9CLOWMlNmlSg0U6QWmpvVEdMrIW7MEoVvweN9ih/ytP2XybNZkKXxy/yozcJ+nHu/nUITZXWfeQ8+AvnnLkhSmSvsEBFQw8fI0mcF53ihWMSBkdDgUawtne/JVrCfrp+dFKP2XxVShokz7ZD7JS6t2uJ3WsDsSdI7jGrbeGxma+yOniZpo0W9sEOiTWNC5GUPAQzHA5GFce+TyV+KnrIWGviiH0oTeDeNMvJtj4YGsDHVaWpbTDJ+IFmdD7Z6OQClqdn0nImPUm+64BucF7f01xK0Y/doS8AsC9XvlqfmRuaV1sfD/nViU/M8KogUGOm6aIf095HuoPRr3n0VQNSR/BjYdxKPa2HYpOAQ7V0cIiy71LfJOeAoW35Xn4D9kQio8RjRgDAexGLFEfovbWPNrfwEh5yNV/rEWn8W2ZQ320mu0NT6XIqEqwu0/rOtWasYGOvELErsRoMfmLd3V12TQT40NORvjBbhIP0FYdujQqBHlo9ki1EfAqf0NjYbbzVigeGXSDEQ+7c0+MYzNt9KgcpjZooRsrgue+sd7xlDkKFCF8ZYbzzpQIxsWs1oOtXixD3VEKglNzDRZWiyz4IckXY6kx5+z9DkHI7UgElS6lXebeWgAAEIvjYX39h9rkSdGKxyfbj77D8p/9roy6zE596YsbqAutFO3P/bnyTmVCiOjSBzvGJpIIJSGsmQgezUd34mfOn/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(38100700002)(316002)(36756003)(38350700002)(83380400001)(52116002)(66476007)(6666004)(8676002)(5660300002)(66946007)(508600001)(186003)(66556008)(4326008)(7416002)(2906002)(6486002)(86362001)(6512007)(26005)(8936002)(107886003)(2616005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3tf9r56Me34qYa37VjAc4OvJIGzFboBoK9fU3LOx2XtW6GyzhiMgd8Y38SEY?=
 =?us-ascii?Q?HSfUz9CqtiHldq2M/08ejMO9M+AOmzVesJQQC2uviHVrfrmb0fIEEB577Ywj?=
 =?us-ascii?Q?P8fIlYnsK5TU4Qpx3VlVH3jJ2syhkFVd7NIDN0nos0QxmE0YJlP52TsqHI3R?=
 =?us-ascii?Q?Ovz7IgPZvb6VulNWUDcHi2fvkUGkUmggSZAfC9IsqgCcCyY0o4ay4iEsSUAR?=
 =?us-ascii?Q?BIKMp2cyX/ncRyj5JSoL4JNqh067orpMImmFIx8zW3SUpj7s74Yyb+PbyqPg?=
 =?us-ascii?Q?2tlFSkbwPiUJBiVfQjFugW8jw2851MZubgf1bEvldzRuFnxKBa2I9RhjRmwA?=
 =?us-ascii?Q?CKNdLmKe/AVbWW1dgJzrgIxQOoI/l4n78dhFeYq2w47JaLOFC1jA6DNkl4Y6?=
 =?us-ascii?Q?TMLX8B/rwWvhK0Z/n6cy/9bnUsJxrCBp3E8oei4YG2Mjr3QdlgdNZru38Blh?=
 =?us-ascii?Q?NecBNE2oeZ9BeQA6MOmcFajKz+Uvv6z0GyO8xvNvUOV96NlLoZ11UAVsyJKZ?=
 =?us-ascii?Q?yamT/WfThhi/76JQGsSNkes04iqRs4w7PSDDGmhFEGvmrJRSY3yN/uRdqKK4?=
 =?us-ascii?Q?6JsYl938ZXf34Y4VNniKo4jftWBZChmQqTNK1hn1kKxxx3UOPpSDW/ztzzX6?=
 =?us-ascii?Q?4zE2QJEbCikYt1VJn7X5lCn7iBYrL6ADr2dAaab8ARzRoEzr8cyl2HzZLw9b?=
 =?us-ascii?Q?7tPguksvkpAs/0sh0r5h1sO0Zmj3TvUZgG6HuQ5FPeVismf6tUCRGrnFGjSj?=
 =?us-ascii?Q?9kQlCe0TtPZLxL3uDLk0tMD++k3/+sgDTvReovCb7VKsdpCdryNoE3apNK04?=
 =?us-ascii?Q?4p59heiJMNAyQXImhiz29k1ryv6wxy4qS3YFVriRuFTy3/IBqC+dGlc72Z2Z?=
 =?us-ascii?Q?fB1fXbuOHxS3nJIN0dfxj/SPuW1fH7c+5p7VpugSaKptnqUxNNrpmSlhttkQ?=
 =?us-ascii?Q?uefusFxK6u5PLHrtOlS8i5mCvGgM4h6OcPz0y+ZjsxoTuZu4uV28Uh40tXLR?=
 =?us-ascii?Q?Fq9wFy2k5jcZbpgBHr4lQnl7Q+HXPOHegm5uL9IOtfeJ6RN4/aCe8GNvbhPP?=
 =?us-ascii?Q?A6c32b7JMs1dnoijoKuJJvBr5q8x3bjbeHaqqBu2gkYYJeQ6L3KM6W7Cw1eA?=
 =?us-ascii?Q?oA2cMB6Ba7DyKfPBgnyobsC5U8uJfaC1fZ1MIjzDYFduOQ1UNP82mFk5I2ca?=
 =?us-ascii?Q?t/Qf0JPYA3YjRfzjVhD2fWEBNKG2sW3etFtaCEgHFiPFY4Sz22yUeLFeRKg1?=
 =?us-ascii?Q?mWZ79kiqFU9czusA4pF4dbfmRdxtYVN0qoGgMcCkU3KlZswRomqXcxldPjng?=
 =?us-ascii?Q?A37KTUJ4Vno0f9gZPGBEkswimIHFHFMhrHDJ3LvZvSiVtNlZcTZXvdHFrzAj?=
 =?us-ascii?Q?YZUFiO3Y7xfpWt1u/rLDFAZVfWNbkWtP7dw89K6ihr79ZSfEqE/Pc6lH9ib5?=
 =?us-ascii?Q?986528eGwAtmdEfc3Xaz/qThNcw2lR90cJCRUqc5UADV/qI9htJYSozS1smY?=
 =?us-ascii?Q?h+rKYcFM5r6EUXl72OKkEPbvfe705JZSvBwYgWB91kGI7R5TeqGbE7SM0AmI?=
 =?us-ascii?Q?iBYdyDieODZt4aNHVlRW1Ts5QdeW6LlVeBESTeKJo3ltlZ4u2lDfknGyMwXj?=
 =?us-ascii?Q?LPGcZ3Y4oCQXC7l89KmJfbQeJXQRgyLPgqDwcPatosW6Dc06lmh9B3KzfJP/?=
 =?us-ascii?Q?z0MLl6NtDFw8ZMxUquGlWuW7RTRpML7L2MfS4kjSD5/r9JOPwwOwPastiw+1?=
 =?us-ascii?Q?7rP6ivAUVg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d4db23-1c33-4051-a259-08da2d0fad44
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:38.3093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glSo5KTgboc2icBCnrGE4P+z1zaFmyfRKmsyICrfTCN5oiflRq6VNDGmTKDPqOL/KQeaozE8olhePJfw3kf8NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2600
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: dSLxK9YN0EmbWCOwGaslQxrXIYY4hqj3
X-Proofpoint-GUID: dSLxK9YN0EmbWCOwGaslQxrXIYY4hqj3
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
index cbb2add291..645b54343d 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -22,6 +22,7 @@
 #include "hw/remote/iohub.h"
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -51,6 +52,10 @@ static void remote_machine_init(MachineState *machine)
 
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
+    if (s->vfio_user) {
+        remote_iommu_setup(pci_host->bus);
+    }
+
     remote_iohub_init(&s->iohub);
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index c81a76094c..736339c74a 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -282,6 +282,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
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
@@ -371,6 +419,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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



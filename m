Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4692532DAD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:38:19 +0200 (CEST)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWby-0007Mk-OJ
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVK-0008Ht-I1
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVF-0003VP-0z
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:26 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFHS5S018477;
 Tue, 24 May 2022 15:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=uS3rE0whJxtQmZ5hawMvWyrClqljIpiOyCbvhsJlICI=;
 b=yDP4jJVgd+RXUREsisxhkCex8tljbmSJJN+i7J6Tgs2oYsHi9/xcgfdvh8ZXgB415CMG
 8ElxXQkOJkokhRvuh/tQetuVcNHQeFEXM29kwUBfrjoc2aSGgiO1D4sOcQjWUF2QtlKS
 pp9rv/mactflH1VKF2iLP/cdwxDj/jJe9tF3eQtxasYZnwqi+4Fm+z1U4GIe7QtZ2wfQ
 SRTbD+DZr0WY7/0JPr6sHuZGxp1IHeEUt9EXrkp4WCGin7F6Pe2bDBzmLUzuNm/zZxfP
 S/tCHRwSwqrxlFFWVRuujfIZ1rBlt/KqRZ9jNfuwf9dN3BPcd0CpORajQNdADn51ZvtD 2A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qps6tk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:18 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFGJLX040315; Tue, 24 May 2022 15:31:17 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2h2n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReytFWxZ2AI8j/321As2PCLGzT8EFqNUsSyv1iq56ZRgsrJOPZmMdicPTNzA13IH2UU6FEfiDp88p2gXxFK0KtNmpiobUXZJX8avRUeGT2zU4Zd5F1NHsT98cfiG4uMeAPf+nYdPqPtdELeY+TYv5BcVntK/9Vw9hlkh4b4gNvSlUKLxKfkYw8xHUPVYWUWR2ZjPhVXsQ18+H607CW1jdeQ93U1sljoHYjmRyrMmOIVX2PLKC5VNJ6xpok51BMUGFTWVAWLNdGKz4WMgaQl76k5vpssHGPsqWc4wA98et4vqZU68MFHH6HH6nYHyI3+zouM/pabCalPaBT2W5PxZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS3rE0whJxtQmZ5hawMvWyrClqljIpiOyCbvhsJlICI=;
 b=WATcVm0pMbjqAmnqPlri0r9PsZHNZGt70ywA9UjiQplIo27g8KOVStvBcOHykTa1QIfKob4nsHxUXwK932MatscgFHJuOD3mQhLqzcJMPXjk9tGnPkd5Q1VxvtI2Zgp1P9WVquD3oWSwCxPgkqMvDSScO6OBJYFD8d5gPztUsidI6TAuSOY0Y0QRxORZFikjjdgwhvMqwKfMMmTKnkQ+fwGlRxfgP47QJh1rRdifZokJvB1XR5WT4J9pQXIr1i2jPuY63O1R3a85rxw7A2dnoYQjqY1Dh1Uzlds+zF5d+P7SXM633HXC0PUm/iuUvnvE3cMa/9bP0tr/noEHQ6a7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS3rE0whJxtQmZ5hawMvWyrClqljIpiOyCbvhsJlICI=;
 b=GknIpqjc9WO7jYnFVc8Z4KIlTdsgFAvNQdk7CV33IcunbQqI4cchovXPmce0XgCWmSx8uUI1HN2zi9PQsizA/+3D+cVaTGbk48dnuEp4NUc0i36z6p3azrKebw9YSxphPZLzBuW6nVf7/JSzYVdjhzmGEm9TZDCxZy8LWnQ7bmE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:14 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 11/14] vfio-user: handle DMA mappings
Date: Tue, 24 May 2022 11:30:30 -0400
Message-Id: <52415ba6025ed886828cd49744ed833c121e58ff.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90a250a8-5ccb-47c5-52dd-08da3d9a7006
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117DE7512AE8F32ED53493990D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CY8LcUK2/OUdLWTWtydjPK1wMGwTz64foolaMznh4fM+GTy4or5rYWd2M7q8V2xQwjNzA8x+K6hH1NGNLXInQgce5oNdewWUOSJS+LYqrSSO6qbMKsLczgTPaI0OK7H32jePylNdV/wDOEozzOzLAjkP4yI3ZCEbgY8S1X+pl+kwawEExqkaAM7cNoezXU/7e+Ovpe0ILjA/bmdtiEnzYVE/dk0VKllNz1VOfud/rwDQnzEcJ1Nz7sK9L69cjxlptO+vwNAVuxJWxwreksuhbTnBNqv9g+IDvdoYgtPKOmpGwl6hznJxGPDVsTkYrgVEQ7RGX2+23rZJaoZ9pZxvSN1O5xURwcLm1J1F/9psAz4nlFgkB1mOCZOc5eVzeZilIO6A2pHOLd4WmH5Gtz79xJwaOrmsJ/a0EyZwGfIO7Xr1OF6moNsdwjhO82IweW8LqA2Vt5K+Mr39LLImwe1C2Vuo2Z4ZC00GMVikcJCjerFEh2WZhsgxV95OF2hyvnUWQV4N50cRxgV9CfnV0UOhgnLUbj9X2OYndcLxaTPEUZ1AJe3hr8vO1PPOTJpvYK1Y0rmM3RVo1qh2VN65pd1H5tU/gVHANlIqTNRLa+Y6LKJ1KSBGWFDTJvgKBK2SUq4XZxGX7dV5b7Gbz/zMcl825y40lZQvwv85AGqMGqJDgvRPKmiBjhpXUFcswKql+TQWbA4v8r3Z6vKsx6j1YbTYFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VerpWRtS1Rea/DGKUZ8oIYA+iw9OuNCBQOjVf8FI8vhrhlf6LdHcGEzAoVwc?=
 =?us-ascii?Q?0DO2MEa3PAiyMZ6qwKtfHClV9HOVP5iz/U8fG85s8VRaMfjexRH6PvcQr7C6?=
 =?us-ascii?Q?Bh5oObEsCHylHnFn0D363NkUcNq3fiOVCvyn4VLJhm8tc6nKBLfhqwqQsJGP?=
 =?us-ascii?Q?45M/+OjmbzOyGYCSBqEaqnNvK6tgxxZWPSUDAm7x4RT9sjSsNsBHkw70mB7w?=
 =?us-ascii?Q?oyrDX9DXVgBkbarFWAAabzpEvMZ17gUsOlOdPCVIVu4omvKp+V75NJT4YTOq?=
 =?us-ascii?Q?QqhtFRmNba03EdNkKjuVEpCUe1Egsdwjps+046ieZ8ikqHyxpCydSLbzNMJN?=
 =?us-ascii?Q?Zuv4T7kGZw5dk9B7n1vOIUoYc/xzK53gO3YKKm1uogaYoHRu9aXe6WlS6a7A?=
 =?us-ascii?Q?HQnsNX5echTQAic0LUQLSgfbvJQtkp/mkUfKXENW3Zjx92QHyVUVoZXy8nDN?=
 =?us-ascii?Q?xgNtzIBwT/QNGVg8xGdsTv7W3wpR7fnar3MEMcWm+rXcyYGpMiRYaKR+i752?=
 =?us-ascii?Q?c/dyAW2tTYjBpxSQMpm7gOJROGpfTb53nEbvA7R9v1WcRtbSBW2qf6x9XaGs?=
 =?us-ascii?Q?IDrbRnYFAU3v/4q5sNSr8lTpJ5GovwL3KlNexfxBI545/aQ8U8OVA9K0255F?=
 =?us-ascii?Q?BfXMxRAmPFGFdAw3Akc6mhddb1t9qK07P7OCO2hOupHuLMaxangYWXcJz2Jo?=
 =?us-ascii?Q?5c6y45ngyZ5w271RJP7vmbXCWkTIdHmQG1UF2lw62AzWCXYJR/pRJWmYlXUH?=
 =?us-ascii?Q?Qm3fS+D6KFemWYOBwVSwTyAnY9Q0RW3ZWxH2ve18FctnYPL+fg5swwP3IVpn?=
 =?us-ascii?Q?QtxoeBawLykJzPCpBIRJl9RbOl+4QmxnPstgWP4ZFO5AWsohwJ3OjB/X3TwW?=
 =?us-ascii?Q?fHj381xZgzLS0VT9NsBSRvaRJWFBVeYloZUW1XS37PwRsGnrK9BxL15uu0J2?=
 =?us-ascii?Q?sh3/KlESMn6/4JNnfdSmBtGcdArRweRSQOBF+CnBsphDVH4mxk5qXVp2DX98?=
 =?us-ascii?Q?8X07yOVQ3ITYQBaASHcgM2trnSZ8zto+7KyEGyujLsfEnzxD++cuyjX4oXWC?=
 =?us-ascii?Q?Povo5bRVm9lm9GOaAF2w65Qhb1up8etDS+0kSYtRLj71+09cKvWjm28pvEBA?=
 =?us-ascii?Q?917B8KeLlumxnB8JqRtakzByN41l5xr9kq3QeANoyVq8CHCyyb0hhvaEZ6x3?=
 =?us-ascii?Q?spcDRH8spmEUqdiCNXGvEk690dWNRiOaYmeKDCJypM2CqZoy7j7lzv447i+1?=
 =?us-ascii?Q?ZGG1CqNT7t8S8/S10yeSrT2KRhaN28QzlhWNOK2c7/Pxw3q/a7vL10jM1gcx?=
 =?us-ascii?Q?HNHkZAliU3eUtwGXaUKOAlwxaYAbigWs6BzpxErb4wW0P+5SFRMbMZ3uaN0j?=
 =?us-ascii?Q?6UF8K2T7DwJzszVcFl0DtkkELlIitls+fulX98C8oNbZjCk+R5tx5XC7zqnH?=
 =?us-ascii?Q?bi95CCA5co6IrazFKdltt9cbVhNhuC73aRN67loxHKF/6fkg7W2JLiMvi/ut?=
 =?us-ascii?Q?p/vcbK3y62kZ6YSJebWkMR1YxIvc+4KZQXpKh5hQybpE+p0MbP6m5AGDKDpf?=
 =?us-ascii?Q?MmDasyYcTIWHIo+1v4yTK0xet2p4QMttAt5uASPAUQ1wRqcTjrDNxDbpYYTi?=
 =?us-ascii?Q?OSzFThdsXkJ5TiOQbNDz61nxte2pS7+xu7qPAbfnjNz4GAYSZRYkdNF/y/eT?=
 =?us-ascii?Q?rpvo/x8FCaBCwVu+WS9cA0zF8L2fhumijMGKeKq5IFv1q9I/+lzg1Hdg2yFF?=
 =?us-ascii?Q?ausv2BsM5g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a250a8-5ccb-47c5-52dd-08da3d9a7006
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:14.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58Y+BPzAVbIdxb6aGpxtIELgwtppNkVbsgZZX736ZbuUkjOaqLB4EI0Nw9Uaw3eTVUKAZY5cTkTVas/pYbJYsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: NJTiss-91wzjdeqv-VqyWhZdCwFI80Pn
X-Proofpoint-GUID: NJTiss-91wzjdeqv-VqyWhZdCwFI80Pn
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
index 575bd47397..8d208f1294 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -284,6 +284,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
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
@@ -387,6 +435,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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



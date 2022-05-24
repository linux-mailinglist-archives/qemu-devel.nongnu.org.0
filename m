Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3F1532DDA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:52:10 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWpN-0008S5-Hq
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV8-00085U-NX
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV5-0003Pv-KD
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:14 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFF3S6010172;
 Tue, 24 May 2022 15:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=tB4tSjLFXis3Dh7vLjuloDknQ3HMz27ejhAtdDiTzcE=;
 b=AgB1flx7ystC49dSfjuShKdugQjgnsguML1ewKpbZHlM5qB9YlvqAzYuIXzPa9mBZMD3
 g/voQBpKvcxF5BWJmVKcdWITrRnENgaG1dfzjEcIj6jgO3u7F9h5ZQ7Ht5g5v9GjHAXi
 naNFSGGlLlQImzBjjDp9g+UUv/a5W2RqdJG4bhvJT+1k5BC59vtAdsv63Ky5UwnQYAb3
 WXZlBDtxaFnLkAn+Wgkprdk8fMirmXTBe+Fom2amN1k3da16VTO4XqvH8Frz0FVxbdBy
 dQ6oPXrbOYUGD2vI7AC6MgSAsOrqaXLQ9fwks1X1oLcmbwTDZ1SFCP3qJl+AGWzWYU3m yg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6rmtxrhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:05 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFSHU2001101; Tue, 24 May 2022 15:31:05 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2h2f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRLzFXuZJ/yZM8UbBOP85dWjlf0WRupIX6uaRTktD+jS3MqLYhJXwbAAv63fQlsXOru4aNsv865tsFHhbykA2T/fGhllhnf4dC3WrNe0Tq6LGRjG8Uw2Aahuq/eKZD+OIO4bd1I/J74DdS4Y6yzIz/Ryznx8MCYObp/0uN36HRak/DIQjDoq8vUg5/6fWV95khcFQW5C3u/fsnTQrka5ekZNEt21nLG6RWe4oLL0n+pgfdppg110mLLctA2XyD+F2bytXFtLCWsVK77YM4GkdvSjTXxyQiDvElC5+In8EpcJO3p5xaUzbTsJnZTF5h0/t0tbkqeTB9QWCUeCpkQNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB4tSjLFXis3Dh7vLjuloDknQ3HMz27ejhAtdDiTzcE=;
 b=ZxiomGrEd37BGgKMaA36qcm0bTXKuZWmfypJU7RTlkFWCIDtbICubZTluZZYI/NJLt/cJDAMUyKw8qfDuzTZG/+ikb395iwolg+JlfW6pHYPcJfUztiwv1b5arBHw3zls3V8g+MDXj9A0g4+1m5WdX1loG55tilKtb5+HdgL5E++c5Kgq8sF00EWJxPOtezv1MBoy2AbmXQYHDvyqcz+yli6SQ2VlEtrivHZ4KZDX62eeJM8XHKGAmsp6pD/YquyvY8ajAHafif26pgQd6+CFvSjdC+9qujeVxu6Dk6TutALEq6eHoFBEWiAsFkce42L3cuZJaZ9FNiobPsAPNWlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB4tSjLFXis3Dh7vLjuloDknQ3HMz27ejhAtdDiTzcE=;
 b=SuRLJnqRsr226BPBEQHJGZLBed/T2/8iyOin6k+ZzGVPlWIvGokVcIxbV7J7tny3i5lRaz1NuyQanLn8xwg9tzLWtVd0sPbPb0x8jlueUaTXoUCpv0Za8MRMjfve7r6hQm5QC3hel42RFgLwlsEVGCJk9jS+p+1pnJFCjBr/DXU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:02 +0000
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
Subject: [PATCH v10 07/14] vfio-user: find and init PCI device
Date: Tue, 24 May 2022 11:30:26 -0400
Message-Id: <6cc3abf55fce74eaa7a0f596cf3e09b4426fe98f.1653404595.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3e1f33d7-e4dd-4a0e-edd3-08da3d9a6907
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB311748DEF40977E4FBC2FDC290D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LtBP99NLPdOJBckoegRGaPfKfP+bAE2l3Ei0Z1kDnRNn5Iyoyc1yhKGuZP+vh961Azergio3EVZZBWLhD3wBdmTZvKIFNPTPCZQsZLEFtZ5hUBcEP9Txk9mG7e4BNovZ8cYCElWFGd1RRWQJAcKSw2sr3rnp2EfOv0JXDSiQtpueB29SOtLPt7QQnd4HcLVfXLGmrECxqESYF5PEvaBAGg+4AKxPcBqn33PQYNKdqBXPTHZ0ax9UNLT/h9kYBick4X0H+Ff/As9WxffAWgq7pZW+cb9eFp1PtifTdm4uuQkzsu9NUVG2LWtcbYXrjoAMDltztyBrKwTrdNSQc/zyBEmJ59rEa7gz60nEumRJLYWdKO2uiyW8vr2+tjxJZB6+r7YhaickPvVDt4GKBwy5ASd6HD+ecMo28aBC73AFPdZ7FXWllNhoQR+ry+t52l9Esj0I0pIsLAw0YW6YAx6E4tRLgaQJhYk6TLp0iK8owA6fMqlly8/O+NPDfbWZkZuGFgToX3+KeLZbo4eSDVAlQ5mtrHsms9a1DfatTZPxTZI+zxohJR3/Wm47mLVil7ReoCB5HR/dfM7Gr77zeqgzw7xzKEws6U7u8LDIKfWyow0Z49q9WYGgfdJu66whDBArqhqkk/Qihb0L9dzPVkheCULOdcgm1cbdRazT++M0On+p4MxqQvW2rSafkArZ0MYrO9A+B+7IwUdpEhQu61EfUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbm3lrL9tKikzqo9y49Vw9c4RbjwXUanTQCNXDb0mE+zaIEYp7zydD542pL2?=
 =?us-ascii?Q?61zvapNbRlyBxZPEyYlmn8wmlcIs/aDOtvjvHyYOBBUyXouQNy/UtjjvB2Ww?=
 =?us-ascii?Q?BLDKRogBScx1HmfR9vpD+58Rqu4dtQPWCUmq2mwbh3EMwjGqme8OlM+qsIX5?=
 =?us-ascii?Q?widGPJ6M5UAFfvO+sFNFiBeY+ZB4ROfeaBSlhbCFE9nxRIPXYIMQ/D40zlGS?=
 =?us-ascii?Q?yI5hTyhuEmJAcFCIWlmjQezDbDL3ovjhO93XF3seafSlvt7J44h/d1YqMHRN?=
 =?us-ascii?Q?3T+AsSuSWCJl9IevU4BTacKKNUcXp202BfzcUJWV8xYl4f9WBN+Rya60wrpU?=
 =?us-ascii?Q?udnDvkgKy7vcRrvzWfKw4SNHk3MtSSm7fLsjK4DBtiJ7CkRGeYq3cJxLICn9?=
 =?us-ascii?Q?uyQSQ1CDsXVgoXyzTbg9gOIOBaLp+HkLao9Viix2AeHZOdK2qNQ+RLDqxJyC?=
 =?us-ascii?Q?NKmEI6qDPs/7nVoWtk5h3QQCzMUZJJE20yVdkX0UdG8L0dmLCB5PCNqKwZwX?=
 =?us-ascii?Q?DfHI6gA/YRTh+nMrFBTW83c2F4NMYgbY5AxGLBf9czwBzcHUskgX9Zfp/n03?=
 =?us-ascii?Q?Vy1hQOTaU/3gUObSO7I1YFMd2O3Wp9ydhvLQc87y+TOUxLW/qB+Y3bxdxO2B?=
 =?us-ascii?Q?Tb84T65QuykdW9V7/yfhVeyfBEb+QWO3EA4vokzTrJsLEyqdRw+p7ogJCCGB?=
 =?us-ascii?Q?6xwYIzX0vLwy9u0GwYDGW2/KnwGrQ7JdqonhlkmjjfpV13IeYJKeer474x60?=
 =?us-ascii?Q?H1ZDxrj+nE2gMFBLLAcOoyKGVeQ+I3ESblC3nn2Z2eJBRAlX8RXsgfHFQHJv?=
 =?us-ascii?Q?5YKF10XG/5YZsxooMD3XeqsmEETzJOiT+u6vIdCt/o6zU69J2+7bm3706U5H?=
 =?us-ascii?Q?Nq4rltnJome1ctPqnTf07U7U52pH7RlzJXuOTrk0u8783B0jYq7kwQGGI8IX?=
 =?us-ascii?Q?ovkoikt/HZUjR4/mZgfMa5zKrXG/ZvvbrPc9uFA9Qdvgu+6OD17x98VZjBEf?=
 =?us-ascii?Q?J+ITvurHs5EtSgJShIVb+KVPRaf/YUtb8Bv1ZWTWNAu9wQbu2B3Oixtjkzrv?=
 =?us-ascii?Q?g7gna0nDq9a8EnC3ERZrjbrr1q0sGEwk8JrtJSL/GJaVDXUrBb9+dolufNUp?=
 =?us-ascii?Q?AYC/hQ0BHr7PkHhoGTd6E4wgJQD1njwSlvl9/CUX4KneLc/KDWrrvZxK3rzi?=
 =?us-ascii?Q?dWkhVzZEGK3sN/sDFzosuWtaFJql4B940dAzBslR/NhkcKH6x32rzCLmw0Cu?=
 =?us-ascii?Q?PXVqQGaj/jhuXi1dNOvXWAxyYNjoz91ZTj0RKNRVbe9/1qJm2YYGj728QIPJ?=
 =?us-ascii?Q?N1QhExlOExlm9SNs359qbVnBTWQaBc3haSukKSBQHyM8JE1UyFAAOMc6cmTO?=
 =?us-ascii?Q?6/KS9hg4rde3pJoMWMt5yCMXxCZgjfErUYT6XBNFf92qQ+8jfFFq7uNJIBfo?=
 =?us-ascii?Q?kAFzssVvfi1Z3L/gs645CzSgzNag/FjOA1nz69rVKa39qNNol/rzR+mePOia?=
 =?us-ascii?Q?2blvYNp/871BcwX0gnmegojiV740eKCgAt73Bq6+Byo76eb72867iYsWYE/+?=
 =?us-ascii?Q?Xrxbv4b/1wWjlbnLY+JypWVU0lJC3+ucj31U+gl9TI8AMEstprWeDuCR9/n1?=
 =?us-ascii?Q?wnmCxvoOpkutITAhmNJ2YVfsGwj3XlgjUVRj5rKULhMJQdUnNOsNpPmwDNb6?=
 =?us-ascii?Q?aQr0obre6jSPpkGupfe7DYBuzpWaOijRHiJEZ6FFCkT1L6JMCKBtuZOgQ6+v?=
 =?us-ascii?Q?0gVEB4Vhxw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1f33d7-e4dd-4a0e-edd3-08da3d9a6907
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:02.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8RhoDKoy4MeEjEmVKL/axvslCqrGCKPft9V6N+Nu5AVAYaL8QERIDU1itGfwtqCrd7eLVbQOcW4K42rRNSxwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-GUID: B5Q9GKGHohA0q_Dhlcr04sOXJtt2Mfd2
X-Proofpoint-ORIG-GUID: B5Q9GKGHohA0q_Dhlcr04sOXJtt2Mfd2
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

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 68aac0c2b9..fdee274933 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -43,6 +43,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -80,6 +82,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -195,6 +201,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -213,6 +222,53 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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
+    object_ref(OBJECT(o->pci_dev));
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
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+    o->vfu_ctx = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -255,6 +311,17 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09FC5186AC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:28:49 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltWC-0007gy-SG
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLY-0000SB-8R
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLV-0001QE-ES
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:47 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243BFGeW032436;
 Tue, 3 May 2022 14:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=aOqM4qtrihuCrrAaKoU4iKuZKZzm0HZCO5WY/cMYBhc=;
 b=uVSWZoSDTYfu1C4+1JBi7n9BWJzXcrZut2x3ugW0yprsjnKSs2YcmQufuSZeMvIk830l
 496JqqS/ngFFbSsywXUDdxLUU2pChW875pqLx415RLB7fqguygp+MdYv/QaR+QsXBelz
 uR1Qz2u9IDpCtv2LLwuQLAm9Sc1aRWcwK99ax14aOwJt2B3G/mmFlAFDmQfLx9JgY129
 3c1RZfzFqMC/s1aD16fJ/f1+oBn0BZvUNQTkUvc7eiFZggoFcK6gA+rGXdAyUKseXCCD
 Qu/g0ft+6P6gmsax2LqmaiDqbhrY3KhG8Vm7xyqpUm6w2dlVKVN+e1rye+Reyk/W0ebV vg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0annj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:40 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EFJLv032022; Tue, 3 May 2022 14:17:39 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a4r3ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy2TdyKb5gVK6IJ4UjCwB1krUs0lVwZCNifojaIIKBrpQ6xVnvM8wiysVhcCfXSn1mYmIuxLor7t0jJHwql17NSN5klfrZ3VQxxfqEsw2YaSmKh6nG3F05jLLjJDWimJLW75jgi/QnvnDiKAmUzeo4tWtd1pmiz/EPAJiiAw1tQAWIMxVX0GQb6zU7RtMtHqVJDuo2jhJ/i+TR0xOHW9tBNb0BSdL/i/7BecniEdfJID/2UkQJydzzq7ONSpU043HqF/VMBIMVT1Df+8MK0y9uFxMG22ImKioKDQ7lESjQBGcSKDDdu7E70LQfAlcNvThqQoSqlPMkN2Y/o9c/Kqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOqM4qtrihuCrrAaKoU4iKuZKZzm0HZCO5WY/cMYBhc=;
 b=JdnNMWIbXlr5G5XmmJsG0d2zYBa7SZjEFbHJO5pXGGRo7gKfMsKsaMBQvGP8uTZyyTFNiAtTZy9rC2NvoaIbRW3yoVg0RS5Sq7Y5hpyGb2CyjKxt90LQe66lppMC9Ns0vvB15Dnk0iEVvK+nH94Wui8DqzjC9okRavr/Lk4PbkzreLFhwKQJzd/HzAtdoNPCX/a1J6debLlEQjH1g0ybFDiCp7uvpjn+cPglHf5KYkYauQpBZQ4kxtb9QiLoU3k4L7kj9Sl+SMxyl+OciHVoCU1p/2uWS2K1yxaHcHj6eN8BBei0yZxYNSwC3tBB94IChVEOoxTh/wWV6QxfY01iLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOqM4qtrihuCrrAaKoU4iKuZKZzm0HZCO5WY/cMYBhc=;
 b=WWc1vhh2mZ1SRAtdSSn/O3gW1n7czqv00A03I9KKBbbnCXirr/05A/9iWnTdV1SrDCikbjiV3wTqxdQ11qzJXB1Ux0zzXaQo7rz3NaCuA4ibHb9hh2eL7IA/cRenijkdD/YewWgB9yRkrlzW9Bs1K+bzjuAhQmGhDDnQQVmIUZc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:32 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:32 +0000
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
Subject: [PATCH v9 11/17] vfio-user: handle PCI config space accesses
Date: Tue,  3 May 2022 10:16:52 -0400
Message-Id: <fcb53f58694f2ea98463dfaea453337770c0e05f.1651586203.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b4da81b-7946-4dde-9ef9-08da2d0fa9e5
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33580B9BCAB39E112BF3F5B490C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBuaXd92A7aNd/hDyhXmUtLq2qVH/4Gn565e87sNJ/fNjuk1hou5xN9K1AUT+pwwlsYG8x4aytRGPid31vIuBoBLoOfxuh0qaBv/QOZoUt5U+wuq81g2dGeCxWQLAUVyusAvpZywI7cBMQOxnBje/l+lNkh6TzQKR7iZ0/1nnj0NJUrIAevFqwQfjZHsoe+XXfllg2ogQ2Nu/VYclf1TrYIy+mnOBdmM+x+BfTz2IXOg2jkp1eg59JWpJF76/NXc1ygTGhpr4SgE0Axu2vixcK8lJJN9LhScLM3znFzQXyUrk65dW1HerIH8YZPOV6t3390QlkKV0r6xHzUZIKcVmCjJ0DFvVqEyEfbwO1g1RMgTun8kuQGG5ZBTZDZvTvqNe1NOzHOOVm7i7ZLCxKcctbgT+RHQf4IEC1eDt8AuxwP7OagbnT/B3v8sHvdjjfwbRIaRGk7AK2EJ5whX4ayL0SbShuhTW0Q8XfN6SvXkzoTa0WbRVC1MEXuMPRtDfJvejIBNOFwVrQSCnE4d+sBsayvrtdFmMybVbZ6optupV0UJcS51ESFTJlQbgQPYfjEfqtlDwJynLegAZdWM//M/6VGQNSU8F6aEN0dI4nI2kRxtZdXvenEKCsHxXi+O2kPdZosFCe9hnoCet+vRNpUNWWpbIIrZalMabj8n3PfqYgmQyLhaCyksiYqt/O4oLyjsldJamX8uJzzMaSGnlrs3fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pTzc/G2GVNhorqWGAW4bGDHkP7TvoEAIVRdw+3gfQOwTEHOSZAZqP43I/n0?=
 =?us-ascii?Q?nKbI8QGBrC7v/jDN2ojEdV/tsVD1dgGGdAmUnh2Bs2RLjYRPsp6Xy6gOckZ2?=
 =?us-ascii?Q?pw5sHnXD3M7Bo95Xg+NedrnKV42Q3WrMUikbYj+OMH6lfKtxUFEEhGzS1oZb?=
 =?us-ascii?Q?uUVUhvC5grfnnGZwAnz1V3Zy149fcPdmlIKVApqimX1LxqpD3KFGzl9vJMkN?=
 =?us-ascii?Q?M1aZ53uDx/nTqu6gSVyDY5RjJ8/Ay3YVoqBgiyNZ6dPDmTSkAfUMGSQM/URE?=
 =?us-ascii?Q?yyy8g+eIlCyVwBLIbVidsevzRiwZj3FkfJnRhxeut1uyKby6sn++zczbNCUa?=
 =?us-ascii?Q?Cs56152itHXp3ErHUyr2QGRDGFYiSJK4r4eU3jx5CfA50Px7nOCBgOa46Ab8?=
 =?us-ascii?Q?yYnyktGX/AEUXLuf6PSiArB+0cOWX/7YNJvZ9NxojznADFYMzK8rHy4g9JCH?=
 =?us-ascii?Q?FGseXu3XfvVjdBYmHEDwoK0rQMwjgK+GmsNyoMKO8zSzY+dlwwNSAIBbdBU+?=
 =?us-ascii?Q?FQ9yaf7GEIOvA+obaq4+mHGgZszn3mX5RP5RM7o4iKX1Bv0+/ejk6YRil33v?=
 =?us-ascii?Q?HkgUGMd/7YzJw+tKR9QDL755PA4hMMW9lxZKWitttQ85CulshbpGhW+o8Eul?=
 =?us-ascii?Q?woEvJrWY++r/cm7Hj/wExwom82FYLP4UiJDRVtiZIiddIZ2UIUqquFQ0cPXL?=
 =?us-ascii?Q?KmUUTQKEussx3+2CBQgEJmHamCHxtc4svZmh00aRpqXthGev7eDTaByjg7wO?=
 =?us-ascii?Q?27iIiOF7VWFTD5byiN8JYN/YNvCZwsWRFX1o8RJX0QSlaIxRcBIc0yxmKvxH?=
 =?us-ascii?Q?+J6D2cAIagrEhf+MEFXxNVBbP7d/ksF6aNz0LMd9D0H+x6cqmvPtinrum7lp?=
 =?us-ascii?Q?UMqjRyR8soCJ+4J4WWpV6xEF4pQ1mNp1DzfoV9NYNPSLk48/VRp4ovSZAaxF?=
 =?us-ascii?Q?5T1UuhdFQHOh2fWvV7gdfWP2tkOkIDlFu3CTYcb9CUMGINHRIuR3uQOX/MSF?=
 =?us-ascii?Q?k17z7p2/lgAI7DtlS6fWR40tqYRlAKvlK+zIcYF+9eVghFlr0GNdM08youMP?=
 =?us-ascii?Q?TUqKmNQob2m+PpLXPEL7cKL5K6T9dx3tZh3Shb7a6qlQLO9nIDYITNnjz5E1?=
 =?us-ascii?Q?G5im5028dkgaTG6UTXGYK9r9iyompTvueHhmJIADTZzo+fxLbtB29IkK/QOy?=
 =?us-ascii?Q?hUphHn4y/CmlxWz0FMHBsQbZyJwApcwXR8LlEeaskbLlBBxc7JeEY5zy4mHV?=
 =?us-ascii?Q?cXKCXLxIKDbgz3FphryCoYuiYey8LDP7QGxoiHY/Hp8pPpOTRqh7JtZ8HP3j?=
 =?us-ascii?Q?sXmsGVzQyklxEsqNpRMmOCxK2M1etNbB0wOj2yumAbMS6nDrLJPY6jhHFpS4?=
 =?us-ascii?Q?tzdUZM2bEHngybLlrabPIj7h3OMirLgfJiyQYoq2c3uJp3QO1QzqJVTkq3Jk?=
 =?us-ascii?Q?NsuUbNaWx+dqBbLKL+PewkvIVvIQq8/ytpD3nstyXNXHbUlyZMIfvQrt9f8O?=
 =?us-ascii?Q?4aLgLzY/hAHGY8M51/K2QHlE5bgVI25Hj/n3OqIVsulqbjY9sMejfRzTlDYG?=
 =?us-ascii?Q?CncWqiF0cHeenZWLYagXMdEQyThaKIQIs/Ng3fV+b/5mxrQgtsNwAv8zwZEm?=
 =?us-ascii?Q?2F6dfifc32J6rX7skIVxqDV/dwrPlqnXZSugwk9Wcbw49+sKPnex8XdJKXUe?=
 =?us-ascii?Q?sEh6LnHsYQBXcEuQJkB2Bkm+8WZjiBBOfoSapbM2GTAPuDs7smqlqh883gcU?=
 =?us-ascii?Q?8G7+fuL+Sg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4da81b-7946-4dde-9ef9-08da2d0fa9e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:32.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qnwpa3+voHzDF62nY7vXpbCYLWCjl+frme74li7VPCYimYMtZBnyqSfw+9V2IIBx2ZWuCEdH62PAsWwjmLVe3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-GUID: OSxORMj65V0oCwqll43MYigxWNQ7E2pB
X-Proofpoint-ORIG-GUID: OSxORMj65V0oCwqll43MYigxWNQ7E2pB
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 51 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 3a4c6a9fa0..c81a76094c 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -46,6 +46,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -242,6 +243,45 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    /*
+     * Writes to the BAR registers would trigger an update to the
+     * global Memory and IO AddressSpaces. But the remote device
+     * never uses the global AddressSpaces, therefore overlapping
+     * memory regions are not a problem
+     */
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -320,6 +360,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1



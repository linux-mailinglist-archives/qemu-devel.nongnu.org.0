Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FA549F0E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:29:49 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qh3-00024d-0s
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qem-0007OK-27
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qej-0001q4-Kp
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:27 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdRDB027247;
 Mon, 13 Jun 2022 20:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=ZsWTZj4xKiBT1vb0raGbE7N2BQtE6CQKPnM0DnRHw8t8MZwxomL1lloo7xcVNOptpokl
 E4PItnGvm7M07jBVYwlvnYbwm0mD9KPBK5X84iji8G8i7VRFNRzjrd5liLfTKgF8zKAM
 HZ+5RxI4oHJJCmoImMMDvWbvexQ37vkk3TZAAJr1bH5FJJAieji39A2nPJfEbWBz6K25
 1lCiTIoxgzF39d5gQFkpW3x4QtB2BNEzvJg6Hk6MstJltv8PryHwNykWQIzIpsNeqqeo
 FD3BDK7xWl6PNbqTgwyZnE9EdpuUBc99lhvIw3m4OpOfloi+9hJCEKB2RI3yzRvys4QB 3g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns42n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:26:58 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKQkYw026213; Mon, 13 Jun 2022 20:26:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpc9c809y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:26:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I99WH3hd8WLhP64krmIoPrT/zLjDt/lJPz7Q1JDYwNmMGX9RgTdFxVmLGUi6fCFh+D9wllqkmFS4mq7kXTQQFuWlUTfjoxsso+kHD/OOVxyZHVfkvnsdWlB5vOnBwAjA+3m17CHshZDF6uUGz8RjEMtswTB186gMTeFcwYYTtWHXIgfwoIRbrCBONxKaA8QW31Amvd/Rc9n5rCBMNBT65l2ieofFC5fHMlNDwbjcqaqic/Fn5Mmc6f2IhgJCTUhtWB0ZDD8gn9c7nKvthhw4JdqLNVaFnZPCr9jiLe5qSM/VuDa5TGQ/f7Fl0OPn2l5tbMF3cXyn2NcEH3b82Lqmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=MDn4vK9vb3D+I+ZeqnWtn5aghsqlD19v8DKfQGk6bEGuOiqiWqj0fUGDd16t1i9D40Cg8fpEHvIPN4BE6NUdbziyVsH/Bj0OS9MSs4GvEYTHPnWYph8+fFC0ZmazRGwoTDFgKoc7sN3+jhx/cV1EnkdWmqYS8I+EeHuv+wMG5w/EYcP/w0yzG/5L5HNxv0XEL6OaxWl7YhRBGdK8Vl85AnFXcAUf3yWwcpMBwgtWUobXVJKsaWpfKvLwvqCDpusNwTObO0ku/NDDwp8lzUYOrhMPcuctsqE7gWRC2gsQIULG+zp3tYWpoadzQFUTbg6afe3qsGGq8HdU6AUPj5oDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=t1YP+mLxZTEPvxBKzFOUQIs5BNSaFb0yu7vjNKI6zqdBLcCqSG85YhP0dJy5hnk80eIO+T/48jmr1ceNqlR0BB4hyMqRTjoG4bvUkr62OfAUMpTqSuSnFrp7BqDktbJix9qUc0GwwrANzcD1lZ5nkcPeOTcKWxnGTN3+hFU7xmQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:26:55 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:26:55 +0000
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
Subject: [PATCH v12 02/14] remote/machine: add HotplugHandler for remote
 machine
Date: Mon, 13 Jun 2022 16:26:22 -0400
Message-Id: <d1e6cfa0afb528ad343758f9b1d918be0175c5e5.1655151679.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: f10f3451-1627-407c-5337-08da4d7b0e93
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723A3BB47AC727ABA7FD85E90AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTlyxwL8QVa1vnf5fHQtQWLvb9psATpfjHGb+K2EfpTFGY5nr3D7PyUXuYZXJlg3FxZfsg8rUhtd7pHC0v+AhOi7+DfbNmy8+Rl8il/TSXV6levjL/LfwS8jsP4lLpZaXXNCT+3BFFRq9zQcMOEv80nflCqXWjGstunzO/XsG5El05j3+zkjhI/d261vBRSWnisD1y8C9CFEPuqBX+LlIdY78p8wbMIidL2WRR3sqq7GOFtUYs/5dnVuR5e7nWkfgSjhihzLEVvUzkm57GN3fK+8lprqM+nWnbSPUcHZOGYdkzcLmUjvDbN8ULSurcJfDwmX0Mpc9BN1ZP7yeJnM+GAKG5pBuNQe60TdzaJHavP2fyejrASzvs4RFM1pbppfT4BIm7pd5d/fs0T6dSOP7J8z858XZKRV7wKXkHXZd4Ont0nfy77FA6VIQvNX8QXeLIpBAUMGLqYVy1r0WCe7+L8MseiqqjkEVWXlVcHhy999AsgfoO09QyiROJT9K+zfwGeMDPV65cXbxjhdLZNtIpohg5ofNpCymPVO/eDDqiJyMLJcwy6kmSURUMKtjS7H8rT8PpdlDWO6lXyxD+fqC9DtDTLP7ZXIZdUk99pgmpk+fTgajGVo4U/g1WCAhqHN01KvDrQRxBTnjEQj62FeX40WJ065hOqyI0gmzMa9Uqs78K1P963/mZ69+OuAiYgGvel0Be8WJCS1bvy1Abd0jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NzXyO1TL+tn4WNPuoPJXdG/LkO/aRqQNxzBxiXbIigJeOdiHMdxAQrByBR/Q?=
 =?us-ascii?Q?j1NmBC5NQpm3AKs627N81rHAjydZ3w1FQNkonpkapj2vw8WGdhflQ1IvadFS?=
 =?us-ascii?Q?Uqi6iHnnjuWT49c2ipRBC90NfvSYnJMUjqYuzX2SMe4xzXphvNcSFGFAaEnC?=
 =?us-ascii?Q?kD1MAs5LZ2fiVVP+vaqaQWOTy52uif8sZWhBOp7GwcKI1W5gFSJ8FFrvdKZy?=
 =?us-ascii?Q?aT2KKzc6VVL7IGatie9ZN595NmRN67pBD71YjSBfgcx2iT+r4cFT12EJ3l4h?=
 =?us-ascii?Q?8HUplFd/wq/aPChJOKgFYp9Hjv4OmcBnNe9ELx/eDDFNu9cFdK/VGi3lmV8U?=
 =?us-ascii?Q?DpR6HNQMbNDJLKmZ0jYIrqalGQBH5zpqRy2W7mzrJGgw9AdW/gAJvUBn+1ES?=
 =?us-ascii?Q?1+HM54nlwjmbNptFXhsiaMEAyRPEWja+v8Vm83rA/jT6BzSU8/FC8xs0d509?=
 =?us-ascii?Q?YdRJ6qO1bE9MzPGdErylAMtvpdPHs7oQnJMv5sboVdxBRJ58msJVb7CepqCU?=
 =?us-ascii?Q?rHpLgkgI9+RdWnQF0znFz7ya7pWX2IqgLamxG+7VYul79/d8p6N8Y0/DyxXj?=
 =?us-ascii?Q?s8F7f17bO1hLn6k/pr0VMTnNxudklBVz4evUgTXFhf0/KOKHxhGZPYdKvV9m?=
 =?us-ascii?Q?ICE4jftlSmqa8z1mDetsDjXHsNRqMg71aSEWu3+0YWpRHFdKSWbSF+gIFVvs?=
 =?us-ascii?Q?r+Za1CyEQJ3wdFUjF5h2sabrVZw3JfRRnW602cwX7hCiM4aBVZUFjjTD8/ws?=
 =?us-ascii?Q?an+UIzaspyc5lpfLHwtI/pzBi1DjbTaigUjLM5hch+HcS+7hW2d7rzXXl6BJ?=
 =?us-ascii?Q?qPQFsUMC7zA+XMHd3Lpk4fSulOwKfwdULfOqTTUJr3d23HsJjLBDbAiPSzo5?=
 =?us-ascii?Q?GcA+ks4sx5g4OGdBIq/xlCBGQ3Z+eUL6RdYGuxDsaO0ys5adpAn/Y78EY/tK?=
 =?us-ascii?Q?IWNd9MobF27dLRmRasUSA98kkGZjnX7uRnmQOY/JaOfCJ2eTOEtCGcpulr8e?=
 =?us-ascii?Q?N6BdYjieGzn6hhQ4ZFR2CRdO9gm8bUWv2msChP084mTmf46IWME58PQbiUcR?=
 =?us-ascii?Q?LLDOvnYh1nWmYK2meNA7twS8n4A/0JSquRIL3EGeaoEwXLvpwFM6qN+ToLj7?=
 =?us-ascii?Q?CK5V2tfQlmrKMxil3buT2nsYULQ6o9bGNGejW9k46MaK8i3vd7DMpX1tRY36?=
 =?us-ascii?Q?FPz8RWAPZAGSbAkDbloclkXweb18roJe3bajDHHuxqStu/77XUbH9W1Dl3bW?=
 =?us-ascii?Q?cF9kEdTfD/s6O4oqxSm0Om+pzdg/J/tNhMS6rmKAS+1sblSBWRYmu7/tUA76?=
 =?us-ascii?Q?jQJ4gOKcgXBCfaJcICOexmY3O7LbOzdDseX04F5GdmaofOzXbIJ1bXpXvp5j?=
 =?us-ascii?Q?AyO49h1hZldPD0ZbiEfRs6YBvAKhxC1uAReFyFGXHxBOaD9DQD8JZtY+Nb6i?=
 =?us-ascii?Q?vy432TG/AKRmeQd+TZE0nB+PVszMRg16S2CBxIArn+0Wr3lZUlWyhCDQehjk?=
 =?us-ascii?Q?Y2xaUWgSZcbwHdiodII5sEv9QBdawPQ1PRKDhsv7EVEO71e0GDJfzgbbwzO0?=
 =?us-ascii?Q?xry/2MrL90meJJY51pT4RAMaWmj2Ohk+Q+37E088zQePvq8Tt64Jx+9JyrUv?=
 =?us-ascii?Q?fL8tn78zrrJDCcxuAjkCVJNTBDxK1CLx7gxwAhdd8Fh9Aw8GdWILnYagf3gF?=
 =?us-ascii?Q?OWbsgUYqXD0f3bV8tzOsywpFTWwtecU0fbDlTMG6rF/ImIGGPGc6SQ/NwRqp?=
 =?us-ascii?Q?9sUOazqYpQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10f3451-1627-407c-5337-08da4d7b0e93
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:26:55.0323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o70HK0Ix8KNvh3osGnhbpu54jEyRbu+rLaQuWzwzakwBJjXfmCvqkE2XDIXDX/C9Q7fsRKUoKgvcRmAi8UA++A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: SWhTfwBkHZqpBhOa-B7C7A1_tQGKb2SP
X-Proofpoint-ORIG-GUID: SWhTfwBkHZqpBhOa-B7C7A1_tQGKb2SP
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 92d71d47bb..a97e53e250 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -53,14 +54,19 @@ static void remote_machine_init(MachineState *machine)
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+
+    qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
+
+    hc->unplug = qdev_simple_device_unplug_cb;
 }
 
 static const TypeInfo remote_machine = {
@@ -68,6 +74,10 @@ static const TypeInfo remote_machine = {
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
     .class_init = remote_machine_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void remote_machine_register_types(void)
-- 
2.20.1



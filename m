Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65D44A00A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:54:57 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFPc-00019y-PA
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAi-0005l5-T9
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAY-00047H-GB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:32 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A904wIh013245
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=bbInx082Z4Pg4phDAYj09qXC5uDKfMsNxVyv+1Zg9B8=;
 b=zc4jTkj76b8KudW5ru75DPKE320Vxhqs6kXfMRySpGPhSPIOKDG5YLvalCRUJd3ADnOd
 sm+12+OouIRRFkIsCngLq/xvzgdNkFWc6N1Or6g7tSKimGMby5L6RfHQliNK/hoYxAeC
 U3TK8ynPb3pxNe8wmJw7fm2rtnWeS76+hlzDrkulK/Q6+i2kYsmOHFuGE8wfnViwaQTJ
 GinFLpDyCpdHEydfwDxCrKXvav6JstxhDPUM3LoOnfQl1d5XOZkwI+aPpQKpMYF7Uowd
 G0RNkPifoTg3uySyw8pfY8NEcchesmGsWCK16pAJCX/bUKLrm8SD0X0z/UQHLqkqkvfl uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6st8qyed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLTc129165
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3030.oracle.com with ESMTP id 3c5etuvb8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqVO5K8WrZwN+5YK0EoE8thzoHy9eTvs8rCxkx2zcX/qErphc8l+k5cSGSL9N+uROy5+uL10tOeI+QpuA93vRgbG4LMM5rzX45nPYDkqglsKr9BJPY4fjCvRhD1fiOT/lGLvye37qZ+wuK6sr1MSKkYbzGhtZNDKykGT1+UDdwyNvUVCkZwSU1kigDs6rel7Z10hldtWGK28FaNMjkhXRA/1swpefoPa0FEVWCvnNaCtM1ZBEhtiL6WUpa84xSzJ+4X6yFCQQCCbpgPeIUeDiNBG+7ckvVzyZNbRXZC7GKliODvv4dE7Q3tOrdJgWJmZh6zdIEq0yzZnRcAVKlxc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbInx082Z4Pg4phDAYj09qXC5uDKfMsNxVyv+1Zg9B8=;
 b=MjwVdTx/j2wratVrcmncVwzmgLbEAV+GXfWqTd8NVZip0QYn8m45mgl6k5NroWJgM6uwRG7qdjUyZWUGFZYhb9vpiB9JVzQC9BJHEnLkWS1KotpSqU+aIh7Fqub0ZxenMiSa7PovTtcig7KhfJC5kswAJba52rIQ6FDdDQn3J1sq0lzv7Dn+j8kqyzwFtps9WUrgyD6PuMCcD0lZsqyKsdgNl8MIwGGolWprmQm44tO77aampKRDlUJnBjjZlmsm/z7qhPFClL+Y4fg+a8xVMZDMFsMDrEtMQ8PWaHD7xWWrTGOAOf8FiRwmZIHl6jVPCOoAEjHkfsCBegQYV9trSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbInx082Z4Pg4phDAYj09qXC5uDKfMsNxVyv+1Zg9B8=;
 b=nBWw/1eEGgiNjET92khj8sY7ZXD4nvTxmK+wFsn/S9NaiEtWwyd//Kbl0RVMqVS1krGJVzGEUQtvGAf4XKPhm59emEyuNbS43bwNGm1YHYco1P97DY07D7blreT2mTzrwQJioehKKO71rZdF1J5USRy2sPOyMxKgpok7W9VJlsc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB3764.namprd10.prod.outlook.com (2603:10b6:a03:1f9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 00:39:17 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:17 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 17/19] vfio-user: dma read/write operations
Date: Mon,  8 Nov 2021 16:46:45 -0800
Message-Id: <26773d11c721cea1df74df061ae2c101ce3a975c.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 697ac4b2-3c80-47e0-676c-08d9a3195acb
X-MS-TrafficTypeDiagnostic: BY5PR10MB3764:
X-Microsoft-Antispam-PRVS: <BY5PR10MB376462E2EDB4B2C90E67302DB6929@BY5PR10MB3764.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1DLHFzoFnIu34FoCy/9JUP/Bd0ZGwF1r3t9xNENVvejWgLXlFeJhD2J+/u7KP1ls02kBSerqI42WPA6+9x00JWIbe6dpbNKmjeijIN9PrbE3y2s3LPwOUwZPP3ZLN3oOgC4A9/m9IuTT1ZB57BLOZp0FgnzHz94KtYwsABd0Ac1WLxZNWF1U/ghICco5oxpHMXji7fw+W8V6GgXF6TxxFeQJ+vQ67uvxqgSO6G6wKXBs3qF/x+iQgRB/2hqRQZnWc2TauHNQh2wdVv6Mq3i6xuPXAnVXDeryVWt3ADFgM6ol9UdHZ+AY3rKglehqGLB3MRgyRURRTHvoLF8xSeDcS/+dvNemELlQ5evm6a4jRLDyXD9Ra271CJQJu4pjF5ThUw6tnbvAxHpmxvtxayvV9r2dFZwMkq39TqEj9Pk4Vj0lQtxt+5SxSOoNu9hYo7/hOEInqK45hu4Le0H5BASiC5KEERZ+9DmW3lawkqP93d9aybj2tW24J3t13WjknO4pj9sM/xs21SigytkAWFkDuwNQaqqLFjcGyeyvvGzeDDoJ4dc1i1Bn/lZMB2qnj29M3Jj2MeHJIWETiNet2sHoC66zez/EnonSegE2qe6RdStdcYahR9r/2VJWo60XcD+NTWS3M/DcHQo0eKYdzSucL6YrxC2h9dUt6Li1OPfcmsnEnZHVjL4C98aG2shJccF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(86362001)(2906002)(8936002)(36756003)(83380400001)(66476007)(52116002)(8676002)(5660300002)(6916009)(6486002)(316002)(2616005)(186003)(956004)(508600001)(6666004)(38100700002)(38350700002)(26005)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CqtgNGgnY5EMfmH/217U3vfSTanjHGh6IqP+nNDLqJ7rkOvgbU0VIS+dVFbr?=
 =?us-ascii?Q?DZ48aljydeabuhu0OKl6gBYLoNz2jxeKmvMjsD8GdhjRPDxa0W5ITKC4k2bG?=
 =?us-ascii?Q?RrsdAy21ls9lVHiEMf4tITXkFAvaSGoGzs5JZGBan09go5diE3Rlc3t4rS97?=
 =?us-ascii?Q?N6i5Y8mGCJFU8kGh8XhznjrbQgoJET1cnQvm+yHcjQ0U5ua31s5N4SzVDFH3?=
 =?us-ascii?Q?bnVfzPfWUpPg1BXwupo3SWmbiL+MA4OnVz7HBvi7Djq60UUuTHi48fEra6bA?=
 =?us-ascii?Q?56IxsxjeGvqeMah060d+BIvtxcToUMKFjWpgTobO3hbIOUBKjHQNeKcJKYfp?=
 =?us-ascii?Q?OucSBCiOxd3cYyzem3aQpaEAPYY/5+AQ6zoRd8RMdXl2x9RDYX8Ym8zA/mKb?=
 =?us-ascii?Q?pi/fU2LIYdTsuXzcFjsAfMhJk0uz/RGY/xC9XObAEbSVPoJzL8CBL73e6Db4?=
 =?us-ascii?Q?xOJJ7BA2PcUcnImTLgxkHNOnoygfO7xUPTDxSBVLCZvvgwPFYLOKSCW3ZM4h?=
 =?us-ascii?Q?YBbLQ3UexymgAFVzsCaSNt8uclU2xGK26RB59cOoEoAPB9jAqS0BePN3gcDr?=
 =?us-ascii?Q?qokwBdZ8xuJkh2pLkycL8BSohaCJ3cfgzvc8kv2F/P1gAEnMJkHyT9mkNp3P?=
 =?us-ascii?Q?EVqg3ke/EIjfxNO6WJXsH+coPifODr0I9/e6VFaMIuq/MA6labzf0TOeXAhv?=
 =?us-ascii?Q?T4d07m42gnmBZLg2u09lf6v4RBG1TfdlQRIln5WIJt1ij9Ylvv5gEcpBp7F1?=
 =?us-ascii?Q?IeoP+0Jj8A4pZx1DFP/npHmQdhB3bpVWQhmEApit7u48DvfNvfb06ilHzwTi?=
 =?us-ascii?Q?H4PCSBDWaqrFMYdUBFtq4TWbr6A6jyIVLeU/3smJNnMO27GC/oh0UzRKm1q3?=
 =?us-ascii?Q?GWVBJFtYeR/BcLwGcT5V7KfIB/kFpcUhhRM62w3VZ3C/fLCHSMca1CDA6hUl?=
 =?us-ascii?Q?QN4Xz1EqYMpDTg6W0whb2+Rr/S8k6R5z6UDwmw7uKzc5TMcmcJrA+67fqaLF?=
 =?us-ascii?Q?HT3urgVkIg19F2ibnLLMw7bQyg1isbkFV5U9X+gOjsYG9ZCZGCeMMRCx31Lg?=
 =?us-ascii?Q?gyVDnoRa2wN7HGpHKmhaZxpCftkFi7ZJRopNUGu1d/xymJwQgmpthIgZCBzJ?=
 =?us-ascii?Q?T+KB6u4weo4OoOVeou/CxFdYFgurh2Jkbjb/FaW6G7H4qD6afBiVb7hLfB8A?=
 =?us-ascii?Q?Cd1T6xajsj52HWmQ7B+ycWXe720h0wYCiICd5dbHzVoBi5P4LgTY2XIwtot7?=
 =?us-ascii?Q?Bq5oOvzOZdtIsDJMzSewvX/7oje65GuP/NyNGypXskZ0tZHxbiqIsBrSaN3c?=
 =?us-ascii?Q?htibLoUMDnlZ7WLZle4moW5yWFERK1uE9q3C1rfuGk/qG7XSAEWBGsphN1+J?=
 =?us-ascii?Q?z19TQrev8AqXjBwc18dN0QyzEzndyIR77Xu8JO+3WStqzMNtGyMQuiPoBKq9?=
 =?us-ascii?Q?3nzgTVCkdCS/9BG1LfETvjdQ9+K9i0w9m3+NLbv6Sg4t2DuhOh6OfiYzPKVs?=
 =?us-ascii?Q?0WLWvlX5T+RLv2Nqpa6bxvBH6GU2+WhtkYum08RIKnNZBoU236VxqxoEAOIB?=
 =?us-ascii?Q?cz206LxYISUIs0S7Qp+fxiMNT0181B3obDMma1ilHA3UM2T0sS1Ek79qjn5y?=
 =?us-ascii?Q?oVm3zDK2M4DQUqE3fy9P2E3FJokr9I+md8q/dVlShLwGKMMh9t8HwA9DnueH?=
 =?us-ascii?Q?2LbbBQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697ac4b2-3c80-47e0-676c-08d9a3195acb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:14.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtFnF7QthSn57Rp1Hyro2xWlVbzRmkbESPam1/U7GEFCsBS41e1bb/gJcR8DnT/Xr3dchgrTY+U+kbEIWfvsJSBSCgQol8DM7okkvybWips=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3764
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-ORIG-GUID: xfFMdRX7u4rQiDbVtcEglhkpCliuf7UL
X-Proofpoint-GUID: xfFMdRX7u4rQiDbVtcEglhkpCliuf7UL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 hw/vfio/user-protocol.h |  11 +++++
 hw/vfio/user.h          |   4 ++
 hw/vfio/pci.c           | 105 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.c          |  78 ++++++++++++++++++++++++++++++-----
 4 files changed, 188 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index ca53fce..c5d9473 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -171,6 +171,17 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*
+ * VFIO_USER_DMA_READ
+ * VFIO_USER_DMA_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t count;
+    char data[];
+} VFIOUserDMARW;
+
 /*imported from struct vfio_bitmap */
 typedef struct {
     uint64_t pgsize;
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 997f748..e6c1091 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -80,9 +80,13 @@ typedef struct VFIOProxy {
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+uint64_t vfio_user_max_xfer(void);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
+void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size);
+void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error);
+void vfio_user_putfds(VFIOUserMsg *msg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 extern VFIODevIO vfio_dev_io_sock;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ca821da..877e3e3 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3453,11 +3453,116 @@ struct VFIOValidOps vfio_pci_valid_ops = {
  * vfio-user routines.
  */
 
+static void vfio_user_dma_read(VFIOPCIDevice *vdev, VFIOUserDMARW *msg)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    VFIOProxy *proxy = vdev->vbasedev.proxy;
+    VFIOUserDMARW *res;
+    MemTxResult r;
+    size_t size;
+
+    if (msg->hdr.size < sizeof(*msg)) {
+        vfio_user_send_error(proxy, &msg->hdr, EINVAL);
+        return;
+    }
+    if (msg->count > vfio_user_max_xfer()) {
+        vfio_user_send_error(proxy, &msg->hdr, E2BIG);
+        return;
+    }
+
+    /* switch to our own message buffer */
+    size = msg->count + sizeof(VFIOUserDMARW);
+    res = g_malloc0(size);
+    memcpy(res, msg, sizeof(*res));
+    g_free(msg);
+
+    r = pci_dma_read(pdev, res->offset, &res->data, res->count);
+
+    switch (r) {
+    case MEMTX_OK:
+        if (res->hdr.flags & VFIO_USER_NO_REPLY) {
+            g_free(res);
+            return;
+        }
+        vfio_user_send_reply(proxy, &res->hdr, size);
+        break;
+    case MEMTX_ERROR:
+        vfio_user_send_error(proxy, &res->hdr, EFAULT);
+        break;
+    case MEMTX_DECODE_ERROR:
+        vfio_user_send_error(proxy, &res->hdr, ENODEV);
+        break;
+    }
+}
+
+static void vfio_user_dma_write(VFIOPCIDevice *vdev, VFIOUserDMARW *msg)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    VFIOProxy *proxy = vdev->vbasedev.proxy;
+    MemTxResult r;
+
+    if (msg->hdr.size < sizeof(*msg)) {
+        vfio_user_send_error(proxy, &msg->hdr, EINVAL);
+        return;
+    }
+    /* make sure transfer count isn't larger than the message data */
+    if (msg->count > msg->hdr.size - sizeof(*msg)) {
+        vfio_user_send_error(proxy, &msg->hdr, E2BIG);
+        return;
+    }
+
+    r = pci_dma_write(pdev, msg->offset, &msg->data, msg->count);
+
+    switch (r) {
+    case MEMTX_OK:
+        if ((msg->hdr.flags & VFIO_USER_NO_REPLY) == 0) {
+            vfio_user_send_reply(proxy, &msg->hdr, sizeof(msg->hdr));
+        } else {
+            g_free(msg);
+        }
+        break;
+    case MEMTX_ERROR:
+        vfio_user_send_error(proxy, &msg->hdr, EFAULT);
+        break;
+    case MEMTX_DECODE_ERROR:
+        vfio_user_send_error(proxy, &msg->hdr, ENODEV);
+        break;
+    }
+
+    return;
+}
+
+/*
+ * Incoming request message callback.
+ *
+ * Runs off main loop, so BQL held.
+ */
 static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
 {
+    VFIOPCIDevice *vdev = opaque;
+    VFIOUserHdr *hdr = msg->hdr;
+
+    /* no incoming PCI requests pass FDs */
+    if (msg->fds != NULL) {
+        vfio_user_send_error(vdev->vbasedev.proxy, hdr, EINVAL);
+        vfio_user_putfds(msg);
+        return;
+    }
 
+    switch (hdr->command) {
+    case VFIO_USER_DMA_READ:
+        vfio_user_dma_read(vdev, (VFIOUserDMARW *)hdr);
+        break;
+    case VFIO_USER_DMA_WRITE:
+        vfio_user_dma_write(vdev, (VFIOUserDMARW *)hdr);
+        break;
+    default:
+        error_printf("vfio_user_process_req unknown cmd %d\n", hdr->command);
+        vfio_user_send_error(vdev->vbasedev.proxy, hdr, ENOSYS);
+    }
 }
 
+
 /*
  * Emulated devices don't use host hot reset
  */
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index cee08b6..2f3eac8 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -71,6 +71,11 @@ static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
  * Functions called by main, CPU, or iothread threads
  */
 
+uint64_t vfio_user_max_xfer(void)
+{
+    return max_xfer_size;
+}
+
 static void vfio_user_shutdown(VFIOProxy *proxy)
 {
     qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
@@ -282,7 +287,7 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         *msg->hdr = hdr;
         data = (char *)msg->hdr + sizeof(hdr);
     } else {
-        if (hdr.size > max_xfer_size) {
+        if (hdr.size > max_xfer_size + sizeof(VFIOUserDMARW)) {
             error_setg(&local_err, "vfio_user_recv request larger than max");
             goto err;
         }
@@ -436,18 +441,20 @@ static void vfio_user_request(void *opaque)
 {
     VFIOProxy *proxy = opaque;
     VFIOUserMsgQ new, free;
-    VFIOUserMsg *msg;
+    VFIOUserMsg *msg, *m1;
 
     /* reap all incoming */
+    QTAILQ_INIT(&new);
     WITH_QEMU_LOCK_GUARD(&proxy->lock) {
-        new = proxy->incoming;
-        QTAILQ_INIT(&proxy->incoming);
+        QTAILQ_FOREACH_SAFE(msg, &proxy->incoming, next, m1) {
+            QTAILQ_REMOVE(&proxy->pending, msg, next);
+            QTAILQ_INSERT_TAIL(&new, msg, next);
+        }
     }
-    QTAILQ_INIT(&free);
 
     /* process list */
-    while (!QTAILQ_EMPTY(&new)) {
-        msg = QTAILQ_FIRST(&new);
+    QTAILQ_INIT(&free);
+    QTAILQ_FOREACH_SAFE(msg, &new, next, m1) {
         QTAILQ_REMOVE(&new, msg, next);
         proxy->request(proxy->req_arg, msg);
         QTAILQ_INSERT_HEAD(&free, msg, next);
@@ -455,9 +462,7 @@ static void vfio_user_request(void *opaque)
 
     /* free list */
     WITH_QEMU_LOCK_GUARD(&proxy->lock) {
-        while (!QTAILQ_EMPTY(&free)) {
-            msg = QTAILQ_FIRST(&free);
-            QTAILQ_REMOVE(&free, msg, next);
+        QTAILQ_FOREACH_SAFE(msg, &free, next, m1) {
             vfio_user_recycle(proxy, msg);
         }
     }
@@ -693,6 +698,59 @@ static void vfio_user_wait_reqs(VFIOProxy *proxy)
     }
 }
 
+/*
+ * Reply to an incoming request.
+ */
+void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size)
+{
+
+    if (size < sizeof(VFIOUserHdr)) {
+        error_printf("vfio_user_send_reply - size too small\n");
+        g_free(hdr);
+        return;
+    }
+
+    /*
+     * convert header to associated reply
+     */
+    hdr->flags = VFIO_USER_REPLY;
+    hdr->size = size;
+
+    vfio_user_send_async(proxy, hdr, NULL);
+}
+
+/*
+ * Send an error reply to an incoming request.
+ */
+void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error)
+{
+
+    /*
+     * convert header to associated reply
+     */
+    hdr->flags = VFIO_USER_REPLY;
+    hdr->flags |= VFIO_USER_ERROR;
+    hdr->error_reply = error;
+    hdr->size = sizeof(*hdr);
+
+    vfio_user_send_async(proxy, hdr, NULL);
+}
+
+/*
+ * Close FDs erroneously received in an incoming request.
+ */
+void vfio_user_putfds(VFIOUserMsg *msg)
+{
+    VFIOUserFDs *fds = msg->fds;
+    int i;
+
+    for (i = 0; i < fds->recv_fds; i++) {
+        close(fds->fds[i]);
+    }
+    g_free(fds);
+    msg->fds = NULL;
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
-- 
1.8.3.1



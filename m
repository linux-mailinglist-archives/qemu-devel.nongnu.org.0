Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8751C68D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:51:43 +0200 (CEST)
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfde-0005fO-Rs
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0z-0006BA-Vy
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0u-0002Cx-Jf
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245GRcVq019339
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=RPAQ/mjEoZa9PMW/bcbliJUWhyDPBG0vUiZuMhPC2uk=;
 b=fB9ivsz3Q2p8w8WdPesdvglBFQtZNbsKfvUWaQVqwXspsq+Csr9ClBwf5RpSE6NH2dKo
 nnJ7JS0oNzZTkQqY3g8Qnryp7WyjadQbx70CYsqFaCiTXyfBR6OAyV0pFFvF0P6sL7Go
 yv8wmsbYysVN0KMJARzaYT+se5MhYAP4xvoHT1qSDIVW1CtJPUa9CQ/0wiBsM1+F1+vB
 8ad9ymxrcY20nFskY/leKs4S9r1BznIi22QoidzOX5pcabcHfleyerd0S09Fi/SdXgZ0
 kQWrGMJNb9dlrnQ4cM+ughjTrXB8qI9HALBICfItZ/C7NNbBRuX8ggXn8mZ5Rbt6/aLu Mg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntc3kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:28 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bxn018989
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2ed7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5DyzldwYWzCnymDplBFFpjOTgYs6mZLpR4XqMbTptwXGZ/MRYw+CUA0XBiGghw6DyqBP6J4PA1mf3Tjq3VAA54ux256nyvf7ZTw30cqsISQmeD5GWRKr5CfCq//9cGIDWPVsnAQVICwE+ok6b7RlVmChahGXbnvZKd72Ocj7tB62rxLI2RLAKQ4Sdfb9IbOH2W4Mvi5zXpzml9aarR9NCjMt+4x2oLzOx9JzY+vjDA0Gr8E4M9iSnI0h5FHFJ58FD9HShVZ0JFN3NJKe3/nzLIWfY7yUSESGbljsrb5l9IPe6KGa3wHD3x7aEx0Nn0aQgPHHa9xbPQsGL2g1txClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPAQ/mjEoZa9PMW/bcbliJUWhyDPBG0vUiZuMhPC2uk=;
 b=Hov07hyH8AUB+oJPPQ8DQzY55r5J8SCA8t8S/dzGKlqkwryhsGCrDVsD/4enbNoboRyRQdVMdPxHfURv/rqRbKTkK0y9Hriq3q6VXWcYSIa56dstO3DC1IadeoTjPbhsxlLIMripcVXm3gdhMNkm5siCzWkNwVCP9Puprpq3eXc8ddLGvrNr/DRlvFy3CMCAW785xJ/s7HJtPYkOv8MWNKTCNV6cAPUk72ivEVMAleSTgI58mcKq2D8iHF2aZ5kf2K96cpf77KNS6dk23kk3YHLCTpF/ENudfcUUKspSYyRSVXQ4g2RginFKgp5dPwJPMjAVaQynJrpVkwzxGs4PBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPAQ/mjEoZa9PMW/bcbliJUWhyDPBG0vUiZuMhPC2uk=;
 b=qxVBR9LPI2g2woUvg+evUKSPJFOrcW4OBG9vUtBHFBIhJGgsT2wN99/KxeDSQLEuK1OIuo+Y2SwiOIxepJFUobt5OcueRfaDhpi8DUyQU1/YpBFo3kI8BIxmLol8FtASoBLhKEuSXEHXY2vpECb15eHP5TnSjCCPC5194S3Yf+I=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:26 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:26 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 19/23] vfio-user: dma read/write operations
Date: Thu,  5 May 2022 10:20:02 -0700
Message-Id: <34ca04ac5e8c7dc8fe3f00fa254065a8d5025e27.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb2d2f96-0f5d-44dd-d35d-08da2eba472b
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2689514BE718493F96ACC2CCB6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qocaT400Ui4w+1CXOPM9MskD9U5XBQoxw4jDA0USGE8lquZ7c+cohADZi/aKx8zr775rTS8qbgZwT3P7XhLGN5t7mzGT4NHKT3riJpK110q48Df+1hjvoNQdCa1dQErW1UqMGigXSOj0c4I1uzBDxPYI3Ab8hZHM5eSiao/PP3nOal5BkHe18DXSS3k4Mi1GejP0Ze3w70nr/vY0E3YmsXuj7QrgpcAGu6yilKoTV4wC1v4APEes8LjQUiqe9Rk6LsrapEdJVPShbzrS/zer/WwwsTzw04LZF1zmGkMYHBKWFjFbTBzSZxc8IIpwstOy5MB39zaOUkuK0xbYFUNrMMTEMPvGAFn47Ry6NE1uDF27iQrRQlgl8PmcwoThkv0itpN2OcFaMSCAccXu31ynZ5JQ0HORLEvdvQhgPIdx2FP9M0JwFs8/4K8pRBQIprCEqBNJBg4IAonGs8gCefUryVY9CH2abkPXBd+1cgrszmFvZr5cfo4dNWT1F3pvsSO3KwJ2CJIt7lRcG4uv+7o1I51weARnwD5OW6Fz+ZuvpWcifDPqrlcmf9kfCpxhOR81xO48DID2a3Wf8snnREEPg8KpcGNgrkKYqDHp6nqQlWYBl3+hp1UTchenFEax0OmQuSWPIPhNMDaemyfM0esVJHvyFmaRcvODHP1f5XYV7dKqOO3n7IS6oh26wv8tOsEj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RJ8bxFNYqSRc0i9w0F5hiCBqvmUP63FajClNk2EJtqqhpY2PkD787efKBcZ?=
 =?us-ascii?Q?ZCkFcqdnByYA32nzuntY0U54sLGrYo7bgl0TAtzts7q4lhgGSR1MVn9xBv7o?=
 =?us-ascii?Q?OrywJrmeaZusG20TTX1o5G2YYBJV9tN9fs76G1yOK2pzpZUb+VtNUWHR9Rx4?=
 =?us-ascii?Q?iMGldg/omBVVWvj0/LgrTvBjVCZYP/fOJ9NZcANbKtOU2IjZ5qjXTDgvYWpf?=
 =?us-ascii?Q?gQ3XUAQPSCiH8+nBSG9RTJUwghBcOWvFeFAAoj4Skz4W7E7EeRRLJX6juluL?=
 =?us-ascii?Q?+TT4ypD8EEZ9mQObpkOF1v6s+JOTkQqo98pmjvOnUFWfqBh5U1TbvI/WMzfl?=
 =?us-ascii?Q?BkEu/+Zv3cwrya8tgryVuaDTEbq++EUvy20y6/FeXbZqRIehPPGv4bH6wM94?=
 =?us-ascii?Q?eMA1AaC0QfdC+gaYNL9VqV12rVqUW+geJuf4vxTkDOUz7MvZefV9dKwkBHCg?=
 =?us-ascii?Q?mvkYFU3LVtxwzGZwf8CL1rW/8wPoMPm+CKufIr3GxbzpixfAxmpA0y6gm10h?=
 =?us-ascii?Q?8D9KBvJ185BANg170lYaGJaSrfcr39CCa2cckBgsoGLrs5C2xeK48LlVmV1v?=
 =?us-ascii?Q?kW8PtUG2bos2ea44G6LuYOvLZZAomjbPyBccjWhric8TLr4DoxEfT76nsODv?=
 =?us-ascii?Q?PUO06h9nOy42c2Q4ARNmVskRtSrw5M61+30PpgIEvLxaUme/lLSAMrP0Q90U?=
 =?us-ascii?Q?BZlxPE67klo+lqCmH177pS0rDi+sU28i6MB0SmOM0QyUxeMHMfgItWUxf1aM?=
 =?us-ascii?Q?bAhhqYtLc5hGU8N5OF4EGBAkYjSqOAoHuxnfNMFAcaEEBMNj7HXY+Ki59QFu?=
 =?us-ascii?Q?2pIUUbKgJRBxC/MosMbGZv9/jOLg2qHaUgVIO8f/aEKi7NW5ccyVi42j0o6C?=
 =?us-ascii?Q?vvmtlQfFpiRxfKA2QMieXKPjARGDaWpyWcUXvwdWN5XPd+/xjFLKhieKoumo?=
 =?us-ascii?Q?WCS0iDgmGkX+pLyagBLYEZxTFjLlRuhU3j2w3iqRBhP2W1ZUVOnX5EzeWStA?=
 =?us-ascii?Q?JXfodg1f8oXwaUiuXmCxuaN/nXYLQm0IRk5KdfsP6fs1q6jdNeHpIPP9x/6k?=
 =?us-ascii?Q?wWUDRssIJwuR2JSn/5nxoif5Isha73xDNTlUg2krl3+DnY9oEOHQLCyG5d2t?=
 =?us-ascii?Q?/j5fCA4+O7uR8b3JXwUH4wYFEb1YoiBTKrobopRfnSqtLIoF6IkOlbtKFiT1?=
 =?us-ascii?Q?8//6tTvAL7pgi82okiNgaUedhgZg8dVBvJahIKFGMIO+yIatp+2PGFFEt0wM?=
 =?us-ascii?Q?pYGzYr2uGfZ6uYiGKRx8CQXiAd0hhSq8XlrjzO9qeGRBGJvHiOG+tr7DvZbq?=
 =?us-ascii?Q?6e1cu30IYw0EDsmS2K3AenuxCNENOmAid+qYVKxwXkjPJalRESzVJSdZIjhM?=
 =?us-ascii?Q?sv3dLYHspEOvUagNuIPWNS9rQejVr3vLRJBS22pMundrRUf2hJIE9/ZVXS0e?=
 =?us-ascii?Q?lJo+QmtvN1V4GTUXc4eOdRoKFMxm6VTr02i/ubgp9kyNpUhuU/cUzMAuszWR?=
 =?us-ascii?Q?vf2cud58x9NAQTKlgjgr+ExJDP1xOW24m6tsqdcUpfCkS+nv1hJQXTILgxzb?=
 =?us-ascii?Q?Klj2UyRzRPd0ML4zm8y755i7FgFysv71EEbSh/XGlK08dAChV5KohQIW4YQj?=
 =?us-ascii?Q?wo30macz7sdDM45Sz80z3ywncVtMB76RWd2qtyXddZ+wsqIxK6Z98oz0WuAp?=
 =?us-ascii?Q?OkTxmIetK0tcKMsWT+AlKVYH7lCLm72oaNA0iVYU4D68P0ghK7Z+XfJ047dO?=
 =?us-ascii?Q?uwPGY1nq4QC+Fq0CS5sS5I/pj83e9io=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2d2f96-0f5d-44dd-d35d-08da2eba472b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:22.0601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7Pj+DohPJrPTHS8Ipq5UBaAPA7+h4g/PwL8GJA8SjKa6HqOvM428ChNtMoKkDUka18qEmCm7kwsfobUMfJjg1QVNJTbmAOa7JpASQguwWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: KZpsBg1iIaW6QCbezd78gsRuNGUwXPBo
X-Proofpoint-GUID: KZpsBg1iIaW6QCbezd78gsRuNGUwXPBo
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Messages from server to client that peform device DMA.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  11 ++++++
 hw/vfio/user.h          |   4 ++
 hw/vfio/pci.c           | 100 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.c          |  60 ++++++++++++++++++++++++++++-
 4 files changed, 174 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index ad63f21..8932311 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -182,6 +182,17 @@ typedef struct {
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
index ec764d3..412c77a 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -82,9 +82,13 @@ typedef struct VFIOProxy {
 
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
index 2faf890..25b3ebb 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3528,6 +3528,85 @@ static void vfio_user_msix_teardown(VFIOPCIDevice *vdev)
     vdev->msix->msix_regions = NULL;
 }
 
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
 /*
  * Incoming request message callback.
  *
@@ -3535,9 +3614,30 @@ static void vfio_user_msix_teardown(VFIOPCIDevice *vdev)
  */
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
index b08108c..1a0d002 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -77,6 +77,11 @@ static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
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
@@ -377,7 +382,7 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         *msg->hdr = hdr;
         data = (char *)msg->hdr + sizeof(hdr);
     } else {
-        if (hdr.size > max_xfer_size) {
+        if (hdr.size > max_xfer_size + sizeof(VFIOUserDMARW)) {
             error_setg(&local_err, "vfio_user_recv request larger than max");
             goto err;
         }
@@ -780,6 +785,59 @@ static void vfio_user_wait_reqs(VFIOProxy *proxy)
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



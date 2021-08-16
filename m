Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2AC3EDBBF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:53:01 +0200 (CEST)
Received: from localhost ([::1]:47284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfrA-0008SI-JY
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhe-0000oX-HM
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhY-0007vK-PS
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaE6R000648; Mon, 16 Aug 2021 16:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=KcjsSD+Wq2I/FtUzkAJgb2ONemFI/sZTtoqwRT3vav4=;
 b=dPGpK6XIokMzcf0R9LwRAKU13q+OIMxwgtmdxWmWunZcVbKgyf2FuSvvSJU/H8/g0QHj
 esXX2mrBsESo5gN9JpJQ9zMAoKfen7ka4zsR5bZT8efd9kOsVWyAQYXT4jPBFoD+Se2U
 HQCkk1SAQp8aA0w8P7eF1RuUmvLkiVhM3Pnb23RxE3Zlf0gYLIM7grOEt00CEcxh9KsI
 Tro/Ms4GayIgBYfXe6rS4glbAIMCd69Pb0OQxBBEPVsr6yIv/TJEYSEXt6IAidlsUag4
 twv+Qv7nWmCFm6ymVauaUR2k2dcg7mgbdaXYwKG47o4CjwY0YxTX6Ual+DQdw9bKtBw8 YQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=KcjsSD+Wq2I/FtUzkAJgb2ONemFI/sZTtoqwRT3vav4=;
 b=nsZaWmXHTLpzRIwBQxqofngbdtBEZGLpnq6O8erG2q8WS/qE3gZoDjaorl0+w5k9vUgm
 Kx/cvwCTeXih/pSuScKTBvougMGTrlo3b/6IB5qsOJ72Ns3s23ZdZIboc88rQ1nIDgdk
 KDvaZ7dHzJxJStS+sEhAx+47bjQqZRY4p4VSun1NyYX33zBrwSaEJ1KkP/OIZqkD8Ny6
 koc+fltVD4/HiQtcSLDIvvktyN71hXJUQDduNVrqmRTLkgCvdc8gT9FRXQR/hab7nb1z
 tQVRTTCaTH08Ejwye7GcuU4d0sxqUCk2GEa2HeDIrnXLplz5TYhtr2CMNRBdjE1EHxfh Fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af1q9anur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeuOL025726;
 Mon, 16 Aug 2021 16:42:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3030.oracle.com with ESMTP id 3ae2xxgrw2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9r9krC7R9rJV/fzdW7KWs89mH0Te+T/GEoP3DL2VYEQnsBDqhNhnPHl8k4YQXdURRM2CjmYs0ie8QIb7oABKG85DQhiVOd278/bXOt7vBRzGG5y+0jLRXI07gA7nmp0t+n09hdH9RvZ2oE6ngNtngGLdNyX7BZhDwkGKfXmDcceylkd2pCTgwNzZ8FRn3caoV3aPKP/lyzAtqW33rsxS7D/UqVxRjvCIxHcSwQKCe9Gm38LAJN/FdNHnr7SKFcHCFJp/ysFvbbaUq/ysupv8c7kkxWs+BzQH/L/2WQp5LUiezLpqCctdTFTuxlV7RQ3ld2QPCaWi+WvjWdJB06dGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcjsSD+Wq2I/FtUzkAJgb2ONemFI/sZTtoqwRT3vav4=;
 b=g5qHaViMWXmVjm8vzu9nEYhtDtiTDgqNcKTvVnsmoKYzGu/j6angUTE/L7uKU9Uh1KCEKphHvXhs0eTG4YYNszErbuLOZSzPbHVORg2c1xztu9dvmDBDhSEghwFlSmeuMBNRqgkX3OiG77p5vkL+5vIltgR1nOO3gTtgYhXu6wCAp9HCbs87pPsA4E9yd8H6Ipb522ff11A2nYZqpeAj/HlAIxBb2++OfmuPk3uKHT56J8bvrmhYLXDb20KZDmaWwG63lWLq1z6kH3xKZBz/sFwSb5Rix0DB/q0H8Kat43IfaIY7JoMvO8NN1lswzn3jfJjdscuQFMUW957xDWWU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcjsSD+Wq2I/FtUzkAJgb2ONemFI/sZTtoqwRT3vav4=;
 b=Oc5/HdCVzsA15t/jtN52XapI4IDSZRkWl3la7TbMiVq/rU1HNNbuC3wGxmbT1lFTIE6YX+GMx5QdhziyTo0pTv7J5Ix4VBvGtDW3tsSVQo8a0iqWh5lG8RmQSiPdLkTI8o1VQuBdnmAx7lzv7PI2fl+PIdG38yvNYlRelPeV42g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BYAPR10MB2565.namprd10.prod.outlook.com (2603:10b6:a02:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 16:42:56 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:56 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 02/16] vfio-user: add VFIO base abstract class
Date: Mon, 16 Aug 2021 09:42:35 -0700
Message-Id: <3610c39c2e12132e01a23752d161e7209be12f38.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:42:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55adc678-9e03-4070-29e9-08d960d4e63b
X-MS-TrafficTypeDiagnostic: BYAPR10MB2565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2565E9D6566607C590FC87CE8CFD9@BYAPR10MB2565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlpfkIvGMDuobs4JPzmk0BI0gflBMBXcMl+8qGDzXMr1ybiw/yYCcLlVCnmSdg6SWUdZWubD0Qcnl2ct4qX6wU5PpzMjZ8RK3xSom+zXkd3RT9bVRqyAIogYtpodS15wLgkxmp6DsGpAv8Ox8SF1ahuMEh2T7qvnvtMFdpOEUxQV3/7bbykOGzmeKZWf5PT0K0vJ9CYPYPBkF9dOgVCevj1RZReHTBy8Fn3CUmcSkUyr/bcBnh8L2uQMreuUEA822A4BVlHhDygu4/rN6d/ESKfBgZVYlSjmJAAjRug77zr2GuKJnx+78V01IfM+ivBQUF7wKa8KwH2Dt6cwuvpmWs2GW7vFQf7wfE/o6uWZUUs62AeWNNVG5mmgWRZUKHCWk3XIzjhyuE1tmqeYQ/jB5lRSA68NdniUMUr7ALd+N6hF1/FLPZJCh8aBo23SgrynVvpO2KAEwrsYHq4Sgm9uj58JOpzeSEF/lj6Ze5NN5uG04vc/+ETpLDk7JyVLfiGPasacUYgi0xmApvUxfZ5HTbjOHEKqIuNvGTnL9IM32PLBoif+yqSzjwYwk0LQXA/xoWwE6nguEULw4n6gzmYX/XdsmH423c3ZWaYkXa4MOJWJZv05zKNzFHgSPfQIE7UmZToueNtJvJoWvVablhGuUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(316002)(38100700002)(44832011)(2616005)(6512007)(2906002)(6916009)(52116002)(5660300002)(508600001)(6506007)(66946007)(4326008)(66476007)(66556008)(6666004)(186003)(86362001)(8676002)(8936002)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xNhU9V3yqzyrpVb1nWSqZ6jDxw5WuQWkdLIOZN85g0PfdMB1CBprqKo3WaT2?=
 =?us-ascii?Q?8MDZGOS6kDSOLaq94H6Zry5VMyT0suVgnJgbONZo5e3NYz54aHwnLyjiQ0zT?=
 =?us-ascii?Q?2+VVTySbZhiJsNAZFXF1r2ufpGLpejhNY/mWSY0NfpRTFoN/+pLq8GFr4m5o?=
 =?us-ascii?Q?jFpOfI1W7SdGRX1RYKeV6oZ48/9H2bKn8oC+ajJaD98AdwDi2PTqaR2DWHMt?=
 =?us-ascii?Q?ilW6gwVyswd9rPWojYPoX1DwPudduO2k1ZFL/KKaqvLEAHZWZfvkxDt/zkpB?=
 =?us-ascii?Q?wTJ/LPKk3R1NyfYvVkUYCUUYgYwplBV1ANtOs6wE0nqTT3Z6GVuQlTFhyue7?=
 =?us-ascii?Q?uZdxMFomoGCJ2bhpQy3bJcUVG7lLAfCF5EmLg+aBV3d42/uwr2yJ31b4Exmq?=
 =?us-ascii?Q?3qktM7JVFUJ+Dw2P7NTEWoxGD6fz/8akSYbRkUxTbTNq02XP0l4CZd+lspQr?=
 =?us-ascii?Q?HxLtjZZpgPH1erus6hKZN0b5TnStZbNdoNHnFi7hA6OqHY1OWgxDxPfn225s?=
 =?us-ascii?Q?CGj/mv3eXIWFvfJgNEnkKwSd1XoP2a1Kf/vS788wQyf1vdn56VL+QfeCnsOg?=
 =?us-ascii?Q?FyjLilXCjxZMx9OBiyAszwY1r+ww44DJfQ9DVYmR0wMhLJgwjuqNjdis9TTB?=
 =?us-ascii?Q?A99ceSyxHeSRYyDZ04utkOO0yih7QessphwmE2ixohCW59ZBv5u6VrXDVTA/?=
 =?us-ascii?Q?inn/Idc/GiqYY8zM6tZ216QQh04uPJVmLSb2xr4NTgdeBF1gEGgf2ZBS2Et7?=
 =?us-ascii?Q?20sySWv1kkF2WOT0eWt/GroQ/eHWVXdTy6OtSwyBH+nTR7xiPSdtWQ7298XV?=
 =?us-ascii?Q?sHOUlQ+78AT9rb2EcVMlS8k66L8HBSSzPTB06/YNmUuak0xeComHs/fLC641?=
 =?us-ascii?Q?T0F9vv7feKEZzqFmmJCqbQ9PVWto9F5hv+yxO/eCBh8DCgzuB4uH70vC/aOr?=
 =?us-ascii?Q?z7X9OZy8LQ70WhDIr9zXkibsBUCzr2jvd2aPqaU9e5laM61/Io8400WUXcuP?=
 =?us-ascii?Q?Cnx0CAvMHVw2tO1ovEAKi3Bc7YPF54D6Q2ey4z2AgKHhXnRt6x5LRXcRpLBi?=
 =?us-ascii?Q?Qi5o+geXlSatEOSezT/tfDLylZX7XE2HVvJWY4USSBB9ne/VCsof0wxlZfAz?=
 =?us-ascii?Q?9KJLadnJ/8yI1hiQdt9oWm3U5vTh5td6N9WNQ9sAyhjv4H1XDzubT4rLg4sN?=
 =?us-ascii?Q?VgUENND24oQOVzJbZOml3BdGT62HeDzPDE1SJGzNmox7RJgwAw9bM3AuuJFy?=
 =?us-ascii?Q?8bmX+CHfGGN72Lif+0VurwAWUgS/P0rLa4Pg29s7/rr2uJkhkY3rEbNP6O77?=
 =?us-ascii?Q?CgPqII34mcxrpT2ffUUMcZyLDIsm8dtoIuwQ1WWYvv+eyKQxVfnn7CaXTatL?=
 =?us-ascii?Q?nhqTmmwi3E8YBlRYckHLiIbI7xZr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55adc678-9e03-4070-29e9-08d960d4e63b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:56.2965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijze4Or8Mxo1wwhhnLr4rrCUWqSce8kFcahQ4dJ5Xm/rCjwx1+dbGFC5gr9d75KQVVpfQ1fBKv7DTXmRkT8w5r4nqC66GZi592CCg2QGsPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: DKMMYzoQrwgKi5jFKEfBfJv1BKRz83l3
X-Proofpoint-ORIG-GUID: DKMMYzoQrwgKi5jFKEfBfJv1BKRz83l3
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Add an abstract base class both the kernel driver
and user socket implementations can use to share code.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h | 16 +++++++++++--
 hw/vfio/pci.c | 63 ++++++++++++++++++++++++++++++++-------------------
 2 files changed, 54 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 64777516d1..bbc78aaeb3 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -114,8 +114,13 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
-#define TYPE_VFIO_PCI "vfio-pci"
-OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
+/*
+ * TYPE_VFIO_PCI_BASE is an abstract type used to share code
+ * between VFIO implementations that use a kernel driver
+ * with those that use user sockets.
+ */
+#define TYPE_VFIO_PCI_BASE "vfio-pci-base"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_BASE)
 
 struct VFIOPCIDevice {
     PCIDevice pdev;
@@ -175,6 +180,13 @@ struct VFIOPCIDevice {
     Notifier irqchip_change_notifier;
 };
 
+#define TYPE_VFIO_PCI "vfio-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOKernPCIDevice, VFIO_PCI)
+
+struct VFIOKernPCIDevice {
+    VFIOPCIDevice device;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23..bea95efc33 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -231,7 +231,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
 
 static void vfio_intx_routing_notifier(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     PCIINTxRoute route;
 
     if (vdev->interrupt != VFIO_INT_INTx) {
@@ -457,7 +457,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
     int ret;
 
@@ -542,7 +542,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
 
 static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector = &vdev->msi_vectors[nr];
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
@@ -1063,7 +1063,7 @@ static const MemoryRegionOps vfio_vga_ops = {
  */
 static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIORegion *region = &vdev->bars[bar].region;
     MemoryRegion *mmap_mr, *region_mr, *base_mr;
     PCIIORegion *r;
@@ -1109,7 +1109,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
  */
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1142,7 +1142,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
@@ -2782,7 +2782,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
 
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
@@ -3105,7 +3105,7 @@ error:
 
 static void vfio_instance_finalize(Object *obj)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_display_finalize(vdev);
@@ -3125,7 +3125,7 @@ static void vfio_instance_finalize(Object *obj)
 
 static void vfio_exitfn(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
@@ -3144,7 +3144,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
 static void vfio_pci_reset(DeviceState *dev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
 
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
@@ -3184,7 +3184,7 @@ post_reset:
 static void vfio_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
 
     device_add_bootindex_property(obj, &vdev->bootindex,
                                   "bootindex", NULL,
@@ -3253,28 +3253,24 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
-    dc->reset = vfio_pci_reset;
-    device_class_set_props(dc, vfio_pci_dev_properties);
-    dc->desc = "VFIO-based PCI device assignment";
+    dc->desc = "VFIO PCI base device";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    pdc->realize = vfio_realize;
     pdc->exit = vfio_exitfn;
     pdc->config_read = vfio_pci_read_config;
     pdc->config_write = vfio_pci_write_config;
 }
 
-static const TypeInfo vfio_pci_dev_info = {
-    .name = TYPE_VFIO_PCI,
+static const TypeInfo vfio_pci_base_dev_info = {
+    .name = TYPE_VFIO_PCI_BASE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VFIOPCIDevice),
-    .class_init = vfio_pci_dev_class_init,
-    .instance_init = vfio_instance_init,
-    .instance_finalize = vfio_instance_finalize,
+    .instance_size = 0,
+    .abstract = true,
+    .class_init = vfio_pci_base_dev_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -3282,6 +3278,26 @@ static const TypeInfo vfio_pci_dev_info = {
     },
 };
 
+static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    dc->reset = vfio_pci_reset;
+    device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->desc = "VFIO-based PCI device assignment";
+    pdc->realize = vfio_realize;
+}
+
+static const TypeInfo vfio_pci_dev_info = {
+    .name = TYPE_VFIO_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOKernPCIDevice),
+    .class_init = vfio_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_instance_finalize,
+};
+
 static Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
     DEFINE_PROP_END_OF_LIST(),
@@ -3298,12 +3314,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
     .name = TYPE_VFIO_PCI_NOHOTPLUG,
     .parent = TYPE_VFIO_PCI,
-    .instance_size = sizeof(VFIOPCIDevice),
+    .instance_size = sizeof(VFIOKernPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
 
 static void register_vfio_pci_dev_type(void)
 {
+    type_register_static(&vfio_pci_base_dev_info);
     type_register_static(&vfio_pci_dev_info);
     type_register_static(&vfio_pci_nohotplug_dev_info);
 }
-- 
2.25.1



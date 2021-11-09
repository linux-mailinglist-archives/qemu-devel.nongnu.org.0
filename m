Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96467449FF7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:50:29 +0100 (CET)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFLI-000694-Nx
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:50:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-0005er-HX
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046F-0O
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:25 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A902vrD019145
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=v+jIFvek62PK3XboQP/gFOnb3lTpeJWxb58UHEDdtbY=;
 b=DnnPUBkgNtwWVJMrxdpRoylRd6AwIptBjk9mq0OeBK1F5su1rO48uJ1t5Ibe88KgVcRX
 aITB3cnrSF8vmyseV7ASgO0cUp+8L7nWRGFoaGTX5KExRnnIYOmBEjJ1/IG22PiZMkWh
 uNgrV2cnjQdHRmiWvMOARAnsOrDBY6ccZO/27FafO4oy3qedKLGogqG6GZKgVeWrdPZb
 jNolqh8BGwa9s4W7cG+fSKCGLIy/a0W1c62T+r4EIwyFX0US1HdsHWAgje4G7ZW7Xjo1
 4BFMFS6pV9XyKjW55shC01//Vh7GrOOb89lg35aCE31KcIcl6SaIQAy1fchYpcejxSoT aw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk7c83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLMx129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iww+2uOaoeq9b2/GXNBTyt/GeAeYftnW8Yj8RCw9P1nPwdtas+pOnL+bDHKmP6sIg4n7nNhj8fCYzsX2r0VY9pk7TdIcPjuo4eJrqQ1YVkm7Mr2IDpKIl7C3q9hnHk596HYa3kKRfy3ZLCFqE0exgx1rlzHgpwuG4CHcRWJcPKCeDg1RIlm5dOKBX0ap2/qPOGy16WCLQkkr+m7t8/6gBvoN1dWRRDCjMm+kyeBP3fBj7lwPy6NbmpJY307FOsN0fLdyVEP9U5jgxX37eVvG7no/1j0ppE4g1uCjJFTKJyJzoygR7W8ieRA2IvnESvrC6SVRivQcdjCoHtAbEbmKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+jIFvek62PK3XboQP/gFOnb3lTpeJWxb58UHEDdtbY=;
 b=jPJW+LeY4BK7zxMLwzlxVzHI2MJeeI0JSDc7lG54QrGRGnhNR0SKGP+uPlM1b6O5g4dx7KkY8Z7QcV7LqaJ1cmBW3ulzvDmewMoKkjr9CGYkdeP5IEDdvdjHG2j4E+CC6oNi0bqslbS+/w/nhXqp0Cfpg/51qCKUxwDKvogamBMKY+4TVyWKcHcPyTIVvn7nDFU3GwvNJGnM9ZalGFz/sEY0sWlYMa9TzULyx7sslAwHDn43qJWbg4fXA9e7hW0CRz1X6YFBSwt+b+Aq6FkpZwVlJbWw3gH4Uyz8L+5RtkE1asgDGK112iRyYQrX49zWr86INn/LuULmNI9LztChog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+jIFvek62PK3XboQP/gFOnb3lTpeJWxb58UHEDdtbY=;
 b=xK2kBxZR43qVw/UZtFz7IJm2KvEJvOqRUNnv8SWNILeR6jWkunizaJL5I12f1zE/Yg9k00uQvTKGfhMEYh4Nukp53MpiSSwnOhY/eZxX6hYo8gBm4+Ko/Fwqys1MIi/r3YiHCoxFaheM88tMo9iQSfIXzPsyq9ZipFYz7wy9qd8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:10 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:10 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 02/19] vfio-user: add VFIO base abstract class
Date: Mon,  8 Nov 2021 16:46:30 -0800
Message-Id: <c3c41abc74603d5d2cb56a20bb0a056b8c338b88.1636057885.git.john.g.johnson@oracle.com>
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
 Transport; Tue, 9 Nov 2021 00:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f60b171-3581-48a7-3ee0-08d9a31958b5
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40681C6378EE67DC06A0A853B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: moS7icyXODn7Ef3B93OspX0V7Z/nDiFbRc0dCJwBIdjTtOcG8NhlmshH7kmscN0lXo5iIiwTL4m9k9VbCU3mprVDBvhDbl2qeKd4MBUYmoA+umT09aWnhILOPq1VD2cuRUDYafDIcHHROmz7ZiVrINfwCWdC7V90r/C+YGdJwWRSUu3qFFvEWkx3Lu7E9KHicpGahqGIFmzg4BNvkZDttXxfdw6u3QdNiwPKkIC1AE3kBEePbhAV2ogpNXp0i7Oba8YMW/8cIxu3BjbT4RDvcnpAaDK5LUZKN5DL1mlrzoLvbZSyaFg3WFxc/xyfqtN2QCBOwKgoC9UtQMQye//zF+9YeiS5qbIIErg+yJK2iClSgrD3JEvipkROHqxmt3IiSvN9oFj+LusmDDSkomxwZ994Gr6BCF0D7knygKRYOx4T1xY8bo1RmtRgoachULY/BekNIOtZvA15dKT/SLuED6EN6fZsMDrfIQD6QtvfP1BxKIy8eIOtXzGEeom6EH4l3b2l+W8TSzHYpR/xEA8dIjynCxr5aGNdm5hqvyl1836DJtiISCpWb1Kouql/75FfNjV/5fvoLRv0gVZoAH05GSY9pnI8fkX05usMwTDFY0tBd1jPW9RCePC1wzxB3vwyhnf6M1SmDcGobYa7aZwx4zCxEJMmlW4OJQ4xPLsQ7wVcmg/pIgCobLeUJO7OD2azP50MnAl2H7n0asWmn82xAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(30864003)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?REvpdRIjW01BskEQs/fP0eBtxQH+fDAZ5CSbu1ltUTW9M4YBTw6TS/iTMk1b?=
 =?us-ascii?Q?LvZ7K2q1RfZZLrY2wQpUVPZ4RdmPneyGfOPtvTzYCkBGMOU/9vFcZuAVl8MP?=
 =?us-ascii?Q?w7KTMJyBhgDjj2xXxQ/i0cEIEUXhVzy3g8Avfoowl0BFgUPt7bn6OoWr8A1d?=
 =?us-ascii?Q?wLeIKnfoIPbin1mk3f3Bxd2B8o0F3E/3EaaTBfmo9Yc6lKeVeoDnSWilL5fo?=
 =?us-ascii?Q?UHYEQ2dWBhTG91iSS13+a7RKZ7NTbRNGon0zZD01r+FWe6oHLfWgzUme/IeI?=
 =?us-ascii?Q?DQQfFWBqsCkhHyFT6Z8BrxdK+eIKELpCtjlR2VJQ5wvv9bIepwtSyUAp3HgM?=
 =?us-ascii?Q?FIJU3LSSaZu89y9pz4qSxar33MfU9vx/BZqY8U/8RFbATqoNgq+DpWcqKceU?=
 =?us-ascii?Q?UuPDR9Dcg6UjpA9lWF4LRN271JKtEJBw7mISnrGE4eaH8E+s3s3AYTRkeQfx?=
 =?us-ascii?Q?QvQwnVMXbfJmceg4yItHvgeyQtUlygDxQ7YvRmqHw1nJL5n/KnioeFdRt16A?=
 =?us-ascii?Q?wwHWDo0FG2VPy3SI036RZDfcw15VThNBdrK9DiA/uMzx4Jm4VmuskQiuz5Ea?=
 =?us-ascii?Q?wwv7SwTDf+c37Ezet1n0PDzB2kKcLm4U4VYoG47+Tj9RkzGI+lsMfJJ/5Abz?=
 =?us-ascii?Q?hE3AejcnXSaGzrdvc5U028vp6dvOyK69cEoQ75PTEk699I78pPxgRKvc7rZT?=
 =?us-ascii?Q?vZrrNz/0YK2UpnRby9+iE17rtRD1UiIXJwpddLhbxGOFiCzG7UAJIQms51Ty?=
 =?us-ascii?Q?FP2hidVRx6OaMytOOYyABanXtQBHnLjXK+w2uDv7W3dgoyEq9UfvJVCz8/xP?=
 =?us-ascii?Q?AULh+9m9Fk8iAAp90k3vjyi/ewyuOxWdk+IQEP/XAxdJ8h4r+QfQe0epS22R?=
 =?us-ascii?Q?wAbySUQ2/4AOfn8846B4qll4UCA8uIaixppuO7rB8uefkDPRxX3Ji2FKYhGo?=
 =?us-ascii?Q?PqY76l7TeJXd76+ipVU1s3ROYSvuwPgrDvpxhq1BmpVc0Gw5sg7xa36s5xap?=
 =?us-ascii?Q?/EguVdbm8jSc6Gt3LSHrixkJtImoZmqUVZ8o2SSEPBQuoiaw1w96JGKyzFOQ?=
 =?us-ascii?Q?SeEiYKowOS/yUX1bp1tBhyFrhNGJaJ6hH/vEl/3g47BdjS4q4vCCI38G75rS?=
 =?us-ascii?Q?o7pzXZ1zfg4zzBMVXrE5xB14zNl+R1saQ+3PEJihuu4LbErp7G4ntMBkC2x9?=
 =?us-ascii?Q?K1gnOcIsEMLtqGUMhw5iZzLbYjoiCRi7CAhJeA9XXsFryt1FJisA1TwpQ1PZ?=
 =?us-ascii?Q?C+8QVwYc5z4eYyQ2RZJdttvMQRM10SVkxNAYliZ2uyLmB0H3zf/IXOP0ZTbu?=
 =?us-ascii?Q?AXdevof8sQWuV0EYSI0H0XxPgY/lAZH3DPyjBQSxmQJ0cV60tOJ7ItpODOH0?=
 =?us-ascii?Q?QFRQngdZdH8XkfIEm6lLWzFh02JgVNyxKHx+dX1T1NPvqXLFN6ngtfRDuJZZ?=
 =?us-ascii?Q?TtdjVfO4z7f9xqWs8OwdmWB254bMHmU7rZcIDYpyhtt5MYV/Ow3mYgQybKUZ?=
 =?us-ascii?Q?gcLN+9t1OFk+IeMJ9OEY+iEcPK9OlHXKsc/KH58LvIzYdG/r4lsWJGlmpu9K?=
 =?us-ascii?Q?L5l12dcJfBzT+IwcyLOf02wcOUlTcXqeySLY7TDtUyj5TOzNMEhvgKl1lWQX?=
 =?us-ascii?Q?IFxG4u15g0AzHkS3N6bWxcYMHb+/sNIUZqNjhQtXmBR+TCjFeQssV+eBOgL8?=
 =?us-ascii?Q?HjTyoQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f60b171-3581-48a7-3ee0-08d9a31958b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:10.8454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJzChfqWGgYp0sJGQMTTDghXLFx/9UCrD5L8krZxlYMnjV0ndhWIDDp3hFgUNjFoOWcHXSsV3tsEzG7iit7GwUpZNT2fnWyqk22QSz6dUmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: VgUbZnPM8ewt2VcShjbTGH_2BKJ0zcb4
X-Proofpoint-ORIG-GUID: VgUbZnPM8ewt2VcShjbTGH_2BKJ0zcb4
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add an abstract base class both the kernel driver
and user socket implementations can use to share code.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h |  16 +++++++--
 hw/vfio/pci.c | 112 +++++++++++++++++++++++++++++++++++-----------------------
 2 files changed, 81 insertions(+), 47 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 6477751..bbc78aa 100644
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
index e1ea1d8..122edf8 100644
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
@@ -3201,38 +3201,75 @@ static void vfio_instance_init(Object *obj)
     pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
-static Property vfio_pci_dev_properties[] = {
-    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
-    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+static Property vfio_pci_base_dev_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
                             vbasedev.pre_copy_dirty_page_tracking,
                             ON_OFF_AUTO_ON),
+    DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
+                       intx.mmap_timeout, 1100),
+    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
+                     vbasedev.enable_migration, false),
+    DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
+    DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
+    DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
+    DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
+    DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
+                     false),
+    DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
+                     false),
+    DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
+                                OFF_AUTOPCIBAR_OFF),
+    /*
+     * TODO - support passed fds... is this necessary?
+     * DEFINE_PROP_STRING("vfiofd", VFIOPCIDevice, vfiofd_name),
+     * DEFINE_PROP_STRING("vfiogroupfd, VFIOPCIDevice, vfiogroupfd_name),
+     */
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_pci_base_dev_properties);
+    dc->desc = "VFIO PCI base device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    pdc->exit = vfio_exitfn;
+    pdc->config_read = vfio_pci_read_config;
+    pdc->config_write = vfio_pci_write_config;
+}
+
+static const TypeInfo vfio_pci_base_dev_info = {
+    .name = TYPE_VFIO_PCI_BASE,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = 0,
+    .abstract = true,
+    .class_init = vfio_pci_base_dev_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    },
+};
+
+static Property vfio_pci_dev_properties[] = {
+    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
+    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
     DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
                             display, ON_OFF_AUTO_OFF),
     DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
     DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
-    DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
-                       intx.mmap_timeout, 1100),
     DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
                     VFIO_FEATURE_ENABLE_VGA_BIT, false),
     DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
                     VFIO_FEATURE_ENABLE_REQ_BIT, true),
     DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
                     VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
-    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
-                     vbasedev.enable_migration, false),
-    DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
     DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
                      vbasedev.ram_block_discard_allowed, false),
-    DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
-    DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
-    DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
     DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
                      no_geforce_quirks, false),
-    DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
-                     false),
-    DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
-                     false),
     DEFINE_PROP_UINT32("x-pci-vendor-id", VFIOPCIDevice, vendor_id, PCI_ANY_ID),
     DEFINE_PROP_UINT32("x-pci-device-id", VFIOPCIDevice, device_id, PCI_ANY_ID),
     DEFINE_PROP_UINT32("x-pci-sub-vendor-id", VFIOPCIDevice,
@@ -3243,13 +3280,6 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
                                    nv_gpudirect_clique,
                                    qdev_prop_nv_gpudirect_clique, uint8_t),
-    DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
-                                OFF_AUTOPCIBAR_OFF),
-    /*
-     * TODO - support passed fds... is this necessary?
-     * DEFINE_PROP_STRING("vfiofd", VFIOPCIDevice, vfiofd_name),
-     * DEFINE_PROP_STRING("vfiogroupfd, VFIOPCIDevice, vfiogroupfd_name),
-     */
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -3261,25 +3291,16 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
     dc->desc = "VFIO-based PCI device assignment";
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
-    pdc->exit = vfio_exitfn;
-    pdc->config_read = vfio_pci_read_config;
-    pdc->config_write = vfio_pci_write_config;
 }
 
 static const TypeInfo vfio_pci_dev_info = {
     .name = TYPE_VFIO_PCI,
-    .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VFIOPCIDevice),
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOKernPCIDevice),
     .class_init = vfio_pci_dev_class_init,
     .instance_init = vfio_instance_init,
     .instance_finalize = vfio_instance_finalize,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { }
-    },
 };
 
 static Property vfio_pci_dev_nohotplug_properties[] = {
@@ -3298,12 +3319,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
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
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B118507B3C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:51:35 +0200 (CEST)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nguow-0004zf-5C
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nguk0-0007bR-AA
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:46:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujy-0003Pb-7M
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:46:28 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JKasAT020195; 
 Tue, 19 Apr 2022 20:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=O/LD8FzeijjBHt4w2xn2t5nZZdlRJd4UWg3qtwr/if8=;
 b=GKnaavoTKjiczXiVyAMxVBqZ4n/MdRVsBvDbBNkKWLu+hZYwXaw2DQiX9SzAVozH+DmW
 O+BH0vV7FFyEU0YfyNYM1WHnd6bozvUi9ILX7fKF6nJL1g4PiaxZMGd6lhvOWK272kAx
 x0VH7jFU1mJ+1XAQi8eTj6b4dcUYmb1Q1jfLfmNhm25h5rHpF2Fr8awqalvKLNWTzQib
 /kplSL1bds62CsQBPUr1QicVHW1xN2iPi8xS+j6qNQmDj24QqGaJ5DnURSjsIh79GsbC
 TwgVA6txNHx1on6u+j7edx+2XXMhC27WLnyN9u1906MO7cc4Pmex+UDAeJjrQLvKq7BK lw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1794c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:18 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKa5D4011289; Tue, 19 Apr 2022 20:45:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8389qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr9uVtjA6BTmSXbPd0XSjc8CC1JDYb+5atpNN9nyqxzMh2Dl+o0Muwj2az4xPZteWz+ujgN5ZCqu3ZaqQ7jO+A8AebpJB3bLSQSVBJLhZGFVVpn6eQL40M7tZI7Z8FfnbELaS8YFCoGIc4LFUBW0mWf+VtbkeBdNMGwElTpPIZQDVftjnqMBSPp2c7Hx+TTRtKlYUmtt3JMN1IdYHtfXKIawAYjn0sh6ayOqtlKHaTCBs/M9Xa5BwdqdJHetdhhVgOFtE0LDYTISNHyZbtCffr219YZNfsoPxfix7YVIFd/OmRAKpoMm3IRZJ1gMe8uBeCvT18XI9SI0bZRkCy83pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/LD8FzeijjBHt4w2xn2t5nZZdlRJd4UWg3qtwr/if8=;
 b=O46Bn5IdXT8P6+GQ93Npmm6jg4zkeyga6OEl2m8p2I3+NPwBdxb3SUaeBSC9335/yIT4/q8oeUHllN2XqsHd1EoqiQBcBVJuoEaXzAzUqMghonLai0tAqtENKwi4rLqSCsGTclnk9pdziOYIjxFQ+vY0g+MNXwe2NsgrLgqUj4LzxxI0CqD+Lle0IYe33FwUDJ93xWLsUzq2S1UgqR2qliCvpQ0qdkzPNEJBH5CdcB2GQgcXYL0ra3abcef/HSGNgHOs6ku3V4TyaoFXR+VzbfOrCQOGwEElU2Ab+PRXTlxTk6yg7/zJF+nSy8BbtXPwjLElgbrIjmzbxJgbj/HoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/LD8FzeijjBHt4w2xn2t5nZZdlRJd4UWg3qtwr/if8=;
 b=kHz7H/Rw6TXtpt1YsNQ5wghX1K4SPzQt+wbUKXF2VXcNQgccWbqn2KU5wzGLDA9EFlRfdI+XvoQQhUgBnBGhU7RxMCjnpSpabpZFUX2OoOpcGCVkFAlB5Mi/YE86RZFHJHjuIFyjaDf/7ealNoP6J9/XvNv5XcqX5x3jyjO7VOQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:15 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:15 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/17] vfio-user: handle PCI config space accesses
Date: Tue, 19 Apr 2022 16:44:16 -0400
Message-Id: <83984da67ca116313be77eef1509d3276e1775c5.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a822cb23-ada0-41d5-553d-08da22458179
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998342943B6FADE78F1296B90F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6kWiS+8NK9A57VtnOGuZHO1fWFW5Kb4Ab0lLR2ioXpDe2rbGkC9fFu4ayucFioyIIT3uKCMsnmb+g+2oLn/Wzt6py7S3IiPOLD71CZy/fZApJYoR0EMBE9gfeoL7xrOKtk6YDMv/7vDcu6+lzCrYLOVTKukSbuT4EmM6ru9e0C75TiQF2kZZ8mLhGHdvmRwzANbiMHE6lUa7E4Hq6HJTMeW9Qua9DGDYxjAIJm9x+g5gQpvxRdZz4fZkND2sCT9VPpGJ/VvBGHpw7YZ8CF6fmR1I97t3ZwfNik4Q8KvjHcCcSmeNRVDXv8j6Ms8K+4oO4OTAuFVcfdhmMx+OvJJdZ45cPCaCcaoJ0c169g7lktfDNR9ThxKvRVgmy2natztt0IU4HjOWKeGPkKRy3Ru21R6WQ5YmUkzCNKgaiPhDJgqZKGLr+QHMviA03WEz7Tb/1yQs1ajJ24RvVcb3y3kezKvLPG1klavy6fG1twvqmgDVRXKifbRwnxSJCsrfshqXjVKInA4hV0rLdUr/ZN4pfC+ye5u80opdFYPH10laxMMBUUuVnE3XczLVrPySUzNHQTg0mbOI/HNKsS63PTTVrbbL5X/7wUYZY9A/w5Gyc/v40Y0MiRIqnmtkY4iBCfIc/JwICu5ercDk8bFUq1LTKoDq4en3VY12DBV8UxNiw/DbMf/W8e3O/o+6MXaGU2aoT/wnjZQGOvQ82Qc/U7H6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9egnp0WYWk1H1quXCI9tnOP9XbDP7rG4knNJuxzQT5WTmH8R6t5ytSEbEOT?=
 =?us-ascii?Q?/KTW5rEpEDB8hu1tnWRnkXUn2laxPM9HDsZchekeedudeQWGK4KjV8K5sQQb?=
 =?us-ascii?Q?qlBqMCnFq5K9XOb7YVcoMGanEEQlCFcAxN7QbYK61/g77cPnOdg+VtX8ZEYQ?=
 =?us-ascii?Q?ZAeJwpJ2LMipanCbs7Sp9D+whbh9jUkau/DOOumgWNIxRN+w12n4dZHFgC54?=
 =?us-ascii?Q?0UEBRpToh+2oV3uOtIzzODT4f1qy/c02uZXc7lWdmvFB+P2CBkvwec2Mx//l?=
 =?us-ascii?Q?7seGh1nPK35xm4UWeAAXxUrHoOmdI9VivIj+j9DvMuIpXl6uO7MzIU5jw/DG?=
 =?us-ascii?Q?yszaAKBPcVFTekNs9EmKU+UujZGuEDSaXYpOsQeOMoMg9t2cHq2DsviwB9Q9?=
 =?us-ascii?Q?+eI6ZlenB1/lu7ge/m+4C99BN0U0Y0Rr8+yNjlo9gXK6CANBSfnEjWSv/j0d?=
 =?us-ascii?Q?6AJO0SVOxwtfbXN9e1RzkGUbRVh7hI/9qXlYBQPHwpyef4eTEI++qOaQnwTU?=
 =?us-ascii?Q?Y7PvOmgwPZM7fIjzeCTcoVXyfmNafH2JO8IbJFfXlEGXHncViKqi3NQtNxf5?=
 =?us-ascii?Q?G81i0L46I9KiYXbX2N2JfDDvEi3bolpKn4u6bgRjD9ogYDdF30QkIE2yxT5x?=
 =?us-ascii?Q?4OwJ5xb/efYQlPLt68UZyl8QLnNkdiQEzmZjXtHLNGuZqWiq3LyVPjAmnaiT?=
 =?us-ascii?Q?gwWDVpCREJVkgk69rQcYzDVuTt74jYTDgDDad7ygJpZxBlVgLuhlYSHllFCO?=
 =?us-ascii?Q?gVdDbcd8DIKFP95QAfNS+pHQTcj5n1P1eqecWa+a9c7h1aXQoap67PkmI4B/?=
 =?us-ascii?Q?jS8OPQuP7beAfindFlTVPhnWTTgrrirhXsCOoMXxmHKW5VnIyHnL5Bs/hPkX?=
 =?us-ascii?Q?k2DNktX+SsSVkKGHjFeVTSqdUHmOF0wYjslkjwWXOMF5QIttBmQnKJuJ9Zx8?=
 =?us-ascii?Q?SHFWPhNmaZRuLdCsg0JvykLo1jfcssOwokLIfJemLx4hQTSlAzt+/HKPjlNs?=
 =?us-ascii?Q?W97Y8vTfF4XoGavun+oO99Y996Jl0iSNX3dQIr90vVd8+wO8QujnxuuS40ck?=
 =?us-ascii?Q?UQ0cl+jXprrQN5zsnUay77h7swxrTFeWs17Tr44y39wx5PYTBj+obHdosKua?=
 =?us-ascii?Q?6mwjwU3ySfCVj5PBLR8xJHcEyFjosTgkE9fQrWVqEFfwXBoLGtA8wAwffw8B?=
 =?us-ascii?Q?+YSUH1nHInPbrCL9nSvi0GMq3nIAy091mfVMilfmPX/AT9nKFNFkasF/bXZ9?=
 =?us-ascii?Q?1O0AgZSbl0SL5K4vqqiYx+Eeeco8aR1vPr1DluTr8/7gwDUwTd6I8ReLfJ0K?=
 =?us-ascii?Q?NNWuDYHGf5F7i0SLnuTmpG6CjoxJqTxjwDmVT99sZOgncT4JToBuAsOD2+Gh?=
 =?us-ascii?Q?Qc1mQXjqYR6yzvAowfbnNm9sKFXDHDJvC1QeDXpUo/JznjH/QutYj7ZcCpT8?=
 =?us-ascii?Q?ti7CymOpkb0FtVJhj/8SKDSlwX9e6W12mPRxHqCitQDo/aN+xVcWWwUbRdCF?=
 =?us-ascii?Q?6JZo/2IHiirn2sVmlKT1kkIjinwDpc3iCSdqR1X8Xmjpv+mPutXN2sNAlor7?=
 =?us-ascii?Q?Hc+EF1K8MBqhNSVKOaaTfaoB0Cip6kuOcxRgbXpo6Hd7k0CaAkyAnpyXvqK2?=
 =?us-ascii?Q?+Fixam5A7CWuevGgUhHzr2f5gBK8bSbx+S/NQMQp63ni1hw2iu4Ci7tkeZD0?=
 =?us-ascii?Q?g1EQ5sERCmVIcJGuiFoWwsXem/bBmWzfFvUR+2il/niXFvd2vFtc+eo0Ejog?=
 =?us-ascii?Q?+M0IdzWi3g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a822cb23-ada0-41d5-553d-08da22458179
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:15.6333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRUOyEK5DeUWJV8JZuCpNRkcjjsVreewOnNATd5vYifpsxKcf/ReT5Odg5vSXTqmDzUNswunUK/MV0O06r/stA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: 4c9gHZ0Vw7VWqQgUuIGLqEQG7DDcnD0-
X-Proofpoint-GUID: 4c9gHZ0Vw7VWqQgUuIGLqEQG7DDcnD0-
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
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
index 06d99a8698..7b863dec4f 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -47,6 +47,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -236,6 +237,45 @@ retry_attach:
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
@@ -314,6 +354,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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



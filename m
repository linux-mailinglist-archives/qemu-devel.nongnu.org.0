Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EF2FC157
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:42:25 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xpY-0007D1-QC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xct-0001Az-Oi
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:19 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:37678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcq-0000Ff-B5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:19 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOdug145832;
 Tue, 19 Jan 2021 20:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ePz+Sq/1iKB95Td8WDMunIy7n00tgRQZ8WBpCySIWts=;
 b=O5CuA9OEQGl2ZGVdr3fHq01D0KG/b/mwrer4FJNRgQdDrDA0ql6rtp34KgRsiJgXgNQE
 245dxU8pVOxRkc0xMPcreBDUt17qGQUPQpFQLu4+YYjBt2SosP+UoU60Axdrq+28SNsV
 buK1yiNemX9k2D95SWbYsTGR8pJy7SUzMIonK57a9KoP5zAQPGbFSR1UcXYK5i8Ax8pC
 HH3rDivB5kt1kcTCe77P9zMQHJ6Zh/CBdQhw7KZh+afsmuXvUu3mmJ9nybas5UIblFc8
 vTPBA7ssD2SlbjVcTMCM6RSloth7wehGmdOJWM2KL5zSbdSmb/KPj7Kr1qxeUHCHDxC6 sQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 363nnak4vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPdEV128381;
 Tue, 19 Jan 2021 20:29:09 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2055.outbound.protection.outlook.com [104.47.37.55])
 by userp3030.oracle.com with ESMTP id 3661njtag6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKEVPSKRgl/Z6IHScyMj0yp6k1fDpdc9WrrB+t78xovLvm1CaYw7BYHHY3JpA211qB8wnIxFUHYoIkw2E3CFasNpTOR0DKu8j2h8AmEl7btUuSIEcoJc17iJ7gw+mmU4gewclp0DGqBY7ZSPUubfCMEFAqJK0QuxwN1WabWZIMB35HcfRh3mGT+RdDwBib2wZ0+oCZeA3YZ4xD4pChE9WF0NAAVV7tqWVgs8ol3TT4yQsv8sebZK0G7e5xNN3CVPWj3tLKoyx0vPVjKXPVpy8L9Qd6Amd/LfCbJfRx1KSIDrvBSCC2QF97X1SDiqzqLD0JhOqx4k/l8V7Xb51/tLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePz+Sq/1iKB95Td8WDMunIy7n00tgRQZ8WBpCySIWts=;
 b=UdayMUBvXezG01vmFEETAPyEwh0At/c74wkR4C5uEstT35EkHQTywJCgtBpXCkB0chkD0SirOW/6zP7BvxFDhkCK9G2BuTLEKxTvM3OpcH0MsffMDA06sklwYyLDfZCU2tm+5TyxOQQXU1ogI78TwXjFbG7zMRJ1V/GVfD0Abx0/d1tyb3oXXJqCpVmiaimf5KjZloPiUJDFcSB/JlrtnEuJ55L6aUncmg4RZN0VbgJLuWUeGt2xPeNtUNu2pdeD508sUvGhdk1+AYpVJQzdvPhAYhnsb+jmKZStDM1k2SnIoxZLAMmVvTd1lC94mPzLLO6v+hHsiTJz+qWREXjLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePz+Sq/1iKB95Td8WDMunIy7n00tgRQZ8WBpCySIWts=;
 b=jAka+Tk4UBF6Zcue3WG/zPqG4yZbnLbh4T0ucdOpVzY04iQHSrk3TcEiLYkFqDgyFeR41p14294b0ZrAV/liWgMwKtEpE/2ccL1C1kpMVHSq9Gx7AV+sp7r4sWEFNvJU25LkukwB2j7dGSu9wQZmQ/3FSfOLd2vcVefmKifvvx4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:07 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:07 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Date: Tue, 19 Jan 2021 15:28:25 -0500
Message-Id: <ac1c0900ed34c8bf4e93dd77507fc34169bb8ee4.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e0597f7-f19e-440a-782d-08d8bcb8dec7
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349EBC1AB425C25AE8045FA90A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fAWQONvNC04lLAb0EwVor56ZK4YbITQsEvF/cJy3gQV3KR6jm4lN/h+ujaLV+MWDrlCieYKq19QLllWqqMk3ZCUNsBBOMsVdW9na10QqgCGA25gTegXpL8es3EzpA9e2V4Q41OWzDY/JI8ebOYAjwz79Ytq1EWCqWDzVxNMuXP9U44lsor+zSkBI3PWuVWG9LqQ8Cj3CbeIF0OCo0GiE/wRDf8ZdV7gWXetg92VsWOR0/BtDF8mpmglnI84slOorNdf+/N1UvBvWAXBN+uh7SuxGVfxh/Y3hUOmM5Ne9moQFlTlNUAl2BSNmb/RBzJ2YDZUuDgZHt0m7QjLR7MxgFj/1Kxnv+pYV2ZBq7E1cvq6yoGTFZVkqm+Y14XDSJS8e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5CWnVd9C06nGGpvwWr1nrOlAkFZ0piaS7ag35+WGWaZCcNsKiqPut4YlbA35?=
 =?us-ascii?Q?ox3PPe2Cwg9q2kzFJYKuyPxK8NAsS5N24ANY3KfxxGxzFitjvnho+4YTYYHX?=
 =?us-ascii?Q?RRCCARLC+JNut5ViRjyeMK7n6XlDIErZUtQXikMJzXTXQDz3TNIWaGbHkv91?=
 =?us-ascii?Q?/1bQyTLMGvLA4Lzu95yJ4skU/co9ksXh9PbrlSQ6FjzX0+jwAIqIri4biG9c?=
 =?us-ascii?Q?mzt4dtOt0g+/dMZf9UtM9UefLYu+pKqMALsLTsATA3K2dYhEYQB27tt24rdw?=
 =?us-ascii?Q?KzkM4XnJXeRBaH5yXxe7dGzX28pQ/ZEEACWqsv7BRp3UsFn5IaHce4jjLuGe?=
 =?us-ascii?Q?Jxms2qfty+iXgUkqQdU6QGZ4rMZ1VJl3EwBt3EidCKcRcZsA0TW77FcSyN9z?=
 =?us-ascii?Q?PdOOSKblH/AL4W8Qgmbnht3/Y/yuQtMu3Um7hotCEppJpDPIbADqI3fdPJGt?=
 =?us-ascii?Q?s3cdyYnE2OR7w/QWF+7xRkrMyYAg+pYYtWoYzxo5g6sgoljzBU5fvNcyBwT1?=
 =?us-ascii?Q?gQ9D/c63gsMcekUHVK10FJ1FWRZwDTF370zeYBtacE7Y8vADJ6CoRXCr/WiZ?=
 =?us-ascii?Q?+KK9gltmxr2TFQos+dqiRyY235rrrMy7j4s0JWqiNHDlOmuW63gquQZGIjFb?=
 =?us-ascii?Q?pczk0ZB2gEZcMtOr8na8Qi0HbKYdHQiogk1SqKTl39NOt2jlLhQQ8kkVT08/?=
 =?us-ascii?Q?4a5gTIPNQRM9NvWdctoqgFKwE9dWOQHtvxLNliwtluZTQu3hFsIbvxTr7Hxi?=
 =?us-ascii?Q?F4szeuqvuEf+VNaeQzMnBCpGjOVT3wlngiE9vTv/z2eLdnHN+CjeTPRhxv6A?=
 =?us-ascii?Q?nrIWmgXyICbDQ85vUkVPR7eaByD2KEdMdmOuPLrRhySL6yQnK/ij+BVsgN/7?=
 =?us-ascii?Q?f5urc1uzRgAAnFtrNwXmkDBMqN65Nr5Iffn4kTDI5+jwgP4VByUNS8Gkq6sB?=
 =?us-ascii?Q?CvZePp+XZXzozC52R4GBr0nJGbeUFg6YTKcv6Ca1VeM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0597f7-f19e-440a-782d-08d8bcb8dec7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:07.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9Ri+mvP9cnDCzmu/I/R+wJMLtZWXXoSWIYs8CoP3seut7+AjfBInCW+soFkYnUWcX4peTlCBZ2KPTFBHSP97A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Adds qio_channel_readv_full_all_eof() and qio_channel_readv_full_all()
to read both data and FDs. Refactors existing code to use these helpers.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/io/channel.h |  53 ++++++++++++++++++++++++++
 io/channel.c         | 106 +++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 138 insertions(+), 21 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 19e76fc..8898897 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -778,6 +778,59 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
                                     void *opaque);
 
 /**
+ * qio_channel_readv_full_all_eof:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to read
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Performs same function as qio_channel_readv_all_eof.
+ * Additionally, attempts to read file descriptors shared
+ * over the channel. The function will wait for all
+ * requested data to be read, yielding from the current
+ * coroutine if required. data refers to both file
+ * descriptors and the iovs.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+
+int qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   int **fds, size_t *nfds,
+                                   Error **errp);
+
+/**
+ * qio_channel_readv_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to read
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Performs same function as qio_channel_readv_all_eof.
+ * Additionally, attempts to read file descriptors shared
+ * over the channel. The function will wait for all
+ * requested data to be read, yielding from the current
+ * coroutine if required. data refers to both file
+ * descriptors and the iovs.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int **fds, size_t *nfds,
+                               Error **errp);
+
+/**
  * qio_channel_writev_full_all:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
diff --git a/io/channel.c b/io/channel.c
index 0d4b8b5..b12db9d 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -92,19 +92,47 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                               size_t niov,
                               Error **errp)
 {
+    return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
+}
+
+int qio_channel_readv_all(QIOChannel *ioc,
+                          const struct iovec *iov,
+                          size_t niov,
+                          Error **errp)
+{
+    return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
+}
+
+int qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   int **fds, size_t *nfds,
+                                   Error **errp)
+{
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
     struct iovec *local_iov_head = local_iov;
     unsigned int nlocal_iov = niov;
+    int **local_fds = fds;
+    size_t *local_nfds = nfds;
     bool partial = false;
 
+    if (nfds) {
+        *nfds = 0;
+    }
+
+    if (fds) {
+        *fds = NULL;
+    }
+
     nlocal_iov = iov_copy(local_iov, nlocal_iov,
                           iov, niov,
                           0, iov_size(iov, niov));
 
-    while (nlocal_iov > 0) {
+    while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
-        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
+                                     local_nfds, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -112,20 +140,53 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                 qio_channel_wait(ioc, G_IO_IN);
             }
             continue;
-        } else if (len < 0) {
-            goto cleanup;
-        } else if (len == 0) {
-            if (partial) {
-                error_setg(errp,
-                           "Unexpected end-of-file before all bytes were read");
-            } else {
-                ret = 0;
+        }
+
+        if (len <= 0) {
+            size_t fd_idx;
+
+            if (!len && !niov && (nfds && *nfds)) {
+                break;
+            }
+
+            if (!partial && (!nfds || !(*nfds))) {
+                ret = len;
+                goto cleanup;
             }
+
+            error_prepend(errp,
+                          "Unexpected end-of-file before all data were read.");
+
+            if (!nfds || !(*nfds)) {
+                goto cleanup;
+            }
+
+            /*
+             * If (len < 0) and fds are returned, it's not clear if the
+             * returned fds are valid to be closed. Just free'ing the
+             * allocated memory for fds in this case
+             */
+            fd_idx = *nfds;
+            while (fd_idx && !len) {
+                close((*fds)[fd_idx - 1]);
+                fd_idx--;
+            }
+
+            g_free(*fds);
+            *fds = NULL;
+            *nfds = 0;
+
             goto cleanup;
         }
 
         partial = true;
-        iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        if (nlocal_iov) {
+            iov_discard_front(&local_iov, &nlocal_iov, len);
+        }
+
+        local_fds = NULL;
+        local_nfds = NULL;
     }
 
     ret = 1;
@@ -135,20 +196,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_readv_all(QIOChannel *ioc,
-                          const struct iovec *iov,
-                          size_t niov,
-                          Error **errp)
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int **fds, size_t *nfds,
+                               Error **errp)
 {
-    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
+    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
 
     if (ret == 0) {
-        ret = -1;
-        error_setg(errp,
-                   "Unexpected end-of-file before all bytes were read");
-    } else if (ret == 1) {
-        ret = 0;
+        error_prepend(errp,
+                      "Unexpected end-of-file before all data were read.");
+        return -1;
     }
+    if (ret == 1) {
+        return 0;
+    }
+
     return ret;
 }
 
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1354CFFFC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:26:42 +0100 (CET)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDNp-0006bl-9a
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7g-0007Ss-Sc; Mon, 07 Mar 2022 08:10:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7b-0000TD-FX; Mon, 07 Mar 2022 08:09:58 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C3J4Z010119; 
 Mon, 7 Mar 2022 13:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=sqLOkoAz9PLSjiTgvW6DexwmElDvxl0n2Zsg1OxtpJk=;
 b=Kqm5ZVhXTjK+uE4MeGbkq+mAxovoKOWehjD8xJxQUmhXzIbCkNjkjyUc9i0E9iHk8sBh
 iPE36dp5H34BAxGVKcWuyaLTBXTZny9AzkXafGtbRJZVUbC22oj8nae77jQVycDW7UYz
 nXwSq8Ru3PUJnW2WM03a51xmxqpsuyZYvzFEUHFVwyjJZ8p2gVKSnfphLuAKvQcylwOf
 4ydRpMcHjAB20+1BcQYjBpOmLj1GzVu1/CgZF7NSWB0maN0zECxGuxB3dcgSLqyG2vzC
 EZRwi3tMpc6NcgYkxj7IXWJ7XtSavxPpF78ChDZaOqG8kt6gPXDzPWNXFfwxy1kRJPZx yw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cbpyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D6Jn9145484;
 Mon, 7 Mar 2022 13:09:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 3ekvyth2ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXKQBMvE1VUwp9c+h3T8+Cf3mXt+nz0yua/1DUcW8UH650wFyTD+ON+8WfVtfW+jbhhL3j9f2Kv399X6dYo2uoYKf57Fcizz7VzZcO59nqxW8gRpoFODnheYGcwNplc3W2wibcP79QIhMY4flnlxJncBhSJ0+KqQ5eyR740l7pL37SqjJdBTYQUeTmfkskhnQBiPIldInHxvCYk/+5N4Nw5dJLX0tzi3RP4+ZID8YhuXQbha7KvvJ3Et/1pWF8LDygIWr622FCe9fbIgVx3AR2lapLWohjFvgEUgrfwGzlkOVgw1fMSsoQFAxtt9z1jcw5fVAZpGbOmoXPffERjikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqLOkoAz9PLSjiTgvW6DexwmElDvxl0n2Zsg1OxtpJk=;
 b=CzFEIjYGo76EMkzqlikieGOyBr6zcJ1fF0TFTR/sfX8Nod5O8T4YbEb1Q8Xeze+4tnouY8XMEJymZUcTXnkp3qdvbo1RUEXiLykdjewlW2fmQd3Firks6TfoORYUiPIIQ7ymlItFmtp9czgLFFq5WbZNtIPkrPt4HSt+M8xz81FcIboXtqxiHi5srXrPAm8xvFifqLVczudIWjyiLER4SCj88MT5ZPhQAmUDRMT0mdgI3cfVAsaZIqAFZLOgltvayoSsEvd1/iuT1xJkRXlvWbfwV08rwLZ2uVx5/Qx3TO7oGscN3zek38rnof6hsNxIYvNjbb4aKsLWjX1yDlNZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqLOkoAz9PLSjiTgvW6DexwmElDvxl0n2Zsg1OxtpJk=;
 b=WIpqLOFzBEF9nzMiCoYUs1Z6kmGNuC9STfLsDOA3nvy70IFjFeKjBv4DsDxcnLJSSLwpA3qnU6YV6C29Zrh/jRQaS6Jtys2tHXfocbjAJyA45CdmFsO/Pl2v4PGCzqF/d2PlfhMsh5LhbkJNHoKTA+P/XBLI14OgKA0XLLoyfww=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:31 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:31 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Mon,  7 Mar 2022 08:08:39 -0500
Message-Id: <1646658521-31652-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15954ba6-3c9a-4129-d869-08da003bb7fd
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608C49931EEE2BA84AF8EF6E8089@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWiqyF8SVVC7DvCiABOTqdy6JBYQOml7EMGpQi+XrG0iHXlp1WD3pqgQLNKMZrrg08ESAos7m6XN2MlO7z0j839Vl1Je/MDQGk1vVN9HnXGpqV4r4V5ZLYCneIbXGe2BtSZuBA9fRNR4nTCedlUYZCW/vjQ556YoA7yM5ZtOhW7tD07lTkQN11Q0Gf//nzEPbDg8MhXg44Iz+xG193Xw81cV1MW8lq5oGOlTjpmpw446YYkU8T7qWXAfORw8+3B+I4NGbRnC5w4sO1JXVr6JxFQsAixzfj8eQSjESiHdKeXnztui1RUrRekpuEFuijLWYrujC+xHJeIS/n+ygqiZivEW53ZwTV74ltY0YZKvVj2t7vLYDEsBYwq8mKoug4AiZ2ZEKuUgVIFVdWfBkYyEjYtOKotzCSx971UHuPjGGz7Y/l9LpKjtaBwZyi6tMFd9HoZcitsXmXRzxnkcD5o16ky4HT67yR0zcYRCM1iP5zAAM1O4qXahgk/dGjiLMQadC7biqDojldembGed1zIPOXK0+1L0n0jLjjUW70LT0iLm+ZUrMjqFAyHlDNpQ6tlZVnccwNdrmx5c+O68kOhdUu+WjPc5Wu/Z1FSdLYCalw1Aw9iV93XighiagQtJr7v7+4398TMwLEQxqIN2STfCcLBuWb0Dt0E9fj0xGKayo9edvJWck+fYF+K9XlbTh7LW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(30864003)(86362001)(26005)(186003)(38100700002)(6916009)(316002)(38350700002)(2906002)(8676002)(66946007)(4326008)(66476007)(66556008)(8936002)(5660300002)(7416002)(6506007)(6512007)(52116002)(6486002)(36756003)(508600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9pNnj2vKeMy9fun3yHuTuFGgz4HFeVJ6rXT0S88xmJAaYklpAowb5iAiWxTW?=
 =?us-ascii?Q?E5Cdm7KBdlVgWdZfL9GBYZgf3DQo6iJER0ayNtaYzSzDM4zBrj5brU35dKF+?=
 =?us-ascii?Q?jBYnPPMJZ+jKM2F/Hh3UHQFKm2XDgzrU5VsJmdGmqEfePIuQHnl9TQcd+/9V?=
 =?us-ascii?Q?T7m6Qv0Ig6CrcI5ZhmohIYzZzc0pXee0LwCIw9OBn8JNgzlR/UX61nBCnL8+?=
 =?us-ascii?Q?271ZrCuqNp6RzLdUtrFAATdFZGWy2EPfpeLJJdhlTq7WNQV3j73Ri3XGDNw7?=
 =?us-ascii?Q?Iqoi70WggVPkrVawDyvyaPvPYnb8L+B1v1u/Wrb/GvSppR10jNL5kuP/wApB?=
 =?us-ascii?Q?K6BqIBDsDQoRW0Zb1x/zf5eXPn3vqECgV/t7jzSSAcfqyL7bl4cfrTzd7Juq?=
 =?us-ascii?Q?BJGsKzFgAGO7XSp6X4fYYRkKiR/NflkiJJB+CrzBvDMd499VhZRUYi6LmAEi?=
 =?us-ascii?Q?wYVtPuGb1NhB3JqDDKnwDItrVwxY5wfCsXigyTSaJ/MMsUN4ojhA9FVD7/SL?=
 =?us-ascii?Q?CfAG1uOf7+vJpJs4TNi/xxWsIF5/bXeRP7jLJlH9a3sB5IcHWzVRRzGU3jNX?=
 =?us-ascii?Q?yWwNwa5A6WZje48cjowBidktBe4BjF1FN26fkApCVpKOGPl5kg4i7W9DId0y?=
 =?us-ascii?Q?kGTli/XpF2LBLeGEpKqU1Z1btjnfPRcofZnCQUqzsLLVBNqJV2NB6nzrf9FZ?=
 =?us-ascii?Q?R3RuSJdr6iMqMpGQATTHbTaeVtGt8SGhiDifwqEMwms4o8WURvsa/CZ/tkG9?=
 =?us-ascii?Q?OTbWmtrWsgllowtqw9isqlad8Pbt7kHQZ1dokpYFCRrTdlPlglgOR7snUzWc?=
 =?us-ascii?Q?VzdyOSkbYTqcLpTFnIMQtm1fy2Dxh3QPuoz5Ey/zfBYIaYeF/sWlm5/JlW6V?=
 =?us-ascii?Q?/iwRmFq7W2eilk1VZIad4+hJTaOhtkgQyZTYapobSRT2lpdfcUJv3Evssr7y?=
 =?us-ascii?Q?jIbN0FEg8dSfbF1fu8o+PphVZ1aPBaeawgn1MiUdT7knF1U9Ijehv5VTgZ6G?=
 =?us-ascii?Q?RmS+gvjdJg4VZ0KYgOAJTaKd3RHgmIBi3EEt2YYRQgenFi7CHGuCQm/OztFM?=
 =?us-ascii?Q?O/1lDaSwzsU42wpx3asw6Tq5t9nGTYZ8R+LejagxQG5XS/mssC8XbSwd7qrr?=
 =?us-ascii?Q?lWQwOtcYDz/mD6bGrwELAmVpfG5r33MwfZn+lyzwNN7YmSND9oi0toTvf/hX?=
 =?us-ascii?Q?P1v5Dvljx7o7YbZ5EnP40Gcbf5sEvlB8LJtrZpc8WR1KlNRK/Rj7UTV0qrBz?=
 =?us-ascii?Q?9qhhLlgMTuBbEkyqWSviTqoPWYwWBbBANFeCgOOnwlVDG6k5TVyEniAWzOCy?=
 =?us-ascii?Q?4WrNBGL2Kvp5XS6PIf2BOR+5VjjD7ad1PSjey739UnZoWX2TAvFE7cyiaX4B?=
 =?us-ascii?Q?n2NHb0fEwnkSyLoabPUj2u3eQ5SlWsQn9IbYGyJl75f8gdrbJyJnKwhsHJdS?=
 =?us-ascii?Q?OagFJOgA3AOM+/lBMCFNlc51tV5gBzvC6xN52pKG17VvESEh3dodlWBAapsk?=
 =?us-ascii?Q?Bzd7ccLWYFRYIVWzavEEIUqtItO8t9K4LWNZ3LNR9qWVXuVk+MK71Um99QT6?=
 =?us-ascii?Q?GHw87bO0rlyDjZYdrzZEDcfxg/47a48y0RE3TJy7Hh7b9aMq2vWBKjgdVtJB?=
 =?us-ascii?Q?w4LcTMhTt26a0A/zxSED9lc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15954ba6-3c9a-4129-d869-08da003bb7fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:31.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+10gBCZHqwZ1MjSFt1wsRCCuHBfe49yGiw50nJEiHadSAlA0VNPIpGrtyrJF71svyLa8cJLsAanvfY/Kv2e9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070076
X-Proofpoint-ORIG-GUID: 9gZTJla0ThRWOYEfKj_NNFNgxhGN7xqJ
X-Proofpoint-GUID: 9gZTJla0ThRWOYEfKj_NNFNgxhGN7xqJ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++++++
 qapi/virtio.json        | 252 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8..13e5f93 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ccb5e2b..8723a53 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4312,6 +4312,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
+    status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
+    status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 474a8bd..44cc05c 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -404,3 +404,255 @@
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
             '*unknown-dev-features': 'uint64' } }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# the VirtQueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc (descriptor area)
+#
+# @vring-avail: VirtQueue vring.avail (driver area)
+#
+# @vring-used: VirtQueue vring.used (device area)
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid flag
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'name': 'str',
+            'queue-index': 'uint16',
+            'inuse': 'uint32',
+            'vring-num': 'uint32',
+            'vring-num-default': 'uint32',
+            'vring-align': 'uint32',
+            'vring-desc': 'uint64',
+            'vring-avail': 'uint64',
+            'vring-used': 'uint64',
+            '*last-avail-idx': 'uint16',
+            '*shadow-avail-idx': 'uint16',
+            'used-idx': 'uint16',
+            'signalled-used': 'uint16',
+            'signalled-used-valid': 'bool' } }
+
+##
+# @x-query-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice's VirtQueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device and
+#        the VirtIODevice VirtQueue index (queue) does not exist for
+#        the corresponding vhost device vhost_virtqueue. Also,
+#        shadow_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device.
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5217370112,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5217372160,
+#            "queue-index": 1,
+#            "last-avail-idx": 0,
+#            "vring-used": 5217372480,
+#            "used-idx": 0,
+#            "name": "vhost-vsock",
+#            "vring-num": 128 }
+#    }
+#
+# 2. Get VirtQueueStatus for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5182074880,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5182076928,
+#            "queue-index": 20,
+#            "last-avail-idx": 0,
+#            "vring-used": 5182077248,
+#            "used-idx": 0,
+#            "name": "virtio-serial",
+#            "shadow-avail-idx": 0,
+#            "vring-num": 128 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus',
+  'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device's vhost_virtqueue, including most
+# members of the vhost_dev vhost_virtqueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this vhost_virtqueue
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'name': 'str',
+            'kick': 'int',
+            'call': 'int',
+            'desc': 'uint64',
+            'avail': 'uint64',
+            'used': 'uint64',
+            'num': 'int',
+            'desc-phys': 'uint64',
+            'desc-size': 'uint32',
+            'avail-phys': 'uint64',
+            'avail-size': 'uint32',
+            'used-phys': 'uint64',
+            'used-size': 'uint32' } }
+
+##
+# @x-query-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device's vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5216124928,
+#            "used-phys": 5216127040,
+#            "avail-size": 2054,
+#            "desc-size": 16384,
+#            "used-size": 8198,
+#            "desc": 140141447430144,
+#            "num": 1024,
+#            "name": "virtio-crypto",
+#            "call": 0,
+#            "avail": 140141447446528,
+#            "desc-phys": 5216108544,
+#            "used": 140141447448640,
+#            "kick": 0 }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5182261248,
+#            "used-phys": 5182261568,
+#            "avail-size": 262,
+#            "desc-size": 2048,
+#            "used-size": 1030,
+#            "desc": 140141413580800,
+#            "num": 128,
+#            "name": "vhost-vsock",
+#            "call": 0,
+#            "avail": 140141413582848,
+#            "desc-phys": 5182259200,
+#            "used": 140141413583168,
+#            "kick": 0 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D06422FD0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:19:36 +0200 (CEST)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXp2M-0004C7-Gx
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnb1-0003Ar-S7; Tue, 05 Oct 2021 12:47:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnaz-00060M-Lc; Tue, 05 Oct 2021 12:47:15 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195G9eNY023948; 
 Tue, 5 Oct 2021 16:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=KxofTkBLATpTxN0K8y0MPEMkoNE9GgCBmhMuyFd4W0I=;
 b=KO++Od4MMmj0DNxwdK5KUJBjZYVJK/Ro4Ya1v7uMy+oQb0sYed+oLbRNrCkWeX7Xwa6m
 XPNRlWYaqIXVvm7YCk2dvqHp7Phd+Yb+q6A/0yINCUc66jVszUeV9TKqyTEABcqwSZ9L
 aDFUQKjlDgT5cUXtY1hgA5Xl63cZHeB7vpKfNM3TLtkOWIaOUy7nDkozZIh3v1wV+vHJ
 rFDP/v2ykBzMltWqXt+jCE/AmLDL4qow+o0l6vCCQTE9OJabhMj7HBOCXmtBToYbRnW9
 9uHquj1Sol+pJ8w2gIRcdU79oWhgAnAY9ibZlykzNnVTfDD0TVYv1+1/t7cWTz4qNf2I Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg43grhq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:47:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195Gig0D158758;
 Tue, 5 Oct 2021 16:46:35 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by userp3020.oracle.com with ESMTP id 3bf16tbcrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCxuMT+ktVN348STrLUlBBN5UhDDgPrMJ+PNLUpWAPObEi8i5BXIFGZ3paUJACdW+2Zod4bW4N5pzR8/Y+L8b9DF6SGqH1AjSf/hrb0BGZs83b/v7I1VW1eMo57dIsBa5iipbvKaO0s/2tTCA4kL5Ft03Y31CbA+OhQf6U6qDf5iz7cO6d9PiAmux5r/8u0XT9BlbctdP0GrbEJOEE7LpuyUzQwmIjpl7CCaQorvKwtuHBm5O3GGgsYfHsJkMy7nUIPMTD/EkHzgY22nB45WxSH49YE8pvTmiVcDTFtJ2HXvXGLh8vKUbnWoVYAHayqVUtJZJcPBdU1qSsfez7564g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxofTkBLATpTxN0K8y0MPEMkoNE9GgCBmhMuyFd4W0I=;
 b=FKb4Vs6D7/ArhKIraZMJn+6QfY30Pv6b6B48awDwycd0qTlUqzn+TJTUVBXIuloqXiMUC9A5qY06sx1bs5TqDtFwEW2JJeXcZBQBIrvcGrYV7tlvb5qYEbsy3OIPNWaU99mogWPQr7H13/nyspL8aW8rIIjMIlvHclaEFp+iIf7doqX50PiXaL7y6KO/aw4YULb92Fkl9rud8GMJquBhjlItG1q8VEki15Oc5wy0QiXeZYBQLHwl1/E0ONVp0aDwv5gXbH+kkSzAVSr0nJ5T6N2sGHTAXkIdZBK2YNus9w4J+JI2GAy3kmssrFuJI/elc/XNuetlQ2/uKEnGk/y1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxofTkBLATpTxN0K8y0MPEMkoNE9GgCBmhMuyFd4W0I=;
 b=U4ymtmr8Ro58rCPmbTkS2hCT35GMfLL73FLwoFEPNFpTjPuQ2sjsf289nRsMkmuin0+/zfDDMBf7KXeRjN9tIrpV9oFNFMuSGieE3eKb7zfEhswTgUcB3REKY5FoTGkeECKRW8WL5kgY+HW3VLtQ557P1yygzkHNOtj4gQAWkfU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:33 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:33 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/8] qmp: add QMP command x-debug-query-virtio
Date: Tue,  5 Oct 2021 12:45:48 -0400
Message-Id: <1633452353-7169-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c795988-9914-4c2f-b5e4-08d9881fb055
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB294263D61726E2C534492E4DE8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWI+qk0Pp6eNTFrYDjKgeTJz1p52E3xaqGAVN6pzx0A6o2pMLDbJaxx7NaWIWtkwaNM9MbCwVNVTvAxGmICRIuSmhhDqimzMHvIisSMKfR7aVyzErTNnArSulPp6v9gQWPEu74UNl1qnGw1e6GIUXJMwg5V0c2EddbKCL9I86PwdUhp9PIKwi6pdL8HCu9ORwv+VRkgN5vufBtFKMNrT2B0gWM8li6qHegUBi5QTCEKAkgl/kIrosL/5SS4iJ/pTcv/SCqSGoiC4XBXiN8DlkqbDKqCiRw23WbtzT7uxjtHMrES9IkJkuUwv7ONavvpTi7weszgxD7ehZznF/4v1zOFOFAKZect4onqCmrmK4E9H+H4l0XwWH/W8aH7pTmCQvuWcOFNF75K82p3SgMQUpAB49IP+HJzHWkMXfFhXXz0m3btJWvFOD4M2VHfI9Fwe61KjL8MfnBCYRPUQf3y05HF7G6GnEi7M7Vi8Yl9Jwr+ICdzI1dIKYfENs3uo3R7OFZnLNd9go3hOdRwxEu0D/1+2PtNSeGiKlItLRE1HMXV0Jrwf7FnGNJHT2NNhtKHgOdlDJlVso37/Hx1Jj8tEz4HPt8EmYndg/JMiTD+vzm61kqyERFO9+3WiDQpKBMIKf39X9mcgmTA2Ucy8PM2Qc5yGx0q4LqsYksa3el4X03T8TDOTMfAndrm0s7B9ZWi6QTWdZ7VH4WzSLKrJaJdajQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(83380400001)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x4r324DEIp7vw1SC0TdZbGqUFjQq2zGUHjLBVaRb41TCDWNCKIzwJnidmsHK?=
 =?us-ascii?Q?q29vsDQ3WWAeMvaS6a/YdSBwn2zN3qfq44rggSa4ufXfHSS2UcnZGNZT2BG6?=
 =?us-ascii?Q?rgiGaBT7pRk6tnDFxW1/TYoOX+AznmgPyT2FSOrwJdQOAIMqFHH7EKQA/flu?=
 =?us-ascii?Q?HixUXXzMnMUC9zy9DYmRe/v0CIPx/R6CYB1h2tP+LQ9Lc5kpDJvHKDo8Tb0H?=
 =?us-ascii?Q?990eRgFMRWbdPALERzEnXTCiFInBzHLQL7MH/FAqLUIAG4Pn+qbvPJqeaMrW?=
 =?us-ascii?Q?9UAaLnaT4mWjWnJ34Am9pLwpfB0JsXuXBInT0ZRk5gQOeFiicosvClX8kCjr?=
 =?us-ascii?Q?yeEDgmAPlmvqnaisbul64lSRGNBBkm/IEW+I7rOWhJOtS9QH31kHb2tTivGm?=
 =?us-ascii?Q?uB/nnAla2NhJh8HsK+/bxkjUBATQ40URcIQ3T0pWZyk4eBVKjUynJ0ZC194E?=
 =?us-ascii?Q?9xM/jRGetNsFxASkGDgfLKoa9q1+R0JJRXxTxiYPEPkTZPMyk0K56sPAw+LW?=
 =?us-ascii?Q?wJ9AlIQmNRt0Ix13aJAE9JPRoyVaqMBk3Umg4C3R0cKC7HZE8HvJkMwhAnGZ?=
 =?us-ascii?Q?hOFglqJuBoumeFw4PBtxjsreVlRHf2w6cy7+EK3UBTw2Z9sx21fkRmeSWhZr?=
 =?us-ascii?Q?TILfSk0oqrIUV6Lro80vG1YAorxnSLCpjWUDxiq1gc27Om0/hu3vDcUrJlUz?=
 =?us-ascii?Q?8PpBYZYN3An1lQ4J2VtcNMDbJw++PgA3RS7qZml2iU/n+wPkQdzJSDq2p8ZN?=
 =?us-ascii?Q?UHEMaolgMBifFFsZY5GTWImsvsuO0/HHhjpW8+d6WxFtd9aWCZ1ReKvbVnjZ?=
 =?us-ascii?Q?pYlhxG1ThscY3fbjca37ZWLl/vwmoV+tpVVx/AtBSWFpr9svHgnU3YXbXsFs?=
 =?us-ascii?Q?HYcJv9s1qcxpvd14cwPfnfvobOZfLiylhyLhhkx5SzmIHo3AKsUkiZwUE9z8?=
 =?us-ascii?Q?YrrokKItjcsUGUZEz11XnIBeyd7ke7SmzdjmZWVSH4Th9vRsEQRYAX97bQTX?=
 =?us-ascii?Q?bx+aMtNwfetbonnX+69+KbndPUgKo4YYy3ChNqKzL68WDcZJRoblWnlAA3Mh?=
 =?us-ascii?Q?UOS/WQjk91PNSej7jpqKMN6YPiMN/VY1JYJ76DhJTQXF8HcIz7wyG2cLJfss?=
 =?us-ascii?Q?kAsV5ANsr26GcQ6SNSyfifQmE0D7/i/zNOo91lFVFXwD0qYRLd5eyC+6ID2j?=
 =?us-ascii?Q?+In5q5X55wzwJy4OSixEMzPyl15tCs5Q5UsCkNlNYQV/5L0/jbfg6AQ0T6N6?=
 =?us-ascii?Q?7UyDfRk8YWh2Skco3NJg0fZJpQdFWJsVBwSorIyxveMWCNoDOmk6Fy3HpFZV?=
 =?us-ascii?Q?Ar0JaAtg2vawmS7tPd2K6BX4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c795988-9914-4c2f-b5e4-08d9881fb055
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:33.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1AT1hWxBQGgJR3rkYQaSQqnk8x8hiYgF9NmXqO8yS5MaIx3RO+Xt510eRSaIafUYHfNvIjWHjVYaPki25EuUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050100
X-Proofpoint-GUID: zD0E5W48-1otMu4_wtLcu8m02oh7oE8E
X-Proofpoint-ORIG-GUID: zD0E5W48-1otMu4_wtLcu8m02oh7oE8E
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevice with
their QOM paths and virtio type/name.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 27 +++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 113 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

 [Jonah: VirtioInfo member 'type' is now of type string and no longer
  relies on defining a QAPI list of virtio device type enumerations
  to match the VirtIODevice name with qapi_enum_parse().] 

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index bc352a6..d409735 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..d4a88f5
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 4af20c0..a454e2f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3709,6 +3714,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
 
     vdev->listener.commit = virtio_memory_listener_commit;
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3723,6 +3729,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3896,6 +3903,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3906,6 +3915,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        node = g_new0(VirtioInfoList, 1);
+        node->value = g_new(VirtioInfo, 1);
+        node->value->path = g_strdup(dev->canonical_path);
+        node->value->type = g_strdup(vdev->name);
+        QAPI_LIST_PREPEND(list, node->value);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 105b98c..eceaafc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index c356a38..df5662e 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -45,6 +45,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..e871690
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,66 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Information about a given VirtIODevice
+#
+# @path: VirtIO device canonical QOM path.
+#
+# @type: VirtIO device name.
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'VirtioInfo',
+    'data': {
+        'path': 'str',
+        'type': 'str'
+    }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Return a list of all initalized VirtIO devices
+#
+# Returns: list of gathered @VirtioInfo devices
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "x-debug-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#            "type": "virtio-input"
+#        },
+#        {
+#            "path": "/machine/peripheral/crypto0/virtio-backend",
+#            "type": "virtio-crypto"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#            "type": "virtio-scsi"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "type": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "type": "virtio-serial"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d..b2cf0628 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1



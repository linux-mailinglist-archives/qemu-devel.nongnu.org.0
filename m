Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D5340ABA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:55:56 +0100 (CET)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvwB-0006XI-5s
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXx-00041p-G6; Thu, 18 Mar 2021 12:30:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXq-0008DC-9Q; Thu, 18 Mar 2021 12:30:53 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGTgB7085827;
 Thu, 18 Mar 2021 16:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=zwS/DXX3103PjOuEw/S9ARUnCM7ShEqFN/zRCKhjRvY=;
 b=kazpiSAGWLYqd3XOLuhJXCM2o0oJrL9itdVPsLSbZgSXBiYKtpVGToyH8lEI4ortwV4a
 s6GELWN8o4yjL6a5lIkCzNf3CtfG9LTv+R3Gsw5FnvpC9izE/agrQgzStmhwcScC6nU9
 89XRvQyGqXGBu+rIH1pl30TDoUSL7spGXxClUgxoyQK0i00AePalBrLrBum7KCG4XElw
 eU4HkPC2J83zUpjsCwmSUJrLk1Z6bAL8sIhLn0GcyHNKg0JAGlwB4lZcmaW8RJ7U+QTd
 3iJmOqq92B0/Ap5ByiGWGX97+Fzu8dwAOAyUntiib7A5etsqqKO+IUQ4XQr+5e6tkm7a 2w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 378p1p03ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGUAvB053881;
 Thu, 18 Mar 2021 16:30:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 3797b352yq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhpQ+b5Uh9kDvnSY8Xwu4/nMeASlALKuZwDjkmL1sZXQvbkhEVUC1ok6jpdfURFKVELQVbImvVJV1y0Q9vn7E00Q+t+m+Qmr876Nqdm7EwXnAtdy/2pwWZYOrtKApTBXhTzdQ41bn+swrPOIUlqZljhwcQiYx33sL3mLxJTfFShzq793CfIOVT0ozuzTopcvcY9e+M0c7izF9QW3KBJqXhjHPtZdnPkKiESzb+uKPJm+7TT5BPYaAo7M+2l+6+8jqQQ8zYLmN37S3Q3RbwvuUeSHk0i5NHm0w77TXfSp/2JxSWuUlKUk9SayAmJTfIZlJfrQFSCfYr2WbwkYGBVC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwS/DXX3103PjOuEw/S9ARUnCM7ShEqFN/zRCKhjRvY=;
 b=kdMrtWgs4mO+9DLUt22zAWS9q+F/Xypu7/RYPO5FS/MTkFnsXF0QG+sLu9FprKRm84b9JYwozTEi1Nn0hr8Qj0de2h4q3mCuwUa9F1ryieN66z2kFfMuzDitx0AhVBKNTQzFphv+mSf7+Yj8voeM9LEIOeS7fcrAiAvE3IMIM3EETcDSpGWxkBsINNDoR6BVRw9s5Yt7edmPqQv3mdISLzV9Cw+fDRzdRpoxGfGtcapbT2PBT7yUPQQ2wnO5leRMUUdmp2DNNZ+zoOAJFDjp4As8qesBIEy867mIO15SjJzJM5L9a08nBQ7Ce/FHAipon4e7e4MeA8TtouhF09zmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwS/DXX3103PjOuEw/S9ARUnCM7ShEqFN/zRCKhjRvY=;
 b=jdn0yaGqibDGbIewex9gBKOxFKoMM06YmIyUvJn7qjYcNl8MLzrRHWhgD//nkZZwwB8Bo2P7OK7Gly0B0ewlPFDkwH7HIja+2CraAdc6w53Wc2v0UoTOOR8fTDCWG59gfgAbMdw+W76eJow38p3WzMphIEBu+RWWQcnlPM+Qsas=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4565.namprd10.prod.outlook.com (2603:10b6:510:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:07 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:07 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 1/6] qmp: add QMP command x-debug-query-virtio
Date: Thu, 18 Mar 2021 12:29:39 -0400
Message-Id: <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 16:30:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 645b639f-aeb4-47dd-963f-08d8ea2b174d
X-MS-TrafficTypeDiagnostic: PH0PR10MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45657AEC524AF400C0741191E8699@PH0PR10MB4565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:215;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jI0KxncOBjNqpxlkRToB2FSMOyhl0Q7IAv5eHdrs3Is0LITbaMH3O/xd86aeXKGgq6REzd6ZLgAriT+SM0uXvHfemqJe1Wcozw4V05G9GbqaayO7XdAhXLN8JnIBdH/ZUd3w4qxLBwaqd4lyZYgr1QPbNgrB83HhmR5tDlyX2d6hVXy5oOU1+NVL06FN1ASIi1FrfZyR8TiO/SJ5efXXBNmCGwRZteE5B5J4vL9QzrDzkzxtHwWQY1fMssd4qQA7VZ9xpu/ueQFYzDHOhs4xFVUp9v6BLnt2UnyUDNywNq34uGvYgsvNp50fd1h6z/Kvm2FkyVrgWeaTZruwJpzRtJMhR29wzvSGVQ30szzmzrlxdRh3q5e+e3pn4J5mSFpIZkEomxAb4gEdl3zRP3JFbMf8Iq5yuYiZ2EmY1uImHEJXCapQDX75JTa5oCLpv+liKCAyNjx6kSFG4PVUWQ5H8oDhN3LUzeg3txStWp26rEYB6wuUSaPEf3s6OJE86cPQq73pIueXbx897iG2RdDPyn3lrrGT/DfHepUuKoP0Z7aKfivTOEgx9IzPLIEZQ93mwo9RzE2CbD0dewxn30RP6wevYMXO8qiPt26l7wKWk9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(66476007)(66556008)(66946007)(38100700001)(36756003)(186003)(5660300002)(2906002)(478600001)(86362001)(52116002)(7696005)(8936002)(316002)(16526019)(956004)(26005)(7416002)(6666004)(44832011)(83380400001)(2616005)(6916009)(107886003)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZVgeH+6+rwXBjJfW7G0/wD8Nq/eFl3G5B9MDGraHlBprkGAdgQSuC3WlaqVU?=
 =?us-ascii?Q?QRMPZo+p07Be6yyZmaSmhG/6glGpdak0dcl2AzxiVlrQrmskkqyi4NdA3nOO?=
 =?us-ascii?Q?JmcI8yD0DKxPCNFN2Trp/s5w1l1NHj/NkQVFNNcP6rkHNWywCpItKHaqgU6R?=
 =?us-ascii?Q?oKCCROJV3tLQ/D+DNSWDLHuUzhI6OkfcOZ89rL/1Wc3gMoofx4oibyOQgnph?=
 =?us-ascii?Q?ab8HxOXaxiWHMUpoyuNyQJHWdIhVw3no5QegOEL5JyulW8VkNup1m71eZhKV?=
 =?us-ascii?Q?8nmBSF5YwtwkFfi8dvWBqQaAbyWAyf4BuWy48Xrf7o/EwCL+LozpFfcfP8GC?=
 =?us-ascii?Q?AZ8IMAH47yF36lXBcYMtk6gpQCi9EvHY9EMSOWOfm24ZGNnamsqNqvY1wuls?=
 =?us-ascii?Q?QYQwiWuT9y+ExPdTCAMVJ+dtE1p3Yz8eD5KEicKDxizYrpiscRaF9v5m6Eay?=
 =?us-ascii?Q?XNFg29hMdVUmSGxUIpPYOZ6p+y/DEuf9UWJ9LkEN4D1TltY6xB7/W2PWsYfo?=
 =?us-ascii?Q?BJpVcAB/aYjOV7dWooWpEx9WNUvhsuG2onDly4UKq4R2/IxLlcj5dhQjmhM/?=
 =?us-ascii?Q?IXHxG1DO+DmbRfGO6TBVtKB8Pho42+7M/dA91gQAdvhsL3rWSWYPMaIpBy3I?=
 =?us-ascii?Q?kq7j0b1BI7m7VnA6SmK3/DMV+3BVrHmBE4QM+3hg1vGNDIloMmHP1i08csMl?=
 =?us-ascii?Q?AAxIsSH0aPgwGgthNbLbR8LmhebMpLnx5PwAHzksB2Qw/QvlhyxwvSNzj7e1?=
 =?us-ascii?Q?Q5iYocBGz4hhymE6wwtT71t81gelxzmTqOOE4VMZZuQz9Hhb6VSxzI4zWy6K?=
 =?us-ascii?Q?1os9S+g42ABDLf82FzXhUlLa4Ojs5/4a7vErKK2q+DenMpUtXyPrU5CYZXa6?=
 =?us-ascii?Q?fHcagZEiDB8HJsmhTH67QykelJDHwHX7OSthF4JUPFz9JRHgNY+o/VERmV45?=
 =?us-ascii?Q?5NKKAJR/HZ+id5a1Qxqj/P1uCui6ioJ5B6mVOKhpYoiJQRZmpc/Bc8kOiVzo?=
 =?us-ascii?Q?Y8AUc+mk1vOPeK4kldA9cIBXxUupspmu76dXP/AGhXpYxbCD2JyujugaK2d/?=
 =?us-ascii?Q?O9DvqK3x62dy1i+4SBVD0DTy6ly/BmeMf9zn5TPcB43Mdn5vvwhpKbO0uAMN?=
 =?us-ascii?Q?EqtnEgeOphHPJFeqS5+ITbQKd2ZlevKd1b8lndSmkg3qdQBITX4W0Ex3St0i?=
 =?us-ascii?Q?OjNepwQgS4tJPqZ/mu+3VNh5jMdFsD68iBf0BW0gra52MlTG9QRofHt4IMMI?=
 =?us-ascii?Q?a9pcDgcAC5bwgNp2ZWryA0djVOCC8sLl2ciwOvp28rpYZnHJHslrkxc891US?=
 =?us-ascii?Q?YuMXjuSOdBcnQCLoVRzxY823?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645b639f-aeb4-47dd-963f-08d8ea2b174d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:06.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HJFfuZxZG8gP3Gl1j/dNY8d8n20gDpjGC8zhkPl6fBQUzcq2OXAPSBcwWKgbrho7YyvrYnZOfeu5H2xf+KfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=jonah.palmer@oracle.com; helo=userp2120.oracle.com
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevice with
their path and virtio type

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 28 +++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 116 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc..81dc4c9 100644
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
index 1fd1917..0e12561 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "cpu.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
@@ -30,6 +32,8 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3673,6 +3677,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
 
     vdev->listener.commit = virtio_memory_listener_commit;
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3687,6 +3692,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3844,6 +3850,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3854,6 +3862,26 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
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
+        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
+                                            VIRTIO_TYPE_UNKNOWN, NULL);
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a..2470e09 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -108,6 +108,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index 0652569..1ffad95 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -43,6 +43,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 3441c9a..ed000ea 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -90,5 +90,6 @@
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
+{ 'include': 'virtio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..0fbe542
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+##
+# = Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 6.0
+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
+            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
+            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
+            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
+}
+
+##
+# @VirtioInfo:
+#
+# Information about a given VirtIODevice
+#
+# @path: VirtIO device canonical path.
+#
+# @type: VirtIO device type.
+#
+# Since: 6.0
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': {
+    'path': 'str',
+    'type': 'VirtioType'
+  }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Return the list of all VirtIO devices
+#
+# Returns: list of @VirtioInfo
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "x-debug-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
+#            "type": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "type": "virtio-serial"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "type": "virtio-blk"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 1c7186e..8f0ae20 100644
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



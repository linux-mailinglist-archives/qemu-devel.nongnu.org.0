Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B894B0B15
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:43:57 +0100 (CET)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6vc-0000YE-HN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bx-0000kO-Ii; Thu, 10 Feb 2022 05:23:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bt-0000vc-CD; Thu, 10 Feb 2022 05:23:35 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A8nYZP013354; 
 Thu, 10 Feb 2022 10:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=VamJNEfyhwrr0aWodf9MIZUnI/sZRbIb5rj6dtei9wo=;
 b=ei9nfyXK3NNDawfEFXisuoivOCtfCUuqQGHlscKr29KJ3k2al8duCF6ZYOvdlp5t/thb
 Owl4NErT7jQKSmDinJ4x2t4V3NzpMnPigC1e8uyniVpBoyZ62j5lX+YE/JpkKLydVHbi
 gfUbjtlyiHWIgxqffcvrfbrZ+Y41hoXWG7P7kGhyWIdLtNGpcoPn2mGVHPP19g1Girq8
 wZCWsp15tC/tAefFpKPsywpWXlzUNMFjCDgMxPCcuRO9VNiRV5zWYjKKg4I1u9VzstUR
 jXxJA1WrMWqCDut+itGpwAv4NuLV3gC03beaRR6X6sTU+6TkVkhdnD4C8ky6tyhcMv9D eA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e368u0q6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AABsw6130660;
 Thu, 10 Feb 2022 10:23:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by userp3030.oracle.com with ESMTP id 3e1ec4jdfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiGp+7k4mTfMxePezLQSZw+zAzFPgAXVy2PtXP680wZ58wZXcSEQoraA0lkYsEXoYUUViHPjPgpVM5+1oH8/epVZt6V4ba3MWD5/rd8otN1mK0kTvs0mnUS1R68WbKOOyozFdI3IhYw7RiGUPKsnVyPfe83GVcrtk/oRFsJuR8shaPoyAG1ofgh/CTYwp+74IHYcYThkgxflUWnhiLbxNnGrUBHhqhxgaOCAVGqOq7PwVZSSRFrpcjmZZciEbBMkd6P6x6EHj+fgmdiI8t5bPVpBSnJ6ZTNJbz9ycud+SkglazTvCO2gfXaPnel6YcWuxoDWqXv25h/iasshue4G9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VamJNEfyhwrr0aWodf9MIZUnI/sZRbIb5rj6dtei9wo=;
 b=OkLus5O96r+FkjS8UYfM5NtS+mh9YN70XpFPl6+yvFUvd6SMlcUC4Lv2IrvJDuj/QxzPcufMQ/epRQlWuwSoR/HCtjE82MoGnQ5QvZyED1hjYxBO3K2AggAdrjppRJbD8eltoiUtltPQz7NClhkKrIRwMNZVarzLkKDuddITpQLYUNLawKK5wC9xb03kRVyllEow4mridQn9mWXOoUr6joSyqYws3QpFxu/PFr0vxqGd1e2QmRf3dAr9tFzH6JdWbX7OBTheJzvFZNsYO7c9NLyrai/THE21zAbHvvCjj4yxONDVYPsHoUsrKtuUEmp5koKM6tDRfrWq8EMOW4nc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VamJNEfyhwrr0aWodf9MIZUnI/sZRbIb5rj6dtei9wo=;
 b=Dq1+am4gNfSVNmNhG4VnvNP2lExEx3TKvSkf1x09I4c/RLlmReLkjkCWld2aAulWh4v0MabaK/e5x2UmlfV0VkgvEtv61OyhfwNQshgzXjwtFzX7Ww2QHz02T+J5R6eFixpmT9AV1/+iNXTLi0EpTOoQ5ZQucCbsuJ+DTGBFTnY=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB3513.namprd10.prod.outlook.com (2603:10b6:5:17b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 10:23:11 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:23:11 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 7/8] qmp: add QMP command x-query-virtio-queue-element
Date: Thu, 10 Feb 2022 05:21:59 -0500
Message-Id: <1644488520-21604-8-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d75679bd-4f59-4f89-a79c-08d9ec7f56ff
X-MS-TrafficTypeDiagnostic: DM6PR10MB3513:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB35131FB29D3511C50BE06352E82F9@DM6PR10MB3513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAYr0fUIvq0PKDMn99oAMMdcJg9G24gX3lryVUK5fUfC4r0yVkv9Wf5wFksc2zCHfKXTtDCxqIQsHZVUr0C2Nhq+rLc/y4WY2ozUJcouA4bYyrbm2NXjSvszHyDnPXuZ21wLupspimB5Wsq1SLA0eWHWeReIUWz74TL0/wgI5ZQ2f+S0y3DIss5qfnxGPoXEoS2b/MimCG9lLMzWJ3sJFKglO89km6Y/dpQCL6oUWS4PyemM/LGsfk11qPLrT/OMsV38YpYRA5u0+fKoBuYqhELYtzGB6aa5o8JHyI0cLqSnVMs5dISPh5Yg+Mx9wl1Et562McwmPUZyurVdFKcKI39wtelbQtFXFgvWS8Qqv4NI7BCHGz17oSoqA27JJJJVNxecNf93IkvTZoXbhdQU0+ermL275fRRR0uqMwjvZteifGBvUDscokTfgpjQGld2RcBJmrZrNLs0ZxCFEhcTx7l+riHRdIKqY9V6o2ZNsyj6wMs+zipqyMZ7WwGZEqHKbY2d7xzqIeeTbsYZueuhK4r9kbDO+gzfQKrY8foeSp+dZ8ditdwEZU9rJwmS0xMzrX/Uw6wlGWzJ9ovG315fwroP7e/doiphggv3hAYUh210HpKV9/KROFQlBsADMNponq9CwDFAmmt2mc2GWG/oA5n7QfVLKgYSH5uNZ76929sgHTxoyN1hdgaTqw9uXksTaDudXazNMfPrL38Gt5cvZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(6666004)(508600001)(44832011)(86362001)(8936002)(8676002)(66476007)(66556008)(66946007)(6486002)(7416002)(83380400001)(5660300002)(316002)(6506007)(38350700002)(2616005)(36756003)(38100700002)(6512007)(52116002)(186003)(6916009)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pl1+54THeRmzHAEi7TAbxn0RDVDS8r57Gesf2TSsrgX8ay+cgHLVH9RdHFaH?=
 =?us-ascii?Q?10+5etv2CnhHKm8RqDVTQ4VB1i/MAjffxhHxEUvzctJw4eO9xjuLHELv9cQF?=
 =?us-ascii?Q?zg1kLo7eF4rbqVCQ/Kp5eNuivPkhn5UfO09A0AAccOeoLli0RJFz4bsQeDbt?=
 =?us-ascii?Q?B2KTMDZ1Y07lZla0vPcUhLpDJXiJE/NJjNIOgj6jEdGlKM0XDea9yxmnKtdM?=
 =?us-ascii?Q?UZlUQMb3N9GLmS9obKQvaD677NA509ypCTMkQlg/yFN9JerlWQcyFrFQv70W?=
 =?us-ascii?Q?0wRznaDSJQk/fea32OR/zPxvbExkDqTIA9OQfDf/K1n9kpszaTpZSqR56D5A?=
 =?us-ascii?Q?zNjrW2AYVFRfGVpHW/JWgzHi2nN9vTtQ+mLWLXfgRtyfZ2gwm1+20YAWAV5O?=
 =?us-ascii?Q?6NlKFwRNTs7fWHPp9I3mIkD84NAN4vi0tVl2On8k7noQYA1rC/xIWDUrdXcB?=
 =?us-ascii?Q?EWqfeTpExnN9bhIepw0ovqMXGOwNgJv3oTJ7n2vcumlegkYmfkuR0dS4TyT3?=
 =?us-ascii?Q?ktwhZywrmFVZuEYIbr2TA6q2AZy3RswThvsEXXlbQ26AxXvVsaXFjB6JtLLs?=
 =?us-ascii?Q?asKxMFIHRznO+dGd0EY84jT1hOm04HkNqEefmRqr8hxjlUTaC0YF/I/Hqpqq?=
 =?us-ascii?Q?Mv8Kwm0zDkn38SY0nMQXBo7O3g+t4dil+baFTZWV5SBotjpSm41c/PB8fkeN?=
 =?us-ascii?Q?CKEkM60EYjwsQJ09jwzjvYGuWNpr82Redxo131B/EZVHZe/I8vbmgXSUHW97?=
 =?us-ascii?Q?loykbcfehAIE+i3554fa8rJHnbvmGccpqzwvtuQXYhcLCSU9v8OPTp2gqblD?=
 =?us-ascii?Q?5Oqj16EosNcemjm/G3R7ozApWMyKI3xmaabB/aipL8UYlY099JCrtLCvlueb?=
 =?us-ascii?Q?bQBFzo7jA6YqT4Wq2KbV7Mp2evNz2iUw293dRw0YvZCSV0NqwEDDZQ331myz?=
 =?us-ascii?Q?otHFfL8qT1zxS6ldw3r7a3kL0JmTeqHXQgDtVJRLbgh3v1m+8VfWuK0iY1NO?=
 =?us-ascii?Q?XJ16qMQdGGXyijc6jPbPvaYYi0jO7B1f0Eq58tAVQrom4olwtZb/qNRkMcQp?=
 =?us-ascii?Q?dVehPAcaZJtpNEAB4QkoYzJFyJP+Mj9Ye7vNGPE1CAVktL3ZkYEdHxjzaCQy?=
 =?us-ascii?Q?FSFOl8HakxVU4KIADXMdSgbqr9yNOG0jXFkUTXoLCv9d7lwiN+o9yuJV+i+p?=
 =?us-ascii?Q?FkuDF7fjchDip6ye4lPeXs1StySqr8ksi8rLk72exLJbPDtIQkHlSSO8UTNG?=
 =?us-ascii?Q?WYbD5ec8avnwzaDAKpXQIrJ4roob5mUkvkHQ23JF4NbKcZ1MFCttkplKwfZE?=
 =?us-ascii?Q?sG18lavSVtS/A90Yxt6uXar2CM77mOGfohB9ukW3/y5UsNKI1aveldJTBnbZ?=
 =?us-ascii?Q?MbllMNUjmu1f7JCevDLtXJ7iismiSXYno+RtL6fwIwYny4iC1mWjTM8OY//S?=
 =?us-ascii?Q?F0+9ieqUdoGmR8DflBV6XS8HV6639jiUa8Jeiv9WlZA4TaYpwJNzQLIkmx0n?=
 =?us-ascii?Q?22BtWzbSjsFPjFDlh6AyoQ+Sw09s+EwEsS2YYbyIz4WKNn2IjqAAuBarHgyc?=
 =?us-ascii?Q?kcmHYuJFlBEN75ANpCYyUEXes2jrsM6N8Na4J698iPN1LLaAiIobzujacGs9?=
 =?us-ascii?Q?IyP/2xhzWgKA8PwtoqSxbK4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75679bd-4f59-4f89-a79c-08d9ec7f56ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:23:11.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CC3dKEQn0LwsB5hcEn9YLG+gmC8d7n1czY6nodz1drQQ4PX/rs1nBdTkpMrvtuzauqMpDEBs+eXpwk/5Khv1wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: 9468DxILuu4BCjWf5SbqumZdoi7xsbd2
X-Proofpoint-GUID: 9468DxILuu4BCjWf5SbqumZdoi7xsbd2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

This new command shows the information of a VirtQueue element.

[Note: Up until v10 of this patch series, virtio.json had many (15+)
 enums defined (e.g. decoded device features, statuses, etc.). In v10
 most of these enums were removed and replaced with string literals.
 By doing this we get (1) simpler schema, (2) smaller generated code,
 and (3) less maintenance burden for when new things are added (e.g.
 devices, device features, etc.).]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 +++
 hw/virtio/virtio.c      | 154 ++++++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 13e5f93..7ddb22c 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index c81210b..ec37235 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -489,6 +489,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4416,6 +4429,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     return status;
 }
 
+static strList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    strList *list = NULL;
+    strList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        const char *value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, "next" },
+        { VRING_DESC_F_WRITE, "write" },
+        { VRING_DESC_F_INDIRECT, "indirect" },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, "avail" },
+        { 1 << VRING_PACKED_DESC_F_USED, "used" },
+        { 0, "" }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(strList));
+        node->value = g_strdup(map[i].value);
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc; int ndescs;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->name = g_strdup(vdev->name);
+        element->index = head;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+        ndescs = 0;
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 44cc05c..bb93d6d 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -656,3 +656,186 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the vring descriptor area
+#
+# @addr: Guest physical address of the descriptor area
+#
+# @len: Length of the descriptor area
+#
+# @flags: List of descriptor flags
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': { 'addr': 'uint64',
+            'len': 'uint32',
+            'flags': [ 'str' ] } }
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail vring (a.k.a. driver area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16',
+            'ring': 'uint16' } }
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used vring (a.k.a. device area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16' } }
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue's VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @index: Index of the element in the queue
+#
+# @descs: List of descriptors (VirtioRingDesc)
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': { 'name': 'str',
+            'index': 'uint32',
+            'descs': [ 'VirtioRingDesc' ],
+            'avail': 'VirtioRingAvail',
+            'used': 'VirtioRingUsed' } }
+
+##
+# @x-query-virtio-queue-element:
+#
+# Return the information about a VirtQueue's VirtQueueElement
+# (default: head of the queue)
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: Index of the element in the queue
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Introspect on virtio-net's VirtQueue 0 at index 5
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#                     "queue": 0,
+#                     "index": 5 }
+#    }
+# <- { "return": {
+#            "index": 5,
+#            "name": "virtio-net",
+#            "descs": [
+#               { "flags": ["write"], "len": 1536, "addr": 5257305600 }
+#            ],
+#            "avail": {
+#               "idx": 256,
+#               "flags": 0,
+#               "ring": 5
+#            },
+#            "used": {
+#               "idx": 13,
+#               "flags": 0
+#            },
+#    }
+#
+# 2. Introspect on virtio-crypto's VirtQueue 1 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "index": 0,
+#            "name": "virtio-crypto",
+#            "descs": [
+#               { "flags": [], "len": 0, "addr": 8080268923184214134 }
+#            ],
+#            "avail": {
+#               "idx": 280,
+#               "flags": 0,
+#               "ring": 0
+#            },
+#            "used": {
+#               "idx": 280,
+#               "flags": 0
+#            }
+#    }
+#
+# 3. Introspect on virtio-scsi's VirtQueue 2 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#                     "queue": 2 }
+#    }
+# <- { "return": {
+#            "index": 19,
+#            "name": "virtio-scsi",
+#            "descs": [
+#               { "flags": ["used", "indirect", "write"], "len": 4099327944,
+#                 "addr": 12055409292258155293 }
+#            ],
+#            "avail": {
+#               "idx": 1147,
+#               "flags": 0,
+#               "ring": 19
+#            },
+#            "used": {
+#               "idx": 280,
+#               "flags": 0
+#            }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1



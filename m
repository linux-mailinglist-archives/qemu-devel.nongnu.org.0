Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A3494FD5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:08:51 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAY7M-0003Zg-76
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:08:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005c6-Q8; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVen-0006bh-Gq; Thu, 20 Jan 2022 06:31:16 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K8LTOf032608; 
 Thu, 20 Jan 2022 11:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=VamJNEfyhwrr0aWodf9MIZUnI/sZRbIb5rj6dtei9wo=;
 b=PlC3S0UGBotzv8Nr9b0FDtQlEsc9wASfhSVhE+3BuSGoJe/jps5LU7e8IFPANj1Ask5Y
 trC2lUzt5eCE8hn0LUnonW8YdDDhlXRvO1BIzTYF57clVYixTcsPKGRRB8Q+tRYjhwCR
 oj0gPa0AFIYp7EayVKSKEq6TvEpfdJmV7azpH5WmoXsr2XJXAmj+DJQa3ResHTOdhec+
 OPkKn9VKrp/xlPleBfcAe4RZMJ4XpfG3QksNMIkDNdpeBUQNH3VxH3/OhBL8l0dL4f4B
 fyghTKuHf0sE05OG4jYNkfvZnK/C/UW65Nl9fXon0eAvWMSVN+XNUCS75i+mbqd8e916 lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q84fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBG8hh069950;
 Thu, 20 Jan 2022 11:30:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3020.oracle.com with ESMTP id 3dkqqs8hvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeeQtqxlj2GW1H3Cm6Z8V1Wu37BSVOUsEoCMnVSTNE8lhYgwf2hzpaGaYREEgqgAwaOjZEx7/h0yMrORnp161l6A54QE2/ITaKwp+S/jtfpdq1OPAh1XCbYR80tPhHjezlh1S8W+8rSQn1vPhUjsBByBJ/aV1NjlzTcz8eCYpa0+Hxa6wr/I8mUKoV+acW1Nf8TQJlDHIUo/cRDMMPepeeEu8eJKlw8GFAJt+pVLIl6Mncig56R824/wiGow/bl72LevklpF9ZStWzUdjW+HJZYfRzJ51aRyxfYBR/VmQQ9kNCGuUEdVDmGsywleudxSTBYtNe6+beRshWWS56WuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VamJNEfyhwrr0aWodf9MIZUnI/sZRbIb5rj6dtei9wo=;
 b=JLI9lccoiA3FP/PksV0OM6WjAMWicqw2+E6WpZ0gx7mDqQhn+unRZ4t8HxPqvlO7KoZfPnYIt5RlRH1cDgbRdvQFsDk86mZSPumyXYayU1qESFMf6RgASub0O3J9DebCUX3uR3CemqabhfexIiSfk+ZLHGcOjocV3dh2z4e9cTe6HVMoyYfYaZTldG/b3sfXQfOU7sKFPjVHehzSmnbCEE7bylteeD4opnSYTku0fXii5CgDp/MhGr/m1QXvzA9rIO6psaMmhkkFhJqYT2NLBtV1BjCLspWIjl+QzsAKAR3NRVl4pjDOuLGqrOKkp4TMUxYqnn4aRvTFEFSr7XeqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VamJNEfyhwrr0aWodf9MIZUnI/sZRbIb5rj6dtei9wo=;
 b=K3eqgIsXfZKIx6J0PpuHyaiL5j/Km+CFoOA0G+CI10dztmnP/rbykTYGzywf83uMguNSUCdmrub7xqfq4r3MQCguUX8s5uCUTlqjA715/dVk7IIN61STTHIR+lX+nJGy5IbfaPIKzrFxcOOmbwA7a1xWah5ckZ+e7RXkrJ4WHuU=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (20.182.107.75) by
 CY4PR10MB1381.namprd10.prod.outlook.com (10.169.254.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Thu, 20 Jan 2022 11:30:22 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:21 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 7/8] qmp: add QMP command x-query-virtio-queue-element
Date: Thu, 20 Jan 2022 06:29:27 -0500
Message-Id: <1642678168-20447-8-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd4b1f31-eae5-4ef1-54a4-08d9dc083e9a
X-MS-TrafficTypeDiagnostic: CY4PR10MB1381:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1381FC75A8635B73E228486CE85A9@CY4PR10MB1381.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gHgijWLcdOrR/8aDe2ZBmLQlIlwXnBtv+OPPS5HCrY2z7ZVJuG1yu8YLQdQrQx5b9FIbVc2/WVqbvKDv10HBTHFXWYnFqmZ91x6KLVINZmt6d4s5Ev1DjQsVzwLo3/clIFJl6y4ferv0KUy67PVxye7J54reOVG5ihSepDm05dkeq5Fc7kN5kp0B/v4z991pbAEqchuBbpHYaFIw8Z0XBIUaFVMWlXINHKtYLiAXVZLEDHFAP6xoclcUwIpUzz311SeGxLLVZ7ikPdJd0MQgE6C7HMWXvXc7xGhQGsKFPd0OnlcCJ5K6otLwWasbMfT08sYMQD9yGT+ipPsBUG7jzxER/mCmXRpQ8AsqDELF/v99oL/m3HrWsShyEH1qePDzOVkB110cjWc+ylNJVozr2E68lLYqqRPZk8672Js9deN2ik86Di4V9vGz/tx8KOWlIGXFqBdYG98e8EIZcS71IFl9VoInJN9l8HuSXMX9OazmjCahdGNRRE+lpsfLi3gjgDP1jaAbZlqVyQWfhDCwpyB26X8fpoS0Hy4KiXLXf5bNzRHD9KsEzP2rrocBtOB1AGrIILMn8156LhTcl9S4Igo+EfHbhRe86Lkx28ocDsYTiHoFd2D+/1mNv6B2JTi9/xy3Qz34UXHyhL8lP8kYG1G5O3XRIcrDuJZMZSHbwzOJZOTnB0TDDASnlRENcL7Gg/yf+sruWjFfiJUkVAaKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(38100700002)(38350700002)(6486002)(2906002)(6916009)(7416002)(83380400001)(8676002)(86362001)(8936002)(4326008)(508600001)(316002)(5660300002)(26005)(186003)(44832011)(6506007)(66946007)(52116002)(66476007)(66556008)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6p/Uc7duO5XiBYvkiyzjym4oSCP9k2lIQjPlf2QoKMPxyTYIOVXqXvAumXsx?=
 =?us-ascii?Q?P+XeR8zBas670tCS+k9goW1Zo+KTE0gdd9vLtFAuKBo7FJimx4S3vvKO/b5I?=
 =?us-ascii?Q?oGXNFEksOOQ67Ihyoi3ccWTfMMtLFbBoLmCXhYK1K8mreVECHGoIYB5D/dpT?=
 =?us-ascii?Q?1pW18f2TU9cRBVS4i2udXzdvHzQAgeqdPVrFWll81h1NXJ6adky+lPZ8neg0?=
 =?us-ascii?Q?q5suJyhzLZhXUptzmew2MdU1c9KHljQwIVjS4j9xYNYYBBx2m5GwzWgMlVOq?=
 =?us-ascii?Q?52O3pji5JQePYdslE/9RuqT0JsEmItgwcrlZE1VI8jO7tByReLGwyeO1nG7r?=
 =?us-ascii?Q?fN7ewbHI+4AJvQzsZHe7pLaK4qfq+McaryE7odqyibOjqjqnqWcI/b5041M9?=
 =?us-ascii?Q?I+QVHCZLX+hGsHBf1zS03e+j/sZVEz8ZZqAF+udhJS9oSlEtS0IR3YWQM3wN?=
 =?us-ascii?Q?N5VXB+fZSvrXqCR4VyW96qBwJHKRw+lf5vnlCZJgKPCcrEnKXd9+wkzD3QqA?=
 =?us-ascii?Q?ov7gFsNNg/7zLR1JTrAfnYyvuvZPw9+HLD5sDe4yn9KmwYW01BrFTxL7B7gU?=
 =?us-ascii?Q?RqegXuUaRdHGhclDw4TyyzePXkWbyKPFtP3Rwt8YmA7sjT2sKGkQKcFwuU+U?=
 =?us-ascii?Q?K+SFS2hzpaZZVcbNlSMTopaGePFdR8Zti31xaAMPOs54DzVj7zrqJiU4qioq?=
 =?us-ascii?Q?Xa2Ky+nddNz90+obE6UQmjrgrSmXjX38GgLRoxOEqn3WjygpGXUUBiMuoaPg?=
 =?us-ascii?Q?3OUAYpu2SZkbJm4o05AHI6dZZ1TDLPiWg1J4KK7xy85QGHVWLlmxX16cyjql?=
 =?us-ascii?Q?5t4AzvMdd7NJlwyNEjv9bhDz6p/nk6OVEqmlnvCG5GtH17d3/+PoRgsahkX/?=
 =?us-ascii?Q?PH0U2O4WsZlb6ZpH99O7NA+JHcDpoXHhaE/+eZzMeM93LzWJ/T1kru605EqG?=
 =?us-ascii?Q?p+0NVW9LlANbkiKd5wfgUdmjYb8JFIIEZFtGLfTbFg0Fx8CS2hafu29iv4qF?=
 =?us-ascii?Q?p7o1ngHLnMLafWy02iAiW1Cc+R/CAx6CyyXv09TsIuTbDxTfnaXAioirIUFW?=
 =?us-ascii?Q?QHqJMubiIxle4gJXqSwqn1J7MnRxILLw7Sf2EVeuGtCw1NoR9bhsWrukn0SX?=
 =?us-ascii?Q?94UWVEdPN7bVWua5eZM9z9uZhan2VPCv28PvanunQyHMZSJyWWwihWkBUxbv?=
 =?us-ascii?Q?VX/bto44NzN89yjAQv1BuJlYeZ3hpqFYz2eQSYS06oEAgD7AQrw8Gklk2w2c?=
 =?us-ascii?Q?ipHgL9W+aLDY35KYrGvyH719ZLYa3P+m75FTVD2zrYudiijS8o9dAwqv0ZRh?=
 =?us-ascii?Q?2aLnDHo1D8hIXqf/CCSQQY6olGMUTJ8xSUZn0bv7FdXnsTM8CR2tejA5Csgd?=
 =?us-ascii?Q?rjfgETA7s1OToSeIT6mE7oUKm127i73ocLtbYRCRkaJ7dAKWiYIJvfehto0u?=
 =?us-ascii?Q?SK0abkYwBqm0rBv+TBHUZoNsHZ7P2MxmxrsDnhnuLHlBlOJBbt14FjH3RWm5?=
 =?us-ascii?Q?NhBujnhf7rQMi8icku580nsSMZBAx3kbawe7fE8WU2IIZPjgdaH1hdWbdF4M?=
 =?us-ascii?Q?Qfg3A34S0tqm5JHs1ku/+KzzM/akceePvewtQzVQtXOnOKqnAjB4phkapf3D?=
 =?us-ascii?Q?Fyqy0Sa8jmzTFqCxR5VmV2E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4b1f31-eae5-4ef1-54a4-08d9dc083e9a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:21.9036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O4h0X0Rsfi7IM9ZyK+YsTQukdFIgv7wgLDIiQsnLnGFfqDRX2/zCJYOO0rnUs/VVVqq80GRV4aERtZaArsapQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1381
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: wEbsK_qydPTIdgyZGov6Chp34p5D-7qe
X-Proofpoint-ORIG-GUID: wEbsK_qydPTIdgyZGov6Chp34p5D-7qe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



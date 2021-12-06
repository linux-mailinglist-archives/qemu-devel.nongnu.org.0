Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388C469643
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:05:07 +0100 (CET)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDg0-0000WF-38
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:05:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMS-0000fM-Mk; Mon, 06 Dec 2021 07:44:55 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMQ-0001zs-2q; Mon, 06 Dec 2021 07:44:52 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6BLavi030765; 
 Mon, 6 Dec 2021 12:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=TGzmnAnKkXhOXkdrt1fwW5UteTxwbdHdKbxjc9UFR18=;
 b=Q1m2d1nxQ+RmUQUIiZ1G4QL4HRKC7PAFINGP9dCOYcPJD2xE3G4XnelW9PrKNawO0yBJ
 9T2seFWbyVjWydKjuFKzDnAYz3Q0N9sRTs0V6vbRyMYUzItMlRuczMRQn4ioVfPE6FtJ
 iFoqyi3XS4ohWVm4oPWMU9kvqYYAe3Lys0LRPAXjgpI9Y5/XqYNfNYHO8PWfKdUZZ5WX
 388pK+laxhujqV9k7Hoy3leczAnnoBeuWMp0qV2qllemi7NsAj8noeQvFSVVuZLGeFLW
 Lb7zVl+V32HjoN9fF70l09Y4adbqiVw5+4XevKQBQvcJqThhPE227Ark6dvXzHO2/l23 Dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cscwc9s63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cec5e084177;
 Mon, 6 Dec 2021 12:44:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by userp3020.oracle.com with ESMTP id 3cr1skys6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cONV4t9gZ18rDns7wrGZio4L6VEd7PLxgFd++DWK5/v+mA1WcTjrgTWkSNT6OX4g+GAi5f8vvQSvb9x7HJPeJp038Wi+wEDu/l+Y6oXx8EADZVXTJc9LGpKn1l61Rrjjgwuhn8V6oGeAMrCMeSeUz/tY0qwFPOtY+6HGFVj9nwIgPbfsm0ezoJ3H/HZBWDVwO3cyo4olwcdO+XqB6C2ta7Zy7+wC8UaUlrv48xTJ78ge/CJVePWyh3Yr6dkv8upJ7pEbHYMfE2WQ2/kjVZYq4F1MmGITuyFauOcL9yhrO3v+Cyi4ORW6TlTDJ/8oGgEwmXoo5VbsYlWoYFmsUi16Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGzmnAnKkXhOXkdrt1fwW5UteTxwbdHdKbxjc9UFR18=;
 b=ANhVVsuk7IeSKIexrjo1oUgRvLey8wJxi0iJl2GV+7nRh0knY1wrIZosn49J8YmWC77InHEWqiJNVnBg/Kcbi8ygqPymnNxr615zo5bFdaZwNM9X5cEAMh/GLnMDndMhGTDruGJgdZICVDiTtzXLUyHvWEiZ9OXAPQ2f1Rm3j/hZrYk+/mgrRgMYAjdswT3e/oBj3F0dZgrAX7esBn7FpxJu14jSiAmUnnWwKs7nUIO1y7kPq/gB0EHhCmNoKUDev7T5CB4nzi2bvM3rMwxqYMgbfDimhLrzcGBOp3VuCnSWbLMhHwHuqoYoSnfkFgDg/4AnR5YGt5/sn2KRfKwloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGzmnAnKkXhOXkdrt1fwW5UteTxwbdHdKbxjc9UFR18=;
 b=eDqnkQO02ZPJffXpqFGF59OAjriihh2v03WvXjDj3l69HE+3qC8ydTdexrlK0JGEFVIMaC4qgYP5AucIHO5TGFIILlo4Z1WqeWw4MQK98BgHy1UTLZTetwKfYyIRL0BkMGrsIt20CuWq65dOnIq0JtKzKNXdcsOfeIHGcqqUThU=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:44:26 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:26 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 7/8] qmp: add QMP command x-query-virtio-queue-element
Date: Mon,  6 Dec 2021 07:43:25 -0500
Message-Id: <1638794606-19631-8-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e892fd-3e80-4670-d47c-08d9b8b62311
X-MS-TrafficTypeDiagnostic: PH0PR10MB4791:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB479125E62D640FEBF62BE556E86D9@PH0PR10MB4791.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnAJrfBMsV9TpuskXfXCP7tZgDnr3O9ECSC0tW8maXh3BV9TOx3T6Dmzjk/QWPjYKQAqSkeLMrLMJyhusfbjq7SuMWgze1+9+1oILrgzhnjk9Xj09trp5rgS20kGrosoWuVY0CAo4rrU9d6WGFnK5F4rq5EYmlqdF3dfzRijUIFguyO80vDDfXsDz9ywjfC/iL3L6m+XlwpK4eS/HQV1ZEb1sRCywliUcqnsbF4kQXyq77mfhiFwh2FGF6bXJ4aisuwYJBcyZ0/mmr5ASbkrnbgt5xYsdUmxITWItyhJ66RIqVd+VuLbiEYr7aTYpYha3hNz52BfPlC+nKUCEx0uowQQgr0syrosfXQS/y7HnynzUffHR34JWWdn1JjGe2MQu5a8JthvcuGzfe2BQdAHBrkwtzM2ml5Yysbe7sPqTJ7RTidruhUM/DNsXD6RXBUOvZa1I1fOPhuSX2g0vuly60s8BJ9s8e4tYBA7MHBPSlPEw5wncw+jBaKdUhq3RuUCp+DzWHPDkfZBBR5VOvGrDldaSCpwmVywD+Xhn726uCefIlJcap9FGYa3mPfJWo1yAkccfMQy/UBX142RVdH53anVvSoKPLwHs/fnSaE+gOjnqrOvkTK5xIs12+fh28g/IqW9HS71JCvl9gvzm2FDxpoqY05XHbzkwQTwIpw/OzvKRYfY5v7Kyo0scFzdr3iW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(66556008)(52116002)(186003)(8936002)(38350700002)(508600001)(6486002)(2616005)(83380400001)(7696005)(36756003)(6916009)(86362001)(38100700002)(66476007)(5660300002)(26005)(316002)(66946007)(4326008)(7416002)(8676002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8IEE9iAbPJ7+LkTu/I2pBf91khOz6nc+TTRBXG11xkhRfEiUCSE3wer6IBUm?=
 =?us-ascii?Q?jSQYMTX1Yy1KlPRpnOK0o38ZAODLxVB1qScpu+9CM43b/4RjvRi7IEJCIFzC?=
 =?us-ascii?Q?i1PXLscxaJwKBGZNtCCvr32dzsKQj5oQq5Ggpr6zWFqrS7/ea4hLMcVAaUqe?=
 =?us-ascii?Q?3D3SOp2d7u5imQIH+sXoKaA7CR0wOyvNeSlDlAy61q00b+W02HA9ku9cvX7X?=
 =?us-ascii?Q?am7oTFra7TMh/SXDytUvJ2vf3LDcFKxefnAPoiI0mi6ff3IeN6xEEO21jkyH?=
 =?us-ascii?Q?J1R3C2kxE3KjTibd7vrdBShZq9YsSbgfryohOzLhSxT2OVZipO5KuUS806O0?=
 =?us-ascii?Q?v9h8QGC98lN6Zkd38XyIFPalve/047Is/x6o+PvuUoe/96kfscQVbJVgGhvG?=
 =?us-ascii?Q?tGGwfMwIkF9+4cNCI52XwAvNdX4FvWmSFYSQ/7tQqy4DNEiL6r+MeqR/o7NB?=
 =?us-ascii?Q?LLnunca/1KbJ++auIO3AwrZkeTWRdtTvJ+k8tmICWnr+6VW8Q5wSVPWwg1lt?=
 =?us-ascii?Q?xfYM3XIowm95vJmaotfn2z1ZAj8sMBfInx/DCsmecHAAGyvDNU6p4tHRsI2Q?=
 =?us-ascii?Q?ocp/NKtC0LRSgK+q316EVN8SatFqRFdCSbDlY4oE3XuJVbn7Gz+MyaDJEegn?=
 =?us-ascii?Q?FkEDWUPIK9QFVsfMX4OoQuX2IpGUqypY7IIuPSfY/pOPF8+OErbXiJj3+1mO?=
 =?us-ascii?Q?30HGB/RTwSEbWVcbyqve+R1t4W1jggZjDOgv5SqiRbDg0Oe1EE4bXH3eecTf?=
 =?us-ascii?Q?fmmBbS/SAm2oEWirGB91mhhDJ/YbSJnvd0nRnZsuqqgiFkAJ0pyZxt2lKeed?=
 =?us-ascii?Q?LclZ5zrElwozihRoOWrfqWZDcANmznycLFJeVcv4bhPsIpxlhYc5E66nhdG6?=
 =?us-ascii?Q?0ucd6woSmf4xTOE22gLvut5H7hqLTK4tFhgSGVe1gBvHDCHvHht3Ivq5cm5p?=
 =?us-ascii?Q?l5bQ7HsgAgZ44TWtPeRjxvp0tRbwF2KZsjhhx2ns00JWI9l3p18aCLW73dy9?=
 =?us-ascii?Q?grQGzIOtWpSWpmIcxz48pUDgxANX5jLKtND7iuOvNfY2Cfy3rDia9BifDlFD?=
 =?us-ascii?Q?bhFC0nhPARpVctcdUeKClzJIneOW7MJRQCF4ZVrgZep3/xlqZ9E8NrSBZo+9?=
 =?us-ascii?Q?4R1mFNVlUShxBcwe6hlw3vil7VqsL/CrC7UiDPadz8ehKknWet0ukJTbVgE/?=
 =?us-ascii?Q?sVAQV8+jJt6fjIpRoGVh6swo+BNofLWtp6NOWWlftTEmhA5cQKZbVOxXs0v7?=
 =?us-ascii?Q?TwUzaTQngTKYLgmNMkqJLPV6PJtmTEDP/z7calxT0pP/L95MQsI1+7pg1/qF?=
 =?us-ascii?Q?mAvwIsjUCjR0+5sBGQok7oV690qJZgjoRX6o5QecexcQo6fK2n8+hY35zRhO?=
 =?us-ascii?Q?UvcCXtbU3d3ReI7Gv+5eXm8nx7sOtDoxVnrzC7UHd5ImpK0qeerqUdbWplfd?=
 =?us-ascii?Q?l4iaaP1Id45Tnsdzy8z4fpPzC0S2VHx/5axUh+C3UA7yPWczAkSIbxWa/ptL?=
 =?us-ascii?Q?OJ9cr0sv3AL/womEwEfKJZEaYrTC/WI33tfM2Z6nepoWu/+V4htqMlAeCvxx?=
 =?us-ascii?Q?WsCJzBpD6KKG1q3xK6OH3E/ptuBUAGFZaxbRwacXjd7ZerzXubqCye19FxQS?=
 =?us-ascii?Q?FuMvtc2HDt6vYhAhFl/KRgo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e892fd-3e80-4670-d47c-08d9b8b62311
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:26.3198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6+kzIw/3KCYIQw4L94Ue/+shYTk1bGXrzxrmIhaUTznW2n6pc0zUXF/3ooFtIDQ3ryDBwtOgl131zbjxkeRoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060078
X-Proofpoint-ORIG-GUID: YJX6uFXwUwppDUyMed24PCYY1lTca9YH
X-Proofpoint-GUID: YJX6uFXwUwppDUyMed24PCYY1lTca9YH
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
index 459bfb2..8c6cc27 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -475,6 +475,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
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
@@ -4381,6 +4394,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
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
index 56e56d2..2984e48 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -654,3 +654,186 @@
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
+# Return the information about a VirtQueue's VirtQueueElement. By
+# default it looks at the head of the queue (if no index is given)
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: Index of the element in the queue
+#
+# Features:
+# @unstable: This command is meant for debugging
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



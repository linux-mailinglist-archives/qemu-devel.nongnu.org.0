Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46B507CE1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:56:14 +0200 (CEST)
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngwlZ-0001xW-Kv
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwjh-0001HA-7i
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:54:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwjf-0004td-0V
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:54:16 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JHlWl0020622; 
 Tue, 19 Apr 2022 20:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=zwPhI+aSY9A8g/pGSugY9jLxWCS4xmeP2Ig6quKEBs4=;
 b=oZmTGkLPXBiUNCqqHVJMPikXg/B8l41giLDbVoT0olHXwd0t8DLgx2uiFVfDuDRVaHyq
 K/wXEp/+t4RER3UQ3VTiCzNbyHABmKogOEbNKHPPWaExrFoD8NmGzBP1wNfTO2ACTDaP
 EeFYYguSTWY0ZtkPu8EAUKtoNVNcbEGjlFqH9Tz/7NNu7hdcOWZ9LQsRRF6WzCR3+u3b
 gilzI4Moelsn8MJeuVPlDQicV3uFd3mZvLlGtQQk5ma1ip1SNP473P+CwSWseN+f7A9c
 WP7xblxJj8feo1ncx8mOjhCLBFxg/p4JR3zAr2teMTyWTFhEadoXPX2rJVpqvW1SVxlO zg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1793v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:11 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKaT5I034856; Tue, 19 Apr 2022 20:45:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88hhn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSm8WFTd/mwI9xtwvvbXxC046WPEo1GhOsaLC1UNngb3LcWxbZBs3Q2MCasVbIrZusuIEECaNpMu02FDbtJcj67Ystiy3yxNw+F4ByhGeWHRqDoZS9I/ujUCbPbbcOXJtGlFTpSDPfs9sxzP/LASqqYUkIlREcXxj0GH4eBHt+j49dPSdMivrYqcoWxKXJijlp5/0DCjWqhBSGCQTX2wGaURDx3slCRgAhgmz9WWEUXtwQ/qfG7bcMtr7pAI9NhrW/8XloK7/qqpXXIRHqYwZhEYv3jBLYlPlyCi4/XUozcP/WrOAzORS0/xdtTZN4OL3YMh8eUcva2WLNI0aK5ICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwPhI+aSY9A8g/pGSugY9jLxWCS4xmeP2Ig6quKEBs4=;
 b=lYj7dlZE3yVp0S0TwBPjqMB8Wl58V0Z7TEfS4l0zJDUObsJAWtnPpVk+fVpPLrsDpbiUmsBhy2pyXqvG/RqTgpeM+d5wJkj6vieTvs59Y/85V3e24gOrTHRvgHfMleHkxrR1g8sVONp6UgwqoKSFo9Gzs1n+Q5M76juTxEb6GFR34XWbrn/JgIu4pPaQLFPdfVP3xpj/GG15t0T6ICNJfWqE9hqBytUCOoZTvX/HqGnV+RG2C+SGOLRyf/X/4l8+V18TqvIwvZ6qw2Yxkq9YFwO+EB6eH6iSjkDcOY5C3CCNoM4JQTvEoOE7apUt/B4XC4P4hoSD30KYyygtIKsP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwPhI+aSY9A8g/pGSugY9jLxWCS4xmeP2Ig6quKEBs4=;
 b=a4XE8O68YDJowN2dAyGw9i8SXfWBWFhSAXR+U79Su40OYRzkBP03olAJTBAKWI6DogmAYJiWPfZRjUSQqSvPHVsR2dhuhIKKVKXrt58bFbdOUhtB7di/+yMCI3ZzR459nzJV6p6e3VXlkF7nLOGfmucdnhfsd/Yv22VkzKP5Lk4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3290.namprd10.prod.outlook.com (2603:10b6:5:1aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:07 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:07 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/17] vfio-user: find and init PCI device
Date: Tue, 19 Apr 2022 16:44:14 -0400
Message-Id: <71aa2e4c486109174172e61428ad0c3c1da2f8bd.1650379269.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 515f5866-9cc6-4cf0-5bfa-08da22457c55
X-MS-TrafficTypeDiagnostic: DM6PR10MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3290932B0867AB7792638AEF90F29@DM6PR10MB3290.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kh3j/0QC8KTWuWFb6LYjQY5K3PvD7r6+IzjYSt0Fv3ie+lRMfsSAlfV02gjSuOueAb8JWtLOWNJa7JTciGkWdiv0wDWAvsoY84rCrgePwjG6Q3GFC/sjjUYKNvztsT+kA7TcMmYcUVWhtkedrRuaxoq2y60StVxwPs7w1Ex/a/cbLKO11ntmdENYYbEiGxYBZ89kwbQ2z0QUtTzA7gK3nPPN9vakJn/T4cHnOpHEvqTaasDSIG96lwMgDWvYSm8Rbf4Tlr551BR+cFXVAsrPcZaXcwPxfo4G8MARBWQnbknu5K41tC2eXhY2e+L5Wr+6rERjMvzNYdIHqLfl8SgAC/BnGctor+VpG3IZldEaNUuMepCI8BaCGgrEVhn1SPs86cra8jDPbQQr/LaZVelAiVBRdGMCSWzEx4+2qe/KgNs2NjYcZ2iXKfOnRWxFK+D67NWN3OPhZYSGlXR44QmOyhHXlIQ1e/Jg+Bv4gvbYtfUEcnsC73UBTFMSDk0V6CMPG8jHnh6fCX2KYgqphX54/moaNH4XIa7SAu73dBHP0y1lU1jNa2ZXly/sy1Hn3vALJxrNMlwRrSurKhA70Wqpmb/RGqPg7Wucdb7rCCaE1vRqurJJ5Myo3n5e24XejKEFWFptXQIMYIgmFTavUmpD2iQNw8sT1XRM6xA5GBmoDfNEYJrCKRb+X4BbQBxEVGIb4EfkWEyL+PCWF9g5Kw7b1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(8936002)(186003)(83380400001)(38100700002)(7416002)(6916009)(2616005)(107886003)(6486002)(36756003)(66946007)(8676002)(66476007)(66556008)(4326008)(52116002)(6512007)(86362001)(508600001)(38350700002)(5660300002)(26005)(316002)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ewmgos3k2kftDyR6X17SnqNOMFwQ0+bCFXcn1Vzefm0NRVFzgZ/HYEOH+cUN?=
 =?us-ascii?Q?YARslQxGhOxeDFphOrlsKCd7Pd/pyNVhdI+UCpCnve/PStTF1ToQdPADNAAg?=
 =?us-ascii?Q?r9r+8nuHKFKqqhm89qFdrvWWhFLXViRwHOvBYXOobXhEVb0fXDkMVMDXhoHt?=
 =?us-ascii?Q?mFGsuoYb60mMXOx+mDl9Z7Gm/runUe2RRahf97f2xdDrkgGliZ1SYREMjyfv?=
 =?us-ascii?Q?nPU/uki3jIHBbyLxFAi1KVJFGMS74QMN3Vb88BWe8Oak7Vt4Gn6TySxL0uC2?=
 =?us-ascii?Q?IdCNOKLZQ/lClJDhHn5zXfUaKoMcVOXRrmTbsaKe11Thmr7GfGUVQSnByBgQ?=
 =?us-ascii?Q?J+aVYldkJBkQt1t63oRjo5mHH9SdNQ218vSCDPiFFa1IGtzN7vnoDGR3MwDw?=
 =?us-ascii?Q?Dg7xujKqzMiYHqpbOhRLGYU8M9ykUeD3+u08g0afRv/912AvD7QlMqKpu0+Z?=
 =?us-ascii?Q?rhpJXpZNYKFNwHWElT0/0irVEcezKEnvmqsV51D4boX/aiLOijd6NxuldB5H?=
 =?us-ascii?Q?bMIhSB4775eH2fd6LLFNHPqrVDypc8Xd4Tpb7QtcEyuIbjSTW3Qq+2x3bukT?=
 =?us-ascii?Q?XTh6H89r3QBBiMga2wrRa6Z16XOcLyYYoHPcUH8E4E8/v33WXDH4W61P8s8O?=
 =?us-ascii?Q?nMunNfqY3yehxXrIlI+uf5pEIovZPgGGJMEi9TruZ+Ressaz6f9MrDnaBa4B?=
 =?us-ascii?Q?E/4g8WbcKZBVsGSKWNxLHCv0VafQ+9ZwTiK/5vBRlF8YGsBFnEeTCnN+r+P2?=
 =?us-ascii?Q?F1w+iK1iN1PrbdgykcPjVOnVJnOYJr1adCeEgE/3qj+D2Y4CnYig7N02Ks5a?=
 =?us-ascii?Q?KW4DoFc1UTjyvXM/06rkwpEjfc7ikIDvNJr2UT8eYslAwoEfq1LkkD9f3CY8?=
 =?us-ascii?Q?z1zTRXsZoeMJw77OngB9/VUOagpuFsQjhjSFcNT8QRMGgeAZwstnlscENVkX?=
 =?us-ascii?Q?R1wMkRCQqHkLJHOs2y34UVunx3ckBqv6+quxxlkqvnq9veVf+qFAtd5/qbFI?=
 =?us-ascii?Q?5ynjO5NyPgsYthiNj5SZCUNEfhIsRVTZsiBWRyUzjB4Y3AC49QuiXvOWa5lj?=
 =?us-ascii?Q?5QxviAvj8S+d69GCU2FnGNJ+iVSKX6ymy2YrSUdywWXa71owgjj+Ur10ZlP/?=
 =?us-ascii?Q?mg9Zunrc+0rCA85sJihQMhj2hc6VJvpb1ZawouFVhMhU+bTklUZ0AjmlMAnT?=
 =?us-ascii?Q?ZNnfM1L9SriIjHpGnqq+Njq+gA3eYYT/927nWQny0o1Tih2NtJ1TanJqRjSd?=
 =?us-ascii?Q?2ZuTLJemjT7TM7rxJ2SAgq3y9MDW0cTQ3PH07ynjqH5eAAnM5Exlkd4rKjIW?=
 =?us-ascii?Q?r1X53Mi6HuOoZDoX4ksZRuYYc2Nl5BGJ2H1r5d1TSnsiXgBTDX612qGyc+At?=
 =?us-ascii?Q?vZlheJdAAw+RO6LfEz6AfiM5u3vlF8+KJnYc9KTMNdo8Jg2kEuk2SY6L5CzX?=
 =?us-ascii?Q?/gZRXJ80OVUNT7GGKSbqlftsgCe6uJ1plBNeaHLqhKP5hQvnaPmZrzk+EauG?=
 =?us-ascii?Q?XKrAmc0al6fkqkYClxWD1nW79SAhEYIUDzeNxEfs9hbAoXkFMeGnJoCUGSWo?=
 =?us-ascii?Q?kL1be39XFtEQz+7pFZvMbvqIa8uGDwo8X7FXmmqPpunhsU6qXgSFRVehKE8J?=
 =?us-ascii?Q?Fcjbc0+q+oZyPhE9LXBDSKrAa+7h5l6F7/gcBI+d3Bl+hIOrBgImNKhpMgCd?=
 =?us-ascii?Q?nIqWXixZ5ANrJJTYxnXu7vssrQDH6iT7kgX6NL6pabibwZmJmb9ZMezPEpXj?=
 =?us-ascii?Q?ZDhL8VI0FYXi2P3CkXSvLKlzcMy5tmM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515f5866-9cc6-4cf0-5bfa-08da22457c55
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:07.3058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1QentomKAG25q3f3NRzfIrl2TyvhNonj70fb1ycst0c+MDsarbYs00tRJoC1BtMZsROsU6QfHUFSRnaft0wLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3290
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: rNi2miQfoHGM68_r7LIqmqy80llLhvQU
X-Proofpoint-GUID: rNi2miQfoHGM68_r7LIqmqy80llLhvQU
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

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index d46acd5b63..15f6fe3a1a 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -81,6 +83,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -182,6 +188,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -200,6 +209,53 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    object_ref(OBJECT(o->pci_dev));
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker,
+               "vfu: %s for %s must be deleted before unplugging",
+               TYPE_VFU_OBJECT, o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+    o->vfu_ctx = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -242,6 +298,17 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1



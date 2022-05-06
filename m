Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B094751D06B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:58:04 +0200 (CEST)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq2V-00071q-QV
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzS-0004sj-G8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzO-0004R7-9x
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2461IxOV025194;
 Fri, 6 May 2022 04:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=i3GtDvST5WvUADyzYseVU+FTa9b/eY1mSb4dPZI3Sj4fTN1r1nRMNXl5fMLZ2H97FJ41
 o4CRlnOiVllD/IT0l/r0c58mcjTB+VJ06nrizlHhkMvCMeaX4FiBoAFb8xXAK1871so+
 F1bO2OgIU79jelVBfPhQn8jLkwB66bXLujS42oiINoEzffP84fTeKITMgeKMlNmnT7V9
 lBnfk0+CuWoB3XtZmgWqQeZFPTs6kUpashj9A85qSK3owQPa9XytdRwRnCQUk+pVuOsf
 6Gpz3NiAeupzdkiN4IPt0qdCoW2UvuEHhc5X6hknoyEm9pFCgrad8DWvRbuiLOineLfA Wg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2n3n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:46 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464ovZV016814; Fri, 6 May 2022 04:54:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj5htmd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9ziVb9Zmovv9T+gul0BlUvfqlDmEJqaO93TOt5rlSDZ6ZXBdcVkEr2IrfZYDfrc6X/DlI1zRJ/oeUhIs1LefmEUdi1qHGbnl532xMErp2hpmfqqNbmevKli5TcxXfpfs9JQ862rFepehuHe3G+1DCs0UEcOdMhJg46HIAROC03OQ/B/lLftccK4VJlyKPWjTf2qHu38boKxHMWbnERw56f2a4lUJPtrItaizVFs43eld8m1vbjYW3fMNZ60xX2bIorjnTFjj6qFNbpgvldZmCP8bF4oKjlG0eyJ5WBJbUjV+rGyhbMVzG3/ONv2worabDdq3EQYuTS+CWBjjgwEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=Z5M6bcZFT7qf3wuOwom8OpDifdMAnUW0Z7firwkFSVtM+2m7Sbj4+D/sCRVYoFeK9O7/tjVnfL4/J34BkCJyQFMikN11qC0VOdfQYj30LT9jbGYyfX6QhPzkPi0iWiyfUU7L6ptHihoOpUR0+uqnbHXoUhc9AzyVONilnHPOTI8cZmB9UEPG6yRJxaR5XWWo+eUGO+NtMaw8bbGiOpwJxc3bg2lR54MY4vVXWN7YtYJZBza9Cj2QGxy3QuvwAmj+965RpNaIToeQcFjSeYQol0d/8Fr4HSnAuS8mHZtAQ6veONR7JhXipbRdlh9kn5taSagihTk2FbNG2eeUpoUBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH8ONQDqwjqYQ4lGiy+B4eQ6Ks2NSI+/jFWft0KaAxI=;
 b=DNIsKhOkfnhAuU0LI2LrrGdZgrcRi8HMmFMDpBeQ2a8s6a8RdO/Se2QQzInIcMo2LMf0ZlDCHD+AtJtSOh4fC3ZGh21xkwpXH2tXAxi7ubsWW4pLQ/TosDCQuT3cR525WBwXVH7daNBYr2cA42NAVmKOQH0ukQ2GFuNF1FMHSLk=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:43 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:43 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 3/6] vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
Date: Thu,  5 May 2022 21:54:31 -0700
Message-Id: <1651812874-31967-4-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404e7a5b-d5e6-453e-1a96-08da2f1c8911
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB141601F22CD7D2999C8D1A04B1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ej5ungwuaqX2HSENpVkagtI27oR9k+Z6WaeGEzmUgy/B+TTPDUizbZQ8oqc0IkOxSrqQIm9MJE9Vx1U7DG7dSKkmjiBfz1/1wImt+2g4r7N8NETcTIwxIYPvfI2g0nClih0uLz0Smvx87898hikoMCBD8JmN2mJAx36+e+6NfARRgAYHCkDyW0Z09bGpeDSVgPUITUjF38+cokXPyjARS/4ZpbUYiosOKzvI2Iu7NrjnPMGPfrDHsNgUDUhNvQHbdaDpttXe9H0sWuiivzJUUMupm1jYXmVzwe2AeiDUStoIlSQt8dRGARyMfMe6NAgF2APAI6uWuCsZ6xtO2bIZCZzQC8arl55K3G+IjKTyHrCZCYlTTqwpMI3txfovwnuMFSTJx+9ngfEcY8p2uG0dRdVJfzzukclO2nN+xQ5ieHfm3CqgtPwcVP0eGEo9BAeZhZzaAqReKu8IkyC85hI5ibLfgaijE6U62wl0nUm10lp3vMGhg1n4JTI/tkcxZNqA94h3PdPrcUuHg/K7O5ptEx8Xqes2cZ7/JA0NxIgVOEekTACkvcAeSM3qR9PDf1LK4S/tf9511sjd6dLcONW5iU2rMcBk/qs2+xeHPWlYpJDgVvmKXePMuF3TYq3IuZU4u5EKiaFkDQYjhgsm7RvcYHEu2f3v/uEfFSR8pQAckI1mBLYrltoT0iXuvNiR4Bt8PJgdqgN/WW5KsQv0BE8Pug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(4744005)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fOqfrFkLlviixC7wGpMCvPyEN+wdDP7L69eoSeLMgl75AaPJsfAZEgxeEOpw?=
 =?us-ascii?Q?CiZOBYYfICQm2s5CAFk+x1RrpYHd/0feRa/EAIxtaXXhs/BbGPjst7fvSyoK?=
 =?us-ascii?Q?MvxQKYYKr8tKhiixbOEaiF7aMqPpjp2pLjdCOS67Obj/h+DyyAQUI7O1ykYL?=
 =?us-ascii?Q?wIOAhQrRooz5eVNDpg1ThggZ1CnVEwsEo2S1uVY1mv2t1hTdQC5yYOInsXFu?=
 =?us-ascii?Q?jpEkBtKzc3Zy+LUGIohtOB/F9VgAAQu2Saw0EAW6v+x7fKi/+4vbhkbEcW7x?=
 =?us-ascii?Q?8ovPJsp0GPPHMoXxygMP+N3pw9k+l5NVUOqvRo0qLH8BrMqWsp0lrLq674ry?=
 =?us-ascii?Q?MDGjO+uTunTjthLmtWcqUAw0KJKJV5/JCtmxtZnwE96KH4O+Q2crM1djBrAl?=
 =?us-ascii?Q?VMw2wUYGRaKY9jt0GRf69nGo2Pte3A0rCB8H85LtW9xgHkNZI99lbDuilfJX?=
 =?us-ascii?Q?71+HGawtCh28EmOjugNncSapYue1usSPgx+PCihjMfUBnShLUPr8kSHaO6KT?=
 =?us-ascii?Q?W5I31UCmlSJKdSqSVJJS6BukyHp+jvWl6TU7qpR6qJ2Oa/1OtAPLCVzk34Dk?=
 =?us-ascii?Q?jMYsX5bcAdSLM5muG76aoUqX0dWMHeB+qaIwkWAGoUFNuWG79yeik4W28lRa?=
 =?us-ascii?Q?3p6xV5UoZsctcWbH14GI4P06EDT+5q1xXV3gWdzT4dG/XGy/WkEfykKJH3Ms?=
 =?us-ascii?Q?FDa4EkZfoyRrLIrndBT8jeQuGisnzLe6kYs5SPpnAunnjFiu5IRSSs0PF82J?=
 =?us-ascii?Q?KdjaHs7VYS3LNM7DM9TvzC0kCU/YTotnjCfZamfZK1nqax75T0v2vkD6cH0E?=
 =?us-ascii?Q?b2TuNz61g7Y1ocj0zx+SJiCljdDwg0QXq1Br/hmAtvm4ymHO+cobwlA2ErTc?=
 =?us-ascii?Q?5eOs5C5aytuOJWTffQ599LKrchZKS5aFtwMWGora1cNogY2SCuzk+I+5mJjR?=
 =?us-ascii?Q?kf2/mgaaJGLJCh2mcOzMsVHoSMDfaSctItrhjWNT8cbClo13PebPA6tlIUyJ?=
 =?us-ascii?Q?2pwUpMcfYRrsJbyUQyWB4Rcm/Wn6XAGOghMdnvJdZ7KVEAf9cfXH/6aHcjce?=
 =?us-ascii?Q?0eyhl5duM8Gg12PMUtl8wliIY2TBStA0RF1I39kdvWdAqN80oOdOoGme42d3?=
 =?us-ascii?Q?twQ3qEkZL8+hjSQaw2RBwQfoaAulkkXA0qVIIF5fvXsoLgJCuHgNmghi1vTG?=
 =?us-ascii?Q?BoeeO8jpN51LpuzsdRolGTh43e0NfGo+KEb0axcSsi590WLdbbufn28ACiZI?=
 =?us-ascii?Q?M+X/2dIgfbiD1VCTaKaAxc9nonxBaJdvMsfE3GkO7baFERCRVvgJhnabYuRm?=
 =?us-ascii?Q?dj6ESMsFpJeUgrY+bBZLDFZYDyc2QfXK6dwJmvcaW1hbeUoKiiOhGvuTf/ng?=
 =?us-ascii?Q?YJKNnZTlL4Zjaro1ykusLO46vE9rJOy/8AlTPx7KwuCe4MosuxH6CBNbpBqt?=
 =?us-ascii?Q?uBtlhTqlLaUtVhTym1uD2eRvbCOPt34t4fmeWuEJdytG8QzTIXUzyjQIIIot?=
 =?us-ascii?Q?u/+gThpcxeHxCiCMVKxA3EwbfS7jHUnBNxy9ffpjRZp8W287Ero6mVGe1n24?=
 =?us-ascii?Q?+Jd18Y22jubgutRLP2XtOWDWt6Oj9VtkvIoimiSzsPAYuIM2kTM7Njnjfp3n?=
 =?us-ascii?Q?Mnfs5Ko7BcVuZmA+TX/bcrosYrChFzfoyrUY9ssBpGGVtz+XB1vT5XNhV19q?=
 =?us-ascii?Q?9y48j4Y64X6jZGSARjA3NQJmICiz3JgJJj1nT7gwyxW62nAE2t8ivfSHByLZ?=
 =?us-ascii?Q?DRXiX/LJQfDRqGqUWFq6m3znjfw8LcE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404e7a5b-d5e6-453e-1a96-08da2f1c8911
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:43.4191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/LfQSpZw0Iq1exhiymB6/VxKQcOj4bWnjmhvD+aGWocb6SrkTok2DJyNodTLRxUG4WS0SM/Ij749QQFsrEyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060023
X-Proofpoint-GUID: EV92WzS2Af2SpGlrqIoXrkYpzb1WuTED
X-Proofpoint-ORIG-GUID: EV92WzS2Af2SpGlrqIoXrkYpzb1WuTED
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... such that no memory leaks on dangling net clients in case of
error.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47..df1e69e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
 err:
     if (i) {
-        qemu_del_net_client(ncs[0]);
+        for (i--; i >= 0; i--) {
+            qemu_del_net_client(ncs[i]);
+        }
     }
     qemu_close(vdpa_device_fd);
 
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5214EEE47
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:38:39 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHU6-0005sT-36
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:38:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGl-0002Up-Cx; Fri, 01 Apr 2022 09:24:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGj-0007Dy-8F; Fri, 01 Apr 2022 09:24:51 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CipW9031586; 
 Fri, 1 Apr 2022 13:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Nw2JrRHPG7GtNUzSHXah9nLyMRWB9ngsf49KU+nJ80g=;
 b=u3/dfqbsoVgE/xCQp6HAMECHflEPXmi3v/LfecWgZn9Bi1bWC5OtdfmZnkmu/i4d/0Et
 15RbOXBGFnfrM3ZkIGRbXBACuP4OWc0qC3f643esOIO+DOr0UkdN0jvObYTqdyJlH63l
 heFgtDrswmkoGWrN4uDuEPGy0GMp6GjCW86v7u/Fc9zkWwzOfBtMJmaa/ZTLADqyHVl/
 MuuseACoMdQnMHLzOFd3dBX5IzEwHe0P+raMhdaMacxajYGQRyddfR24d+lSeAhB989M
 dcAd37GoDKjageqSA0e+r/YF1e0jir2DNvHw8W37/IIrVjUDd/l3htsfACZ7UnmIgAtO Ig== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tes6yh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:38 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DGbeP024187; Fri, 1 Apr 2022 13:24:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s95t9x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvHwelOHC7Gu0YVxLCDrmGuzC8h86kXWrAOEkIVME8sgz+fGFXkiClszqqXvGGWbTyxvzhy9/8lQuP0/t9Ro8Umf4nBd7je0JDBSmRxz37cNBUfPZm7n5urGuordmHR2ZDS/YvYEcOR/mUu86Ok8JWAT3RppjfdJRYt1elPkYO2dfKF5Ceb7EDiFXvaiRbW5bJuPW3OfD7wCfskJwgdCNSBslgfPvPSKlYbjEcyHql9P23VCo0J+CU19Xo0xC7WPs+lFEw2w2jf60IbAtfqlXhW2i6byGgofZIG+lXwlr7tMhAvPiXaEySRvVmG5TvefqENwFXkI+VHnD5v+G53Dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw2JrRHPG7GtNUzSHXah9nLyMRWB9ngsf49KU+nJ80g=;
 b=a2yv1R1UYP2BC7MaY6Nw94ea+NO+dBnNz/kl9tFX3WOxd22/1pNLE+okC0wCO1gee9RHzKCXMsxgkUJyiDZToVpnfog4rtp+b+iaTp/3Yktv554ghsrXLUwhJZqJIGbFmd883WkJw8iMyS7rRlCDmWfsI0E07oejny5RyUH/D1WJplQMbCbI0vsrxFvd6Xr4f/1rTWw2IgKkqSkXc+vOLB7BX7UAhxqBlf46m68HquqGqYgFH9tbdt+wlXY4jg9eOmo7hY4J1m9cfwpXgoRmmmxh9pUOvG9zHjWtZ3a8MWiezDvo4IRIGz88nHRRAeAfNZmrvHaOYSS3VFFAxxBO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw2JrRHPG7GtNUzSHXah9nLyMRWB9ngsf49KU+nJ80g=;
 b=S0XLO1tCFksoyfLBx2+Apg7fDUGYRafirxIBjl8FU0+Ww81aacdNvxomIvS3/57mrv982QCErxRINFBp6XI7h0iBn9lTE2qJ0044u9N0+ZCpwmW/hVlYQmHCCjPPSPIpF8DGCnhhgxPWL5IFoOqrC6UdxLzvUJ9U5NU8yTZ6h3c=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BY5PR10MB4321.namprd10.prod.outlook.com (2603:10b6:a03:202::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 13:24:35 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:35 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 7/8] qmp: add QMP command x-query-virtio-queue-element
Date: Fri,  1 Apr 2022 09:23:24 -0400
Message-Id: <1648819405-25696-8-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62498a39-9747-45ad-8412-08da13e2f6f5
X-MS-TrafficTypeDiagnostic: BY5PR10MB4321:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB432189E72633C8A9F214EDD4E8E09@BY5PR10MB4321.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rVvZcT0GKC4GC/LyPutQ+ZEoFngEXj2p42C/hBhIN6tQ4wueHkslmYgDx4EshWYaWH8Lq5B8TPp/Vg301czyJ+2KBV6hEFQNnUhjyLPvgdYLnlMN9GqNIXWtL7R1D2679GfsRc2jLsgHB3w5VJekrMKhvV6PjP7lERBW2/j3iDqAwZEC4a7z+hI/IsokDjy6PdIFOQdKIBcIMQ3iHcj6pxllM6zddHGGfEfpRzPKaLNCOoXl6nlLeCyuKWR6bTSZW2tExmCtWGh5HZrccPq+pI7RKUf/i18q2UxEwp6DTQwt0cX5+6VCIwE8iyqKG+DgtFWBJc06Enwbf220O17LAABnD5E3g9QCyquO4CbznuPzkke+BkIZM9TZiJvPyIxl7NdLv1ijBxRwHhNeD74KKAB9ZIHuWp7ou2RbnFt0jPrsVTyvSR8jEvaD8SlEXYooL1isVEeKrmaIaNdiSRIk3/7zcmVg5AnEf1MqXpnIq7KwWB74KGKruk0DbTtl47VA7N3UPg/QWFXneKEVTeGhp6uhQuZS7MitDv1Ve9DbAvUo/gtfo+lJQKadRz0dOEemj2rVbZkFWrShwY69a/jQcXMwiLT2zOTZCqXZZ8JunI1H3pwxQOBIp7jy2g9J8QpMlAY730Fjd8Lv4EvRX5ABkZ//G8u0fw4ELW4Q2SG8CuybkD7DBcsiW3qHs6Q1G3IZ6+ZyblKhfxkSeZneP/pug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(44832011)(6666004)(5660300002)(6486002)(6512007)(8676002)(52116002)(86362001)(8936002)(508600001)(66946007)(4326008)(66476007)(66556008)(83380400001)(26005)(316002)(7416002)(186003)(6916009)(36756003)(2906002)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O0EIFTMxoopbNncOz1flG6ntUwuimvyqQ18tiTgfmFSvlWJSB6s6aagWRvFX?=
 =?us-ascii?Q?MgjEB/cGJQ3o/3O/kFaNAbPhR+RJAJ0KN33fD+a3QBmpLOB0nvL1lu+/b2Qf?=
 =?us-ascii?Q?eAYEkqrLouPgi6Nqckeqkz415HI5key2ugp6P/9NqJwxn3UfIFxP2v2mfOk3?=
 =?us-ascii?Q?n1zht8QVGLqR75jrwfQbrfmAY4ZfnjZjF7j3U0qcKJ15b8jsLz4EYdnZCMVx?=
 =?us-ascii?Q?Sx6Li0+YFrkqrnd7xehXh/M2VfsNnGzT9sfMf+AxTiIhspCQzlbAhNnk5mej?=
 =?us-ascii?Q?F5672l5ACsyMAycMfbuzm4o4Yv7AHYew5vGskMdEAusHURKMQ2Jmay+gFy5g?=
 =?us-ascii?Q?UKyVFS1szalSF3c4PxeMqiyGO0W1cVEyDdZ6GMmOpOtg7w8M652UUxJngaWc?=
 =?us-ascii?Q?aprvCKXGOpbO4WK/SWqxmb86R0erE0H9JpEYUpRPWBQG5m5N6UYB+bPIkzYU?=
 =?us-ascii?Q?8D/6mBxLQErmFEMly+0dTbXOQUj1YC8fzyg/enqNQ24jQ1CQ8JLhK24210aN?=
 =?us-ascii?Q?g3UmMADu+ojfOj+UGdrN0h1ufs/V5NozsmS6ZXcHa/1oSGLpiChgBKQrKrCO?=
 =?us-ascii?Q?EbewQmpfnGyFWOoWs2F8eoy8gRICcfG/nM6kts3gOx+OESsvrpuYWGtcDYmn?=
 =?us-ascii?Q?mpkeTYZRF4ATDL52B0ftXhAF3kr7kHH3aW09O8xYf1uzyAw/HHlYT4QQ7BNy?=
 =?us-ascii?Q?eLUVCzCYwIi7t+aRoHqiEon8qiG39ozqdwK+sVjhEHgcuuXIvBdACeXNBlZE?=
 =?us-ascii?Q?ly5xnVFWTd6OzLxvkFq5YZloWGkh7DVOulPGHFRWrGKuA7+OmGjA0QfLcui3?=
 =?us-ascii?Q?uT+A6EGyfG2tIKF+iCp4efzEKGlA7aRC5lZmxjryMwtoR74wN8otnAWTwQeV?=
 =?us-ascii?Q?6dtTTUIGd+z6ThirHvK2JRKKuqtHWq+QTmDhSvhAY1aLFnaCpaw6XXTNJOrY?=
 =?us-ascii?Q?DplRA739b+7RccyKz9Gsf4H41ow4pVSNYldkjOPu8V+N/b+rkzPZk6mDRT4E?=
 =?us-ascii?Q?wDITYxAkiIsJ8W1+yB7JO0a6R/e2L9Ho/lNTFekcL3E5B/WsKd5sJzehF/++?=
 =?us-ascii?Q?hN++RLTGtJ1rl9WUTIzwwE9BgdhjU1HCI27VXCalZ/zM+d1coeubF6FZRk4+?=
 =?us-ascii?Q?fR4OkS+C7bat5sgQAWkdBiQA15W57jleFp3t0MS9yOtDjqLwSwqyQ6D+neAb?=
 =?us-ascii?Q?M1TMYJNJdJqO3AoegEv8AY7/cIPVxSPeps95ykMjGADgA5BBEZO6h8VB3MRq?=
 =?us-ascii?Q?QfTBKgWY3E+GwyCpcjVRrWJjRh0/3rfqGPpXSS8mqbnAsVcObcWghUS3Ccpa?=
 =?us-ascii?Q?lVkUdYkNoJYOjNTsXaxrerRXUSwEOzJ1K+7BRzmSmR6yOqKT8xi3q+a5nFzd?=
 =?us-ascii?Q?MR7o3R5+SoxuvphDrZZrI3UexcdWwhJ0QiKKFH6qrizElu+K//+Ud7mzoPby?=
 =?us-ascii?Q?CIrNF9VVTFoC2uzoW+HEjHTP+ZqbJ5gOQ64Q3QA86zwxcuBgM878gdaptKA/?=
 =?us-ascii?Q?swnHRMEBo5+NzrihcypS/mujXgwwR+irulmF3cBggDXQLwmUX96sFNAUMOEo?=
 =?us-ascii?Q?OhvzoLRYTATRrha6ruUFC7AWUZOIWgbwGfM/HAjfTB+LcdTayJcmMS+ALjZA?=
 =?us-ascii?Q?L2iKE5vg1uhk0pGVZEvxZdbgOnLE6q++FXsySf1D6IgdznZbE6GI1iLPw1fz?=
 =?us-ascii?Q?/DlG+2Kp3nr6+iKT9JnmYh8bueIzPAbEDIPvA/O5It+OKli4df+Eb51AM4ZZ?=
 =?us-ascii?Q?nCi4Dct7BVp/LMtJ34+H2mgiu08xtUc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62498a39-9747-45ad-8412-08da13e2f6f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:35.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWbsnRGBwezR2BMhGGu0vsOh7sTB49Y2jEmowTKgHu7hUhhhdwlD4RYNMA2nwVJZspJX/Xfit3FhET1LdgRXJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4321
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010062
X-Proofpoint-GUID: 4mzJHGcJaO9d3do-8C83_wNyNPZxMi8L
X-Proofpoint-ORIG-GUID: 4mzJHGcJaO9d3do-8C83_wNyNPZxMi8L
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

This new command shows the information of a VirtQueue element.

[Note: Up until v10 of this patch series, virtio.json had many (15+)
 enums defined (e.g. decoded device features, statuses, etc.). In v10
 most of these enums were removed and replaced with string literals.
 By doing this we get (1) simpler schema, (2) smaller generated code,
 and (3) less maintenance burden for when new things are added (e.g.
 devices, device features, etc.).]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 ++
 hw/virtio/virtio.c      | 154 +++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 183 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 13e5f93652..7ddb22cc5e 100644
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
index 6d718d4fea..8db6b435aa 100644
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
@@ -4419,6 +4432,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
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
index 44cc05ceeb..99b9064902 100644
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
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: Index of the element in the queue
+#         (default: head of the queue)
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
2.35.1



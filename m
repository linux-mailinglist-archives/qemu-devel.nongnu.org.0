Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0575D4950BA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:59:57 +0100 (CET)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYup-0005VM-QK
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005c8-Qe; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVen-0006Vu-MI; Thu, 20 Jan 2022 06:31:18 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K8MnLB032601; 
 Thu, 20 Jan 2022 11:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BUXFREAqAKuRVB7lMR6s0ykbf0NT9PN0zv4rMofMPU0=;
 b=dbwlkUpFGTfxQ6XIgU38QTLJfB+ycgx9v9Uzg0ConG5o4hdjXvLEvSDaHcM05qsRTOmx
 cXrEis5vIOctSUPUNGJB6GvXC2EEeJi+LCtM+imzLM+0gdn0KE46wI+6SfXUlGZQOyNh
 NsGPQehkkSfiTEe8II89uIUIexvERa0eAUFQlPN7HYj/8mgvcdmC57W18WyUYJR1luS+
 wMbZkgBdZ6M9WMBFE24nPtagk8efgIO+RTrlgK+DFXYcLzw2xNC4A9lorhQ1CcdYGNcx
 g00ELhGO9PXhO15yH+ISk/ZBh7KiwdpFP0F7S/AO909HI4acmEGw6Ztk8UvUdnTNCc1g PA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q84f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBGfYk031345;
 Thu, 20 Jan 2022 11:30:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 3dkkd24hb7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYCjGfzD1wCfXVJQ1h3wZKLmXisW+TUwCMVb+56SQAYwdj6oIQuOodYmqVLAzLhaco0caQJNav7v1Z0nIZixdJAKhBK186K5w+akGBawk/Z8RLfmsd6/6NESgJ0s14rEqxpWlE8T+d82bSaCGuXTVmF1FTUwaDUe0/9wFX8hqeNOFjoV2OIPey7tttQEVWbNG06BuEi9Kci6YCkTe5vPZAfalwPnahhdoj85DVz0FpCJ/oVpD8GhU74ZbC47AiOs4N2hoApeBRUuBnUc6DcYzg0E9v2E8lmABQqQH/LVwdGAid2EX5hbFpdLV8qTKugn6lRjpdBKB62n1OCkcLZK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUXFREAqAKuRVB7lMR6s0ykbf0NT9PN0zv4rMofMPU0=;
 b=UvzUbF1ZCqSJEF2m4HqTRpEy8lsR3eQ7wtjczJmUTVyZpk98OVHuJCEsxCwkqdT9A+KDTAbN83cMHq6437iQ/C2hxyw/9oQuvcIVkZEG/HnMgPy/rrDQGSkP+645V9Jke8QbsJcDMxdUpMMpA70kyly0CHyBkVxFxl8H2FI61wJG7oflO7TuMtHfi1mXcBGs62PBlPU+nzeQQWDZYsRw4AUkW22TtnsvrJBs1DAP/ULEBVLP4JPulaUPv5Qdk224YI151o1UKyouGJYiUDcZ9bBqTDYc8PjLhMmddBvaeM6wUFbJcLZtzjIxsJ2X2Juo7R0c29HGJLxshYjXkVxNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUXFREAqAKuRVB7lMR6s0ykbf0NT9PN0zv4rMofMPU0=;
 b=gHXEjNX2kCffLoofWF468EOi8U0vSFcZYZSZC0MUMaCQhN0NkqsruDs4VSHm+ZmD1SjAiSmq8tezk7K5/oHidNzrONv1KnRPdSWcGsR/lekO3CYtFZ5wukFIg+hqHOVLLswfwYZBd+bB3D4/BUxUXvWXi+fbUFJ0FE+H1bow3eU=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BYAPR10MB2648.namprd10.prod.outlook.com (2603:10b6:a02:b3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 11:30:09 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:09 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 1/8] virtio: drop name parameter for virtio_init()
Date: Thu, 20 Jan 2022 06:29:21 -0500
Message-Id: <1642678168-20447-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 447c133b-b86e-48cb-5476-08d9dc0835c9
X-MS-TrafficTypeDiagnostic: BYAPR10MB2648:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB26488D83AF535822115871FEE85A9@BYAPR10MB2648.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVH3tvFS2SYY8PkPH3yC3JKiFMKAT6SEqOXkiDmEaa6aPJYsaL+1Cmw1dgRrp2os2frff0gZdi99VSqyGpHbF+J3U8UVstA7Kvd6jwEmnutfHiF9mS96TA4tZzPnBO5XnCgx+CejsRSVXftIoFfWO7A7Sv3gcfVmQrU0OLaYFyHYqYKl+vL8ZW7EEc/21CxDdMtd3/qHXV3HeBxQtYXcHKC2KI4WGNhUwc39tNQnQhdaWrX1EOguFgVi44DNAh2ThFfQ4+nyrkGX2G3qxcw8OyqY3+YLOnRGbV1/JeiNojLNMskQXdaUVVIKyhZBl01a4mrMIzknsoa5eEBiBV8+CfIEhTIQVfjXS5xaqbdheunRtxV+Nrk0UTkJ6MduVGa5B8/a0Mfhf+HO4Ezth3GOS61kqN3t0HAEHXjdysTbNi7lMvjez9xRtPVeUDCZUvVy/Cab1H9SX96EpFb139IMO/uk3bgxctoYzIFA7iPr/8JyjrEF2O5sWcF7c9OR33E4HR8MAQJqHT/FP0cPGdswY7w2WoKcM189iuI3dipMMtkyfEHPWmyhqArMReyS64t2RSGkljTO+RzMdZn93ufKozTM/fHyFmXn0VesEFUDnmbvT5ZHwgr4BlEEK56APl2nlbTZFTiR9zItLxky8XVb3OzZEFKLHIvM0vlDpm6x9dFTG0yQiQWEO4/xZfUsQrfQaV3UkpPXj/zU6bYAzJzasA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(66556008)(6512007)(6486002)(8936002)(66476007)(6666004)(2616005)(66946007)(44832011)(186003)(316002)(36756003)(7416002)(86362001)(508600001)(38100700002)(26005)(6506007)(6916009)(38350700002)(52116002)(5660300002)(4326008)(83380400001)(30864003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nfKztFs3RSYmb4+itOhLdb5WWZmDPy9FMcOYRhcCvxR5Hpqnqz2KgBKYR38w?=
 =?us-ascii?Q?m7ZMHWcjPCVEnjx+m338PwWQezHrvoPQkgva5qdsakIfCX/uiWpPyAbmo6k8?=
 =?us-ascii?Q?O1RqLfzBm6whHVzoqQsC9BeSOjpWuPaYsdvSHPvT/yLF2Go1Fdq+qYlCBmCU?=
 =?us-ascii?Q?uda3qatyledTmkU8KlVTwFkyCx+asj63DowFbHATji6Aq0SiWDgV42KUU6N5?=
 =?us-ascii?Q?D9Kgbo3NLqQaZhFezCeU7al49i17u1tb0mzxD/R/A9YP0EFp2b2Sxk/XD0yy?=
 =?us-ascii?Q?b2f9R3wRY9mCXbX2lzEMq9ewfftt3fFoqSFNo0oedcWu2PBDbOeITIAlFxO8?=
 =?us-ascii?Q?Uz6W2ts1wYy/fZsDYAhwxe9fJy0Tjvsy7rXzojUS+s7lyp11/t2RYQ7osKGd?=
 =?us-ascii?Q?2DdNZf/9x2B5lLwViNOSQTtFB0+nz7mhWhuR6Bo6LU1A7LGB6OKbSmknM76v?=
 =?us-ascii?Q?3MXuDFsfMx4MZt/cqNMGxCBL1sNtkGKdnhbO+lk/aPPo35hb5LsoqDnHMLz1?=
 =?us-ascii?Q?pRyvjiFjHpl/RM2hTZyopWx271yHQyYksKj6Vn6K+7HtR6ORIzTBYqXv6Pj4?=
 =?us-ascii?Q?nnrsKjejeemIDSKJRraxYftj6HrFCPtX+cddY0xZ8SbhyQRqd4l6kqEkKqlH?=
 =?us-ascii?Q?hKGVEvYeeBL27rpjfWnMoAIlJhXUBz46CmOLONajh29yC+5X7cwDXdiXpjaj?=
 =?us-ascii?Q?/KU0qFmbuf9mkLRaDZ1szXxRBfVus5pKv1X5UD5sggaHfaf/gVW46fL1clRk?=
 =?us-ascii?Q?5SOlFQ8SzFHszGa0z4mNy+dQOhRhxjpb5Yb9LfMFMXhf9/ICpRSISlvN0Y+W?=
 =?us-ascii?Q?+s4nn4ShCLizn5h2xMWAC74BD+Ni+iAm+bM+3dYMijYzA8oO9H616Af3fABu?=
 =?us-ascii?Q?lrDjW0+9oTAFqU9FU+2UrzZ6J8W4URCQYD/UCER71GsNP3JGJAvukXlofHcb?=
 =?us-ascii?Q?lbRIzAZ8wgadBZGvJm+abFeFtxxRLFn4QKkL+lZC7w8EncUKawT7gy26Wp70?=
 =?us-ascii?Q?fSsrlETDMR92WQa60j37N9z1gvBHo/9dQGDFAoizfGoRUYzqmSuAGx1g4exm?=
 =?us-ascii?Q?vbys69vrtfopAhxgpODWp8h0KaI+dUpk0yh25ERn6TBISyElqTr4jgiQdfVi?=
 =?us-ascii?Q?OwNAcvZmvpMjxr9jP+8/yvPGSD+v6TRSsddJ4Mopjv4RUE8V5823HLrt3EFD?=
 =?us-ascii?Q?1QARNBzkK6T8ne/r6ZG9Sfj/qIxYsAHH2L3+ka9Z4cmc103RSORiDTDXFfDn?=
 =?us-ascii?Q?0CBFr281A8DAxP/uD8R2K6e1/IAGy6bgFxgQZzUnnDIF/Uy0t/s9nYNOpjE2?=
 =?us-ascii?Q?QUB1OJcTab1fKpLbwQRaDk1T71QgCZbJIrWpddNPLGPZpFmY9nV7RP2M6wIC?=
 =?us-ascii?Q?hgOjY9XFs+rYjPyT62f7kPpJx4nljmxscdoM5XDnmmY9hMWRAjW4/hNqO+Bt?=
 =?us-ascii?Q?Vp0KcAhcF5+lYvYmnx+8v7sx5lLvu8SSlPpBqhHlj1tSgZ9U5malDz0OxT7w?=
 =?us-ascii?Q?uA5ZEIr4uVERHRDxcO+sEI4LTmfv7oHbBBd4gNXpo+LCN58pVJP15Sn2BMso?=
 =?us-ascii?Q?cAWoEoX2IdBUjEGQjDwg793CaOv2zhJ51gNUkkO+a5urBuhTr0fAzex1t/gg?=
 =?us-ascii?Q?y34cEHaRSPmERKLAMyS91/I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447c133b-b86e-48cb-5476-08d9dc0835c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:07.1277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUdrWmb32lP3n41OdnjRrl3IAyOdofmqt/y4YFbP59K8WQUV2uh4EgorOogVoObbn20opO/7OD3HdFMgv03U4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2648
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: bfCjTeWchH2ECmCyW9jgBmJhW9_25VJt
X-Proofpoint-ORIG-GUID: bfCjTeWchH2ECmCyW9jgBmJhW9_25VJt
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

This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
lets us map between them.

This patch lets us do this and removes the need for the name
parameter in the virtio_init function.

[Jonah: added new virtio IDs to virtio device list from rebase].

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/9pfs/virtio-9p-device.c             |  2 +-
 hw/block/vhost-user-blk.c              |  2 +-
 hw/block/virtio-blk.c                  |  2 +-
 hw/char/virtio-serial-bus.c            |  3 +-
 hw/display/virtio-gpu-base.c           |  2 +-
 hw/input/virtio-input.c                |  3 +-
 hw/net/virtio-net.c                    |  2 +-
 hw/scsi/virtio-scsi.c                  |  3 +-
 hw/virtio/vhost-user-fs.c              |  3 +-
 hw/virtio/vhost-user-i2c.c             |  7 +----
 hw/virtio/vhost-user-rng.c             |  2 +-
 hw/virtio/vhost-user-vsock.c           |  2 +-
 hw/virtio/vhost-vsock-common.c         |  5 ++--
 hw/virtio/vhost-vsock.c                |  2 +-
 hw/virtio/virtio-balloon.c             |  3 +-
 hw/virtio/virtio-crypto.c              |  2 +-
 hw/virtio/virtio-iommu.c               |  3 +-
 hw/virtio/virtio-mem.c                 |  3 +-
 hw/virtio/virtio-pmem.c                |  3 +-
 hw/virtio/virtio-rng.c                 |  2 +-
 hw/virtio/virtio.c                     | 55 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vsock-common.h |  2 +-
 include/hw/virtio/virtio-gpu.h         |  3 +-
 include/hw/virtio/virtio.h             |  4 +--
 24 files changed, 77 insertions(+), 43 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b..5f522e6 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
     }
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
-    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
+    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1a42ae9..e8cb170 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+    virtio_init(vdev, VIRTIO_ID_BLOCK,
                 sizeof(struct virtio_blk_config));
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 82676cd..2e3809d 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1205,7 +1205,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_blk_set_config_size(s, s->host_features);
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
     s->rq = NULL;
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index f01ec21..9f19fd0 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
-    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
-                config_size);
+    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
     qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index fff0fb4..8ba5da4 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -173,7 +173,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     }
 
     g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
-    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
+    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
                 sizeof(struct virtio_gpu_config));
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46..5b5398b 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
     vinput->cfg_size += 8;
     assert(vinput->cfg_size <= sizeof(virtio_input_config));
 
-    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
-                vinput->cfg_size);
+    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
     vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
     vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f..25f494c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3388,7 +3388,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     virtio_net_set_config_size(n, n->host_features);
-    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
+    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 34a968e..2a6141d 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
     int i;
 
-    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
-                sizeof(VirtIOSCSIConfig));
+    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
 
     if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
         s->conf.num_queues = 1;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957..b875640 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
-                sizeof(struct virtio_fs_config));
+    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
     fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632..58fd729 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,11 +14,6 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-/* Remove this once the header is updated in Linux kernel */
-#ifndef VIRTIO_ID_I2C_ADAPTER
-#define VIRTIO_ID_I2C_ADAPTER                34
-#endif
-
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -220,7 +215,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
 
     i2c->vhost_dev.nvqs = 1;
     i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 209ee5b..08bccba 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
     if (!rng->req_vq) {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 52bd682..0f8ff99 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f37712..6146d25 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -220,12 +220,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
-                sizeof(struct virtio_vsock_config));
+    virtio_init(vdev, VIRTIO_ID_VSOCK, sizeof(struct virtio_vsock_config));
 
     /* Receive and transmit queues belong to vhost */
     vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 433d42d..696635b 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 9a4f491..236542f 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -888,8 +888,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
-                virtio_balloon_config_size(s));
+    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb..cca5237 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
+    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
     vcrypto->curr_queues = 1;
     vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) * vcrypto->max_queues);
     for (i = 0; i < vcrypto->max_queues; i++) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index aa9c16a..15b3fa0 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -968,8 +968,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
-    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
-                sizeof(struct virtio_iommu_config));
+    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
     memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 04c223b..e886e5b 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -858,8 +858,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                         vmem->block_size;
     vmem->bitmap = bitmap_new(vmem->bitmap_size);
 
-    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
-                sizeof(struct virtio_mem_config));
+    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
     host_memory_backend_set_mapped(vmem->memdev, true);
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index d1aeb90..8cbbd78 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
-    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
-                sizeof(struct virtio_pmem_config));
+    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
 }
 
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index cc8e9f7..7e12fc0 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
     vrng->quota_remaining = vrng->conf.max_bytes;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index aae72fb..734b7fb 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -132,6 +132,56 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = "virtio-net",
+    [VIRTIO_ID_BLOCK] = "virtio-blk",
+    [VIRTIO_ID_CONSOLE] = "virtio-serial",
+    [VIRTIO_ID_RNG] = "virtio-rng",
+    [VIRTIO_ID_BALLOON] = "virtio-balloon",
+    [VIRTIO_ID_IOMEM] = "virtio-iomem",
+    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
+    [VIRTIO_ID_SCSI] = "virtio-scsi",
+    [VIRTIO_ID_9P] = "virtio-9p",
+    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
+    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
+    [VIRTIO_ID_CAIF] = "virtio-caif",
+    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
+    [VIRTIO_ID_GPU] = "virtio-gpu",
+    [VIRTIO_ID_CLOCK] = "virtio-clk",
+    [VIRTIO_ID_INPUT] = "virtio-input",
+    [VIRTIO_ID_VSOCK] = "vhost-vsock",
+    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
+    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
+    [VIRTIO_ID_PSTORE] = "virtio-pstore",
+    [VIRTIO_ID_IOMMU] = "virtio-iommu",
+    [VIRTIO_ID_MEM] = "virtio-mem",
+    [VIRTIO_ID_SOUND] = "virtio-sound",
+    [VIRTIO_ID_FS] = "virtio-user-fs",
+    [VIRTIO_ID_PMEM] = "virtio-pmem",
+    [VIRTIO_ID_RPMB] = "virtio-rpmb",
+    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
+    [VIRTIO_ID_VIDEO_ENCODER] = "virtio-vid-encoder",
+    [VIRTIO_ID_VIDEO_DECODER] = "virtio-vid-decoder",
+    [VIRTIO_ID_SCMI] = "virtio-scmi",
+    [VIRTIO_ID_NITRO_SEC_MOD] = "virtio-nitro-sec-mod",
+    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
+    [VIRTIO_ID_WATCHDOG] = "virtio-watchdog",
+    [VIRTIO_ID_CAN] = "virtio-can",
+    [VIRTIO_ID_DMABUF] = "virtio-dmabuf",
+    [VIRTIO_ID_PARAM_SERV] = "virtio-param-serv",
+    [VIRTIO_ID_AUDIO_POLICY] = "virtio-audio-pol",
+    [VIRTIO_ID_BT] = "virtio-bluetooth",
+    [VIRTIO_ID_GPIO] = "virtio-gpio"
+};
+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id < G_N_ELEMENTS(virtio_device_names));
+    const char *name = virtio_device_names[device_id];
+    assert(name != NULL);
+    return name;
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
@@ -3209,8 +3259,7 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
     qdev_alias_all_properties(vdev, proxy_obj);
 }
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                 uint16_t device_id, size_t config_size)
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -3239,7 +3288,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
         vdev->vq[i].host_notifier_enabled = false;
     }
 
-    vdev->name = name;
+    vdev->name = virtio_id_to_name(device_id);
     vdev->config_len = config_size;
     if (vdev->config_len) {
         vdev->config = g_malloc0(config_size);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b..076b7ab 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2179b75..afff9e1 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,6 +22,7 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
@@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
-#define VIRTIO_ID_GPU 16
-
 struct virtio_gpu_simple_resource {
     uint32_t resource_id;
     uint32_t width;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f095637..2a0be70 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -165,8 +165,8 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                         uint16_t device_id, size_t config_size);
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
+
 void virtio_cleanup(VirtIODevice *vdev);
 
 void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
-- 
1.8.3.1



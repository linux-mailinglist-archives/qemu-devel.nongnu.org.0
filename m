Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08FE494ED8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:24:29 +0100 (CET)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXQS-0001ry-Cb
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:24:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVeq-0005an-Ft; Thu, 20 Jan 2022 06:31:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVem-0006WE-Pl; Thu, 20 Jan 2022 06:31:11 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K9r3iZ031238; 
 Thu, 20 Jan 2022 11:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wDVVUxehxJjhlBu/bBfauPq7qw3L2r2FYTBkTJ1fk40=;
 b=0GrBOgV1a8IjG4x1n+ByLULiR9vyboDqsW+zhiJKRYJQKs735XNngV2mkSBBeTTPJNfP
 5cVskdb3lcxcmwGqTc90IQjfNgQMLFmSK66yj8fTmWaMH0HlPkEQDtF3UafC0l39pN6z
 +orQUxkPVRncoHe3CBvgtytTvPF5+D/+l+81cvXcyGo74ZSzXHlqSz2vhkHHeTcf1muR
 Caxa+kwlNe4CgYJfAYQpWHXqa/vz74EfLu6/zyU5oJodfWPDHdOtd+O7JFY9QNu5+B5h
 tVcQz7oUTO7KsMq5536Tsy3DAzHTu7s0He09CO/VZlITMuESlHnO8OwPmGQ/vmj24Ebi KA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnbrnyu2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBGfYl031345;
 Thu, 20 Jan 2022 11:30:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 3dkkd24hb7-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TktLttgc2qmB9/sgvonTGLTJXV6WVtKl/BSCYGYxMeNMSwtBw/T8rpW8tT+8iKrDzgWHd18Oi9SRmlC6IC1bh0Qo8D6IOZmgjUZin4aROClS/no/NI6qvoC1eEcyHvyG5sxLCov50cPdMv2cIK1/9fzBoHViDPB9nlMG0fENuVde05xfS33SlKrhkeQxuq5hjJ60vIe9sWp8jR7EZV1d+Ieley1x9w4WljV+QNL80wzeMb3B/Es3ZkQNp6nH4Yw6XweFXtj0udEPv1YaPZ6Vf32kvmIQg8wqVXQQMzYaXbsVOV6eLkyqEXrxORs2dtSqShGgmCgarzjJqP84gvNsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDVVUxehxJjhlBu/bBfauPq7qw3L2r2FYTBkTJ1fk40=;
 b=Pazw0iLa0+JvbPGu9r8ApFoO3ubX+kW39B9tceZxG4Jg1cld8iy12yagJC/fZz7EM6pGFh9cza7s2LvE3JVvR2ql+LKZgkszOnmtCiB4PGwcH4JGOce109smyKcu5vcZdDK/6m8wwiQgYbKoTJcnY6dW8A/z4RJCkk7CUdV26Vk9utt1BTyx1wshmcBtu4wuxX8W8X5LOcCBNUqX1sYn+B/1J2BzWjwzp8ja0/9VkQaMLeC3IoY0ItIo8QmQa/umfZ/8rKh4eztp307uABVpWAJbh1lTouFD+XkAuvFyk1c82fmaOVGPjm8RDwtoJ/p+1H+cBPHiCGIcp6amFxXMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDVVUxehxJjhlBu/bBfauPq7qw3L2r2FYTBkTJ1fk40=;
 b=Dug1CqxHHpBNh5ncw5yPZUXd4mUfiTFj/flMKUDVOBaAt6XVQp1cFOqPA/0yYs0Tbu/0wCxfEYKKciioYuizm1VjDAvKy0pWrbLco/Zo3+XobocxDuK3SAWFz1m62ZOT31PP+wOD9Lok6xvoP9xswMPmVbvJoV18u92V60gmi2U=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BYAPR10MB2648.namprd10.prod.outlook.com (2603:10b6:a02:b3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 11:30:10 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:10 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 2/8] virtio: add vhost support for virtio devices
Date: Thu, 20 Jan 2022 06:29:22 -0500
Message-Id: <1642678168-20447-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 968e3f29-7a2b-4011-eed1-08d9dc083746
X-MS-TrafficTypeDiagnostic: BYAPR10MB2648:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB26486F3E4456F5B095F897B6E85A9@BYAPR10MB2648.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll1ROVqYJYBUutLjWGQ/Qe9nmXLfYbfKGk6v8Tks1Ux7BKzy6N6M7kXKkb8AVhZETD+ePxb3dCTvtyYayI6aEOJrUqc5V8AcAwPw4k4Z19s8I3MzTzsCfFW4V+/wOVk1ROACnD4UGRCodMLc95FdLsTV/vwCbue9b7n8NE6Q1RciEM1FG0d66uIORdXE/MzGF4P72VuuNuVsww5+qGzYHJeBS3X6rSoreXLhGL6waJmRg7IaL7Lv3EIcxquZhzSzuwsadxTe68lvn13U61dBKL3dghTRqODfHi/Gv18WwlhqJmxjIXrmGxGfxxh5atLEXJKveYVYo16f10tfrszMLSb+QdC/2Cn93vP1sRx8fzlhgjoXnGSRhYw4KhCdEC6PpqoXpLakfcRXIMy2XCVq6a2beSjtduR3kRVne6w4m8FQzXyT6Ze7iFChya5+mhPZOXGzO2PosfmeaRkgd50YHzDM/K9qAqXxKYBY9Wfk6RczXsV9PFfaOyDr8+mt17fFwMu+apLfrApqYX4hIp8XHd4E6Vkm9ZK3D3VYEEtxdM+gD/xMJcf8X/azTPBlpaeXWRzf342Rej3WytfEYuRcEWk3QWKnPbybEVbOpCWoh+bEDaFr74FYxLdaef0XG4dHfsX3TscHedaSgkhMzUjLugAvVDlInrfsJUkkhAipRTxeul9iMkPE0R8kP3oNrVc5TYJheirKz1CzqZjBOarfmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(66556008)(6512007)(6486002)(8936002)(66476007)(6666004)(2616005)(66946007)(44832011)(186003)(316002)(36756003)(7416002)(86362001)(508600001)(38100700002)(26005)(6506007)(6916009)(38350700002)(52116002)(5660300002)(4326008)(83380400001)(30864003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8u5ze4A24yQH5Cb3QyeaKlV0vu8RLrgi/4aLgbvphM0P+65kP7hSMKmjtkpe?=
 =?us-ascii?Q?FtthNPAjlxobDsp0yFv1qN8GXXt8hjG2Rqh9JNd9aB4eElkSVI9nksnZBeRa?=
 =?us-ascii?Q?WdE7y3SosY5O7Y6mzbUsn5KGNor4X/tBh9oi2HX5QcEbARNLYV49Jbx0uEVb?=
 =?us-ascii?Q?UuZqRcSsG3WWP+kCD8P1Wwz7t1JSTLkbVJY5F+EZVEkx90Wq6blknymUaI2u?=
 =?us-ascii?Q?2e8EuCGu3xFNBMt5J/saUzbaERv2trd9eLJC1bArM8eb40iQPrZiMpjZP30E?=
 =?us-ascii?Q?GxV4gf6P7SjGLTGNwS88AaDm9HQYa2gRqA4jYrX4tkt96T1YCh+J+rDlokri?=
 =?us-ascii?Q?49HFF00U7gtW2tKu0zXgN8EBQy6zvFPtIOJL67qlcxD/4vUQte5kLhqEcnLI?=
 =?us-ascii?Q?0JBV+4p4FN4NiCmmEt3mXc4dmEuAptaQe3VQbm36cpMUNZ/itaMHWWg1iR0F?=
 =?us-ascii?Q?J+bD6ZOkKj1lb5YIB3wSHMqaCZLS6RK8+O8MVxLoQEHiqE4iPMxveFTu3jr+?=
 =?us-ascii?Q?TujkfN+30UHU3qLz7rNLbxZ8EG8kKKXg1AQy2OtQAqQaghrI67Z86jeSDJCo?=
 =?us-ascii?Q?TByG019TwucXbwjDRFoiNiLZC5+5Q1iFC4p/piIg92Blhiuyc0E3x1Ua5LX6?=
 =?us-ascii?Q?wfmvaIL8QaS8yThE0fDX9UCdKff4EFRMFLg28iuTo2pDBA7NlS3h8MlKu7Ki?=
 =?us-ascii?Q?HCNrtg74zRa8t+ZrVR137eh0W+byAIoOkrvLt9wPdmKhUz2QP1Flenh71a1D?=
 =?us-ascii?Q?U/7W9tqF66Ftj0slLlIOaaKlbJz1rJ2o2yI7yrkLSbpvyMw/3k5HmoY780tR?=
 =?us-ascii?Q?VzKYLrq4L+Df2yu7wI/za0ioMFVp8SA57PPzw3FHkzyYrJNG4M/j/eK9UImA?=
 =?us-ascii?Q?I2z3ryD9g++HvB0d3txioqxxUdZUFgfu/yXNfqK9SSfZzVYaAf7fOx1EL1lu?=
 =?us-ascii?Q?eo7qp9nrtpKQTdkDTDSypphla8gnxf9EfQ9OwtVkP9aA1bjKQrRVe/egirBr?=
 =?us-ascii?Q?ehbs3Y52zgxtR/eBfSFC4yxfcQa0tDEKRZvSyunN5T4R2iIRjAJRgGsxVdVT?=
 =?us-ascii?Q?XHEoO3QjG5YNJ6ato8CKCEmKxrO5LnZ5Vb68/Zt9o29NOj4uwTgiz39mlkhT?=
 =?us-ascii?Q?RB91dehbySIyMuUdHgo/S4vec9yENP/9QUoyX2u12aqH0wFjIl7tdBlv9dQS?=
 =?us-ascii?Q?IArTWDDSrFwngIRzaAmd+2aAHoIgVSZLORFtypwAcaGVGFRTf+JMi0WmoSM0?=
 =?us-ascii?Q?quEc36bMgFjMENXWt6amohEraDi8VRyCJMLcG0HHM7LO3Ej7UzSP8QfSqIS2?=
 =?us-ascii?Q?/wDWoL/lidCficnkh34sb8ODC7iSco/d0aKqnZKstx4FxmKemUXU/9GnknAF?=
 =?us-ascii?Q?iGLI/wqItArdmNpgYc5yzaQmea45xbz8q6PoHO303Y51hPK/xPnmdNM50S39?=
 =?us-ascii?Q?mQn0oSarwPPOGmok95o14XzZtFMYloQjslGL4TfxIcgKRjMTZZSo6ZebM23T?=
 =?us-ascii?Q?kzpt0hQ8OoLDl34Qj7rkkOdVGP9Vhaj/dEi3j/s5aScL1bNGkj1OPLSZT8Au?=
 =?us-ascii?Q?ZEQzxnlrKB0OJzmsaYIsnWRE4WsO+yXaecDAzVrdSnxC+x2kxa6cCo+TDcd6?=
 =?us-ascii?Q?0h9J1yNPRaU6aSs+CIOzfXQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968e3f29-7a2b-4011-eed1-08d9dc083746
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:09.6286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKFraWjQU0X+HBlGY4HAV5YTqH0bprMIyxVeVq8xE8QCRhhp8uBe0rJp5DDiLyD19jPRX32pkzmiHRDmkLRCuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2648
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: 00jGvvbs17CosqtXEIwfK_7LpJM7Kh9c
X-Proofpoint-ORIG-GUID: 00jGvvbs17CosqtXEIwfK_7LpJM7Kh9c
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

This patch adds a get_vhost() callback function for VirtIODevices that
returns the device's corresponding vhost_dev structure, if the vhost
device is running. This patch also adds a vhost_started flag for
VirtIODevices.

Previously, a VirtIODevice wouldn't be able to tell if its corresponding
vhost device was active or not.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/vhost-user-blk.c      |  7 +++++++
 hw/display/vhost-user-gpu.c    |  7 +++++++
 hw/input/vhost-user-input.c    |  7 +++++++
 hw/net/virtio-net.c            |  9 +++++++++
 hw/scsi/vhost-scsi.c           |  8 ++++++++
 hw/virtio/vhost-user-fs.c      |  7 +++++++
 hw/virtio/vhost-user-rng.c     |  7 +++++++
 hw/virtio/vhost-vsock-common.c |  7 +++++++
 hw/virtio/vhost.c              |  4 +++-
 hw/virtio/virtio-crypto.c      | 10 ++++++++++
 hw/virtio/virtio.c             |  1 +
 include/hw/virtio/virtio.h     |  3 +++
 12 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e8cb170..5dca4ea 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -569,6 +569,12 @@ static void vhost_user_blk_instance_init(Object *obj)
                                   "/disk@0,0", DEVICE(obj));
 }
 
+static struct vhost_dev *vhost_user_blk_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    return &s->dev;
+}
+
 static const VMStateDescription vmstate_vhost_user_blk = {
     .name = "vhost-user-blk",
     .minimum_version_id = 1,
@@ -603,6 +609,7 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
+    vdc->get_vhost = vhost_user_blk_get_vhost;
 }
 
 static const TypeInfo vhost_user_blk_info = {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 0981823..96e56c4 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -565,6 +565,12 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
     g->vhost_gpu_fd = -1;
 }
 
+static struct vhost_dev *vhost_user_gpu_get_vhost(VirtIODevice *vdev)
+{
+    VhostUserGPU *g = VHOST_USER_GPU(vdev);
+    return &g->vhost->dev;
+}
+
 static Property vhost_user_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VhostUserGPU, parent_obj.conf),
     DEFINE_PROP_END_OF_LIST(),
@@ -586,6 +592,7 @@ vhost_user_gpu_class_init(ObjectClass *klass, void *data)
     vdc->guest_notifier_pending = vhost_user_gpu_guest_notifier_pending;
     vdc->get_config = vhost_user_gpu_get_config;
     vdc->set_config = vhost_user_gpu_set_config;
+    vdc->get_vhost = vhost_user_gpu_get_vhost;
 
     device_class_set_props(dc, vhost_user_gpu_properties);
 }
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 273e96a..43d2ff3 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -79,6 +79,12 @@ static void vhost_input_set_config(VirtIODevice *vdev,
     virtio_notify_config(vdev);
 }
 
+static struct vhost_dev *vhost_input_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserInput *vhi = VHOST_USER_INPUT(vdev);
+    return &vhi->vhost->dev;
+}
+
 static const VMStateDescription vmstate_vhost_input = {
     .name = "vhost-user-input",
     .unmigratable = 1,
@@ -93,6 +99,7 @@ static void vhost_input_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_vhost_input;
     vdc->get_config = vhost_input_get_config;
     vdc->set_config = vhost_input_set_config;
+    vdc->get_vhost = vhost_input_get_vhost;
     vic->realize = vhost_input_realize;
     vic->change_active = vhost_input_change_active;
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 25f494c..21328dc 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3615,6 +3615,14 @@ static bool dev_unplug_pending(void *opaque)
     return vdc->primary_unplug_pending(dev);
 }
 
+static struct vhost_dev *virtio_net_get_vhost(VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_queue(n->nic);
+    struct vhost_net *net = get_vhost_net(nc->peer);
+    return &net->dev;
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3717,6 +3725,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->get_vhost = virtio_net_get_vhost;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 778f43e..3059068 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -273,6 +273,13 @@ static void vhost_scsi_unrealize(DeviceState *dev)
     virtio_scsi_common_unrealize(dev);
 }
 
+static struct vhost_dev *vhost_scsi_get_vhost(VirtIODevice *vdev)
+{
+    VHostSCSI *s = VHOST_SCSI(vdev);
+    VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
+    return &vsc->dev;
+}
+
 static Property vhost_scsi_properties[] = {
     DEFINE_PROP_STRING("vhostfd", VirtIOSCSICommon, conf.vhostfd),
     DEFINE_PROP_STRING("wwpn", VirtIOSCSICommon, conf.wwpn),
@@ -307,6 +314,7 @@ static void vhost_scsi_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_scsi_common_get_features;
     vdc->set_config = vhost_scsi_common_set_config;
     vdc->set_status = vhost_scsi_set_status;
+    vdc->get_vhost = vhost_scsi_get_vhost;
     fwc->get_dev_path = vhost_scsi_common_get_fw_dev_path;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index b875640..e513e4f 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -276,6 +276,12 @@ static void vuf_device_unrealize(DeviceState *dev)
     fs->vhost_dev.vqs = NULL;
 }
 
+static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    return &fs->vhost_dev;
+}
+
 static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
     .unmigratable = 1,
@@ -313,6 +319,7 @@ static void vuf_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vuf_set_status;
     vdc->guest_notifier_mask = vuf_guest_notifier_mask;
     vdc->guest_notifier_pending = vuf_guest_notifier_pending;
+    vdc->get_vhost = vuf_get_vhost;
 }
 
 static const TypeInfo vuf_info = {
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 08bccba..3a7bf8e 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -247,6 +247,12 @@ static void vu_rng_device_unrealize(DeviceState *dev)
     vhost_user_cleanup(&rng->vhost_user);
 }
 
+static struct vhost_dev *vu_rng_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+    return &rng->vhost_dev;
+}
+
 static const VMStateDescription vu_rng_vmstate = {
     .name = "vhost-user-rng",
     .unmigratable = 1,
@@ -272,6 +278,7 @@ static void vu_rng_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vu_rng_set_status;
     vdc->guest_notifier_mask = vu_rng_guest_notifier_mask;
     vdc->guest_notifier_pending = vu_rng_guest_notifier_pending;
+    vdc->get_vhost = vu_rng_get_vhost;
 }
 
 static const TypeInfo vu_rng_info = {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 6146d25..416daf8 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -254,6 +254,12 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
     virtio_cleanup(vdev);
 }
 
+static struct vhost_dev *vhost_vsock_common_get_vhost(VirtIODevice *vdev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    return &vvc->vhost_dev;
+}
+
 static Property vhost_vsock_common_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSockCommon, seqpacket,
                             ON_OFF_AUTO_AUTO),
@@ -269,6 +275,7 @@ static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
+    vdc->get_vhost = vhost_vsock_common_get_vhost;
 }
 
 static const TypeInfo vhost_vsock_common_info = {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b03efc..34f8c12 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1739,6 +1739,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1811,7 +1812,7 @@ fail_vq:
 
 fail_mem:
 fail_features:
-
+    vdev->vhost_started = false;
     hdev->started = false;
     return r;
 }
@@ -1842,6 +1843,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     }
     vhost_log_put(hdev, true);
     hdev->started = false;
+    vdev->vhost_started = false;
     hdev->vdev = NULL;
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index cca5237..7d63b8c 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -961,6 +961,15 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
+static struct vhost_dev *virtio_crypto_get_vhost(VirtIODevice *vdev)
+{
+    VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
+    CryptoDevBackend *b = vcrypto->cryptodev;
+    CryptoDevBackendClient *cc = b->conf.peers.ccs[0];
+    CryptoDevBackendVhost *vhost_crypto = cryptodev_get_vhost(cc, b, 0);
+    return &vhost_crypto->dev;
+}
+
 static void virtio_crypto_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -977,6 +986,7 @@ static void virtio_crypto_class_init(ObjectClass *klass, void *data)
     vdc->set_status = virtio_crypto_set_status;
     vdc->guest_notifier_mask = virtio_crypto_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_crypto_guest_notifier_pending;
+    vdc->get_vhost = virtio_crypto_get_vhost;
 }
 
 static void virtio_crypto_instance_init(Object *obj)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 734b7fb..7c1b1dd 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3273,6 +3273,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 2a0be70..90e6080 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,6 +22,7 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
+#include "hw/virtio/vhost.h"
 
 /* A guest should never accept this.  It implies negotiation is broken. */
 #define VIRTIO_F_BAD_FEATURE		30
@@ -102,6 +103,7 @@ struct VirtIODevice
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     bool disable_legacy_check;
+    bool vhost_started;
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
@@ -160,6 +162,7 @@ struct VirtioDeviceClass {
     int (*post_load)(VirtIODevice *vdev);
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
+    struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
-- 
1.8.3.1



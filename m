Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D5F47D7FF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:51:21 +0100 (CET)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07dw-00025e-In
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VN-00051t-Pb
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:30 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VM-0008Nw-5B
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:29 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXslg013624; 
 Wed, 22 Dec 2021 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0dqufT9N2lURz11n/Lo9vKP+ln57ilplyhjlPtBAmHM=;
 b=WYyeMDDcNBgPov9naP/SEI2uyG8JEHT1WhYnllbb2O+pl0QJXciSRXdK9iuTnk7+UWuZ
 K+iBquIjUgxsOzPIw+10BJgOVWu6SUzf1FuxXYNPOS4C/CPB7RWj5fcmgZOIiYNnZb/G
 s+iaq875Z11ckCReQKzfn+H8CiAdoZ/j/lo/2nr0XxAqbeQCDSK57tw3dh3CTQcmOUhZ
 rShtS+1PkgF0waPBBHQ/91T1b8IvYkEfSiKT+bR9/dO8ax94zC+La6TautoEGYetYpPO
 NyNNIISwKa8E+qCEqtZbrcXFLyKuOb9Vk22v8/cQR9DpQKq4V9qeh84wHdDcIfwjbiyn 2A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelTi030497;
 Wed, 22 Dec 2021 19:42:11 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by userp3020.oracle.com with ESMTP id 3d193qamws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7r4AM5u/KRjcPZhqFya+85HuMpZ1fUANUiQcub7oC3SVpZTsQ5L4YaJDi9ZNnNvgtPBClATlrxctdqvocu4ncHfiTPUMKMEkrkaYgvHUkQLUXAtotqqpAZOCJlFpawUZvWnDvN8jpAKC/8y73K22UY6ypLAiISvFx8DoISBSK8hewDjdfkV/My3VhNkFYVaViwXpm8k0Mq24AbK4xFIKkACuXT71NFr0ZQluckcYfitV2PNbpdmNSFmOy/vluk29qZmEFxH3rrRqQr/ev9U6YwPqItCXYhXabgGNyUQEPAUBh67YACezccZ37q3w7tBgqnaYqTLdyS6Ucsr3PJn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dqufT9N2lURz11n/Lo9vKP+ln57ilplyhjlPtBAmHM=;
 b=LbuLl+SYXp9rGxDaoyRUbPEfx2O3HFNvbhd6+uYnczM+iHzKpfSj5snWTSvBAIB1uQp6xgLKSQJlCg8XKeNxh6pwWtHbfPzPMb+M1yYCTMSBYDpDTlcQMCaAItysqy3DW4bW3rxPYIEGie3xd1GgIYlGVG36SZ3ULQ0FgJILtnJwou6Tc41e2ZFmeDZG+wjMrZuP37zahrQPoFPN2V+qUeOfzk32KIMWglEzEl3BwmNJOO2Ay5o/FJ5pIDxMU+g73md8qM9smvBDUxqgL+IW9Vmu2WTIPtBgYtIK6uURcyjNulDe2e+Q9QfduCpkoN0IHXgdfw20sDonjZqk9mUmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dqufT9N2lURz11n/Lo9vKP+ln57ilplyhjlPtBAmHM=;
 b=tSAg9L4bKLSa7p5Z7+JTBuAobwmkl3Ub6BIFH+sJWm6NCBreLCfvuPoxLOyqvmCnRWXpv9V0yL8rG8ibIm5+DwxDWtFPyCiuvnf/rWyVUuPjzUSJv34d1h7aU6ihsiGLRp6h53okrsM7J4kUhorvSEgoj6Qp946PP5/QhZSO1K4=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:06 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 23/29] vhost: reset vhost devices for cpr
Date: Wed, 22 Dec 2021 11:05:28 -0800
Message-Id: <1640199934-455149-24-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b99d151a-a3df-4b2c-46c9-08d9c58322a1
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424230BED9AB8725500A653DF97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vo2Bov4c9ijZS/Q5Ha0FqX3qCff8UrW4qMFJoAQGkqDDwMKliBmD9k51C/QjZ7ghECbK6JKnmyS13wEGqFzEMqdpwS4PfupbEwesZCl8U9DPBSlNIJp1X3we/d+HXmRkjy+lH5MdTZfeiCdc2OFWjtGQiXCfCreEV51B3WT9PQCf16H4xELiPjpK8hZuN28Jbu50tF0sQ0g+AyN8Jk4W7O7oUdhyQExZ5SokLW7F+OzaYfgHD8cIcreYDhqoy7GajrlDjsbzR4TnJs8G/VINFe/4p6oHByHavxP6iyemwfDk2ZBkVQwUcgqI8/YmwhiuQzB0w2aISRx1WFMej4prCulqV78vrM0GvBC7sPyQmDl7s2zvV8kY02fFV9J0ekaWZtwdFSFrAT7iGhU8LOt2kaQqBdWeOhpAJkcfwJetTPFmOrUloQbeEHhrXP4gg+rGO7/uR3Lsya7si22jV4uPa/97AXOBdejE17+3Jf/j5+/csdxsD0PPnjEyE6jYyYsDYcaopDozb6JjuT5O+MyQLeCoG5ecNBL09z1/UOysTwt24SoB0bs07OgahhpbllyXTJAdXTWu1MpOnb3/DRg3HWUYQn9XVZeiKrj5MydpS/GrjER3VSL0CmgHd7auun2gk7JNXvhgW15RAlrPi96wStdzI2z2rqWy0FfNkuX0yr8sS6JSryTIiZ1Y9nt+pZtYXUxdTpNydGtHmLyP2/oOJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IdquaXF+V+Nu+TBfLOFo6Gub32nJEQTIjOgjeCKQ7f+ohQjNrmUrifSrFFhL?=
 =?us-ascii?Q?Yw5xwhFcfiszcB5lOin9HV1vFNbPv7QwHc7qzNsCNNIemLCyzz3sguzGxqRX?=
 =?us-ascii?Q?2uoun5rkt1IM/Ynx4pNBBhPqKCYUPfduLxYAykrygQvsCxiFexGYZHKt9fmk?=
 =?us-ascii?Q?8oLbNqaKNF2fUWIkXiHRFQJxcRkSZcGNIwCRfb+IM0zdV/c52wqs+Z29+SiG?=
 =?us-ascii?Q?yeB+cPIOA7mQpnuUSvOcBtiBtRVF0nsmafhL+DoPPlN9rZRIVlsQGHQRxwRu?=
 =?us-ascii?Q?ylgjqwgPOKhQF7a+RPrpcobT6te42s1Ueli2aS4zKjZnkTzQP1C9Bm7tdZYL?=
 =?us-ascii?Q?YVULJPyxagTowHrABJzMQ/wYWvsfcv1EFxBhEqX/AtTYsaSAlA47M7W+WhxL?=
 =?us-ascii?Q?cc5U4ayzi/WydH9WyuSM7tDSonjIDQT12QYWy7TgHOQ6cGDLNsCra1/dq++I?=
 =?us-ascii?Q?S41QDp8yVHsWtJuJGRz6Ih6cX1tgB6+dZawk8IC53SxKq1APR55ddhT/9UYh?=
 =?us-ascii?Q?3wd+mJhOApDP5oU4Ixs/aUkmeWTsJ/C1g05qZH/ZY5Q25TvqDCG9cdAY5P32?=
 =?us-ascii?Q?sFvUke0K6PTlmefmiQ4adDw0twnS5vLMuBCJBE1n2FdHzb7c1BPgXzmwod0r?=
 =?us-ascii?Q?w3xkQN/V6FPs2SkAcTx05MXdTKHViaVrH3yJZ65KvoAjua2yZaRhYXxsnwpK?=
 =?us-ascii?Q?d/K2iIXsgaInaIpDgkzOkMf0r5w0hnGOIXy+4JL7Qxiz9jzRkna8LLfVmKA2?=
 =?us-ascii?Q?7fYDwlYdU3O2v4fXnDKcgfnFAr9aU+BkbslA4z6TePR7GHMCjWLUYuaiUaeI?=
 =?us-ascii?Q?7SlAi0Jor7wjYzq76dFhhf/VPI/iAnypYk3JgMUs6gBvsZVx/v1Yrk5P7FHO?=
 =?us-ascii?Q?UYYHRNop66bXTMzHJHslR9rayTpVpch/knb6o8PugKZmhveTN+CALJuviIt9?=
 =?us-ascii?Q?pDSTPY/pVZEtqQADUTxUNZWtvKbZnAOT3v4PMLnRdi+erPkeU2IDQEYRq5ep?=
 =?us-ascii?Q?yBsVDHRaUZ68X1q3MbCdB+r1TUnOnJAaY/jHkQcD5G3S/KRajSu/GUQT8Qtm?=
 =?us-ascii?Q?jGRI28bBLxjAcItg9R2+h5WCGNDgHpNOPqef6e9jOPw0artFBVD/CPTGE1uL?=
 =?us-ascii?Q?BMIfpQtrdeXP+lHIaghka0flnLLHVjSusxPwEsGMZGfVKJVDaw/NSzfzDTM+?=
 =?us-ascii?Q?ZDVcXDxw/1iYTzUpWEqgf0hbyvpl1BvmYKTSw8ZgPnDiiNGrkM3rHTLQZvtR?=
 =?us-ascii?Q?XU7p9hH1+HgSZOyRYGcmtPBQrikFSd9jnc5PxhiQL5TxToSuuvuUqgvRmfMH?=
 =?us-ascii?Q?Bub3tfjdfYkeyXcZxj8pzQAFOzcQdt8SBW6YMJvC5ZxAyZX4+ENm9Qh53H8z?=
 =?us-ascii?Q?0ljwLLvjjLnwCDlYvh3VXYJoDUELN6gcDXB3xzffQ5iYXMkMDBHj21CWliFM?=
 =?us-ascii?Q?zeMsbbBLue9dO2tm3xFrWnLlOXuQR7PCwcTU4WNAM7fdpitnuis4VbGhE/L2?=
 =?us-ascii?Q?qfLJVMnY8adZ3PndqlS8sv0krML2pLctZPJBtaSZJmE0d0t9wK3FN49kiJq1?=
 =?us-ascii?Q?yqF3GWZMkSScsft0mlQhP09MbVgC58NPTwn3qE3enZfETWV4knWqu5UkL5Cu?=
 =?us-ascii?Q?q+5gVTTeeClEQt84yKd10b9UbO9uIYoz8QJXS2eXNSw5zUIhOsVC2otP0XL4?=
 =?us-ascii?Q?Gt4x7w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99d151a-a3df-4b2c-46c9-08d9c58322a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:06.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iIcuBVO6MXtsvfzGX3QeiIJLic0Yh0tdUGyk57BZ41v7DI5XmxsvyySRMpFkiXrTrhkYgq4m9ljoa7LUAr73T6rL57e9f66ccmPohMVCtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: eJXna8xeCu24WBwaLqU2qmM6AiXx6vUi
X-Proofpoint-ORIG-GUID: eJXna8xeCu24WBwaLqU2qmM6AiXx6vUi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A vhost device is implicitly preserved across re-exec because its fd is not
closed, and the value of the fd is specified on the command line for the
new qemu to find.  However, new qemu issues an VHOST_RESET_OWNER ioctl,
which fails because the device already has an owner.  To fix, reset the
owner prior to exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/virtio/vhost.c         | 11 +++++++++++
 include/hw/virtio/vhost.h |  1 +
 migration/cpr.c           |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 20913cf..35d0836 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1853,6 +1853,17 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     hdev->vdev = NULL;
 }
 
+void vhost_dev_reset_all(void)
+{
+    struct vhost_dev *dev;
+
+    QLIST_FOREACH(dev, &vhost_devices, entry) {
+        if (dev->vhost_ops->vhost_reset_device(dev) < 0) {
+            VHOST_OPS_DEBUG("vhost_reset_device failed");
+        }
+    }
+}
+
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file)
 {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7..d436eba 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+void vhost_dev_reset_all(void);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
diff --git a/migration/cpr.c b/migration/cpr.c
index cee82cf..4229c17 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -8,6 +8,7 @@
 #include "qemu/osdep.h"
 #include "exec/memory.h"
 #include "hw/vfio/vfio-common.h"
+#include "hw/virtio/vhost.h"
 #include "io/channel-buffer.h"
 #include "io/channel-file.h"
 #include "migration.h"
@@ -109,6 +110,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
     if (cpr_state_save(errp)) {
         return;
     }
+    vhost_dev_reset_all();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1



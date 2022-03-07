Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7C4CFFD2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:18:29 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDFs-0006Sf-99
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7d-0007R7-1u; Mon, 07 Mar 2022 08:09:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7Q-0000Rz-4l; Mon, 07 Mar 2022 08:09:54 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C7jkF010192; 
 Mon, 7 Mar 2022 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dUueYDBjFBfuPV+2TXQMy6RAu24YiI3lUrixiZvJtxs=;
 b=gX3ScIgYuaa0PKP9yb7DqxEGEwlpDBVMt6SJyZfNchV2lfa1Adg29yH70T1hZ4WaXD9x
 OQTCZfNY3TNA8PjUTM9NJ1eTWbpktIJDGlB+w8RJ9m3rvUBS0Z8JhqbY+AUo4qAWO2Ym
 UefbDnR37svG9gYLEI7HbgcsyfYsR157uEiQovXAh2+JrmwVP1bTXY6p3i7CFMv2sV+b
 PmMOnOD/kP/jhzQ3dpop1xRtdXCW3gvfgiltG/7heRvSmEByojnOXFb0wr0sGhhajTyu
 gawfCm5cEKAYUjIjqB5pOiGwEbnRDAFmn/4XwYmMrr0OIY1S4XIPGTiJFB/FEQT6YSXW qA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cbpy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D5WOU124845;
 Mon, 7 Mar 2022 13:09:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3030.oracle.com with ESMTP id 3ekwwaywj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOYrtlMsh2HEL+5Quasgjy4ndFPEGOTeg00QVaE3xtHTl2uaxVWxR9fv8VNX1/Sxfa3b1Kt8PvyUel0sqKrPw1gHteEkEx4vNDP1HDYpO/nSRNcUlgSj785sTuvoCsRFWXjNGWqxCSt0kPvyFKGRRzCvo/xRBLBt1eou7K1ZNvLY0QyxObannrveWH0rabV2qAyrHUgbTv4QSWk4uxT9U5gNhPx3JNboCBcS0+wOoSrO7YNdtBp+a+wHXR+n8/UT9MQHkdxEHpLIAsB4U+ktz2suWvl0MHpLu3LaTWb9bGL+p2nsNj7jX7iK9mp+6ls15noN/5T8icwAjfpGmOMySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUueYDBjFBfuPV+2TXQMy6RAu24YiI3lUrixiZvJtxs=;
 b=Bo0jKPDKnnQalnFuY1NEqHFcAyY3s5cjt9wsaXP+pFYpsPSyzppAxRbR7Qt23Ae9Z7YDUsPXOeObbxtWSN6GOBGQkply3sP8GCGCe4wTgTKsSTkczsBpVA4pBKYvJoOH7CUxOPVVWBt5gZ7SI81v0V40WMTZaXgB3u8enYoDzWFvJKl41JFf17RB7dougGx5RKDOmujawiD8bc52d2Dganpu+s9XciPxesjXcLUCfOEW1RzWsBBy+i7MOPZY+tVIyW6FT3fLpP6/ezZsxH2KUJAEaPZ0o1xPiKQhaY6gUBr/JFUSwIJlR54oB3UtHp1Na2vxtvXbG9wQv15+liYmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUueYDBjFBfuPV+2TXQMy6RAu24YiI3lUrixiZvJtxs=;
 b=yUHVBhqEvpskqlADP9znVEesipbh8mPOFbm1XYd4uixnUs/iPzUG5cQIMhFHyR1+V96AZGMe7O9xSXIsysMl25fo0w5Z4poJQh/8EK6nCfrIGwSoGlF0MnqfpRw5qFr6orL1UkHimZcOhcOPw5NdaAy2Nph8mrXNhakXzhn13i0=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB2619.namprd10.prod.outlook.com (2603:10b6:5:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:20 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:19 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 2/8] virtio: add vhost support for virtio devices
Date: Mon,  7 Mar 2022 08:08:35 -0500
Message-Id: <1646658521-31652-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b8fa3a0-578d-4836-7843-08da003bb0e9
X-MS-TrafficTypeDiagnostic: DM6PR10MB2619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2619A1F7503256FE2E60A709E8089@DM6PR10MB2619.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxIle691lOgI9Aifd3ZsOkC0Jxww5a5THCJOwfEzRtWaHZ0Lzg5CTiKp27iT93mW/7EWR4H+/v1Pf3nnanAodbIsdPcpOG5lmWUWtrItVVeiro0NVJTR970SDQuNEvspGi6x3A3u3EyYLP1V/U4I4KLXIatu5JEeAo1DzgRWEurRuciKq4KfbIR66xuUg1hNISp70B6ehxCos4MGNI+uhFBiADWEXIQjJ4VyZ6CQD0QV+PvD5ZYjg2TnPJF5hrZz0sdheMjWO007YzNuKj+/uk+yG0jwr9TIwPHLh+HobCRSKkNbh4FHOJYE7wRyu7cO0Rd3cuwMy5M6KraQ4S+ofufFwA+HBO7EnzsXKuWmAXvkgPckcbcdXlapGwPZPxKV6txf2pZS53VwvEmdmsjRssEXI3py7fZrsAzHsCseW17mlJfL3NcJESHzyjUCNIyWB2urfbJz1bQxjj0PxxRiPAS3dDI1J7rnStsqMsExzJwx6daKYxE9Vl4QmOro+eqXAPmU77MDA2y5MNYykba5j+KCJPmoV7tKzrQ9/TZ2bVhuL7ZHV/8+2keHsYtSzqP9pJh1TqftHnkZs1KXbOAb8yEMySaUKkO/Wg6Wotl4aQtpOslPBzvdtvKDvPfmxJpQ/zYH+UzTzNMrEFeEBLUHSKthXGpd3vxtJCiaXocLrXoV52Q1QbRXhny0Zp1bqEnRf3uakoOZ5pIjtGnKQl/wsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66946007)(508600001)(66556008)(66476007)(8676002)(6486002)(83380400001)(5660300002)(8936002)(6506007)(6666004)(36756003)(30864003)(52116002)(38100700002)(26005)(38350700002)(44832011)(7416002)(86362001)(316002)(186003)(2906002)(6512007)(2616005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?inSVKDpb5aKJwzr/MX9gYrRNo6U1FRc+692f2oxuWFfyuxPcdXJo/ck5PEkb?=
 =?us-ascii?Q?7W/g5BhINspGtimQeRs5efJrur00i6kl3QXvrUe0ha4HXKcGGNaGBs2SC6ML?=
 =?us-ascii?Q?XzYF6hKjJNTI8/bMHUgyBguEH+EtC9r3Gc7UU4BKgwJe4lDB7FufCdD77T22?=
 =?us-ascii?Q?WgTnxjHSS57PmJwUDoQ5nOjfbkYrCveUcSiB71BJoc4vlSnAdvGXHLzObcha?=
 =?us-ascii?Q?CWqoimy7ApX8FdNJ7yGzL3vD+jhZzlqHtGmQ00GzeyIxULbS/SlH+QeQe2fR?=
 =?us-ascii?Q?O5tKyiS1+tEYJEU5y8eTiNe2C4h7d7xk9HmmR8wQ5sO+wnRcwiLlikAtb8qt?=
 =?us-ascii?Q?L/0xWyuLpNHyqLjT9SZYtckBvTCP1p0W2/r3SrBaaNosgDkkn/NQUpTbH0Pr?=
 =?us-ascii?Q?JzGpCBWOebseavoUoVzOrfhdD1eRTa3biveC78bZDU+5VFz3n9yO5kJTvFXQ?=
 =?us-ascii?Q?CukBw1jYY2PEK4voNsjek0PiZ+MrSFCVh+7xK8Tu3vuz2VyKI1tkDTglQo2Y?=
 =?us-ascii?Q?oEXlr+0ebINuuvbrVfwVgcA8Nf0SH4UupNEube0WgVrkG5AjqWTSKP1eMVk9?=
 =?us-ascii?Q?R9dmU/3cfM357kJeVwa3mNlL6DnQOP6nbdYqhg8FVXfrVwySDxeKYRNBJ+wA?=
 =?us-ascii?Q?ggAKUUdgY9hbxm4MTsGO6axYq5hAlwK4zWvadw8xh+JOMpL3g8TuA1zdm6S4?=
 =?us-ascii?Q?MsE7rSCuXXVoYAjgg0xaj+0E/GztS57hkrmTdHrjmjQQXLJDu3QqiVmSMRNA?=
 =?us-ascii?Q?nSjiou1gF6SdlEQSUlmbpZ7jd0F32dHAL9PkLgULTV9GCkbwZe9KcgljeJDj?=
 =?us-ascii?Q?PfTbR9Za9+gG2TZZkss1i1jPZ43CCh9cFCTXqiLK132ipN9xN5+qFHliTc6W?=
 =?us-ascii?Q?874etIpPrK0i4xd9Brgukxd4CHdbXL0oHxoL0xlePJvV3frIWIBrL3gIx1p0?=
 =?us-ascii?Q?d0E7YRaNTvjPRLetgoYJv+oZVzFBLIKSX6BiTjd1FYDdIpN3TzZENK3GXsTW?=
 =?us-ascii?Q?Iba4pHIFvcsWzaHtrsPXY6KwNNoSxQpFzzUtgkYV/fC/mvcBQsWCXUj2up9F?=
 =?us-ascii?Q?wZuQ/MoMLXGnBEeY08FA0ktW2MQgN7gI/WnyIXN88PDHGkMAqFBijBhxhhli?=
 =?us-ascii?Q?O3pJLGMvzMMyIQAYXtX/tqA/CMjZe+DUBhvMxZon4JC6L7t2I1GOiLrymuCG?=
 =?us-ascii?Q?AKvOV79jAxX/YDwj+cSbyGfiw29HEq69Aj8ZqyUkEODn0Ol/AGlL9Rt4P6uF?=
 =?us-ascii?Q?XYDxb1E+vLjcPqq9cThpQm+PmKfMGXgLZ00tsRWzh0sreHHDfgB8tXy9/j+z?=
 =?us-ascii?Q?A+aqIGctxcX8iNXWTCHobvp88aCVMOaA8YJdr+GezDSPSXfU/BxXn7GodCvj?=
 =?us-ascii?Q?mExF5YSYCa+H2tAuHZtqAEBRXD2k8B1/YbhGF7vsONZUpXl9zE85TXbKSb3q?=
 =?us-ascii?Q?kUnVbbBwsYVMkUuNAMaIgVmiqdp0tsa5EKtrFH5WRIz/JIVoSvDYCjCcdW8T?=
 =?us-ascii?Q?qf8XMPDomdvoSbnWDe47uYcRJMTprZYKyWga0QaqAFAytDttb+69eUqFpd2U?=
 =?us-ascii?Q?Azk1QruT2Z4W6sx0jGrnU6bu3WtQMfERs7yGuga2QF9IT1egKI6qR201IG6U?=
 =?us-ascii?Q?RDqORpp9Mia0VdJjtLMPnfk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8fa3a0-578d-4836-7843-08da003bb0e9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:19.8913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W65sm4EyTSxcEmf14EGzoFXjmXdonvh45+0tVBYL2Dyuf7ZSF7QRT3wZI29Az17rOkLsyItOZ1Gx2CKlsxGaAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2619
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070076
X-Proofpoint-ORIG-GUID: Rmn6P6TxLulGP3p0xSc5kHgJhHPK4tNX
X-Proofpoint-GUID: Rmn6P6TxLulGP3p0xSc5kHgJhHPK4tNX
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
index 500f15e..443475b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3272,6 +3272,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 
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



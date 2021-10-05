Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E1422F60
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:49:40 +0200 (CEST)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoZP-000692-IF
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnaa-0002bH-9u; Tue, 05 Oct 2021 12:46:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnaX-0005eF-2D; Tue, 05 Oct 2021 12:46:48 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195FvImT019448; 
 Tue, 5 Oct 2021 16:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wA2k5neXlOK7i4LVwDz+shXX49LRgfMJRzmar/yzi8I=;
 b=jlMB8aJiXrVLzCZRZRBq2hA+fQq6D5dxjAi9F6sK9JZ6BWHiS27xoGYr/OXo0uOYeWVI
 KlcL72JGLINYioBiZthQbtYUxiUfZPX2ayvaWJv0z9CBdDfuXWP6JyqsOSgypNKXAFgS
 X2ZLYkPqOyxKmMVJ+/4G60J4SQYiDh6aKMrcY3bDdZyiDOxfqp9owbfPwzfXA8PRPjWp
 8YiPg6l8qhuDR5iwtekKc9N7Ef6KQvSD5PF9mG/1f1Cs5y8ds8P70XfYq943ubHTbe65
 zv5U1pNbKi/Tr8O0tzjTdrJMTHf1O311aZqP73sfVQSDbxyTKbo8n2Ip02MLxZEa3Bbm Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3p5hcvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195GigHp158752;
 Tue, 5 Oct 2021 16:46:33 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by userp3020.oracle.com with ESMTP id 3bf16tbcq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwEvF9cEX87fAHDBH4RN3NTSaev4KDrGmaeGLsuzHX9rAWUHbX/+WKjVlUYvjeceMrDcgL7I4fLXeoVFjn9e5y8Z6nON6azqlxbVrWrOTFlUtN1Nke1sC2mnQVt5Ok1V5f/KgCTy7/NkE75ZdCnGiSSAc+a7JuJeZIviMrzpAq9W1wo1axXNWIhQs0JYEofzHLT66yCaTydD4KrEMRmxMm/allYVgteoSHRKvM7K9qNAwuI9iGdjLMfWhCDqTWvPWPrDApLDrkW9mClyWp0ZaqgH24r7B0LJwCwra6r1oHxMeVpgeY1BiwYsYuz7x94Z3aCmJckuTXhkNHLxg/h19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wA2k5neXlOK7i4LVwDz+shXX49LRgfMJRzmar/yzi8I=;
 b=OzKQcYoAjm+awLeXsb+Zujv6As9Fn9ST+PYx4II8Gssl4w+k4mPhbnXQ5rk0+dhR1JkNORn0C7iVjAI6LU5THXWfM7gHPoJ9mvLBMT1UxVE00n3tOy5iufBAfZA8DE21mIGl2DFkjCr7HM2LuA3QYs40dVijrvGCyR16/erKsQ1XBv66IDasAnn0bpZaH0D5jOk/ZKtgZgfKBOmea6CYtkFM3aY+WwZHBx3VlMpoxL7caMNWLIvCJ/EOs07Vd+iU9tZP4bxmoWquqrSQy20XxfrkTVa7WUY5CtnbmQhFrB7iz3s9dOowlaTJJddaAS8XgAVoIKeJLNOvE8HoG1Z/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA2k5neXlOK7i4LVwDz+shXX49LRgfMJRzmar/yzi8I=;
 b=wnzCNPxcAsaRQecS5mk6G+WTgMAUm+0z6Fk4PCtn/QjJgXxaJsIdFP0rN3Nut7sJY11yprSOsQYuXM/0labZ/ILRb04klokNkAbQ6bqzXRrIZVgobbGubAfQl3PhxIEh7LPCOcHd+T8j7IQ8m9u4ZnFu8M8hrNWuxZv9M5gBd7Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:31 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:31 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/8] virtio: add vhost support for virtio devices
Date: Tue,  5 Oct 2021 12:45:47 -0400
Message-Id: <1633452353-7169-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fa96e6a-8e94-412c-5a58-08d9881faec9
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB2942AF30A135C8414CB353E4E8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 747uAnvuyHH1zLZJccDPoatLeMXZd6yVwVoJ6k6gAdE8n7kIwmw7GIqdrVkIc8Ku/prN81fCtvCH+HCrjfFE6qmRJOXRsHtmeGZqAWXKWl+XNMOWnmQq3pNmFrTbRDwm3qBqXKOJJStJLgGCYMRR8OxtoYN1jxeo9z93VVR2JeUaYNHxlhPyN/7ywFC39YiH3sNlt16oJYz7ftUsIs6UVeb4BlAXtdRx/dnqq2fymGUuwfAfpTNq8EhuJWnqrCxa2ELyeyPo0V5GfDMv6RZq/TpKpKVzfNr7YHalnnuOKYMtIQARHQ0NdGEyZ2/DQ7ffqbXLSc9BeiDa8gVWhz8sPXZ7g96dFHulVsWgDXsusmnELZSgMJgIqVVqSVrcAfsjquTpIa2ZMLp+QECGhoneSxS6/mUJ8IoVD/9YTBtoQ16hr/PkRcpAmeuRHSNxSd90WDpYS+qdsYajajzVrGkYDFYk0NIM5R3YCqeB9DG0LbnD2X60epE2BmhURHMyLSdVY7Vu9MUspwzg1s+JB/zWZungjux0uWDFcopGeCUstwoeRp6AFcxEIU1sv5ph76XwBKZxMoRxEDBQT/0kK0IAnwh1ecz7brPwC9BkebNGns0U7BYSJEBTbLBXQl66z6vO/vAfQInFLXcCyKAVu18zxPNpYyX8JpiaP5WzyhfEVGe3ppLy3O0iNA54YTCMjtSYxMDA/OiXvmzFm+Zu0JAVUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(83380400001)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?htsYuMtwHy09uGyhpX8tIbJ4wWoLpfacuJgFDsbcSdfWEHXy/ZHB2v4y8xYC?=
 =?us-ascii?Q?H6h6F9SHAoF6agjSVgyw+jSJg1m7UiDrgdOC90ruYSH3NT7c9AtZl76xgWCS?=
 =?us-ascii?Q?DYg6bSUw/1YdVX7MVyqlV10gCAysVvsixq/9b7VYKzqdnwBlPp60K9NWhlFo?=
 =?us-ascii?Q?SUgk1zSWn7EAQfKc5KGk8xSsODa12TuyH60/MlQO1Tdpcf5TYaRggxPEbTAD?=
 =?us-ascii?Q?uxKecuE6jKTHOgHiEgCDzeiZhE3MTtE1vp1jDMsn93fEQQ5xviz30XM9BzSy?=
 =?us-ascii?Q?NCpgwu3CWFKkRwVIILiBAz2ExG516RJAcLn2q8zemVDr0fycE+UA6T6LTt1K?=
 =?us-ascii?Q?l04cbUovfTWeCf5DJD3X3y+MEMWEEdvtCxxTn6URz/GZEfn9LTlsgXu3/Hy1?=
 =?us-ascii?Q?X3N0SBe83CVc7GBtukczC4ZMzc+SlA5MXwRv9huaw3kvla2BbfCQSCNv1CnU?=
 =?us-ascii?Q?Qz2uKg9B8ozCdz0hIjH5M5bVeW+EDVLmnI0jdstqmc+p+76llo6v7MXmA8ko?=
 =?us-ascii?Q?FEYH1W29SxqFI5WJRyrIQXgASMpOY2XRw37sR/eH4ajl9qikBawD7/s1XF2U?=
 =?us-ascii?Q?nV9/wu3zt+0YDRU6P78+EDmg4h9B3NMUWnpm2XrwTYhgvKFyD1V4hkshFYhw?=
 =?us-ascii?Q?si+zlkTdfZDhC5O3XyuAuk7kdRsCI19OZT307tGDVQQDm62/7zkz+1Wlb7r+?=
 =?us-ascii?Q?CdOozoTUYjlq6bK4IyDC4/lATNucpwLA1N+oWabTCZfTG3Tm3H+e9ddkCO2W?=
 =?us-ascii?Q?/8hGALeHVED7HEOYD2eRWDjxATqOsxCdd2yjZJFL9E90AYvwRRWQlRaCQgtt?=
 =?us-ascii?Q?QOdHt/HOO+jWUDwjVQnQAXY/0+QgyAWVUEDoWVycX6luQd35/hGBlX2DcOQ8?=
 =?us-ascii?Q?+p9L4lgpPRaYAfgO435aXCj8e1ZUjQcj9FG4Z86nrkD4Ow225WQ7VDiHWJP4?=
 =?us-ascii?Q?15J5wbZQ3cL5IqEHtrkigMgwOmeFBRg3eiq0FEraSGdZfpHKfNneTNELW834?=
 =?us-ascii?Q?L/0D/W4bXQEC3sje2nT9FXhkBOxzJh1jqdjqpojKDx3Alkmhjo/zfC2TsW4f?=
 =?us-ascii?Q?KWg4KJ/07TtvQx7xxItHV00INU3KLnJFi6zFCC4VKPKcXuUFwpK+Ma6Fj2Ux?=
 =?us-ascii?Q?GrFeu/FAKrjL7F5toXt0RJaz6bUHsFt0tiTssiCVnjsmQmGQNkCOl5ZZP1xQ?=
 =?us-ascii?Q?DbdVNLVfJk5mD8774nm4JqktJ4/leLsR6lZ6Xe5SDTtfNEQmqw91X4qrJu9E?=
 =?us-ascii?Q?8imD+26j++nJkayqAAKmsvklYmll+0C/+H3vv031b9bPnJZMO7AMv5YjFE8D?=
 =?us-ascii?Q?c/jd0paCQqeF8sd+uRAMbAnl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa96e6a-8e94-412c-5a58-08d9881faec9
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:31.0029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBvMl0gCUZPJWr2VfI8iIJVZl1Qpxbog5cWVi+sx+1cmzCkjbjTOREXHNaDdPRlXPr4nafYH601C8Ayx6vnadg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050100
X-Proofpoint-ORIG-GUID: JJiy1m2iIfzjpQJ5RP1AyE8GE_7Fxn7D
X-Proofpoint-GUID: JJiy1m2iIfzjpQJ5RP1AyE8GE_7Fxn7D
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a get_vhost() callback function for VirtIODevices that
returns the device's corresponding vhost_dev structure if the vhost
device is running. This patch also adds a vhost_started flag for VirtIODevices.

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
 hw/virtio/vhost-vsock-common.c |  7 +++++++
 hw/virtio/vhost.c              |  3 +++
 hw/virtio/virtio-crypto.c      | 10 ++++++++++
 hw/virtio/virtio.c             |  1 +
 include/hw/virtio/virtio.h     |  3 +++
 11 files changed, 69 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f61f8c1..b059da1 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -568,6 +568,12 @@ static void vhost_user_blk_instance_init(Object *obj)
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
@@ -602,6 +608,7 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
+    vdc->get_vhost = vhost_user_blk_get_vhost;
 }
 
 static const TypeInfo vhost_user_blk_info = {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 49df56c..6e93b46 100644
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
index bf59f8b..6e54436 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3549,6 +3549,14 @@ static bool dev_unplug_pending(void *opaque)
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
@@ -3651,6 +3659,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->get_vhost = virtio_net_get_vhost;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 039caf2..b0a9c45 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -264,6 +264,13 @@ static void vhost_scsi_unrealize(DeviceState *dev)
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
@@ -298,6 +305,7 @@ static void vhost_scsi_class_init(ObjectClass *klass, void *data)
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
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 6f55bfb..e668d4d 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -231,6 +231,12 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
     virtio_cleanup(vdev);
 }
 
+static struct vhost_dev *vhost_vsock_common_get_vhost(VirtIODevice *vdev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    return &vvc->vhost_dev;
+}
+
 static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -239,6 +245,7 @@ static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
+    vdc->get_vhost = vhost_vsock_common_get_vhost;
 }
 
 static const TypeInfo vhost_vsock_common_info = {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b4b2941..e432bb2 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1743,6 +1743,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1819,6 +1820,7 @@ fail_mem:
 fail_features:
 
     hdev->started = false;
+    vdev->vhost_started = false;
     return r;
 }
 
@@ -1848,6 +1850,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
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
index 27fe5c0..4af20c0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3290,6 +3290,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id,
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index bfc73ec..105b98c 100644
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



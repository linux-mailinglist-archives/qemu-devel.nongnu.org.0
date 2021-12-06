Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F5846961D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:00:54 +0100 (CET)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDbx-00040E-8d
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMK-0000ed-OV; Mon, 06 Dec 2021 07:44:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM8-0001xA-GD; Mon, 06 Dec 2021 07:44:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6C5Art023240; 
 Mon, 6 Dec 2021 12:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZiBwpPkNQlaBQ7n6a9nybNcEh11gWUjlw+BJXe38bfA=;
 b=gP7zUbB1AAUUhMwqdPtwZN/v+GgWjgqDqBGJqGKAdL7OcSmNvQvCnK5uOb1bAZ0AuITR
 HraRqL9rsRMUjJ8OMcbCNgMl9xadxHE6SHdVrG0nMTt5p+UOjUGOfJfMzGEJimZpZEYX
 3Hf16++oZDsrTnj7OL6Em6FB8rCZhukxBJ2MJ1OQW2qgK9lJULiVgQeFnQyWkCl5MYHU
 6hH1dx9CBTJ2875Lp+ggD41exms8AZpzBwpu5/jMUU3EF6iykIuWDpYZz+9v2hycMHLv
 uj1fcbsi8/AiAuJPoB2noKlwa5AXo+DSJhvf5R7La8CQXLwZCQAV8d25RwJ8T552XFNp hQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqj2nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cf8HX139462;
 Mon, 6 Dec 2021 12:44:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3030.oracle.com with ESMTP id 3csc4rqj2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtBAbHoRYyomyy1eKGjjgYX9TNcGV+XcJDzknFtWFwj5m0sQSWe1r6ZiUCCUb4ENI0dub8mCBnDdjMfFBpd4A11pdzixtvsF2Mh4FVir7tuc1ozhVfI5V34bci+vu6hjfO8OskdVdx9Ge1IwY7Y2FmKVGEX7qclOjiCiNb2coakSliprUZnZ5MoEzuGjPdLQJApcASNJKjP/+PA93hLpNxXOEGuG4uMvrhpgTee8kFNpaLHCfReLXAYGbbs6KIqI2nfaVxsPV1PK1up1aPEmzuw9BHkwk+ev15Rpk3f1neIU1dAHBQUtadeQgKCJ7HRLpNABDmScpIelruDyRWTbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiBwpPkNQlaBQ7n6a9nybNcEh11gWUjlw+BJXe38bfA=;
 b=DM1K7MP3uJjZir56EyPMgu10KDNTGqU4LPAwDx9N6K2C3z8yIgODahmWIUPpvuqLCLdreA9Ebomq9qGDpqTa+liiCJW3Zxr/zGVgWAOzCZaYa22VQ6fuSKPJGrtiMB+Clr5xuOOlQmr0GLdaiEV7V37V53i1ibNAtJTSYMppGvvOAZJRBCURAXBXpVHriXS0otdPb2BhvyGMXwD8xiVnsR19Vie2Xd+S0zsOqj16joNZ8wPUVWCrrEgIcRrrirQS5picIXBH5Icwao8LN/jQpz6wWvfysc3SFgfTiCFGm/0/WjBMX9WzwHPZkiL3hhEPTKmcctmvwXEecIID7qhktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiBwpPkNQlaBQ7n6a9nybNcEh11gWUjlw+BJXe38bfA=;
 b=gkMSMkSx1KkYBfaRw8fD6zxWHqA1fXBZpBO79nIWFZCzGREhCH7OKSAKLhWzJ/2ghfyY2RYVezHhF0hd0F+Ya8juTDgUdb+iBHN3oQhLrNPw9fkrWT5mlBQNsN0ixwj+i9ZIp5WtSxBof3A568H6WIt/ikaWyk9tOjvMxSDpUcc=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5820.namprd10.prod.outlook.com (2603:10b6:510:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 12:44:12 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:12 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 2/8] virtio: add vhost support for virtio devices
Date: Mon,  6 Dec 2021 07:43:20 -0500
Message-Id: <1638794606-19631-3-git-send-email-jonah.palmer@oracle.com>
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
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76b71f5f-105a-4b91-9da4-08d9b8b61aa0
X-MS-TrafficTypeDiagnostic: PH0PR10MB5820:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5820B0743273FF3E68EAA735E86D9@PH0PR10MB5820.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PDvdSNRZR/lNH5hkNau4uITxFHleqTQiLak7omgmhrvPx29zpaIwlB8ES1djs0+yHflzZeJxl0FELAfIaJWm0r3U0EG0uY463QuZ6txyDWZs61GoINsqd4BMFLwXOOTLnf3SWxFLeoIft5JLW8cBRaGw1RpzXZbw2XLxMBTVKQ1ewyi3fq3JrIbNaWR61gBneUpgMhsTAbzXOuuyEIyzaWNCPpnxIEqa6b5gZ+ftydTAGOPhHwGeNniCX7xsOLcLWkiL1X9pb2GAZcjATBr3b50EPLLRqFm2UC5CsSJ9vz6RvHndDMK2zP9QVLpeDnFTps2RJquKcVXD146W62eEnd/lhNAhOPckSjOlZN0DqvDYwGoYgQnxA1+USWHRQgmYIwaZoPVlhvJ49paMdqMUvycVsFG/CYvul8JkA0PoBlJ9/aAWdEAGQooDxL3e/k1dQ7mURgfa44laCFBXKT7RNLdqIrtxPzpSgUrtA/9aUJfhogo3+Xd0dy3oYfUs1ZJP7tDle/gjSnCoqicMHUS09cAXF5RGdRP1qTNQV31xrNJAy/zxdSTQA4GGWN/2D0PDmP7Tz2CIZ0lrqLwXOmECxZnls4WKdAVOPcgqjlODMr6jxGaLngugDeoK+ul/lyrUuKLO6R0Cg4JaKDbp0s2P9eZTEq7a2J8kurCTgPzCMf74KhHL5fWkunr1hJU8NioiyuIqWmmHTIMoWcHwuVYJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(6486002)(6916009)(508600001)(7416002)(316002)(36756003)(956004)(8936002)(4326008)(2616005)(38350700002)(38100700002)(7696005)(52116002)(26005)(186003)(6666004)(86362001)(8676002)(66476007)(5660300002)(30864003)(66556008)(2906002)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AuaF0SFSbNvXWPOkBTTXT8iKQPavhW9keFUyvHFeCFE899cKiALekBgSmPHb?=
 =?us-ascii?Q?hG4+heItGW0O+fWYVxOGVFu1ry+ccgaliV/NTlW007AuaECbMtMvILwjrwo6?=
 =?us-ascii?Q?Gj/tvMZ4wOBhMD0LVrXQkVhmCPNOPShDI+nhgRt/INjwUJhD9REIwV0YW02L?=
 =?us-ascii?Q?Huo3IaNY8LFXfWzXhBgXNmMBeFYUDt+1YsZjeT9S6411kSjtMSZ4POvHj0Wo?=
 =?us-ascii?Q?2gOKXFTaWYifFNzypw4DLeRzZ7Zb6Pe7jW0xWvwLeGTRTqV65Nz7oLfGGnDS?=
 =?us-ascii?Q?jimdTQfLic8QjZLmz16wIlSRTcydqs+YF7gQC4chh+2PP5QwURznruoYiaDK?=
 =?us-ascii?Q?ea0OnID++4X3Y3pgpLfeFxMDH4+hetq9IdViUN7VhudBLgkPUNYhQaDlGi5n?=
 =?us-ascii?Q?9cFN9gP1vIKpoGT0brdNIkzgKYlnA8rKZX7qNbAfWrlOFoIk0t5c5rEgK3WX?=
 =?us-ascii?Q?6vQyhFE50dV4SNQ+MMf5hDjrQ6+k24oPzc5kRN7RTg2zfWtZxHvUoc4nj/TJ?=
 =?us-ascii?Q?jt1iohoFjdiA77OjaAHzKSxrVh4wdqHRSz7uieSO8TFwy2xdHv340gcOIFcv?=
 =?us-ascii?Q?6heHv8JHqDmmm/DK4gyAVIxwHa3Rp0wNSeK6wM4L5m7TFx07oH5YQwSzSrEv?=
 =?us-ascii?Q?0t1pzb5e587USWaS8xQAvgDIQbC2JPTffOb5l5S9fC8mkhHQ9hbTCnBsYmwi?=
 =?us-ascii?Q?ByQ2Hd9jzferJ5RhdGHKdtgY6kaKbsiXK5IMoNivqOE9E5MZeGBZ7voPtFZM?=
 =?us-ascii?Q?ji5dfZ4/ol3vKXIO08uVLoiAcuA2jc/tfkKOIeKoGOlAa998mfrxWmXdtT0c?=
 =?us-ascii?Q?ILw+c5cFuVKKK1Wb9uyTAC8qvyw9GOdArAKxrBQNLQJqz9aiwxPAsyiLx8wX?=
 =?us-ascii?Q?PqrcBk99fVskdrXhVyifDDScLigIGYlqk8OO9f3UVS3QttSfspYtsxgruilm?=
 =?us-ascii?Q?hizXxEXGTCM36de8uJCzI+EZPF4iEBtIpCLHv/vzv2MVNtlYzlPrRWgtlYlS?=
 =?us-ascii?Q?E0FkxofsvSUyUS+qIqW3DmMyI1S57yQQcQ9wfckEQYKmqDSdV5GAPyCDIlrY?=
 =?us-ascii?Q?10O9RjGw5sK/sucIFQ3Amm+bbXolbHvwyvfeZ3hM7Jis/vGbtIxRYPUOtLzJ?=
 =?us-ascii?Q?WdpDAnj8sgmDm/DObDhpGo32hbLAQFNjvfDXf00yWk1VqIWRxrmZu8sS4Qt0?=
 =?us-ascii?Q?wVR18hhsyaHbpnrvAmQbG7ll7FMmn1veKW16kq11RcI0pkUmjJufB89DkIu3?=
 =?us-ascii?Q?tC2OqAK7hYy+RfF3E4NTb/Tbv29lGd5D7yY9igkCcw4Vxb9rwJfo+JXk/3Ed?=
 =?us-ascii?Q?QWJ7RuSYCXldwQCiI3pDtLdsU4eTqfXbvFNautPwwE/vn75qr88ZvtSO5lej?=
 =?us-ascii?Q?zYefXzVVMCVRWEfKo967zQHrRyU48MWDrlPc0bU+i6LNP8nyXfHGo0d5N8Cf?=
 =?us-ascii?Q?L74snmbt+PUzsEUSoQa2ZwYkFyOquMSbPn+FOneW6YOzbs0yIdg9YcFzBRvA?=
 =?us-ascii?Q?n71myKfpA7QuhpOkqXr8+qDfNmRn36Eq5+mrX5nngwhkOD2vu0bX1Phcr+8Z?=
 =?us-ascii?Q?C9yk5J8mC+FX2Uf3domybCCJp18YDcr9qgrAyxN+fKy+zFWauaVJi8wNtwW9?=
 =?us-ascii?Q?Jaf/zgEIa01e8/fZddZ5sZ0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b71f5f-105a-4b91-9da4-08d9b8b61aa0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:12.1750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64AF4cqfUnqPts+5TRQEZ7jBmRjupfrrrhL+8frKQpphi3blyEPhZp8v/o9g+7J9lRYACkW88FvIuaWavBSi/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5820
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060078
X-Proofpoint-GUID: CQMEW8tsiKTyR_2fIzzVLsPXRXax361d
X-Proofpoint-ORIG-GUID: CQMEW8tsiKTyR_2fIzzVLsPXRXax361d
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index b275acf..2449b9c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3610,6 +3610,14 @@ static bool dev_unplug_pending(void *opaque)
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
@@ -3712,6 +3720,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
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
index 437347a..7ec923e 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1745,6 +1745,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1819,7 +1820,7 @@ fail_vq:
 
 fail_mem:
 fail_features:
-
+    vdev->vhost_started = false;
     hdev->started = false;
     return r;
 }
@@ -1850,6 +1851,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
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
index 36eebd9..867834d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3280,6 +3280,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 81e5694..0a12bd5 100644
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



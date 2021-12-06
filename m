Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F3469614
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:57:22 +0100 (CET)
Received: from localhost ([::1]:53910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDYX-0007qD-T5
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:57:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMC-0000YP-SD; Mon, 06 Dec 2021 07:44:36 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM8-0001xB-Ic; Mon, 06 Dec 2021 07:44:36 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6CA4Ye023237; 
 Mon, 6 Dec 2021 12:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=rInXhSoG/aSjBm1Nw74UrSir7jmVHm5AWcvsXWIDeBY=;
 b=OjTk1rjKtOYHkMARgiJihleKYP5LoKkhtTDEZ/V2FW13P4QFFEIK3cys8b456AQ6eqqX
 B56r6p8Vzp5sFurSQhcg4p2G+ADxmmRLTOeOBbYyyhS8q9nETcxKcksjJ4eOso56fS8F
 sStOr10BorqtRyarXLCz2XFoIjSk+xrb76HUZjiqtLIqxSnBGSlIsBUSM5sT0F6e5syj
 dChaDrN8LBzgOTjJzK1GIiU/eI1e2qZxM0pfes9sfpPFBcGRd+OM2JOslpKUxxpXLOs/
 DHNmj9080UQCNBVhE++QPVNvKSzju00ujoyrmSkJpWshRFC4uiFnAr/L6Bh069FiiXa2 sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqj2nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cf9F5139474;
 Mon, 6 Dec 2021 12:44:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by aserp3030.oracle.com with ESMTP id 3csc4rqj6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJmumpmYeT58O/Rf2fj+p/KA3giBvOfIoKjXpt/U5VBM7K2706Ca+zW0jAWBS887LtoqzMAUgSeNhMcylj8oVRYHRJHWJgAg1CMWp8uJMvHrxEh+ADP4rt2dyHKLtw0NT64dCD05AK22NQtdVB6jEk5f3xfFp+8RcjKWOquusiJqkJcBLHXfPsFWnqFce+XdpgSe9LiTT75z9qtdzkI6P6wMumSGmjGbxbilgV4d4BDxUJyYKn0+XEtQFA/G4zCBzrStmnymHINSBPXJbPpblGLXX/DkynUrlGsGazyr4ybn+T4ZzwJC19Xr5E3zaEjB+07p6pP+1lFRToHE3t8Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rInXhSoG/aSjBm1Nw74UrSir7jmVHm5AWcvsXWIDeBY=;
 b=d9ueWNTi3ScRS2nuhBqKV7sXxmMJ9yKThMrGdyGHQiCTAR1WxAIgcp7YaYvhH7ajexXUtxF3JFHDE1vC7ell00JW7T6p0gepCXJWUVVHNLeoSiHHLeoBsZgCzbQGc9rdBhBW790EehTZjOOwh+41HvznzCv7HXCOG+EpdoeDFodGCn0gGhShGffYzbPoS6y+VeWIVOWtX58DP55f4CBmAbgJZGmz+RFXIi+8vAJqRRGqspFsS77aHoTF7upT+9XIYv/fAWP3EUxGKhr5yRE3akcRu2wmN2aGNjOpoENYX2Mx58MGPlxW23PSX7YvK0rUpDUsA7Ty0BFndFVzIfkaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rInXhSoG/aSjBm1Nw74UrSir7jmVHm5AWcvsXWIDeBY=;
 b=swRUqMpOPAHfe//48TRghDx2vPDmaBW/1Xk99C8sIQ5p/pTRKBPwr9GEsKDd1mPxw+eJ7MYjXY0szhLi1Bw/6ForxpW8PuWfp0YGzGSD5tHk0KmErMOb7GuIV3ddLcSA4KqGEGRPIJiSd8Cdb6RZui8VaZ0IQXSTOS7vOcTwm6Q=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:44:18 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:18 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 4/8] qmp: add QMP command x-query-virtio-status
Date: Mon,  6 Dec 2021 07:43:22 -0500
Message-Id: <1638794606-19631-5-git-send-email-jonah.palmer@oracle.com>
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
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 238f27fe-ad6c-4544-cac5-08d9b8b61e20
X-MS-TrafficTypeDiagnostic: PH0PR10MB4791:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4791E8016DA740A431989E82E86D9@PH0PR10MB4791.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:294;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2p8B5CNMRvcc1kPktabgIAsCIDM2odIf8WGlyd5+HlwwuEi7o3OQleKwM4jWr2a4Vak4PrcvcuWgJemFFRwJloZZ3ZGa/9F+yRN7eg7i9crGR/lmghMLs6jK50yd4Qwf0dJl+6iAPvCQoUGACJVdc6Ki3saskhV8IjUMBznSnqLU2M35aMQXzUzn+3be0iLk7n8UdzpBJR7buZKqRZ4SeakS/MY+UgOq35X+Awdk2JnhJaHE6TNIYfP6sXrP6KyosRukMH8KaO+6ZE+vURLKDb04R1tXRurF07GnXC+FaGCu5zMm14QIyp7km0c7mGYTrVEokVex3DumVz2e+UxhLYF7eq6/YO64unP0YuVB40a+fkf0JoikgxBb+d1x+kUSSyjiegO7yN+fKyMXhCaxJCtE0eItGYW37HugDlsEGlqym2f7HqkLslvIIbE2lQHzmgc53PchxsvR4HE9SSNK51mzrh/l+8B60ucGgkHlAGBBz5yHDMsVDfTemHDJTK5bjUsrrIq1vuObyQkNGu9Htt/LPLgKiCwULzUB7wsjNM6xPsSc7qOr7u9pzeu7WI9cFm+j6RzaM/smv1AIQ8zTLFD8SYCPywmXX/Gm5m7ijMVam6lr+mtXdVYD7luSHkijhPjoEdlEhUrWxM8pWIfd7ZPONXlxfvkn37RzKSLTvjkkGZ0aAXCAjjAZ6mPseM+qhGTvbPIrQ6VSX+A7hjb3Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(66556008)(52116002)(186003)(8936002)(38350700002)(508600001)(6486002)(2616005)(83380400001)(7696005)(36756003)(6916009)(86362001)(38100700002)(66476007)(5660300002)(26005)(316002)(66946007)(4326008)(6666004)(7416002)(8676002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wfDTZz9eAsyQtHziWtVHj0VkzOZp/e2YvUQcAUfxkC//EYT8STdRhBpKm8EJ?=
 =?us-ascii?Q?XgcM7HBt9PwnN9181tDI4LqaDcHPVhOq4Y7GveegHPgKFfKMoZxCZEQ9LARt?=
 =?us-ascii?Q?6epNdkD2DHO+XxtdgoehRfp9gMsD0LlC6bz16/A75bdYHmWGOVs/PC8RbYvE?=
 =?us-ascii?Q?K940bcL6FkY8qQJ9XNTlhyp7YuMNMQy538dE8H8i/Bpc/J3tr3VcWpdUi5mE?=
 =?us-ascii?Q?A40wOuLxpT6lqKgykJKdG8SU9fLwx01ZspMRcxoZKqWQzMuZTWIVwdCcyVO8?=
 =?us-ascii?Q?X2B9LbIxhRqDaXHvqeIynKW4roEILMj8oBIhxiaSBbeD0B1yLp1pSv6Rnxb/?=
 =?us-ascii?Q?QEXdVApRwPA6Sw3N3GJ5CrxNxJinIo2rbhSb5YPDSxr5lnGYU9R94FoA5Msg?=
 =?us-ascii?Q?TyVMNvuzcNaQu+IAqEiDD1ASuWFbmoopsQeDm6iGTygE1jIf2Yb3wyVTXHil?=
 =?us-ascii?Q?FDOHA/ee3TB8jWXwwrQod6UxZqk5n0YyspDTp98CkUNw18Xiu6A0ziqdBViy?=
 =?us-ascii?Q?9YTan5fDAWGmN3dPuz+0oPwWjkzgy8aQTp70vgCglCNW456m5uEoGv8DmCY7?=
 =?us-ascii?Q?G1aZErNv1SozYONGPUi177DxV/Q/MdLaQbl/j6lGCOpj6g6yHI27DNT6PRxT?=
 =?us-ascii?Q?MJoTtlsE9LmknkNKepvr6Quf90TACn4b4yFsOBbsLVtfDVecBARPqFur1Yue?=
 =?us-ascii?Q?uX2T6PEF+BKC+JgWJEvP7mCUHMlRqKDokjezUvKYbjZJ7X5IXTss6PmM4jIh?=
 =?us-ascii?Q?eOOyABcLXExOLbmKphJGgzGx3OvIMRZOmx651Ql7ih8vfZbjyzOeq70nzaOh?=
 =?us-ascii?Q?FhIyXvKUcc6lddGs02ZlMuuM4g+ZxiKMPvV42Ak3LoPA61oDxY2RRd1DStEs?=
 =?us-ascii?Q?M15TOJT9TLj03FW824rtAPq737VlY44+QV91LD6MNt2Z3Ljwyi1s40I8wH5n?=
 =?us-ascii?Q?AV5f+FngF2CT+1VUh2GrRq9wXlxlnUt7/hO65bphOf+oINohe/FjaBKDMPB5?=
 =?us-ascii?Q?2QYVcEANepbgXfm5NHds6hLzo0vpMygI2kNAHt0u3MCk5W5/mch31NWgYw5d?=
 =?us-ascii?Q?v1cjkXvtpxWgUfe3nE0Ls3hniD+TEGuw5w7h1ODti7SFlcqBW6ZXGjbw3JtA?=
 =?us-ascii?Q?nk7nrIAVY5or7Vb7k1Z+tVLTcR7fWheN7ukHKIylKa//EVz01V2iW6WJgsQE?=
 =?us-ascii?Q?Qq1rJGonPZQ+BIz7S104/hcWb7s6bQKHBqB5Jp2tb54PxYvxn7F1zNA++9dB?=
 =?us-ascii?Q?JpnOH32jd1vDsxEOAOohwYNm2dS5rStmXx+z0TF/6R86qtcq45cuYWrwzYup?=
 =?us-ascii?Q?hR3YPNFLaXPCnllYwCZRDCbgID9dxMPYhSjFoER5zMS+h/x3GvN6RTTyNdVS?=
 =?us-ascii?Q?h0c+1aqVnRxk5FP0JZx/S04zbbYZ7PV49qB3XbnP7gds1JFQk2Ia7RVP4qEw?=
 =?us-ascii?Q?TkqozwKz52mAtBeFjwqC0cjHqZCK0/gDLmF6WT/aYwKmclmj/yzENHtSUR8u?=
 =?us-ascii?Q?LkdzxWfGmvbLECnPfbzf7A8UW+4hjUpgDWmXlxPhI+k3b+GwkMHeHxpvLMqx?=
 =?us-ascii?Q?4Kx+gQJf5pUOg/WsTt2MTud1iz8Qw5qCiLe9ju4OUCyems21JEqn3+LR6il6?=
 =?us-ascii?Q?Qvy6KarLGKStDfNMpY3MB6w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238f27fe-ad6c-4544-cac5-08d9b8b61e20
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:18.0910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pERmCvDLpEZNDwsAc9KWlts2HUMAQ8+Pvr1dp4Dy6nNfZE2YW+WVIuakWs6pV95CwcsMBY+En/4V9G9IYNuZLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060078
X-Proofpoint-GUID: AEkSG1uJofawukMt_49DoOMnWjqV8Ot8
X-Proofpoint-ORIG-GUID: AEkSG1uJofawukMt_49DoOMnWjqV8Ot8
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

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device's status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   5 ++
 hw/virtio/virtio.c      |  84 ++++++++++++++++++
 qapi/virtio.json        | 220 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 05a81ed..0b432e8 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 76a63a0..b8112ca 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3924,6 +3924,90 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+        return vdev;
+    }
+
+    return NULL;
+}
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = g_strdup("little");
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = g_strdup("big");
+        break;
+    default:
+        status->device_endian = g_strdup("unknown");
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = vdev->status;
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+    status->has_vhost_dev = vdev->vhost_started;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev = g_new0(VhostStatus, 1);
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features = hdev->features;
+        status->vhost_dev->acked_features = hdev->acked_features;
+        status->vhost_dev->backend_features = hdev->backend_features;
+        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 5372cde..235b8f3 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -66,3 +66,223 @@
 { 'command': 'x-query-virtio',
   'returns': [ 'VirtioInfo' ],
   'features': [ 'unstable' ] }
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs (number of virtqueues being used)
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VhostStatus',
+  'data': { 'n-mem-sections': 'int',
+            'n-tmp-sections': 'int',
+            'nvqs': 'uint32',
+            'vq-index': 'int',
+            'features': 'uint64',
+            'acked-features': 'uint64',
+            'backend-features': 'uint64',
+            'protocol-features': 'uint64',
+            'max-queues': 'uint64',
+            'backend-cap': 'uint64',
+            'log-enabled': 'bool',
+            'log-size': 'uint64'  } }
+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (VirtioDeviceStatus)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: Corresponding vhost device info for a given VirtIODevice
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': { 'name': 'str',
+            'device-id': 'uint16',
+            'vhost-started': 'bool',
+            'device-endian': 'str',
+            'guest-features': 'uint64',
+            'host-features': 'uint64',
+            'backend-features': 'uint64',
+            'num-vqs': 'int',
+            'status': 'uint8',
+            'isr': 'uint8',
+            'queue-sel': 'uint16',
+            'vm-running': 'bool',
+            'broken': 'bool',
+            'disabled': 'bool',
+            'use-started': 'bool',
+            'started': 'bool',
+            'start-on-kick': 'bool',
+            'disable-legacy-check': 'bool',
+            'bus-name': 'str',
+            'use-guest-notifier-mask': 'bool',
+            '*vhost-dev': 'VhostStatus' } }
+
+##
+# @x-query-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Features:
+# @unstable: This command is meant for debugging
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disable-legacy-check": false,
+#            "name": "virtio-crypto",
+#            "started": true,
+#            "device-id": 20,
+#            "backend-features": 0,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 2,
+#            "guest-features": 5100273664,
+#            "host-features": 6325010432,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 1,
+#            "disabled": false,
+#            "vhost-started": false,
+#            "use-started": true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disabled-legacy-check": false,
+#            "name": "virtio-net",
+#            "started": true,
+#            "device-id": 1,
+#            "vhost-dev": {
+#               "n-tmp-sections": 4,
+#               "n-mem-sections": 4,
+#               "max-queues": 1,
+#               "backend-cap": 2,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 2,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 5100306432,
+#               "features": 13908344832
+#            },
+#            "backend-features": 6337593319,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 3,
+#            "guest-features": 5111807911,
+#            "host-features": 6337593319,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 2,
+#            "disabled": false,
+#            "vhost-started": true,
+#            "use-started": true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1



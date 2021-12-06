Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A7E4695F8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:51:37 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDSs-0003uR-Nu
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:51:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMm-0000nq-BP; Mon, 06 Dec 2021 07:45:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMX-0002Fx-E7; Mon, 06 Dec 2021 07:45:03 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6C5As3023240; 
 Mon, 6 Dec 2021 12:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=vpDDHdD9kYc7wKoffkPNE5S+j6a2NnQoQxim/rS3xag=;
 b=Yq1Za2dVm2EgHI4JZYcLi5ltTLpkNBc7CIxIkrlpSU2lx2/0UBK4LelXCpoocf4FETQT
 5xJCGl9Yi8NF5tW3Q2vDrEU4D31SsdjM+XDpsP1O5/2pzP1XFjnNb/tnxIeBjwyeoBDm
 0yAKKm+2mRaCl7ZOtqpgjJNk1aXa/cuS95NGEwjWieZimgb2Ck2tw1D/Be/Ue/0q71gv
 SVe6M3j1kzmieEBhECSmSMc+u9rq1jFjiH7FxVaUdb74yaVtB3M9BBfFBqN4HQmMg+0n
 a7ORl8q4zsOLOfBzhDDPAoRhvnLk97urTngD64j80jk5WArKLpa6Cc9q26jA4GZHwL22 OA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqj2pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cec6t084125;
 Mon, 6 Dec 2021 12:44:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3020.oracle.com with ESMTP id 3cr1skys5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fveAxBoEfBF/2IrdOpIbko387L/zm7Ruq0GxzbcJth5L8FmC43GtsXWyKc5HmqZJc/W4x3Vfrd/R486OJwXgSfTFCN/z4hj9DJ8HRcFux/DhFVktAFbiTa1EprQcXcWpewEtXhIOa57ueN0Hb5Y/Bds7O5wM4cpqBy16bu4Qd0R/11HQfViE9EKdj65jvb/x/WBKgDLVoy2zTI3cuK1IdYOeO2+E0Y/l4N4HUbICWlz3U6YJmsd1feFjkOqbl8+Y5raoG4Vx18cNSV6wRi58Ldg0dgOWWKBUi9DtWgDtOrr+oe94CI+f3ikgxlUSygEwwIL29MiOrpAhGuqOA29/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpDDHdD9kYc7wKoffkPNE5S+j6a2NnQoQxim/rS3xag=;
 b=jqgf5s+13V9q1/WIKdJxynmVL4FJ/FN9IBWj8WKCZiOzmBf0YAnPLohbJ3oRGIlaP4wwIERAee3oHD8ZUIU50v0bL7JAaV/9cvLhmklolCw39ikdzT/BePUsZ54Zd5PnIkexMdzY4R8UGS+5b/5HeClfg5gCWSPFPCTFzmNB6aXCywXAEjh8Y3dD5nolyBFwy4NE63ZiUCv2fbsaDf6VeIMmyoC1xtF6zQs/1B4xF3k1lkKIzx2dJ+gXFudJ4bXdc5i2xglUu82YHMDdJzE8VseAoWZMtpf12xADTFvYMkcy3GeP/BfTqt4RMVkL5Zt4j1oeGlM7TpcUe96WCdsyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpDDHdD9kYc7wKoffkPNE5S+j6a2NnQoQxim/rS3xag=;
 b=ADnpviBn2cCG8L2KYlpPYZ55Tmf5gb5M8tHUQfTS69zxEo6x+eXZMKDErDrL3migw5tQNAE1cWMavll6cs3y0Ve+G20W1yOvjFN1VTeWT3DEevArkhOOMz5ZpL1dOLBIMvhhm0BvMHUtPBwD1aUP9h7JOAqhvvQq+zHy3gSRUdg=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:44:23 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:23 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Mon,  6 Dec 2021 07:43:24 -0500
Message-Id: <1638794606-19631-7-git-send-email-jonah.palmer@oracle.com>
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
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f98584-d095-4880-9efe-08d9b8b62179
X-MS-TrafficTypeDiagnostic: PH0PR10MB4791:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB479173FD4B204003FA8A8994E86D9@PH0PR10MB4791.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pftRQD2AE1kQHaPkI8fLD7+osnwScbqrGepkqZ8CyVcNWMY1LY/9FQ0pTGNJT3mcensrcJJPhAPJnuvz13UdlPO+kntXcyJIQtZVg5Q9ye8U63Cyoifvsg/R/5TPWDLua8AKVgAT703bL6qJO0z3nCPZDtlSMGZbYyJ3BGjqsaeeMhg7iqtEIrGWutXrAin6nJa1qJHXN/VHxVMpw2rYL/Apx86YYZw3DzunFYm1BCfriG++jK7+nKbo528LqzR3OTSn3XHeyRu0NxDM5JjGxMl97zYmO/ZdVP3Y6upmfiQCBOR5zMq7VdURfTwxziItSxfYnmdSAcOjNPl4ZCO7p3nYCpJNpnY3Ti36r+9e8qfKaK6BHnT8jaIsAFkCYG8ZzVZ4q4LtixA7bpO4dER9uJhIR6qr20cvo9YRsxK7LOHUxwf4QZYLrdmd+hBETgBD6ayU4xl9ktJmDEbnJM3Wv2XlwvM8+j0V5KSfH0vctkNmM7l9jFNx2C0jtfBgvgMhmoekZez20owljRoqZEH6574uaAZR6wAS1zxFaUVnwNTJCA46UpWYm9PcJ2hoIkIfjrx9CrLk4heKqHTwEv2aWlVUvDUtpDZsfsDTa/jnREJWlgcyxOr+QCmsJF9430AwlZlrdLOOT3e/PdHKYhNK/FxwGAVDZbstwiebD0ERn3dTqdgaCPHhgEZo3kjtg88V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(66556008)(52116002)(186003)(8936002)(38350700002)(508600001)(6486002)(2616005)(7696005)(36756003)(6916009)(86362001)(38100700002)(30864003)(66476007)(5660300002)(26005)(316002)(66946007)(4326008)(7416002)(8676002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AdBm0C6yD2EwfjuTD5nAO7UoWqO48wjEB/fYZVgJV8Hzxo0FO14Z01EkYX2S?=
 =?us-ascii?Q?FDROUKY+aifFFtTxY9E8RTzKEUcFzzNoM8t9UnpKvXToXnqNG8bzLGAl0FVV?=
 =?us-ascii?Q?u+4Csv/L4KQToJ9kjjvzlcgKSl+8DA0LLSdx3E2M/ZGOE3qSfemBVxzUfHHw?=
 =?us-ascii?Q?qaQI4C1+mbDC1zKj0I6ob5QqI9MpAJzNgGoPMdSkeDwQJARvZOgDcXm3MD1C?=
 =?us-ascii?Q?9OIySAKM/rekDyKKV4R2xcqFhhfTBE6ykh0hKvG2ydf2B6QvYtOMUW1WRDdS?=
 =?us-ascii?Q?gIOwYVy32qCAks42WBjs+S22B2a6EsiKebJL4JUZDDohuf7tDW62M8xyTQBM?=
 =?us-ascii?Q?GpIN1IDA3utblRmhds3eZwNnO4j7rzLrJE3235LeMlRmkrxfSCBIn6nsJlhM?=
 =?us-ascii?Q?FXjcU4fLouMwkowaYsOa36QyT6fCjWMIQSE1f+HxmuFbYStow04kZn7jZKKW?=
 =?us-ascii?Q?lXNEChUhfitKwqL4re6++BdP/KTTqSyuC4JgCh0Zw6WgrLqddbYz5WjztN52?=
 =?us-ascii?Q?hYa5mX21snUxnd1wIGLHnCX3hb16UrjPOyIOLOZjdW+S21yJDvi5g5ZYLv8B?=
 =?us-ascii?Q?I56FfOw2FcOSKtHyt2+Wkap3LkgxFttLrs2QVrBeA9oS/g6S+S029LMRlr5y?=
 =?us-ascii?Q?nGNMoe9ZpG12AD06IInBVdvKsMZ04vTloz5mSItKIc3MEpx9FQNQ7Axxat7o?=
 =?us-ascii?Q?DH5ZW3CkEQi9z6Ko71r8Gx4kQF6Qm0kWfpiluX4Cj203i8D5Sq+zeHYX2TM6?=
 =?us-ascii?Q?Bbh4LxEbjevxQpzDv/m9L2yZBdosQs+9L8w9I8Doq06labsh+EtKdckDTPir?=
 =?us-ascii?Q?SKDZaYipsZq7zVmLSrcCTmWvFzeGw+a5sSKIRKzcd1BGoV65RruChkhp8NhA?=
 =?us-ascii?Q?FyS2vkKhRvsEo5cFra9MhwgXXqBt+OD4bx0zJubu3iJsymixSR8Obeci4DQ5?=
 =?us-ascii?Q?m1X0PyEt+iAoNHAUmhAbcp8FZOdEI+6XbzqPfnRzvx/VAg9ul4nM4gWYP7ZR?=
 =?us-ascii?Q?yOty5u315hEbPTWk7FceDoQsVE/zN1rL7i9CmjY2p55QAlbMdISjuAELdeGH?=
 =?us-ascii?Q?KdgyJUPUzpMyc7N2i04oj44lJPNw+ZkQCbJE6Wf4o6kayXZQ11bh4j6FQ7BP?=
 =?us-ascii?Q?xbCgGrlSz8Chg7jI+ugqVQqmRYeWZysL3QukEC5o9uTpKOtrlaHNDornrAdL?=
 =?us-ascii?Q?J2kv2qejF54FJNDD9HtGqQfW+EMGKAnqNkd1aglk0otNUi7lBJVEaRlE15gc?=
 =?us-ascii?Q?Tf+9sTvRlpRxVf5zJ3ekTK/gi63uNEBUiTcsrRKr7pd08jMvSF7qC92wFj8E?=
 =?us-ascii?Q?OxK9k27EThyf4gXiLSfotWo+BoQ4WfG6Rh9s75VxQ0Xm4e0DvZE2EN3IQ3Oy?=
 =?us-ascii?Q?YsA2h5Ykw56stjy1SAKAFXwmv6jt2qmzWEWq9bcva3X6LcTTpYDLZ9SjU+b1?=
 =?us-ascii?Q?YINZrKf/w3S23ZJhjHk2+sYTyc896BxsDS17tevWvhA/yA7JVeRPMMqxFK/r?=
 =?us-ascii?Q?P8l1e02WJQafcPHc2ekCmLgKGgrYxSrSlqJThNp732jNsqISXg6E8imA7hHC?=
 =?us-ascii?Q?t34G4ly21eSqO9dyqQV2wrOCotPdMXoxjpzOaoOcOZ47++NCuU+nBRKzs83l?=
 =?us-ascii?Q?vMz4wdWgdhmsI+Ir3Z+aU9Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f98584-d095-4880-9efe-08d9b8b62179
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:23.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWMbWw3gI1Zci/Yq7oqejmPB9rnlpmJb5pMuVqyyQIcD1/uZSNk1gkbcnyoI4egzcJBJbNgl+37p5QUBAopRIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060078
X-Proofpoint-GUID: CqVsEvFyB8dF6_XzlzNUy_sztwZ6AaB2
X-Proofpoint-ORIG-GUID: CqVsEvFyB8dF6_XzlzNUy_sztwZ6AaB2
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

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++++++
 qapi/virtio.json        | 252 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8..13e5f93 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b4b2af8..459bfb2 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4278,6 +4278,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
+    status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
+    status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 7ef1f95..56e56d2 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -402,3 +402,255 @@
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
             '*unknown-dev-features': 'uint64' } }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# the VirtQueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc (descriptor area)
+#
+# @vring-avail: VirtQueue vring.avail (driver area)
+#
+# @vring-used: VirtQueue vring.used (device area)
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid flag
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'name': 'str',
+            'queue-index': 'uint16',
+            'inuse': 'uint32',
+            'vring-num': 'uint32',
+            'vring-num-default': 'uint32',
+            'vring-align': 'uint32',
+            'vring-desc': 'uint64',
+            'vring-avail': 'uint64',
+            'vring-used': 'uint64',
+            '*last-avail-idx': 'uint16',
+            '*shadow-avail-idx': 'uint16',
+            'used-idx': 'uint16',
+            'signalled-used': 'uint16',
+            'signalled-used-valid': 'bool' } }
+
+##
+# @x-query-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice's VirtQueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device and
+#        the VirtIODevice VirtQueue index (queue) does not exist for
+#        the corresponding vhost device vhost_virtqueue. Also,
+#        shadow_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device.
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5217370112,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5217372160,
+#            "queue-index": 1,
+#            "last-avail-idx": 0,
+#            "vring-used": 5217372480,
+#            "used-idx": 0,
+#            "name": "vhost-vsock",
+#            "vring-num": 128 }
+#    }
+#
+# 2. Get VirtQueueStatus for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5182074880,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5182076928,
+#            "queue-index": 20,
+#            "last-avail-idx": 0,
+#            "vring-used": 5182077248,
+#            "used-idx": 0,
+#            "name": "virtio-serial",
+#            "shadow-avail-idx": 0,
+#            "vring-num": 128 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus',
+  'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device's vhost_virtqueue, including most
+# members of the vhost_dev vhost_virtqueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this vhost_virtqueue
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'name': 'str',
+            'kick': 'int',
+            'call': 'int',
+            'desc': 'uint64',
+            'avail': 'uint64',
+            'used': 'uint64',
+            'num': 'int',
+            'desc-phys': 'uint64',
+            'desc-size': 'uint32',
+            'avail-phys': 'uint64',
+            'avail-size': 'uint32',
+            'used-phys': 'uint64',
+            'used-size': 'uint32' } }
+
+##
+# @x-query-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device's vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command ism eant for debugging
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5216124928,
+#            "used-phys": 5216127040,
+#            "avail-size": 2054,
+#            "desc-size": 16384,
+#            "used-size": 8198,
+#            "desc": 140141447430144,
+#            "num": 1024,
+#            "name": "virtio-crypto",
+#            "call": 0,
+#            "avail": 140141447446528,
+#            "desc-phys": 5216108544,
+#            "used": 140141447448640,
+#            "kick": 0 }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5182261248,
+#            "used-phys": 5182261568,
+#            "avail-size": 262,
+#            "desc-size": 2048,
+#            "used-size": 1030,
+#            "desc": 140141413580800,
+#            "num": 128,
+#            "name": "vhost-vsock",
+#            "call": 0,
+#            "avail": 140141413582848,
+#            "desc-phys": 5182259200,
+#            "used": 140141413583168,
+#            "kick": 0 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1



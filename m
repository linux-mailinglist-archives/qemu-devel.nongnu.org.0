Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42444BEBC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:32:04 +0100 (CET)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkktf-0004N3-9R
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:32:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm7-0002Rn-OR; Wed, 10 Nov 2021 05:24:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm3-0005Cg-SY; Wed, 10 Nov 2021 05:24:15 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9Suc0032052; 
 Wed, 10 Nov 2021 10:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw81oluvVsTeHGSj3aHaoSMw4D7kyALKimNR6KDxFps=;
 b=FL8W4C85Frz8emSYvuRyJzMTJEp0BlOfWK+lCIOTRdJgrqeEb7H2hIAr3SagVD/3vPka
 BJKLS9/Ouz8l+IyaDbBtZXsjgaPwDm7oIzRRkkNs7k7B9SQcrDVcD0V7gQY5cdf8i8mA
 Iebc7Bkel/SE0Zi6ZznAMwn67/HTttwuT0i4sKwRDm3Hpkk1yPk749WCW8/FFc6hSuys
 CIdT3qy8ohxPb/ZOJhiKSWm41Zyw/Z+TzA+LDxCDRdylZLdYzmuKtIX8GV/YjTgOU4c1
 eddYbAPXMS9lACAmSw9iNMjZ2gscVeH0MMtNtUyVCO2F0reU6JSmfZfjesgprcUgSYm5 tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c89bq934r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAGOCV034660;
 Wed, 10 Nov 2021 10:23:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3c5frfd2wh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU+hXQo8pzrNnQPabTHLYTbxgl5pD2l6Ynizq9K9o8cstnfZ4IM/NNRl17RaimdKAa2fLgcKm8q21JZJwYMA+K1cqJRznv5EfcZIFSIMvEFP6vAIuK2FuKHD03tWytrBMWMEQV68Rv6JUko6vnn1vH4NeNywn0Ixs+98CtAQtLyEf6u0aVyaGXpjmW++LcCT/fVUYu3HkkSCc3mQzhnc14YJCaYEdA+ilORe3Z08Xf8U+fd+8YjF1vZX89XKTzNzSg+UXQzdmACWoRwLKeGu61Gx1E1mHgYw0XUHDfjpGZwBpeHpssSerSvRjHK2Xt+ELMa0ClWHlrlMYgS6uWFsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw81oluvVsTeHGSj3aHaoSMw4D7kyALKimNR6KDxFps=;
 b=HvAcUMW5RNn8IjbOogqEfPCTDzSO3+xX+z5J9ouE2lHMNNOz8Osm63Aael0tLird7J3MYPRA/hCR7HY+9OP2+0Cxq1vUgaAz6ugd7vyFUJNdrBgI+gPle3YHkk12TkLait3IB9okLds4LXsx1qWBo+bYjaDYqDqCH/in3au5qirdGWuCj6c6NwftwfV0IxvyUjpyucjYn4z26fuirwOI/k/2ALGTe6DskKFJuxpRZ4KjQutY6TafBeuUKCXYTbkpIR6aT8Jxm8O2xTIYipwQZt0/tmGBx4l9mx1UrQgPBEl+FeJlIwy8RNkT4jXS0yP2jvzZkHCSghHpxdIH9nG4Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw81oluvVsTeHGSj3aHaoSMw4D7kyALKimNR6KDxFps=;
 b=kHDELTf/0eF/Xm0VapqawYgB2sOzLWiifMiWNuWPgw17WSQJ171dnvWG7Cdj6KWFkSmEC+TY7DfGl2yicgigG9LGSRvy2+FRMOoOGC7CAzd4P82xV/QdHpmk62IlSNwW5yItT10XWvf8NkITknb0k4bw1gqpR8fuiHn9N7hyNzc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5895.namprd10.prod.outlook.com (2603:10b6:510:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 10:23:54 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:54 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Wed, 10 Nov 2021 05:23:10 -0500
Message-Id: <1636539792-20967-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff6660bc-6990-49bb-0802-08d9a4343244
X-MS-TrafficTypeDiagnostic: PH0PR10MB5895:
X-Microsoft-Antispam-PRVS: <PH0PR10MB5895B086449BAA389BCFFBE4E8939@PH0PR10MB5895.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRkLoNAoSDkc26EG4hGFlNaBMOJObPw1cGXyJrgDa9G0TWURxkjXpri9c+cVz5Y5+JPDdB2TcPgnFK2ynDBInbsaJ0AujJQXXZWCasvOc9skRKSlRCzdxoCh0Nm4uI3hota+alDXe2ZoPCIIOTC4Ap2sUUJtnNDz7vDdp0HzgQBw/NYv4vPV5xgmVzQTKmDuK8eOt2adrqbE1nbJVlfJyb2ni+BwXrJgREKhyaKSp8A7j9g+KB2mZKVL6fusWT6gavwcrD9O7J6hPs8rBpo6g1AOCc28mRZkQ6xexOXBL2laMe0dU2pCjLM1zDmPinjKEMF/XdqrGrmg/Sjl80c9gScL4/Iz/iBWgz1wqNya6/WXnSheOSNBxHTuV0VpJac3Z3IgmerM4ipPqC37anrUF36awYxSu4BraaQ5+abYW8KTgwzq6w/RBEmW6e7Wer6tVOY/6LBvLdUjkRBa4P0KngWuwaz7QRhlyG4rEAdcTz03HjjEcnIYiOKsgu5KT3VPpXgw9tDZJYZn9Fm/cre0MX9MkyDH+cHXss5C9hFGLPAZSQ+EGfQQ51EWmV8p7wlDJHk/htz1TpFIMy3erYFFBQBqf+lRyFPf2j5y7r3YtjKc9nBgageOUHNv8HVI7HiSCveSy2H2j/9kQSJPl29wYCYcjWuQYYUA2ZetOiHILWAQWAnxQY1P2oTt3PUOx3ZFAFFhvQp0P5PBhlwMjP4oSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(7696005)(44832011)(956004)(2616005)(7416002)(5660300002)(6666004)(36756003)(2906002)(26005)(186003)(30864003)(86362001)(4326008)(8676002)(38100700002)(8936002)(52116002)(6916009)(38350700002)(6486002)(66556008)(508600001)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AZV+IRFeoUW45GGrTzN5s0ohgP+ASglsMPXulWV8CLRvk9qFvLOx3bRxmGpq?=
 =?us-ascii?Q?+NNEEF6u9/xKfack8X/M09ouPYndGywdddcbNC+VQuw3dcoeo4stkmldP7g7?=
 =?us-ascii?Q?JhYPy8U6ytS+WSX8sImCXtTmutfQZKRX31WH6ifPS+lXgxGFlQh5Gk30Ykof?=
 =?us-ascii?Q?YWNcAF5OUXWovYSPF8ZgtbJ37qZnOWCIFovYxEQdPmFFMByBsf0BS51F4i7X?=
 =?us-ascii?Q?fMmywZx4dWK+6bEdetCEW2ihEFwhA0pTOK7YflqhbUgUfbkpz45W1f+CE6Gf?=
 =?us-ascii?Q?b5Y5eQGB4ZLEfk18VXExyGXHUXJneaIkMtjDYY5lp90FYaJlpVEkw9EIoONy?=
 =?us-ascii?Q?5Z/M9txIL/3ZOtFXuFoqB9paFzZ6MtTdAkuqHFgmJoSinh5w7JN8Ju+GCJZj?=
 =?us-ascii?Q?J6hNlhemwt5/5xhdt/tftZS/8t8+0IBMat+d3MidY9IZQVDCiW0Afk6b33q3?=
 =?us-ascii?Q?Z9ybtz4mnkrPJmCtQ7gt0zECYRcy4oTk9sXPqTaJqrg3F7iru77nSn9oH1x5?=
 =?us-ascii?Q?2m6Few1miidsD2ToQVVV81m9Wj2WWkW0xvMe9JagpMsvKVoMshwIOeBYxbel?=
 =?us-ascii?Q?lk4x+JCY0VHdJkgF5m4eTbhBIR5qsu7x5ke+imlZMSQMvSUizANTk+nlmpvE?=
 =?us-ascii?Q?NvnNzWzePmXO9KoigBnSDiLPDx9PO5/rBapRbeCBj6CNlaqwO2rjtbXi5Pu/?=
 =?us-ascii?Q?dfFrS0bAtGnBVm9H4tb/z1E4698EUTJjaoYLcmfL5DwOE96eGV/TcETyYZv0?=
 =?us-ascii?Q?ij3mSi4v/Sahmv1agZxEoWT8fjRk7PEn+yU8h71vj6JyCdsTCkKmuBiWv3/g?=
 =?us-ascii?Q?cfhj1Iqf87weRj7FNlwfOwx3N2t03d6yv2dThUdbLffzlCHWYkCAdvA7AT7U?=
 =?us-ascii?Q?9wiBp6yzv4uAEGwxVQDQaS5CTjn9TL8wl3a/weDVOfyEyPm1SgLRm+T1nZah?=
 =?us-ascii?Q?H0753IWN3p79eg04cT5M3oZXf5hnAdEulgjNRvrWlDaL9356WlUL9gsC12p0?=
 =?us-ascii?Q?rSoXca6SHmBCdyYxXCnvbAPB2CUgeOTXP3ZSDB5IKtBDliOfyLElTxpM4DB7?=
 =?us-ascii?Q?r0XuJJ9+YWUxAR8RwV7reXdUxO7lbKoCIKA3L9szAqjpWKLe8eVcTyd6ZE0/?=
 =?us-ascii?Q?WQcer8+UEq8G2u8AUppTtoETRCS6xJUeMVLPH09Z0qL+iDFEl2CWHDDwpu98?=
 =?us-ascii?Q?OV6oQaQDSd3oFnbOwTUbTt3xiqsUZeFLO2/xRr0pUJH5FaR23Cw/0sgHVL2j?=
 =?us-ascii?Q?culuzk/RdmEX3sa186THR9osIzkpNYTn0VvdUTz9XfbnAcSnNpayM1Z2Lm/G?=
 =?us-ascii?Q?gaS1YHekzPlTsG55lApydz2EI7t5Rtwi8/5sMYse1OhBoG3n8tR/PoGUhmN9?=
 =?us-ascii?Q?XvFuu03ZFNkU1B84O6OPGHq1NR7pCjciC71hnLKHfFy2V3p68NecAaxa2IgF?=
 =?us-ascii?Q?UJYMTqmTC/F3ma0NxH/QStJTgHCkTWl/hSuUeNC/Ai4uxNnAEEkz+8vb+hLw?=
 =?us-ascii?Q?6eIDtdrty0zLnkgwGS/3KBpsY1q90Jp9WsXOY/ujOI/RdiYdn9Cqnmr1ZB6f?=
 =?us-ascii?Q?AmSIjISbZQiObaJf4pC4gFIHsXB1FOJr8jLX/lfhqkH2jAV554ot1CNjaaeO?=
 =?us-ascii?Q?PYsqSxoxPokcdi9P0LfayCI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6660bc-6990-49bb-0802-08d9a4343244
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:54.0788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbf2jwY66rPuxcN6yEYCLx/rliN03QKjxzxfq2lFQ1rhh/BS14MtWDXbunQb9DOJhUlLGAKYjESVPIG8NTyHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5895
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100056
X-Proofpoint-GUID: mpLXD1VbLcmFHqtZ8C1DMwvo3pZ4VNcE
X-Proofpoint-ORIG-GUID: mpLXD1VbLcmFHqtZ8C1DMwvo3pZ4VNcE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

From: Laurent Vivier <lvivier@redhat.com>

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++++++
 qapi/virtio.json        | 250 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index acd4148..3484b1f 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char* path, Error **errp)
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
index b3b3578..160cc90 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4289,6 +4289,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
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
+    status->device_name = g_strdup(vdev->name);
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
+    status->device_name = g_strdup(vdev->name);
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
index 6b11d52..0f65044 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -811,3 +811,253 @@
 
 { 'command': 'x-query-virtio-status', 'data': { 'path': 'str' },
   'returns': 'VirtioStatus', 'features': [ 'unstable' ] }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# VirtQueue data structure.
+#
+# @device-name: Name of the VirtIODevice which this VirtQueue belongs
+#               to
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
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'device-name': 'str',
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
+# Return the status of a given VirtIODevice VirtQueue
+#
+# @path: VirtIO device canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device
+#        and the VirtIODevice VirtQueue index (queue) does not
+#        exist for the corresponding vhost device vhost_virtqueue.
+#        Also, shadow_avail_idx will not be displayed in the case
+#        where the selected VirtIODevice has a running vhost device.
+#
+# Since: 6.3
+#
+# Examples:
+#
+# 1. Get VirtQueue status for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": { "signalled-used": 0,
+#                  "inuse": 0,
+#                  "vring-align": 4096,
+#                  "vring-desc": 5217370112,
+#                  "signalled-used-valid": false,
+#                  "vring-num-default": 128,
+#                  "vring-avail": 5217372160,
+#                  "queue-index": 1,
+#                  "last-avail-idx": 0,
+#                  "vring-used": 5217372480,
+#                  "used-idx": 0,
+#                  "device-name": "vhost-vsock",
+#                  "vring-num": 128 }
+#    }
+#
+# 2. Get VirtQueue status for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": { "signalled-used": 0,
+#                  "inuse": 0,
+#                  "vring-align": 4096,
+#                  "vring-desc": 5182074880,
+#                  "signalled-used-valid": false,
+#                  "vring-num-default": 128,
+#                  "vring-avail": 5182076928,
+#                  "queue-index": 20,
+#                  "last-avail-idx": 0,
+#                  "vring-used": 5182077248,
+#                  "used-idx": 0,
+#                  "device-name": "virtio-serial",
+#                  "shadow-avail-idx": 0,
+#                  "vring-num": 128 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus', 'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device vhost_virtqueue, including most members of
+# the vhost_dev vhost_virtqueue data structure.
+#
+# @device-name: Name of the VirtIODevice which this vhost_virtqueue
+#               belongs to
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
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area physical
+#             address)
+#
+# @desc-size: vhost_virtqueue desc_size (descriptor size)
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area physical
+#              address)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area physical address)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'device-name': 'str',
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
+# Return information of a given vhost device vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 6.3
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": { "avail-phys": 5216124928,
+#                  "used-phys": 5216127040,
+#                  "avail-size": 2054,
+#                  "desc-size": 16384,
+#                  "used-size": 8198,
+#                  "desc": 140141447430144,
+#                  "num": 1024,
+#                  "device-name": "virtio-crypto",
+#                  "call": 0,
+#                  "avail": 140141447446528,
+#                  "desc-phys": 5216108544,
+#                  "used": 140141447448640,
+#                  "kick": 0 }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": { "avail-phys": 5182261248,
+#                  "used-phys": 5182261568,
+#                  "avail-size": 262,
+#                  "desc-size": 2048,
+#                  "used-size": 1030,
+#                  "desc": 140141413580800,
+#                  "num": 128,
+#                  "device-name": "vhost-vsock",
+#                  "call": 0,
+#                  "avail": 140141413582848,
+#                  "desc-phys": 5182259200,
+#                  "used": 140141413583168,
+#                  "kick": 0 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus', 'features': [ 'unstable' ] }
-- 
1.8.3.1



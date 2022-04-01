Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F104D4EEE61
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:43:55 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHZD-0004dE-2g
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:43:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGi-0002Uf-V1; Fri, 01 Apr 2022 09:24:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGg-0007DO-Fl; Fri, 01 Apr 2022 09:24:48 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CkYcb017617; 
 Fri, 1 Apr 2022 13:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=o8iQTOsQ3dz/4RO2J6MuKFEjAZAB4/RkoG8l376/Pvw=;
 b=B9Bsp3F+UngkiszFKaor3YoyYZQmK6O3EVZg6aIOpSiCQct+8NIrLwcaKkmFXUr7KaL6
 vkz0uvnXEnJz/gF3PvCKuFbJoDBbrwkJEr5zy10qSURWniPXV4gqa2qLzTHkLuvG+iSU
 SSzRotc6nt+pstd6tXiuwsdUJCYv43QzNzjioxG1WD87ii/8DQHib9+YA6nTpY4XclPP
 uPgs2fNiYeTg5EKS8ANDrY41IyUp6DzdQE2reKwJdTRUTPmemPveRcL8BtyXc/m8eekK
 7W1dC0MiFvjh6ira1x3PfGhcXMQBHSO77zK+VC6k1u9MKb1KWXFXgDdZA9Lrlorfsi4w Ug== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1ucty9xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:35 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DHPXQ011097; Fri, 1 Apr 2022 13:24:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s96j842-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFK+zedNiQguCMqUNV0XtAHKMWjmX7jdK80luZiJVLSQ6KbZSVbKQz7vN7Jn139PytemJAeloVCu81V0LEr92AlWps+4BJGOo7ErL5furhRIRZOvYUc7NqWO2asYkHiEoTkf76Qeq+6J69adMVYf8KY7r7nE2DXQWQ6NzK46xEtZ8lfhBd/RHCnxta4HST8XqHvu28VDimK24e8I8e1DYLs4OpZuvlux84Ab7LNIWBNoFCi/E/SeVU3URx4it4OV2XjygcHFns8vDAOBXhtADfz+y8DoW9Ds5BoSlsAqyPiwO/JXwVpacoyS9qBQie2+RMSv9r08FAmpXbyml5j2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8iQTOsQ3dz/4RO2J6MuKFEjAZAB4/RkoG8l376/Pvw=;
 b=dty0kHtiIUe2yzWc18aToZ3pdurY476u3m7GCi1lKgjJRfFzENL1HOMXHG5VxQE1r0bfpi49RmaTtvyJjYPDeZAfyEzUoABcO3OgsyawZ8ZTuvHw5nsbYIFeCp5t35mvb6tUqZEnyVFIQr7GwsyW9uTuGGlG7WevU3LBlQLz8SE/gXUYeLdonxECIz6E2lqv6pVTlSRIwt331YwHiY5buFb/TMCILbmHTaxJWp5YhBlMPy8NgnL9/zUSVLxNFklklielJcGE2lAEdQCf+wzEFfrN1y1yLku9jmZxJWCGnPzBVCCuCUckVNd8SR1OvP6YxZrhuLmxrOzpKproDGeZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8iQTOsQ3dz/4RO2J6MuKFEjAZAB4/RkoG8l376/Pvw=;
 b=o/PUDVZc/BNLlav4vyHd4dgIup+auAnuU0c42Nu4mj8TgnGaopEUcDJzcLQdWg2hp8I24TexqIQh/KEPVBOj00D0OlscGwKm6dUlRk0NjFYyxPUEgO1IzEboBMBdxzriPvxObV4o86fZaoh1M7pDagC7xcItXyOmpleLrqmRBOI=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BY5PR10MB4321.namprd10.prod.outlook.com (2603:10b6:a03:202::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 13:24:31 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:31 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Fri,  1 Apr 2022 09:23:23 -0400
Message-Id: <1648819405-25696-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 822c2a64-512b-486d-3737-08da13e2f4b9
X-MS-TrafficTypeDiagnostic: BY5PR10MB4321:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4321EC7193FF422679C8FE49E8E09@BY5PR10MB4321.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMM9KiciTtbQBf6pwp3oXtn3iTbWcEJWBuyI6cGBv1HImknUmxYFS+1z3u+bwam24WAK7GgYrdG5ktriB6oqn1ilpG1d5nSoo4cspyr6b9a1lvbBePsxaDKei8R66u1aMZeqTIa/qhLzY294TVHmzFyUBWrCL0pVYSv4dPHMcC5KNKY5dOP+gGFzEIwLpxJC3T0SYslxLczWE6eNrzIvNmMBCQIwdUMULCgXdyFSzPF9qmMaqWpPHf6zCzhwobMdUis/fyFU4Zj5QoWQFfG4aobjYZRfYow2ybbwV+0E4qOo112eoyQ7kNT/h3UC8zg9S0I6ceyowIUuajG50+m2zVM++/Dm6/EJE3PjRgJqRs6EjTVC+gI2ulQahXBmHgPGH6aVWQcyNLopix4Y0FFyn1hGbWvF2XZro1I7AENvW3c/QWKoxP+Qp4Q5272JRZOGUf/0jaQf7Cf68ILwB8cGr2RQkFyJDSGq5ieiB/PMQmXenF5+w1y2gQfH/sA62kPT9o6/NbLBcP047xrj47rv2rrJYzY5oE50fIke8pAqfrUgG7u5T6kGyYd4Kk2ZzOcT1eM3M6JnH2Q+hMME+RjsDYo47ITQnBVjzSObFFTQxo82tqIz/x+eR/uJfdjuahYqgKrIWKcTWauDV1DDgeZ/VxtOYW+OS2i1UTsZIo0PBiNmEesrdw0ltw+zkmVlvTlR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(30864003)(44832011)(6666004)(5660300002)(6486002)(6512007)(8676002)(52116002)(86362001)(8936002)(508600001)(66946007)(4326008)(66476007)(66556008)(26005)(316002)(7416002)(186003)(6916009)(36756003)(2906002)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wH1Yv/pqMQpEjJknj1maHMBDwUoj5CUQW10gwb+ky9E0wpODEmrZ75fGzuSC?=
 =?us-ascii?Q?puuu5O9oiH2BrysNsKShzwEhEgSgYdArnrxOimqVlCxZTe04fmBSi/9EqC0i?=
 =?us-ascii?Q?5DpYrJxt7YhoXvzc0+PdOUE7ryrknuCSXclsQwxyyi9KP/FDsuuBANtID9pF?=
 =?us-ascii?Q?nOuebLQ/wfwCMgqUUJx56sBNhFECfMQSVt/E4eJ/tXo3mW1eIaO4+IebqwSC?=
 =?us-ascii?Q?ujAmspxQO3JNS4QNQcNfzFAEh4Ww513OwE9QmIPCA9cZqqpFvbSOdvaGrqSe?=
 =?us-ascii?Q?kThRv7cSNiDT98kgMUuJMErnohJMl8+JjnQN9//fApr91c3UMiFXyz/7lVJh?=
 =?us-ascii?Q?Q0KblulvP3CfduAYBqOcdxCDByKC9AxDn/VbeJIPuHLztJsh7h05jEt2vYw2?=
 =?us-ascii?Q?hNpo4AYl4U8dgEROm3IQ/z8DsLWEPG8CX1xHUrow8MKuPmFzYWU5682GXFps?=
 =?us-ascii?Q?zi0h2PvLax5qScqwFt6MScMi4TFckasp0nyMX7hux02rA6fIxhqJ1M7ciRBg?=
 =?us-ascii?Q?DNfTMMiKqwYRxXhYGhU7Yfy+mRq6e8jZ08RmkBbcCKZlrCiaKZsFdDbcCmk6?=
 =?us-ascii?Q?o2/qbOOrN1feBnRk6J1IJ0NxyPAlG8b/3yf/HTs3UorTmJCV9ktYpkdMEPhF?=
 =?us-ascii?Q?chaXXtnx+DqCXGmfES3Cfyz73hJgiUrStZTCHLuPh3NltDwvCNOtAQ5wLr6h?=
 =?us-ascii?Q?YZMjKjKBHwTTaSmT/y2C4gZdtufKHA49ePzoWCiIMb7rETJ/+Wx25EeBnx3A?=
 =?us-ascii?Q?AhVvfIQ11O4p7+jfzOF1tZxsVRxVDpvMpZHoWNGEf4PbyLO5CSUGlIqP3jzb?=
 =?us-ascii?Q?NNTtlC4JtbBYL0D3nd1YeKaCU6jw5eedWU2QmDztdAFVM8IZM0kNDid8DrOL?=
 =?us-ascii?Q?h4D6aRYktFdpocv0AH8yvUyvO4n9XiymRwImkilmFMOqlNAZc/cwimII9mF1?=
 =?us-ascii?Q?/c2lSEg9gDwUtMsbKEyR/z0ZY0uM0XeT4Y9zs9SrOQyFXI3eFL9YBVWjPQfJ?=
 =?us-ascii?Q?eRuRHv29G9mYWodciPILQnZJd5Hwy0ch0MnrasF8rcca4BOJUS4zaznDmXeR?=
 =?us-ascii?Q?ezOQYUg5DK+G7vtdbTQF0osDADaBpSbmmGK8AapMGdhWnTb0X2vF5yvKZ1Uj?=
 =?us-ascii?Q?xiZweq79pgEQQfFa4yGNt1w4Uv4gIHWoWf+mV2ceYLvxRUZUKgjp2mQ0EYVs?=
 =?us-ascii?Q?jnSuZqh/Lk/otnrsz6Zm8lQ5HPnLPhOJe246g8XP1RJ/hluRELrRlTqdH9nc?=
 =?us-ascii?Q?SJoczJSFwoQTApFQ1O4Cg5L2ymD/4YSgmxggkzXByeNC/xhwxlE0+epz2Shd?=
 =?us-ascii?Q?WhebGePaH2yRTShATllz8HDERn4A0RNSTjNeZvNZz0LvdnlMp8Xw4omOQEPp?=
 =?us-ascii?Q?DogU56mllshmsNSJJBAyyGV9aBtyZcqkcwiiB1+TrK4uHmb1auavEgLysZC4?=
 =?us-ascii?Q?eIum2rqkixatIErhEukExOA6zrzvE0EEbzCUOEXxRqyN7U77//UwP3BSo1Db?=
 =?us-ascii?Q?/Iiai+ne97uB9sHYqtPtWJNrel3IwpU0wyi9qG9dO4YwBGFWDVRJgsQzk1+F?=
 =?us-ascii?Q?0UUsVEvMtFQAE7QeZnDd5wkNPCkCTzFeh452EDJIUXo/8lTorzsdYij13OdL?=
 =?us-ascii?Q?unn/bKqyu4t/uhHa5Ll3ueM7DGx0uJH+i5DZ82j/hQUYNLMQPyZmJ5+xJvmP?=
 =?us-ascii?Q?lm78FlftjYuNPaoV1eVgThy+Zy2gResLyU89ZlcKlDNhWF55KaG1stqPrg3/?=
 =?us-ascii?Q?HO7qR+RRGY5i2knzIdCN8Rt6saO5YQU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822c2a64-512b-486d-3737-08da13e2f4b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:31.7068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Y6c6FaxiMU4ZZJ8DKwD6x00D30S67dYDdUowa59fSCBUgU8sEQOx9nbHRv9CxdrLXoQn5Kc6l6A1+rbEeSIIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4321
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204010062
X-Proofpoint-ORIG-GUID: Q2SQb7A2dC2l2UofqSMVR19QbgVHS648
X-Proofpoint-GUID: Q2SQb7A2dC2l2UofqSMVR19QbgVHS648
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++
 qapi/virtio.json        | 252 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8de7..13e5f93652 100644
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
index af376be933..6d718d4fea 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4316,6 +4316,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
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
+    status->desc = (uintptr_t)hdev->vqs[queue].desc;
+    status->avail = (uintptr_t)hdev->vqs[queue].avail;
+    status->used = (uintptr_t)hdev->vqs[queue].used;
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
index 474a8bd64e..44cc05ceeb 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -404,3 +404,255 @@
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
+# @unstable: This command is meant for debugging.
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
+# @unstable: This command is meant for debugging.
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
2.35.1



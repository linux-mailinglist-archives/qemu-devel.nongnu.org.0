Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1BC3C4C9D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:38:51 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tKs-0003t1-Pt
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIs-0001Zz-29; Mon, 12 Jul 2021 06:36:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIn-0008Qq-Gp; Mon, 12 Jul 2021 06:36:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVCPL019199; Mon, 12 Jul 2021 10:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=iryMaJkm/yx0lqHXu6U/A9OeKSPigm3nkmR4paCI36c=;
 b=dDBbVUw2SmV/oN+shSPWwnUIyVmvQ0LUzR5MUyud0aUjnzOyaDLJLEkV39WcDxItibNV
 eQcCYHXKm9osWWhaJlBq05TQjnh6Loq8g4LlansoifgD5QscJUWe9MF3/f1qu5x8d7jL
 +xi/RUh4j14IZn7XWM1IHG5TwksJ5X5vTAVcdDEEDBFHolayCjVlut67OySJ2E7lK1Hv
 16+eg2gtrta3Q+xpIxNlzIMn04k9UtdLSet4jk46OPTG2wuY1TR+R56oSsvoGmi2/36R
 PtbV8NucPsSY2gkaSVOwlsXFJ+cSZJFnkmmthUch06lUvbW9a33RFULPPX1bTcgFD1vq 6w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q1ybabyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAYmFS001192;
 Mon, 12 Jul 2021 10:36:27 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
 by aserp3030.oracle.com with ESMTP id 39qycr83yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NY79NJWHEqxYjJIWdJrGVV19Q2Iy8MVf4Jexmwr6ilI0m+Yu/PzWrYCj0b4nVOdcj46wkzapBgNdr5edFAO92XsU/n0WR971Du4/WuLyKmNcuC/qmmqNPc3/GDUXfZnswT75MP9m17uP4HqA3hk5CA+R8DR/AAVnHsERxNcQ7D/cjE51hdPUvs7EQFS77GRuncHiGVXh318tBxrvlxPZHdCVvygXLWd6lIFobcE/T0gJ4H871ApZRETHw4Zfej91dOQ9dgN9ZzhM1tWMGXTbVDfBDfncSrkXDdde7Lg9sb5xrJ9IEaWjx8KQlZ3ta4o61+BhzMVW+hJMM0hCg73XLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iryMaJkm/yx0lqHXu6U/A9OeKSPigm3nkmR4paCI36c=;
 b=UEJaOf4Qt19YUAgqcrrBB/SKb8auCpsRxSBMSVTDOLn5elAuyafQuK6+p0462N9YpHSG/ep+XG8umA1DzV/SYfkio9btqMC3cf5c46eN1DW+cSWhJvicQ0fqalFZG1NPob97hTzq6NotcpbiW+GSB3C8NRQ3oGeo6jQqaoTOHY9GG8ip3YU+TC2zOiMK4F3UtDbdSFUpLsqVuKjYNpj4WO+ECVNpgVzAMeayOAPziMDRsM785Amj/yw1kBxxhIbVgXIDCQY7qcWdzUizxa5+9JFQ8m+BXCXOLo0+v/haVhuR2RV7OCo96EpaZgYAoeNiwqvw7F0K44Ld4pZTSvxujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iryMaJkm/yx0lqHXu6U/A9OeKSPigm3nkmR4paCI36c=;
 b=T99h/3fmSytBzk6ETAHCDfNJ2z9UmOuK+M0//qOgcKv8Et5YIvxD7Y8ebPqOqxhdZBdklRiGpeiTn4eGlca9yYzctBHke4pR31fNeFDQopn75m4LzetaHKI7CFMMgsntINVo6/jMEFDg/J8oyO8taqNqSGkmJKK1N3LV3AXHwq0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4552.namprd10.prod.outlook.com (2603:10b6:510:42::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:25 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:25 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/6] qmp: add QMP command x-debug-query-virtio
Date: Mon, 12 Jul 2021 06:35:32 -0400
Message-Id: <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.41) by
 SN4PR0701CA0019.namprd07.prod.outlook.com (2603:10b6:803:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 10:36:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2189394f-00ad-42a8-2d5d-08d94520e607
X-MS-TrafficTypeDiagnostic: PH0PR10MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB455204B2DEFFCC0D4C6BD1CDE8159@PH0PR10MB4552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YazLG5BIDMZacx7zWdO0g48GE3ltcc+OAhQRgNjI0+3pZGvyIeC5alW4NsokdNOGlF/VKoEFBUkeeUZpuNpOOJkI1l/QODT9DIM7HyMQbxQKHSJti8vSc6rYEyQNdRaRNVR5i/a/br49dThLVDAsndfVpJli7YF6RdmKNu2MWGJ4OWLKl/5WvXOuxVOBKoIbpUAcvrl8tZ4H884xUaU7Sn+6ynLtb3G4IeSHWoWvudSbaRnDLxJW04VPFa0ZvH8Y6OYOAKMVARroZf5Y25fMlw7Ycm34Gs2hkxn+JPu5+scrW2/WmL2bGnOzfD97C5V+f8Du6OtyhR3DoSRlFxObF0ZdvWwQylL1uhG8IRQ8M0xZdrw1lBGFWAWhCV5tvjgNZHp1eAtiwO7tys2fILfae+t0uJYbiwLrXztd/eo2AvdlmrC6nOXvhpMf2kyacc3idjxU9lX2gWuRGdATkdZr3Rkdcf5jSIUZ2qDWqStUFzcVDrjzzZL4dmK/ZKbcAj99Pj+PF420ePgANP9uUehIvxv0KWzNcJSmR7jF+vx4Y7hocMNaFXGEB+YuF3NsJJxnciiEXvmrW161/rCXYwazQGn4BLXdaCpraSM+oJIwTDyNdX/A+golhV2pFEqidgLuKGT89xCX96nJd21jCC8DzlU1Kz0/cfhKBu0WTOjhn4m7mVXovgdMn5VSXXLlus3SrDn22xWJfIEHJ4thC1wzAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(83380400001)(7416002)(956004)(6486002)(7696005)(2616005)(186003)(316002)(36756003)(4326008)(2906002)(8936002)(52116002)(6666004)(86362001)(107886003)(66476007)(66946007)(44832011)(66556008)(6916009)(38100700002)(5660300002)(8676002)(38350700002)(478600001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g4H/uRcQ6QXy8NFQda/vInXIM3RS5cAyDt0e8S4klQqN93z+XgVpm5Fr7+9x?=
 =?us-ascii?Q?EgRtaQN1ZoAzRGNeEc3x78ybhuX/qpsAg6msMoR9ckmAlBoKO+ty7DrsekRK?=
 =?us-ascii?Q?8lNGmxFkkhBin74nxF4YPBO0qF0W8yJptC2YeEDSpDHsSNhgy/1vlpzVmCdW?=
 =?us-ascii?Q?G6zNDJfOX6k525uAuZtl5gG5RAJaTEBSLLIR/yy/YUF+obAJJ6v7ECx/ObW2?=
 =?us-ascii?Q?elgvEIw/iJlcWIOXZc8/m/Cy4RbPY1xyl37EbU/N8yb6e5J6+0iZQM2FyZue?=
 =?us-ascii?Q?aHAs0kWjR4rx8oOq5S0Y7EMLl0kjeBEHb+H6D+V4+Frgltwo2iGBjPXcgIYp?=
 =?us-ascii?Q?GzO7dV5tGHGSoXK528GotuRmvInFV63uHuhvGiorOK25NUYK/5FEC25ZQ192?=
 =?us-ascii?Q?5opxNmOgQPwHYjXXbLUaHgt1ahVRB4prKCl2MuDeLf0mqHVqm7/BLEkL+Lzj?=
 =?us-ascii?Q?c3buUrHUz0wi5HEH0gh3QXsUiTV7eYK5AFFZzroPxVYOZ4hMU16Kj2ASq0fI?=
 =?us-ascii?Q?MM4QACUQF3VTlf+1THs+WpDHDSrbEjVOo5lvXKTUqFKxxpIqYn5asphL+Uzi?=
 =?us-ascii?Q?Td/KjUKhkoV+H1eqn81spOcqQBMjf1gGJEQM1oaERHat8+BsGQAq7Cbi2F0N?=
 =?us-ascii?Q?tsJYT1mtxWtXDh6x7Ac4Tf56/bFdbPgH2rH5F86FDOrZd0LD3FxT8T8Uou44?=
 =?us-ascii?Q?M+8f7j4m9Td6PfImtOp8CofIlpNSUv56Gv/cHzzIbt67dCDDRI7H+Jk5XTkz?=
 =?us-ascii?Q?7ca9RWxyUZK4eFtuTGIwotGR22IWrwU2f3/Xhp0I663KEY3sTkmedzmxz/AC?=
 =?us-ascii?Q?AzZrHNXZ4rNB5RVG4cBY7BDvZSA3TljnudiDXCKcLp9GpiMMG5AYN1dJRXE7?=
 =?us-ascii?Q?JFleQB2zY//bwSdM1Z+9hoi0yJUglRBp7WKqrPYMtfe90fpacj1XbmGAaZ6O?=
 =?us-ascii?Q?ID265ahQemq14DaknOKN/22dczi5iYmlJJcggNRodfo5jVIy1bUeL1mIJsYY?=
 =?us-ascii?Q?b+E9T2EpSw8GcfOS2ECpcW0eH3TdUeoj1hLXX8KN9AYKJiJSds/7PXBccYFB?=
 =?us-ascii?Q?LsrGUum2lmHqH4lhj+SvTMYUZumbfcdq37F5vX11F/KqvcmqBWQk5g4EPT/y?=
 =?us-ascii?Q?IDuDteWrVkS64IgtZNNsGy4zXEXQ8fGGxcX/Ijy+UIg+fOyAjWIhSJlk+vY1?=
 =?us-ascii?Q?MJN3O6E8J9sLI0Ygft/qC61TnpudgG+0UmyJfO9ux0b0Tjm+nJwdCUheo0xF?=
 =?us-ascii?Q?SeDIp99PtmYJ2Z/iPjCENG/1ML0Ej/SGnKn5XooNZ4CmT58fufPW66HTm+o6?=
 =?us-ascii?Q?9RVnQ3oTDoEPzbbgUtYEgA8G?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2189394f-00ad-42a8-2d5d-08d94520e607
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:25.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7PxWIwneQJLo/qYvHMTbrlY/rWzfwr4Bn83pA/+EbhA4XuzcxDyOzlQOUjBjGiLpXwuDO6L9x4d51oaVFF5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4552
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120082
X-Proofpoint-GUID: XeVLqgRQ-xY4Zlj2jZzgxtA2ls9xmOHG
X-Proofpoint-ORIG-GUID: XeVLqgRQ-xY4Zlj2jZzgxtA2ls9xmOHG
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevice with
their path and virtio type.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 +++++++++
 hw/virtio/virtio.c         | 27 +++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 119 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

 [Jonah: Added all virtio/vhost types in same order from
 include/standard-headers/linux/virtio_ids.h to qapi/virtio.json
 so that the QAPI generated enum values for 'VirtioType' match
 the virtio_ids constants (to avoid conversion errors).

 Iterating through realized virtio devices in qmp_x_debug_query_virtio
 now uses QAPI_LIST_PREPEND rather than open coding.]

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc..81dc4c9 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..d4a88f5
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f..f3fc1bb 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,8 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3672,6 +3676,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
 
     vdev->listener.commit = virtio_memory_listener_commit;
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3686,6 +3691,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3859,6 +3865,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3869,6 +3877,25 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        node = g_new0(VirtioInfoList, 1);
+        node->value = g_new(VirtioInfo, 1);
+        node->value->path = g_strdup(dev->canonical_path);
+        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
+                                            VIRTIO_TYPE_UNKNOWN, NULL);
+        QAPI_LIST_PREPEND(list, node->value);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cf..f7da326 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -108,6 +108,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index 376f4ce..4e1da08 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -44,6 +44,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..0c89789 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -91,5 +91,6 @@
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
+{ 'include': 'virtio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..804adbe
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,72 @@
+##
+# = Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 6.1
+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
+            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
+            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
+            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
+            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
+            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
+            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]
+}
+
+##
+# @VirtioInfo:
+#
+# Information about a given VirtIODevice
+#
+# @path: VirtIO device canonical path.
+#
+# @type: VirtIO device type.
+#
+# Since: 6.1
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': {
+    'path': 'str',
+    'type': 'VirtioType'
+  }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Return the list of all VirtIO devices
+#
+# Returns: list of @VirtioInfo
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "x-debug-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
+#            "type": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "type": "virtio-serial"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "type": "virtio-blk"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d..b2cf0628 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1



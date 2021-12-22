Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177747D80B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:55:00 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07hT-00082z-4b
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:54:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VM-000509-Vw
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VL-0008NI-0m
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:28 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsAg013618; 
 Wed, 22 Dec 2021 19:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=pb6w7A8Juk5Q6fyizUS0CzfxUrZE0ZrvKkKi9D9k1i4=;
 b=coH1iwchKyx8CjEcYtJa5tGYRfPuviwxGsfu75PiS6no+b6AUFT91gBIvnHqtrMD//8U
 mz8KDKAtSxp8zrJRk7HGuyVtGZK6CfqzlM8+na70iT6cmlQuM6o3gtQVHpXQ1GmRdXHa
 C5s5j905uiBdYoBmxt0lMINs7JZiUDjIXjy3QMk5NzWEj2aZTP4pPfQXUzLgRjO2CjMp
 aDwL09Tgf1lDdlsrdBq4biNCGI8tgdVlGAVPKA3zXahLPcR2wm1PdBtm0S8uL2Tiv6i/
 d4fz85wXg7/Eoc8MXmO7PWpT2+DMNfLi9Z/lidG3BrCLsTPNP8JZdxXCmEVpnwJignnn Bg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqN030437;
 Wed, 22 Dec 2021 19:42:10 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieIF3U4J9DCVWhVtosL2Vk2a0l22jLqg6y5dBxvg6JDpkQrsZ2tPKxkRCUSLgzijqgYb+U+Er+96znmsbhdMvREMrEDEcqwY6ZotYAHX/wcmBCaodHSju0I2goiP0cNjatFfbgNpT3iLS6Zk/1LJjIxiKGTo97H2zCfK0OUMpdqTsAdBZbymwY4hjSz8fhnShWARpKnLQoG6GHbbi2HKi/XpyPUtv5sn6a8QZxDhTp3AVh2SKGvHbN5xRw0kGMFI/XS91PliKVxJrIBOeU8pqoOjLYRk/j0Ynh3nlmme6ZeutejZMFC2wm3QJIUFjAbZaYDXn5cAvMRkr5knKnm5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pb6w7A8Juk5Q6fyizUS0CzfxUrZE0ZrvKkKi9D9k1i4=;
 b=oG0qLcJiy/LIm6kzweKD6MShxc/4ZpYmJQ0oEv9V7iDS4edVf7Tzd/zCl/uJMGQjyBRuOFiKnnOmwh8uCoWTScYBXCZYrh3s48j6cvRpYLqH1loFQD/DpcETcb3GwK5wyfa1nGgk8Sqz1wvVCCE0uLxnl2Luz8/xPd6F8zOZQCEnoiv/SQ7DlGiBsYUbZrAIXwykly+3rUfmkuEdYMevaHU/iCHtzyhkmfeYdz9VIuGBvndklDs31FOQ8G8CPTfYKQE5XK+WaARr9YYAgKcoFe9gI3Nre+WBKjUdPODfnhH0dr7x/unJv1s4EbGtWYe0DM+5hFR0YWuMFg0mp5LGqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pb6w7A8Juk5Q6fyizUS0CzfxUrZE0ZrvKkKi9D9k1i4=;
 b=reIaHiA0jw/rYAmxlxTbrWJrpoGP8XncR95ErHRZsHQ41BMf5PNWC2XJ3omAMn0hL4ptaIdC4W4mDRVmxjbufPcQHWdwj0Phk3ppKhNFBoj1VBOvguZmH8CMZG4FJWiZBP7lCDSMkR+Qc8DOrXwGpbT49AkcpDHm608QOp17KFk=
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
Subject: [PATCH V7 22/29] vfio-pci: recover from unmap-all-vaddr failure
Date: Wed, 22 Dec 2021 11:05:27 -0800
Message-Id: <1640199934-455149-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04757715-91af-4737-5f12-08d9c5832257
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB42422C6A5EE352050A2D16ACF97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrKnUbuDwkklgCoJwrFTkrSLoJuHuk7y4KOyvCHXSYGo4lxYiAihT4bmsec0qhKczFDJMDOXi6d8CWv1tgjWFjc3+6F+Thk5F68DQ7ue/t6j2KuxUu2nqLI0M/WlksDEwMhnwfF4uaI4M0ZfkVymtVAui9wsKPFq0UeTAKFlJNG6/zvHqfKY2o7bkVOiIFV68Ge0Eu3vGh523kIq5I835BDBzVB52RfOGrOIdsr6Tf80ofoL6O6JpRvMW//6G2quwQwlQ107FHEjTtkfAOIHBu52nzIK7wb/yIkBD7Y8Wx0hL25NI6Zf/biuZ+tGJ836FNsFSAtsXvuxjLFNvNl/7O27kp3rKwNuB/JlS+uKzxCwF12VvV+vtIkzJ/nRSuLM8slFsDC/TI8qf6oZzFLUb9QZPN4r71Xyk7HGfgR8GRN+FYlvqN+7ELbosT1dKn7z/0UA75y+FE2YqX0ptuA8UUE1XZndz8dqwql1VaktLRnv/V2lAKK83DhQQRdTKMNB/K92UEL4mDZ/axuLUBP5H9hMDZ0MaYq7gOsExcoKPUI2p4J2GTRv7RvpaH9VQK59f1S20wnT7c+PJ36G0Gr+Crx9GDvm5uGx8RLMuDLHvi137Vy80qzktvuR3PM/BRI3s13Oj0Jst0JJrPzEoKUP5Q3RdY/5QrEtd5IO/rAzbPafis4Wc2ZxIBVxQx4UDAaYicSAW45Vcr3kGlT5ba7uVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z2RldeZuCzwxb8ytCoCLUe7zjE7k7eepyCFiLzW0+jMgh/KaA1QxHNZoHkpQ?=
 =?us-ascii?Q?IxVfolP0k+EZ5kuiOQLCklC6D4DEoYJAndUswMx7LzEuVsgdpgrDOP90J+Il?=
 =?us-ascii?Q?/FmNtudfQ1u9vRWsvP6fwyUoBacv3Ma6cuvvmUZ4sn2HeI8zVpcgXAL1qjuU?=
 =?us-ascii?Q?NpmxL0DPsHErBZdL7BA5PZqVvm6UTg9m7CJxMPm+vyWpxEG1pMhwCYIwnFRT?=
 =?us-ascii?Q?G6myd4eSp9jb9M2RMfjZjwvlDpgKPFaLYofTwSoQHd+H7cYlxRRBIlKaJ6JO?=
 =?us-ascii?Q?0nO4KU4aTjtWnyLwqi7wfXOv5A1G56ji9IkrLKAFcZM87DF9vIfcYWMdWOat?=
 =?us-ascii?Q?BpNVtRefmw4gyaUv9GXOPJZ6sOu1YESjqNu0CiV04ALxHuu2JWbnf0woQmCe?=
 =?us-ascii?Q?TlyOjXzCE17/IGNzs6BmnZGlO/0nw8E3hlL7iXfezva6UgsrVNTY99QtsPwT?=
 =?us-ascii?Q?5isYaxj9sGv3N7Gs6uA+3plFrTk14dR0JTHvy3AeCujxGsH2LBqytOfIMUr4?=
 =?us-ascii?Q?6PSv6GRS7YGRHozHtqEI0B2wUpH1NCnl55Zs6HhoLNyRxC6qMb8JKBvSl1Nx?=
 =?us-ascii?Q?2y9DWlWnbzQGtUtWZjdk7p5gqERz88y4p6rK1jMigOOe0DpRS9oUtvcSJh0d?=
 =?us-ascii?Q?0sgholkF4eJm1WJ7YQx7dR7Sh2viYbOYs9TAUrGRB/K4Nkh05khMXcrCV2f1?=
 =?us-ascii?Q?3XzhdJ/RAW3qlxrNzZ3JxR+hfImL2WdrWRgw1DwWgRZbrfAoHJtiO1o1IUx/?=
 =?us-ascii?Q?lwlu6P0hOI2oL8sebMbkwa4OfXA0DG8W4BFJ8auWiXitIPNJfOJs/ezLlzo9?=
 =?us-ascii?Q?BjSqSsJeGhklwE+K6fISjo7KxevhGAR8CfJEYTuHqS+TGtTtTsV/iNlj/uS9?=
 =?us-ascii?Q?9huKV/lsOC5XjXlrgpATfu6Ri+7MxnBHl75SD3E83zxocMOPnDCfeQCnc5I4?=
 =?us-ascii?Q?TOI7zoJ0UFl/KtxPsJa+lVKTnwpafZuLyvbaE3mOQBpxLikK+4FikiP8Hsr+?=
 =?us-ascii?Q?nR45OzICbkNBWdJDo/6gdIdkMFuuT0rtQKNCegtfAyWI/pinjp/QrVScI3j/?=
 =?us-ascii?Q?qQePV78igOE8e68NJYE+STpFOQn33cHo7YMZVWnvyua48iijPFX67YQBvq4L?=
 =?us-ascii?Q?VbXEPhFUFWgw0KluIXOuw8agXyPMDbNjngVO9AhU5A1u0YXHyYK9C7cI7lk4?=
 =?us-ascii?Q?zac40BCF5AFvajVrApoWjMpk61ZLqqOjGOQhiT7MILMJrM6EQY9tTfaj+Sir?=
 =?us-ascii?Q?ZSKBIYPj0AsBON2SnPSIbH975gALCBi//3V9sYx1Y9zDu3hE7vQfRf0sd/Oq?=
 =?us-ascii?Q?QnFpwMUQ0Q/BiSK9b30EFcF6k0+L9ckdx6yVJSneVasSJfCQewYNd9dzCcdM?=
 =?us-ascii?Q?yoUvmxx2u4B2nH+oS4xjTBic+hYB/ecPHovSGGeNtCHE1PxVwTjHPg3P52il?=
 =?us-ascii?Q?rjVrFKXccO6SqXuDA/AQDIdj+yvzbpfTp2+khHwrWPN+KwoAz1KfTzhmZwWi?=
 =?us-ascii?Q?3eiIphTY+xa957j0n51kxAuVsuyT/C6IzumwZ4z/4JDiyOD/spMEXoX2N9yA?=
 =?us-ascii?Q?321G1Uqzgf6x04dy62Qs5uFoB/pg9Awpu2VDctEsFfIqYGjBkmVyXSS1iglh?=
 =?us-ascii?Q?0Yxnh3xOZZjG8Qx/FkIjCW0jinCYUrfMooOawgrF40Xav1lMEdSmmfSiOk57?=
 =?us-ascii?Q?LgeNWw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04757715-91af-4737-5f12-08d9c5832257
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:05.9205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONnMfvFjb8OIZLgV8d54lW99qqfBf4awT0Ew7zEHrGL9VAP0y340zSWn4w4XZ3TJZcbAZCqd461GxkjJFlg5bNolWrDqoKew3mGZ9bAURDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: gHQ4wKi175hmHMMgp0p5oNfWFOeNidRm
X-Proofpoint-ORIG-GUID: gHQ4wKi175hmHMMgp0p5oNfWFOeNidRm
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

If vfio_cpr_save fails to unmap all vaddr's, then recover by walking all
flat sections to restore the vaddr for each.  Do so by invoking the
vfio listener callback, and passing a new "replay" flag that tells it
to replay a mapping without re-allocating new userland data structures.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              | 65 ++++++++++++++++++++++++++++++++-----------
 hw/vfio/cpr.c                 | 41 +++++++++++++++++++++++++--
 include/hw/vfio/vfio-common.h |  2 +-
 3 files changed, 88 insertions(+), 20 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 90f66ad..f2b4a81 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -878,15 +878,35 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static VFIORamDiscardListener *vfio_find_ram_discard_listener(
+    VFIOContainer *container, MemoryRegionSection *section)
+{
+    VFIORamDiscardListener *vrdl = NULL;
+
+    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+        if (vrdl->mr == section->mr &&
+            vrdl->offset_within_address_space ==
+            section->offset_within_address_space) {
+            break;
+        }
+    }
+
+    if (!vrdl) {
+        hw_error("vfio: Trying to sync missing RAM discard listener");
+        /* does not return */
+    }
+    return vrdl;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    vfio_container_region_add(container, section);
+    vfio_container_region_add(container, section, false);
 }
 
 void vfio_container_region_add(VFIOContainer *container,
-                               MemoryRegionSection *section)
+                               MemoryRegionSection *section, bool replay)
 {
     hwaddr iova, end;
     Int128 llend, llsize;
@@ -1009,6 +1029,22 @@ void vfio_container_region_add(VFIOContainer *container,
 
         trace_vfio_listener_region_add_iommu(iova, end);
 
+        if (replay) {
+            hwaddr as_offset = section->offset_within_address_space;
+            hwaddr iommu_offset = as_offset - section->offset_within_region;
+
+            QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
+                if (giommu->iommu == iommu_mr &&
+                    giommu->iommu_offset == iommu_offset) {
+                    memory_region_iommu_replay(giommu->iommu, &giommu->n);
+                    return;
+                }
+            }
+            error_report("Container cannot find iommu region %s offset %lx",
+                memory_region_name(section->mr), iommu_offset);
+            goto fail;
+        }
+
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
@@ -1059,7 +1095,15 @@ void vfio_container_region_add(VFIOContainer *container,
      * about changes.
      */
     if (memory_region_has_ram_discard_manager(section->mr)) {
-        vfio_register_ram_discard_listener(container, section);
+        if (replay)  {
+            VFIORamDiscardListener *vrdl =
+                vfio_find_ram_discard_listener(container, section);
+            if (vfio_ram_discard_notify_populate(&vrdl->listener, section)) {
+                error_report("ram_discard_manager_replay_populated failed");
+            }
+        } else {
+            vfio_register_ram_discard_listener(container, section);
+        }
         return;
     }
 
@@ -1385,19 +1429,8 @@ static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
                                                    MemoryRegionSection *section)
 {
     RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
-    VFIORamDiscardListener *vrdl = NULL;
-
-    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
-        if (vrdl->mr == section->mr &&
-            vrdl->offset_within_address_space ==
-            section->offset_within_address_space) {
-            break;
-        }
-    }
-
-    if (!vrdl) {
-        hw_error("vfio: Trying to sync missing RAM discard listener");
-    }
+    VFIORamDiscardListener *vrdl =
+        vfio_find_ram_discard_listener(container, section);
 
     /*
      * We only want/can synchronize the bitmap for actually mapped parts -
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
index 2c39cd5..ea673ea 100644
--- a/hw/vfio/cpr.c
+++ b/hw/vfio/cpr.c
@@ -29,6 +29,14 @@ vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
     return 0;
 }
 
+static int
+vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
+{
+    VFIOContainer *container = handle;
+    vfio_container_region_add(container, section, true);
+    return 0;
+}
+
 bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
 {
     if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
@@ -48,20 +56,47 @@ int vfio_cpr_save(Error **errp)
 {
     ERRP_GUARD();
     VFIOAddressSpace *space;
-    VFIOContainer *container;
+    VFIOContainer *container, *last_container;
 
     QLIST_FOREACH(space, &vfio_address_spaces, list) {
         QLIST_FOREACH(container, &space->containers, next) {
             if (!vfio_is_cpr_capable(container, errp)) {
                 return -1;
             }
+        }
+    }
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
             if (vfio_dma_unmap_vaddr_all(container, errp)) {
-                return -1;
+                goto unwind;
             }
         }
     }
-
     return 0;
+
+unwind:
+    last_container = container;
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            Error *err;
+
+            if (container == last_container) {
+                break;
+            }
+
+            /* Set reused so vfio_dma_map restores vaddr */
+            container->reused = true;
+            if (address_space_flat_for_each_section(space->as,
+                                                    vfio_region_remap,
+                                                    container, &err)) {
+                error_prepend(errp, "%s", error_get_pretty(err));
+                error_free(err);
+            }
+            container->reused = false;
+        }
+    }
+    return -1;
 }
 
 /*
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bc23c29..af960dc 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -243,7 +243,7 @@ vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 extern const MemoryListener vfio_prereg_listener;
 void vfio_listener_register(VFIOContainer *container);
 void vfio_container_region_add(VFIOContainer *container,
-                               MemoryRegionSection *section);
+                               MemoryRegionSection *section, bool replay);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1



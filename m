Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB783BDBD5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:02:03 +0200 (CEST)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oSQ-0002XB-LX
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJm-0000pw-Uw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJj-00084G-Fl
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:06 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqFwA028409; Tue, 6 Jul 2021 16:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=nfgeduOdRnDMHuhQUvwviMdkqz3uBP/k3YDIw7MMMgA=;
 b=g89uQzVMtCzqZnHeciJGhA7/kNFERGmTJhnZLKfXQIXSPvYncGlMTd1Rau7xyrbx5sct
 UK1XLDLtc+MMeMmPDnc9ks6Eo1BdcLuKmoENkvGrhO+8HoU1lsFxdjpLrFi8IFMTPZRZ
 exW7zKFaVMf1GXWCvJl2+G+azL43NkwxOROfLQ0E+ROH5t/GvZtSYYIT4FCrx/Lz35wb
 FrTV8f0KR8+L8D1kafwN3fIxWlU3y+W7A+vaU6bQ0NwyQ5GDjBP3i4g85feWANb9yS/6
 Gu/U2Ko9qcpCDiuioZfTA7ZAJfDQZaIGrYb54JkrPIr6Y7v/JsRCg901v9VL86Jz8Do2 Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aaaapb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoVE5084730;
 Tue, 6 Jul 2021 16:52:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by userp3020.oracle.com with ESMTP id 39k1nvcq6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlSfiARY/vHCs5T7/BATj3UpAGHcgW3Ab773CdjxrewIkti3PA+0XEG7aIyKJflkF47wSa5JBeHiaLduXHVm36d9eG32QfgS0wxZwxdiBzcTwFva5Gl0eRac+K58WhwQxaNnUhn20oRqMQHUtPjehpC3MBfeTfdg9TmHLLCoRDYyBrfh1SbN3Rk7JhKs3DeJ13xmcNCf+Mk0hiN8dbeINtOSLVM/J9ftnUrXggPnGOT+bFn41qKZuKfi5g/hnDFM4kkStvji+NgXyl9A14bK7Mr7bp3LosH759dhIDH0R+H4mLKMf7UuT6mOTtN7smOjPcSh3eyHcUqrVbPGB7HLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfgeduOdRnDMHuhQUvwviMdkqz3uBP/k3YDIw7MMMgA=;
 b=TZlDUKkwxUHMXC1SzFFJEmaFCvEenx/NExP3NvFXF78SYecnD9IqLSKko/gfQUzwMvbNZN14Ruqmje72l2ZcfzcCtp8AoiNuDRCtsijffYusnIjCddA3HIL7I9t0Mm1wFrrigBLqn6YjEYS4nxNijwWqxfNPBrnnKOGf3/KB82BdI5Ua3XnnXFtNhCHnNQSGOUcRTLd9R8VDrUbAym/vk7zTo4jCtzrIa2WqRh1/wA+XqqfMHPlgoo5oV6Qi32YRWcVD/QmF7bh02kbn309V9+ci+oi7YU3zMUdg+UsoilC5krVMHuoarC6lVK/Tepq+5LXpE+DSGruzb0asAd1ljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfgeduOdRnDMHuhQUvwviMdkqz3uBP/k3YDIw7MMMgA=;
 b=us3JfdSDPTH0HuQbl/yTJDuYLxugKEAo+PvzSn5c2wrNHxmfgqfxm/GZdAcsY2lWH+GwbYwZdPwfUQZkcWi9RsrBZPDrVonpkKBPLfQ+6etSJVVTLNO7ySMCvBSzOF+WdeUoKLa8HsUq2VeXVh1SDaExJB6vkYGXp9Ag1t4TgOw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:52:56 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:56 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 11/25] cpr: restart mode
Date: Tue,  6 Jul 2021 09:45:42 -0700
Message-Id: <1625589956-81651-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:52:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cc793b4-15f6-4dbf-fc86-08d9409e812f
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805B2549581C4F684C8EA5BF91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FvGL6YbIxVbrwe5ILVhMZhQBcw9bYttBpt7D6BXEw6Clun3eyZb2zU0guoI2I+YVyek9DYdGRW6pn+YH/j03cVAz54yhQ32VrixA5VLdmN7e5ZH84XQaeVrUolTW++H3d+fEpMYV+/rMhho7iBbSzQ3TD3lC8z5S/2Y72MwYLXqQvSftVUSYQFZvabB7raJBE6eSD7NxXcnp/pt5pCWUB1GD3XO6ZCw7NuqSS7jh88UudoC5L3GZvvvou2aZJ4Q23fFKaZ6nnjRXvrbj987dLUoMTBntVb5pU4JkSBG81vuhuVseLg55fOMtu1UwapJpdpqmNYVCcEjMgUlPdNZYb2xPGZXWcWoM5lE1iugC5kO7KG0ylk6twynEgI75m3bUqUCPMAbI+OwhOZHl4g3v0OGyKJwkVEsn/62jqYyqI1s5OdnZVfNt/OCQBGjfii+Dd5bxss+YhJ77V493p9p2vgy0mwZIAjSxo+W3YAg5R7bG+sELycXaJdLOLqiiSWdty/bGe/cOoQdRjGWC4ayJY9qHCnv/ARMYv8wUVPQjwDX3Hm6qg2qaCwcHufMog2HSH2LNFaHOWPG1vLOQxlEhqzYQPhMFCXlUtXf8+KNw3ND8nhxWHbrEV+Co2UbhslEPb6+r6+aQcPnaBczACCIhK4nuWr/v4BVL3TewlX+3mP56P6e4LyaHIpWC8S3yTRAz5TwBdG70tpND+HEgcyvjJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HgpjDvJ3CFTFHNtIWDPIqd0O/TYnLubgtz4+Pb753PWyO987VNEkt73u5UTD?=
 =?us-ascii?Q?1kjvziej2bNprQIMxiB+l35AYPoQW9hvZ5+/sKf1ZdhaMiRiXOH8n8S3fTvg?=
 =?us-ascii?Q?AWUNg4zMngdy53Igg5AqIYjPEg2PzKW3KrGl5fBYJku6aJDOzS2mdQi6t6B7?=
 =?us-ascii?Q?FwaAsgoY+52+T9EeonNH0q66uXCm8ahsACFC0bJq39/tzdz7G06X9RG3nlk1?=
 =?us-ascii?Q?6P4L3M7aTrZApez9BXMRCl8ZtoRJ+dZEQTjMd3+q2GYL/wjmVfJE0CKfqfKq?=
 =?us-ascii?Q?Qav1anikJukLKCYBO6ML3xFaKH0twtYifdXLGr/jmJ9rceFcVXyq4a/0WZfb?=
 =?us-ascii?Q?rugP5UvwmAnTjRUnjWAiB6r2C80INqEM0dkv020UUx1gUy2K8JJtmgzlgUVL?=
 =?us-ascii?Q?1DduAMZKCBngw92311AOg7KjKq1/XJuyDFWdwjEAhgnORBS6qvKvBKBSa6Gm?=
 =?us-ascii?Q?DG7WEUH5LaT4T5W7C/sL81gH7GheUW4EmmGT8yUEbsDIWqDDxv1LO1LY+582?=
 =?us-ascii?Q?fT4NLqfSByLoLHBGwFtPMChqdM+hlhepESpgWTg2my8KZaEc9vPb+2vl+6Le?=
 =?us-ascii?Q?QOYju6QvO3XDRce/RNvFigyCmSvKTVkIOmcEdyrLXDMxEZLWgAD4ULR5WtQq?=
 =?us-ascii?Q?ez3TPPu3Og9LebOZjHCZ0C+3aQ4IhcFr70Zwi3XKpy4k4TMc3cdHLLdibej9?=
 =?us-ascii?Q?OR6MPPgfIr5tVT5My3oIoxKhi2bfmh8x5umN/WuD5UZHUfThHYyHmoVu3ujY?=
 =?us-ascii?Q?+vKsR/KtyXOmgb3W5pQAZAyUM//XnN/rRgmc7RnYxXz9/MQ4wUx2ousZm9bZ?=
 =?us-ascii?Q?nhzd13TztS30wWmhahzCD2o+OaQufOKAFxUfphkKTEOnAMYQ2oikwOp+7R4b?=
 =?us-ascii?Q?jMmTlWrsRZpnIBO/1p4X+/7Yu9Vow0IdCaFwA0Jmyd824JlDTcdmwCgbQK84?=
 =?us-ascii?Q?fDzYD9BNkUj8xi2j+fOO2edwYRbyxdAKdpMl0MM5n1hejvjColcuE12VhNN0?=
 =?us-ascii?Q?3DbKXo52ij0nlf5QwnNhL+Xbi14YvG2KDL2YWPb6hkXf5BM/WagcFts4NlcQ?=
 =?us-ascii?Q?oKLop9KvKwa1rYaM+0wIgkdUCOweNKnIk3KgW3PGI5TQbR5q18/rKnT1tM5z?=
 =?us-ascii?Q?3S8bNWEZyECer7VP78BoCA3b/e8RdpsHqSMKuC0eOJZEpxRkOXZ1kczcBssk?=
 =?us-ascii?Q?LaCDyO8SrsvGL2NHowQmVp/K2QBq4C1+WwrjZsLQ6WNP4KbbC3Z2IYnc7OKa?=
 =?us-ascii?Q?GNng4zVx+C9JM32NmF4zumftznUKDY4L78QZDwDH4FJkRco+rUy68LO4NOt5?=
 =?us-ascii?Q?caEeoalnUn6z3+3TZ6JdpZ3y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc793b4-15f6-4dbf-fc86-08d9409e812f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:56.6931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqpRmk9iaXHChbAiHjEv2EcB5x5PIj4g2AfBVX0V/WWl5vuMf+UgJ26+xKjHs9XbYmzfTwLEm0wP7NPkHQuZCoExgWEf1Exk6Ab7O2jUlHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: MB_vFZk-T-IH1EqGRYDREHkYjC_Fd8o4
X-Proofpoint-GUID: MB_vFZk-T-IH1EqGRYDREHkYjC_Fd8o4
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave restart mode, which preserves the guest VM across a
restart of the qemu process.  After cprsave, the caller passes qemu
command-line arguments to cprexec, which directly exec's the new qemu
binary.  The arguments must include -S so new qemu starts in a paused state.
The caller resumes the guest by calling cprload.

To use the restart mode, qemu must be started with the memfd-alloc machine
option.  The memfd's are saved to the environment and kept open across exec,
after which they are found from the environment and re-mmap'd.  Hence guest
ram is preserved in place, albeit with new virtual addresses in the qemu
process.

The restart mode supports vfio devices in a subsequent patch.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/cpr.c   | 21 +++++++++++++++++++++
 softmmu/physmem.c |  6 +++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/migration/cpr.c b/migration/cpr.c
index c5bad8a..fb57dec 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -29,6 +29,7 @@
 #include "sysemu/xen.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/virtio/vhost.h"
+#include "qemu/env.h"
 
 QEMUFile *qf_file_open(const char *path, int flags, int mode,
                               const char *name, Error **errp)
@@ -108,6 +109,26 @@ done:
     return;
 }
 
+static int preserve_fd(const char *name, const char *val, void *handle)
+{
+    qemu_clr_cloexec(atoi(val));
+    return 0;
+}
+
+void cprexec(strList *args, Error **errp)
+{
+    if (xen_enabled()) {
+        error_setg(errp, "xen does not support cprexec");
+        return;
+    }
+    if (!runstate_check(RUN_STATE_SAVE_VM)) {
+        error_setg(errp, "runstate is not save-vm");
+        return;
+    }
+    walkenv(FD_PREFIX, preserve_fd, 0);
+    qemu_system_exec_request(args);
+}
+
 void cprload(const char *file, Error **errp)
 {
     QEMUFile *f;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 695aa10..b79f408 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -68,6 +68,7 @@
 #include "qemu/pmem.h"
 
 #include "qemu/memfd.h"
+#include "qemu/env.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1957,7 +1958,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
         } else {
             name = memory_region_name(new_block->mr);
             if (ms->memfd_alloc) {
-                int mfd = -1;          /* placeholder until next patch */
+                int mfd = getenv_fd(name);
                 mr->align = QEMU_VMALLOC_ALIGN;
                 if (mfd < 0) {
                     mfd = qemu_memfd_create(name, maxlen + mr->align,
@@ -1965,7 +1966,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                     if (mfd < 0) {
                         return;
                     }
+                    setenv_fd(name, mfd);
                 }
+                qemu_clr_cloexec(mfd);
                 new_block->flags |= RAM_SHARED;
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
@@ -2214,6 +2217,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    unsetenv_fd(memory_region_name(block->mr));
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
-- 
1.8.3.1



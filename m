Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459133BED53
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:43:47 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BaM-0007JY-9I
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKf-0000mU-5K
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:33 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKc-0006sc-2B
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:32 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCGvc003564; Wed, 7 Jul 2021 17:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=0U2eUGvdCw0BPtLV1NQZj7cnxIgSx6ecLBDlbPZ+Nx8=;
 b=aXNAUiykxWFOQ3IS4374zIL5o/zBXSLWNkrG0gx9N8UrjSD3g63xFcoyTUzwKAKdAEO2
 mK+0yBSYSIfwfUuHQ/v2nQF3eRPYXHB58bem8uTb76U6/X/LZyErIhc43ps/uwU4w6IC
 vDiRbt8Nck3KXBS0Hm4kXOHaiz5R4ZS1ZNIQmHO7fHCqXLcl//TM8EM5Shf4/lhdBEm9
 EwQ7uBVZHTwK0azCtSItMXn1ZQUFhB9LOjYG3F9W7BE5X/6BO/sQITiXTLaxSTr5clN3
 CYuz8DHYpASNe13DdRCTzzIbv6ugCI2XpRz06C8JUABij4coGQM9ZTqYQgecHmBMdu8t Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n4yd1ert-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAW3Y053059;
 Wed, 7 Jul 2021 17:27:25 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by aserp3030.oracle.com with ESMTP id 39nbg2je5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyen6ijjsvhxmMwH7c6iYh5oKX6GI+OHdNBVs0S4ATS/fnXucgckFypfhvj1rMVG7YZ1s5FYsN94TXipKukpqtDeL5lJJniLlu3HNwE+t0Cm4u99yDC/Q9kyuaRr3to5ClAhE+oNK9pvUQkxsLwz5QP5atU3laq+bj05LSrFs/hVjntSjdDxMBEzfFv6QDDALlMVhBtJTfrmsrbsD8xOrdVsVQz1qVXNZw29HwOHJ8CTo7Q3rZ7nETI8N2oBlcnN8zcI//RZZnq6BHgAI8f2uey6qKhWeWUer8UiwFwkLjPKffJjwK+7VOEcfGOerLGTLb5AeurXZWmDE64C2rMRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U2eUGvdCw0BPtLV1NQZj7cnxIgSx6ecLBDlbPZ+Nx8=;
 b=kFFrvPf3uADP4g8ujv6SlSj0u2i1QaR50oqelFDJ0gp47h8VPFFQDjEMKAAdRm2tn4ah0WevTIYG+v8OZpZHlN5EaNlaQUJxo26h60HnfeRiK5DJsLang5fzBGyPQj8CRKqbI5uBlXl1EUpwKICLAn56yn+nbsX2PPw3sRguDFrnv9WynH5upG35cHItG9R6xsv70rv19cgCyZvrfPf19JJMIVSVnY/EFaCWwJ18YO1hha4Pw/KIcYNIOa5RYL88sCXnGzDrwXtBdpVhpXEkcVvPci3aE/l4phn4OpLPNXG6e0VclSijzETT/qzQiveuOz3ctlVQG3aA3XOZhr2TPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U2eUGvdCw0BPtLV1NQZj7cnxIgSx6ecLBDlbPZ+Nx8=;
 b=PPW7sWFopJwN0PxB6GGY7XmEMZeRURSRv++bMkm/tDPdq9SEjXMP7y9R4o1QVAaCalpP6fN4tTWtVIzLlHyaOjglM/TIdXef7WAH/aodWsPBZcmJ6Yn78kDLugAYXc1mJkdslZrjL0NTdAzuwMXqQ8ohvkx/DWu6qqABmEC3lZ8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2677.namprd10.prod.outlook.com (2603:10b6:a02:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:23 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:23 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 24/25] cpr: only-cpr-capable option
Date: Wed,  7 Jul 2021 10:20:33 -0700
Message-Id: <1625678434-240960-25-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c1cbec0-bae7-421e-bc17-08d9416c7b49
X-MS-TrafficTypeDiagnostic: BYAPR10MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB26778549F384A9D9B5EE40F1F91A9@BYAPR10MB2677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MpbOwBO7tG0T8X86hIpRKHZ7XCA4YKHc29yu/o+e+z3PapMWpG5rh9NFUbOYhjIChfDf+4JhZTC+dg1TktOoPobUicFLfOXoWr2ARQ22UQcf5/rHEHgdce3lph03VoGAQ4ofFzCyjmasjU4x+MNidAIcuqWXwC0fJiIvd5l0WgoffUWB0iVTeNl5i8s6RQyCed9i1yOowBmRlVN8P7tTuboMZ23XFZwtu1UmPhfIxtVT4pkFnghYU2R96mb74AUCdUQ3wiaFZBPoq06a9CIzYS/rwfx2qx/10qdizWhklY6ZnagTrHqj9qfPDVAD7jB0neb837MaNp7NiD4NofeRfApKAfz8i9ws199gSyF0KW9Wx7Euoc67fzPfGcy/iMSPFfCwpOWdzOBN3NVgUIG+nKFRBSm8d2NWJdD8B/e/d86tdY+DOgJEQyZt9OkWfbvTwk5bXeDYAPV6E/Q4ktMXpidzSA6sCMHzN56ARSbgqLPlGzNKI4u7MeSmcPN5dmB5Y+7sFsekVxOk7R0Ond7FpoMlfwha7OW34Fstr/AGCb9ZxL/leEWteRNQFmXzZ/tRJGgs6+gNnYxeSIRkFZdGng2/eTGLXAYxShwVvgRkSN2VbIm4SvaZQbJ5l27h0wGpA9IQembE5K0smlYILWXhdCX16eFPZMANV02OUUcalGUhhenk9Ya4d3rx5pym0gxs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(39860400002)(366004)(346002)(6916009)(107886003)(38100700002)(66946007)(7416002)(4326008)(6486002)(478600001)(2616005)(7696005)(83380400001)(36756003)(52116002)(956004)(8936002)(2906002)(86362001)(186003)(8676002)(66556008)(6666004)(54906003)(316002)(66476007)(5660300002)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?elT6zW1zO9O8xfegEGFGoZomYVCWoUQneonTD31x90dC1XZw6qx3sdXBAnXa?=
 =?us-ascii?Q?+kri3Z7t6hgytuQalWUmNqf6f+EJv9oU+uumpkLi0vaOCQMEqV86E9tyGUpr?=
 =?us-ascii?Q?6Jk1Q3GG0MmDZYOY71/Had0muz3HTVOEl1uGwD39wsJB/Qre0Dt0nIKZBkeU?=
 =?us-ascii?Q?vKkiMgJzpvT48q4h02UbR+E5diYHMxM4nT6VtXoIkHVtBuQ28a4Yvd/EYtf3?=
 =?us-ascii?Q?mIg5WkHplj7QXwdQhnj/HYuWiV+Ae6EMdGBoFPuo9ZpjKdJfqhd10SECmfax?=
 =?us-ascii?Q?ofTI+qeyyFh2PhgWZCFgYfluwbwa5lCA7TWAD7bt6WbOgk7s0k+InaF3OX50?=
 =?us-ascii?Q?JDXhvJLNui8+kFZDyVaUnfPcxHsynAwEsL0+TNJ9w865N7uKqAPHrZCORy3P?=
 =?us-ascii?Q?dmJNKXeLJz0Jrwu7auGGqOS7Yc5fJZNXwEU8uE0GeoB6baEM394QbxO1eoXT?=
 =?us-ascii?Q?+97UA8uSzP+WD+sXh4pPcfhc31/H96mde7NMEH0MJ52nOJYXPrWWFZv/TdLm?=
 =?us-ascii?Q?9dU7c3I6Bt4TXjURCY83Niy8WjjrOO+W2IiV91+KUitpw9z5QxHXJlfCoEob?=
 =?us-ascii?Q?m4NEgZKNnc7wIF7yRrqgUs+kkmy4MEE7FNpPlJDOXMelzdlwy9GRcsBxLqhV?=
 =?us-ascii?Q?ug+3q2tuL4noxw5BCZdIGTKU41Hg3QIaobNDX1TKpdaTdmf3imobgADU0An1?=
 =?us-ascii?Q?5MTXXxw5EzEB2ZcFold7es1ihhdZKtQDl01M98mt2rZ/NV6xvfiy17Yv4829?=
 =?us-ascii?Q?id2PGm+jfElAgv6U95y+n4zreeHg+gZu+pmUL0LIrzmDGvxzcY4FGAmPhkLS?=
 =?us-ascii?Q?aV2TMzgpn10zpUa9av9o2w5N069Poy8jg+PcmcdARwK5J2ssuPtGl+p75e+0?=
 =?us-ascii?Q?EjZz7ig+SkTHE+jwYz4zZRSBtVYoVfk5MQLpBcAGk9p5DO4Pi+g/hybvNtab?=
 =?us-ascii?Q?lv0JrUTMkyOuptRw6D2tXE/FcVKvVHXVPc9Q8zYX5e9Z1Gr+R4Ptu5z9DBQG?=
 =?us-ascii?Q?sWBVewUiNMV13tvhhBNKeBsSZJRCx/48JFYTcaa1eao57WnUGFayeMouFvO/?=
 =?us-ascii?Q?9ayzpVphF6BxMVTrn6KyxJPuRIfWHXU2DLaupSQNfcciqF/EMv9TyXYOu3rI?=
 =?us-ascii?Q?4rCvvlFkmgeclCHbkZlOjKgTaWY5aiaujKx9cxUq3C/PLwoaB9+g/gQFh3mN?=
 =?us-ascii?Q?z9SAfWISJI45DfUF/SI3zTifKM7Ts2HArBjW69ulDIKXpA3OdM8XUNlShs8c?=
 =?us-ascii?Q?cPbBzXjjz6BWXypnOyI/m3vwTn9EKSx+gP0dhTi7z6xbZ98AwPgsouCh88AX?=
 =?us-ascii?Q?cM9z20LkkQVmPkRJoqvkYbOs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1cbec0-bae7-421e-bc17-08d9416c7b49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:23.1608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muBuR7u6ghtDTY2INT2z3sCHKwJpmbzQt53GZQgaF9VcouEO/5Q2fk4273eZ6RYhPnLFP/fKapmaoBISGwe8TEnBQ621O06bwAwEz4cVTcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2677
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: CpypkIlqi-ctvZ5z-Dueeyku9cNZ8rTR
X-Proofpoint-ORIG-GUID: CpypkIlqi-ctvZ5z-Dueeyku9cNZ8rTR
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add the only-cpr-capable option, which causes qemu to exit with an error
if any devices that are not capable of cpr are added.  This guarantees that
a cprexec operation will not fail with an unsupported device error.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |  1 +
 chardev/char-socket.c   |  4 ++++
 hw/vfio/common.c        |  5 +++++
 hw/vfio/pci.c           |  5 +++++
 include/sysemu/sysemu.h |  1 +
 migration/migration.c   |  5 +++++
 qemu-options.hx         |  8 ++++++++
 softmmu/globals.c       |  1 +
 softmmu/physmem.c       |  5 +++++
 softmmu/vl.c            | 14 +++++++++++++-
 stubs/cpr.c             |  3 +++
 stubs/meson.build       |  1 +
 12 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 stubs/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 58479db..06fabd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2868,6 +2868,7 @@ F: migration/cpr.c
 F: qapi/cpr.json
 F: include/qemu/env.h
 F: util/env.c
+F: stubs/cpr.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc9da8c..c11ec80 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -40,6 +40,7 @@
 
 #include "chardev/char-io.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 /***********************************************************/
 /* TCP Net console */
@@ -1462,6 +1463,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
 
     if (!s->tls_creds && !s->is_websock) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    } else if (only_cpr_capable) {
+        error_setg(errp, "error: socket %s is not cpr capable due to %s option",
+                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
     }
 
     /* be isn't opened until we get a connection */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 40c882f..09d5e6e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -37,6 +37,7 @@
 #include "qemu/range.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
@@ -1601,6 +1602,10 @@ static int vfio_get_iommu_type(VFIOContainer *container,
 
     for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
+            if (only_cpr_capable && !vfio_cpr_capable(container, errp)) {
+                error_prepend(errp, "only-cpr-capable is specified: ");
+                return -EINVAL;
+            }
             return iommu_types[i];
         }
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 07bd360..f179086 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -265,6 +265,11 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 
     if (!pin) {
         return 0;
+    } else if (only_cpr_capable) {
+        error_setg(errp,
+                   "%s: vfio-pci INTX is not compatible with -only-cpr-capable",
+                   vdev->vbasedev.name);
+        return -1;
     }
 
     vfio_disable_interrupts(vdev);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667..6241c20 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -9,6 +9,7 @@
 /* vl.c */
 
 extern int only_migratable;
+extern bool only_cpr_capable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
diff --git a/migration/migration.c b/migration/migration.c
index 5ff7ba9..63fcd2e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1247,6 +1247,11 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
+        error_setg(errp, "x-colo is not compatible with -only-cpr-capable");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index d5ff45f..153dfe8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4323,6 +4323,14 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cprsave will not
+    fail with an unsupported device error.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81..a18fd8d 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -59,6 +59,7 @@ int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
+bool only_cpr_capable;
 int icount_align_option;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8a65ef7..54f9072 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -46,6 +46,7 @@
 #include "sysemu/dma.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/xen-mapcache.h"
 #include "trace/trace-root.h"
 
@@ -2002,6 +2003,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else if (only_cpr_capable) {
+                error_setg(errp,
+                    "only-cpr-capable requires -machine memfd-alloc=on");
+                return;
             } else {
                 addr = qemu_anon_ram_alloc(maxlen, &mr->align,
                                            shared, noreserve);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index a50c857..9012385 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2665,6 +2665,10 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
+    if (only_cpr_capable && !qemu_chr_cpr_capable(errp)) {
+        ;    /* not reached due to error_fatal */
+    }
+
     if (loadvm) {
         Error *local_err = NULL;
         if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
@@ -2674,7 +2678,12 @@ void qmp_x_exit_preconfig(Error **errp)
         }
     }
     if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
+        if (only_cpr_capable) {
+            error_setg(errp, "replay is not compatible with -only-cpr-capable");
+            /* not reached due to error_fatal */
+        } else {
+            replay_vmstate_init();
+        }
     }
 
     if (incoming) {
@@ -3428,6 +3437,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
diff --git a/stubs/cpr.c b/stubs/cpr.c
new file mode 100644
index 0000000..aaa189e
--- /dev/null
+++ b/stubs/cpr.c
@@ -0,0 +1,3 @@
+#include "qemu/osdep.h"
+
+bool only_cpr_capable;
diff --git a/stubs/meson.build b/stubs/meson.build
index 2e79ff9..04fada0 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -5,6 +5,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1



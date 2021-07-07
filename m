Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB683BED1C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:32:17 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BPE-0000x2-6P
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKV-0000IY-SU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKS-0006k8-MU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:23 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCEqO003527; Wed, 7 Jul 2021 17:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=NPiCAPVL3wacx/GUjV5qGsrURtWdPeMb21Lfx2em7xM=;
 b=e5rShr7O7dX2zWbMxY5nzEZXyww2VV3v2jrJnX4682LWQl2yZiVmX27h1QmRJyKgLhd1
 7AuVai2boog0NuwLpSN83hdSMIn0AnSrC1Vykj2t9LgHcFS6YvamRJcp5i3EAn3ghrH2
 6bXUbGAs71XNwpdeyBzyBl76t0P7nywJWHSQ5j4xzU2THkpvfZhczo4b1tQ+onbSKAob
 lx6kRjngYSXTnDNTnYGkHgmgW01XzFP2cHe8Ts30ReoOvGYZ76+2ZGxjvO8C6JnsRDDo
 G1FDDWtQtEm5cOf0BD/0TzN3iAV9quXaSjDzvwIH3Z5klJ91Ub/yKcbI0+AJAdOKF6dz RA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n4yd1erf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA9Ao026129;
 Wed, 7 Jul 2021 17:27:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3030.oracle.com with ESMTP id 39jd13ubct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDpklX6EhR1/HW/rsumex0yP6LiGNPO9tkCzpAgdXJ864ooM1M+nDH4KAupd46ARJk314hj3NC6co2KJTRpP0+r2x8J0isNv+usLQXvxT3traz0ibD6W40+I8IyrKxrNUJReeqpa+Zz0XQhtXt9vznmsarGkcUtKKtFP1J4LptoHl100Mq7nhRML3R5GIjnDS3ztzHaCbmdU2kNjZmwfER8KO2c+fIoeQ7KxKdhLCF21vvGLln1RZL4KFaguazrnw+3hl3dxpU2cfOwmNg3tbKsLJR1MjnNP13vuHQJh03a8v/aiN9qgyo+FiUQ8OHkd6ruruj382d+OFYgEu8EoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPiCAPVL3wacx/GUjV5qGsrURtWdPeMb21Lfx2em7xM=;
 b=itx6w858eA+D2Sp6/DgosI56wupskK3D/qDSEyQ4rQPYeHU7kqXzN7bbAVTbZs7N/9tU7BuJrdLQi0aH1OKnAPhXBbTzGx8b/WhWZbZrMlKE1ExejXv9W1mNqbjdSL07XKETlWZdR+zDY2NzW6L0ESUmADHvdA6asfTXvz2oULQsxDvk63D3u+sr9KqF6rBtbXTLh6VR0JyfVYwgtTx1QoxBsMQA0rU/QLIT0AUZjPCMSP2whgYRx8KyHQ0Ic3vhzi3zXDZAjFxLm20pfH6VJ/WOz75867zqmXcs+matHzdfHdrihVffVZ45+9izo8M0ir2r7klAgXXUGprAv/7ifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPiCAPVL3wacx/GUjV5qGsrURtWdPeMb21Lfx2em7xM=;
 b=E8UqTGHO1vvVhZIuYQvnZoaBF2dpy3mmr/WW5+cAHjcR65HxxlHwRZKUhyKFEUadvgXsPG0f8CzWC8+ttyl3r31vQA+1xwOwBy0ImL0th2gC6RxP87LH/5n9W6fXd/FbH/ERAmQwSCBKd1yU5GktO/nhWsOYmS+HQjExNiU3wL4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3285.namprd10.prod.outlook.com (2603:10b6:a03:159::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:14 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:14 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 10/25] util: env var helpers
Date: Wed,  7 Jul 2021 10:20:19 -0700
Message-Id: <1625678434-240960-11-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b5de55-33df-45ab-fdae-08d9416c75c9
X-MS-TrafficTypeDiagnostic: BYAPR10MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB328583CDF957310AA1E78EB5F91A9@BYAPR10MB3285.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9XyECQDwIu1cmvzOu2V5MuaSLeoMpj1jqDx9eL4JtnX+hFuq2k73cnLL8cVhHCgm0kQmh6kcX+HZ2uunN6Vu8wVlRffkpuGSsRcbDJgYPINJgxTQN819OrTIJglGHESI9XiLhMHxRB+lf11UiPFMOFjF+3C1SEkiBlcGsj5akGKd14SyWjTDcCdBRQ7FvF+6lpe5h021RFQUX4aw2gWLs8HtKlZeMsjwWpjBeipcevG6wehPNCkNvu45g43/2lbzJw6Vq2X0UD5njg4Y+3H/5HdqT59DUwngK4aZA5qFShNeGiDeeEzbMiGrBfV83iGQI9pVA8Htg2DsUMzq88RhfSXKr+Nrjcd2ifRXl+CN0rm7qX5hm+VHg820awc1SGADkcVOKDf7CFtuCJwGTAG+RzWRcBLXu88ibnkLuVGk/uuhoOg/DRiqQ1RjvbBBwabD/joGO8z/mxva9Zo5BpQqU2qUEpMV8VmdXmA1UF3TWhfi2fgzlJQ4nZApGeLb5Ru8tgZv9MCLFANpuGU9QpckXuSHCAT5sfjqsZQxih1Ho1uHyvGlTDfgRi2ij13jr+5o0ZKYo/OGW1wHMzMAJzW+DH3sByD5sl82gpug+Os7LWb/n0FjnSiZ40ZCCjOamBtSxI9GJsSRGZOXnBIKk2C3hB9i/9tCQEXkMjPsP2fU06W/Y1Hut+Qk5vBz1sLsi0VDIW17j5WeFAGH2pDmR+8tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(39860400002)(346002)(4326008)(8936002)(54906003)(7416002)(66946007)(38100700002)(38350700002)(107886003)(86362001)(7696005)(52116002)(66556008)(66476007)(2906002)(36756003)(6486002)(5660300002)(2616005)(316002)(26005)(8676002)(6916009)(186003)(956004)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9C6fuOdFV1yKJ1yl+98gJuL1n4FywTmaPoiuIGZ2OopbpcPqRu/a/KCulyqU?=
 =?us-ascii?Q?DQ61vXHOztvdloPyBlGCYbZYO5hfsyyM8cPtYVonm4CsRodd7+ARWK7bdcTs?=
 =?us-ascii?Q?y+WlbOl9TLR8k2TeVPrdn6a56hNOap/E+dcq8AzlmHI2c1WtB7Z9o9yPvzpR?=
 =?us-ascii?Q?kcpk1Y6crErYPKPPtcTO1qjxkjrQT5fyQBICy1gJN2O3hCo2oGT8Jth3ry6n?=
 =?us-ascii?Q?9yiBK7ofW0DJgDKDDbIDRnhvARI6VOghaGtSX9ie3fsjRW7JngGAFxkQ62dL?=
 =?us-ascii?Q?brqRp52ArzLRecH+eRkbMmSAxK2gFxOAAY0sDUGHR7ZSNxbEgctIouMt9eWN?=
 =?us-ascii?Q?bVxrh0eVj+lJJX16KIBaw7kjoC2xw1PI9oWTFNVQYrb9qhiox5K6NEoUbr8c?=
 =?us-ascii?Q?ETgW7lLKLYIb3Y/I2eBmKH2B8IX2eJEhfbwl9mpCb/8f0aCxHxyvFC4ahVn8?=
 =?us-ascii?Q?fsX4UyH5W+85OZ1oIBt5KatRLGxp9fe3kWAv2JqVkD34JF4HfFCeUWhAeC7o?=
 =?us-ascii?Q?+NjSIdIQbmFnPeD3wYSylTx+Lwhv5HgRMcQQHkgciqnNxHDqhwxqUEhk4Etr?=
 =?us-ascii?Q?bjX4inpbncVH/gwfD6MaBjRNTt+v4WQl1UdOg5Wxr/14LHW7KQGoC9j8W10x?=
 =?us-ascii?Q?fwH+ujLpcF2t7av+8F+9WtZ42mTAZcerqf1Sh5OphtVEDihYU4rhBjAVtBbq?=
 =?us-ascii?Q?yH3zcQ7bVeYvOFkO60gTeIolt6ltqOWWk4EP1B0ly4yLNmuruVZsAl7HCHQ2?=
 =?us-ascii?Q?nEopSkDwa/OxuGi61qDyY7eH9yR4+Iz0m3CzEN98L4/q5GxBZIbhyqQ5lAmV?=
 =?us-ascii?Q?U6ReXAbk23njHkYH0UixFR8IbfkSylAazLmLlsYo67MZgfYqB3D6ynZ7saVT?=
 =?us-ascii?Q?JU5v3xEOwBbPT2rI9YpR7QC62skwobYgXNDj0IVhK5/XwUGThX9s99Sqj5w3?=
 =?us-ascii?Q?eROOzvRITo5WKBXjdYfKx7u4p4GPyfKWhFQ2O21umuRlE2pDWlA8iYw2L/kK?=
 =?us-ascii?Q?n4lnamQKFjMt2xArStYm3hbRT9k+4RuLNSmg0REuHnEfZjsTU0BPa2Iygr99?=
 =?us-ascii?Q?hNR/c1YHD/zkYvfohQiVBv2FhyPyfTldRfIhQYarMpO63A0EhVMju0kA5x96?=
 =?us-ascii?Q?TPhs1vwQEkQ8GzR5TGKyJvP/m46480olLOXKpley0cjMsgif3pz8az0bflBE?=
 =?us-ascii?Q?vMiMfEqdpAu3+4B0WZKkYLImSROFnX7lc/DUYtuEMKmkv/gbyf4mpCr968Fn?=
 =?us-ascii?Q?FYOjdAlaZ1wOYyxn3ZiYB/C5joAJ0SL3eT2GLLee9KDpsxX4RSufYXG0e87z?=
 =?us-ascii?Q?jaurtE1RY3RmuQpLx1lz0siK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b5de55-33df-45ab-fdae-08d9416c75c9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:14.1199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJtEsYp7aR8AfjvF9MFeMmTf+2afpTOonLFTjuykZk16lVqdgd+lqNJOzrEc2NYeGYONsNHg3LK3ti3W4gG/g/bD3lUFmhcdZHj7aV6sghU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3285
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: 6uvaAJwo61ZzylcIpbX-DFljlg4Aa1tz
X-Proofpoint-ORIG-GUID: 6uvaAJwo61ZzylcIpbX-DFljlg4Aa1tz
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

Add functions for saving fd's and other values in the environment via
setenv, and for reading them back via getenv.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS        |  2 ++
 include/qemu/env.h | 23 +++++++++++++
 util/env.c         | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 util/meson.build   |  1 +
 4 files changed, 121 insertions(+)
 create mode 100644 include/qemu/env.h
 create mode 100644 util/env.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c48dd37..8647a97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2865,6 +2865,8 @@ S: Maintained
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
+F: include/qemu/env.h
+F: util/env.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/qemu/env.h b/include/qemu/env.h
new file mode 100644
index 0000000..3dad503
--- /dev/null
+++ b/include/qemu/env.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_ENV_H
+#define QEMU_ENV_H
+
+#define FD_PREFIX "QEMU_FD_"
+
+typedef int (*walkenv_cb)(const char *name, const char *val, void *handle);
+
+int getenv_fd(const char *name);
+void setenv_fd(const char *name, int fd);
+void unsetenv_fd(const char *name);
+void unsetenv_fdv(const char *fmt, ...);
+int walkenv(const char *prefix, walkenv_cb cb, void *handle);
+void printenv(void);
+
+#endif
diff --git a/util/env.c b/util/env.c
new file mode 100644
index 0000000..863678d
--- /dev/null
+++ b/util/env.c
@@ -0,0 +1,95 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/env.h"
+
+static uint64_t getenv_ulong(const char *prefix, const char *name, int *err)
+{
+    char var[80], *val;
+    uint64_t res = 0;
+
+    snprintf(var, sizeof(var), "%s%s", prefix, name);
+    val = getenv(var);
+    if (val) {
+        *err = qemu_strtoul(val, NULL, 10, &res);
+    } else {
+        *err = -ENOENT;
+    }
+    return res;
+}
+
+static void setenv_ulong(const char *prefix, const char *name, uint64_t val)
+{
+    char var[80], val_str[80];
+    snprintf(var, sizeof(var), "%s%s", prefix, name);
+    snprintf(val_str, sizeof(val_str), "%"PRIu64, val);
+    setenv(var, val_str, 1);
+}
+
+static void unsetenv_ulong(const char *prefix, const char *name)
+{
+    char var[80];
+    snprintf(var, sizeof(var), "%s%s", prefix, name);
+    unsetenv(var);
+}
+
+int getenv_fd(const char *name)
+{
+    int err;
+    int fd = getenv_ulong(FD_PREFIX, name, &err);
+    return err ? -1 : fd;
+}
+
+void setenv_fd(const char *name, int fd)
+{
+    setenv_ulong(FD_PREFIX, name, fd);
+}
+
+void unsetenv_fd(const char *name)
+{
+    unsetenv_ulong(FD_PREFIX, name);
+}
+
+void unsetenv_fdv(const char *fmt, ...)
+{
+    va_list args;
+    char buf[80];
+    va_start(args, fmt);
+    vsnprintf(buf, sizeof(buf), fmt, args);
+    va_end(args);
+}
+
+int walkenv(const char *prefix, walkenv_cb cb, void *handle)
+{
+    char *str, name[128];
+    char **envp = environ;
+    size_t prefix_len = strlen(prefix);
+
+    while (*envp) {
+        str = *envp++;
+        if (!strncmp(str, prefix, prefix_len)) {
+            char *val = strchr(str, '=');
+            str += prefix_len;
+            strncpy(name, str, val - str);
+            name[val - str] = 0;
+            if (cb(name, val + 1, handle)) {
+                return 1;
+            }
+        }
+    }
+    return 0;
+}
+
+void printenv(void)
+{
+    char **ptr = environ;
+    while (*ptr) {
+        puts(*ptr++);
+    }
+}
diff --git a/util/meson.build b/util/meson.build
index 0ffd7f4..5e8097a 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -23,6 +23,7 @@ util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
 util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
+util_ss.add(files('env.c'))
 util_ss.add(files('error.c', 'qemu-error.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252133BDBBC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:57:45 +0200 (CEST)
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oOG-0002FX-85
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJj-0000hm-UV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJg-00083s-Lg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:03 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gq1Sj012481; Tue, 6 Jul 2021 16:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=dQPNlS6XV2O63N5HaIRgnMAK32dc40qLravTWRbi79U=;
 b=JKvzcZkvKeMvlB4u6gsBiwFmiM16YZSaHI7T79b2qDbDSKiDBrvc9LtHhYB2ZxiQOvC7
 kGx8JihMe74z4Tx/JDhopJrO0IBzxDZcqeA9/ca/3yWShf/19v7o0RQpJIjpkMMuOWBl
 a7419KZWYyPk0myQsO+3teQIOFaQ5NjtVh/cUSru8FU0pv06tOmtmf2PjssTWwcHImDl
 zje63gZlknnPiDg93Dxb02h379jEQYkrukMLhrV1SJSs2TVfujC8couL20f/Ce9YDqNT
 ivCIg4UbC7zSEn+mdg0wseCgojkmwOOq+6kLbjmo02740ZO9ZQE90z6afSXO2NcLmkay qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kq8ebbft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoHMt012559;
 Tue, 6 Jul 2021 16:52:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 39jfq8vj7s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El2dQIVl9Tj469KZ9wfvUhllDMVOXqpKKJUEnJI+i4nSmexsdTB+j6SXYmp2S1wjnBsu/Xn5sHP5ds9D/blTrzsiklCokP8VW87NYy7KviKB8HVsHxhv4V1ox30wemrj9K6GXi6YxQssNtPy7Iq78s0dqbLY1HP+ryh/dSJVgpPJuay12HNdER6ZgjfsM8COCj+kOHDpSwOzXPjMZufcxKlgw+8CYa6LNhAqqO78WuT4SwRJtFUaIIytl8XDWWJ5u3GkAfMf/G/IflMZU1khA6Bla9V8TlpA1VviY8iCu2/Ok+pNFpvDZNaoyrJlfPWRkdkN8MUUmUjoG/gbvNQX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQPNlS6XV2O63N5HaIRgnMAK32dc40qLravTWRbi79U=;
 b=bUlr8v2TQEh1kiNw/TcYnOnSMnqiqzMHjoJTTzbD1j++6EyVOYv+o+C2uI4OvAUmsG0MRFAAaF0iw1EdOT1gXAAHuN2MpycW0zYnG62L9SbIwQDrJYNI7Jzb/AYCocrbLW/HIIw7shvrW9cX4GwlVPQ4B5eDg/LYhuNTyPUjoGQRnbcZBEMeWTqdQOxuSL4rvpMT1ofOv/pQaXYhfSM5CRzpRLHmnfq9LQ+1jXB/Wd88CCCdVrzt5ABt9Ldq2yM5LxEdQkoHgNVysADq+0MU9O/zcMJpJZAyi3ZoGgStetEVHT1xu5kKlppRj6gl2r52nU8h12Ir4CRti56wEPybRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQPNlS6XV2O63N5HaIRgnMAK32dc40qLravTWRbi79U=;
 b=JYw8x8FlMC3EdsCNsMkhBM+G01+kCx/bKv2jyvJCcjEplpcCJGl/FCKDPodT+g1UXtBiUFgcJzsqa4gycKrfOiOdugEudXlC3J49KVMpWvC/YfrefW0GEMPwW4/0uzYL8lGoMmPZA+W04dIlYoF9hnBD2KIA7JvAyb8cIQ9Eh+A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:52:55 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:55 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 10/25] util: env var helpers
Date: Tue,  6 Jul 2021 09:45:41 -0700
Message-Id: <1625589956-81651-11-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de7c2fdc-dbe1-4874-2d9d-08d9409e801d
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805385737A54515BADF16F1F91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcWU5hr++EsUOTpC9BvIkmgRxzPRb92bk4s4ke/LN/lnIIKoOj8XNi/ysIno3Ptj0cNainbC3tAZDt6wU8S05AfljzQ/jqiEnptcf5BqGUNMRIWEk1lM2irO8MKbierIu8B/ytdeRx3NNgDOt/g48/qP9GV22uid04KWH1l4yhiCl6vP8gSUPg2w3Im+rVP7ZvLavYQk0/VAq7NFgsWNs+6RMN6B1tOK0wIjaQrbgqPRF3qQdtwvrfxjoQp42PHZa4znzdNggL3oR/WiDGaid4Sbgp/Ry2Mz1RfaVrEQ2fwKZqx6KIBobD+KS0EMTN3NMVZqLG42NNJ6gyN1eNvZnxjmOopFT+JrW4Cf/ZJccSt5QShukiyBlRBoumifgtSsGm0owCjtPb6GUKwZhToeIzbaVyNOxX6bfLdJ2oiLG+r/G2CLSrDPYlI+y01YdVDad3CQh/qCtArINEJWU5Ce4GDulxbvnMRFgjZw47rMBbkNh6siAEGz1N9a2EBY3ZjiSQpzKcnoYJMqJ+meks8EXs2GySPFbIvAG/bgGLD8ycCRYFB4IqNKKEmXujGX8zHkfnTB4wF5KNA/f/NGbaM3ErY9vVqDVpME32wbMd00votMiUoEldaHQO+cS4fevc0dmJQ+sgVtl6L2eX13/WYNw02TLv2c4Yd2W2L2sIvJsKcLy0O3zMUVWGPU3Q5TSTVJt2SM+6lZNuM6Zp7CsuQ4Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j3Q0ifdinLSjKro9nSIk0k7iTlIM75qI0rAnCOYujc4bZbrQr7UiDuG5HMgJ?=
 =?us-ascii?Q?nl4IPuUwyRJuULy3IFWYgJxDY//X6vJJUi5g+sEXl/dcGsF8Ll4tVRCMbAsP?=
 =?us-ascii?Q?pza5rWcaPRRPLpeLQe6WQLjSWUfTTe0WTdg17aW6mAx3G2vTB4hGiLo30yjR?=
 =?us-ascii?Q?dr91fF7DPSvFbnBX4O56uFeGokmvfPKPDw/PcRKj1SyD4Za5eA8kNI+NMubK?=
 =?us-ascii?Q?1jZBeDhuPEYrwnKKOS5Z721agFQ/9AgbTIE2ZdZjG/jFtK/+fZB6z4RLdpQV?=
 =?us-ascii?Q?Itk5uFwcxTAmsSkl8L1ZVyf4YAc/FD9rR2DGkETod8PtPXZmIRfllOsJ4ufe?=
 =?us-ascii?Q?RWs8XELM0blfJwHQRH0jDrsS8hdtjHUWuiweZyAgkqWAGs/X2QW+Dt2gpD18?=
 =?us-ascii?Q?4NapqZ8cKLAgBz+539wOwFcLpozkt5spyJVYycC9ONua8KES1XQ2SjlQ7rXu?=
 =?us-ascii?Q?29R5VSHAZ/lRnk1uw/XUSQaiqNioKfpfhhqj6YpxxbqHYesay5fF+xdcT83W?=
 =?us-ascii?Q?CCCcxzgqFcZChFnlPOcFwiPtzo/RbSRhcoOtO+ZA5+KAl1nKVjJg7IzRCSLr?=
 =?us-ascii?Q?1BHMoXPlmz1ZK/WBbd6y0baR+bFoltW3vJ/TrPMlJsQ12qhwlFZbYYkcINVB?=
 =?us-ascii?Q?ki++nYw24KgPhEqJQ/jIYpcJw7+fha4yrleCxGiFUcErBXvKhnZA/htmm1rw?=
 =?us-ascii?Q?mWHzd2xH2BgZV1iKCIBe0o621ndeZ7e+FH0UD1lj4QDVvwVsw/1TEEfHeD+f?=
 =?us-ascii?Q?WB4fQlK5UTe8W/pQZ6INzj3Y+JTtWB/bx1kPCkQALFgXBUqpQgiTpJH4cOwl?=
 =?us-ascii?Q?KJsLYZ51PVbEiAttqwarobTCO4BJLZmQxVGryduQ9vGVSZ2KZbfGzypw3zs8?=
 =?us-ascii?Q?+MkkTKrGkbHNch6bdAP+ds877TXpZ9Ywo8EX6JxtWF/gYItYtfi/PYdpAvzK?=
 =?us-ascii?Q?xwzkG6/CfacJy59mi/PtcjBn+JRCDcrpXA7Nm8PNqEAYIC3lkZXgFQqGgSeE?=
 =?us-ascii?Q?iOsmxYrxsZ1gu9zp8IuNLyfw++mU7zhCNWPnDnH0PZFcqy8xACidvmU+Er40?=
 =?us-ascii?Q?2jZJZeNLiU6RSfwyYJB0PVZqKO3Xm/wTQlqbtAlBINnyAk5aLK4beMWLnD8M?=
 =?us-ascii?Q?Bkg7eLbA1sD3LHP3UAoYcOwooJUuez1Yl9YcirVwq/QYHurKu0STdsSuLITe?=
 =?us-ascii?Q?LbVWlDMLH02zhf+dmpknmurpywABkgn+z8ym89deASkzk5fR/amLSs9pRAgo?=
 =?us-ascii?Q?7w5MKBOtgMTMnLTrQ1fMrvIGH1nPX+EV0Vn4oIBg0cQQsGlRqobFHRtxLmZV?=
 =?us-ascii?Q?CKo/rTKSFBn42V79HX/AI0FZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7c2fdc-dbe1-4874-2d9d-08d9409e801d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:54.9121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqYqPyNoaJVuKXQfOuzgA0UtMmSNhMED4Sg/QJsBxpbcvQrLVdWpsAyAvDS0tReWQAw9R3hCTetFGGR+BE7BzzSphFuWp2mVFbYESX/XOn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: Y0Rjg0NPmvdPRg0VLMq5MbjNMkzk8iOa
X-Proofpoint-ORIG-GUID: Y0Rjg0NPmvdPRg0VLMq5MbjNMkzk8iOa
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
index d4d1e9d..b844f3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2850,6 +2850,8 @@ S: Maintained
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
index 510765c..d2d90cc 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -22,6 +22,7 @@ util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
 util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
+util_ss.add(files('env.c'))
 util_ss.add(files('error.c', 'qemu-error.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
-- 
1.8.3.1



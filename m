Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D04D3BDBB7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:56:37 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oN9-0008Cm-Qa
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK9-0002EO-KC
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK7-00087f-61
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBZG003703; Tue, 6 Jul 2021 16:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=qYg8GreNAWPes91dNHrr8yVLXP54kqPqIjoLSlai4uU=;
 b=JP6bq3WgoRJ3cc9zyDALLmyCyvGk1VUHQZobpREbPEQPya2vW9P/HkHUN47PAZcz12iR
 o3H5Hqx3LfJSB55hdjqPiqCLC5lDjv01/Jdhiz93O+AXwJaydlez3wUt/4uN68K9ovX3
 0A6JD+1bxFLlog9hd+aJnhJqOy8GE0OxefBVR087QBgP5El2YpeNfhYpXaFzVDljaP5q
 P5KHN257Yq52BqK/8rBBjhXuzCNyY6kcMSYIVvSKs9hk8b++ETfMwqk2Q/I7xM8VSs69
 jCLisjDFlge20u2vZdpsHFbChx8WEGQZPyD6lNuQnZvXcFoFLxWvqltASXcQDRky10Xp /w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoWZG084855;
 Tue, 6 Jul 2021 16:53:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 39k1nvcqsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvUNS3B8xVLTFy68VS+SNATnSX2HmpNfLdho3fwOLwxDY707rfPJxxbxjiR6x3Jlp+vZJ5by7TEbTn1SBZxn7DYTUDtL4Fpw6R3T5zDW0Hk8ip1D5YcvVY4T+Y1DxEfhI0m9/IkM2THUE0aYSokJPYHTX5wU0A1tYP2TOb11epIQdRtCKuJaHt6Yry2wGVOFvBNwDuaXjjXdmdXpCiFJfuertDlUyFc1wA0fj1dzIuXUCwOwjnFgvDmyublnTKx4grJyFmsS9K4+H7MKGp2NUSzZKFy4VxQMs9wLznN6oUD3sZuQrWlfQHUdJbirqewv/q1XgMQ7m3aIsR25tVPs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYg8GreNAWPes91dNHrr8yVLXP54kqPqIjoLSlai4uU=;
 b=QJIOhYH+jFOL6He1cLiI8gxWcbX2j/FlHfSw/1sQF+q9rd1/Lyy/r4JmPxZu6ogjdlY0vvJyZg3wXoHHGIdDkp6qDldKPLUaEGz5Ydo46fJaEXNCtsmeIaiSTDuZ+u5/zYrO8BI8CrcOBjpYnPRHQZuePAwQkokUNdbyJcsj0F3XRVHNGfJm6FoHAVN6B1JKq1lq9X6U3z9+yhxO8cMT2Au1XScreLd4p7sOTISI7p50Ak8RfbTlYR1ENSOHGEMqZBLrF2akVIkYrBEp1saVal4VJi6qSEXnWk5vQDVsUUCFyczREEDr+u2GOCa3cGUbPflxLTp97vKq3k/J5j4Vqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYg8GreNAWPes91dNHrr8yVLXP54kqPqIjoLSlai4uU=;
 b=SxvxVf17+H3OdSKr/oDqA4fKtskjGkGKn0n76xMYUHDqZpM8PweIhw0ZCj/eeyBBccOB03KGc9Mt3qpaDIls4VdXgPk0xE9pZRl5HFyexFd1K3qNL/lIpaCESSR+7Pk7k+aSQIxt0V1uCW+KBZ4K0otl0fYmr8wHnAT/8lRKgRA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4416.namprd10.prod.outlook.com (2603:10b6:a03:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 16:53:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:20 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 24/25] cpr: only-cpr-capable option
Date: Tue,  6 Jul 2021 09:45:55 -0700
Message-Id: <1625589956-81651-25-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:53:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8659cffa-0cc3-4d1f-b1a0-08d9409e8f30
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB441672F84EB8EA18373581F9F91B9@SJ0PR10MB4416.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQaQZx6s3oRLeLJlaJPMKztUnKx2vTcnHmqTk5dUHRmL4hvpgrZAj4J2M+bCPqdkkJdZDXHih06K756kmwC2Gcrc2eqYGVZ3E69gnE9SDhjsigjc+wBU2TiNIcEcdCrzccY2ECju0SvG+q1F78TieAAQ046+jshhjotAdfyRQUY7D/S6ghfgmRI3dQ9sp3oyEPI2MIBaAX+HFw+OITff1ub5qWw8USIp1hk3eIYE+YY17dfBVU5+CtDCI5UoihsPsPQozkNx3j+cuMNbJhDOfFEUZCvSp/lSxXOqnDZxvM0LZOrCLL3Al8mZUpr/C4OAq6pDT8RhvSjuBnyqPbmPNcV5mLTAaWsiA0ZVpDO7bTfX0hZJqVQXtvLoVE8CEUvqof+04gawxgyq5EJAOoPujH7nDBojzHb08MplfoV3UXX/qcL4H26IN93s8BIM1VZhOT3/7S//OsHzNT7qhgDQV4fbD3H4jfFE0ceSLhnKSRbK0TZvGiqBkdR5l3tQoPNlA/Wo0cYp+fcU8F+Bt1JMoA2AvvoTpzrFRa7mSiUN2F6QFdCYHCz9PsvOABZazpXWi3wMHtLwX8sKc9XBFIDE3Tyisq2LitC8SoAEA0sfZqyEpvvUkEaWpq/0j5KF4UYQlpk8CHFFHD2nX/JygDXCu51YkqIwGt5YYOnVwPNRbpql9c+BPSyf3SD7ehqQZKTBJU9nZx6DDl/dRXYoKxRTQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(54906003)(83380400001)(7416002)(38350700002)(5660300002)(8936002)(66476007)(38100700002)(107886003)(4326008)(2616005)(86362001)(478600001)(6916009)(316002)(8676002)(7696005)(52116002)(26005)(956004)(6486002)(66946007)(2906002)(6666004)(36756003)(186003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UELPtLQdptl98OVBEGMM7yJuvy16tHhPK9HR011OcuvJVd5P2JiXYYDcIV7i?=
 =?us-ascii?Q?MnTwcNrWTlwhtrN7sjpAfvPFI4TSH3E5Qlg1S2Ri3v8/X4tfNbzOxwxDByu8?=
 =?us-ascii?Q?ZW1RWvesgxt8vko6cGxIc9sHAiQc9Uz4qD2QpfDi4AozfEyylJbnHJfmdNXP?=
 =?us-ascii?Q?T7Zv/mqNXJRMFVEMMqLtDOgdBH5YaiHjhYEDcs7jDPJ7+7xmKINaBzf6VLtL?=
 =?us-ascii?Q?P+kqepNpIzAhOHwoOHFOOhksv1UezVmehisya2VAYGh09qoEToTNu00Zz+YQ?=
 =?us-ascii?Q?wSwK+7nVncD7TZWnxJzfUVVpx7VnvyfQ5qICPkF1lkJdUJGFzcByxgolBPMU?=
 =?us-ascii?Q?UJnboldhEuFM3O8wWKpmKn2iPnv1ZZQrh4YXq6oQvg4OpfJ9IaZqylVBBf0H?=
 =?us-ascii?Q?dwhbPC1ImIjQetT8fUgmMIK8Soo8bOcWE4p0AfYhBkaBydb2P5Cezw3vyLeq?=
 =?us-ascii?Q?5o0Sc32/ybwemajF25HDhD2iRm8ZNnyK1yLZgc+qX6/hWUtgxpQUYoaPmmv6?=
 =?us-ascii?Q?G3wjzduYAZ7ymvfrCYBzJQdPO3+A9FU7C4QpzfKeIfkhC1r5kd21eiwh7kER?=
 =?us-ascii?Q?rlfTAFZzv7X+1jRQ08GulEVyLrqdXnSxAQL+sRziMW+/k/7f4DD7yiAnVezu?=
 =?us-ascii?Q?NK9G+dlVYPiqs5Cqp1uOLf1kbll1O3kDowDUR6XaaJ/RqusKk9t7sKB/HI/G?=
 =?us-ascii?Q?WIk2DBOuy00CQVcti85fkY3x7ygGFGQml7735rtrjzY0mRqB650LXVny3xE3?=
 =?us-ascii?Q?DRbD9YdP7qs9BjGT/1C7GIwLuu5OiRCcAI+3eTZk4QJxlXidiFcPCSaONh/m?=
 =?us-ascii?Q?CpHeHnzpAb4gRjSL9d5SVUKzCuM/aGV1QzYwWq6/EwbR5xsrMgjPYWu4h1HH?=
 =?us-ascii?Q?ne2WBKuRBCvtsR6amYiCmnXR05L2WPxroNJvpJFzsd2G68A3aIg1vGRklz75?=
 =?us-ascii?Q?sp4d2t7jafXN7vKeYQlFZPHZO5V+syDTGNguSw6l3dBOg2Wy5wiIIbNRiKWJ?=
 =?us-ascii?Q?BfM1KkrmxKGrV7U48mMKTvqlOkgDWNwAQJ+hSvlBT6Mxt1xeXAHRAKWPdsF9?=
 =?us-ascii?Q?rueQCWZQSEMtjcZSnNWSVWhQLsdO1u3ISyRxZ2BGTmufLxZFavJTPJMgDCFx?=
 =?us-ascii?Q?Kz5CGP4e2/jzAi9Q6gVedzhhJ9LSi081WyaiOAUXKrTHunMWS/M2TEJfhpft?=
 =?us-ascii?Q?V4KrdzhGz9V0mxxGvjoUZ66+rXSOwhgi/1GR60nBYOEOBjqtZxtf+uIam7Wr?=
 =?us-ascii?Q?DNRgJkc5g7GSgHAzqzI6XZf5xc/pWUU90AomM7BQd6EWhxrhH8gol4LNa8Ui?=
 =?us-ascii?Q?MnOdUTzZ187/9fb4wXFSCBuF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8659cffa-0cc3-4d1f-b1a0-08d9409e8f30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:20.2028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSIoHDfQfl7PImH8HywKx5kVYoq21vTp1Uju5qyQPl4JU439CVUGCKoXPPpxv4GnNC6SyJ5oSFPzQdF7gHaHB8oq8rJRKLPPM+SRWlPBhVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4416
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: Bwy5lLfqr3FuFKTgYN0GdNNcW9-NI9En
X-Proofpoint-GUID: Bwy5lLfqr3FuFKTgYN0GdNNcW9-NI9En
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
 softmmu/physmem.c       |  4 ++++
 softmmu/vl.c            | 14 +++++++++++++-
 stubs/cpr.c             |  3 +++
 stubs/meson.build       |  1 +
 12 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 stubs/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b69bbf5..25b5bc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2853,6 +2853,7 @@ F: migration/cpr.c
 F: qapi/cpr.json
 F: include/qemu/env.h
 F: util/env.c
+F: stubs/cpr.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 110f263..b8c75ff 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -40,6 +40,7 @@
 
 #include "chardev/char-io.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 /***********************************************************/
 /* TCP Net console */
@@ -1468,6 +1469,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
 
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
index 492ff31..706fc0b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -266,6 +266,11 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 
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
index 8ca0341..181c8d5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1262,6 +1262,11 @@ static bool migrate_caps_check(bool *cap_list,
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
index ef2d24a..f1b372b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4257,6 +4257,14 @@ SRST
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
index b79f408..04e3603 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1973,6 +1973,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else if (only_cpr_capable) {
+                error_setg(errp,
+                    "only-cpr-capable requires -machine memfd-alloc=on");
+                return;
             } else {
                 addr = qemu_anon_ram_alloc(maxlen, &mr->align, shared);
             }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb526..78f8829 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2589,6 +2589,10 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
+    if (only_cpr_capable && !qemu_chr_cpr_capable(errp)) {
+        ;    /* not reached due to error_fatal */
+    }
+
     if (loadvm) {
         Error *local_err = NULL;
         if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
@@ -2598,7 +2602,12 @@ void qmp_x_exit_preconfig(Error **errp)
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
@@ -3339,6 +3348,9 @@ void qemu_init(int argc, char **argv, char **envp)
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
index be6f6d6..2003c77 100644
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



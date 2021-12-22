Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B583D47D7F4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:48:30 +0100 (CET)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07bB-0004vX-NC
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V7-0004ax-Qk
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008K1-Vv
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:13 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsgf013630; 
 Wed, 22 Dec 2021 19:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=K4qeW6v/Qx1Urh6s9zmf5PmLjgjUmQlQiy6OAhEB5pEWdoLWzbWGAyc0kULDVbHN0PzB
 PArv1mbIAF3igzDKdUmoGa3RQPk/O0BlT6i8gVrGVxpuXUWsrTh6onZ7QVklr7laQLuv
 qApRURiqm2aMGCmQgwtbY5Gjye8n0YExRc8P2Le5XSy7bO19Fdd9D0RVAa9dOMYdaSYj
 kVecqbjcJ25syGPB+a8CjFq2Wn6UY4Ne6CeUZLvRIS6aEvq9MNwWQtFqDr9RZVdNot1T
 qRmRLiKlWMpIUiYqLZ2R2b4EOTelCTV684UJiGUWgVVW+Pikicz+k0PLCNGnLe0rvl8T sQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeV049074;
 Wed, 22 Dec 2021 19:41:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igu/hU5raI56haHuM8ggDVDSpcy8zdL12lR/DLsCJfy5B+HBweVmJFMePmxDQ++6xx/n9VJ1Sd4/eN7ZqOHl2Nu/0ovSb8Ce4QcTRoPd6hnpFVniIDGjJ0HbTG0Eaxh0ogaVOZg02xinC+G6ucRkxa/U7RkNSezc9Yk+pO8WzBbdbyZRNN4w69K1XcZSdz24ZZFjDyEJlQdbuXKcOjjucD1euADiNqWfQY20wKY/3LexNNn2wq3CTsldmI631Gqv0BfWkCxeHij3+wz0y/Z5+JkVGVqPjBshHEXoqLdNKlblQwBNl590nXlGbfE7ohvusfPRySYzM3BPLK1RL5J1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=EHUDJ2mvhnHW0XjXwUORGJXAueMqG4TT1XWp5DrxlscLSkUlajr3FlpDEgACQCJCpr/PUD81nVriyxdSwPeMo1J/+gAVsyt14rOYPL4B2bCuBq+THWejoapreAOo2W4wslnPkzk1DBVwHCJcnus99mEFeDWl99l6WWgtO0EdnxfucghI/Kf9M//v7KGugB7/ds4DfFg7dqkud/gnjl229DZttIn9gsy3n9msfACIdMI/Jk+U9QkH/qLsY+2vLFp99fqBAglbeyj7/PKMEO9aKhW1ITrpc3E0hwmwfNu9Okw46nWade/FYJBLNUU8AbzcLZK/mLuXZj6xpQTsSwAAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=GXIxHm+DYF6gnooTeooIoBPfu+Foj92yoDnkpGGp6HSj2F6UH7CBDTgvQNpt7Eew9B0dn+w+c6tncWAqiqONlTtHFpBylpxltVunoNMAuieKO/sJhwyZqwYvsRw1OVgv+fQPG3P2Ppdu6zaNmokH74gFYOkfny/QQJe8YXf5Wr8=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:55 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:55 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 03/29] migration: qemu file wrappers
Date: Wed, 22 Dec 2021 11:05:08 -0800
Message-Id: <1640199934-455149-4-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da479118-d1f1-4bed-7335-08d9c5831c1c
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB288820D1867843C04A705F4DF97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evYeITn3Ip8Ktk2wfAeydHg9YSB1WgZbw2F7k+rfMWAALvai1Pk7ziY0n+osW+OvGWMhKtRtJn8RWioh6zbGaRvYAmgePk1h2MQ394+aUHrSPSx6BYmTCgw4qEWLaFktTriBSwtIXQ6IGPe9VUd1FBw0qXP1w90ho0Lf611OfnR3ni8Bt41LzfE1eSHBiP6XLb3ixXGu4ieGLYMFaQ/PzToxU6KhqqSeh+A5znYNZxbpN4hkTCFueVZqhIHr6vaabladKfEFVnc3WL0uwbWOO64SnJ4m90kkPdLkYefboc66M3MJ6Az/K1cwXNuumWhF6LiJ14mhCHo7JMi6MCof/4VTqgrAatZFNZ6rk33qJXQb7HEwq7QX7LXNzNcJJDK/0TX9ZVp4KwOcT/5AJ+nVmv8r/tA+tY/vJrYfuT1da7KboMAOMEXva5jacfrX6KZFFQhRdj+tgA7f7b+I+4nrcp19r4cH5B8+oNUzzd2GzwUyePLNSzYJgXWQ20HMIlXkmPaYq4FxGA0kzKnTRA0gq60EojXhKtkWmhFqSq3GH3yZG+LnWJuN2x5PmiXv4JGiB0a9L/R+0eDEQLu57aunFGtkZzLSmiR1dQIagf5vLJMsarrz2MQpSURdOc4p52LuKQsP6CE/RWW/HbBkwiNEIwIvmziA/AS+wtBgsnwesfOvdR8XrK27qFO/VNmAek7f6yb7CTLITyp7ESVJRX0Lkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xQkMnXFl9W3jb0Du5X6hj7+BwAP/VV1FXSzxRBEVp/Fspsu/LQU0P2OAMcYD?=
 =?us-ascii?Q?D9dFTmZN6NcTedUH4H5wWVL7gs3tcT4JlntcvFaYPzh8FQ8FLBl2jCewDQSI?=
 =?us-ascii?Q?Zp1q/eCBmtEPujTDwrlcCsIFWq6OEwGjEbY56JcxexBm4pei4UMkESVukaNi?=
 =?us-ascii?Q?G0eKmmQyEjBomYrwq3d6Duq+7PHaANobWkpGi/eEmQffv0f6KUjFAG2VXSbT?=
 =?us-ascii?Q?qBnFQppBGpH7iaW2wfNsEEX3kCY2F6r5bYmRKFj4TS7rVwqGG48XpaVozI2D?=
 =?us-ascii?Q?mcvwVzgLO92c4Ho/9A/UCjZPnQ6CWInnTdlDDyeJmm4A2b88g84vHYwe1PB2?=
 =?us-ascii?Q?oEaWnTUq7F/JfwbdCr173BJyJqaKBKsS58s7YrbuO5xvgNiFUZIOzrQyy8MZ?=
 =?us-ascii?Q?2OcuwYd6ktoaicxU45cNJ+hPOAyHxreVwVzGvc/QG0urfT23XY5ZdDn8eLP9?=
 =?us-ascii?Q?CSmfmrNLziR+lUS8TjWCV+DnWaU6yzChMGYVQsMUwcU4Xbx33j5ZTWwm1U5I?=
 =?us-ascii?Q?j2Kzu2R8vIftoQfErgfMwl8UvIWiTsZC678eL/dvN4X92fPzFfBjH12ak1V0?=
 =?us-ascii?Q?GyAWU/Ho75pXjsWBmb91sjdxyIBSzLXTSJIPP1w81JUR5EsCn6aKp2vnFCja?=
 =?us-ascii?Q?nEdaT/e2v2QCHUEf9ypI30w8x1Yy1OQ5jmc8NJ9xQJlW04R2vpZtsXQ76KMt?=
 =?us-ascii?Q?EfeF1wIwGMUXyWagPh16sgJh8EMY3nQi77zN4JIWmsSjsqJCalFz9Yg9fFKt?=
 =?us-ascii?Q?Yk5tqqmlSJk5qWMLcbwAw2QXrDnxYi8wL7n2XyXiVYxxbwkoj8i7f5qLGEQU?=
 =?us-ascii?Q?dZL89AUKsMuu4gugbT8QF9yy/G9HDUbcBI+5epl+0Glai3wj75N5EtVPVWs9?=
 =?us-ascii?Q?UiKsVoWfpBoH7ir149UvIKBmrX2nOPezTtFrRvtz75g2rcwKZvtu6ewtaN98?=
 =?us-ascii?Q?vZE5Ijge21cXSsP2NEIRvzE4tXH2iib8WWcBV+SjHHSMoRSMvoJaFBF906Og?=
 =?us-ascii?Q?17gXdttKi1IoAeCehsYE9oeON7c2zV8dhM7EG5JVnDX3YO8rb8kdM73gP7G5?=
 =?us-ascii?Q?48/NaH4bL7bWC/jiCyNdyIOFHks8X4bxJuQ8WO6vtSX1/lwPz9sDoweqz49D?=
 =?us-ascii?Q?uk3fAJUWMkVRHxM1uRPEIFgptTh4DVHKrRpLj3KYBMvzCXHIwJAZqtp8EHVv?=
 =?us-ascii?Q?BcwJA1+YrPSZS1ZBH1GMA4HrvKhRmyp6alHV5zAilI0kerlgB6xdamAkFJ7e?=
 =?us-ascii?Q?GzNFZQ5kZk0WfS1+5qcjJEh2QPcaVXy4HulGkrX1NxGCs9JBPqcXDwPYf3am?=
 =?us-ascii?Q?4x9TNFht55BQ/yvJSpPWLd/HxQzxJJJ7XUcE8MzU7gbk3DjyTkQwstU9bzgp?=
 =?us-ascii?Q?2KQzuTnNdrLY6DTa8mU/FjxKyt0pOwXGMdUy/RjTgUnh1+JlKEPQib8hK16x?=
 =?us-ascii?Q?zy+sK/f2e1Y0DvS7YuA58eQiNmse8kZu6mwf1DU8gYxe2XB0RoOx/kYcAjkq?=
 =?us-ascii?Q?xes56wN/NW1VBLHz8qRDrx1DVneJ5s6Ext3OLpU62+yVO1WVnC2EEZOqAwSS?=
 =?us-ascii?Q?os9Iop65iRzHJsLXXAkaS0k/1drWHLab/a9j3iJ5qq1JCOKtsYTky7r+jLGQ?=
 =?us-ascii?Q?cu6W6VHkkBAOk94TiAOjeOgUckKOUKZvb0iFhw0jzp7t50y5kwTRp9eDwDI0?=
 =?us-ascii?Q?33L4fQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da479118-d1f1-4bed-7335-08d9c5831c1c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:55.3743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5LTJhqWpgw+JakqjSQ6whGbmdhXXZwsME4kQCqQMvosvR6/wxLr6DcisgvY0Sy+9XNt+qucmNGTyVysXftm9f/yduJVZVenZKoql2zkx9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: _W5bMeulgqJWt4nHTzk4zlyYqRjeUNMn
X-Proofpoint-ORIG-GUID: _W5bMeulgqJWt4nHTzk4zlyYqRjeUNMn
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

Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
files and file descriptors.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
 migration/qemu-file-channel.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index bb5a575..afb16d7 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -27,8 +27,10 @@
 #include "qemu-file.h"
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
+#include "io/channel-file.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
+#include "qapi/error.h"
 #include "yank_functions.h"
 
 
@@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
     object_ref(OBJECT(ioc));
     return qemu_fopen_ops(ioc, &channel_output_ops, true);
 }
+
+QEMUFile *qemu_file_open(const char *path, int flags, int mode,
+                         const char *name, Error **errp)
+{
+    g_autoptr(QIOChannelFile) fioc = NULL;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qemu_file_open %s: O_RDWR not supported", path);
+        return NULL;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return NULL;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    return f;
+}
+
+QEMUFile *qemu_fd_open(int fd, bool writable, const char *name)
+{
+    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
+    QIOChannel *ioc = QIO_CHANNEL(fioc);
+    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    qio_channel_set_name(ioc, name);
+    return f;
+}
diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
index 0028a09..324ae2d 100644
--- a/migration/qemu-file-channel.h
+++ b/migration/qemu-file-channel.h
@@ -29,4 +29,10 @@
 
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
+
+QEMUFile *qemu_file_open(const char *path, int flags, int mode,
+                         const char *name, Error **errp);
+
+QEMUFile *qemu_fd_open(int fd, bool writable, const char *name);
+
 #endif
-- 
1.8.3.1



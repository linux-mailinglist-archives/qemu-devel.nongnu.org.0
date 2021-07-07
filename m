Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BC73BED1D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:32:21 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BPI-0001EH-CT
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKW-0000LM-Ma
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKT-0006ka-42
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:24 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HClel005035; Wed, 7 Jul 2021 17:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=E9WGCTEWcKfyHWkHeM0NWPiJKZAH0JTM5DaTNZpnzYk=;
 b=pxUS7Cpec+dHh/F/M7iecgHHqwajyblgPiIx6HaumgDK+HP4ZNh82/Dna3ImAGo9enq7
 Ji5gC+7gnNi/BGsWbN+1nP+eLmco1AGw4JJ626TBL6YWK7QfChpgPUmUkyv5IUcsrv1z
 GC7WD6HkmCIsmEQASEaYdVAnMCavkmBjhAmg6JHHG77WE3RZ4Vv262EdFknRA5kBpClQ
 NxNHcx+8IBlZtkgBwwzGSoYqGo1VxfV+fatnXsDivxQ9c/Sb28xoVCkzoGlinKL9Q7uN
 PBcWpv1jkDUQdLXkhBtAt96yHQCl7x9B6GjtxfBLvRvX/bwfDz2FKfxG1LJqxco/QkfU Ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n7wrs7py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA9Ap026129;
 Wed, 7 Jul 2021 17:27:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3030.oracle.com with ESMTP id 39jd13ubct-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYldjOFfz+roYeue1u3xYGpWMuwnRobheG3lM4a06i/meFWuB79Qoc6fGZFrkYQ9LsOE65h+zsc2LATMHFwTUxZlEIxpt2unRgrYz9Zvde2UNfB3QI1Jt1ki9ErNTtCI9CjeA1c7s87YN5Pzo0N1ViAWt9fxCcYK+UilGse1Pwla6SNC3MOY68qAPFocNvpgF4VAqExf9gqkJJw1yR+T172joUlhkWEBx79x46pZ3rbwc2Uto1hQSzkn2n+igjYQBrhiR8nW7M4V60AdNohnnAMpYXR540JmUBfr0ZLcbghpWsRYQXsufaRbPUuHDHTaZHwsDPviUnrL+rraIJe9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9WGCTEWcKfyHWkHeM0NWPiJKZAH0JTM5DaTNZpnzYk=;
 b=YQzuWahd6GAxwKSxhMe1T+RxrIJ7ibkbOCG7yYUcRE8Xpltu01U5UQJXxhr1bb0pR3GGegxEkPOBeWpD3pkBJLGsSMz2ZCfLW8ftTKLikJbMZPV3fyfsQXknaEgALBP4K4/zYCwN1aXD7zhvTLqPelVeqRU705xVLAuBbt0BQIZcD5UQ2tpNp3m2YBdrqu5YRZpIMugH38EXGtrdiyiNdP2Ary93uWWmIFR9/J5Iv898xcQvNik7bvTqi3rKbRwXSDVDZEl3gPzDmqn7mVW24CC95VVWxtfiyqWPsMTpVShTnH8koarpDDD2nRbKQf0IlORjp2yuNlaNOT3asGHQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9WGCTEWcKfyHWkHeM0NWPiJKZAH0JTM5DaTNZpnzYk=;
 b=wIJloxtYRrc69ljXz0JKa2WD2PNlHG9QU9kxXjaZjLIBvRgktHa9paJMycxfBXM04huQA0KeVs/sXefYSkxMsJNzmJ3v1/j3EN9vtpQJl9aepoh+dgg3Xk16yOxdJKKiETY2Dh+I0onc10f6wPg5Eu/cbfuFGdusHePrv+JlBL4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3285.namprd10.prod.outlook.com (2603:10b6:a03:159::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:15 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 11/25] cpr: restart mode
Date: Wed,  7 Jul 2021 10:20:20 -0700
Message-Id: <1625678434-240960-12-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c69e947c-0156-4bbd-8c2f-08d9416c7653
X-MS-TrafficTypeDiagnostic: BYAPR10MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3285EAB03608DC57C9ED8CB4F91A9@BYAPR10MB3285.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RA2ttV0HhVuQgWazZf40O1mK/zgWFxiEUhirtmIqWYaEAw0sYEpkDSajE4LNKFOtJVZktpo6DmH39ZwmiNfw/t6eLSHa2FsyTf+aKJNTXSLMMmZIfbemzdXxe8iF+iDvHum04fuxA40KQYoU4RB5D7zRcN2z0eHABx39H6iS3By8Tp8tVM61qaszENHT/zdp92snvatIDLS0GQnUs4qlesouYf8qnza6JmbFrfzGkUDdZtKi7M/iGFsXcplK/se6SGz5U2VlFGveotMWa+2vVTUEQO8Aslduh6p3n3FGCJYAkCPu/O+Qucv/gMUVzg8ncYBL+BF8kXG+w/LSl0fWkWA970QABLHymT9g901FfKnNNbpMxkfuLevlq1AJ/PKseYkYxuy1gAONmahbj7u0Fe/jNqMU8++q5Z1IMXzjsHNxM1ZEr0j/37H0ghNzWrQhH0I2cCcENolzzSE90lEEtU+yOsa0/rFbAOBu+/s0DLnZdL4ji9CNViCe+QV5wx1JFv/LJ/KXVOZC7SGVWIjWUVKhyqqIyoSV+qxD5Hp8GRd0xA0ahVWNuT7dyIrlUMkqL51sQmi+kZmT9scCdVb4aNu30BfMwcEXC+qngt4/fVk/gA0541/YLhKDvQPLvwgKeQN+lL8QqtDTYTbgZD9sok3cEPbvPBLeHO3Ogwt8Yz2XVqsMWl1nCNWDR9LiSycpLI9apD1rWTiBQsuEbcwUmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(39860400002)(346002)(4326008)(8936002)(54906003)(7416002)(66946007)(38100700002)(38350700002)(107886003)(86362001)(7696005)(52116002)(66556008)(66476007)(2906002)(83380400001)(36756003)(6486002)(5660300002)(2616005)(316002)(26005)(8676002)(6916009)(186003)(956004)(6666004)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nduAvMUteXvaB1OdWIlUdNZtQq6v86ImJmWrBlw8HS6u0kaserE1NXX8rU89?=
 =?us-ascii?Q?JVBsMdc/Qn6lZHPYmB1rRBa2u/yyFORcHU3cEn/F3oA1qYluNaD+SSIgOrSo?=
 =?us-ascii?Q?Iwye+xy0XANJgEl6otgCxIQRhUJpT9ZWKThLzmcS8a+aU/LVi2xS1kpacL76?=
 =?us-ascii?Q?dZn8OheaNd9QKqkCqzAY2J8zY09AE8BU5VMDB6hfO1SSW2ai2sNhdmp+Ugx3?=
 =?us-ascii?Q?dHjAQQ85cAbKVnyZySy+Z/ZKLN+LP3238a/XvkNQ9NWsVNxo79sadoyXD4U9?=
 =?us-ascii?Q?zD8GT4HiLG9oTH2EypUgI9uUn+424guv0hDF6L8bddgMdwEf3cA5oRdEDSEK?=
 =?us-ascii?Q?ev/cOiL5lkKOEjr0pRsjFj8RIxphRBhM/zNiswDad3gkL/dBnQ/phHQVOfil?=
 =?us-ascii?Q?qMtEm6kc66XsZsi2FdlqXL1/42UlZVdWjaFQTulkH7aIXM6xq7YCzHCIqjpK?=
 =?us-ascii?Q?s3BYr8hey52DhAHUdIlVpIsSBjg9Cs545+CWXNv0ov62MLXXqf7A4KPUv0hE?=
 =?us-ascii?Q?DY1ADuTQmHpYxSL0SGZoBAWYi8ielrjjAXsx3DU95l2wjkERwdWNsyMOBmYW?=
 =?us-ascii?Q?BUMU8FShietxfUiV1i+5F9YI54yTVqKV7VS3H0jOvC43T7eu2EtZOTXFfxCT?=
 =?us-ascii?Q?im45EhDzpdw60nCJEft+DGjlb6GvLSoZnCljDlN1x8Ftp/AWh9SnrYcWyRW/?=
 =?us-ascii?Q?WntJt/ITHCt+g5Nv9gNxl53I3FP6SlBpsqlhW+GZUMXrPfDv5pVrvpG7qLF+?=
 =?us-ascii?Q?sNyT4ZhG5QsDjhZGrQaqYt5SAuqYl26GeFoutf2EDhlJ0P9lh5Ds0APZt9Xq?=
 =?us-ascii?Q?E2/dqXtI/BgvEgRFNAxUs0jXBy7ZQg9J9onIg9rOcv5kqQ3VIi+Qx9tzpRLz?=
 =?us-ascii?Q?AMtMnTFL2YZbsqAq60+gHJipJA4MElmah1UJDO9KCPTWR6uoawSxazcc68yH?=
 =?us-ascii?Q?GCPh0v3Ux4ITA2eXrKKSJkwIzTNDZuoDTiTkSkg6wnMY0Yjx8wOYFNS89WWp?=
 =?us-ascii?Q?h/ZroyAgnc3gLLPXy6q7TZftAfw7TYdJqzWBQN73mUi18JR3/0wM8ji77/+j?=
 =?us-ascii?Q?kVUJtg8xMG2GKMZIA9EAVcZYsVLPoqobFhTs1ZFk05sMzC11DskyhkvAKylk?=
 =?us-ascii?Q?RfIjtRg/DKLv/eG0tVkd+po0ycmBUyPDZppR2YyT9XDNnVUu3WSsLl4UEWyt?=
 =?us-ascii?Q?s97bdPAuKbdWHAUX0QWy+ryItJfgbbld4xfbS2/dzIosdqpPjQ8hWttPYT3G?=
 =?us-ascii?Q?ilxQ0ireYcuk+9HCUD7ha1lkmHylOr5WWKy9gexXIvdTYfpL0txnMrEpa5xz?=
 =?us-ascii?Q?ekX1SarUWORpPC9EdP1Kqu5Y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69e947c-0156-4bbd-8c2f-08d9416c7653
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:14.9314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7SUrD4XZzbIoz9ClupUclHrE/FDqYC11l8taAlyMslAu3LbdaT+6Bjg3Yn1XEAkB8o+yEoeFBwABRUVaNZwa17comBeYhRdopYgqQuXahY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3285
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: JYhqKQMNpAT90_TRT5ssaHIhmEwS7pI1
X-Proofpoint-GUID: JYhqKQMNpAT90_TRT5ssaHIhmEwS7pI1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
index b149250..8a65ef7 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -65,6 +65,7 @@
 #include "qemu/pmem.h"
 
 #include "qemu/memfd.h"
+#include "qemu/env.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1986,7 +1987,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
         } else {
             name = memory_region_name(new_block->mr);
             if (ms->memfd_alloc) {
-                int mfd = -1;          /* placeholder until next patch */
+                int mfd = getenv_fd(name);
                 mr->align = QEMU_VMALLOC_ALIGN;
                 if (mfd < 0) {
                     mfd = qemu_memfd_create(name, maxlen + mr->align,
@@ -1994,7 +1995,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                     if (mfd < 0) {
                         return;
                     }
+                    setenv_fd(name, mfd);
                 }
+                qemu_clr_cloexec(mfd);
                 new_block->flags |= RAM_SHARED;
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
@@ -2246,6 +2249,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    unsetenv_fd(memory_region_name(block->mr));
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
-- 
1.8.3.1



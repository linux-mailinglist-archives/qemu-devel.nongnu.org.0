Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3742864A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:39:02 +0200 (CEST)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo1c-0004EH-PH
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnux-00038R-3a
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:32:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuu-0006D5-OH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:32:06 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iPF5017564; 
 Mon, 11 Oct 2021 05:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ye7guYAEycWg4wKe+IBlDrF8UoW9GTKcA9AkckuCqpE=;
 b=q/slPyjpv82fUXVFIvIhIcDdXkJS+EYSQpBWLio4+aBSvPjICC5UKxXFTeJZ2F+hg8cP
 OACBRhBKzKRR5IsyAuUa2Lnwu7vkOs6aubi+xjOuVYCLGv/SXq/2AC0d4lpSYNUv2sGG
 rDvdi1GsV67YAjnIk5rc1S7V5o4PWloasWvONaERryREpivJlIOOdHWPCZNDpnMz6Q7P
 ZfY02F3ESZRF6dRTWnuYgBy7TkCMTbHTnN7lW9pUBM9Y81AmI6yD6jRgfygp2o/Rps9Q
 21XgZlrj7d7Vu80n6IUOjH4Ghfk9vWNVE1dRPcskFMIDqlyilfRaq1fR1kPDpUsneyQT Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkvh9t2ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:32:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5UIqo084641;
 Mon, 11 Oct 2021 05:31:59 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by aserp3030.oracle.com with ESMTP id 3bkyxpc9gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkQ4gTJV4ldyFB1TbT6K+iO5FnCwUsOW43nyQHoWes9K8s3iFoT+mN8U+Sq1BMTNQlHl3TtGcCpcAXcjtWJ7LqFttAxSUgfPnA8hLMlZKKs4Cid8Rl/GghUQjdkGVjgQ9xXTZthBmz5xtIsQwdzg6C8DjDD67sf4vVyBkmBRy8RnfYrS9OfwhmIkXGVV2iGCn7I0E2108JuE/flLL93H7AfP//wMdq28xLerpuYirGt6jaIxZAQVp0jlZYvr/XH9sZ4Vm2h+KEHQiCBv/Pho8KmQGSABqR5e+uTAWFLBr0aLLt/kA1NkVd2dYiFJ+VwCGD+8WFnCJISW5urgEHTwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye7guYAEycWg4wKe+IBlDrF8UoW9GTKcA9AkckuCqpE=;
 b=BMFLltggl5n+/TrHgUW4kjbj0vaz6+yK//OpOZNfJej3quKH/npQ+I0OKs4mPMS1xeCRr1Kz8Q39kbC8tqUmQfJB6FIAohAWNShw6pqUwpRRqZ3+f/NrQtgmC2amTsXJlndXeHSSUsCDhYjlYezStVBs2TuU/IHiJo6M/h0P9BRLsVmdQGIdU4sDQtWUR3jwtq2WmyKKJcothrcvLBtSobkExwy5IjirDzfNgwq2ODPR6F/bqofZ+OxPiCMfeimDlAWOOlOxsEBWpeJirtUSL4dRl/ExmPP6XCtjrGYnYN2caSYozCchfuSRsZElBsjbZQboyiaRvf4NFRiUXR8oaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye7guYAEycWg4wKe+IBlDrF8UoW9GTKcA9AkckuCqpE=;
 b=WRTsXyWn7NTT7XCkG28+PzY0+KarZzahHfh81EXYB4KDK4POetJz4cRMYso18MBt0sFBy88J1oG+JyCS0D1Y9CwErisw7B7Qf6yweicjSEsiIVPC4z5nq185ZYavw0/uw3GL3UkMHcTa6KtyGcgJLi4chPq8lQeCSwXRCe47PYk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3775.namprd10.prod.outlook.com (2603:10b6:208:186::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:31:57 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:57 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/12] vfio-user: acceptance test
Date: Mon, 11 Oct 2021 01:31:17 -0400
Message-Id: <b5d78f1452a85057c257e1f9efca527d05ff0388.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00ab8499-9f7b-41b9-c6d9-08d98c78716c
X-MS-TrafficTypeDiagnostic: MN2PR10MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB37753A0534E8EC547CF20D1C90B59@MN2PR10MB3775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rMfIiKzz2mBlc1ozFFbKsDHkbdatbPRVsvfV84WegQxxx61IbekgN3PNxWKMPnW1ZEBKWQ559JOJvP1oCHiTi5W1X/y2uax43ZHCGmApHYrTY+/or8tN08LnueaTZkHEY/B2CItUQNtSFeHsLitH3llLVHZkxm3J79Zz65VfZ8uYTdd3IfueQB5z4CI3VA7bUWS9TIE4e2SjPLSisQWvoiPYQ0cwUqYHBncGYHpSuxWJ2jkerUYR5xxiw4XpwqBYOTY9uRMQ+wgcVXJvLq/Ldj34ATDgzvKckGtixQPkpLo/Ob6p2FnSkgnW6C44yfvl6QUvj5G1fcOMGKjKRpFbx25jF3TQzo1YFq/IClWcpYnzmgsNNsi2k8ReEL6ZLgScgqAMjhUKxZxALznWs+9T+zj8+W6zUzyYjg2ekg5AVmWt5xNPgf4Tv9uN5G8iwgkyDhc3Ewi0q0X4QAbGKj3cFfl9aoaGS3uDs36oGh7FXd2Vdn/Zzfa+ZW35LOZ8T0l/FRnTxLQNfMY1UpZlEHh3iQbICLzzObiQt11Z3Vk+XaOimXJAjD8eTb+djEZWwTqmojZNHpbKjBcIKr4dI3/JprKSSP/tNZBPiKTF0Vhfs2tNA4Fq6EmV7uklJjr0qDQubwxO9kSFf1KxOFzkiykt+92Vcgj/if6yqdElVWkhjWIdCB+0N+ayF9zqwWIIzNzUD+Bc9/P1ggGLtkjtYTbpAFiGIg6uVtQszECKPGxo6QFMWABRwcspU3lhwgQO18idB3uRIh1nH30C0vPvX7nh6NnH1+j9CpB4VKyYOT6IWug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(8676002)(36756003)(66476007)(956004)(66946007)(6486002)(7416002)(4326008)(2616005)(508600001)(6666004)(5660300002)(8936002)(7696005)(52116002)(6916009)(2906002)(107886003)(186003)(26005)(38100700002)(38350700002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DDVgf37nLulQKp3n4pd5Yy6Wy9zZ9vVGBiWiXh7deJ1zAR2wFWZk6Xjw8q+P?=
 =?us-ascii?Q?PDHmQQZG1CBF4cbJBMzNp4t47zqEvYlAGIYx0WcYZXn2GPOgp07MJ2RuPjue?=
 =?us-ascii?Q?G8zoqkg+jKyS/iUpZN+1zUiOqM4iSQyiGu2GuUS2GNt/j8bV0rBve4MfTvdo?=
 =?us-ascii?Q?M4MXqv/QiGstTYU3/vptKHDGy90XOBHNy2vLpO63OjeHfhcE8zFeRQD2l63y?=
 =?us-ascii?Q?dtEugkKg5+F5u8rbUMgl0ubuXednhKgHOgRn6CHynzyZHo1Kv1O9OJUj5/Jx?=
 =?us-ascii?Q?2MvAEZYgr3GQfn9f6belRqk8ndTEDeuY824WYRjKaTi1HJ1yK+noXlvx+hGr?=
 =?us-ascii?Q?6nXkGmPvxkBsOMZkNoHHv04R62Du4BmnEGzZJvI9uz5PPl8kVGT/alt4xLHU?=
 =?us-ascii?Q?XxnJE7JSwNlvZMgdd4hVHAWdm1+JcRlJrbP7ndOONL8aBiBbKVQllReZizTb?=
 =?us-ascii?Q?wzSFoDG1t+TsFaJys5K3LvKBtv2Y7vE1Whl5yqSfnWfIAYNoVuMug8Hn2N3t?=
 =?us-ascii?Q?KsOiDYhJehBQw6PZNzAU0Ra3KLJ7y2Hd82RBbXIek0VsqrlUttrdoL5K7z5D?=
 =?us-ascii?Q?i/t82sK5j4dJPJmMS28pv8KU4OIGYIx8lmV5qrenuD2EqONJgQcdaDgYHP9S?=
 =?us-ascii?Q?wSkm6W8i9+n/sDs1FMkXnDJJQXB3B7YdG5OTF9fwfqXO/aBpRxg/xLebaWAn?=
 =?us-ascii?Q?VhXUKY1Gqv4vkGJftEFTME7OwME19gVfbyReQmqv56oESj4bLy5tOj9rIvWx?=
 =?us-ascii?Q?v4l20rmGQUQH4lufKq95eeCUdU+0d+ClbrwY/pH+/77hgvqYIRojooFvbSUy?=
 =?us-ascii?Q?u0Q2qHYQxeLkbhszNGMg8M13vcxVatSznM5ywPe2U4yIMLuWRJUMrc7RHXun?=
 =?us-ascii?Q?SHsLp5YW7y7cUIu07Zojk3EPZTZe6g59KIKr2GczdNmfbNGdoyYj5vGYeMKb?=
 =?us-ascii?Q?8PNGfUU4v0xu6fiMxofX4NtR5t+Zm/rH14+Ey/3DIGD9dCyBx0uWIUSHYAF+?=
 =?us-ascii?Q?dXkprUY8H4v5V8L+VXOF1IB7SU+zyZ2quqWGsYWR63bxkTTvQJb+fJABZbCV?=
 =?us-ascii?Q?WcrsGevuWLro8uQORb96FuTdyVtZiq6gwCHfVc2biSY5VCi7fAwy0sghFV/m?=
 =?us-ascii?Q?gKrJTude3M6o9j2RatPbZttZ/D0lpunoV+yA5snzECONZrFqmzdErzYQirrq?=
 =?us-ascii?Q?4Kox1gCTI5eY+GO06Ij2J4qNbGQnQq1JDwtfFX85GrJbBtJp5KPgX5VxTymv?=
 =?us-ascii?Q?gfhaAHa5XUm4YqRn1F6540sfZWrlvHx9VTINhE6ECe5feWhLWe7Np1nT1K+U?=
 =?us-ascii?Q?5vvU0jhBpl9PnYjLQqH+F9hG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ab8499-9f7b-41b9-c6d9-08d98c78716c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:57.8792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xn34Tz8xz+g0yAsC7vxkaA+S+JS7Qu2Bz6/99s5cSw+3c6K1snhM85fR9jLFR9ygC/efvZZNEPCR5I5YunXt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: e7rHSVruE2rxV5CaGEEahgzNtCg_LCdk
X-Proofpoint-GUID: e7rHSVruE2rxV5CaGEEahgzNtCg_LCdk
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acceptance test for libvfio-user in QEMU

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                   |  1 +
 tests/acceptance/vfio-user.py | 96 +++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/acceptance/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 79ff8331dc..a98d37423b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3422,6 +3422,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: tests/acceptance/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/acceptance/vfio-user.py b/tests/acceptance/vfio-user.py
new file mode 100644
index 0000000000..5eb5cabc68
--- /dev/null
+++ b/tests/acceptance/vfio-user.py
@@ -0,0 +1,96 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class VfioUser(Test):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def do_test(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        """Main test method"""
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+
+        # Create remote process
+        remote_vm = self.get_vm()
+        remote_vm.add_args('-machine', 'x-remote')
+        remote_vm.add_args('-nodefaults')
+        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        remote_vm.add_args('-object', 'vfio-user,id=vfioobj1,'
+                           'devid=lsi1,socket='+socket)
+        remote_vm.launch()
+
+        # Create proxy process
+        self.vm.set_console()
+        self.vm.add_args('-machine', machine_type)
+        self.vm.add_args('-accel', 'kvm')
+        self.vm.add_args('-cpu', 'host')
+        self.vm.add_args('-object',
+                         'memory-backend-memfd,id=sysmem-file,size=2G')
+        self.vm.add_args('--numa', 'node,memdev=sysmem-file')
+        self.vm.add_args('-m', '2048')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line)
+        self.vm.add_args('-device',
+                         'vfio-user-pci,'
+                         'socket='+socket)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing')
+        exec_command(self, 'mount -t sysfs sysfs /sys')
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0012')
+
+    def test_multiprocess_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
+
+    def test_multiprocess_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
-- 
2.20.1



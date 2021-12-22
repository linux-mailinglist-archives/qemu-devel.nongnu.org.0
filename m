Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F147D818
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:02:27 +0100 (CET)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07og-00025n-DZ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VO-00052I-KK
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:30 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VM-0008OS-Ur
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:30 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsgq013630; 
 Wed, 22 Dec 2021 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DNZ2CYcJ/oLlAXGF1oUF2K6d66Kqq+cbuPN82Q2Y1Tg=;
 b=b3948ar7TLyGfACLDPA9eGLCtNa8hZc7eaSXWEdjHL2V+aLI2xXg20UyC5TFpC2BWoSW
 ylElvqBpbCXEhVKZV/tR7noQNcHMCH5IQQ0kbH53gRxLZEoU4XObSSw1oOQYkacY17aY
 YtMArPvf+EGNiYYzVqRXvkxutIMZLvppQKUB55FbaSczqFLXp6NaqxQ0wCfSiBAO20vM
 1HJkvXXZKw5r03oL+oCF88HMk5OOpFaktmu/BbqVVgqHYEdL1SqZUZj+73EO9BFtZG7D
 ywzSPCClJZkR2UWZe3e06gVXAh6eI7efn5o3KcCItiV7nfmQ1Tfdb6tfSNpEtp5e5BYr Qg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqS030437;
 Wed, 22 Dec 2021 19:42:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae31T1AZxxbs//pPYHCrfB98egzGHpDvXEhAHN5/Y7H7q55W60YRmF1vDfVKRJuh2w4rFFTw7Ed+x/aeX4ZbbD+baU5zb1ww4Zo/2NLqN0pM+ACDlKdYDSYJq7NeHk+c4XyW2D2xoyluLebhWO13Do/bM2262gssSo5HKJRaDXmJqJbeMJW4nDR9yTH3OVBo+8dG7smxnL65hvFVmyPW9t7C4GpaV/0b38JpdfvjF5qhJU9QnDCU/5OrHPL87zDjeUVMLHte1ywdI1o004bPWK3jl+IsyOyo3eKrNgFOUMwnmLjTvoSDGLbSPSSEMihVF185YOxjDL76T9vLj79JGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNZ2CYcJ/oLlAXGF1oUF2K6d66Kqq+cbuPN82Q2Y1Tg=;
 b=V4hbXX8IoUjZ2iGE+zQUku+h1IpSfxvMTjabmu4JvVT+UguDCQLgKp+mG/N3MVD51ggFnag5VnZkVgz6fYGe1KjP8OIVdnJgPt7MB5tprkW31jCUA9eIIO6X5PvlpNMnMlLmsknoX+12i7bdVzjYIhy4IVkX8/u9TY9NlZVBtT86iBcdd15OW3Y2iPZ7v+I36QzmfiJsjhCou+IXVL8plv7M0/5zODjjlwuoxMUo9TMcOXyHChKxywYz/biyxgS1kBgbNg/rFjvcqg8T4Z9DmPPeNSoV4O3B0QpbSFuebS+sQqfXepN6i84W9nv8MIj56Cqk11OWe2G94Fx4UvnW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNZ2CYcJ/oLlAXGF1oUF2K6d66Kqq+cbuPN82Q2Y1Tg=;
 b=huvOY7T4a0c3Ngq+pFLcYA/MGe3+zFaVACgzc+NLGlT5yQ5L6sipwELRHkZgoKzZ51IIdUCQpt2rjJ4aXpTcB5S5i2UXom3SgsN2yem4zBy7p/CCktJT2AjM+trSdGrogACMVcPvJXLxzxGLBWG/YIyl98EhUtCrgUKjy4bRLd4=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:08 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:08 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 27/29] chardev: cpr for pty
Date: Wed, 22 Dec 2021 11:05:32 -0800
Message-Id: <1640199934-455149-28-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beceb82d-3f7b-461c-fa1e-08d9c58323bc
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB42424DE25DA917404ACC8CB5F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5h5jQQ0hrHP37Fgfh7vSoxQpU7q6nAvp2HeyV8vc00wkCZP7w0Kn9DkVNa+OGOFWRsD4ZMXbuoubthJz+51GYYgB4yJ3Zv9NGlL62KXMAxPA4Rn+SPxF+YoDqipVxkJS/ixlT2zUEMha5R6i+c6jnVxVgTcXnBTfDR2ZF/wGy7q9weBYLaEoi5sGyjHirHET7U3iMDuF3/EPFmf1DXMcsXdaalLFeox6HyNRiM9hW+GP/6YiZLAET4siPHtj3hhY5qLJ3fXtGMA5aeeCt4viQLSQPnjoG8Nbo5TCauPQ9XaP4C0/kV8WfiQLisbr5sJZ7rysYoO7/Zp+/W+Yr0Cy1gqShcHtW5pSstXhEjnA+eAX5R22yg+vn5f7OeeRflcPLvIk0yHfn4rE+f6azmJhfSZEB9n9w4y6+KlMM6E2V41n2GccMm0QLNVR4bz7eKt6U6XfGtVMj9RPnASCtm0NRhhJ6OTTwyGsY1ghzZPdayzLISx3tJNSy/owx7c/cHC122cVnxHIWtvU0sT5ilH4EpuvjLbuHnYVnfifu6N64ktwjZDoBApuQm5dy5DrIU0BeSb2sYZwrTJcbyiEE7wOm9wNm0F0gFGcPDKH1Kqph+wIdQTyof8ed8IbPDDa5f34fgyj+h4rkI2s1cjomNXCr5JPddIf0MO7Sv3XIaocWvChcjiF2dcRONTfgQOcLywB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ImRZfdmw2l1ZUuNzufh3eCtOmWjfObGKnK5vxcgwKE6gUVSlcmGxs+wIa5Qf?=
 =?us-ascii?Q?gQrFE1CsR+U18coy0xsA/orPQvK9XF4IqeFyp7H/F8w3awNsZVvNqHKP2NSh?=
 =?us-ascii?Q?ZtlAYoQBHrveJELofuvwLVhHh/lEcmHXT7Qg953FTg8NL6F1W7hRr1+G0g2r?=
 =?us-ascii?Q?uW9oYtXK/n6hNC4Bw4PZhZ9BC+/1g8BYYyAMYr0tTzakgJMbGIrxMlnRidsL?=
 =?us-ascii?Q?BJnZN6ndDL/UlPT9yhqGGmO/VFf6ClNQ82Mo8OSFXSYA/S89hJwyHYKTfjj5?=
 =?us-ascii?Q?ePycfu4GctumgXv1MvRNiE/UKxMl2eNHwge55IHznUHbOOmsJgrq/Njq4zBm?=
 =?us-ascii?Q?cg3eb11NueOF18/lzho0L7vRZmC3EjO+oxRW0bzA5rTfh84SW8yHtfGmaY8O?=
 =?us-ascii?Q?YMmb+LKSZc72l3YTAMo/Kye8MlclRxy9aeoCLnqGCDGklNa1MzycSisqnd+Q?=
 =?us-ascii?Q?MrylysaNDZ9diF123hOCRtF2pIUE0lgj0Tow9c492CFl946LBwe+pGG/XXxp?=
 =?us-ascii?Q?SQ11350vYNUL0AViP8gFcJuZAEqp02NyGyYy/sgnzAEuYMCMF80/xjJF/HPs?=
 =?us-ascii?Q?JjvJmb8Y2VBV/zKmLNWqC0ZFzl/UzGol43WOyKNjefw+wnv1f2QK5E0smmwQ?=
 =?us-ascii?Q?iHqvZil6SvtvO9FH3z3TTHqR7xKLHNL4U3hUIqG2XbJo1HpdvSMkIMibDXdf?=
 =?us-ascii?Q?V/tLs/wX6NMw3Rc+OdV1trXwMaMw5bDHQg2yRiDMorV4HqofhtawP5O/Yfb7?=
 =?us-ascii?Q?uB0cjKWgl1DZRxW/ssDIeAFbl/VJVx/MtZYaZ6eCIMl17TCUg7C+Dst+nSMJ?=
 =?us-ascii?Q?/cCKWaoH0O4DveApZ4/BcWiop/Im08rUBFMTU3Wrsxu0VscLV/2cR2KxnKPw?=
 =?us-ascii?Q?ukN9P2G8SNQfO0t3DFSY+M5pxqGaL1F0cjtWbIqtjZJ0QrQlHhAKRQtRqpFo?=
 =?us-ascii?Q?rcLCAXxaEbF8i3bH1AnHv3eQRfgOX2rUKN58hELmVyFkJTyah9gmaYFKf95U?=
 =?us-ascii?Q?Vw2NuLEtSrw52A0q+YkzsCZOVMROqNu99RKCFi8E25pxpb5rl490lhUESeSr?=
 =?us-ascii?Q?kli8Vi2Z1OHwhrjcarB+RlA46euMe6Z8OQIhLGdZGNbl//HSJgecir6sGdKL?=
 =?us-ascii?Q?b9YrQPD414K9RHAng7dmDKbDFxeJ6eF0MEP/b8r24Uwt+v/vVkM9AFzFwO+H?=
 =?us-ascii?Q?22noQhiWxxQRPuhThSGv5jvWh9M+PqvXeASEZgPd8x0wwjdbhiNPk6SVYgtg?=
 =?us-ascii?Q?gDCjY51VhBq1I4aOItOQKt+alTVqBckTiYsQ/pBbefXy8wsHSEyrg/HevdHb?=
 =?us-ascii?Q?NfsOyIsWYcsQ4Re+mw/BST/PaQWsjqXhWZqYuyHVrZy7A9Ip4qYxAaZsGXw+?=
 =?us-ascii?Q?A9s5RoY3HTGevUVjfBwjQMgjMg+FnwYm+SiURx7FesIRIfwCyKPUX9xbTrRi?=
 =?us-ascii?Q?pWsRH+t4OO+sE6RKcXqzObCKt1VexclH678CqLYwZxXdrr0Qzr1qmmVVubO+?=
 =?us-ascii?Q?oRqxFS/XCMlNK0/LKsQWs6duEs8E/C5Svg1dba3s23v/W+X79xiIdiU0/C8e?=
 =?us-ascii?Q?dSpTwrD4GgKieHj43dEXnlnapLjtYtxqbfBgWHWSB4ZlD1uNR6u250VmrYJA?=
 =?us-ascii?Q?eT70zT2/P8K8fm3BBZg2zqf4dJsPy/Rd8CHhH8oOuLB8TRt3Sst4hSlm0lg1?=
 =?us-ascii?Q?+QjX+A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beceb82d-3f7b-461c-fa1e-08d9c58323bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:08.2173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nM3PyXMa1i32hOOWccstfV04uDg36s6pHC+DYpO8a8miTa5o7sKop/05GufzLhbPAFM6+SK1FiO/4OKGnj0w79gfsvCkkPEVbKQMUSJOCZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: HYinMoPv8GpNDpqXNni-WTyC7ZUYO0wx
X-Proofpoint-ORIG-GUID: HYinMoPv8GpNDpqXNni-WTyC7ZUYO0wx
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

Save and restore pty descriptors across cpr-save and cpr-load.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-pty.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c..9801a4f 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -30,6 +30,7 @@
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "migration/cpr.h"
 #include "qemu/qemu-print.h"
 
 #include "chardev/char-io.h"
@@ -191,6 +192,9 @@ static void char_pty_finalize(Object *obj)
     Chardev *chr = CHARDEV(obj);
     PtyChardev *s = PTY_CHARDEV(obj);
 
+    if (!chr->reopen_on_cpr) {
+        cpr_delete_fd(chr->label, 0);
+    }
     pty_chr_state(chr, 0);
     object_unref(OBJECT(s->ioc));
     pty_chr_timer_cancel(s);
@@ -207,12 +211,20 @@ static void char_pty_open(Chardev *chr,
     char pty_name[PATH_MAX];
     char *name;
 
+    master_fd = cpr_find_fd(chr->label, 0);
+    if (master_fd >= 0) {
+        chr->filename = g_strdup_printf("pty:unknown");
+        goto have_fd;
+    }
+
     master_fd = qemu_openpty_raw(&slave_fd, pty_name);
     if (master_fd < 0) {
         error_setg_errno(errp, errno, "Failed to create PTY");
         return;
     }
-
+    if (!chr->reopen_on_cpr) {
+        cpr_save_fd(chr->label, 0, master_fd);
+    }
     close(slave_fd);
     qemu_set_nonblock(master_fd);
 
@@ -220,6 +232,8 @@ static void char_pty_open(Chardev *chr,
     qemu_printf("char device redirected to %s (label %s)\n",
                 pty_name, chr->label);
 
+have_fd:
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     s = PTY_CHARDEV(chr);
     s->ioc = QIO_CHANNEL(qio_channel_file_new_fd(master_fd));
     name = g_strdup_printf("chardev-pty-%s", chr->label);
-- 
1.8.3.1



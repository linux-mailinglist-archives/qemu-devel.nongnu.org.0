Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A03B015C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:28:14 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvddd-0003ZQ-Qg
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUW-0004EC-LV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:48 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUS-0006jC-QC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V7tuu5kAoc8tQY5loMSBhD6mwoejlgHHp7H5qRinYi4=;
 b=FIV9BI/qcZfCZPnnaKDI3d0lOg16ugLGwKKWG2rVLw1UkKV9ml5rPoT956T1QCoXRPhDLr
 nV3u4gWoYnVr8X44AwJD8q3Yfwb1gEzV3WTyei2Fk7AxziGZJuHdMBbBZX53cUMc+y0Oso
 dAi2WzdpEgk3Qx7MHfi/jAf0+a5LAnw=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-7yFo5eb9PqyRMi9tSDlkxw-1; Tue, 22 Jun 2021 12:18:42 +0200
X-MC-Unique: 7yFo5eb9PqyRMi9tSDlkxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPKLRt8CQbBnJUuEbGiLY1mG8vb31frcHmc95F3qbn972PvBbn6JFKjg8zkJcVaX0/RAKOyrTIjvQJNjBic1s7k7/en14kmFNgcRInJYZLCGxnOLrtvm0RtmWUh6wptGd5iRg83+V2Vir7qSHuihqxi8diqZpYNNAc1z3HubyFCgu+y73XL3xU+J60zBv/A+KFlK9CyKboAhaYMzoNakcj0jPtFEgzXwlhbMKn5ol1ct+SH1TJZNJaHPrnEOFLR8Sy3HuzBCfxfFq8uk3FW5uO/QGtgk8pFqbLonAjPySTC6M15kN38TpVizqet+RQAEC1BcjUIXXMpB10CxpW5Jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g/2DaC7II9jKXkPOvZkEoFlOepOgCbUgTiNd27Re/Y=;
 b=BdR4qctv45peFPgGXRazlBuZc+L+vF9riRTgFRcyxA5QLy089/OKCt4npwONzjE8Jw2gwpSJ0VaY8m+C7ykzKEu3kZMw2k0MolaR7ajnCngxWxAY5MoGElbMkMHdxpohPCjCdE8o1ZKNB9qNfSDFm9chGWbMthnThK1dBtbgao6JWMFaJAh1zPjVP50m4iqOzWn+YCLTqRGeoowzbJeZIG+Fc5w6rDcsz1Eqidpc84ICDZI+YnXwN96OzrDklQdl7f85LWB3oPlOqhBVaJymyXq51YDhlrtLFbqeMJKSed1VDu6ArkuCUzahRWc5u7dZ9CGGbQFMdMb/rQZvfvsYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:18:41 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:18:41 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 08/13] target/s390x: split cpu-dump from helper.c
Date: Tue, 22 Jun 2021 18:17:21 +0800
Message-ID: <20210622101726.20860-9-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR02CA0193.apcprd02.prod.outlook.com
 (2603:1096:201:21::29) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR02CA0193.apcprd02.prod.outlook.com (2603:1096:201:21::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 10:18:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4263553f-c399-4e11-ee51-08d935671b67
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57274FE563AEE5EF762B6854A0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jY3nrVIzHhl1lrtFxZT/qdHwYCbfXFHNp5Leb+prEx1HiVHSdiWl+JW6OEDOfP+tpbOI59ugxP0HC8AgJw7rFl0jDvu4Y21g4oWVx3xzau0t4HAWl7xIOvtAOlwYAPC5a+HHrpD91boRYv/9X9QvHwbBgDuu6YdPMaKVpW94Q5lMHSi7SJPdc66gSXHm9vRG+m9C3pQ95U3fXLMd7RE1tF6NougRWygbaer9blwYl5WAacAelJGYRX2olHalJb4mF1A/Bz1oZS4q+1+VT33Fx2f+xouUlkibhIBP6F8of47kOP56syOAYeOGAj2pA+kMO/XmQXLNVuGJpaVf61cT+bTpCPfq35EoAEL4QOnkpHJRtYIBeR8W3fFNYgZ8NIa9u1IcLln0hyrWLuoFPazo1dGeP49Ss3n/IpFKZ1duxIgyeEcfKGKIzetcf7qIPnBKXR3w6MbabgrvD/wSjnu4V31I0pmDeej3uDn9TdlOi1S2tfJsTEOg3UxQXLeRbP0Ux2zBHR3oP16dej6AZ+i8XsJZGLPuJ2Hrzb1BhPCMVoYqjv4M64lE9rCq17c1iN0jgRy97+QkeT7qe2/l14lrlpPe+oydXWkQZFKh33Qv0Xp4d3Nd6rGW6PWzjO58h+7nrtgDfuiYs03Kyh2YzkAzQ9kyr7oXE1v1+Zx6d/LaM7OS7yem0NULh/ZoMHdj3TEgeNeyCQGGdLx62TCCKC6+NvWmBKFEX88+3uG7GTU0JZBH8TdcUX89cMSD+963pz9qCtBPjrQrte3H+DTfHIM7VOr7jGtzqKrhTh+6VZkcFUpU/4CTSsN4cnUXnP+Ym8sdTBkVP3o1kSA7MwKkWXEoNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(54906003)(316002)(478600001)(66476007)(6496006)(8676002)(36456004)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Nuy5SaL9opHWlFpnjKCcQo76a6aRNZtjUWYwufjuB+js6LDengNrdGRT+xs?=
 =?us-ascii?Q?StdjVQEllYHSkFw+hRS5QffFdZYJKwvj6i8kEY/nPaBuU55SUBvIuz/v8Erd?=
 =?us-ascii?Q?Hn5OkgqFmMpMuRJB9VHtKCxa5AroonLar81yYeCu5geiQCIOE3mMNrlRH3zc?=
 =?us-ascii?Q?kVzteVFyjCDz2JKCptXlpR8o7u/hTdwM/qDjRw7m57arreGmDEaZnfmrJtXN?=
 =?us-ascii?Q?KHSSmu9Fpr/8TE0pmMs5avVfN5ju72Q9Xws+5+eu7bYXnpL9Iv7tgczNBVcL?=
 =?us-ascii?Q?A95vosq7oOHLDtENSVltbkUGgRvt6mzKZscGP/GStmpaF3LtUdpnTif1ipL4?=
 =?us-ascii?Q?F5sQzom/0JcZXInbVo+BeATz3ggjQM4YsTITDYQU1flJzOsiVy1fbW+v9+YW?=
 =?us-ascii?Q?kdgoW3Cxmv0ev0C1DkkiWX9kPfjflNdqQEnJR2TFXf7u23uRqyQU4YcZBwPA?=
 =?us-ascii?Q?0aBUV2QZjgjwJ/ibP/cYbTuZ5bcXS1UzHDMFJ5DylsAuxVjfc6Q8jMltGmk+?=
 =?us-ascii?Q?9tOe8HQgJBT9t9tfywmVS3/y0VZIvMSWIfXF9mHuoPVV38cpykBFnV9yJul4?=
 =?us-ascii?Q?+j129A/2LOSlON0oItbP9LpuyBkZj++2ci74xc9WWod4vtBdRbWZkBYxXelI?=
 =?us-ascii?Q?C4mx+fQMJ5nUTxFwfme4gJq+Yc12Ng0zn1qvAYyu6q5y7BKDFtX/3WjPxRg2?=
 =?us-ascii?Q?EtmWbJ2abSgYyeLlWWxNr2iOx3DAWErUfaCutzk9xakdgGtz6MQfINFbMy1N?=
 =?us-ascii?Q?exdphNnHmESAQ3j3cmljK5vM13vRKvG0YsKAXigNTzV+0brA+zFQmIDwDr7n?=
 =?us-ascii?Q?9AE8EKHGetQ4Q2mK3pZm6gfdT+5tRxxPvb1UYPuKz4s2YAZZYeq8O238VKmF?=
 =?us-ascii?Q?josTrhY5lFQ0eYK68QI60FvFw2gMTZ1dIoCGy5KifpIe+7PZP2XJELZxtyHr?=
 =?us-ascii?Q?EDQ+R+R5x8SNedLtVE1yFflBM5mcMjQqB9IWHgxlClVFewIeFmR1OnthqDc5?=
 =?us-ascii?Q?o6p0wB0lhI6Kpkt1ECvAU2CacWPThSH+L67ZOIg5NE37uC9cIxBuaifk/ghV?=
 =?us-ascii?Q?hLWEzy8JScw1mT5sOlT7hYG8xlhIXIZ4QX/QjwK9E5riMOTVXEfqMJq67Nx4?=
 =?us-ascii?Q?Vh0YuVmI3co+LqOYohO1joRDSN8yAUmJIbKqlzZq5Z36Tq8DQ11nVsVhUvrb?=
 =?us-ascii?Q?z2Fc4QHluOE3GTzQXGU4N3so8/2f4bwa3O6ncQjWCssl4Ch2StEf/9QVTmQ7?=
 =?us-ascii?Q?QZ9RuZLqSJmgP7gaCzAfIP45PVjbC74SLIZsumcJ2aKpgp3pHI7Igcu8hAeN?=
 =?us-ascii?Q?q9DOcRZlXqkvoOQEr1M62trT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4263553f-c399-4e11-ee51-08d935671b67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:18:41.0393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEmp9zQm3Ao3a7YPRUsaZ2ahS+RdOZhDfKJ8+aC43mtM4y0Adcim1z0jnYWbeUiX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Splitting this functionality also allows us to make helper.c sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu-dump.c  | 131 +++++++++++++++++++++++++++++++++++++++
 target/s390x/helper.c    | 107 --------------------------------
 target/s390x/meson.build |   1 +
 3 files changed, 132 insertions(+), 107 deletions(-)
 create mode 100644 target/s390x/cpu-dump.c

diff --git a/target/s390x/cpu-dump.c b/target/s390x/cpu-dump.c
new file mode 100644
index 0000000000..4170dec01a
--- /dev/null
+++ b/target/s390x/cpu-dump.c
@@ -0,0 +1,131 @@
+/*
+ * S/390 CPU dump to FILE
+ *
+ *  Copyright (c) 2009 Ulrich Hecht
+ *  Copyright (c) 2011 Alexander Graf
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licens=
es/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "qemu/qemu-print.h"
+
+void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    S390CPU *cpu =3D S390_CPU(cs);
+    CPUS390XState *env =3D &cpu->env;
+    int i;
+
+    if (env->cc_op > 3) {
+        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%15s\n",
+                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
+    } else {
+        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%02x\n",
+                     env->psw.mask, env->psw.addr, env->cc_op);
+    }
+
+    for (i =3D 0; i < 16; i++) {
+        qemu_fprintf(f, "R%02d=3D%016" PRIx64, i, env->regs[i]);
+        if ((i % 4) =3D=3D 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+
+    if (flags & CPU_DUMP_FPU) {
+        if (s390_has_feat(S390_FEAT_VECTOR)) {
+            for (i =3D 0; i < 32; i++) {
+                qemu_fprintf(f, "V%02d=3D%016" PRIx64 "%016" PRIx64 "%c",
+                             i, env->vregs[i][0], env->vregs[i][1],
+                             i % 2 ? '\n' : ' ');
+            }
+        } else {
+            for (i =3D 0; i < 16; i++) {
+                qemu_fprintf(f, "F%02d=3D%016" PRIx64 "%c",
+                             i, *get_freg(env, i),
+                             (i % 4) =3D=3D 3 ? '\n' : ' ');
+            }
+        }
+    }
+
+#ifndef CONFIG_USER_ONLY
+    for (i =3D 0; i < 16; i++) {
+        qemu_fprintf(f, "C%02d=3D%016" PRIx64, i, env->cregs[i]);
+        if ((i % 4) =3D=3D 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+#endif
+
+#ifdef DEBUG_INLINE_BRANCHES
+    for (i =3D 0; i < CC_OP_MAX; i++) {
+        qemu_fprintf(f, "  %15s =3D %10ld\t%10ld\n", cc_name(i),
+                     inline_branch_miss[i], inline_branch_hit[i]);
+    }
+#endif
+
+    qemu_fprintf(f, "\n");
+}
+
+const char *cc_name(enum cc_op cc_op)
+{
+    static const char * const cc_names[] =3D {
+        [CC_OP_CONST0]    =3D "CC_OP_CONST0",
+        [CC_OP_CONST1]    =3D "CC_OP_CONST1",
+        [CC_OP_CONST2]    =3D "CC_OP_CONST2",
+        [CC_OP_CONST3]    =3D "CC_OP_CONST3",
+        [CC_OP_DYNAMIC]   =3D "CC_OP_DYNAMIC",
+        [CC_OP_STATIC]    =3D "CC_OP_STATIC",
+        [CC_OP_NZ]        =3D "CC_OP_NZ",
+        [CC_OP_ADDU]      =3D "CC_OP_ADDU",
+        [CC_OP_SUBU]      =3D "CC_OP_SUBU",
+        [CC_OP_LTGT_32]   =3D "CC_OP_LTGT_32",
+        [CC_OP_LTGT_64]   =3D "CC_OP_LTGT_64",
+        [CC_OP_LTUGTU_32] =3D "CC_OP_LTUGTU_32",
+        [CC_OP_LTUGTU_64] =3D "CC_OP_LTUGTU_64",
+        [CC_OP_LTGT0_32]  =3D "CC_OP_LTGT0_32",
+        [CC_OP_LTGT0_64]  =3D "CC_OP_LTGT0_64",
+        [CC_OP_ADD_64]    =3D "CC_OP_ADD_64",
+        [CC_OP_SUB_64]    =3D "CC_OP_SUB_64",
+        [CC_OP_ABS_64]    =3D "CC_OP_ABS_64",
+        [CC_OP_NABS_64]   =3D "CC_OP_NABS_64",
+        [CC_OP_ADD_32]    =3D "CC_OP_ADD_32",
+        [CC_OP_SUB_32]    =3D "CC_OP_SUB_32",
+        [CC_OP_ABS_32]    =3D "CC_OP_ABS_32",
+        [CC_OP_NABS_32]   =3D "CC_OP_NABS_32",
+        [CC_OP_COMP_32]   =3D "CC_OP_COMP_32",
+        [CC_OP_COMP_64]   =3D "CC_OP_COMP_64",
+        [CC_OP_TM_32]     =3D "CC_OP_TM_32",
+        [CC_OP_TM_64]     =3D "CC_OP_TM_64",
+        [CC_OP_NZ_F32]    =3D "CC_OP_NZ_F32",
+        [CC_OP_NZ_F64]    =3D "CC_OP_NZ_F64",
+        [CC_OP_NZ_F128]   =3D "CC_OP_NZ_F128",
+        [CC_OP_ICM]       =3D "CC_OP_ICM",
+        [CC_OP_SLA_32]    =3D "CC_OP_SLA_32",
+        [CC_OP_SLA_64]    =3D "CC_OP_SLA_64",
+        [CC_OP_FLOGR]     =3D "CC_OP_FLOGR",
+        [CC_OP_LCBB]      =3D "CC_OP_LCBB",
+        [CC_OP_VC]        =3D "CC_OP_VC",
+        [CC_OP_MULS_32]   =3D "CC_OP_MULS_32",
+        [CC_OP_MULS_64]   =3D "CC_OP_MULS_64",
+    };
+
+    return cc_names[cc_op];
+}
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 2254873cef..41ccc83d11 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -23,7 +23,6 @@
 #include "s390x-internal.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
-#include "qemu/qemu-print.h"
 #include "hw/s390x/ioinst.h"
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
@@ -324,109 +323,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr,=
 hwaddr len)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-
-void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    S390CPU *cpu =3D S390_CPU(cs);
-    CPUS390XState *env =3D &cpu->env;
-    int i;
-
-    if (env->cc_op > 3) {
-        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%15s\n",
-                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
-    } else {
-        qemu_fprintf(f, "PSW=3Dmask %016" PRIx64 " addr %016" PRIx64 " cc =
%02x\n",
-                     env->psw.mask, env->psw.addr, env->cc_op);
-    }
-
-    for (i =3D 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=3D%016" PRIx64, i, env->regs[i]);
-        if ((i % 4) =3D=3D 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-
-    if (flags & CPU_DUMP_FPU) {
-        if (s390_has_feat(S390_FEAT_VECTOR)) {
-            for (i =3D 0; i < 32; i++) {
-                qemu_fprintf(f, "V%02d=3D%016" PRIx64 "%016" PRIx64 "%c",
-                             i, env->vregs[i][0], env->vregs[i][1],
-                             i % 2 ? '\n' : ' ');
-            }
-        } else {
-            for (i =3D 0; i < 16; i++) {
-                qemu_fprintf(f, "F%02d=3D%016" PRIx64 "%c",
-                             i, *get_freg(env, i),
-                             (i % 4) =3D=3D 3 ? '\n' : ' ');
-            }
-        }
-    }
-
-#ifndef CONFIG_USER_ONLY
-    for (i =3D 0; i < 16; i++) {
-        qemu_fprintf(f, "C%02d=3D%016" PRIx64, i, env->cregs[i]);
-        if ((i % 4) =3D=3D 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-#endif
-
-#ifdef DEBUG_INLINE_BRANCHES
-    for (i =3D 0; i < CC_OP_MAX; i++) {
-        qemu_fprintf(f, "  %15s =3D %10ld\t%10ld\n", cc_name(i),
-                     inline_branch_miss[i], inline_branch_hit[i]);
-    }
-#endif
-
-    qemu_fprintf(f, "\n");
-}
-
-const char *cc_name(enum cc_op cc_op)
-{
-    static const char * const cc_names[] =3D {
-        [CC_OP_CONST0]    =3D "CC_OP_CONST0",
-        [CC_OP_CONST1]    =3D "CC_OP_CONST1",
-        [CC_OP_CONST2]    =3D "CC_OP_CONST2",
-        [CC_OP_CONST3]    =3D "CC_OP_CONST3",
-        [CC_OP_DYNAMIC]   =3D "CC_OP_DYNAMIC",
-        [CC_OP_STATIC]    =3D "CC_OP_STATIC",
-        [CC_OP_NZ]        =3D "CC_OP_NZ",
-        [CC_OP_ADDU]      =3D "CC_OP_ADDU",
-        [CC_OP_SUBU]      =3D "CC_OP_SUBU",
-        [CC_OP_LTGT_32]   =3D "CC_OP_LTGT_32",
-        [CC_OP_LTGT_64]   =3D "CC_OP_LTGT_64",
-        [CC_OP_LTUGTU_32] =3D "CC_OP_LTUGTU_32",
-        [CC_OP_LTUGTU_64] =3D "CC_OP_LTUGTU_64",
-        [CC_OP_LTGT0_32]  =3D "CC_OP_LTGT0_32",
-        [CC_OP_LTGT0_64]  =3D "CC_OP_LTGT0_64",
-        [CC_OP_ADD_64]    =3D "CC_OP_ADD_64",
-        [CC_OP_SUB_64]    =3D "CC_OP_SUB_64",
-        [CC_OP_ABS_64]    =3D "CC_OP_ABS_64",
-        [CC_OP_NABS_64]   =3D "CC_OP_NABS_64",
-        [CC_OP_ADD_32]    =3D "CC_OP_ADD_32",
-        [CC_OP_SUB_32]    =3D "CC_OP_SUB_32",
-        [CC_OP_ABS_32]    =3D "CC_OP_ABS_32",
-        [CC_OP_NABS_32]   =3D "CC_OP_NABS_32",
-        [CC_OP_COMP_32]   =3D "CC_OP_COMP_32",
-        [CC_OP_COMP_64]   =3D "CC_OP_COMP_64",
-        [CC_OP_TM_32]     =3D "CC_OP_TM_32",
-        [CC_OP_TM_64]     =3D "CC_OP_TM_64",
-        [CC_OP_NZ_F32]    =3D "CC_OP_NZ_F32",
-        [CC_OP_NZ_F64]    =3D "CC_OP_NZ_F64",
-        [CC_OP_NZ_F128]   =3D "CC_OP_NZ_F128",
-        [CC_OP_ICM]       =3D "CC_OP_ICM",
-        [CC_OP_SLA_32]    =3D "CC_OP_SLA_32",
-        [CC_OP_SLA_64]    =3D "CC_OP_SLA_64",
-        [CC_OP_FLOGR]     =3D "CC_OP_FLOGR",
-        [CC_OP_LCBB]      =3D "CC_OP_LCBB",
-        [CC_OP_VC]        =3D "CC_OP_VC",
-        [CC_OP_MULS_32]   =3D "CC_OP_MULS_32",
-        [CC_OP_MULS_64]   =3D "CC_OP_MULS_64",
-    };
-
-    return cc_names[cc_op];
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index a73bae3dc5..6e1aa3b0cd 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -6,6 +6,7 @@ s390x_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'interrupt.c',
+  'cpu-dump.c',
 ))
=20
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
--=20
2.32.0



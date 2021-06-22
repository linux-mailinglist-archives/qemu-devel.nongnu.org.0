Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956453B014A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:24:51 +0200 (CEST)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdaM-0006w1-LI
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUO-00040G-Va
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:41 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUL-0006eb-Ej
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEcmhhFqf7tA7P8B1viDrxHAllMTon/KXcUi5fYGEPI=;
 b=CvKWY9WI3p/+lHI1rkTjXznStrGqOiGVf3VQMZ5n3gsTVsr7q8XzasrO98L152sbaDqI4w
 oRZnJqKJPvVSAe1yzjS/y8vgo4VY94DEKZmaUkTR8INHIAdWLmLqyiFs6yBnBy1wtVa6LS
 qRhBCuw1Vdw2iUBPSgNO2BoGJIf4pAA=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-F7Gng58UPeiBHP2zV8qkDg-1;
 Tue, 22 Jun 2021 12:18:35 +0200
X-MC-Unique: F7Gng58UPeiBHP2zV8qkDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU2y9l1xfFZtRrJO6Oz41RDpm0yi2CYg5BstV7PdI2W1AoJJPmWL+D7SwL7v2NTPaj1Cmqx3fqP/IGGuPQb+fYPbzCRwRM1sW2cMlQ82fdNxbRVKCz8KXxJ5s/QfzCmiWIKKzW+/72rxQLtDVbRQTtPF0AXbJveht76T+XTbUaYPdRx59LEjQR9WgOz2f84+iP3Aot5EopDcHkGTEZGTMQnwIu+wsiAhb62XQaepDjeoU2+puZ6Jtv/ehFjG6oIpzdk0oPxJaTGce8tKTc36IuBBhzGFWv++LimZpPqjfYLTc1PRgWdHnwwmx2WJJqlJtcojhTD4M/EcIMDhCzWiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bnZo3mcB7XRH+z3tdKyag5TPR1wZgiMCuIZrlNhyaI=;
 b=b3/73qjNbCRp5fO8hx1Oumpicf6i4uQTVPYc/n/SMJQUhO/M87lnymf/+QcgdEKt7W2gZ4gW3lkqpNObAXTpiZGfnmy2QV7HgjRb8+OfUZwDPnTuGUtNswOPBCS+YZoWN7nYniFDiH2VwYTB3rCFCxwOdWEFS+ypxw64+jwkUCIzJX0mIkseR7bp+3WYSZIp097vBQmqD2uQ00NzuBOVwntL+g3od7xNkqU5PRIM3rCiglJ/UOaldePRER7dB2fcdjy+AlUy3I0gpEYA5O9qvEzr3Ar6jwMojpVyapfvM18L+m+8GDVobLykYfiQKooOOluPFuIZ5YCGRn7ov3dzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:18:33 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:18:33 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [RFC v5 07/13] target/s390x: move sysemu-only code out to cpu-sysemu.c
Date: Tue, 22 Jun 2021 18:17:20 +0800
Message-ID: <20210622101726.20860-8-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR02CA0190.apcprd02.prod.outlook.com
 (2603:1096:201:21::26) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR02CA0190.apcprd02.prod.outlook.com (2603:1096:201:21::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 10:18:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c149fdb9-9d6c-4098-b6f8-08d935671713
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB572728A736F9F30959B0D500A0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwfId9tmdeaRcjanluA5roj6cwpA9b+jvZMARz21bf/oYWSoe46K9Y7uzwPze9rx95+p3P7YXqgEFpoWigpeVhP/aFsqUFZq/Yx55E4Y9JUvH54qf0SToFJrdQ1a56Vw9MlMLH4yC8C3sUxSrMl/rSb3nbEjv3m3udhRdCcVwyaGSOUqacHg5eVjtcof6RZ4kcxn/lNkeNYQEK/HRDh3pQKP+ZLuOgULY03Ohv83ILoEPv2N4gC6aXmOjkpBtgOhk13b9VHDcFtvtHTMNLL55DMVtRX3RlnXqWs45mIaVwG4DBmT97LZO5woN5Ms33T6Qw9MjfWIDREUUjmkJlPQhdGNtDYVycvYUW5n5EHL8EPGkVDl3bZQT/mA9JThAdGUYHvrfooAl4x3VVGvpbDFd10lIkKoDjjlBOUvQ+RP7PSK1/P5eRMOuRCmBZcB+j/J6tJ5k8/6pr1l5tWZ9eBplUx/MSg3OyBewKwvi6j+xh914z17M2v3WxkWMRyyuUaBhKRufhR+1mPjewGNVQSrX0pdwK4DN6+xwfWudhnXZChMWZC2Fmncc2qFG171Fhjly94bk6VCYVLQnC9/df2pqVnEt7V4cs7VGqzyy6SNQSV0zjb1hyY9bXHiC39xrj1xkNh+pVqMQDLtYQT3gLeMKwZeTG0UU4DDc5uk64DfRrH0WFOINIShM7uZhquxp2jTZIEQDQbw3E+Pbg5YWo9WAqo0iDuXxC4f/LOzWaf0IZqdPB2FkdGLiS8id91uHqbXlhCTuCr/GZ/HHo7IWnUALkaT4ToJtfnCf4R5xXKaEuPSaZq3WrWgD9+78MuqlkSPh6Yd7mN4hHhtZqgVqCrgfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(30864003)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(316002)(478600001)(66476007)(6496006)(8676002)(36456004)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpY8uQpgYsc9/xfsmvb9D76bxLsYtv5r8i6Xt7gZ4hGpqptXjEVr5glWHDve?=
 =?us-ascii?Q?N370ZzePkLWwwad8oA3S9zALpz7fQs8qoHQEDacHaMHdl5AZuecX6vTjZ3hu?=
 =?us-ascii?Q?8J1p67MatJTHxEJcOA67ncjv7nMew3Mwf2QF6XuJmKUDZuEGSrEGDasFuEkP?=
 =?us-ascii?Q?EvLT/DvDF5xnqwKxMvf0bCRwqc8qMZbCCgSIgNaGxj7JhxL3LwqvPme5v7wi?=
 =?us-ascii?Q?E76LnAXH4P6up2PpsA2mqr2ioh/RcEBlpzx7QPVYHBEZKOhXNk9RonvQ0Thw?=
 =?us-ascii?Q?CadGOg/CllcesHXm5vqSUyM0ZH9gk55ZWitskmlgC/q0i4GEpaYfBENvaek0?=
 =?us-ascii?Q?46rGHum2y+x7Rs5kEQ2Dq51fAYfCBhbDaBX6picz6PyKu6kt55hFhPPDkFa5?=
 =?us-ascii?Q?ZkDNQisWMs+OMuOU31Ttvuuheeh3tTFkdG9PMERnKGG0lM7jgJw8ZqYh9iPr?=
 =?us-ascii?Q?EUvL/XBXAFOXvdAicfbkfoMMp3aBifqSlRuTBmuvhV53hP+KWrT3lENQ/Gd1?=
 =?us-ascii?Q?EfU3/96uSpzIgfaOQ7pPNnP1Hynja3QST7llLNwgwXyt3Fa8B5pP4QMCaEYz?=
 =?us-ascii?Q?kjw6O8RgIoEJjtVeYd/iF2Kp67X/Phh/fUgKtJ9ilf5PA8ys3vWob5PPmY6T?=
 =?us-ascii?Q?OV/4o8Cp/VhUaZOHGLHckbokEVYKikQPrzRK2UV5iQKEdDybddsVTEJK5obP?=
 =?us-ascii?Q?Ys/WEiMHZ8WncV0XxngKmmVteTso6rgJvqxacdPIXBSokRlpW8/xqBAQTGhV?=
 =?us-ascii?Q?UDf1jnWPrxHNzp1VjfoPLUnEGP1q4uvnEzLpIWqUFeHE4IrB/1PT22FJqu8+?=
 =?us-ascii?Q?JyX0IivqOqjmomJLw6bzLuJx38BUYEuw4uqCzirBUQXsyMWawm6smq23VMGn?=
 =?us-ascii?Q?xuuDOES3DfAaE80R63ptHP/cH1fwnbBz7YXdYma+iv3tDRx4AlN5GMwOcQWA?=
 =?us-ascii?Q?ivWc++88uNAXC7rNIYfy0AuZUhzlcyopj9W6UvwxlEtDt0APukaybGjkBoQ4?=
 =?us-ascii?Q?Pbtf/t5atZvHTUpBRAVVPDmjZ8Y/w8LkIzicCI/HUASMd7GWc7W2o7pzPuIs?=
 =?us-ascii?Q?6dtr0pSpRxR2DSIuFIMguejKNEJYZfw7DtrxbiJQ6tG+jcNdj3wHbhZDHFob?=
 =?us-ascii?Q?uGb3bf+FRHybYh0/KEKmdVcQLwELbHUBE6LtslNb5GpnhkZQPKntnEQ28lkX?=
 =?us-ascii?Q?vork2OM5xKBX4J/ucDIdbKXuwG88+beIhh/TkYaUKgHSTg+QftSXagtsVi5z?=
 =?us-ascii?Q?x25Zxdz0aexAWbOVLSHHpFX0aj9D9/F7mvo9/5QqJG4xG4lm095O3o4z/5D3?=
 =?us-ascii?Q?eHundKAFoQnYDJMe+OKEck3T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c149fdb9-9d6c-4098-b6f8-08d935671713
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:18:33.7795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUeQPvS1LqR5tmcA0dxcB/c0rCQCbMCG90WpgPKQGR7bKf6zCXfn1Yzgh5oWMB2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move sysemu-only code out to cpu-sysemu.c

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/cpu-sysemu.c | 309 ++++++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c        | 285 ++---------------------------------
 target/s390x/meson.build  |   1 +
 target/s390x/trace-events |   2 +-
 4 files changed, 320 insertions(+), 277 deletions(-)
 create mode 100644 target/s390x/cpu-sysemu.c

diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
new file mode 100644
index 0000000000..16e5301084
--- /dev/null
+++ b/target/s390x/cpu-sysemu.c
@@ -0,0 +1,309 @@
+/*
+ * QEMU S/390 CPU - System Emulation-only code
+ *
+ * Copyright (c) 2009 Ulrich Hecht
+ * Copyright (c) 2011 Alexander Graf
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ * Copyright (c) 2012 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "kvm_s390x.h"
+#include "sysemu/kvm.h"
+#include "sysemu/reset.h"
+#include "qemu/timer.h"
+#include "trace.h"
+#include "qapi/qapi-visit-run-state.h"
+#include "sysemu/hw_accel.h"
+
+#include "hw/s390x/pv.h"
+#include "hw/boards.h"
+#include "sysemu/arch_init.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
+#include "hw/core/sysemu-cpu-ops.h"
+
+/* S390CPUClass::load_normal() */
+static void s390_cpu_load_normal(CPUState *s)
+{
+    S390CPU *cpu =3D S390_CPU(s);
+    uint64_t spsw;
+
+    if (!s390_is_pv()) {
+        spsw =3D ldq_phys(s->as, 0);
+        cpu->env.psw.mask =3D spsw & PSW_MASK_SHORT_CTRL;
+        /*
+         * Invert short psw indication, so SIE will report a specification
+         * exception if it was not set.
+         */
+        cpu->env.psw.mask ^=3D PSW_MASK_SHORTPSW;
+        cpu->env.psw.addr =3D spsw & PSW_MASK_SHORT_ADDR;
+    } else {
+        /*
+         * Firmware requires us to set the load state before we set
+         * the cpu to operating on protected guests.
+         */
+        s390_cpu_set_state(S390_CPU_STATE_LOAD, cpu);
+    }
+    s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
+}
+
+void s390_cpu_machine_reset_cb(void *opaque)
+{
+    S390CPU *cpu =3D opaque;
+
+    run_on_cpu(CPU(cpu), s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
+}
+
+static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
+{
+    GuestPanicInformation *panic_info;
+    S390CPU *cpu =3D S390_CPU(cs);
+
+    cpu_synchronize_state(cs);
+    panic_info =3D g_malloc0(sizeof(GuestPanicInformation));
+
+    panic_info->type =3D GUEST_PANIC_INFORMATION_TYPE_S390;
+    panic_info->u.s390.core =3D cpu->env.core_id;
+    panic_info->u.s390.psw_mask =3D cpu->env.psw.mask;
+    panic_info->u.s390.psw_addr =3D cpu->env.psw.addr;
+    panic_info->u.s390.reason =3D cpu->env.crash_reason;
+
+    return panic_info;
+}
+
+static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    CPUState *cs =3D CPU(obj);
+    GuestPanicInformation *panic_info;
+
+    if (!cs->crash_occurred) {
+        error_setg(errp, "No crash occurred");
+        return;
+    }
+
+    panic_info =3D s390_cpu_get_crash_info(cs);
+
+    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
+                                     errp);
+    qapi_free_GuestPanicInformation(panic_info);
+}
+
+void s390_cpu_init_sysemu(Object *obj)
+{
+    CPUState *cs =3D CPU(obj);
+    S390CPU *cpu =3D S390_CPU(obj);
+
+    cs->start_powered_off =3D true;
+    object_property_add(obj, "crash-information", "GuestPanicInformation",
+                        s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
+    cpu->env.tod_timer =3D
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
+    cpu->env.cpu_timer =3D
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
+    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
+}
+
+bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
+{
+    S390CPU *cpu =3D S390_CPU(dev);
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+    unsigned int max_cpus =3D ms->smp.max_cpus;
+
+    if (cpu->env.core_id >=3D max_cpus) {
+        error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
+                   ", maximum core-id: %d", cpu->env.core_id,
+                   max_cpus - 1);
+        return false;
+    }
+
+    if (cpu_exists(cpu->env.core_id)) {
+        error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
+                   ", it already exists", cpu->env.core_id);
+        return false;
+    }
+
+    /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. =
*/
+    CPU(cpu)->cpu_index =3D cpu->env.core_id;
+    return true;
+}
+
+void s390_cpu_finalize(Object *obj)
+{
+    S390CPU *cpu =3D S390_CPU(obj);
+
+    timer_free(cpu->env.tod_timer);
+    timer_free(cpu->env.cpu_timer);
+
+    qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
+    g_free(cpu->irqstate);
+}
+
+static const struct SysemuCPUOps s390_sysemu_ops =3D {
+    .get_phys_page_debug =3D s390_cpu_get_phys_page_debug,
+    .get_crash_info =3D s390_cpu_get_crash_info,
+    .write_elf64_note =3D s390_cpu_write_elf64_note,
+    .legacy_vmsd =3D &vmstate_s390_cpu,
+};
+
+void s390_cpu_class_init_sysemu(CPUClass *cc)
+{
+    S390CPUClass *scc =3D S390_CPU_CLASS(cc);
+
+    scc->load_normal =3D s390_cpu_load_normal;
+    cc->sysemu_ops =3D &s390_sysemu_ops;
+}
+
+static bool disabled_wait(CPUState *cpu)
+{
+    return cpu->halted && !(S390_CPU(cpu)->env.psw.mask &
+                            (PSW_MASK_IO | PSW_MASK_EXT | PSW_MASK_MCHECK)=
);
+}
+
+static unsigned s390_count_running_cpus(void)
+{
+    CPUState *cpu;
+    int nr_running =3D 0;
+
+    CPU_FOREACH(cpu) {
+        uint8_t state =3D S390_CPU(cpu)->env.cpu_state;
+        if (state =3D=3D S390_CPU_STATE_OPERATING ||
+            state =3D=3D S390_CPU_STATE_LOAD) {
+            if (!disabled_wait(cpu)) {
+                nr_running++;
+            }
+        }
+    }
+
+    return nr_running;
+}
+
+unsigned int s390_cpu_halt(S390CPU *cpu)
+{
+    CPUState *cs =3D CPU(cpu);
+    trace_cpu_halt(cs->cpu_index);
+
+    if (!cs->halted) {
+        cs->halted =3D 1;
+        cs->exception_index =3D EXCP_HLT;
+    }
+
+    return s390_count_running_cpus();
+}
+
+void s390_cpu_unhalt(S390CPU *cpu)
+{
+    CPUState *cs =3D CPU(cpu);
+    trace_cpu_unhalt(cs->cpu_index);
+
+    if (cs->halted) {
+        cs->halted =3D 0;
+        cs->exception_index =3D -1;
+    }
+}
+
+unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+ {
+    trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
+
+    switch (cpu_state) {
+    case S390_CPU_STATE_STOPPED:
+    case S390_CPU_STATE_CHECK_STOP:
+        /* halt the cpu for common infrastructure */
+        s390_cpu_halt(cpu);
+        break;
+    case S390_CPU_STATE_OPERATING:
+    case S390_CPU_STATE_LOAD:
+        /*
+         * Starting a CPU with a PSW WAIT bit set:
+         * KVM: handles this internally and triggers another WAIT exit.
+         * TCG: will actually try to continue to run. Don't unhalt, will
+         *      be done when the CPU actually has work (an interrupt).
+         */
+        if (!tcg_enabled() || !(cpu->env.psw.mask & PSW_MASK_WAIT)) {
+            s390_cpu_unhalt(cpu);
+        }
+        break;
+    default:
+        error_report("Requested CPU state is not a valid S390 CPU state: %=
u",
+                     cpu_state);
+        exit(1);
+    }
+    if (kvm_enabled() && cpu->env.cpu_state !=3D cpu_state) {
+        kvm_s390_set_cpu_state(cpu, cpu_state);
+    }
+    cpu->env.cpu_state =3D cpu_state;
+
+    return s390_count_running_cpus();
+}
+
+int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_set_mem_limit(new_limit, hw_limit);
+    }
+    return 0;
+}
+
+void s390_set_max_pagesize(uint64_t pagesize, Error **errp)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_max_pagesize(pagesize, errp);
+    }
+}
+
+void s390_cmma_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_cmma_reset();
+    }
+}
+
+int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
+                                int vq, bool assign)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_assign_subch_ioeventfd(notifier, sch_id, vq, assig=
n);
+    } else {
+        return 0;
+    }
+}
+
+void s390_crypto_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_crypto_reset();
+    }
+}
+
+void s390_enable_css_support(S390CPU *cpu)
+{
+    if (kvm_enabled()) {
+        kvm_s390_enable_css_support(cpu);
+    }
+}
+
+void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_diag318(cs, arg.host_ulong);
+    }
+}
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 1795042e97..2b2b70e1c6 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -27,21 +27,11 @@
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
-#include "qemu/timer.h"
-#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "trace.h"
-#include "qapi/visitor.h"
 #include "qapi/qapi-types-machine.h"
-#include "qapi/qapi-visit-run-state.h"
 #include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
-#ifndef CONFIG_USER_ONLY
-#include "hw/s390x/pv.h"
-#include "hw/boards.h"
-#include "sysemu/arch_init.h"
-#include "sysemu/tcg.h"
-#endif
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
=20
@@ -72,33 +62,6 @@ static bool s390_cpu_has_work(CPUState *cs)
     return s390_cpu_has_int(cpu);
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-/* S390CPUClass::load_normal() */
-static void s390_cpu_load_normal(CPUState *s)
-{
-    S390CPU *cpu =3D S390_CPU(s);
-    uint64_t spsw;
-
-    if (!s390_is_pv()) {
-        spsw =3D ldq_phys(s->as, 0);
-        cpu->env.psw.mask =3D spsw & PSW_MASK_SHORT_CTRL;
-        /*
-         * Invert short psw indication, so SIE will report a specification
-         * exception if it was not set.
-         */
-        cpu->env.psw.mask ^=3D PSW_MASK_SHORTPSW;
-        cpu->env.psw.addr =3D spsw & PSW_MASK_SHORT_ADDR;
-    } else {
-        /*
-         * Firmware requires us to set the load state before we set
-         * the cpu to operating on protected guests.
-         */
-        s390_cpu_set_state(S390_CPU_STATE_LOAD, cpu);
-    }
-    s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
-}
-#endif
-
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 {
@@ -169,15 +132,6 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type=
 type)
     }
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-static void s390_cpu_machine_reset_cb(void *opaque)
-{
-    S390CPU *cpu =3D opaque;
-
-    run_on_cpu(CPU(cpu), s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
-}
-#endif
-
 static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach =3D bfd_mach_s390_64;
@@ -191,9 +145,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error =
**errp)
 {
     CPUState *cs =3D CPU(dev);
     S390CPUClass *scc =3D S390_CPU_GET_CLASS(dev);
-#if !defined(CONFIG_USER_ONLY)
-    S390CPU *cpu =3D S390_CPU(dev);
-#endif
     Error *err =3D NULL;
=20
     /* the model has to be realized before qemu_init_vcpu() due to kvm */
@@ -203,23 +154,9 @@ static void s390_cpu_realizefn(DeviceState *dev, Error=
 **errp)
     }
=20
 #if !defined(CONFIG_USER_ONLY)
-    MachineState *ms =3D MACHINE(qdev_get_machine());
-    unsigned int max_cpus =3D ms->smp.max_cpus;
-    if (cpu->env.core_id >=3D max_cpus) {
-        error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
-                   ", maximum core-id: %d", cpu->env.core_id,
-                   max_cpus - 1);
-        goto out;
-    }
-
-    if (cpu_exists(cpu->env.core_id)) {
-        error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
-                   ", it already exists", cpu->env.core_id);
+    if (!s390_cpu_realize_sysemu(dev, &err)) {
         goto out;
     }
-
-    /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. =
*/
-    cs->cpu_index =3D cpu->env.core_id;
 #endif
=20
     cpu_exec_realizefn(cs, &err);
@@ -228,7 +165,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error =
**errp)
     }
=20
 #if !defined(CONFIG_USER_ONLY)
-    qemu_register_reset(s390_cpu_machine_reset_cb, cpu);
+    qemu_register_reset(s390_cpu_machine_reset_cb, S390_CPU(dev));
 #endif
     s390_cpu_gdb_init(cs);
     qemu_init_vcpu(cs);
@@ -250,44 +187,6 @@ out:
     error_propagate(errp, err);
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
-{
-    GuestPanicInformation *panic_info;
-    S390CPU *cpu =3D S390_CPU(cs);
-
-    cpu_synchronize_state(cs);
-    panic_info =3D g_malloc0(sizeof(GuestPanicInformation));
-
-    panic_info->type =3D GUEST_PANIC_INFORMATION_TYPE_S390;
-    panic_info->u.s390.core =3D cpu->env.core_id;
-    panic_info->u.s390.psw_mask =3D cpu->env.psw.mask;
-    panic_info->u.s390.psw_addr =3D cpu->env.psw.addr;
-    panic_info->u.s390.reason =3D cpu->env.crash_reason;
-
-    return panic_info;
-}
-
-static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
-                                        const char *name, void *opaque,
-                                        Error **errp)
-{
-    CPUState *cs =3D CPU(obj);
-    GuestPanicInformation *panic_info;
-
-    if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occurred");
-        return;
-    }
-
-    panic_info =3D s390_cpu_get_crash_info(cs);
-
-    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
-                                     errp);
-    qapi_free_GuestPanicInformation(panic_info);
-}
-#endif
-
 static void s390_cpu_initfn(Object *obj)
 {
     CPUState *cs =3D CPU(obj);
@@ -295,169 +194,12 @@ static void s390_cpu_initfn(Object *obj)
=20
     cpu_set_cpustate_pointers(cpu);
     cs->exception_index =3D EXCP_HLT;
-#if !defined(CONFIG_USER_ONLY)
-    cs->start_powered_off =3D true;
-    object_property_add(obj, "crash-information", "GuestPanicInformation",
-                        s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
-    cpu->env.tod_timer =3D
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
-    cpu->env.cpu_timer =3D
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
-    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
-#endif
-}
=20
-static void s390_cpu_finalize(Object *obj)
-{
 #if !defined(CONFIG_USER_ONLY)
-    S390CPU *cpu =3D S390_CPU(obj);
-
-    timer_free(cpu->env.tod_timer);
-    timer_free(cpu->env.cpu_timer);
-
-    qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
-    g_free(cpu->irqstate);
+    s390_cpu_init_sysemu(obj);
 #endif
 }
=20
-#if !defined(CONFIG_USER_ONLY)
-static bool disabled_wait(CPUState *cpu)
-{
-    return cpu->halted && !(S390_CPU(cpu)->env.psw.mask &
-                            (PSW_MASK_IO | PSW_MASK_EXT | PSW_MASK_MCHECK)=
);
-}
-
-static unsigned s390_count_running_cpus(void)
-{
-    CPUState *cpu;
-    int nr_running =3D 0;
-
-    CPU_FOREACH(cpu) {
-        uint8_t state =3D S390_CPU(cpu)->env.cpu_state;
-        if (state =3D=3D S390_CPU_STATE_OPERATING ||
-            state =3D=3D S390_CPU_STATE_LOAD) {
-            if (!disabled_wait(cpu)) {
-                nr_running++;
-            }
-        }
-    }
-
-    return nr_running;
-}
-
-unsigned int s390_cpu_halt(S390CPU *cpu)
-{
-    CPUState *cs =3D CPU(cpu);
-    trace_cpu_halt(cs->cpu_index);
-
-    if (!cs->halted) {
-        cs->halted =3D 1;
-        cs->exception_index =3D EXCP_HLT;
-    }
-
-    return s390_count_running_cpus();
-}
-
-void s390_cpu_unhalt(S390CPU *cpu)
-{
-    CPUState *cs =3D CPU(cpu);
-    trace_cpu_unhalt(cs->cpu_index);
-
-    if (cs->halted) {
-        cs->halted =3D 0;
-        cs->exception_index =3D -1;
-    }
-}
-
-unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
- {
-    trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
-
-    switch (cpu_state) {
-    case S390_CPU_STATE_STOPPED:
-    case S390_CPU_STATE_CHECK_STOP:
-        /* halt the cpu for common infrastructure */
-        s390_cpu_halt(cpu);
-        break;
-    case S390_CPU_STATE_OPERATING:
-    case S390_CPU_STATE_LOAD:
-        /*
-         * Starting a CPU with a PSW WAIT bit set:
-         * KVM: handles this internally and triggers another WAIT exit.
-         * TCG: will actually try to continue to run. Don't unhalt, will
-         *      be done when the CPU actually has work (an interrupt).
-         */
-        if (!tcg_enabled() || !(cpu->env.psw.mask & PSW_MASK_WAIT)) {
-            s390_cpu_unhalt(cpu);
-        }
-        break;
-    default:
-        error_report("Requested CPU state is not a valid S390 CPU state: %=
u",
-                     cpu_state);
-        exit(1);
-    }
-    if (kvm_enabled() && cpu->env.cpu_state !=3D cpu_state) {
-        kvm_s390_set_cpu_state(cpu, cpu_state);
-    }
-    cpu->env.cpu_state =3D cpu_state;
-
-    return s390_count_running_cpus();
-}
-
-int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
-{
-    if (kvm_enabled()) {
-        return kvm_s390_set_mem_limit(new_limit, hw_limit);
-    }
-    return 0;
-}
-
-void s390_set_max_pagesize(uint64_t pagesize, Error **errp)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_max_pagesize(pagesize, errp);
-    }
-}
-
-void s390_cmma_reset(void)
-{
-    if (kvm_enabled()) {
-        kvm_s390_cmma_reset();
-    }
-}
-
-int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
-                                int vq, bool assign)
-{
-    if (kvm_enabled()) {
-        return kvm_s390_assign_subch_ioeventfd(notifier, sch_id, vq, assig=
n);
-    } else {
-        return 0;
-    }
-}
-
-void s390_crypto_reset(void)
-{
-    if (kvm_enabled()) {
-        kvm_s390_crypto_reset();
-    }
-}
-
-void s390_enable_css_support(S390CPU *cpu)
-{
-    if (kvm_enabled()) {
-        kvm_s390_enable_css_support(cpu);
-    }
-}
-
-void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_diag318(cs, arg.host_ulong);
-    }
-}
-#endif
-
 static gchar *s390_gdb_arch_name(CPUState *cs)
 {
     return g_strdup("s390:64-bit");
@@ -476,17 +218,6 @@ static void s390_cpu_reset_full(DeviceState *dev)
     return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
 }
=20
-#ifndef CONFIG_USER_ONLY
-#include "hw/core/sysemu-cpu-ops.h"
-
-static const struct SysemuCPUOps s390_sysemu_ops =3D {
-    .get_phys_page_debug =3D s390_cpu_get_phys_page_debug,
-    .get_crash_info =3D s390_cpu_get_crash_info,
-    .write_elf64_note =3D s390_cpu_write_elf64_note,
-    .legacy_vmsd =3D &vmstate_s390_cpu,
-};
-#endif
-
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
=20
@@ -515,9 +246,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
data)
     dc->user_creatable =3D true;
=20
     device_class_set_parent_reset(dc, s390_cpu_reset_full, &scc->parent_re=
set);
-#if !defined(CONFIG_USER_ONLY)
-    scc->load_normal =3D s390_cpu_load_normal;
-#endif
+
     scc->reset =3D s390_cpu_reset;
     cc->class_by_name =3D s390_cpu_class_by_name,
     cc->has_work =3D s390_cpu_has_work;
@@ -526,7 +255,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
data)
     cc->gdb_read_register =3D s390_cpu_gdb_read_register;
     cc->gdb_write_register =3D s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->sysemu_ops =3D &s390_sysemu_ops;
+    s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info =3D s390_cpu_disas_set_info;
     cc->gdb_num_core_regs =3D S390_NUM_CORE_REGS;
@@ -546,7 +275,11 @@ static const TypeInfo s390_cpu_type_info =3D {
     .instance_size =3D sizeof(S390CPU),
     .instance_align =3D __alignof__(S390CPU),
     .instance_init =3D s390_cpu_initfn,
+
+#ifndef CONFIG_USER_ONLY
     .instance_finalize =3D s390_cpu_finalize,
+#endif /* !CONFIG_USER_ONLY */
+
     .abstract =3D true,
     .class_size =3D sizeof(S390CPUClass),
     .class_init =3D s390_cpu_class_init,
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 60d7f1b908..a73bae3dc5 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -28,6 +28,7 @@ s390x_softmmu_ss.add(files(
   'machine.c',
   'mmu_helper.c',
   'sigp.c',
+  'cpu-sysemu.c',
 ))
=20
 # Newer kernels on s390 check for an S390_PGSTE program header and
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index e661a81e3a..e83a8cf85e 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -16,7 +16,7 @@ kvm_clear_cmma(int rc) "CMMA: clearing with result code %=
d"
 kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "W=
arning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
 kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamat=
ch) "fd: %d sch: @0x%x assign: %d vq: %d"
=20
-# cpu.c
+# cpu-sysemu.c
 cpu_set_state(int cpu_index, uint8_t state) "setting cpu %d state to %" PR=
Iu8
 cpu_halt(int cpu_index) "halting cpu %d"
 cpu_unhalt(int cpu_index) "unhalting cpu %d"
--=20
2.32.0



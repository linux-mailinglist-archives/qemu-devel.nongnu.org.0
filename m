Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57111576C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 19:49:19 +0100 (CET)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idIfG-0004ns-6P
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 13:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1idIaR-00023X-DU
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:44:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1idIaP-0003Fj-1w
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:44:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24422)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1idIaM-0003E9-Tu
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:44:15 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6IhUDw013571
 for <qemu-devel@nongnu.org>; Fri, 6 Dec 2019 13:44:13 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9hmrhny-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 13:44:13 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Fri, 6 Dec 2019 18:44:11 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 18:44:07 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6Ii6Ah58458270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 18:44:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA76511C04A;
 Fri,  6 Dec 2019 18:44:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 651C011C04C;
 Fri,  6 Dec 2019 18:44:06 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.42.200])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 18:44:06 +0000 (GMT)
Subject: [for-5.0 PATCH 3/3] cpu: Use cpu_class_set_parent_reset()
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 06 Dec 2019 19:44:06 +0100
In-Reply-To: <157565782864.3897844.627720481210693346.stgit@bahia.lan>
References: <157565782864.3897844.627720481210693346.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19120618-0008-0000-0000-0000033E595B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120618-0009-0000-0000-00004A5D8177
Message-Id: <157565784603.3897844.16391025294328116481.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_06:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 clxscore=1034 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060152
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert all targets to use cpu_class_set_parent_reset() with the following
coccinelle script:

@@
type CPUParentClass;
CPUParentClass *pcc;
CPUClass *cc;
identifier parent_fn;
identifier child_fn;
@@
+cpu_class_set_parent_reset(cc, child_fn, &pcc->parent_fn);
-pcc->parent_fn = cc->reset;
...
-cc->reset = child_fn;

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 target/arm/cpu.c                |    3 +--
 target/cris/cpu.c               |    3 +--
 target/i386/cpu.c               |    3 +--
 target/lm32/cpu.c               |    3 +--
 target/m68k/cpu.c               |    3 +--
 target/microblaze/cpu.c         |    3 +--
 target/mips/cpu.c               |    3 +--
 target/moxie/cpu.c              |    3 +--
 target/nios2/cpu.c              |    3 +--
 target/openrisc/cpu.c           |    3 +--
 target/ppc/translate_init.inc.c |    3 +--
 target/riscv/cpu.c              |    3 +--
 target/s390x/cpu.c              |    3 +--
 target/sh4/cpu.c                |    3 +--
 target/sparc/cpu.c              |    3 +--
 target/tilegx/cpu.c             |    3 +--
 target/tricore/cpu.c            |    3 +--
 target/xtensa/cpu.c             |    3 +--
 18 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7a4ac9339bf9..712a9425fdf5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2625,8 +2625,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
     dc->props = arm_cpu_properties;
 
-    acc->parent_reset = cc->reset;
-    cc->reset = arm_cpu_reset;
+    cpu_class_set_parent_reset(cc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 7adfd6caf4ed..486675e3822f 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -256,8 +256,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, cris_cpu_realizefn,
                                     &ccc->parent_realize);
 
-    ccc->parent_reset = cc->reset;
-    cc->reset = cris_cpu_reset;
+    cpu_class_set_parent_reset(cc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 69f518a21a9b..57d36931725d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7049,8 +7049,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                                       &xcc->parent_unrealize);
     dc->props = x86_cpu_properties;
 
-    xcc->parent_reset = cc->reset;
-    cc->reset = x86_cpu_reset;
+    cpu_class_set_parent_reset(cc, x86_cpu_reset, &xcc->parent_reset);
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
     cc->class_by_name = x86_cpu_class_by_name;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index b35537de6285..687bf35e6588 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -218,8 +218,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, lm32_cpu_realizefn,
                                     &lcc->parent_realize);
-    lcc->parent_reset = cc->reset;
-    cc->reset = lm32_cpu_reset;
+    cpu_class_set_parent_reset(cc, lm32_cpu_reset, &lcc->parent_reset);
 
     cc->class_by_name = lm32_cpu_class_by_name;
     cc->has_work = lm32_cpu_has_work;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index e6596de29c2c..176d95e6fcfb 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -257,8 +257,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 
     device_class_set_parent_realize(dc, m68k_cpu_realizefn,
                                     &mcc->parent_realize);
-    mcc->parent_reset = cc->reset;
-    cc->reset = m68k_cpu_reset;
+    cpu_class_set_parent_reset(cc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 9cfd7445e7da..71d88f603b2e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -292,8 +292,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, mb_cpu_realizefn,
                                     &mcc->parent_realize);
-    mcc->parent_reset = cc->reset;
-    cc->reset = mb_cpu_reset;
+    cpu_class_set_parent_reset(cc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index bbcf7ca4635c..6cd6b9650baa 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -189,8 +189,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 
     device_class_set_parent_realize(dc, mips_cpu_realizefn,
                                     &mcc->parent_realize);
-    mcc->parent_reset = cc->reset;
-    cc->reset = mips_cpu_reset;
+    cpu_class_set_parent_reset(cc, mips_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 48996d0554f2..cf47bc709b54 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -101,8 +101,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, moxie_cpu_realizefn,
                                     &mcc->parent_realize);
-    mcc->parent_reset = cc->reset;
-    cc->reset = moxie_cpu_reset;
+    cpu_class_set_parent_reset(cc, moxie_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = moxie_cpu_class_by_name;
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index ca9c7a6df5d1..bbdbc0c6fbf0 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -188,8 +188,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, nios2_cpu_realizefn,
                                     &ncc->parent_realize);
     dc->props = nios2_properties;
-    ncc->parent_reset = cc->reset;
-    cc->reset = nios2_cpu_reset;
+    cpu_class_set_parent_reset(cc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 506aec6bfba5..5cd04dafab69 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -150,8 +150,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, openrisc_cpu_realizefn,
                                     &occ->parent_realize);
-    occ->parent_reset = cc->reset;
-    cc->reset = openrisc_cpu_reset;
+    cpu_class_set_parent_reset(cc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index ba726dec4d00..e5773a99fffd 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10614,8 +10614,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_always;
     dc->props = ppc_cpu_properties;
 
-    pcc->parent_reset = cc->reset;
-    cc->reset = ppc_cpu_reset;
+    cpu_class_set_parent_reset(cc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
     pcc->parent_parse_features = cc->parse_features;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d37861a4305b..d6f187272859 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -462,8 +462,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_realize(dc, riscv_cpu_realize,
                                     &mcc->parent_realize);
 
-    mcc->parent_reset = cc->reset;
-    cc->reset = riscv_cpu_reset;
+    cpu_class_set_parent_reset(cc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3abe7e80fd0a..cf7cf5655fbc 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -469,13 +469,12 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     dc->props = s390x_cpu_properties;
     dc->user_creatable = true;
 
-    scc->parent_reset = cc->reset;
+    cpu_class_set_parent_reset(cc, s390_cpu_full_reset, &scc->parent_reset);
 #if !defined(CONFIG_USER_ONLY)
     scc->load_normal = s390_cpu_load_normal;
 #endif
     scc->cpu_reset = s390_cpu_reset;
     scc->initial_cpu_reset = s390_cpu_initial_reset;
-    cc->reset = s390_cpu_full_reset;
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
 #ifdef CONFIG_TCG
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index d0a7707991fe..70c8d8170ff3 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -214,8 +214,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, superh_cpu_realizefn,
                                     &scc->parent_realize);
 
-    scc->parent_reset = cc->reset;
-    cc->reset = superh_cpu_reset;
+    cpu_class_set_parent_reset(cc, superh_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index bc659295520f..9c306e52717e 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -859,8 +859,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
                                     &scc->parent_realize);
     dc->props = sparc_cpu_properties;
 
-    scc->parent_reset = cc->reset;
-    cc->reset = sparc_cpu_reset;
+    cpu_class_set_parent_reset(cc, sparc_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 2b2a7ccc313f..cd422a0467a0 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -142,8 +142,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, tilegx_cpu_realizefn,
                                     &tcc->parent_realize);
 
-    tcc->parent_reset = cc->reset;
-    cc->reset = tilegx_cpu_reset;
+    cpu_class_set_parent_reset(cc, tilegx_cpu_reset, &tcc->parent_reset);
 
     cc->class_by_name = tilegx_cpu_class_by_name;
     cc->has_work = tilegx_cpu_has_work;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index df807c1d7437..85bc9f03a1ee 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -153,8 +153,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_realize(dc, tricore_cpu_realizefn,
                                     &mcc->parent_realize);
 
-    mcc->parent_reset = cc->reset;
-    cc->reset = tricore_cpu_reset;
+    cpu_class_set_parent_reset(cc, tricore_cpu_reset, &mcc->parent_reset);
     cc->class_by_name = tricore_cpu_class_by_name;
     cc->has_work = tricore_cpu_has_work;
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c65dcf9dd782..4856aee8eca6 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -184,8 +184,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, xtensa_cpu_realizefn,
                                     &xcc->parent_realize);
 
-    xcc->parent_reset = cc->reset;
-    cc->reset = xtensa_cpu_reset;
+    cpu_class_set_parent_reset(cc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;



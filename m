Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD435E7DD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:58:06 +0200 (CEST)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQ6n-0007qf-Mz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWQ56-0007GX-3K; Tue, 13 Apr 2021 16:56:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWQ52-0005yo-UZ; Tue, 13 Apr 2021 16:56:19 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKXLFF015497; Tue, 13 Apr 2021 16:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/mLVgJRlO4VURGg6dQ14sB3fs4hCcX+Kefc6S64V1Hw=;
 b=XJcoa++BxcPUSZ011Ud5cZmBVl0r7txlwZOslzJIx3hNgcjcEhpZIHXV7M4+ZLu2i/GY
 HQJaqgyeaYJOXfz/2fShxmZQUpuSiEQ8mmDUrjkaB8OTWFR5K8raUX/VGm+hLzZ88Bie
 x5nlTRpiVlooCRwpHEeeLUbt8pBa6okuTJ5sPGFL0Kkh2LeTOTB1Egzn4sOSWfgOkrxi
 pPUzPG2sL/5Dry90WXniegDcOb/3TVivkilCxgudDGcwFdw6xcMWpRc5MZBDKwKEfhB3
 AczAV8hVrljOuioNW8DPAKkqdIDfI6HuhR/9044gAriPlOn3m24KBbRwFLxtJ1cTV7+2 tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wetsdxkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:56:15 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DKXNEk015623;
 Tue, 13 Apr 2021 16:56:14 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wetsdxk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:56:14 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKquPd017964;
 Tue, 13 Apr 2021 20:56:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hjwa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:56:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13DKtlsf20250928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:55:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B64D74203F;
 Tue, 13 Apr 2021 20:56:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5042142042;
 Tue, 13 Apr 2021 20:56:09 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:56:09 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] linux-user/elfload: add s390x core dumping support
Date: Tue, 13 Apr 2021 22:56:08 +0200
Message-Id: <20210413205608.22587-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NzZN6irnS7TPX_yLQam9OjXLa7stwJWs
X-Proofpoint-ORIG-GUID: zuOsAxSzsQ6LW8Bz8wbdrRacE-vvCVjh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130137
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the following definitions required by the common code:

* ELF_NREG: with the value of sizeof(s390_regs) / sizeof(long).
* target_elf_gregset_t: define it like all the other arches do.
* elf_core_copy_regs(): similar to kernel's s390_regs_get().
* USE_ELF_CORE_DUMP.
* ELF_EXEC_PAGESIZE.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/elfload.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fd..4e45bd1539 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1385,6 +1385,39 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
     regs->gprs[15] = infop->start_stack;
 }
 
+/* See linux kernel: arch/s390/include/uapi/asm/ptrace.h (s390_regs).  */
+#define ELF_NREG 27
+typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
+
+enum {
+    TARGET_REG_PSWM = 0,
+    TARGET_REG_PSWA = 1,
+    TARGET_REG_GPRS = 2,
+    TARGET_REG_ARS = 18,
+    TARGET_REG_ORIG_R2 = 26,
+};
+
+static void elf_core_copy_regs(target_elf_gregset_t *regs,
+                               const CPUS390XState *env)
+{
+    int i;
+    uint32_t *aregs;
+
+    (*regs)[TARGET_REG_PSWM] = tswapreg(env->psw.mask);
+    (*regs)[TARGET_REG_PSWA] = tswapreg(env->psw.addr);
+    for (i = 0; i < 16; i++) {
+        (*regs)[TARGET_REG_GPRS + i] = tswapreg(env->regs[i]);
+    }
+    aregs = (uint32_t *)&((*regs)[TARGET_REG_ARS]);
+    for (i = 0; i < 16; i++) {
+        aregs[i] = tswap32(env->aregs[i]);
+    }
+    (*regs)[TARGET_REG_ORIG_R2] = 0;
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE 4096
+
 #endif /* TARGET_S390X */
 
 #ifdef TARGET_RISCV
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0F58CC9A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:18:31 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6Oc-0003Qx-3P
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oL6HB-0003sq-1S; Mon, 08 Aug 2022 13:10:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oL6H9-00036v-8Z; Mon, 08 Aug 2022 13:10:48 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278GrsPC018524;
 Mon, 8 Aug 2022 17:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eK/2XDxfvgQ8MCs0sYINp+wLkLDkk/mbyqt59U1gOA0=;
 b=oec1wby8ED5jsUiwSzV+720dfjKcIW/ok0URUQtfRhbes102U97eGDdRP8d5/ckPvsgS
 TzpWov4OYIWGYj9XSaICXu/w1dWagoopUem5jJyfPx9giV1B5siafswvLZUqN0BKUIEO
 YZ6rf0dA6qzf7IgzP2CLS54tMMSvPwxCgR1tZePviZd/OaMMVCTGf3oizQ6lpvIc3YYa
 Od1pPAXPb1FQgfQyQPz3Wt+Ftz1T3mJ8gbgcsYcndGBMXcbPygpbaNAq45ACqJdRV5fK
 s+1Dbw5UGLVYaJhs1H5Sq+JuGo9FSCDpEBZPK4my1obSSg1S6un+sac6C/qJugoBsmI+ lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6dpgj2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:32 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 278GtTL4027553;
 Mon, 8 Aug 2022 17:10:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6dpgj17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278Go4Sb028931;
 Mon, 8 Aug 2022 17:10:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3hsfx8jehk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 278HAPIq31457726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Aug 2022 17:10:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C45F6A404D;
 Mon,  8 Aug 2022 17:10:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E109A4040;
 Mon,  8 Aug 2022 17:10:25 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Aug 2022 17:10:25 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 2/4] target/s390x: Make translator stop before the end of a
 page
Date: Mon,  8 Aug 2022 19:10:20 +0200
Message-Id: <20220808171022.49439-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808171022.49439-1-iii@linux.ibm.com>
References: <20220808171022.49439-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OK-0vkzfasCtP0RKtCphwhyOGjkm3s0m
X-Proofpoint-GUID: kzXGkfbUr__DBSIlHXLJgMen2AnawMhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_11,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=945
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 include/exec/translator.h    | 10 ++++++++++
 target/s390x/tcg/translate.c | 15 +++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..d27f8c33b6 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e2ee005671..8e45a0e0d3 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6609,6 +6609,14 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     dc->insn_start = tcg_last_op();
 }
 
+static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
+{
+    uint64_t insn = ld_code2(env, s, pc);
+
+    return pc + get_ilen((insn >> 8) & 0xff);
+}
+
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUS390XState *env = cs->env_ptr;
@@ -6616,10 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        uint64_t page_start;
-
-        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
+        if (!is_same_page(dcbase, dc->base.pc_next) ||
+            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
+            dc->ex_value) {
             dc->base.is_jmp = DISAS_TOO_MANY;
         }
     }
-- 
2.37.1



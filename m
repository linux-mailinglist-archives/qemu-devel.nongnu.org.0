Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4809C2CE2FB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 00:50:54 +0100 (CET)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkyNA-0004E1-PL
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 18:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLS-0002W5-W7; Thu, 03 Dec 2020 18:49:07 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57482
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLQ-0003Lj-Hc; Thu, 03 Dec 2020 18:49:06 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id 40CE339003D2;
 Fri,  4 Dec 2020 00:48:59 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/11] hvf: x86: Remove unused definitions
Date: Fri,  4 Dec 2020 00:48:48 +0100
Message-Id: <20201203234857.21051-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hvf i386 has a few struct and cpp definitions that are never
used. Remove them.

Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/i386/hvf/hvf-i386.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index e0edffd077..e31938e5ff 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -21,21 +21,6 @@
 #include "cpu.h"
 #include "x86.h"
 
-#define HVF_MAX_VCPU 0x10
-
-extern struct hvf_state hvf_global;
-
-struct hvf_vm {
-    int id;
-    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
-};
-
-struct hvf_state {
-    uint32_t version;
-    struct hvf_vm *vm;
-    uint64_t mem_quota;
-};
-
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
 
@@ -75,7 +60,6 @@ hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 
 /* Host specific functions */
 int hvf_inject_interrupt(CPUArchState *env, int vector);
-int hvf_vcpu_run(struct hvf_vcpu_state *vcpu);
 #endif
 
 #endif
-- 
2.24.3 (Apple Git-128)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ABB34B01A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:23:20 +0100 (CET)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPszH-0000Sl-S0
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHU-0006pv-F6
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:45874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHQ-00019I-CW
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 256D3AF26;
 Fri, 26 Mar 2021 19:37:49 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 39/65] target/arm: remove kvm-stub.c
Date: Fri, 26 Mar 2021 20:36:35 +0100
Message-Id: <20210326193701.5981-40-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the functions used in machine.c are now protected via
if (kvm_enabled()), so the stub is not needed.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/kvm-stub.c | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 target/arm/kvm-stub.c

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
deleted file mode 100644
index 56a7099e6b..0000000000
--- a/target/arm/kvm-stub.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU KVM ARM specific function stubs
- *
- * Copyright Linaro Limited 2013
- *
- * Author: Peter Maydell <peter.maydell@linaro.org>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_arm.h"
-
-bool write_kvmstate_to_list(ARMCPU *cpu)
-{
-    abort();
-}
-
-bool write_list_to_kvmstate(ARMCPU *cpu, int level)
-{
-    abort();
-}
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E4315178
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:23:25 +0100 (CET)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TvI-0007QI-4h
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWG-0001bj-6n
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:32 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56170 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWE-0007xu-JL
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:31 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 47B9A412DE;
 Tue,  9 Feb 2021 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1612879048; x=1614693449; bh=/3MxvLKcuDTX9JZ38dfFG0H+Z8dXBqvJ1KF
 Kif8qPzA=; b=VX3/8F75RUORXqjlKCWif+NOIXzYiPk2Af4WBxeTcNmAC+Z6arp
 vIt96Bp9ONWm9HPr30mnxMcjR7cjfq7qc4PYsWQCRVAGy6V3HrFX1RjG8M60flln
 UZMQ6rS9dbylkN08TNHgwVkN1QMXPFHPV9L9NNXrY7erW83ok14ceBrI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRylZDIBZvpw; Tue,  9 Feb 2021 16:57:28 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E8ECE412ED;
 Tue,  9 Feb 2021 16:57:26 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 16:57:26 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL hvf 3/5] hvf: x86: Remove unused definitions
Date: Tue, 9 Feb 2021 16:57:20 +0300
Message-ID: <20210209135722.4891-4-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209135722.4891-1-r.bolshakov@yadro.com>
References: <20210209135722.4891-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The hvf i386 has a few struct and cpp definitions that are never
used. Remove them.

Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20210120224444.71840-3-agraf@csgraf.de>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
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
2.30.0



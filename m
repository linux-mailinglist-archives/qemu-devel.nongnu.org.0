Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4142D5B28
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:04:33 +0100 (CET)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLcW-0003rh-A8
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knKob-0002QC-Q4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:12:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:47458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knKoZ-0006US-0g
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:12:57 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B62AAAD6A;
 Thu, 10 Dec 2020 12:12:43 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v10 14/32] cpu: Remove unnecessary noop methods
Date: Thu, 10 Dec 2020 13:12:08 +0100
Message-Id: <20201210121226.19822-15-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210121226.19822-1-cfontana@suse.de>
References: <20201210121226.19822-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/cpu.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 576fa1d7ba..994a12cb35 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -199,15 +199,6 @@ static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
     return target_words_bigendian();
 }
 
-static void cpu_common_noop(CPUState *cpu)
-{
-}
-
-static bool cpu_common_exec_interrupt(CPUState *cpu, int int_req)
-{
-    return false;
-}
-
 #if !defined(CONFIG_USER_ONLY)
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
@@ -410,11 +401,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
-    k->debug_excp_handler = cpu_common_noop;
     k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
-    k->cpu_exec_enter = cpu_common_noop;
-    k->cpu_exec_exit = cpu_common_noop;
-    k->cpu_exec_interrupt = cpu_common_exec_interrupt;
     k->adjust_watchpoint_address = cpu_adjust_watchpoint_address;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
-- 
2.26.2



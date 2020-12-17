Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998792DD8FC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 20:03:02 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyYH-0007Kf-Es
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 14:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIb-0006Vf-9j
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIZ-000209-Ij
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEG86ZsQNf/+4LIkBiTmnAufwFPZKTquQ/8dOW7iK+g=;
 b=JO4DtDJs9/tad4D+YAoIIN7F3WEFmkE9kSeEKaN3cg9UiFZ4KGf/rhNRJz2MwamrOgr0fG
 ykOA/eYpar1/w7YRq72oc1uqOzOsMYxH9T5qvK1++QTFCmvPVMxpSDR458z4q0C6N+1ODc
 Zlgb7KWyQZ3x6/urjTG1/gBA1fCqTb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-KPJAsWRqN7e3yDTe5NSQlg-1; Thu, 17 Dec 2020 13:46:44 -0500
X-MC-Unique: KPJAsWRqN7e3yDTe5NSQlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EB501005504;
 Thu, 17 Dec 2020 18:46:43 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56BD1100238C;
 Thu, 17 Dec 2020 18:46:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 17/17] cpu: Remove unnecessary noop methods
Date: Thu, 17 Dec 2020 13:46:20 -0500
Message-Id: <20201217184620.3945917-18-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the previous commits we made cpu_exec_* and debug_excp_handler
optional, so we can now remove these no-op handlers.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201212155530.23098-13-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/cpu.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5c89c858aa..7553411653 100644
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
@@ -425,11 +416,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
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
2.28.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F534BD9A8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:24:18 +0100 (CET)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7jl-0006Ei-2G
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OJ-0004QC-QR
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OH-0000wt-J0
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKXos97Q8L92+zP8MP4iLwBvbJCMJlvYVA4wypHnKXI=;
 b=XJqazEP1hw6aJZdLupNppEs80nKtXtfwKow08C58t/eKEj+j5/WFQKzpDJjzTGkxrzUi6C
 wQTznv0wYtpai/85Ba90aW3SeG8qjeTPq27tS0zvvgw5wgliAap2hi0rQ0k6kjOMqi2iSM
 Vxp3PT3QMHDOoZaEFynDWRfNGpAZXSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-F3TuscotMvikYB8NvxPmGg-1; Mon, 21 Feb 2022 07:01:58 -0500
X-MC-Unique: F3TuscotMvikYB8NvxPmGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD6E0801AC5;
 Mon, 21 Feb 2022 12:01:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5378F73165;
 Mon, 21 Feb 2022 12:01:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/25] target: Add missing "qemu/timer.h" include
Date: Mon, 21 Feb 2022 13:00:03 +0100
Message-Id: <20220221120008.600114-21-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

timer_new_ns(), cpu_get_host_ticks() and NANOSECONDS_PER_SECOND are
declared in "qemu/timer.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220207082756.82600-8-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/cpu.c      | 1 +
 target/arm/helper.c   | 1 +
 target/hppa/cpu.c     | 1 +
 target/riscv/csr.c    | 1 +
 target/sparc/helper.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a256..525974b936 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5f80988c9..795b35532f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
+#include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 37b763fca0..5f46ba801e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fe2c8dd40e..a938760a3f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index c7bcaa3a20..c4358bba84 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "qemu/timer.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 
-- 
2.27.0



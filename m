Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB56A9410
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY173-0003UV-KQ; Fri, 03 Mar 2023 03:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pY170-0003KS-5m
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pY16x-00044v-C8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677833392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k3oYU9d9IlKOnDdtR8Hu0nEURPulHUyJyKtBe9W5Q4w=;
 b=RjotrOrn+kAdnL0TLhtncDaVdqG7oqRnyTBD7g1KWn0dnsUXShGWEJaI4NUkDh8ncQnhJR
 O+PFF9vXvvhhkeEG9huA9JGJeGrv/K0HGmFjE90td6VZZWfliZK06Y5J5YjW58qoGvxoUs
 5I57lMewYXrb5VaVRvVFaflFeA7f/7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-FPvFsj2BOs-kImvNijSA5g-1; Fri, 03 Mar 2023 03:49:50 -0500
X-MC-Unique: FPvFsj2BOs-kImvNijSA5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 732B218A6461;
 Fri,  3 Mar 2023 08:49:50 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4D46C16027;
 Fri,  3 Mar 2023 08:49:49 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	pbonzini@redhat.com,
	philmd@linaro.org
Subject: [PATCH v2] tcg: Include "qemu/timer.h" for profile_getclock
Date: Fri,  3 Mar 2023 08:49:48 +0000
Message-Id: <20230303084948.3351546-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When CONFIG_PROFILER is set there are various undefined references to
profile_getclock.  Include the header which defines this function.

For example:

../tcg/tcg.c: In function ‘tcg_gen_code’:
../tcg/tcg.c:4905:51: warning: implicit declaration of function ‘profile_getclock’ [-Wimplicit-function-declaration]
 4905 |     qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
      |                                                   ^~~~~~~~~~~~~~~~

Thanks: Philippe Mathieu-Daudé
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 accel/tcg/tcg-accel-ops.c | 1 +
 accel/tcg/translate-all.c | 1 +
 softmmu/runstate.c        | 1 +
 tcg/tcg.c                 | 1 +
 4 files changed, 4 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index aeb1cbaf65..af35e0d092 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -31,6 +31,7 @@
 #include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
+#include "qemu/timer.h"
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4b5abc0f44..a5bea8f99c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -51,6 +51,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/timer.h"
 #include "exec/log.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index f9ad88e6a7..9b3611d56d 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -46,6 +46,7 @@
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "qemu/sockets.h"
+#include "qemu/timer.h"
 #include "qemu/thread.h"
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5cccc06ae3..6b830ade4c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -36,6 +36,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/timer.h"
 
 /* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
-- 
2.39.2



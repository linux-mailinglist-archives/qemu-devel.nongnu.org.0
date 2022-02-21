Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BE4BD9B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:38:23 +0100 (CET)
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7xJ-0000tG-Dq
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OJ-0004NS-4A
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OH-0000wo-0j
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2f5TuqMDLl63qi5MelAUJwA0P80bG4KDuZy1oibWWB0=;
 b=dHOP6iA0Q9l3uT6zZ8YqmyqsrwwOKdR4RRp7BVF9aYWPt/x84p3ewyhXr8n5jVrnSDwjBP
 rp0yIZS9YxqPORV8dSntzuNXIM1Gh3vQnSSWilJipN0jU3EeDeXYS4NbsZEV0rTPISuw32
 xyQyQf64tjPL7gNKqCRnBY9dMwcdTY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-srjjehNoNVWr_VIwsTr9MQ-1; Mon, 21 Feb 2022 07:02:01 -0500
X-MC-Unique: srjjehNoNVWr_VIwsTr9MQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FFA61F2DC;
 Mon, 21 Feb 2022 12:02:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA7EC73160;
 Mon, 21 Feb 2022 12:01:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] softmmu/runstate: Clean headers
Date: Mon, 21 Feb 2022 13:00:05 +0100
Message-Id: <20220221120008.600114-23-thuth@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add the missing 'qemu/log.h' header and remove the
unused 'exec/exec-all.h' one.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-14-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365a..3cb2758b33 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -30,7 +30,6 @@
 #include "crypto/cipher.h"
 #include "crypto/init.h"
 #include "exec/cpu-common.h"
-#include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "hw/boards.h"
 #include "migration/misc.h"
@@ -44,6 +43,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/job.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "qemu/sockets.h"
-- 
2.27.0



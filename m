Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5C4BD9A2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:20:30 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7g4-0001JL-US
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:20:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O8-00042e-Ro
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O5-0000uS-OK
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h22kKYnmQlSIeibPX1ytXm3gSNWbwQINK5KwHp87Nuw=;
 b=XI3o7HCRR/06E7Tn4VSxYTnbR6ICxT4901nko3rpngFelcQ83XUfd8kZord+o0gcxxFErJ
 QVcD6zftLyPWYdopUNRGc8pF9RdTq0kn9IcecFUrdtBIYMvpj57gPbk8iEWATJUoAbxRLQ
 45PIYX5rv4cUESTjTcpeMYA1b+XM3O4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-k74x0YkdPtCS2eLhgOHuBw-1; Mon, 21 Feb 2022 07:01:49 -0500
X-MC-Unique: k74x0YkdPtCS2eLhgOHuBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6223B1091DA1;
 Mon, 21 Feb 2022 12:01:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E892F7316D;
 Mon, 21 Feb 2022 12:01:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/25] hw/remote: Add missing include
Date: Mon, 21 Feb 2022 12:59:58 +0100
Message-Id: <20220221120008.600114-16-thuth@redhat.com>
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
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Currently "qemu/error-report.h" is implicitly included, however
if headers in include/ get refactored, we get:

  hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
  hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
    183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
        |         ^~~~~~~~~~~~
        |         error_report_err

Add the missing "qemu/error-report.h" header to avoid that.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220207082756.82600-3-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/remote/proxy-memory-listener.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 882c9b4854..0e893f3189 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -16,6 +16,7 @@
 #include "exec/cpu-common.h"
 #include "exec/ram_addr.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/remote/mpqemu-link.h"
 #include "hw/remote/proxy-memory-listener.h"
 
-- 
2.27.0



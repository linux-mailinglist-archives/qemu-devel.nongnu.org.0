Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2338097B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:26:47 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWty-0006s6-Cs
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWju-000186-IB
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjq-0005FH-By
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V06JyM5hB4aiy1XWsA8HEuhWvMq+bzeBj4OjUp9zVmU=;
 b=AZtF5IWwPq1ScFIc3tFptxQkHmqcL7m1Zh2ZKgo1ECnedDWaq3EQ0pxiO7ts0igfOEWLZ9
 Qx6GtPIYbEQobpPeKMnU3M8uT+yjh7jUsI7zUxn6GPKuo3ZEJ6tpSGZaVjTrhSfIvt0sVd
 JVNkA6i3KoW6AAar9GOQ8Ute5ugANss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-CU5fzaZuPay4UZlxQJ_pbQ-1; Fri, 14 May 2021 08:16:13 -0400
X-MC-Unique: CU5fzaZuPay4UZlxQJ_pbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7C15107ACC7;
 Fri, 14 May 2021 12:16:12 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72E1B60CCF;
 Fri, 14 May 2021 12:16:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/20] configure: Poison all current target-specific #defines
Date: Fri, 14 May 2021 14:15:15 +0200
Message-Id: <20210514121518.832729-18-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generating a lot of target-specific defines in the *-config-devices.h
and *-config-target.h files. Using them in common code is wrong and leads
to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
as expected. To avoid these issues, we are already poisoning many of the
macros in include/exec/poison.h - but it's cumbersome to maintain this
list manually. Thus let's generate an additional list of poisoned macros
automatically from the current config switches - this should give us a
much better test coverage via the different CI configurations.

Note that CONFIG_TCG (which is also defined in config-host.h) and
CONFIG_USER_ONLY are special, so we have to filter these out.

Message-Id: <20210414112004.943383-5-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile              | 2 +-
 configure             | 7 +++++++
 include/exec/poison.h | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bcbbec71a1..4cab10a2a4 100644
--- a/Makefile
+++ b/Makefile
@@ -213,7 +213,7 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak config-host.h*
+	rm -f config-host.mak config-host.h* config-poison.h
 	rm -f tests/tcg/config-*.mak
 	rm -f config-all-disas.mak config.status
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
diff --git a/configure b/configure
index f05ca143b3..0e4233fd8a 100755
--- a/configure
+++ b/configure
@@ -6473,6 +6473,13 @@ if test -n "${deprecated_features}"; then
     echo "  features: ${deprecated_features}"
 fi
 
+# Create list of config switches that should be poisoned in common code...
+# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
+sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
+    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
+    *-config-devices.h *-config-target.h | \
+    sort -u > config-poison.h
+
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
 #!/bin/sh
diff --git a/include/exec/poison.h b/include/exec/poison.h
index a527def5f0..7ad4ad18e8 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -4,6 +4,8 @@
 #ifndef HW_POISON_H
 #define HW_POISON_H
 
+#include "config-poison.h"
+
 #pragma GCC poison TARGET_I386
 #pragma GCC poison TARGET_X86_64
 #pragma GCC poison TARGET_AARCH64
-- 
2.27.0



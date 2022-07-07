Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C756A886
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:46:42 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UeH-000057-4i
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UW2-0008UL-52
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVp-0006nr-CZ
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5K2S0LswOphsaHudz/nfJSDJC4MuQQIoZkbgm3JRDig=;
 b=fdnPrFZodAUh8rufrgNnqarJ9YKd8J2IbBN9hGSLe2Y1UXnHz6xcPZohR1pvNh6dKavZYa
 1f2OolFPCl4J5Nh15saYnAOMgTs8Z4e8QN681JNqA4XP93AwNlvvdLtnyR/r8W18M148b1
 zl7slPX+vbn2gP7QQx9Rmn26RmhJKQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-mzX1WXhcMHelPb8oIYLGgw-1; Thu, 07 Jul 2022 12:37:51 -0400
X-MC-Unique: mzX1WXhcMHelPb8oIYLGgw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7173F1833BE7;
 Thu,  7 Jul 2022 16:37:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30A23492C3B;
 Thu,  7 Jul 2022 16:37:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 5/9] tests/style: check for commonly doubled up words
Date: Thu,  7 Jul 2022 17:37:16 +0100
Message-Id: <20220707163720.1421716-6-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-1-berrange@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This style check looks for cases where the words

  the then in an on if is it but for or at and do to

are repeated in a sentence. It uses a multi-line match to catch the
especially common mistake in docs where the last word on a line is
repeated as the first word of the next line.

There are inevitably be some false positives with this check, for
example, some docs data tables have the same word in adjacent columns.

There are a few different ways to express this text as a regex which
have wildly different execution time. This impl was carefully chosen
to attempt to minimize matching time.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/style.yml | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/style.yml b/tests/style.yml
index 704227d8e9..d06c55bb29 100644
--- a/tests/style.yml
+++ b/tests/style.yml
@@ -91,3 +91,33 @@ int_assign_bool:
   files: \.c$
   prohibit: \<int\>.*= *(true|false)\b
   message: use bool type for boolean values
+
+double_words:
+  multiline: true
+  prohibit:
+    terms:
+      - the\s+the
+      - then\s+then
+      - in\s+in
+      - an\s+an
+      - on\s+on
+      - if\s+if
+      - is\s+is
+      - it\s+it
+      - but\s+but
+      - for\s+for
+      - or\s+or
+      - at\s+at
+      - and\s+and
+      - do\s+do
+      - to\s+to
+      - can\s+can
+    prefix: \b(?<!=|@|'|")
+    suffix: \b(?!=|@|'|")
+  message: doubled words
+  ignore:
+    - disas/sparc\.c
+    - pc-bios/
+    - qemu-options\.hx
+    - scripts/checkpatch\.pl
+    - tests/qtest/arm-cpu-features\.c
\ No newline at end of file
-- 
2.36.1



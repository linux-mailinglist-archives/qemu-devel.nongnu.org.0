Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E95659D6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:28:55 +0200 (CEST)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O0M-0006qG-4w
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nuz-0005Ia-EN
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nux-0002N6-W5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKkjsT0N+2AV09zWSzaEt8xr3snRI2NIlh81+SM9ElA=;
 b=Hhw5bxULmULZwOE3nPEN7n3Te37h3iLceuc2XRp4jFUy241ssy7XerPv+qhOLwjvOoF7pg
 zuReFnvVgjXRnF8opxdNd6EteAy5d+LOtGu7nSIeR8BdE7/J+tpzkGnkEmx1nBoSB56RC9
 VPKuTHXhRZXgkjQ5dhwsOvfIN1RhQtc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-2b_hMFgxNSKsUNA01CU8KA-1; Mon, 04 Jul 2022 11:23:18 -0400
X-MC-Unique: 2b_hMFgxNSKsUNA01CU8KA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A43123C0CD47;
 Mon,  4 Jul 2022 15:23:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51727C28100;
 Mon,  4 Jul 2022 15:23:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 5/7] tests/style: check for commonly doubled up words
Date: Mon,  4 Jul 2022 16:23:01 +0100
Message-Id: <20220704152303.760983-6-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-1-berrange@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

are repeated in a sentence. It doesn't use the simple regex match logic
because it needs to match repeats across lines, so has a custom crafted
rule.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/style-excludes.mak | 12 ++++++++++++
 tests/style.mak          | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tests/style-excludes.mak b/tests/style-excludes.mak
index 32c0e9c328..931dd03a64 100644
--- a/tests/style-excludes.mak
+++ b/tests/style-excludes.mak
@@ -2,3 +2,15 @@
 #
 # Filenames that should be excluded from specific
 # style checks performed by style.mak
+
+exclude_file_name_regexp--sc_prohibit_doubled_word = \
+	disas/sparc\.c \
+	hw/char/terminal3270\.c \
+	include/crypto/afsplit\.h \
+	qemu-options\.hx \
+	scripts/checkpatch\.pl \
+	target/s390x/tcg/insn-data\.def \
+	pc-bios/slof\.bin \
+	tests/qemu-iotests/142(\.out)? \
+	tests/qtest/arm-cpu-features\.c \
+	ui/cursor\.c
diff --git a/tests/style.mak b/tests/style.mak
index ae658395c9..4056bde619 100644
--- a/tests/style.mak
+++ b/tests/style.mak
@@ -28,3 +28,27 @@ sc_int_assign_bool:
 	@prohibit='\<int\>.*= *(true|false)\b' \
 	halt='use bool type for boolean values' \
 	$(_sc_search_regexp)
+
+prohibit_doubled_words_ = \
+    the then in an on if is it but for or at and do to can
+# expand the regex before running the check to avoid using expensive captures
+prohibit_doubled_word_expanded_ = \
+    $(join $(prohibit_doubled_words_),$(addprefix \s+,$(prohibit_doubled_words_)))
+prohibit_doubled_word_RE_ ?= \
+    /\b(?:$(subst $(_sp),|,$(prohibit_doubled_word_expanded_)))\b/gims
+prohibit_doubled_word_ =						\
+    -e 'while ($(prohibit_doubled_word_RE_))'				\
+    $(perl_filename_lineno_text_)
+
+# Define this to a regular expression that matches
+# any filename:dd:match lines you want to ignore.
+# The default is to ignore no matches.
+ignore_doubled_word_match_RE_ ?= ^$$
+
+sc_prohibit_doubled_word:
+	@$(VC_LIST_EXCEPT)						\
+	  | xargs perl -n -0777 $(prohibit_doubled_word_)		\
+	  | $(GREP) -vE '$(ignore_doubled_word_match_RE_)'		\
+	  | $(GREP) .							\
+	  && { echo '$(ME): doubled words' 1>&2; exit 1; }		\
+	  || :
-- 
2.36.1



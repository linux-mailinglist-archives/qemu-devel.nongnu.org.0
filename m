Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7C4AD5D6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:52:05 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO6O-0002hu-PK
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNVB-0006hN-57
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNV9-0003Y4-Er
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644315212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaHUvzjFbj1WpZOCy8SCdLGzCdMLYST/KTk2UyzmokA=;
 b=W/HdC+Qld54k2ACxKOVinX8qOBwqBFpdp2HtsbwR3GN+YIaCxjjWDzPNi626VBOAQg1dOR
 zwfAvr9mKQoNcypCyKnO2hf1xjmmgyN/2tWFQAb5nKCsfL2hlQx67+wJHPFQGlvb7h+Hd+
 DiOkcn4PKiQztyeE8Wugwj6b9cMwtKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531--v8wMULdMEqPnNNKk97WAw-1; Tue, 08 Feb 2022 05:13:29 -0500
X-MC-Unique: -v8wMULdMEqPnNNKk97WAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55216127C;
 Tue,  8 Feb 2022 10:13:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 123D82856D;
 Tue,  8 Feb 2022 10:13:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 6/6] tests: Remove check-block.sh
Date: Tue,  8 Feb 2022 11:13:11 +0100
Message-Id: <20220208101311.1511083-7-thuth@redhat.com>
In-Reply-To: <20220208101311.1511083-1-thuth@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the iotests are added by the meson.build file already,
we do not need the check-block.sh wrapper script anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/check-block.sh | 73 --------------------------------------------
 1 file changed, 73 deletions(-)
 delete mode 100755 tests/check-block.sh

diff --git a/tests/check-block.sh b/tests/check-block.sh
deleted file mode 100755
index af0c574812..0000000000
--- a/tests/check-block.sh
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-
-if [ "$#" -eq 0 ]; then
-    echo "Usage: $0 fmt..." >&2
-    exit 99
-fi
-
-# Honor the SPEED environment variable, just like we do it for "meson test"
-format_list="$@"
-if [ "$SPEED" = "slow" ] || [ "$SPEED" = "thorough" ]; then
-    group=
-else
-    group="-g auto"
-fi
-
-skip() {
-    echo "1..0 #SKIP $*"
-    exit 0
-}
-
-if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
-    skip "GPROF is enabled ==> Not running the qemu-iotests."
-fi
-
-# Disable tests with any sanitizer except for specific ones
-SANITIZE_FLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
-ALLOWED_SANITIZE_FLAGS="safe-stack cfi-icall"
-#Remove all occurrencies of allowed Sanitize flags
-for j in ${ALLOWED_SANITIZE_FLAGS}; do
-    TMP_FLAGS=${SANITIZE_FLAGS}
-    SANITIZE_FLAGS=""
-    for i in ${TMP_FLAGS}; do
-        if ! echo ${i} | grep -q "${j}" 2>/dev/null; then
-            SANITIZE_FLAGS="${SANITIZE_FLAGS} ${i}"
-        fi
-    done
-done
-if echo ${SANITIZE_FLAGS} | grep -q "\-fsanitize" 2>/dev/null; then
-    # Have a sanitize flag that is not allowed, stop
-    skip "Sanitizers are enabled ==> Not running the qemu-iotests."
-fi
-
-if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
-    skip "No qemu-system binary available ==> Not running the qemu-iotests."
-fi
-
-if ! command -v bash >/dev/null 2>&1 ; then
-    skip "bash not available ==> Not running the qemu-iotests."
-fi
-
-if LANG=C bash --version | grep -q 'GNU bash, version [123]' ; then
-    skip "bash version too old ==> Not running the qemu-iotests."
-fi
-
-cd tests/qemu-iotests
-
-# QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
-export QEMU_CHECK_BLOCK_AUTO=1
-export PYTHONUTF8=1
-# If make was called with -jN we want to call ./check with -j N. Extract the
-# flag from MAKEFLAGS, so that if it absent (or MAKEFLAGS is not defined), JOBS
-# would be an empty line otherwise JOBS is prepared string of flag with value:
-# "-j N"
-# Note, that the following works even if make was called with "-j N" or even
-# "--jobs N", as all these variants becomes simply "-jN" in MAKEFLAGS variable.
-JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
-
-ret=0
-for fmt in $format_list ; do
-    ${PYTHON} ./check $JOBS -tap -$fmt $group || ret=1
-done
-
-exit $ret
-- 
2.27.0



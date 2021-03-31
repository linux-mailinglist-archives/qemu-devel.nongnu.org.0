Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75C35044F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:17:23 +0200 (CEST)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdX0-0005PH-MG
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRdMN-0003nx-Q4
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRdMM-0004wP-9l
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617206780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xroq/il8AB4HaB8O2fW6RuqwQ15JUcgAz34JukMRSFY=;
 b=Fu6Wuc1mmzNYVEwQSKEoM45QczSn0nWTkI951oZrdcoY9aXoB/L9meFcbm+V5o6AGXcTLB
 YjdnGf8OCNC7SQuOUMYyhewCREl5Pfzae5bHYJi2rc03HOA0r80eKmjhFdwdrlYRRDhu5X
 PTasskxRuG3TOSpED+aVCm9d1YvnR0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-G7Ytz2ILM6iv2SKSlTi3Ew-1; Wed, 31 Mar 2021 12:06:18 -0400
X-MC-Unique: G7Ytz2ILM6iv2SKSlTi3Ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7E7180FCB1;
 Wed, 31 Mar 2021 16:06:17 +0000 (UTC)
Received: from thuth.com (ovpn-112-75.ams2.redhat.com [10.36.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BCAE5C1BB;
 Wed, 31 Mar 2021 16:05:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitlab-ci.yml: Use unrecoverable address sanitizer
Date: Wed, 31 Mar 2021 18:05:46 +0200
Message-Id: <20210331160546.3071575-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make sure that errors don't go unnoticed by using the unrecoverable
sanitizer switch here, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4c43dd2570..846d3932cf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -661,7 +661,8 @@ build-oss-fuzz:
     IMAGE: fedora
   script:
     - mkdir build-oss-fuzz
-    - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
+    - CC="clang" CXX="clang++"
+      CFLAGS="-fsanitize=address -fno-sanitize-recover=address"
       ./scripts/oss-fuzz/build.sh
     - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
     - for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f
-- 
2.27.0



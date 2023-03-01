Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF266A6B9B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:19:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKUU-00080T-2L; Wed, 01 Mar 2023 06:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXKUQ-000804-1K
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXKUO-0002Q2-Id
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677669555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hxbpCj/Ij2gf3SM9skuBR127LhBc/arF8xjuqJKGsxY=;
 b=FOARK0uYDqe7vj0UlFkLMxUwK3E8t/9sHrYpsaeZ1P72brkUNNUNhRuFtWk+Ffq9/Ou0A5
 2GJkM1nk4/o88blHbxK6buGgIFi9aNFVH1akUEjUsD7ndSDA0ZS7s1vakUReEMktRIAdYs
 Bm49vaCrTkNvddQgOtFmHXLbjlFYX0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-NmsI5_jZOqWrt73ZezR9yA-1; Wed, 01 Mar 2023 06:19:12 -0500
X-MC-Unique: NmsI5_jZOqWrt73ZezR9yA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8718618A6462;
 Wed,  1 Mar 2023 11:19:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1FEBC15BAD;
 Wed,  1 Mar 2023 11:19:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] Makefile: qemu-bundle is a directory
Date: Wed,  1 Mar 2023 12:19:10 +0100
Message-Id: <20230301111910.1660-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

So make distclean should remove it with -rf, not -f alone.

It has been that way since it was included.

ommit cf60ccc3306ca4726cbd286a156863863b00ff4f
Author: Akihiko Odaki <akihiko.odaki@gmail.com>
Date:   Fri Jun 24 23:50:37 2022 +0900

    cutils: Introduce bundle mechanism

Fixes: cf60ccc3306ca4726cbd286a156863863b00ff4f

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ce2f83a684..e421f8a1f4 100644
--- a/Makefile
+++ b/Makefile
@@ -220,7 +220,7 @@ qemu-%.tar.bz2:
 
 distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak Makefile.prereqs qemu-bundle
+	rm -f config-host.mak Makefile.prereqs
 	rm -f tests/tcg/*/config-target.mak tests/tcg/config-host.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
@@ -230,7 +230,7 @@ distclean: clean recurse-distclean
 	rm -f Makefile.ninja Makefile.mtest build.ninja.stamp meson.stamp
 	rm -f config.log
 	rm -f linux-headers/asm
-	rm -Rf .sdk
+	rm -Rf .sdk qemu-bundle
 
 find-src-path = find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune -o \
 	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72253B4701
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 17:53:54 +0200 (CEST)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwo9R-0008ED-Uu
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 11:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo2F-0001K3-Kb
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo2D-0007iK-U2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624635985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjwgk7ASMn8f16JM1x6tVr7pnXnzSF1MaHSSMByJhIU=;
 b=FHg6QNhZ5wNfhw3iiKZC3ctdndZKyxcj+xnhy/yZzborKb3jeNNC9s4Pj/KVVktrrky+7z
 9Q2i1CPZd5NXwVQSry9PINBAXQ38BfqQhAU7eXwKmr52fEmIBsN0dmmRnnGDI2Gr8Jy8O2
 YTwvJg1gFf1kszHhMSQyR0FOR21mVHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-5eE2jg3YODeQyVqDePrbpQ-1; Fri, 25 Jun 2021 11:46:24 -0400
X-MC-Unique: 5eE2jg3YODeQyVqDePrbpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC736804141;
 Fri, 25 Jun 2021 15:46:22 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FCE51A872;
 Fri, 25 Jun 2021 15:46:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] python: Update help text on 'make clean',
 'make distclean'
Date: Fri, 25 Jun 2021 11:45:39 -0400
Message-Id: <20210625154540.783306-11-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-1-jsnow@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just for visual parity with everything else.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 4ed37c29f0..06f78f760a 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -37,11 +37,14 @@ help:
 	@echo "make venv"
 	@echo "    Creates a simple venv for check-venv. ($(QEMU_VENV_DIR))"
 	@echo ""
-	@echo "make clean:      remove package build output."
+	@echo "make clean:"
+	@echo "    Remove package build output."
 	@echo ""
-	@echo "make distclean:  remove venv files, qemu package forwarder,"
-	@echo "                 built distribution files, and everything"
-	@echo "                 from 'make clean'."
+	@echo "make distclean:"
+	@echo "    remove pipenv/venv files, qemu package forwarder,"
+	@echo "    built distribution files, and everything from 'make clean'."
+	@echo ""
+	@echo -e "Have a nice day ^_^\n"
 
 pipenv: .venv
 .venv: Pipfile.lock
-- 
2.31.1



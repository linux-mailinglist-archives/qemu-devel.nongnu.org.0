Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E933B46E9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 17:48:19 +0200 (CEST)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwo42-0004DH-Gp
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 11:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo2B-00016C-Lz
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo29-0007eV-Ca
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624635980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYMhjGKIKH8hQDwmRa9+nxST+1BHneCyAwTSrCErglc=;
 b=eRulwgP8+ipiBOcvdTwP/x4ncTtralScIdmaik7cj6JjYgjIZuW//Qp7dF/+A+bF2CGjYS
 n5N/M4DbclU98hVcNJBHMkkhzCdj0oHhxVEwoy1k+0xK0kCsdSVvDdNN8QGGqDFX6QR3/W
 6+PgveJo17WPIi5mPnWzPMgc8Mq+/4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-fnaFXw2sMy-DJe7GZnErmQ-1; Fri, 25 Jun 2021 11:46:19 -0400
X-MC-Unique: fnaFXw2sMy-DJe7GZnErmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC84804141;
 Fri, 25 Jun 2021 15:46:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0431A86F;
 Fri, 25 Jun 2021 15:46:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] python: Update help text on 'make check', 'make develop'
Date: Fri, 25 Jun 2021 11:45:38 -0400
Message-Id: <20210625154540.783306-10-jsnow@redhat.com>
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

Update for visual parity with the other targets.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 76bb24e671..4ed37c29f0 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -22,10 +22,14 @@ help:
 	@echo "    These tests use the newest dependencies."
 	@echo "    Requires: Python 3.x"
 	@echo ""
-	@echo "make develop:    Install deps for 'make check', and"
-	@echo "                 the qemu libs in editable/development mode."
+	@echo "make check:"
+	@echo "    Run tests in your *current environment*."
+	@echo "    Performs no environment setup of any kind."
 	@echo ""
-	@echo "make check:      run linters using the current environment."
+	@echo "make develop:"
+	@echo "    Install deps needed for for 'make check',"
+	@echo "    and install the qemu package in editable mode."
+	@echo "    (Can be used in or outside of a venv.)"
 	@echo ""
 	@echo "make pipenv"
 	@echo "    Creates pipenv's virtual environment (.venv)"
-- 
2.31.1



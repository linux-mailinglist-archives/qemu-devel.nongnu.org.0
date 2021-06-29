Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E505A3B76B6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:52:33 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGyO-0001io-V3
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpj-0004CB-8Y
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpg-0006Lx-Fv
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ca9iKz45sUko8niMbBQYKNRFNGsoAOpVoH3FqjAQRo=;
 b=NhHn6sNr8y5EfqKSi099wY9Lc4xUE4tZaKFr5sdQhjBG7cxXXbSR8FG0/kT7RMjix32UHh
 lDfzHdC/0EGIebsI7Pd4U/9VLHaQ0t5Fkp/weo6PW2IyxX7XmgqVXkx24Yr+8yMkEDKL9v
 yY0j2ruCHwBuQcNA6gtO7+KyHqV3bEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-SVohXCQQOuqOQyjeZZmHLg-1; Tue, 29 Jun 2021 12:43:27 -0400
X-MC-Unique: SVohXCQQOuqOQyjeZZmHLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990451084F57;
 Tue, 29 Jun 2021 16:43:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 974C1163C6;
 Tue, 29 Jun 2021 16:43:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] python: Update help text on 'make check',
 'make develop'
Date: Tue, 29 Jun 2021 12:42:51 -0400
Message-Id: <20210629164253.1272763-11-jsnow@redhat.com>
In-Reply-To: <20210629164253.1272763-1-jsnow@redhat.com>
References: <20210629164253.1272763-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update for visual parity with the other targets.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 8f8e1999c0..a14705d12e 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -21,10 +21,14 @@ help:
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



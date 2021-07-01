Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDA3B8C06
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:16:46 +0200 (CEST)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymFx-0005dZ-PK
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9J-0008HH-3E
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9C-000694-Ou
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFhkixY7ViPWU3pUraNy8pp45SIxT08nfRjSdaCCza4=;
 b=Ovf9mfC1aT5gHytXy7lJEOyF07xavDRLsX+A97Kubx8IevUNPro6M01kmQviNaaEnMGOAm
 unNCSEysM8YnW5lvODxCSFVS3ZDlQhU5wt4+exrn95efImWSEN4Hoo9JW8SDycHKBL/qd9
 gRvWKOWnzhT/vvNOkoubEqFMwEtOuY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-xwCymXkKPNi_qpmKzg5ipQ-1; Wed, 30 Jun 2021 22:09:43 -0400
X-MC-Unique: xwCymXkKPNi_qpmKzg5ipQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC9F1835AC7;
 Thu,  1 Jul 2021 02:09:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B838F5FC03;
 Thu,  1 Jul 2021 02:09:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] python: update help text for check-tox
Date: Wed, 30 Jun 2021 22:09:14 -0400
Message-Id: <20210701020921.1679468-9-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move it up near the check-pipenv help text, and update it to suggest parity.

(At the time I first added it, I wasn't sure if I would be keeping it,
but I've come to appreciate it as it has actually helped uncover bugs I
would not have noticed without it. It should stay.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-9-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 07ad73ccd0..d2cfa6ad8f 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -9,13 +9,17 @@ help:
 	@echo "    Requires: Python 3.6 and pipenv."
 	@echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
 	@echo ""
+	@echo "make check-tox:"
+	@echo "    Run tests against multiple python versions."
+	@echo "    These tests use the newest dependencies."
+	@echo "    Requires: Python 3.6 - 3.10, and tox."
+	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
+	@echo ""
 	@echo "make develop:    Install deps for 'make check', and"
 	@echo "                 the qemu libs in editable/development mode."
 	@echo ""
 	@echo "make check:      run linters using the current environment."
 	@echo ""
-	@echo "make check-tox:  run linters using multiple python versions."
-	@echo ""
 	@echo "make pipenv"
 	@echo "    Creates pipenv's virtual environment (.venv)"
 	@echo ""
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07053B8C0E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:19:52 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymIx-0004mI-MM
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9T-0008VZ-FZ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9J-0006AQ-PM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtOJzKE6qHTFVmUxUszmFbx1IvtXvU9oRR9BmecF9Lk=;
 b=Xu7YtvuAuVmUi83Cny3YU0bhZzM4fgpyC5rVAXo43QmI2pJZ3+jLuUczBPnLIf0WuQtOXh
 O6nXUFKo6yklKfqgCO0tinVzTxR8c9CZUCTm1I0ZP6/EWSURQY3UkwA7AVA9oBEyGl4Mp9
 e8DT3MqehDK8LjY/2losOGa34l8ZnKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-H993Bqn_OOC022KDVq_6NA-1; Wed, 30 Jun 2021 22:09:51 -0400
X-MC-Unique: H993Bqn_OOC022KDVq_6NA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E63802928;
 Thu,  1 Jul 2021 02:09:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0BE15FC03;
 Thu,  1 Jul 2021 02:09:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] python: Fix .PHONY Make specifiers
Date: Wed, 30 Jun 2021 22:09:15 -0400
Message-Id: <20210701020921.1679468-10-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

I missed the 'check-tox' target. Add that, but split the large .PHONY
specifier at the top into its component pieces and move them near the
targets they describe so that they're much harder to forget to update.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20210629214323.1329806-10-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index d2cfa6ad8f..d34c4e35d9 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,5 +1,4 @@
-.PHONY: help pipenv check-pipenv check clean distclean develop
-
+.PHONY: help
 help:
 	@echo "python packaging help:"
 	@echo ""
@@ -29,25 +28,32 @@ help:
 	@echo "                 built distribution files, and everything"
 	@echo "                 from 'make clean'."
 
+.PHONY: pipenv
 pipenv: .venv
 .venv: Pipfile.lock
 	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
 	@touch .venv
 
+.PHONY: check-pipenv
 check-pipenv: pipenv
 	@pipenv run make check
 
+.PHONY: develop
 develop:
 	pip3 install -e .[devel]
 
+.PHONY: check
 check:
 	@avocado --config avocado.cfg run tests/
 
+.PHONY: check-tox
 check-tox:
 	@tox
 
+.PHONY: clean
 clean:
 	python3 setup.py clean --all
 
+.PHONY: distclean
 distclean: clean
 	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
-- 
2.31.1



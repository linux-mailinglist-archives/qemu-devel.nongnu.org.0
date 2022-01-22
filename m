Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549AC49688A
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:15:33 +0100 (CET)
Received: from localhost ([::1]:59000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB442-0003I6-1O
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:15:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3ya-0000Ks-I4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yW-0005At-GL
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rr4rDjBadgBcz9wR0rV1Q8VVt3wP3dLw7J4Zgs8eT+M=;
 b=Vzb5gU4MthQhrsSaDO4uGDOrlMvAJjXjF/gJcROoCzC3MVXXpuy90o4BG3ktIrRX0GwzkD
 x8EwS3Bg3BFsUnSw0kkUpO+VYsSfGhJorukoqX46AZHu3tHrSb0GM1rYupN6Mz9wIyAvUI
 8Wjroa1IbRPVmPLmBcxsL5AId2louok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-Dxnq4Fp2OPGPeqgnCSEZeg-1; Fri, 21 Jan 2022 19:09:42 -0500
X-MC-Unique: Dxnq4Fp2OPGPeqgnCSEZeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47452807907;
 Sat, 22 Jan 2022 00:09:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7174266E1B;
 Sat, 22 Jan 2022 00:09:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] python: pin setuptools below v60.0.0
Date: Fri, 21 Jan 2022 19:09:15 -0500
Message-Id: <20220122000931.536322-2-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

setuptools is a package that replaces the python stdlib 'distutils'. It
is generally installed by all venv-creating tools "by default". It isn't
actually needed at runtime for the qemu package, so our own setup.cfg
does not mention it as a dependency.

However, tox will create virtual environments that include it, and will
upgrade it to the very latest version. the 'venv' tool will also include
whichever version your host system happens to have.

Unfortunately, setuptools version 60.0.0 and above include a hack to
forcibly overwrite python's built-in distutils. The pylint tool that we
use to run code analysis checks on this package relies on distutils and
suffers regressions when setuptools >= 60.0.0 is present at all, see
https://github.com/PyCQA/pylint/issues/5704

Instruct tox and the 'check-dev' targets to avoid setuptools packages
that are too new, for now. Pipenv is unaffected, because setuptools 60
does not offer Python 3.6 support, and our pipenv config is pinned
against Python 3.6.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20220121005221.142236-1-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile  | 2 ++
 python/setup.cfg | 1 +
 2 files changed, 3 insertions(+)

diff --git a/python/Makefile b/python/Makefile
index 3334311362..949c472624 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -68,6 +68,8 @@ $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
 		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
 		. $(QEMU_VENV_DIR)/bin/activate;		\
 		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
+		pip install --disable-pip-version-check		\
+			"setuptools<60.0.0" 1>/dev/null;	\
 		make develop 1>/dev/null;			\
 	)
 	@touch $(QEMU_VENV_DIR)
diff --git a/python/setup.cfg b/python/setup.cfg
index 417e937839..aa238d8bc9 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -163,6 +163,7 @@ deps =
     .[devel]
     .[fuse]  # Workaround to trigger tox venv rebuild
     .[tui]   # Workaround to trigger tox venv rebuild
+    setuptools < 60  # Workaround, please see commit msg.
 commands =
     make check
 
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04F3B46FC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 17:52:12 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwo7n-0004dP-PX
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 11:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo2I-0001Uf-Vi
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo2H-0007kK-Aa
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624635988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byCF/CldwWVk4VCHN30rIbynG6DhJFETEiBtonr39KQ=;
 b=SrkxaoNoRPrlP4Bc2bSWcbVNaXgQEMuCK43+p7Fy32xBcs3kg9AeCtkJ256ebMYanuF3pI
 vR6BrXSUzokiNVQvSIYh3eZGMndF9BUeAl1fiH0n0D6fQisXbDzJ3nahvBQPfbfHzNUBPk
 Pp5qLcMvw2zLou3HKaRd6AtKxTiWcQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-K5w_3e20OhCCdPDwmYHGvg-1; Fri, 25 Jun 2021 11:46:24 -0400
X-MC-Unique: K5w_3e20OhCCdPDwmYHGvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8180804146;
 Fri, 25 Jun 2021 15:46:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AD3F26FA3;
 Fri, 25 Jun 2021 15:46:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] python: remove auto-generated pyproject.toml file
Date: Fri, 25 Jun 2021 11:45:40 -0400
Message-Id: <20210625154540.783306-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

For reasons that at-present escape me, pipenv insists on creating a stub
pyproject.toml file. This file is a nuisance, because its mere presence
changes the behavior of various tools.

For instance, this stub file will cause "pip install --user -e ." to
fail in spectacular fashion with misleading errors. "pip install -e ."
works okay, but for some reason pip does not support editable installs
to the user directory when using PEP517.

References:
  https://github.com/pypa/pip/pull/9990
  https://github.com/pypa/pip/issues/7953

As outlined in ea1213b7ccc, it is still too early for us to consider
moving to a PEP-517 exclusive package. We must support support older
distributions, so squash the annoyance for now. (Python 3.6 shipped Dec
2016, PEP517 support showed up in pip sometime in 2019 or so.)

Add 'pyproject.toml' to the 'make clean' target, and also delete it
after every pipenv invocation issued by the Makefile.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/Makefile b/python/Makefile
index 06f78f760a..758ce2c8d8 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -49,6 +49,7 @@ help:
 pipenv: .venv
 .venv: Pipfile.lock
 	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
+	rm -f pyproject.toml
 	@touch .venv
 
 check-pipenv: pipenv
@@ -84,6 +85,7 @@ check-tox:
 
 clean:
 	python3 setup.py clean --all
+	rm -f pyproject.toml
 
 distclean: clean
 	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
-- 
2.31.1



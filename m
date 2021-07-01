Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504B3B8C08
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:17:38 +0200 (CEST)
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymGn-0007ZL-IZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9a-00005v-5H
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9S-0006Cw-KZ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5d9SeKwbPXA9kMnYF4WRl6jIFKDgR5f6XLwQ12GiqeQ=;
 b=QRgBcJCSphVz6v9vmyGrflVSgJmygfNr2zDLo9nRNBr7uEZjZNGZ4GLJMU00ynYhbHqjge
 65L7RiyfzreMAjBPKiNrwZQ32RU1RUIbDdGup8ivIBqaOahJaQS18MlDEdsKsoUsZlEkjC
 bMs/AhE55OHTndRsGFIzS18zt4g53oA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Uzosd3XJNdKtkXzih8An-Q-1; Wed, 30 Jun 2021 22:09:57 -0400
X-MC-Unique: Uzosd3XJNdKtkXzih8An-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5130D1084F4C;
 Thu,  1 Jul 2021 02:09:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E12D5FC03;
 Thu,  1 Jul 2021 02:09:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] python: remove auto-generated pyproject.toml file
Date: Wed, 30 Jun 2021 22:09:20 -0400
Message-Id: <20210701020921.1679468-15-jsnow@redhat.com>
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
moving to a PEP-517 exclusive package. We must support older
distributions, so squash the annoyance for now. (Python 3.6 shipped Dec
2016, PEP517 support showed up in pip sometime in 2019 or so.)

Add 'pyproject.toml' to the 'make clean' target, and also delete it
after every pipenv invocation issued by the Makefile.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-15-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/Makefile b/python/Makefile
index 0432ee0022..ac46ae33e7 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -49,6 +49,7 @@ help:
 pipenv: .venv
 .venv: Pipfile.lock
 	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
+	rm -f pyproject.toml
 	@touch .venv
 
 .PHONY: check-pipenv
@@ -91,6 +92,7 @@ check-tox:
 .PHONY: clean
 clean:
 	python3 setup.py clean --all
+	rm -f pyproject.toml
 
 .PHONY: distclean
 distclean: clean
-- 
2.31.1



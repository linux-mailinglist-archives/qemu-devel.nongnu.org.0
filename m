Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B9B31931A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:30:15 +0100 (CET)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHfJ-0005s1-Mv
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCv-00050L-NW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCW-0005lS-Ex
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YK2jmGIJBGOJ92gZF6v+cTJVWXulCu2DT92pC3EsdHA=;
 b=FtAsXJNMbMlpBV2HiQF0EAHYxGN8xF5piKTGXqrR9UyzJeIaxyWxqpc/u1u34Somdd5E8s
 vHt+CyzM6mIuYeVow1T7SkEvDYnndiUREevhhDwwztvKiUP9DUhPjL6JvA7QF7L5D8dLKS
 NWE/UL8Hd0/h3gUpqni2euFOfbGzIbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-s372Taw_MRqmun-zhBiWWw-1; Thu, 11 Feb 2021 14:00:16 -0500
X-MC-Unique: s372Taw_MRqmun-zhBiWWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757DC1936B9D;
 Thu, 11 Feb 2021 19:00:03 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E90683828;
 Thu, 11 Feb 2021 19:00:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/24] python: add Makefile for some common tasks
Date: Thu, 11 Feb 2021 13:58:54 -0500
Message-Id: <20210211185856.3975616-23-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add "make venv" to create the pipenv-managed virtual environment that
contains our explicitly pinned dependencies.

Add "make check" to run the python linters [in the host execution
environment].

Add "make venv-check" which combines the above two: create/update the
venv, then run the linters in that explicitly managed environment.

make clean: delete miscellaneous build output possibly created by
pipenv, pip, or other python packaging utilities

make distclean: delete the above, and the .venv, too.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 python/Makefile

diff --git a/python/Makefile b/python/Makefile
new file mode 100644
index 00000000000..51915eaec3b
--- /dev/null
+++ b/python/Makefile
@@ -0,0 +1,35 @@
+.PHONY: help venv venv-check check clean distclean
+
+help:
+	@echo "python packaging help:"
+	@echo ""
+	@echo "make venv:       Create pipenv's virtual environment."
+	@echo "    NOTE: Requires Python 3.6 and pipenv."
+	@echo "          Will download packages from PyPI."
+	@echo "    HINT: On Fedora: 'sudo dnf install python36 pipenv'"
+	@echo ""
+	@echo "make venv-check: run linters using pipenv's virtual environment."
+	@echo ""
+	@echo "make check:      run linters using the current environment."
+	@echo "    Hint: Install deps with: 'pip install \".[devel]\"'"
+	@echo ""
+	@echo "make clean:      remove build output."
+	@echo ""
+	@echo "make distclean:  remove venv files and everything from 'clean'."
+
+
+venv: .venv
+.venv: Pipfile.lock
+	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
+
+venv-check: venv
+	@pipenv run make check
+
+check:
+	@pytest
+
+clean:
+	rm -rf build/ dist/
+
+distclean: clean
+	rm -rf qemu.egg.info/ .venv
-- 
2.29.2



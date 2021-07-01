Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB93B8BFD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:14:32 +0200 (CEST)
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymDn-0008LQ-9N
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9E-0008E7-LM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym98-000683-KK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1SiGOOF4g7YmZ1YlF5gyG4U5EKBuJayptrXDJyXDi0=;
 b=MepegUi2IjoJzmNIazrJ5nRmgQc/Ez/tmZf00DaOEWKnwD85q5qC0+bfoSqWknLpSQ0cKe
 qGfuWoOsdYAab+KOCMlEMjPN+2J7HXBGsRUhGtfSItB3RWKsOWKqv2rOjvgqobjxQb8HR2
 /27M1TiT/viJq5BuGgnlADkPJ+KU+OM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Hs3u_vB8PIWbTN7UYaULsw-1; Wed, 30 Jun 2021 22:09:39 -0400
X-MC-Unique: Hs3u_vB8PIWbTN7UYaULsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3171E362F8;
 Thu,  1 Jul 2021 02:09:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 600945FC03;
 Thu,  1 Jul 2021 02:09:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] python: README.rst touchups
Date: Wed, 30 Jun 2021 22:09:11 -0400
Message-Id: <20210701020921.1679468-6-jsnow@redhat.com>
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

Clarifying a few points; removing the reference to 'setuptools' because
it isn't referenced anywhere else in this document and doesn't really
provide any useful information to a Python newcomer.

Adjusting the language elsewhere to be less ambiguous and have fewer
run-on sentences.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/python/README.rst b/python/README.rst
index dcf993819d..107786ffdc 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -7,8 +7,7 @@ then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
 
 ``setup.py`` is used by ``pip`` to install this tooling to the current
 environment. ``setup.cfg`` provides the packaging configuration used by
-``setup.py`` in a setuptools specific format. You will generally invoke
-it by doing one of the following:
+``setup.py``. You will generally invoke it by doing one of the following:
 
 1. ``pip3 install .`` will install these packages to your current
    environment. If you are inside a virtual environment, they will
@@ -17,12 +16,13 @@ it by doing one of the following:
 
 2. ``pip3 install --user .`` will install these packages to your user's
    local python packages. If you are inside of a virtual environment,
-   this will fail; you likely want the first invocation above.
+   this will fail; you want the first invocation above.
 
-If you append the ``-e`` argument, pip will install in "editable" mode;
-which installs a version of the package that installs a forwarder
-pointing to these files, such that the package always reflects the
-latest version in your git tree.
+If you append the ``--editable`` or ``-e`` argument to either invocation
+above, pip will install in "editable" mode. This installs the package as
+a forwarder ("qemu.egg-link") that points to the source tree. In so
+doing, the installed package always reflects the latest version in your
+source tree.
 
 Installing ".[devel]" instead of "." will additionally pull in required
 packages for testing this package. They are not runtime requirements,
@@ -30,6 +30,7 @@ and are not needed to simply use these libraries.
 
 Running ``make develop`` will pull in all testing dependencies and
 install QEMU in editable mode to the current environment.
+(It is a shortcut for ``pip3 install -e .[devel]``.)
 
 See `Installing packages using pip and virtual environments
 <https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
@@ -39,7 +40,7 @@ for more information.
 Files in this directory
 -----------------------
 
-- ``qemu/`` Python package source directory.
+- ``qemu/`` Python 'qemu' namespace package source directory.
 - ``tests/`` Python package tests directory.
 - ``avocado.cfg`` Configuration for the Avocado test-runner.
   Used by ``make check`` et al.
-- 
2.31.1



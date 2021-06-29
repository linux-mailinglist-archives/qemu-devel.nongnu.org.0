Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6D3B76A9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:49:12 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGv9-0003qS-NS
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpO-0003bX-25
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpM-00068Q-5V
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624984991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UW2LFwdYE+RYCc43Fj2nlvRx60N4UVfxAjZVwF18E4=;
 b=QoQMK6yzwAcgsqXD2K3G+Jbm3AYFE/BBi5qBoBwMbo6gjuUg8g6fSlK+c6h79X/ER9CvVs
 3EClnt83GLkhhyU0pEMMVY0B6MjzVQQZFAeNTIIp34U2vXE2i6/z4tHJ+tz3Sh3kk6dfWA
 zBPptzQN01XChPd4ovU4FmOfqmovbvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-e1_kMu8QNYeqFNshJQSAdA-1; Tue, 29 Jun 2021 12:43:09 -0400
X-MC-Unique: e1_kMu8QNYeqFNshJQSAdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62AFC804144;
 Tue, 29 Jun 2021 16:43:08 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C47619C79;
 Tue, 29 Jun 2021 16:43:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] python: README.rst touchups
Date: Tue, 29 Jun 2021 12:42:45 -0400
Message-Id: <20210629164253.1272763-5-jsnow@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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



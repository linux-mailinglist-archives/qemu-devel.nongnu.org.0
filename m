Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1226B226
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 00:42:50 +0200 (CEST)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIJey-00085H-GT
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 18:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJcw-0006Ex-1V
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:40:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40451
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJct-0002Vo-Kg
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600209636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LERjw7jE23yWXtnh82ssGumspChAbbGgfKmaV5CO6KU=;
 b=SZiE/VgdF1FPf5d6V6BaVm0t6gppnU1SKd3ECyG8K0TbBjrTe8AQRRNQjs04Op8I6riSTh
 EoaHfzPKw7hWe7IpnjGIaihEMEuzXlC7fHjs3+DQiKIkgEg2RTwtKMQHe7+G+xup4AdThu
 /Bp5/cWKiTXpcfzVA/WMXyYFlYGQr1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-7b3j0tMjNV-5Vo47KFx7ag-1; Tue, 15 Sep 2020 18:40:31 -0400
X-MC-Unique: 7b3j0tMjNV-5Vo47KFx7ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCA9D1891E8A;
 Tue, 15 Sep 2020 22:40:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8F6C81C54;
 Tue, 15 Sep 2020 22:40:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 01/37] python: Require 3.6+
Date: Tue, 15 Sep 2020 18:39:51 -0400
Message-Id: <20200915224027.2529813-2-jsnow@redhat.com>
In-Reply-To: <20200915224027.2529813-1-jsnow@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 18:40:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Python 3.5 is now EOL. Python 3.6 brings with it several nice things:

- Literal string interpolation (PEP 498)
- Syntax for variable annotations (PEP 526)
- Preserving keyword argument order (PEP 468) *

PEP 526 in particular will allow us to convert the QAPI module to the
statically typed subset of the Python language. These static type hints
improve the interactive editing experience in IDEs and help make
refactoring and adding new features faster, easier and safer.

*Note: **kwargs is now guaranteed to preserve keyword ordering, but dict
itself is still allowed to have an arbitrary order based on
implementation. It is not until Python 3.7 that the dict type guarantees
insertion order.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py                  | 4 ++--
 configure                     | 6 +++---
 .readthedocs.yml              | 2 +-
 .travis.yml                   | 8 --------
 tests/qemu-iotests/iotests.py | 2 --
 5 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 0dbd90dc11..8aeac40124 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -36,9 +36,9 @@
 # In newer versions of Sphinx this will display nicely; in older versions
 # Sphinx will also produce a Python backtrace but at least the information
 # gets printed...
-if sys.version_info < (3,5):
+if sys.version_info < (3,6):
     raise ConfigError(
-        "QEMU requires a Sphinx that uses Python 3.5 or better\n")
+        "QEMU requires a Sphinx that uses Python 3.6 or better\n")
 
 # The per-manual conf.py will set qemu_docdir for a single-manual build;
 # otherwise set it here if this is an entire-manual-set build.
diff --git a/configure b/configure
index ce27eafb0a..33292500e7 100755
--- a/configure
+++ b/configure
@@ -913,7 +913,7 @@ fi
 
 : ${make=${MAKE-make}}
 
-# We prefer python 3.x. A bare 'python' is traditionally
+# We prefer python 3.6+. A bare 'python' is traditionally
 # python 2.x, but some distros have it as python 3.x, so
 # we check that too
 python=
@@ -1961,8 +1961,8 @@ fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (3,5))'; then
-  error_exit "Cannot use '$python', Python >= 3.5 is required." \
+if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
+  error_exit "Cannot use '$python', Python >= 3.6 is required." \
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
diff --git a/.readthedocs.yml b/.readthedocs.yml
index 8355dbc634..7fb7b8dd61 100644
--- a/.readthedocs.yml
+++ b/.readthedocs.yml
@@ -17,4 +17,4 @@ formats: all
 # we require for other Python in our codebase (our conf.py
 # enforces this, and some code needs it.)
 python:
-  version: 3.5
+  version: 3.6
diff --git a/.travis.yml b/.travis.yml
index 65341634d0..0dca15a5e8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -267,14 +267,6 @@ jobs:
 
 
     # Python builds
-    - name: "GCC Python 3.5 (x86_64-softmmu)"
-      env:
-        - CONFIG="--target-list=x86_64-softmmu"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      language: python
-      python: 3.5
-
-
     - name: "GCC Python 3.6 (x86_64-softmmu)"
       env:
         - CONFIG="--target-list=x86_64-softmmu"
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 91e4a57126..f48460480a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -40,8 +40,6 @@
 from qemu import qtest
 from qemu.qmp import QMPMessage
 
-assert sys.version_info >= (3, 6)
-
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
 logger.addHandler(logging.NullHandler())
-- 
2.26.2



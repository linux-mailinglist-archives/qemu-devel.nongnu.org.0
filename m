Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C730547646F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:17:57 +0100 (CET)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbeu-0002yH-UM
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWE-0003vV-0Q
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWA-0006bV-Nf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19MJcVvIxQKgG8oPeAFWB0n32YQjLRJaVtg+LTC4LTI=;
 b=D7GTHLSbm64/zNpWTEmrqwpkdVUByDQtc3lHyhXxcG+wQAqSZQk8SikDMnwYJHa3mWYSKD
 VQgbT0Ozvno+seoWycmq2EAZTYcYnaBaoKL++A5ZKv5bufEKkDimH7yvPKtB8S1OLSGzzy
 41JKg5yL8pDqKWvy3fLB5ZzkYHxtWW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-7yXNkR2VMteEKJLkYCwcRA-1; Wed, 15 Dec 2021 16:08:48 -0500
X-MC-Unique: 7yXNkR2VMteEKJLkYCwcRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C46710151E0;
 Wed, 15 Dec 2021 21:08:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44EC35F4E9;
 Wed, 15 Dec 2021 21:08:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 07/24] Move PACKAGE.rst to README.rst and update
Date: Wed, 15 Dec 2021 16:06:17 -0500
Message-Id: <20211215210634.3779791-8-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The README here will reflect both what is shown on GitLab and on the
PyPI landing page. Update it accordingly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 INDEX.rst   |   2 +-
 MANIFEST.in |   2 +-
 PACKAGE.rst |  43 ------------------
 README.rst  | 129 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg   |   2 +-
 5 files changed, 132 insertions(+), 46 deletions(-)
 delete mode 100644 PACKAGE.rst
 create mode 100644 README.rst

diff --git a/INDEX.rst b/INDEX.rst
index 45b0dbf..9c45740 100644
--- a/INDEX.rst
+++ b/INDEX.rst
@@ -54,10 +54,10 @@ Files in this directory
   Try ``make help`` to see available targets.
 - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
   that should be included by a source distribution.
-- ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
 - ``Pipfile`` is used by Pipenv to generate ``Pipfile.lock``.
 - ``Pipfile.lock`` is a set of pinned package dependencies that this package
   is tested under in our CI suite. It is used by ``make check-pipenv``.
+- ``README.rst`` is used as the README file that is visible on PyPI.org.
 - ``setup.cfg`` houses setuptools package configuration.
 - ``setup.py`` is the setuptools installer used by pip; See above.
 - ``VERSION`` contains the PEP-440 compliant version used to describe
diff --git a/MANIFEST.in b/MANIFEST.in
index 639caae..2a3fc58 100644
--- a/MANIFEST.in
+++ b/MANIFEST.in
@@ -1,2 +1,2 @@
 include VERSION
-include PACKAGE.rst
+include README.rst
diff --git a/PACKAGE.rst b/PACKAGE.rst
deleted file mode 100644
index b0b86cc..0000000
--- a/PACKAGE.rst
+++ /dev/null
@@ -1,43 +0,0 @@
-QEMU Python Tooling
-===================
-
-This package provides QEMU tooling used by the QEMU project to build,
-configure, and test QEMU. It is not a fully-fledged SDK and it is subject
-to change at any time.
-
-Usage
------
-
-The ``qemu.qmp`` subpackage provides a library for communicating with
-QMP servers. The ``qemu.machine`` subpackage offers rudimentary
-facilities for launching and managing QEMU processes. Refer to each
-package's documentation
-(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
-for more information.
-
-Contributing
-------------
-
-This package is maintained by John Snow <jsnow@redhat.com> as part of
-the QEMU source tree. Contributions are welcome and follow the `QEMU
-patch submission process
-<https://wiki.qemu.org/Contribute/SubmitAPatch>`_, which involves
-sending patches to the QEMU development mailing list.
-
-John maintains a `GitLab staging branch
-<https://gitlab.com/jsnow/qemu/-/tree/python>`_, and there is an
-official `GitLab mirror <https://gitlab.com/qemu-project/qemu>`_.
-
-Please report bugs on the `QEMU issue tracker
-<https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
-the report.
-
-Optional packages necessary for running code quality analysis for this
-package can be installed with the optional dependency group "devel":
-``pip install qemu[devel]``.
-
-``make develop`` can be used to install this package in editable mode
-(to the current environment) *and* bring in testing dependencies in one
-command.
-
-``make check`` can be used to run the available tests.
diff --git a/README.rst b/README.rst
new file mode 100644
index 0000000..bd4a301
--- /dev/null
+++ b/README.rst
@@ -0,0 +1,129 @@
+QEMU Monitor Protocol (QMP) Library
+===================================
+
+This package provides an asyncio library used for communicating with
+QEMU Monitor Protocol ("QMP") servers. It requires Python 3.6+ and has
+no other dependencies.
+
+This library can be used for communicating with QEMU emulators or with
+the QEMU Guest Agent (QGA), QEMU Storage Daemon (QSD) or any other
+utility or application that speaks QMP.
+
+This library makes as little assumptions as possible about the actual
+version or what type of endpoint it will be communicating with;
+i.e. this library does not contain command definitions and does not seek
+to be an SDK or a replacement for tools like libvirt/virsh. It is
+"simply" the protocol (QMP) and not the vocabulary (QAPI). It is up to
+the programmer (you!) to know which commands and arguments you want to
+send.
+
+
+Who is this library for?
+------------------------
+
+It is firstly for developers of QEMU themselves; as the test
+infrastructure of QEMU itself needs a convenient and scriptable
+interface for testing QEMU. This library was split out of the QEMU
+source tree in order to share a reference version of a QMP library that
+was usable both within and outside of the QEMU source tree.
+
+Second, it's for those who are developing *for* QEMU by adding new
+architectures, devices, or functionality; as well as targeting those who
+are developing *with* QEMU, i.e. developers working on integrating QEMU
+features into other projects such as libvirt, kubevirt, kata
+containers, etc. Occasionally, using existing VM management stacks that
+integrate QEMU+kvm can make developing, testing, and debugging features
+difficult and more 'raw' access is required. This library is for you.
+
+Lastly, it's for power users who already use QEMU directly without the
+aid of libvirt because they require the raw control and power this
+affords them.
+
+
+Who is this library NOT for?
+----------------------------
+
+It is not designed for anyone looking for a turn-key solution for VM
+management. QEMU is a low-level component that resembles a swiss army
+knife with 5,000 attachments. This library does not manage that
+complexity at all and is largely "QEMU ignorant", and so it is not a
+replacement for projects like libvirt, virtual machine manager, boxes,
+etc.
+
+
+Installing
+----------
+
+This package can be installed with pip using ``pip3 install qemu.qmp``.
+
+
+Usage
+-----
+
+At its simplest, script-style usage looks like this::
+
+  from qemu.qmp import QMPClient
+
+  qmp = QMPClient('my-vm-nickname')
+  await qmp.connect('/path/to/qmp.sockfile')
+
+  res = await qmp.execute('query-status')
+  print(f"VM status: {res['status']}")
+
+  await qmp.disconnect()
+
+
+The above script will connect to the UNIX socket located at
+``/path/to/qmp.sockfile`` and query the VM's runstate and print it out
+to the terminal.
+
+For more complex usages, especially those that make full advantage of
+monitoring asynchronous events; refer to the online documentation or
+type ``help(qemu.qmp)`` in your Python terminal of choice.
+
+
+Contributing
+------------
+
+Contributions are quite welcome! Please file bugs using the `GitLab
+issue tracker <https://gitlab.com/jsnow/qemu.qmp/-/issues>`_. This
+project will accept GitLab merge requests, but due to the close
+association with the QEMU project, there are some additional guidelines:
+
+1. Please use the "Signed-off-by" tag in your commit messages. See
+   https://wiki.linuxfoundation.org/dco for more information on this
+   requirement.
+
+2. This repository won't squash merge requests into a single commit on
+   pull; each commit should seek to be self-contained (within reason).
+
+3. Owing to the above, each commit sent as part of a merge request
+   should not introduce any temporary regressions, even if fixed later
+   in the same merge request. This is done to preserve bisectability.
+
+4. Please associate every merge request with at least one GitLab
+   issue. This helps with generating Changelog text and staying
+   organized. Thank you 🙇
+
+
+Developing
+^^^^^^^^^^
+
+Optional packages necessary for running code quality analysis for this
+package can be installed with the optional dependency group "devel":
+``pip install qemu.qmp[devel]``.
+
+``make develop`` can be used to install this package in editable mode
+(to the current environment) *and* bring in testing dependencies in one
+command.
+
+``make check`` can be used to run the available tests. Consult ``make
+help`` for other targets and tests that make sense for different
+occasions. (Personally: I run ``make check-tox && make check-pipenv``
+locally before submitting to GitLab CI as my due diligence.)
+
+
+Changelog
+---------
+
+- No public release yet.
diff --git a/setup.cfg b/setup.cfg
index 0f14bda..f4a02d6 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -10,7 +10,7 @@ url = https://gitlab.com/jsnow/qemu.qmp
 download_url = https://gitlab.com/jsnow/qemu.qmp/-/packages
 # NOTE: Remember to update the commit message when changing these URLs.
 description = QEMU Monitor Protocol library.
-long_description = file:PACKAGE.rst
+long_description = file:README.rst
 long_description_content_type = text/x-rst
 classifiers =
     Development Status :: 3 - Alpha
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283894ECC93
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:43:48 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdIJ-0005Xl-8f
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:43:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczn-0006ck-Ft
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczl-0005GR-7X
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+fuaV4/BztlZi+MLherz0r2r04swFA0yXFLtVUUfJM=;
 b=jMcrgVNfLxH9dClBu2DvlV4/2e1kJHfMEs3nJ2OeaIPM3z2KdGSVlvxlF++80PoEnnHlEx
 CuUJN9K9v8FqO9zBXz8HhSyI4oXBiJFe+WVes5jveDLUcqeX1+9yAqumRwRKtx7qoFHOjT
 LYI4Xx24A2Hqjm29Um0iQ1P7avHVUN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-J22NDjbDO3uYnaX-fpEf5w-1; Wed, 30 Mar 2022 14:24:28 -0400
X-MC-Unique: J22NDjbDO3uYnaX-fpEf5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91A10805F7C
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 18:24:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9362166B3F;
 Wed, 30 Mar 2022 18:24:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 09/13] [FIXME] move PACKAGE.rst to README.rst and
 update
Date: Wed, 30 Mar 2022 14:24:20 -0400
Message-Id: <20220330182424.3438872-10-jsnow@redhat.com>
In-Reply-To: <20220330182424.3438872-1-jsnow@redhat.com>
References: <20220330182424.3438872-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The README here will reflect both what is shown on GitLab and on the
PyPI landing page. Update it accordingly, and freshen it up.

FIXME: Update URLs when pushing to the production repo.

Suggested-by: Kashyap Chamarthy <kchamart@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 FILES.rst   |   2 +-
 MANIFEST.in |   2 +-
 PACKAGE.rst |  43 --------------
 README.rst  | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg   |   2 +-
 5 files changed, 163 insertions(+), 46 deletions(-)
 delete mode 100644 PACKAGE.rst
 create mode 100644 README.rst

diff --git a/FILES.rst b/FILES.rst
index 68892c3..0c29a88 100644
--- a/FILES.rst
+++ b/FILES.rst
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
index 0000000..8593259
--- /dev/null
+++ b/README.rst
@@ -0,0 +1,160 @@
+qemu.qmp: QEMU Monitor Protocol Library
+=======================================
+
+Welcome! ``qemu.qmp`` is a `QEMU Monitor Protocol
+<https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qmp-intro.txt>`_
+(“QMP”) library written in Python, using `asyncio
+<https://docs.python.org/3/library/asyncio.html>`_. It is used to send
+QMP messages to running `QEMU <https://www.qemu.org/>`_ emulators. It
+requires Python 3.6+ and has no mandatory dependencies.
+
+This library can be used to communicate with QEMU emulators, the `QEMU
+Guest Agent
+<https://qemu.readthedocs.io/en/latest/interop/qemu-ga.html>`_ (QGA),
+the `QEMU Storage Daemon
+<https://qemu.readthedocs.io/en/latest/tools/qemu-storage-daemon.html>`_
+(QSD), or any other utility or application that `speaks QMP
+<https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qmp-intro.txt>`_.
+
+This library makes as few assumptions as possible about the actual
+version or what type of endpoint it will be communicating with;
+i.e. this library does not contain command definitions and does not seek
+to be an SDK or a replacement for tools like `libvirt
+<https://libvirt.org/>`_ or `virsh
+<https://libvirt.org/manpages/virsh.html>`_. It is "simply" the protocol
+(QMP) and not the vocabulary (`QAPI
+<https://www.qemu.org/docs/master/devel/qapi-code-gen.html>`_). It is up
+to the library user (you!) to know which commands and arguments you want
+to send.
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
+features into other projects such as libvirt, KubeVirt, Kata Containers,
+etc. Occasionally, using existing virtual-machine (VM) management stacks
+that integrate QEMU+KVM can make developing, testing, and debugging
+features difficult. In these cases, having more 'raw' access to QEMU is
+beneficial. This library is for you.
+
+Lastly, it's for power users who already use QEMU directly without the
+aid of libvirt because they require the raw control and power this
+affords them.
+
+
+Who isn't this library for?
+---------------------------
+
+It is not designed for anyone looking for a turn-key solution for VM
+management. QEMU is a low-level component that resembles a particularly
+impressive Swiss Army knife. This library does not manage that
+complexity and is largely "VM-ignorant". It's not a replacement for
+projects like `libvirt <https://libvirt.org/>`_, `virt-manager
+<https://virt-manager.org/>`_, `GNOME Boxes
+<https://wiki.gnome.org/Apps/Boxes>`_, etc.
+
+
+Installing
+----------
+
+This package can be installed from PyPI with pip: ``> pip3 install
+qemu.qmp``.
+
+
+Usage
+-----
+
+Launch QEMU with a monitor, e.g.::
+
+  > qemu-system-x86_64 -qmp unix:qmp.sock,server=on,wait=off
+
+
+Then, at its simplest, script-style usage looks like this::
+
+  import asyncio
+  from qemu.qmp import QMPClient
+
+  async def main():
+      qmp = QMPClient('my-vm-nickname')
+      await qmp.connect('qmp.sock')
+
+      res = await qmp.execute('query-status')
+      print(f"VM status: {res['status']}")
+
+      await qmp.disconnect()
+
+  asyncio.run(main())
+
+
+The above script will connect to the UNIX socket located at
+``qmp.sock``, query the VM's runstate, then print it out
+to the terminal::
+
+  > python3 example.py
+  VM status: running
+
+
+For more complex usages, especially those that make full advantage of
+monitoring asynchronous events, refer to the `online documentation
+<https://jsnow.gitlab.io/qemu.qmp/>`_ or type ``import qemu.qmp;
+help(qemu.qmp)`` in your Python terminal of choice.
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
+4. Please associate every merge request with at least one `GitLab issue
+   <https://gitlab.com/jsnow/qemu.qmp/-/issues>`_. This helps with
+   generating Changelog text and staying organized. Thank you 🙇
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
+occasions.
+
+Before submitting a pull request, consider running ``make check-tox &&
+make check-pipenv`` locally to spot any issues that will cause the CI to
+fail. These checks use their own virtual environments and won't pollute
+your working space.
+
+
+Changelog
+---------
+
+- No public release yet.
diff --git a/setup.cfg b/setup.cfg
index 44f913d..a28cd0a 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -10,7 +10,7 @@ url = https://gitlab.com/jsnow/qemu.qmp
 # NOTE: Remember to update the commit message when changing these URLs.
 download_url = https://gitlab.com/jsnow/qemu.qmp/-/packages
 description = QEMU Monitor Protocol library
-long_description = file:PACKAGE.rst
+long_description = file:README.rst
 long_description_content_type = text/x-rst
 classifiers =
     Development Status :: 3 - Alpha
-- 
2.34.1



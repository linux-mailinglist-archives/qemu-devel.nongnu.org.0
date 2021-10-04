Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E4421985
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:57:23 +0200 (CEST)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVxa-0005uj-BN
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtQ-0001oX-1G
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtO-0002dw-2W
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633384381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfJPbYRi8lxmKKfEZFCjGM/vXZenhJ4k5CJUkixrprk=;
 b=LJpouvKcMsh5vYd34aUmj0MaKdnzH6xQik9tZKddU9hV71xmi0mdZq6CntugJZL6V5pujm
 gZ+dxbRPuZGIC7h/w7l71MJqEC07vWzt1zzdqCHJu2vwKoRCX8wGQm4E3h+4b5xV+7auv0
 QjQIIb6RIekxrsZ0UYOJefjU3poLwTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-EYuZ6PbNO7id76xhWlWkgw-1; Mon, 04 Oct 2021 17:52:45 -0400
X-MC-Unique: EYuZ6PbNO7id76xhWlWkgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34C2D1006AA2;
 Mon,  4 Oct 2021 21:52:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A5BB19723;
 Mon,  4 Oct 2021 21:52:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] docs: remove non-reference uses of single backticks
Date: Mon,  4 Oct 2021 17:52:36 -0400
Message-Id: <20211004215238.1523082-2-jsnow@redhat.com>
In-Reply-To: <20211004215238.1523082-1-jsnow@redhat.com>
References: <20211004215238.1523082-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 John Snow <jsnow@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single backtick markup in ReST is the "default role". Currently,
Sphinx's default role is called "content". Sphinx suggests you can use
the "Any" role instead to turn any single-backtick enclosed item into a
cross-reference.

This is useful for things like autodoc for Python docstrings, where it's
often nicer to reference other types with `foo` instead of the more
laborious :py:meth:`foo`. It's also useful in multi-domain cases to
easily reference definitions from other Sphinx domains, such as
referencing C code definitions from outside of kerneldoc comments.

Before we do that, though, we'll need to turn all existing usages of the
"content" role to inline verbatim markup wherever it does not correctly
resolve into a cross-refernece by using double backticks instead.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/fuzzing.rst                 | 9 +++++----
 docs/devel/tcg-plugins.rst             | 2 +-
 docs/interop/live-block-operations.rst | 2 +-
 docs/system/guest-loader.rst           | 2 +-
 qapi/block-core.json                   | 4 ++--
 include/qemu/module.h                  | 6 +++---
 qemu-options.hx                        | 4 ++--
 7 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 2749bb9bed3..784ecb99e66 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -182,10 +182,11 @@ The output should contain a complete list of matched MemoryRegions.
 
 OSS-Fuzz
 --------
-QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
-By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
-generic-fuzz target requires additional information provided in environment
-variables, we pre-define some generic-fuzz configs in
+QEMU is continuously fuzzed on `OSS-Fuzz
+<https://github.com/google/oss-fuzz>`_.  By default, the OSS-Fuzz build
+will try to fuzz every fuzz-target. Since the generic-fuzz target
+requires additional information provided in environment variables, we
+pre-define some generic-fuzz configs in
 ``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
 
 - ``.name``: To identify the fuzzer config
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 842ae01a4c5..72a1cd932ca 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -211,7 +211,7 @@ The hotpages plugin can be configured using the following arguments:
 
 This is an instruction classifier so can be used to count different
 types of instructions. It has a number of options to refine which get
-counted. You can give a value to the `count` argument for a class of
+counted. You can give a value to the ``count`` argument for a class of
 instructions to break it down fully, so for example to see all the system
 registers accesses::
 
diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 9e3635b2338..814c29bbe1d 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -640,7 +640,7 @@ at this point:
         (QEMU) block-job-complete device=job0
 
 In either of the above cases, if you once again run the
-`query-block-jobs` command, there should not be any active block
+``query-block-jobs`` command, there should not be any active block
 operation.
 
 Comparing 'commit' and 'mirror': In both then cases, the overlay images
diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
index 4320d1183f7..9ef9776bf07 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -51,4 +51,4 @@ The full syntax of the guest-loader is::
 
 ``bootargs=<args>``
   This is an optional field for kernel blobs which will pass command
-  like via the `/chosen/module@<addr>/bootargs` node.
+  like via the ``/chosen/module@<addr>/bootargs`` node.
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d3217abb60..52a6dae9522 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -491,11 +491,11 @@
 # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
 #
 # @recording: true if the bitmap is recording new writes from the guest.
-#             Replaces `active` and `disabled` statuses. (since 4.0)
+#             Replaces ``active`` and ``disabled`` statuses. (since 4.0)
 #
 # @busy: true if the bitmap is in-use by some operation (NBD or jobs)
 #        and cannot be modified via QMP or used by another operation.
-#        Replaces `locked` and `frozen` statuses. (since 4.0)
+#        Replaces ``locked`` and ``frozen`` statuses. (since 4.0)
 #
 # @persistent: true if the bitmap was stored on disk, is scheduled to be stored
 #              on disk, or both. (since 4.0)
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 3deac0078b9..5fcc323b2a7 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -77,14 +77,14 @@ void module_allow_arch(const char *arch);
 /**
  * DOC: module info annotation macros
  *
- * `scripts/modinfo-collect.py` will collect module info,
+ * ``scripts/modinfo-collect.py`` will collect module info,
  * using the preprocessor and -DQEMU_MODINFO.
  *
- * `scripts/modinfo-generate.py` will create a module meta-data database
+ * ``scripts/modinfo-generate.py`` will create a module meta-data database
  * from the collected information so qemu knows about module
  * dependencies and QOM objects implemented by modules.
  *
- * See `*.modinfo` and `modinfo.c` in the build directory to check the
+ * See ``*.modinfo`` and ``modinfo.c`` in the build directory to check the
  * script results.
  */
 #ifdef QEMU_MODINFO
diff --git a/qemu-options.hx b/qemu-options.hx
index 8ef178180db..2d5b5a1e60a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1895,8 +1895,8 @@ SRST
         Valid parameters are:
 
         ``grab-mod=<mods>`` : Used to select the modifier keys for toggling
-        the mouse grabbing in conjunction with the "g" key. `<mods>` can be
-        either `lshift-lctrl-lalt` or `rctrl`.
+        the mouse grabbing in conjunction with the "g" key. ``<mods>`` can be
+        either ``lshift-lctrl-lalt`` or ``rctrl``.
 
         ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing.
         This parameter is deprecated - use ``grab-mod`` instead.
-- 
2.31.1



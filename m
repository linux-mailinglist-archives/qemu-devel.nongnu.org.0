Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5B4435FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:48:08 +0100 (CET)
Received: from localhost ([::1]:55516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhypL-0005Qz-Hi
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhylu-0001pv-Ok
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhylr-0003y2-Oy
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635878670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xL0K16NyNcO526OYJPWoNTHW7+oRufouiGvKyHeGXZg=;
 b=ey2XGok3iWjWa67RwTJxYZexjnxVo5U17Vfm62PxPnLPp9q7p8ez1ZJPLtgGFTmcYrMlA/
 tRVcuAOmbcdrsR6dL9JdkoqIvi7gPOMgcEKprEvEdI8V9vWu2sfaBpePBcsywOZA1pOwde
 0+EKUOrebBnaWa9etXangfvowXdpCGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-RUXnAjtBO-mleuNHsLWBog-1; Tue, 02 Nov 2021 14:44:29 -0400
X-MC-Unique: RUXnAjtBO-mleuNHsLWBog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A6D050763;
 Tue,  2 Nov 2021 18:44:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C01619C79;
 Tue,  2 Nov 2021 18:44:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] docs: remove non-reference uses of single backticks
Date: Tue,  2 Nov 2021 14:43:57 -0400
Message-Id: <20211102184400.1168508-2-jsnow@redhat.com>
In-Reply-To: <20211102184400.1168508-1-jsnow@redhat.com>
References: <20211102184400.1168508-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Alexander Bulekov <alxndr@bu.edu>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 2749bb9bed..784ecb99e6 100644
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
index 842ae01a4c..72a1cd932c 100644
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
index 9e3635b233..814c29bbe1 100644
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
index 4320d1183f..9ef9776bf0 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -51,4 +51,4 @@ The full syntax of the guest-loader is::
 
 ``bootargs=<args>``
   This is an optional field for kernel blobs which will pass command
-  like via the `/chosen/module@<addr>/bootargs` node.
+  like via the ``/chosen/module@<addr>/bootargs`` node.
diff --git a/qapi/block-core.json b/qapi/block-core.json
index ce2c1352cb..96f4156890 100644
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
index 3deac0078b..5fcc323b2a 100644
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
index f051536b63..7749f59300 100644
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



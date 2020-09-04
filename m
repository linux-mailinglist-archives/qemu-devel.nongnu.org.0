Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFCA25D7D2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:50:04 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEAEF-0006a9-CC
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6A-0008DJ-OD
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:41:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55533
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA66-0005DT-O5
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:41:42 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-q6pt4B1SMQGWpqH6_LicRQ-1; Fri, 04 Sep 2020 07:41:36 -0400
X-MC-Unique: q6pt4B1SMQGWpqH6_LicRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2074789CCCC
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD6176633;
 Fri,  4 Sep 2020 11:41:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/46] meson: build qapi tests library
Date: Fri,  4 Sep 2020 07:40:49 -0400
Message-Id: <20200904114122.31307-14-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

- builds QAPI builtins types/visitor to fix a linking issue with
  unresolved symbols in the static library.

- work around a meson limitation on generated file output directories.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200828110734.1638685-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include    | 79 +--------------------------------------
 tests/include/meson.build | 16 ++++++++
 tests/meson.build         | 45 ++++++++++++++++++++++
 3 files changed, 62 insertions(+), 78 deletions(-)
 create mode 100644 tests/include/meson.build

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 5c05e84a9a..21adf106c1 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -34,23 +34,6 @@ endif
 ifneq ($(wildcard config-host.mak),)
 export SRC_PATH
 
-# TODO don't duplicate $(SRC_PATH)/Makefile's qapi-py here
-qapi-py = $(SRC_PATH)/scripts/qapi/__init__.py \
-$(SRC_PATH)/scripts/qapi/commands.py \
-$(SRC_PATH)/scripts/qapi/common.py \
-$(SRC_PATH)/scripts/qapi/doc.py \
-$(SRC_PATH)/scripts/qapi/error.py \
-$(SRC_PATH)/scripts/qapi/events.py \
-$(SRC_PATH)/scripts/qapi/expr.py \
-$(SRC_PATH)/scripts/qapi/gen.py \
-$(SRC_PATH)/scripts/qapi/introspect.py \
-$(SRC_PATH)/scripts/qapi/parser.py \
-$(SRC_PATH)/scripts/qapi/schema.py \
-$(SRC_PATH)/scripts/qapi/source.py \
-$(SRC_PATH)/scripts/qapi/types.py \
-$(SRC_PATH)/scripts/qapi/visit.py \
-$(SRC_PATH)/scripts/qapi-gen.py
-
 # Get the list of all supported sysemu targets
 SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
    $(wildcard $(SRC_PATH)/default-configs/*-softmmu.mak)))
@@ -162,36 +145,13 @@ check-unit-y += tests/test-uuid$(EXESUF)
 check-unit-y += tests/ptimer-test$(EXESUF)
 check-unit-y += tests/test-qapi-util$(EXESUF)
 
-generated-files-y += tests/test-qapi-types.h
-generated-files-y += tests/include/test-qapi-types-sub-module.h
-generated-files-y += tests/test-qapi-types-sub-sub-module.h
-generated-files-y += tests/test-qapi-visit.h
-generated-files-y += tests/include/test-qapi-visit-sub-module.h
-generated-files-y += tests/test-qapi-visit-sub-sub-module.h
-generated-files-y += tests/test-qapi-commands.h
-generated-files-y += tests/test-qapi-init-commands.h
-generated-files-y += tests/include/test-qapi-commands-sub-module.h
-generated-files-y += tests/test-qapi-commands-sub-sub-module.h
-generated-files-y += tests/test-qapi-emit-events.h
-generated-files-y += tests/test-qapi-events.h
-generated-files-y += tests/include/test-qapi-events-sub-module.h
-generated-files-y += tests/test-qapi-events-sub-sub-module.h
-generated-files-y += tests/test-qapi-introspect.h
-
 QEMU_CFLAGS += -I$(SRC_PATH)/tests -I$(SRC_PATH)/tests/qtest
 
 
 # Deps that are common to various different sets of tests below
 test-util-obj-y = libqemuutil.a
 test-qom-obj-y = $(qom-obj-y) $(test-util-obj-y)
-test-qapi-obj-y = tests/test-qapi-types.o \
-	tests/include/test-qapi-types-sub-module.o \
-	tests/test-qapi-types-sub-sub-module.o \
-	tests/test-qapi-visit.o \
-	tests/include/test-qapi-visit-sub-module.o \
-	tests/test-qapi-visit-sub-sub-module.o \
-	tests/test-qapi-introspect.o \
-	$(test-qom-obj-y)
+test-qapi-obj-y = $(test-qom-obj-y) tests/libtestqapi.a
 benchmark-crypto-obj-$(CONFIG_BLOCK) = $(authz-obj-y) $(crypto-obj-y) $(test-qom-obj-y)
 test-crypto-obj-$(CONFIG_BLOCK) = $(authz-obj-y) $(crypto-obj-y) $(test-qom-obj-y)
 test-io-obj-$(CONFIG_BLOCK) = $(io-obj-y) $(test-crypto-obj-y)
@@ -262,42 +222,6 @@ tests/test-logging$(EXESUF): tests/test-logging.o $(test-util-obj-y)
 tests/test-replication$(EXESUF): tests/test-replication.o $(test-util-obj-y) \
 	$(test-block-obj-y)
 
-tests/test-qapi-types.c tests/test-qapi-types.h \
-tests/include/test-qapi-types-sub-module.c \
-tests/include/test-qapi-types-sub-module.h \
-tests/test-qapi-types-sub-sub-module.c \
-tests/test-qapi-types-sub-sub-module.h \
-tests/test-qapi-visit.c tests/test-qapi-visit.h \
-tests/include/test-qapi-visit-sub-module.c \
-tests/include/test-qapi-visit-sub-module.h \
-tests/test-qapi-visit-sub-sub-module.c \
-tests/test-qapi-visit-sub-sub-module.h \
-tests/test-qapi-commands.h tests/test-qapi-commands.c \
-tests/include/test-qapi-commands-sub-module.h \
-tests/include/test-qapi-commands-sub-module.c \
-tests/test-qapi-commands-sub-sub-module.h \
-tests/test-qapi-commands-sub-sub-module.c \
-tests/test-qapi-emit-events.c tests/test-qapi-emit-events.h \
-tests/test-qapi-events.c tests/test-qapi-events.h \
-tests/test-qapi-init-commands.c \
-tests/test-qapi-init-commands.h \
-tests/include/test-qapi-events-sub-module.c \
-tests/include/test-qapi-events-sub-module.h \
-tests/test-qapi-events-sub-sub-module.c \
-tests/test-qapi-events-sub-sub-module.h \
-tests/test-qapi-introspect.c tests/test-qapi-introspect.h: \
-tests/test-qapi-gen-timestamp ;
-tests/test-qapi-gen-timestamp: \
-		$(SRC_PATH)/tests/qapi-schema/qapi-schema-test.json \
-		$(SRC_PATH)/tests/qapi-schema/include/sub-module.json \
-		$(SRC_PATH)/tests/qapi-schema/sub-sub-module.json \
-		$(qapi-py)
-	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-gen.py \
-		-o tests -p "test-" $<, \
-		"GEN","$(@:%-timestamp=%)")
-	@rm -f tests/test-qapi-doc.texi
-	@>$@
-
 tests/test-string-output-visitor$(EXESUF): tests/test-string-output-visitor.o $(test-qapi-obj-y)
 tests/test-string-input-visitor$(EXESUF): tests/test-string-input-visitor.o $(test-qapi-obj-y)
 tests/test-qmp-event$(EXESUF): tests/test-qmp-event.o $(test-qapi-obj-y) tests/test-qapi-emit-events.o tests/test-qapi-events.o
@@ -539,7 +463,6 @@ check-build: build-unit $(QEMU_IOTESTS_HELPERS-y)
 
 check-clean:
 	rm -rf $(check-unit-y) tests/*.o tests/*/*.o $(QEMU_IOTESTS_HELPERS-y)
-	rm -f tests/test-qapi-gen-timestamp
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
 check: check-unit
diff --git a/tests/include/meson.build b/tests/include/meson.build
new file mode 100644
index 0000000000..fea3a6342f
--- /dev/null
+++ b/tests/include/meson.build
@@ -0,0 +1,16 @@
+# an extra target to workaround meson limitation on output files location
+test_qapi_outputs_extra = [
+  'test-qapi-commands-sub-module.c',
+  'test-qapi-commands-sub-module.h',
+  'test-qapi-events-sub-module.c',
+  'test-qapi-events-sub-module.h',
+  'test-qapi-types-sub-module.c',
+  'test-qapi-types-sub-module.h',
+  'test-qapi-visit-sub-module.c',
+  'test-qapi-visit-sub-module.h',
+]
+
+test_qapi_outputs_extra = custom_target('QAPI test (include)',
+                                        output: test_qapi_outputs_extra,
+                                        input: test_qapi_files,
+                                        command: 'true')
diff --git a/tests/meson.build b/tests/meson.build
index fe2c6d8e6b..ab09a8d845 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,3 +1,48 @@
+test_qapi_outputs = [
+  'qapi-builtin-types.c',
+  'qapi-builtin-types.h',
+  'qapi-builtin-visit.c',
+  'qapi-builtin-visit.h',
+  'test-qapi-commands-sub-sub-module.c',
+  'test-qapi-commands-sub-sub-module.h',
+  'test-qapi-commands.c',
+  'test-qapi-commands.h',
+  'test-qapi-emit-events.c',
+  'test-qapi-emit-events.h',
+  'test-qapi-events-sub-sub-module.c',
+  'test-qapi-events-sub-sub-module.h',
+  'test-qapi-events.c',
+  'test-qapi-events.h',
+  'test-qapi-init-commands.c',
+  'test-qapi-init-commands.h',
+  'test-qapi-introspect.c',
+  'test-qapi-introspect.h',
+  'test-qapi-types-sub-sub-module.c',
+  'test-qapi-types-sub-sub-module.h',
+  'test-qapi-types.c',
+  'test-qapi-types.h',
+  'test-qapi-visit-sub-sub-module.c',
+  'test-qapi-visit-sub-sub-module.h',
+  'test-qapi-visit.c',
+  'test-qapi-visit.h',
+]
+
+test_qapi_files = custom_target('Test QAPI files',
+                                output: test_qapi_outputs,
+                                input: files('qapi-schema/qapi-schema-test.json',
+                                             'qapi-schema/include/sub-module.json',
+                                             'qapi-schema/sub-sub-module.json'),
+                                command: [ qapi_gen, '-o', meson.current_build_dir(),
+                                           '-b', '-p', 'test-', '@INPUT0@' ],
+                                depend_files: qapi_gen_depends)
+
+# meson doesn't like generated output in other directories
+# perhaps change qapi_gen to replace / with _, like Meson itself does?
+subdir('include')
+
+libtestqapi = static_library('testqapi', sources: [test_qapi_files, test_qapi_outputs_extra])
+testqapi = declare_dependency(link_with: libtestqapi)
+
 if have_system and 'CONFIG_POSIX' in config_host
   subdir('qemu-iotests')
 endif
-- 
2.26.2




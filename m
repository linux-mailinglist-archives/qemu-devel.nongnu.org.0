Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157102488DA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:13:10 +0200 (CEST)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83IT-0001Ys-3F
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Ln-0006JB-3T
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26087
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Lb-0007cx-1l
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bi9ja5Av8CC+q7OoJJ4MREcQKrWaiwdHrvnzwmu2BFw=;
 b=V4hyNcvsi4IImQV3sSTY98keXuS3N1pciqzdBQW00mNskjPvsfkZfJTULKaZKlt0rVNSKL
 1PgH3UvZibOW15AKhJQGE07ewA0HA7GOUajwQAHOimJVbolkxWG5Kmh9w7slRXpruCC4dL
 WXDyd45AH3LfzBvrUNVH5ZtqWdvQ9EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-ZQxoRrcwNeqzqHHnkYM8dQ-1; Tue, 18 Aug 2020 10:12:16 -0400
X-MC-Unique: ZQxoRrcwNeqzqHHnkYM8dQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73474186A56D
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:12:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F9E15C64D;
 Tue, 18 Aug 2020 14:12:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 135/150] meson: convert systemtap files
Date: Tue, 18 Aug 2020 10:10:10 -0400
Message-Id: <20200818141025.21608-136-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.target   | 85 ++---------------------------------------------
 meson.build       | 24 +++++++++++++
 rules.mak         |  3 --
 trace/meson.build | 14 ++++----
 4 files changed, 33 insertions(+), 93 deletions(-)

diff --git a/Makefile.target b/Makefile.target
index 8ee4c78b3f..a07149c0a6 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -6,88 +6,7 @@ include ../config-host.mak
 include config-target.mak
 include $(SRC_PATH)/rules.mak
 
-$(call set-vpath, $(SRC_PATH):$(BUILD_DIR))
-
-ifdef CONFIG_USER_ONLY
-# user emulator name
-QEMU_PROG=qemu-$(TARGET_NAME)
-else
-# system emulator name
-QEMU_PROG=qemu-system-$(TARGET_NAME)$(EXESUF)
-endif
-
-STPFILES=
-
-ifdef CONFIG_TRACE_SYSTEMTAP
-stap: $(QEMU_PROG).stp-installed $(QEMU_PROG).stp $(QEMU_PROG)-simpletrace.stp $(QEMU_PROG)-log.stp
-
-ifdef CONFIG_USER_ONLY
-TARGET_TYPE=user
-else
-TARGET_TYPE=system
-endif
-
-tracetool-y = $(SRC_PATH)/scripts/tracetool.py
-tracetool-y += $(shell find $(SRC_PATH)/scripts/tracetool -name "*.py")
-
-$(QEMU_PROG).stp-installed: $(BUILD_DIR)/trace/trace-events-all $(tracetool-y)
-	$(call quiet-command,$(TRACETOOL) \
-		--group=all \
-		--format=stap \
-		--backends=$(TRACE_BACKENDS) \
-		--binary=$(bindir)/$(QEMU_PROG) \
-		--target-name=$(TARGET_NAME) \
-		--target-type=$(TARGET_TYPE) \
-		$< > $@,"GEN","$(TARGET_DIR)$(QEMU_PROG).stp-installed")
-
-$(QEMU_PROG).stp: $(BUILD_DIR)/trace/trace-events-all $(tracetool-y)
-	$(call quiet-command,$(TRACETOOL) \
-		--group=all \
-		--format=stap \
-		--backends=$(TRACE_BACKENDS) \
-		--binary=$(realpath .)/$(QEMU_PROG) \
-		--target-name=$(TARGET_NAME) \
-		--target-type=$(TARGET_TYPE) \
-		$< > $@,"GEN","$(TARGET_DIR)$(QEMU_PROG).stp")
-
-$(QEMU_PROG)-simpletrace.stp: $(BUILD_DIR)/trace/trace-events-all $(tracetool-y)
-	$(call quiet-command,$(TRACETOOL) \
-		--group=all \
-		--format=simpletrace-stap \
-		--backends=$(TRACE_BACKENDS) \
-		--probe-prefix=qemu.$(TARGET_TYPE).$(TARGET_NAME) \
-		$< > $@,"GEN","$(TARGET_DIR)$(QEMU_PROG)-simpletrace.stp")
-
-$(QEMU_PROG)-log.stp: $(BUILD_DIR)/trace/trace-events-all $(tracetool-y)
-	$(call quiet-command,$(TRACETOOL) \
-		--group=all \
-		--format=log-stap \
-		--backends=$(TRACE_BACKENDS) \
-		--probe-prefix=qemu.$(TARGET_TYPE).$(TARGET_NAME) \
-		$< > $@,"GEN","$(TARGET_DIR)$(QEMU_PROG)-log.stp")
-
-else
-stap:
-endif
-.PHONY: stap
-
-all: stap
-
-clean:
-	rm -f *.a *~
-	rm -f $(shell find . -name '*.[od]')
-	rm -f hmp-commands.h gdbstub-xml.c
-	rm -f trace/generated-helpers.c trace/generated-helpers.c-timestamp
-ifdef CONFIG_TRACE_SYSTEMTAP
-	rm -f *.stp
-endif
-
+all:
 install: all
-ifdef CONFIG_TRACE_SYSTEMTAP
-	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/../systemtap/tapset"
-	$(INSTALL_DATA) $(QEMU_PROG).stp-installed "$(DESTDIR)$(qemu_datadir)/../systemtap/tapset/$(QEMU_PROG).stp"
-	$(INSTALL_DATA) $(QEMU_PROG)-simpletrace.stp "$(DESTDIR)$(qemu_datadir)/../systemtap/tapset/$(QEMU_PROG)-simpletrace.stp"
-	$(INSTALL_DATA) $(QEMU_PROG)-log.stp "$(DESTDIR)$(qemu_datadir)/../systemtap/tapset/$(QEMU_PROG)-log.stp"
-endif
-
+	
 .PHONY: all clean install
diff --git a/meson.build b/meson.build
index ce8318b991..eabc09ee04 100644
--- a/meson.build
+++ b/meson.build
@@ -955,6 +955,30 @@ foreach target : target_dirs
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
                gui_app: exe['gui'])
+
+    if 'CONFIG_TRACE_SYSTEMTAP' in config_host
+      foreach stp: [
+        {'ext': '.stp-build', 'fmt': 'stap', 'bin': meson.current_build_dir() / exe_name, 'install': false},
+        {'ext': '.stp', 'fmt': 'stap', 'bin': get_option('prefix') / get_option('bindir') / exe_name, 'install': true},
+        {'ext': '-simpletrace.stp', 'fmt': 'simpletrace-stap', 'bin': '', 'install': true},
+        {'ext': '-log.stp', 'fmt': 'log-stap', 'bin': '', 'install': true},
+      ]
+        custom_target(exe_name + stp['ext'],
+                      input: trace_events_all,
+                      output: exe_name + stp['ext'],
+                      capture: true,
+                      install: stp['install'],
+                      install_dir: config_host['qemu_datadir'] / '../systemtap/tapset',
+                      command: [
+                        tracetool, '--group=all', '--format=' + stp['fmt'],
+                        '--binary=' + stp['bin'],
+                        '--target-name=' + target_name,
+                        '--target-type=' + target_type,
+                        '--probe-prefix=qemu.' + target_type + '.' + target_name,
+                        '@INPUT@',
+                      ])
+      endforeach
+    endif
   endforeach
 endforeach
 
diff --git a/rules.mak b/rules.mak
index 6488dc3dc6..b983c7f83f 100644
--- a/rules.mak
+++ b/rules.mak
@@ -199,9 +199,6 @@ ne = $(if $(subst $2,,$1)$(subst $1,,$2),y,n)
 isempty = $(if $1,n,y)
 notempty = $(if $1,y,n)
 
-# Generate files with tracetool
-TRACETOOL=$(PYTHON) $(SRC_PATH)/scripts/tracetool.py
-
 .PHONY: clean-timestamp
 clean-timestamp:
 	rm -f *.timestamp
diff --git a/trace/meson.build b/trace/meson.build
index 9c3c128164..56e870848e 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -49,13 +49,13 @@ foreach dir : [ '.' ] + trace_events_subdirs
   endif
 endforeach
 
-custom_target('trace-events-all',
-              output: 'trace-events-all',
-              input: trace_events_files,
-              command: [ 'cat', '@INPUT@' ],
-              capture: true,
-              install: true,
-              install_dir: config_host['qemu_datadir'])
+trace_events_all = custom_target('trace-events-all',
+                                 output: 'trace-events-all',
+                                 input: trace_events_files,
+                                 command: [ 'cat', '@INPUT@' ],
+                                 capture: true,
+                                 install: true,
+                                 install_dir: config_host['qemu_datadir'])
 
 foreach d : [
   ['generated-tcg-tracers.h', 'tcg-h'],
-- 
2.26.2




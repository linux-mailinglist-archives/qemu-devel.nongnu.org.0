Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500824D3E5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:26:12 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95BS-0002FG-V6
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Eq-00041k-SI
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60314
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ee-0001xY-Ff
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yLvS3chOBTxh9KibYsC84io3BoXi9vbCTkKHIsRL7c=;
 b=KCYQqz1otLHeIOXUrE97eRQnq496GxNKhWiSAMGIZb3HKwQ0GT7EhLUOApLIZBGqbcqIFh
 FKGqWEZG+9clI5fEg/uDZXbIEnxOalQz4DhruCM6Ymx/o4KJj6gqz3xlAZrSJwSaOci++7
 AFfOJNGK59w923O9WxqJD8Sh06H0GRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-QLONWJclOzu0l5UDkM8-TQ-1; Fri, 21 Aug 2020 06:25:21 -0400
X-MC-Unique: QLONWJclOzu0l5UDkM8-TQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BF20191E2A2
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396317AEC5;
 Fri, 21 Aug 2020 10:25:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 137/152] meson: convert systemtap files
Date: Fri, 21 Aug 2020 06:23:14 -0400
Message-Id: <20200821102329.29777-138-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
index 9db1b7b705..108706f7e5 100644
--- a/meson.build
+++ b/meson.build
@@ -958,6 +958,30 @@ foreach target : target_dirs
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




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DD224D2FC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:44:30 +0200 (CEST)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94X7-0007pB-Bd
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Di-0001tm-OH
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DX-0001bG-8V
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxRmxU806zYvkiylG7S95xkTXlDZAsWNyonD9C2PFxg=;
 b=D5hbKcC9tu6rhK+6V6ozTx1BbNDDJ6bp79VoDMjAsshEQISRHEY/4fizS9zjTspsLsdfcx
 9xXo97cuWzoFFncuNfBs5m/ZdmKq5blPlG7zoh1ml0T2begxQpEi3YvtBi+FTpkRuS87fZ
 WydBDREvLO0QlvqZnNNLSoNnPK7hcfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-t99EBUHbNx2Iy6Bl3ze8pg-1; Fri, 21 Aug 2020 06:24:12 -0400
X-MC-Unique: t99EBUHbNx2Iy6Bl3ze8pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC84D425DC
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CB715C1D0;
 Fri, 21 Aug 2020 10:24:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 049/152] meson: keymap-gen
Date: Fri, 21 Aug 2020 06:21:46 -0400
Message-Id: <20200821102329.29777-50-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
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
 Makefile       | 38 --------------------------------------
 meson.build    |  1 +
 ui/meson.build | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 38 deletions(-)
 create mode 100644 ui/meson.build

diff --git a/Makefile b/Makefile
index 39633ec7db..c07b6bb5b8 100644
--- a/Makefile
+++ b/Makefile
@@ -141,44 +141,6 @@ generated-files-y += module_block.h
 
 generated-files-y += .git-submodule-status
 
-KEYCODEMAP_GEN = $(SRC_PATH)/ui/keycodemapdb/tools/keymap-gen
-KEYCODEMAP_CSV = $(SRC_PATH)/ui/keycodemapdb/data/keymaps.csv
-
-KEYCODEMAP_FILES = \
-		 ui/input-keymap-atset1-to-qcode.c.inc \
-		 ui/input-keymap-linux-to-qcode.c.inc \
-		 ui/input-keymap-qcode-to-atset1.c.inc \
-		 ui/input-keymap-qcode-to-atset2.c.inc \
-		 ui/input-keymap-qcode-to-atset3.c.inc \
-		 ui/input-keymap-qcode-to-linux.c.inc \
-		 ui/input-keymap-qcode-to-qnum.c.inc \
-		 ui/input-keymap-qcode-to-sun.c.inc \
-		 ui/input-keymap-qnum-to-qcode.c.inc \
-		 ui/input-keymap-usb-to-qcode.c.inc \
-		 ui/input-keymap-win32-to-qcode.c.inc \
-		 ui/input-keymap-x11-to-qcode.c.inc \
-		 ui/input-keymap-xorgevdev-to-qcode.c.inc \
-		 ui/input-keymap-xorgkbd-to-qcode.c.inc \
-		 ui/input-keymap-xorgxquartz-to-qcode.c.inc \
-		 ui/input-keymap-xorgxwin-to-qcode.c.inc \
-		 ui/input-keymap-osx-to-qcode.c.inc \
-		 $(NULL)
-
-generated-files-$(CONFIG_SOFTMMU) += $(KEYCODEMAP_FILES)
-
-ui/input-keymap-%.c.inc: $(KEYCODEMAP_GEN) $(KEYCODEMAP_CSV) $(SRC_PATH)/ui/Makefile.objs
-	$(call quiet-command,\
-	    stem=$* && src=$${stem%-to-*} dst=$${stem#*-to-} && \
-	    test -e $(KEYCODEMAP_GEN) && \
-	    $(PYTHON) $(KEYCODEMAP_GEN) \
-	          --lang glib2 \
-	          --varname qemu_input_map_$${src}_to_$${dst} \
-	          code-map $(KEYCODEMAP_CSV) $${src} $${dst} \
-	        > $@ || rm -f $@, "GEN", "$@")
-
-$(KEYCODEMAP_GEN): .git-submodule-status
-$(KEYCODEMAP_CSV): .git-submodule-status
-
 edk2-decompressed = $(basename $(wildcard pc-bios/edk2-*.fd.bz2))
 pc-bios/edk2-%.fd: pc-bios/edk2-%.fd.bz2
 	$(call quiet-command,bzip2 -d -c $< > $@,"BUNZIP2",$<)
diff --git a/meson.build b/meson.build
index 3e9e0a9b33..b4a2f9db3a 100644
--- a/meson.build
+++ b/meson.build
@@ -292,6 +292,7 @@ subdir('trace')
 subdir('util')
 subdir('crypto')
 subdir('storage-daemon')
+subdir('ui')
 
 # Build targets from sourcesets
 
diff --git a/ui/meson.build b/ui/meson.build
new file mode 100644
index 0000000000..a6aa7f2b36
--- /dev/null
+++ b/ui/meson.build
@@ -0,0 +1,34 @@
+keymaps = [
+  ['atset1', 'qcode'],
+  ['linux', 'qcode'],
+  ['qcode', 'atset1'],
+  ['qcode', 'atset2'],
+  ['qcode', 'atset3'],
+  ['qcode', 'linux'],
+  ['qcode', 'qnum'],
+  ['qcode', 'sun'],
+  ['qnum', 'qcode'],
+  ['usb', 'qcode'],
+  ['win32', 'qcode'],
+  ['x11', 'qcode'],
+  ['xorgevdev', 'qcode'],
+  ['xorgkbd', 'qcode'],
+  ['xorgxquartz', 'qcode'],
+  ['xorgxwin', 'qcode'],
+  ['osx', 'qcode'],
+]
+
+if have_system
+  foreach e : keymaps
+    output = 'input-keymap-@0@-to-@1@.c.inc'.format(e[0], e[1])
+    genh += custom_target(output,
+                  output: output,
+                  capture: true,
+                  build_by_default: true, # to be removed when added to a target
+                  input: files('keycodemapdb/data/keymaps.csv'),
+                  command: [python.full_path(), files('keycodemapdb/tools/keymap-gen'),
+                            '--lang', 'glib2',
+                            '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
+                            'code-map', '@INPUT0@', e[0], e[1]])
+  endforeach
+endif
-- 
2.26.2




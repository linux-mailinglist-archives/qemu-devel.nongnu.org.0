Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750A14C0EC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:26:44 +0100 (CET)
Received: from localhost ([::1]:36072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWVW-0000e5-US
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV8b-0005CS-LR
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:58:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV8a-0001ev-IA
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:58:57 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:32915)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV8a-0001b6-B4
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:58:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m10so2326220wmc.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y6aarOlqeEYb9zVlMhA1Wi0kU2BUV7vynZz97xCsCcg=;
 b=KJAB6R+14LnVJ4xAbOB9SyjTrRjPAMfdPbP6ynakG9o5TVrCobmu/aUnjOA3mMJXUV
 myFJbagU58aKJE7fO8BgTUAFJXpfVOkv1XrpHLkgq8KeGOldwqbhWesekWPoiHz/iCrR
 /AFvwVjF/W6hEcLpFPqVyTPWc6Dh59vOwhOfUXXpSuFSm0ss/8krm1eoH4/eCn6WFGhI
 jvnGJenY6jr+B4lS5JXtZi9fxlluMFn67LjIg6hEf2+c7M2pbCleeNswx/ztoSRlHIzX
 ESZonGynOQ6CYQHyxe0eB+zgpX14VnUIVOvQ4jtblDsX7yVPxanfXOjiLPYcIul5y+fi
 khew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y6aarOlqeEYb9zVlMhA1Wi0kU2BUV7vynZz97xCsCcg=;
 b=PQTVqQlEXdevVgwpkaswEbwTq2ADGRQDkp2shvRPse5TxMvRty/7ncGSXBc44QlCoa
 dqgYEtJbxvhaH+tPGOyopGLcUr/rtnYaufvERfBj0gW1M6U9sMjey1eLIFTHaUNcyI4x
 f02av8x9L2plVqIXAMOl0WHI99ZUgwbdoKyUWZf2PMVfNzMqvfdeq36w/M+GS0TCd2lE
 UNxrxca/hNkRkVFNGWHypOs9u6fxROmtREngiyfKw8W1Orqu7Ff5fMXAzl2CSHh91GrX
 DX65mlNvTXlsdJkXXy6hwAy5yOQQAny4m1gtSFfxD1JxWFMFruhGXoqMifr8eiC6Z2Uh
 o4vA==
X-Gm-Message-State: APjAAAWFViySQW7VsVBisTL3UTY8x4j1GMWbVpKruj9YPTYXJGivLQmj
 jH6mqZhdCvbtX8wCJqmRpzH8WxO6
X-Google-Smtp-Source: APXvYqxWXhNC0TQB6gKxXNWZJP5lLBWISaUOCwjf/ejnp9uMrpKIagZ0YAqBaQKxlqW+BxKnp4hkGw==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr6251114wmd.69.1580234331810; 
 Tue, 28 Jan 2020 09:58:51 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:58:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 128/142] meson: install edk2
Date: Tue, 28 Jan 2020 18:53:28 +0100
Message-Id: <20200128175342.9066-129-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
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
---
 Makefile            | 9 +--------
 pc-bios/meson.build | 3 +++
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 98582518a8..e4b3470b36 100644
--- a/Makefile
+++ b/Makefile
@@ -107,7 +107,6 @@ CONFIG_BLOCK := $(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS))
 
 generated-files-y += .git-submodule-status
 
-edk2-decompressed = $(basename $(wildcard pc-bios/edk2-*.fd.bz2))
 # Don't try to regenerate Makefile or configure
 # We don't generate any of them
 Makefile: ;
@@ -263,18 +262,12 @@ endif
 
 ICON_SIZES=16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512
 
-install: all install-datadir install-localstatedir \
-	$(if $(INSTALL_BLOBS),$(edk2-decompressed))
+install: all install-datadir install-localstatedir
 ifneq ($(BLOBS),)
 	set -e; for x in $(BLOBS); do \
 		$(INSTALL_DATA) $(SRC_PATH)/pc-bios/$$x "$(DESTDIR)$(qemu_datadir)"; \
 	done
 endif
-ifdef INSTALL_BLOBS
-	set -e; for x in $(edk2-decompressed); do \
-		$(INSTALL_DATA) $$x "$(DESTDIR)$(qemu_datadir)"; \
-	done
-endif
 ifneq ($(DESCS),)
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/firmware"
 	set -e; tmpf=$$(mktemp); trap 'rm -f -- "$$tmpf"' EXIT; \
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 8a3d335545..792679d396 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,5 +1,6 @@
 bzip2 = find_program('bzip2')
 
+install_blobs = 'INSTALL_BLOBS' in config_host
 if 'DECOMPRESS_EDK2_BLOBS' in config_host
   fds = [
     'edk2-aarch64-code.fd',
@@ -18,6 +19,8 @@ if 'DECOMPRESS_EDK2_BLOBS' in config_host
                   input: '@0@.bz2'.format(f),
                   capture: true,
                   build_by_default: true,
+                  install: install_blobs,
+                  install_dir: config_host['qemu_datadir'],
                   command: [ bzip2, '-dc', '@INPUT0@' ])
   endforeach
 endif
-- 
2.21.0




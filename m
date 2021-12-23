Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F647E2CA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:59:51 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MlC-00025o-JO
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0004I2-Ea
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:45 -0500
Received: from [2a00:1450:4864:20::42d] (port=35766
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdJ-0008Pc-Sf
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j18so10979858wrd.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXaX0NZlXf5xtjrp7wFL+/5LpJ8uJ0qMhM0hjMnqlVg=;
 b=U8ME/HgKRojG/XlJO+pF6YKGeKVKmzR/IKPm7e3RpWl1AcPjQclKXcLVctJi2eCtIX
 yCTWBDBYiB4glTKKKQI48I42pXRqhNE9y/vn9J5gLCeDbVTkk2nypkKpQRcuXLRQTm1S
 FPs3dhkJRM6aNr4Neb/1Cpy421E2WSpe5uh//lQVlm1oXLCW/ZT+f5vNK7TMrJwLN+IM
 GaZQyc5IDVthLpoBVoNt8SaHpXnKzkrIEsG3du4ekN8/Fqb409XpJEYr0xBWVkDtuNY6
 eWENqgbIUCjGuuTi+46QiCXa3yjkebO5FfnTlNgo2z7d+mu0ElaPYZ0TMfDIENvpA9Go
 DiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iXaX0NZlXf5xtjrp7wFL+/5LpJ8uJ0qMhM0hjMnqlVg=;
 b=K/w5F/MjnlTZL2yXuAJPdKRRjLOWJeS7Lb9tqQhASMVDWcVIGcAb6lezCVbGJ6HW94
 5JtA4gimBk8r/8y/rven9sGvxet46TYYrLE0+X81r8yPoNqAZXFDYmhCnonqK/bpYkrd
 2+0c+c73IqGz+p3HAxFMfxbWo1WNvE1pNKDoi/fs9YNzWg//LGbi273DAOtRvHsWx7Gs
 i1DQOhQY8xs67mxQwHu2XIk2JZdqZy1+VgG4CPvjIG1s+gikTUxCNDWGUzmY83uZqgAf
 30O8A4DrbjLvVlm6F2d52TDvTSu8aY/eBW3eyhJ/PuP2ylNPHiaRj5WZ2XvT0Kw+r1a4
 lMTw==
X-Gm-Message-State: AOAM53313q1APnucfxrIdIxk+pAX4zrf8HsmWEtXHY/b5YFr7Ej2mfgP
 JTQ5RWrv9K/xRSwAX48IrJ2A+cISbdE=
X-Google-Smtp-Source: ABdhPJzPj6dyrdb6UAHC8hO362Jxb4Uk5fmGCM5lu24bj1OdRyduZ9S4G4ZMfXYoITMXzLVNVd7AmQ==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr1520585wrq.65.1640260300662; 
 Thu, 23 Dec 2021 03:51:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] configure, makefile: remove traces of really old files
Date: Thu, 23 Dec 2021 12:51:27 +0100
Message-Id: <20211223115134.579235-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These files have been removed for more than year in the best
case, or for more than ten years for some really old TCG files.
Remove any traces of it.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile  | 11 ++++-------
 configure |  9 ---------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index 74c5b46d38..06ad8a61e1 100644
--- a/Makefile
+++ b/Makefile
@@ -205,14 +205,11 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 clean: recurse-clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
-# avoid old build problems by removing potentially incorrect old files
-	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
 	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
 		-exec rm {} +
-	rm -f TAGS cscope.* *.pod *~ */*~
-	rm -f fsdev/*.pod scsi/*.pod
+	rm -f TAGS cscope.* *~ */*~
 
 VERSION = $(shell cat $(SRC_PATH)/VERSION)
 
@@ -223,10 +220,10 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak config-host.h* config-poison.h
+	rm -f config-host.mak config-poison.h
 	rm -f tests/tcg/config-*.mak
-	rm -f config-all-disas.mak config.status
-	rm -f roms/seabios/config.mak roms/vgabios/config.mak
+	rm -f config.status
+	rm -f roms/seabios/config.mak
 	rm -f qemu-plugins-ld.symbols qemu-plugins-ld64.symbols
 	rm -f *-config-target.h *-config-devices.mak *-config-devices.h
 	rm -rf meson-private meson-logs meson-info compile_commands.json
diff --git a/configure b/configure
index 6516ec243c..c8b32e7277 100755
--- a/configure
+++ b/configure
@@ -3665,9 +3665,6 @@ fi
 # so the build tree will be missing the link back to the new file, and
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
-# UNLINK is used to remove symlinks from older development versions
-# that might get into the way when doing "git update" without doing
-# a "make distclean" in between.
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
@@ -3679,7 +3676,6 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
-UNLINK="pc-bios/keymaps"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.elf \
@@ -3701,11 +3697,6 @@ for f in $LINKS ; do
         symlink "$source_path/$f" "$f"
     fi
 done
-for f in $UNLINK ; do
-    if [ -L "$f" ]; then
-        rm -f "$f"
-    fi
-done
 
 (for i in $cross_cc_vars; do
   export $i
-- 
2.33.1




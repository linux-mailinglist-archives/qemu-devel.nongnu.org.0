Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BA489BA7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:55:44 +0100 (CET)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w5H-0006bH-Al
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:55:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqu-00021q-W2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:53 -0500
Received: from [2a00:1450:4864:20::534] (port=36664
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqt-0000T6-BB
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:52 -0500
Received: by mail-ed1-x534.google.com with SMTP id 30so52820371edv.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvMthZElZ4YxiJxc6dcCrsKO7zA6i6/j/5QIhBOtySI=;
 b=l82y339lWW2O09dJ6JTO6iJw0q8y/QxnLXuX+U1JmJS4kjRgM1rhEwVZCpBs2fNU5M
 ZsHmOP0T6/OoBzP4HA0ryj1DLIzsBihElaFc6JHMiKBd2Eit1WFgY4tI/Dozs1S8F+oU
 bIur9Dh4nVE2w3Vd/VOAaf/ZTYawwnvYrGSfftw5JbpsKUUHIlDdtGA9LG1rXeh1wZGh
 vHrjiLyorsBceky2iqJQmlyxF6ysJaIkwyY20EiY0MQywQQzDM88/e8mYmUXBFGHSl23
 MdilqammoQIu0bQQo8QZ5pdBLY0ogM/F2+/r/0KX0XXBXRrhrR34ROeE177FTwEix+KQ
 1cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yvMthZElZ4YxiJxc6dcCrsKO7zA6i6/j/5QIhBOtySI=;
 b=f0prseE8oUITKTM0+YGF2TRTP4Vv6uiil4z5cdSn0YZ9wqLK4zmTf6qKCxyV7Rua1M
 2zfbMKS1zh3N25orGpbG3tqfESRuAwT3+kzgn7IKuPGYXFaTEhOqiXmhBqdisojEYuYy
 9alCbNqrJch9BSzv3skxNgPDfaNAojNVMXkE2r+Dorvs+VOBLuI4Xv8PYvW5eRlNAjvi
 KNwOBZ9NBXvPavtSUVmVtB9N6ICu+M6XpKf7C1cyRgN3O+S8p2jYkSndiMkRQPGiavt4
 jzdFjVUKPgPzLYMrkx1oyOv8abbMPsySdXdS+uEgfWRx1QSShmQ4o+2VaIZOTou+2tm8
 KodQ==
X-Gm-Message-State: AOAM530RphuEnn2AcpV8BQoV4rHtwsn7zjcWvFesrbXgnd6CYvfkMGsn
 pOmRq3TaFuQXg2wBKLXRBTCYKlhyCaw=
X-Google-Smtp-Source: ABdhPJw50NU2plrVTdOUwH0onMzirC9EM+rQL2kMrTxYgG7PEnNcIUVHqtI0iwthLYBEAIv561RvmQ==
X-Received: by 2002:a17:906:7315:: with SMTP id
 di21mr51628ejc.700.1641825648893; 
 Mon, 10 Jan 2022 06:40:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] configure, makefile: remove traces of really old files
Date: Mon, 10 Jan 2022 15:40:23 +0100
Message-Id: <20220110144034.67410-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
index 5d66c35ea5..8037f73b35 100644
--- a/Makefile
+++ b/Makefile
@@ -206,14 +206,11 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
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
 
@@ -224,10 +221,10 @@ qemu-%.tar.bz2:
 
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
index f35d3f198f..a02febe09c 100755
--- a/configure
+++ b/configure
@@ -3672,9 +3672,6 @@ fi
 # so the build tree will be missing the link back to the new file, and
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
-# UNLINK is used to remove symlinks from older development versions
-# that might get into the way when doing "git update" without doing
-# a "make distclean" in between.
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
@@ -3686,7 +3683,6 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
-UNLINK="pc-bios/keymaps"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.elf \
@@ -3708,11 +3704,6 @@ for f in $LINKS ; do
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




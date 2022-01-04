Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57B48444B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:11:03 +0100 (CET)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lSo-0006Nj-R6
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:11:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGS-00076m-MZ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:18 -0500
Received: from [2a00:1450:4864:20::52d] (port=37608
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGQ-0004Sc-Jm
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:15 -0500
Received: by mail-ed1-x52d.google.com with SMTP id o6so149607684edc.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRHc5XYjpxHdggyvc6/mmrmqnbR8kQ1dcW31WaOO5JU=;
 b=afmq4Zzid/4VrJhtXkqy2WQUilhAqHoKSHSW3hAZ94HiFjNGBZI7NJIQbhPG/QLqSS
 qIBSbTL5MxlSn0LmQmWMYejFHM36HHvuo05GOOEtBgRyfKgRyKcxUzkmhwsTJADrPxh4
 ATQCHBecMLkJ78L6ugd0TqOP1G44dG5U1iVHh3GfVfIL9RmEOQcUdu4Z8LRW4Kq9wXgV
 tUwistboiUfYdYQbBEvctA6JADPSQcpNBMCZ9qzTjJ3qyXfQaXJOuKTxMDrNdqKZsqly
 DCHJiyq4zsJxiAENnsmG9Xu4wWlRzc7eEqfr+DahJCxj8VY3Qiatii858cbQJj4olIJk
 4gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DRHc5XYjpxHdggyvc6/mmrmqnbR8kQ1dcW31WaOO5JU=;
 b=UEmqg5xSn4/52HJBfYiHzkxrsaRpF7xey7HT+bE00nxMvHVwwC+P/aCRNllxjhwJ/3
 itnPGxTeuXOoLlQBSDmURVzOU2Rn2J9HG5WJKqvOMSLkDC3WO/Shz2IF11rXgAkpGv39
 vULRhe1eOuv7PbTPLiBbKCY4jI8bIdugDFvX5ksL0wOvRQDm0gJs6lcr5BDUQWd48+GO
 M8ddamXeqwwIL+yZlwI428HiBJfXOUpW++/S3BIr24uqLj8zipeEn/5f8KXwO/tmCXFU
 2NvczqnUclroOFhohbu1z6cVqjcjduAwkiCLnpsZ8u5vZBwPMF4SeRoNzgEotlT9Ysb7
 xkDw==
X-Gm-Message-State: AOAM530QaJCFF1XOUtxFR12uyAQJKxzLrkTOIZVj173f4kuKVwQhiycl
 Egkc3BMyCr/YRVjfjBev/h3rc5qHiNk=
X-Google-Smtp-Source: ABdhPJxC3L9FoYoK5h+t4dGmyLwMY3MT4ICO4f2+dBvf3Bbh4y6WyLbbyLa9YaQVBAoCAWQIvltCig==
X-Received: by 2002:a17:907:d93:: with SMTP id
 go19mr41609638ejc.537.1641308292221; 
 Tue, 04 Jan 2022 06:58:12 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] configure, makefile: remove traces of really old files
Date: Tue,  4 Jan 2022 15:57:41 +0100
Message-Id: <20220104145749.417387-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
index b93ba2c86c..851eb35dbe 100755
--- a/configure
+++ b/configure
@@ -3671,9 +3671,6 @@ fi
 # so the build tree will be missing the link back to the new file, and
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
-# UNLINK is used to remove symlinks from older development versions
-# that might get into the way when doing "git update" without doing
-# a "make distclean" in between.
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
@@ -3685,7 +3682,6 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
-UNLINK="pc-bios/keymaps"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.elf \
@@ -3707,11 +3703,6 @@ for f in $LINKS ; do
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




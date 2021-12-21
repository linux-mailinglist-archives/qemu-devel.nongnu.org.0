Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88F47BE98
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:09:46 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzd1d-0004y3-R8
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:09:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxb-0005K8-RF
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:36 -0500
Received: from [2a00:1450:4864:20::42e] (port=37785
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxZ-0004yr-6d
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t26so26133904wrb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBRmli3hhL/7GvJj9LProoyaec9zZHPpYyiOBrHlW/I=;
 b=JgAoRSkmgDSR5Ppw5D/LzRihZGFhRm3Gyak3dnPZtZuYXZbuXTF3eL/ExUq9mVrtIG
 I3jwhTkN8H/AbJn61qV53z86kpORKE8owGG7QlF8dvveziQml9jyWoRtNvmo5hwcMhsd
 EQf78UYntS+7AJgMusUI22Wam4x8YO3PX3v3ItXVoBGwUOv2JclFDxEsq5yI8DujxEYn
 ICifnj87l4mqqlgkfkeNPmCwOA++A8hqcaly2sRhbsUu82VNX6URuhBUyGuObJ3RCtV6
 zUwcbd4mZ1GOvtuQfVLwbfxcE39CS0GzjsAOGHGS4V5mf1Ltjb4VdBZHso31koAAK+fx
 cr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NBRmli3hhL/7GvJj9LProoyaec9zZHPpYyiOBrHlW/I=;
 b=ZS8dxmZHpH0B2sA/m0cbnryC+Pp/Yb48IX4ZjtNfc3lhjizfSG3bnI3IciuEGLil1V
 p8CnpZZI7HsCGaJz/7EXmo2vnZMS4vpeAnoOR7fhIUSOokcXP9phJoCXOp/uqF6DVXLJ
 8xTDZ/RAGWYwYBzGUMah96n8jO7X/NJhjeEui8KV6ZiAZJivYL2vYNfV3bjJO+oojc/Z
 aZVvZz15UIk5j73gLeNUyDFHKfiWlz5bvye5DgQWDRBOrj1zUgKufi3U21HYuNTnp/iG
 Ste/ou9aGbbdo1pzZRgpGvokvH72fn2vKfeIgJukHAuHM/6bc0LknPuUGBdt/kJL75Zd
 Ndew==
X-Gm-Message-State: AOAM530SS9vY+DYXBP3OeidpJPpXOBZZY8oI37NocuzrQTSqTVnvsrUp
 RMaBoRVgv/wwu2mZxKpdxaqFbsUiuXE=
X-Google-Smtp-Source: ABdhPJzcoZRcFqrF4ddIyE6fXh8zXwnucE9GwogF0hJbvYyjJ/qMuawIneAGYMlIuV89HMQMKMIXiA==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr2135878wrw.152.1640084731871; 
 Tue, 21 Dec 2021 03:05:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] configure, makefile: remove traces of really old files
Date: Tue, 21 Dec 2021 12:05:21 +0100
Message-Id: <20211221110526.351709-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These files have been removed for more than year in the best
case, or for more than ten years for some really old TCG files.
Remove any traces of it.

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
index 6dafbcd362..e09e5bb58f 100755
--- a/configure
+++ b/configure
@@ -3696,9 +3696,6 @@ fi
 # so the build tree will be missing the link back to the new file, and
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
-# UNLINK is used to remove symlinks from older development versions
-# that might get into the way when doing "git update" without doing
-# a "make distclean" in between.
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
@@ -3710,7 +3707,6 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
-UNLINK="pc-bios/keymaps"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.elf \
@@ -3732,11 +3728,6 @@ for f in $LINKS ; do
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




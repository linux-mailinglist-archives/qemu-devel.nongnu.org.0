Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146453FA57
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:51:52 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVsM-0000cY-22
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhc-0007sF-IE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhZ-0008NN-R8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oL83+cB+G3cI7lvVEP5dh5FJdl9cfcx+p0Qcdt39WE=;
 b=b/wZGOalIbXtxlUN8V0QVWpycCfcOvfmRkDTqDwrzgKYGgkYaKZdRhw4+agYmW7iH9NRSx
 +IcZ35zv+JT9e7QnA3V0XI+6fzMZjqhhz8NJx4Tq6grCXldWb4WibMI2CpK+cAnijphpCh
 Kxz9J8c1e/SuhHqHK7M4H7ZPPRoWUpA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-Wtux4bxMMUyRsZ8fekfTxA-1; Tue, 07 Jun 2022 05:40:40 -0400
X-MC-Unique: Wtux4bxMMUyRsZ8fekfTxA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v4-20020adfebc4000000b002102c69be5eso3685447wrn.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2oL83+cB+G3cI7lvVEP5dh5FJdl9cfcx+p0Qcdt39WE=;
 b=A/Xoofnac3H9nw2hR3SzON5Qvez78FfZ6IT1rb/Jw4RYChRvI00OAJHkFJSZaJqizk
 OFnPpQbZna55clqLpJJl5PzMarLN01guVBB6LDsbSy9LcXdaveIK6SBpTgg7wi/+c/mb
 FtAbjCeg95g9IC6m+bem/iVsiA8M2hjqDSil5DIA5ME+4EjyNs8mwW4Ixqb0+obc0c5G
 oqSZl9+naoQEUYg0uca13U8yJ99fsW4EfBUVKC4EE4Wwe6pUKDbzN38krxpPMqML3ymg
 MEWCFBI/pOud1amXvkzL5rHF7Kcj5mH2UGK8HlWXgM99WROHmDwoUhMCLi3xQ8pMHZJM
 5cIg==
X-Gm-Message-State: AOAM5316QmsdeZ+DF9DjIqkGcJsnRlZe8GMfIL7AXtjZNxPzLKrAoQqh
 2hIZSQ47oCKcJzaBH97p/O9Bo5P6gCNBN7cNXG3wOzZfIYeStLw5QsDJRSwOBmfKIeA6i6gnVNG
 rPAc46hcTX0tBQKxMQsCrMWdQp3qclDi68pL9yb7qR/yGL2IgsTpTFarTeIKBEurnafw=
X-Received: by 2002:a05:6000:144e:b0:218:405f:d34 with SMTP id
 v14-20020a056000144e00b00218405f0d34mr8624834wrx.457.1654594838518; 
 Tue, 07 Jun 2022 02:40:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS755EWQrnTPPsoCnwD5C7OmhL6sLjzF0AiyaBxxW7zcSTTYHG1SaxhB3kBEBnmFg9wC+UHg==
X-Received: by 2002:a05:6000:144e:b0:218:405f:d34 with SMTP id
 v14-20020a056000144e00b00218405f0d34mr8624809wrx.457.1654594838122; 
 Tue, 07 Jun 2022 02:40:38 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d5045000000b0020d07d90b71sm17242298wrt.66.2022.06.07.02.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 2/7] build: include pc-bios/ part in the ROMS variable
Date: Tue,  7 Jun 2022 11:40:26 +0200
Message-Id: <20220607094031.1227714-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607094031.1227714-1-pbonzini@redhat.com>
References: <20220607094031.1227714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include the full path in TARGET_DIR, so that messages from sub-Makefiles
are clearer.  Also, prepare for possibly building firmware outside
pc-bios/ from the Makefile,

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile  | 12 +++++-------
 configure |  6 +++---
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 3c0d89057e..ec4445db9a 100644
--- a/Makefile
+++ b/Makefile
@@ -186,16 +186,14 @@ include $(SRC_PATH)/tests/Makefile.include
 
 all: recurse-all
 
-ROM_DIRS = $(addprefix pc-bios/, $(ROMS))
-ROM_DIRS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROM_DIRS)))
-# Only keep -O and -g cflags
-.PHONY: $(ROM_DIRS_RULES)
-$(ROM_DIRS_RULES):
+ROMS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROMS)))
+.PHONY: $(ROMS_RULES)
+$(ROMS_RULES):
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
 
 .PHONY: recurse-all recurse-clean
-recurse-all: $(addsuffix /all, $(ROM_DIRS))
-recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
+recurse-all: $(addsuffix /all, $(ROMS))
+recurse-clean: $(addsuffix /clean, $(ROMS))
 
 ######################################################################
 
diff --git a/configure b/configure
index e69537c756..b1aa97e470 100755
--- a/configure
+++ b/configure
@@ -2242,7 +2242,7 @@ if test -n "$target_cc" &&
         fi
     done
     if test -n "$ld_i386_emulation"; then
-        roms="optionrom"
+        roms="pc-bios/optionrom"
         config_mak=pc-bios/optionrom/config.mak
         echo "# Automatically generated by configure - do not modify" > $config_mak
         echo "TOPSRC_DIR=$source_path" >> $config_mak
@@ -2253,7 +2253,7 @@ fi
 
 probe_target_compilers ppc ppc64
 if test -n "$target_cc" && test "$softmmu" = yes; then
-    roms="$roms vof"
+    roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
@@ -2272,7 +2272,7 @@ if test -n "$target_cc" && test "$softmmu" = yes; then
       echo "WARNING: Your compiler does not support the z900!"
       echo "         The s390-ccw bios will only work with guest CPUs >= z10."
     fi
-    roms="$roms s390-ccw"
+    roms="$roms pc-bios/s390-ccw"
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-- 
2.36.1




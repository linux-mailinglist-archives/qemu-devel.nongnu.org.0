Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909495A1C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:41:31 +0200 (CEST)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLXW-00083b-N6
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKX-0002HS-KW
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKV-0004YQ-Ec
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSbWAfeeHTXwtPLRVB1YFJ+foIidH/prpw21njf09jE=;
 b=OrAS7R3m9LGwutOma7fJ2sxifF0I1DrsGq4/L02tJdN6d/ONWdEWD5tChbi7aa0kTltc3j
 r+t4O2ioE4l45o1LwTMnhHT7Dypnc7n/gwEfnCQastvODHc5KI/34pM/rN9kZjOzilc1rF
 ccscz0K1T8VrfXk+LcW+0TLlv8NCI7o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-jqei1PBlOZCoStXDZAYyyw-1; Thu, 25 Aug 2022 18:28:01 -0400
X-MC-Unique: jqei1PBlOZCoStXDZAYyyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so3660811wra.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aSbWAfeeHTXwtPLRVB1YFJ+foIidH/prpw21njf09jE=;
 b=8PTDkpTntv8mm1BRLNTFSj3jCJZHICTm9HhpDOPx6iCMHgrjddsDszOb/rg183+wiF
 G/dmsidDGzknOY8FcO3S8bRXriQUbcNtTkQydf+zzoHSJK8Jw/CTxF2U+OV/vPQSIQ8N
 gzTPRcpA87msErD/ozjTZq0NYN6EtqY05B521An8O+AwHCyS+wQpz8Xdu0u7eAWB43ld
 n9dU320qEBZRQMEa1g+2C8uWerWwkhTakL4lZj++LMwBuVjhRR3D2vKkkHICTghT30Wf
 Dfoz4paYGlx0NRbFIx5uvTkX1ijLVf8fxG/oYHUfzvKfXtCQ5j5qesv+rPO0KlN31QNQ
 6meA==
X-Gm-Message-State: ACgBeo1r+xdQ7xPNqhhKg6JravzQIK1LwjWQ3vum619gbE0k8mHBgU+d
 c8nK4gedkbVDnw0yBI8BgmIXcJzBqNfXJO5Bzj/17ns5t0Jbn5odVtG7QDxT9Osx+pHyAypdffR
 odIQl8Pt3pffg0uXrtbF3efoa4QQq/AJ8tLT4IoYR4l/7lTIoDr99RPDvQITQ91MeHNg=
X-Received: by 2002:a05:600c:3d11:b0:3a5:cd9b:eb08 with SMTP id
 bh17-20020a05600c3d1100b003a5cd9beb08mr9602226wmb.82.1661466479926; 
 Thu, 25 Aug 2022 15:27:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR504ErFVQRcD1sTqNEiRroCcVLYPCddJzz5vPpz4KoAfkmAOS0q8019rR3hE5T7TiitdtB0ig==
X-Received: by 2002:a05:600c:3d11:b0:3a5:cd9b:eb08 with SMTP id
 bh17-20020a05600c3d1100b003a5cd9beb08mr9602216wmb.82.1661466479610; 
 Thu, 25 Aug 2022 15:27:59 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d6792000000b002253d865715sm304481wru.87.2022.08.25.15.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 09/20] tests/tcg: remove -f from Makefile invocation
Date: Fri, 26 Aug 2022 00:27:34 +0200
Message-Id: <20220825222745.38779-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Instead of linking tests/tcg/Makefile.target into the build tree, name
the symbolic link "Makefile" and create it in every target subdirectory.
This makes it possible to just invoke "make" in tests/tcg subdirectories.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 3 ++-
 tests/Makefile.include | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 42952591fc..e428cc62e6 100755
--- a/configure
+++ b/configure
@@ -2316,7 +2316,6 @@ fi
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
 LINKS="Makefile"
-LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS pc-bios/vof/Makefile"
@@ -2561,6 +2560,7 @@ fi
 echo "# Automatically generated by configure - do not modify" > $makefile
 
 config_host_mak=tests/tcg/config-host.mak
+mkdir -p tests/tcg
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
@@ -2660,6 +2660,7 @@ for target in $target_list; do
   fi
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
+      ln -sf $source_path/tests/tcg/Makefile.target tests/tcg/$target/Makefile
       ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
       echo "TARGET=$target" >> $config_target_mak
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 826b1895f4..caef287957 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -50,20 +50,19 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
-            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS), \
+            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS), \
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        SPEED=$(SPEED) run, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) clean, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
 .PHONY: build-tcg
-- 
2.37.1




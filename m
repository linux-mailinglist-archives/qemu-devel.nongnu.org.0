Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007053FADD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:09:47 +0200 (CEST)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyW9h-0001dJ-MH
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhm-0007sw-LV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhi-0008Ph-IV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBa30ACYz9QuuLohYqZ+WJU4FHLga/MdEYHQP4kcIkU=;
 b=HtmUuzFP8NSuWnjyBmXHI64i4V8Oul9hKQ19hklxNHQVX98cVD7h/V6/mO8kK36m2+V71D
 Ehs/nHw+nkKpm3cn9zTri2rI9cmzTCQP/cPM4+2h2QeQ8pRZEgTa14h7Ab0YM8quz5arJP
 qr0W+8nUEewT8/4nVh8aE4+pgn2uLqo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-CXaVp-kkPBGEl0pMfzgSAg-1; Tue, 07 Jun 2022 05:40:49 -0400
X-MC-Unique: CXaVp-kkPBGEl0pMfzgSAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so3549561wms.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RBa30ACYz9QuuLohYqZ+WJU4FHLga/MdEYHQP4kcIkU=;
 b=BrQOnE/OKepJsNZMgtjoEJtLIn5xwOJkxacoGfJr3L5K6GLYI3WxGlJem3F7qvnnSa
 K7HuCK/0hhz0/TJGaEzA/1hoJ5k3FKxoJ7cyqOYJ2RS8wATet8iqPQPBoG1HjB+gA6Wx
 rNvnajDfimnKYt1L93d8eAbPdOqBONl5a6Z2QcwNhvj65/TcCGZKHM/ePQFr6H5aqqss
 AQ9A8abQTdjgiFP3SO14Tz5T8mzXQuzJqy5cWwtbVZDxGn2MT543JFNzwxwTk2VfU0lm
 f9X/Hm5JOE1yYKP57WULI23ANJcxpndNDklDEe8YPw9MqbODXSOsES7q+wL4TQ/rA6lV
 D+Vg==
X-Gm-Message-State: AOAM531BgwYVHqKNdhqNX23geyxa/H0q8VBcCa4GRSPd+N00HozLznrJ
 iT6TO9noOED3dPKcqxQm7eUZkrrtPXUkj3BNtPab9lfmBkirIORBvnXgkVXtNIrH+tfhM/V3W07
 qUHfXI3T/YMjCYetoQCNFKQxlqqPPj9z9orlkflDzs3oJQJrpKCev+0eboHlhj1SPwAw=
X-Received: by 2002:a05:600c:3ba7:b0:39c:5b80:3b76 with SMTP id
 n39-20020a05600c3ba700b0039c5b803b76mr1205402wms.35.1654594847209; 
 Tue, 07 Jun 2022 02:40:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm0V2fmm4YvE1tQjx9GbFdsua6SJBVl8TK2jgFq00XUouk2GjuOgUJC1ctLSSwK7JsmW4tTQ==
X-Received: by 2002:a05:600c:3ba7:b0:39c:5b80:3b76 with SMTP id
 n39-20020a05600c3ba700b0039c5b803b76mr1205374wms.35.1654594846780; 
 Tue, 07 Jun 2022 02:40:46 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b00397623ff335sm21756167wmc.10.2022.06.07.02.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 7/7] tests/tcg: remove -f from Makefile invocation
Date: Tue,  7 Jun 2022 11:40:31 +0200
Message-Id: <20220607094031.1227714-8-pbonzini@redhat.com>
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

Name the symbolic link "Makefile" and place it in the target subdirectory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 3 ++-
 tests/Makefile.include | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 9d49ea4c5b..f35847c3cd 100755
--- a/configure
+++ b/configure
@@ -2224,7 +2224,6 @@ fi
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
 LINKS="Makefile"
-LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS pc-bios/vof/Makefile"
@@ -2483,6 +2482,7 @@ fi
 
 # tests/tcg configuration
 (config_host_mak=tests/tcg/config-host.mak
+mkdir -p tests/tcg
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
@@ -2600,6 +2600,7 @@ for target in $target_list; do
   fi
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
+      ln -sf $source_path/tests/tcg/Makefile.target tests/tcg/$target/Makefile
       ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
       echo "TARGET=$target" >> $config_target_mak
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f2182ead1e..8f44a20da3 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -47,20 +47,19 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
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
2.36.1



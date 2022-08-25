Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC05A1CB9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:50:43 +0200 (CEST)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLgR-0003pR-3m
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKa-0002Nz-Rp
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKY-0004bL-96
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MC567bdDBf2S/5cvVB8guzWSpQOKDJVHxqN6YjKtI18=;
 b=JTw0SbLDFcGSB8PSsxhOsZ9Ke2K8kzXaOV0dHjHHmyygTCq5dNpyvTO9DMu/MkX6d58p5o
 3VUSA7C1CwgtA9o9eUKiOQGstXG3UmTRBaw4bs8RqcVq6WN49VLNK4/x9RSIlf6uh1Hnyi
 ZqGgq8FVpbcmY85l8kiZH/Ony0I9zIk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-xZ2KCAFtO8mkQyQOfk6O8A-1; Thu, 25 Aug 2022 18:28:04 -0400
X-MC-Unique: xZ2KCAFtO8mkQyQOfk6O8A-1
Received: by mail-wm1-f70.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so3052536wmo.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MC567bdDBf2S/5cvVB8guzWSpQOKDJVHxqN6YjKtI18=;
 b=PKGGzjj+q/6736XhqzfE3CMT+8NwcxSxhwl7sn+ova0mv6h7dRWGVhOwvfVqGDG+Fr
 yKYmBAUhIlzdKmiZUybR1YDSVr9Pygea7pXpthn+o0VWb9mzHhg5N6NnRwhaHSd1pxKr
 pPB4HRC/ZpGgXcbVBHOEePzgUOvNjXDHkfsqltQQZWezOYDBZn3KHUYsi/nzlkzEwX0M
 voSAoww17Vj9evtdz+CD5QbxXbz3Yf4vb0UjyuZHgHsJ5uss9XNtVOBoVcNv7Lp3mh1U
 ycrG6g467SxhsGXgAskiigBFGJujHEGLridg8+Vz1HJIAjsSRITKVV600kIfSjbmyZ7c
 f6hQ==
X-Gm-Message-State: ACgBeo15HR2Lak69DPsQAzrGVWM/svsHkBcxMvf+O080TIpNoczK0epn
 xQVtik1VBHOWsmODe1QUtU9V5yDRE6dDw8d2rby2p8IOkl2DGzEed/QwOt4ZIKbU7bVpgQyl5bR
 kS5nZCByBVp/JyKHjdLtU8K/Ot+ZqcFaQT8MoeA6AH2Il2Bamb1d6BUAYeHqIaCZhV0Q=
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id
 u16-20020a05600c035000b003a534731c23mr3578468wmd.9.1661466483099; 
 Thu, 25 Aug 2022 15:28:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7p+EL9a12LSXI+JUZkWLLIqulng9yW/C4rebHNnj2tLBVRLAAY9PrbwOapaCZXDrZGltNs1g==
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id
 u16-20020a05600c035000b003a534731c23mr3578459wmd.9.1661466482784; 
 Thu, 25 Aug 2022 15:28:02 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ib6-20020a05600ca14600b003a62400724bsm708887wmb.0.2022.08.25.15.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 10/20] tests/tcg: add distclean rule
Date: Fri, 26 Aug 2022 00:27:35 +0200
Message-Id: <20220825222745.38779-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include    | 11 +++++++++++
 tests/tcg/Makefile.target |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index caef287957..9ed67721e2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -42,6 +42,7 @@ tests/tcg/Makefile.prereqs: config-host.mak
 # Per guest TCG tests
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TESTS_TARGETS))
 CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TESTS_TARGETS))
+DISTCLEAN_TCG_TARGET_RULES=$(patsubst %,distclean-tcg-tests-%, $(TCG_TESTS_TARGETS))
 RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 
 $(foreach TARGET,$(TCG_TESTS_TARGETS), \
@@ -65,6 +66,12 @@ $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
+.PHONY: $(TCG_TESTS_TARGETS:%=distclean-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=distclean-tcg-tests-%): distclean-tcg-tests-%:
+	$(call quiet-command, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) distclean, \
+        "CLEAN", "$* guest-tests")
+
 .PHONY: build-tcg
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
@@ -75,6 +82,9 @@ check-tcg: $(RUN_TCG_TARGET_RULES)
 .PHONY: clean-tcg
 clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
+.PHONY: distclean-tcg
+distclean-tcg: $(DISTCLEAN_TCG_TARGET_RULES)
+
 # Python venv for running tests
 
 .PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
@@ -159,5 +169,6 @@ check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
 clean: check-clean clean-tcg
+distclean: distclean-tcg
 
 endif
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index f29b0abf17..8d2dafabf0 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -189,3 +189,6 @@ run: $(RUN_TESTS)
 
 clean:
 	rm -f $(TESTS) *.o
+
+distclean:
+	rm -f config-target.mak ../config-$(TARGET).mak
-- 
2.37.1




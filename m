Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E037529E0A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:30:00 +0200 (CEST)
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtWh-0002ZU-MO
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTP-00083L-DE
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTM-0003YD-ND
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUl5xTZ9es8RBRkqDIjM6uhwl5Ow3wDrJVQ71mw8bsY=;
 b=JRbfYR376CUIC4udYU8uEZfivtQMzq4Zs495usn07k01ADtY7InQil0A6HGcq2dDLJnW+P
 4hYY2FxgW5kWvbhdzrEcg4v41iorf0Ez6GgrzTAMmN2lsmSad1iBwxyzaXS8QYPWJANVdO
 JIj4N5j3VvTmjU7ICla+95pyuuHtWCA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-qp1vRBjQMbeQZQxSJjcXjA-1; Tue, 17 May 2022 05:26:30 -0400
X-MC-Unique: qp1vRBjQMbeQZQxSJjcXjA-1
Received: by mail-ej1-f70.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so7036287ejl.21
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUl5xTZ9es8RBRkqDIjM6uhwl5Ow3wDrJVQ71mw8bsY=;
 b=k+ObL4MT8kW/AqGNOqjbEAILfIjV/F+iT86SiE8B+i1mp7NoVf0TxgeS/dgYz92s9+
 Vgrsb/shlJxOExdpf/wK3cpGgimFZrXMVbrLnW66BPsYJ/ZUHURBl6foKlveJQyPl3fU
 taeOPJZJsn7ojU/HGlUAJysar6VnyuIer9uS/Sf4ex+DL5xClHTxOTJO8sKTDO6ptyps
 lj/dVVYIRGoSwgxPn8mvg6M8nY/Doi18Zdd3eqtr35OIPWuQsToROqY7tzl2ZP0+8RKh
 PXwX/AtY5RCm2V7zSPMOTTLqfsIruoRHgYqTck5vdeKsJIXAJbXCAj+BRwr+kZAnrsSa
 dWEg==
X-Gm-Message-State: AOAM531/AnjyVIcE5/SA5BjZrfhdMuYlUjtEJxH917RGU8MEUbMlSQQz
 hpqwJ1XTbUfscS+n6q8WQE6AaQWR8uhCqTkXSybGyUgtS8IAZGjRtsnZV5PhJJZT+GR/caq9t2D
 +l89vWm/gG8rFa1Y2pz5PNHELz9f0ded8SFuEelLhol7TC7hYU0y3JEThNFU1Lgd5Moo=
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr18723560ejc.4.1652779589421; 
 Tue, 17 May 2022 02:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya6UjKcSk4r8Lkp6dTrBTGH4gqvbYFOElt/6JTzW+xF8NoqM03jUv+3ynJZyjyIsa++15ZYw==
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr18723540ejc.4.1652779589131; 
 Tue, 17 May 2022 02:26:29 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a170906268a00b006f3ef214dc3sm811775ejc.41.2022.05.17.02.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 04/16] build: do a full build before running TCG tests
Date: Tue, 17 May 2022 11:26:04 +0200
Message-Id: <20220517092616.1272238-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

TCG tests need both QEMU and firmware to be built, so do "ninja all" before
trying to run them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ec84b2ebc0..72ce0561f4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -57,7 +57,7 @@ $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
-$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
                         TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
@@ -74,6 +74,7 @@ $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
 .PHONY: check-tcg
+.ninja-goals.check-tcg = all $(if $(CONFIG_PLUGIN),test-plugins)
 check-tcg: $(RUN_TCG_TARGET_RULES)
 
 .PHONY: clean-tcg
-- 
2.36.0



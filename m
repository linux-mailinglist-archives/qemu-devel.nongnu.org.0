Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B81DED8E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 18:43:36 +0200 (CEST)
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcAlj-00075e-N8
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 12:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcAh8-0007W5-HM
 for qemu-devel@nongnu.org; Fri, 22 May 2020 12:38:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35194
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcAh7-0002Wu-Ks
 for qemu-devel@nongnu.org; Fri, 22 May 2020 12:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590165528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
 b=egZtI/lyFEcjMjCtohMAEbIX7W+H1aJhwQOryJArNcTYMc3fcbuzRl+hXB6fhDurVdl9qL
 YwDHNllEkGnh0N6WbM0NCToe26GlQi/YPo1pFRztYYPEONsVFpk6oPOfKU78U2HNSaYvOl
 mQ748Yja1s3uCkHU2cqJCGMCSS4V4+o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-rJ9-vjuwNJiCK8sMK6Q_lw-1; Fri, 22 May 2020 12:38:47 -0400
X-MC-Unique: rJ9-vjuwNJiCK8sMK6Q_lw-1
Received: by mail-wr1-f69.google.com with SMTP id z10so4628681wrs.2
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 09:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
 b=ayYt1Ea2Fu4jbjVFOEMFt2ZpQaauJEy+tLrlEAT4PafuPoYS/Glhlsgg8zWgn000nA
 +01j14PBZNPmpleeJTQNSHIfpmv/VNuksNgQS4mlNLc81Nwdu/dTgUTyALJR/h4tgoZU
 PlbAANMle64mnJ+4NzdXQXB7xLxP2KJC9dG2ph+zQwofANa3DeLTqWMAZ57bFYt4r+0P
 ioEJ/9Scp9YJZsClxbozV3W3Typcn64Qb272rEwFIMbonwnkw3kGrWmp/fyiLNKdxvlf
 lL2DTEqR6S2kErSR6ws/4/uxGXTor/B5NWE/tN+1WZSH5kNJIKam7bne/7yWQ48OdN9l
 NLeQ==
X-Gm-Message-State: AOAM530in1trEZtwVSYZQcTB0qhBuPh8xk9E6nSX1qobqoANArrt9WKz
 UB0WC0Tz+XIkJ6iCGTXHE44XXSyLe4rbBTh1/Uj5anaPIAu7yGZhnkFIFh255WZYeWLWEGSEKnJ
 A9adgKjLhsLmqkN0=
X-Received: by 2002:a1c:9cd5:: with SMTP id f204mr6918305wme.105.1590165526149; 
 Fri, 22 May 2020 09:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWqp3YzehbkUiZ8TwUxgyRRR//DUuhBImcSYFEzd/qfM/etor216MtsEWf0aeuLa+gQ6nfyA==
X-Received: by 2002:a1c:9cd5:: with SMTP id f204mr6918291wme.105.1590165525945; 
 Fri, 22 May 2020 09:38:45 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id p9sm9923994wrj.29.2020.05.22.09.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 09:38:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/11] Makefile: Allow target-specific optional Kconfig
Date: Fri, 22 May 2020 18:37:58 +0200
Message-Id: <20200522163759.11480-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522163759.11480-1-philmd@redhat.com>
References: <20200522163759.11480-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:12:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow use of target-specific Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Use base-arch() to include TARGET_BASE_ARCH/Kconfig
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f8a45e1379..d5009cd304 100644
--- a/Makefile
+++ b/Makefile
@@ -423,11 +423,13 @@ MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
                    $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
+                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		$(wildcard $(SRC_PATH)/target/$(call base-arch, $(firstword $(subst -, ,$@)))/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3



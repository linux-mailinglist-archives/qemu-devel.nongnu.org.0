Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2055B83D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:35:08 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jH1-0002eR-Sp
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jBS-0003e7-Iu
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:29:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jBR-0005eX-5x
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:29:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so11535995pjr.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7jXqIdXZQPkgSueqM6O32O53MWeJR4fQ7cpQitnJZY=;
 b=CMpZOq43vBg/0vs7NaZ0tLCN7YsXZei4OIiSCmJOb+2FFxojACQ1R6uOtNLwK2E7d9
 IxNcZu8DS5TI4d8pAIgu1/XK70158VhtHNW10kaS6Rt3O8TyPXD2bRvQBvpX2h2pwAsq
 VcRpu4ZJLfA/NX6o3C/oe1v2ANei7aPBMX6AGyV8KbbfY/R5SzvFv7OoozHrNfh2IGnY
 J+V5ktAaHDCpvDsxDNLBv98NLxqI+tU/6x6JEd0p3Uvf2IpOaRYJhiLi0SLHtfQ1GLZR
 jEaFzL/AS0P+CGQIaRtwCC8INU1kWBCJOs50DQPVA1O7JastRrV/omM15ob59MD41f3z
 135A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7jXqIdXZQPkgSueqM6O32O53MWeJR4fQ7cpQitnJZY=;
 b=siUzLbvhnjpNkSVpvkyIFJy1nE8Xm1F9y+sbb9TFpEnl/R5w+cy5xf92RiMCi735sI
 Ka3uKBmKM46C4OMDFRu5GDX658Hogb6RDmcagifkrJjMSyszZ+5UkXwWsXGq9DSkUIE8
 PXh289fX9pX5UI+DLR9psijleT+Ij0Wo9AfVrjQo0HIf/Lwa2ed16vvuemXVLUAKIxKM
 rWCHC6GtJFMCz/AY9N9f9bIdu6IzEWZ+Nin8WHmGlb4Xq4CBY3SoQodAEYVovDlP1Erk
 W+yoFoE/EONOGCQErwaBMjonGoQIu0FnEjsEsqxP3AGSl7ZLTKnvXCTZc57rsUbiHgr8
 x/0g==
X-Gm-Message-State: AJIora/JMKO9Bm2/nCNVGygtko8YUvRGKVYV9qvkFiPCVKp1ckQKso/3
 YULFv43+mX6TG9fPfqhHq2NiJHYCxonEt6Xp7xc=
X-Google-Smtp-Source: AGRyM1sxGuqkQEjBjo0laBdPIWY7bRaCKlbVyrBheyWr/hloKfS08n0m0SslNzaT3WkzsGM6dD3IiA==
X-Received: by 2002:a17:902:cec4:b0:16a:16d6:f67f with SMTP id
 d4-20020a170902cec400b0016a16d6f67fmr12855360plg.139.1656314958693; 
 Mon, 27 Jun 2022 00:29:18 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:29:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 01/12] qtest: meson.build changes required to integrate python
 based qtests
Date: Mon, 27 Jun 2022 12:58:45 +0530
Message-Id: <20220627072856.1529357-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These are some basic changes required in meson.build file in order to
incorporate python based qtests later on. No new qtests have been added in this
change.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a9173..ad52f1c81b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -310,6 +310,8 @@ qtests += {'dbus-display-test': [dbus_display1, gio]}
 endif
 
 qtest_executables = {}
+other_deps = []
+
 foreach dir : target_dirs
   if not dir.endswith('-softmmu')
     continue
@@ -327,6 +329,7 @@ foreach dir : target_dirs
   endif
   qtest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
+  qtest_env.set('QTEST_SOURCE_ROOT', meson.project_source_root())
   if have_tools and have_vhost_user_blk_server
     qtest_env.set('QTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
     test_deps += [qsd]
@@ -351,7 +354,7 @@ foreach dir : target_dirs
     endif
     test('qtest-@0@/@1@'.format(target_base, test),
          qtest_executables[test],
-         depends: [test_deps, qtest_emulator, emulator_modules],
+         depends: [test_deps, qtest_emulator, emulator_modules, other_deps],
          env: qtest_env,
          args: ['--tap', '-k'],
          protocol: 'tap',
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C2755B7FF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:49:11 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5iYY-0002UB-5L
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5iUg-0000TC-JC
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:45:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5iUd-00065d-Em
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:45:08 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t21so8111400pfq.1
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 23:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7jXqIdXZQPkgSueqM6O32O53MWeJR4fQ7cpQitnJZY=;
 b=q4k7aXl0IHxpV2T2vtc0PMFU4Nig+XzJijW+98jxAk80R3ksZEYcDcyr/oG8pIhqI8
 YqTJgVl8SCyFc5JaI0aF2wzyTbgN3JoG16qpTPitCk+LfydKgl63EwlXivrFOp8kT9Cg
 UW9YMLSIObxcoPrrHRzOxaaZB92zrS2JlcEIFbuzPoB/iQXERgWC9WAKfZAKD6GKlDmt
 AUmqxchtpVh3K1iBmN3B6Eddf+8kTN57UEj8mgzm2gkiy3rvpgtR3r8kCCpYqZZp9OKc
 M8eAl+evn9SzAlHziHJdAubftGUQVZ0oQOrPszFUlr33MQPr7tnla8cONzOyWS1irrMn
 RmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7jXqIdXZQPkgSueqM6O32O53MWeJR4fQ7cpQitnJZY=;
 b=RLFb+hqA/8JIE7QpU1K3q2Y2E7qDbNDqOQYVXyUvdhRuoZeWiGoUWL70lfyQOzN51D
 8f8VrdYwFh2I+aKKGv8iRymDkGgKkGu8+5/9oBqhK4VfWEpzMlT9p3ceQInN4Nd+hkWm
 JASx9xFxWJbsl6EvlP3ybqgA1A+MHrnF+fQKkDLm0qruZLsc9ij6+Nev+0RZDlJg51g8
 +Kf4ND1+yHJYmRKCXSkARdXyXec5a4huA99ksAagM4HYt/DAlw/2HYh1Z8JTMMy3f3uB
 dSdUfTfoYaY3ZknkjX3bSTsdH60dA5nz26T7mlMpBVrQ+KUX5QFruOL52umCWmgWwpFR
 X/2Q==
X-Gm-Message-State: AJIora/MQUyrc6zuQG/fPoz9iWpf131dK7Dj/xtu8GnCg/eTpK5JTg2s
 5qeKGLFTFS7IwJkKs4efzRDqFhyliMvdJqB2014=
X-Google-Smtp-Source: AGRyM1vXFyPKIaAOKb/CPck9nydtg2EjQjTqGTNRkap8M1y8rEibZBtjU3Hg5RhMdkmEsRJzxiqtIA==
X-Received: by 2002:a63:884a:0:b0:40d:180a:2fe2 with SMTP id
 l71-20020a63884a000000b0040d180a2fe2mr11873748pgd.32.1656312305691; 
 Sun, 26 Jun 2022 23:45:05 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020a056a00170800b0050dc762819bsm6310126pfc.117.2022.06.26.23.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 23:45:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 01/12] qtest: meson.build changes required to integrate python
 based qtests
Date: Mon, 27 Jun 2022 12:14:03 +0530
Message-Id: <20220627064414.1527623-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627064414.1527623-1-ani@anisinha.ca>
References: <20220627064414.1527623-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42b.google.com
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



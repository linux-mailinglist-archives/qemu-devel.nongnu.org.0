Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECF338148
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:16:58 +0100 (CET)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUY5-0007UB-Pz
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTv-0001n3-Sb
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTj-000533-1q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCMOis7blvx2AGe7FC9c1Tgf4rXmZrQipdbYJNU+L/o=;
 b=bkMEq8IK9Wnm9f1tJ2hKI7jZAsQbzD/BExQ/XfsRwazQj6F3895AlBpIE3TD3CEoUvcR6D
 JdFq12VU0IHwkFcst48tYSJsJGSkQf/nrfi5obCoHzV/Hr311v2FgFfdVguVSI1UM4WypL
 Sq+xKiRfFd56/foxuSa71EcwOPBiJxI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-swLpa81BPMahMiAisMIafQ-1; Thu, 11 Mar 2021 18:12:22 -0500
X-MC-Unique: swLpa81BPMahMiAisMIafQ-1
Received: by mail-wr1-f69.google.com with SMTP id p12so7652773wrn.18
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCMOis7blvx2AGe7FC9c1Tgf4rXmZrQipdbYJNU+L/o=;
 b=e3BbFM6wGQkS4d8ocXkEEHAPU66eYU4J3+8nzGqP3rQ+G2i9eCjBm9ARB2gqLliKbf
 2AfFSbsYGh8ON/tVnt0TeqicA5MdEtf4qvA7oVx1HiHCFomhw7cfXjO5tqX92h5xi+B9
 nzfEkuxDbH/KRrShjtMFSwO8w3S81zgAxx3UlsUCogwoIlZtOj2tXrT3NLS68l9LJ4xo
 kL93ksEL0FeS9tOAFDBUg9Nxds7UasC3A3JUOt3y+iTxk2mvZ29t/NGy+01uvYuQ5BXw
 W3CUsIdhujT7VhUiwvwJwynO0sreufDdRaBgK+L18NoOwUD6gTYUpEKso3JKo6DiHwCW
 MEnQ==
X-Gm-Message-State: AOAM532M2dhu3ejjj5DMnc24V6d2RknGBZWahQtGhNQhGAXSmelsPG9B
 Mz8zhJud5IDmGBUsPivol7PLI3wOVwTg7FSNLfrSTTdMkCYecqHm9QT9Gmp1gE+bkiqbFcVYpSC
 EoEk3VfvChMuxjNjBV9U9mIl/gOw7UisXGZqgXLSHmR2H9yFVv8JFKG9uwkFY9pd5
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr11500912wrw.247.1615504341270; 
 Thu, 11 Mar 2021 15:12:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwInFVUV84B5PdSKhdE4HdFLGcMnxRBKBeaYszUKaj2EuY4HlNV4vKnqyVTihuG1/DAFujTqw==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr11500890wrw.247.1615504341101; 
 Thu, 11 Mar 2021 15:12:21 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm291253wmd.41.2021.03.11.15.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 3/6] qtest/bios-tables-test: Make test build-independent from
 accelerator
Date: Fri, 12 Mar 2021 00:11:59 +0100
Message-Id: <20210311231202.1536040-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, we can remove the #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a5..73378f9da94 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -718,15 +718,13 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
-
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
+    if (data->tcg_only && !qtest_probe_accel(data->qts, "tcg")) {
+        g_test_skip("TCG not available, skipping test");
+        goto done;
+    }
+
     test_acpi_load_tables(data, use_uefi);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -745,6 +743,7 @@ static void test_acpi_one(const char *params, test_data *data)
         test_smbios_structs(data);
     }
 
+done:
     qtest_quit(data->qts);
     g_free(args);
 }
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAA4348E4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:27:31 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8ok-0002ey-7U
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gv-0002ll-Ms
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gt-0002dj-TE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nFIbNXb69EoGDBsD2BE8d4rSsxtOhWqVTfNUrOCk/LM=;
 b=HzBmxs804K7aJp0SU+61gJVUeIBhWhTO8REgBhO/KJJumKXAzq9JN/+gfeCUXj5rzQ0p6T
 imXsEUNgcbtD+blbN7ZxOTqdlHnSL9M3w/IcD2+cLuPilNT9Sp3YPdzbL6gF4I7YPjaEYF
 miuX10qT8Nf5Yq4dkqDYViH4h5gUaUw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-AD4-npwLPV6sRoXhzslOfg-1; Wed, 20 Oct 2021 06:19:21 -0400
X-MC-Unique: AD4-npwLPV6sRoXhzslOfg-1
Received: by mail-ed1-f70.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so20511687edi.12
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nFIbNXb69EoGDBsD2BE8d4rSsxtOhWqVTfNUrOCk/LM=;
 b=NITMmVjTJwJFD6yLlR795i0gsKAgYsSFm9WTuHN7BMt+e28HrM0GIYyMaypvOkV063
 1Rxzv8nzSFbrAFkGxFPMytoOuh9Ny2lyJ4As9K6Wrb7KeRmSsLKw9iRt5iR2fo6eV67Y
 IPVAl1KgvBAgCwpmXEq3W9iip3OgEsscbHIv/+Tu7AY8NNFfPHjwTanmYXHgOZNDeB4+
 nr4koXXGfZIrqLClNn6oTaDlX6PhgPb77KeOJbb2ygNklVhIvFV7XSFOjvwHhswSYoy4
 cbEngj2O8EvMCOiwfd9UxIIxa/CHqk2Dk/swbf4qtCs3HXz4rIxFv3bVp6mEbu4r8YfU
 0ZzA==
X-Gm-Message-State: AOAM5315x/YFCbJzcYvJlc/Cru63S8Qp+hwAIBQESY2pm6d54BTJh16O
 AqfbvpUDk4kDBQJVN9WeqQisGBd4jHRWv+kzlKlEz/iWjrEppnQ3FvS0NEL2NrIFWdVH5WsNbPs
 EhLW4JDOV6CAvItY2lmAWrjYIhobrCMG/cny5YHVCOAF2p44ieCPjh44a+hBQ
X-Received: by 2002:a17:907:9889:: with SMTP id
 ja9mr47561753ejc.361.1634725160324; 
 Wed, 20 Oct 2021 03:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/yw8BHYZw07mbvXut9V9k6+CUGqAsAZZ3EMuf3wX6xhauYrr8CQWONO/MgzJ39hmm4ig3GQ==
X-Received: by 2002:a17:907:9889:: with SMTP id
 ja9mr47561727ejc.361.1634725160129; 
 Wed, 20 Oct 2021 03:19:20 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id ck13sm953151edb.0.2021.10.20.03.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:19 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/44] tests: qtest: add qtest_has_accel() to check if
 tested binary supports accelerator
Message-ID: <20211020101844.988480-3-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Currently it is not possible to create tests that have KVM as a hard
requirement on a host that doesn't support KVM for tested target
binary (modulo going through the trouble of compiling out
the offending test case).

Following scenario makes test fail when it's run on non x86 host:
  qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288

This patch introduces qtest_has_accel() to let users check if accel is
available in advance and avoid executing non run-able test-cases.

It implements detection of TCG and KVM only, the rest could be
added later on, when we actually start testing them in qtest.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 27 +++++++++++++++++++++++++++
 meson.build                   |  6 ++++++
 3 files changed, 41 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..59e9271195 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -588,6 +588,14 @@ bool qtest_big_endian(QTestState *s);
  */
 const char *qtest_get_arch(void);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_add_func:
  * @str: Test case path.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 73f6b977a6..25aeea385b 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -922,6 +922,33 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    if (g_str_equal(accel_name, "tcg")) {
+#if defined(CONFIG_TCG)
+        return true;
+#else
+        return false;
+#endif
+    } else if (g_str_equal(accel_name, "kvm")) {
+        int i;
+        const char *arch = qtest_get_arch();
+        const char *targets[] = { CONFIG_KVM_TARGETS };
+
+        for (i = 0; i < ARRAY_SIZE(targets); i++) {
+            if (!strncmp(targets[i], arch, strlen(arch))) {
+                if (!access("/dev/kvm", R_OK | W_OK)) {
+                    return true;
+                }
+            }
+        }
+    } else {
+        /* not implemented */
+        g_assert_not_reached();
+    }
+    return false;
+}
+
 bool qtest_get_irq(QTestState *s, int num)
 {
     /* dummy operation in order to make sure irq is up to date */
diff --git a/meson.build b/meson.build
index 9ed9a993e2..2c5b53cbe2 100644
--- a/meson.build
+++ b/meson.build
@@ -75,6 +75,12 @@ else
   kvm_targets = []
 endif
 
+kvm_targets_c = ''
+if not get_option('kvm').disabled() and targetos == 'linux'
+  kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
+endif
+config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
+
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
 
 if cpu in ['aarch64']
-- 
MST



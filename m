Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F650DBEC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:03:04 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niucZ-0007hL-7H
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0p-0007Hi-HH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0n-0002qj-FF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxH74JGUW7ryvtn4xS8i28T7ZhqNwBVbzuWMzVW6NKE=;
 b=HH5C9eQnhTmuP/XEUD6i8rOP2VueUriwqFEoPeJLsoOG0oy/9/SDMVMZ0ExBOfuTE/0H33
 LU207QKQARjWA+ly6Auuz2qCtHU9Csa517bkj8/f5Lw57mTuCr0oa+XkKEjo2TalPA7bYf
 /DUgEc2G0fSp4CgVp4WTB/+a0Aos3vI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-3yt6W30-N8OvRT4UKBU43g-1; Mon, 25 Apr 2022 04:22:05 -0400
X-MC-Unique: 3yt6W30-N8OvRT4UKBU43g-1
Received: by mail-wm1-f71.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso9970920wmh.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CxH74JGUW7ryvtn4xS8i28T7ZhqNwBVbzuWMzVW6NKE=;
 b=pEcmCAmLVmTY0ih2mm9cqFtC6ASqLvNJbpYIUVV8cQkvXb/hPtE/ugV++CAGcbr6IR
 lrXJM6f27gc8xypwNEvbouGwDaYmtLHCNW1ZhiL0+pS3HT64auO6bAb/55QReLA7ZeDy
 YtH/68kTJhXe6PC+6q47HPaduWK1FYOOJG/j+DqYtUtqk6cYr6L1a7Dz70+SJPBI+gEr
 ILav5j5ucSe5lm73m6kntgYL89yRciM2jkiQRix1NtLfu4wfXHFsu/LDk91LkyQ8giiP
 26n71Wg7wyqoff7B+VPBb5FcNsnrB3LwSXMafVaHTm5R0mpG2KCzpKtn/tpp4jstYnG/
 62Rg==
X-Gm-Message-State: AOAM533eBS+GDpDXTElDPuX9QRTgK1Fb+G6LeIBbJLsZGCsvJGzZIkwM
 iVgLlT4fye5+J7TCFmEXSxRYErOFNzvYBrbszC7ZVkGdjRAGlu62Qi+11S4vnfbaLVXSq9by4Jv
 yohOq3Wu3dPyiKyM=
X-Received: by 2002:a5d:598c:0:b0:20a:9194:22d4 with SMTP id
 n12-20020a5d598c000000b0020a919422d4mr13194369wri.124.1650874924651; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXaqOa3YGloOuHdu9I/QDfXPNlBvXS0NM2gTP8aPnZlIrHdCUbxL8fl4ZTH69w0ylU0Ngz2g==
X-Received: by 2002:a5d:598c:0:b0:20a:9194:22d4 with SMTP id
 n12-20020a5d598c000000b0020a919422d4mr13194350wri.124.1650874924450; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b00393f01c8f00sm77266wmq.47.2022.04.25.01.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 2FFDE67B1B5A;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/18] tests/qtest: Specify audiodev= and -audiodev
Date: Mon, 25 Apr 2022 10:21:48 +0200
Message-Id: <6e7f2808dd40679a415812767b88f2a411fc137f.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable removing deprecated default audiodev support.

I did not figure out how to make the audiodev represented as an
interface node, so this is a workaround.  I am not sure what would be
the proper way.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 tests/qtest/ac97-test.c                 |  3 ++-
 tests/qtest/es1370-test.c               |  3 ++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  6 ++++--
 tests/qtest/intel-hda-test.c            | 15 ++++++++++-----
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
index e09f2495d24d..9711f1f6d966 100644
--- a/tests/qtest/ac97-test.c
+++ b/tests/qtest/ac97-test.c
@@ -45,7 +45,8 @@ static void *ac97_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
 static void ac97_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
-        .extra_device_opts = "addr=04.0",
+        .extra_device_opts = "addr=04.0,audiodev=audio0",
+        .before_cmd_line = "-audiodev driver=none,id=audio0",
     };
     add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
 
diff --git a/tests/qtest/es1370-test.c b/tests/qtest/es1370-test.c
index 2fd7fd2d3d30..5facda8d0d8d 100644
--- a/tests/qtest/es1370-test.c
+++ b/tests/qtest/es1370-test.c
@@ -46,7 +46,8 @@ static void *es1370_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
 static void es1370_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
-        .extra_device_opts = "addr=04.0",
+        .extra_device_opts = "addr=04.0,audiodev=audio0",
+        .before_cmd_line = "-audiodev driver=none,id=audio0",
     };
     add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
 
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 004c701915e1..84a93b3c350b 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -101,8 +101,10 @@ const generic_fuzz_config predefined_configs[] = {
     },{
         .name = "intel-hda",
         .args = "-machine q35 -nodefaults -device intel-hda,id=hda0 "
-        "-device hda-output,bus=hda0.0 -device hda-micro,bus=hda0.0 "
-        "-device hda-duplex,bus=hda0.0",
+        "-audiodev driver=none,id=audio0",
+        "-device hda-output,bus=hda0.0,audiodev=audio0 "
+        "-device hda-micro,bus=hda0.0,audiodev=audio0 "
+        "-device hda-duplex,bus=hda0.0,audiodev=audio0",
         .objects = "intel-hda",
     },{
         .name = "ide-hd",
diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
index a58c98e4d11b..39ced2bc6ac6 100644
--- a/tests/qtest/intel-hda-test.c
+++ b/tests/qtest/intel-hda-test.c
@@ -11,20 +11,24 @@
 #include "libqtest-single.h"
 
 #define HDA_ID "hda0"
-#define CODEC_DEVICES " -device hda-output,bus=" HDA_ID ".0" \
-                      " -device hda-micro,bus=" HDA_ID ".0" \
-                      " -device hda-duplex,bus=" HDA_ID ".0"
+#define AUDIODEV " -audiodev driver=none,id=audio0 "
+#define AUDIODEV_REF "audiodev=audio0"
+#define CODEC_DEVICES " -device hda-output,bus=" HDA_ID ".0," AUDIODEV_REF \
+                      " -device hda-micro,bus=" HDA_ID ".0," AUDIODEV_REF \
+                      " -device hda-duplex,bus=" HDA_ID ".0," AUDIODEV_REF
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void ich6_test(void)
 {
-    qtest_start("-device intel-hda,id=" HDA_ID CODEC_DEVICES);
+    qtest_start(AUDIODEV "-device intel-hda,id=" HDA_ID CODEC_DEVICES);
     qtest_end();
 }
 
 static void ich9_test(void)
 {
-    qtest_start("-machine q35 -device ich9-intel-hda,bus=pcie.0,addr=1b.0,id="
+    qtest_start("-machine q35"
+                AUDIODEV
+                "-device ich9-intel-hda,bus=pcie.0,addr=1b.0,id="
                 HDA_ID CODEC_DEVICES);
     qtest_end();
 }
@@ -39,6 +43,7 @@ static void test_issue542_ich6(void)
     QTestState *s;
 
     s = qtest_init("-nographic -nodefaults -M pc-q35-6.2 "
+                   AUDIODEV
                    "-device intel-hda,id=" HDA_ID CODEC_DEVICES);
 
     qtest_outl(s, 0xcf8, 0x80000804);
-- 
2.35.1



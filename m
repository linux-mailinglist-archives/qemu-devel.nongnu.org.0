Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B147D45C9C8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:20:43 +0100 (CET)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpv0k-0007CK-Lc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:20:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuwC-000184-5K
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:16:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuw9-0005Sf-OY
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637770557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOmniXP9kECuj+4xZCjgmlfWEZPERWHw8eGdEQjANt4=;
 b=Kp7dozvlU1tkbI/rWTgK+Yb/GYX/9vbQ75Y5l6OC9KmuCxU4riUAR9eG4jfiqWyuXmfbHC
 7yMYdR470W3Xp8/haXImepCVqCw6VV6z09OyhHocWHcrigquVIR6OeV2cATUEUV4rAkPBr
 4OT2FQpvji+36I2JxiG/zWpmi+kldCE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-zG9yyS7pOrOfrZFYP9kMWw-1; Wed, 24 Nov 2021 11:15:56 -0500
X-MC-Unique: zG9yyS7pOrOfrZFYP9kMWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so617383wro.18
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 08:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOmniXP9kECuj+4xZCjgmlfWEZPERWHw8eGdEQjANt4=;
 b=1HcAyb2IMIijm2ytoil/73bKUiLn90YdxVLtR5vrEq/LXMTz92AuhRtUmWVar2gPPo
 SqtziQQQ3Os4ppc5G/Nawoa+GNflMF5kpcImu/Bs4J4BlamDDJPkF0riE/O+d5ENu+F/
 pYyz/gwYDidh8MzLzTa74uayYcIxNlr7f5tC+GjazBMua3PtP77wRWvRVQHyFHKmwYGB
 9V9iVnhWTVUg18Y2tLu2DZpRPwS5lDSoiFHCRexoRrUWWcXFbnbBedPGiuC4f2WIZnzj
 aKY8F0sXI7T1red/4JTVMFzLj6C9lHZ/7qC1tTYuUEIPSfc01vwj+Xp8sJ6CBF3apYou
 WFkw==
X-Gm-Message-State: AOAM531y1ajf9LyK8rXZ7Ef9WPm3Vtqzlk+P1iKeMQsUq4f1JgEwIrk/
 0VrXZTchSLqOqim8V1h/VBdyPuT6UXsI6eghqB5rKLk394zkoSt/LNhxNFttO7s2Pk5l/5qfi2k
 IgWYiR4afqXGAuE/vx/kyFAyCDkrH3jzMJxfl/CG5W8Z018w3y3stcDTMjfFEpJBZ
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr16705909wmq.63.1637770554672; 
 Wed, 24 Nov 2021 08:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT+NPiV38nxAR+CDUuMQ+dNp39joX1ZHPVoTiVVZ+s5jJuW5fc0L+g+XlYDRuHZYrR7mSKaA==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr16705842wmq.63.1637770554343; 
 Wed, 24 Nov 2021 08:15:54 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x21sm4812146wmc.14.2021.11.24.08.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 08:15:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] tests/qtest/fdc-test: Add a regression test for
 CVE-2021-20196
Date: Wed, 24 Nov 2021 17:15:36 +0100
Message-Id: <20211124161536.631563-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124161536.631563-1-philmd@redhat.com>
References: <20211124161536.631563-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without the previous commit, when running 'make check-qtest-i386'
with QEMU configured with '--enable-sanitizers' we get:

  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==287878==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
  ==287878==The signal is caused by a WRITE memory access.
  ==287878==Hint: address points to the zero page.
      #0 0x564b2e5bac27 in blk_inc_in_flight block/block-backend.c:1346:5
      #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
      #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
      #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
      #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
      #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9

Add the reproducer for CVE-2021-20196.

Suggested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 26b69f7c5cd..8f6eee84a47 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -32,6 +32,9 @@
 /* TODO actually test the results and get rid of this */
 #define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
 
+#define DRIVE_FLOPPY_BLANK \
+    "-drive if=floppy,file=null-co://,file.read-zeroes=on,format=raw,size=1440k"
+
 #define TEST_IMAGE_SIZE 1440 * 1024
 
 #define FLOPPY_BASE 0x3f0
@@ -546,6 +549,40 @@ static void fuzz_registers(void)
     }
 }
 
+static bool qtest_check_clang_sanitizer(void)
+{
+#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
+    return true;
+#else
+    g_test_skip("QEMU not configured using --enable-sanitizers");
+    return false;
+#endif
+}
+static void test_cve_2021_20196(void)
+{
+    QTestState *s;
+
+    if (!qtest_check_clang_sanitizer()) {
+        return;
+    }
+
+    s = qtest_initf("-nographic -m 32M -nodefaults " DRIVE_FLOPPY_BLANK);
+
+    qtest_outw(s, 0x3f4, 0x0500);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outw(s, 0x3f1, 0x0400);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outb(s, 0x3f5, 0x01);
+    qtest_outw(s, 0x3f1, 0x0500);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     int fd;
@@ -576,6 +613,7 @@ int main(int argc, char **argv)
     qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+    qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
 
     ret = g_test_run();
 
-- 
2.33.1



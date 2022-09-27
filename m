Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D385EC12E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:25:58 +0200 (CEST)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8ir-0006SL-Lq
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qt-0002l4-EI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qr-0004tq-2s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id iw17so8800591plb.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XZxuat3Ohybft7pjyhNM9f2+0mg9c8x2r1GRXvNmwH4=;
 b=QOPgygQaxvdpgq1o6VVnY9DT9UKOH4otcNJKbxEUlbXwXagtNkYa9P3/lyyPCpDa15
 Y98QRHsAUUCKzOwQr2SBhkG32qkZ2uu0EFNJxo46BfJ2gTWJW0Cv2ZoliUPNe9dG4J1f
 wDqtzInIHpHSSYJZbW4EFSgMVBuAz5RmugwRKy2EOIbiu9ryDdTN486GfwtnSir9fcli
 t8/t9BB+uqK8i4SQ/fUlHtnkmN0ud1LmELLeknhCxgtjWw1i74+sHWwOZbT65z0duYrW
 gswHi2wFPgbwE08NRjpMaFx5FsHfY/puthnTBYkvHfOGONrH0saQSyPf+iNgN1fH9Rep
 /LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XZxuat3Ohybft7pjyhNM9f2+0mg9c8x2r1GRXvNmwH4=;
 b=tkbbCWFQD1yk4kHK5KQwnXDzL3gO7KL258I0LpGSPHhd+u/fLKo2Q6hyEflH/2qtu+
 JwgiFWXjpQiB5dQv+jdxD1ItcPJYQMgtPU229gzfo73fOQTTmSu7Yye36UUdTKk6g4CP
 rfT1OtPrymzjwnDU8gdIi4/ism0rO8QgwvxPla/bLyyZUvBShiZnxkCL4V5RFA7l8UMv
 tXbPOL/vnvHfut0h2DsIEiRhkMrNHRmLLoSZGQHNtBhHDVhww3t4HT9ccFZgdBCaBdaH
 dmqMg/mZszNP2FJpCJk4slzFKP/FdIh0OMqsiSj/27kHKp3t/0U5k/Vv9VpfclytxZT8
 /bBw==
X-Gm-Message-State: ACrzQf3Sqp7p6qdlBdA83sw7nhwzcFGU1yfL/Vwv/k9WKnjKB4TqXTuO
 hmA40ZgUvbP6uYtKgQcnQNypgg209mI=
X-Google-Smtp-Source: AMsMyM40MhSKXrIwB27gPEAM0IvBP41eDnG5ufanWtAlaLcV4OVZqE1AfmFVRvEpV5BtxLGsrRAF/Q==
X-Received: by 2002:a17:90b:4c8e:b0:202:be8c:518e with SMTP id
 my14-20020a17090b4c8e00b00202be8c518emr4057360pjb.26.1664276836180; 
 Tue, 27 Sep 2022 04:07:16 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 12/54] tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:50 +0800
Message-Id: <20220927110632.1973965-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- Do not use g_autofree and g_steal_pointer

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Use g_steal_pointer() in create_test_img()

 tests/qtest/hd-geo-test.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 413cf964c0..ba772f4d7a 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -27,16 +27,16 @@
 
 static char *create_test_img(int secs)
 {
-    char *template = strdup("/tmp/qtest.XXXXXX");
+    char *template;
     int fd, ret;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("qtest.XXXXXX", &template, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, (off_t)secs * 512);
     close(fd);
 
     if (ret) {
-        free(template);
+        g_free(template);
         template = NULL;
     }
 
@@ -422,9 +422,8 @@ static MBRpartitions empty_mbr = { {false, 0, 0, 0, 0, 0, 0, 0, 0},
 
 static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
 {
-    const char *template = "/tmp/qtest.XXXXXX";
-    char *raw_path = strdup(template);
-    char *qcow2_path = strdup(template);
+    g_autofree char *raw_path = NULL;
+    char *qcow2_path;
     char cmd[100 + 2 * PATH_MAX];
     uint8_t buf[512] = {};
     int i, ret, fd, offset;
@@ -468,7 +467,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
         offset += 0x10;
     }
 
-    fd = mkstemp(raw_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &raw_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -478,7 +477,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     g_assert(ret == sizeof(buf));
     close(fd);
 
-    fd = mkstemp(qcow2_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &qcow2_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -506,7 +505,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     free(qemu_img_abs_path);
 
     unlink(raw_path);
-    free(raw_path);
 
     return qcow2_path;
 }
@@ -714,7 +712,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -867,7 +865,7 @@ static void test_override_scsi_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -927,7 +925,7 @@ static void test_override_virtio_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -987,7 +985,7 @@ test_add_done:
     for (i = 0; i < backend_last; i++) {
         if (img_file_name[i]) {
             unlink(img_file_name[i]);
-            free(img_file_name[i]);
+            g_free(img_file_name[i]);
         }
     }
 
-- 
2.34.1



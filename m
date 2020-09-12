Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F3267CBA
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:53:10 +0200 (CEST)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHEOL-0008Fl-9h
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHB-0003Xa-GJ; Sat, 12 Sep 2020 18:45:49 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:53424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEH9-0004QQ-RW; Sat, 12 Sep 2020 18:45:45 -0400
Received: by mail-pj1-x1041.google.com with SMTP id t7so3480996pjd.3;
 Sat, 12 Sep 2020 15:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhCi83owLgwjlb0w3wUGwCtyacoQCjPoxSEDHHZwCrw=;
 b=EBqHA5R5ay+aheJQNSM/6lH+8Pix/Uwbtt8U2ryvluJQOVw0gjA/bfGnrBWPFKnETH
 aw6ftyC2w2CAtb8hwpp5T8KFhd29g801pH8H5WaRFtN9I7vVwO2Nb7I3lC9Uu5mP8m7U
 gh7I5hPD7q62NwmcYx3FStrAdEoLquT8qEhRpbIqUlmQ3BzimmE9rSi8G4yjIYQa0Qv/
 z7pOdZsWYAdbGcjgvu3dzPt6dwZsj0+uBANjG5Y2WLm4Yh9hFc3JGuf3odD4rLvIuYDV
 i716S2MktwRLhXZx8lOknGlbzuUYifAJI5XffuzSlLWHufw/H77WRqrblo+nBHCH3phS
 N83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhCi83owLgwjlb0w3wUGwCtyacoQCjPoxSEDHHZwCrw=;
 b=lHaZ137K0oPhnZtxfyYdttxV01oGdCJWzzxsJcIJ79qu64/AgHgcc+be1Abz4mlIey
 kCmrKLO7nk90y6I9DiTDL1KTdj8HAQ4O20DsasUrOHc1udSP7rkQr8NJd1RPjg/oNR8h
 /s0xJyRTVO67Urn15qLwp9ClxVkfahw1ylrB7mjGOlGbxxoxNaSEsIuhlEgfw+xcMYuG
 lvqPgep13HM2n3mCQGZVhUdIisSLEViW0paa0k1SrhgygSt1ivOAzwgm3SJKonakECPC
 thxJaDCHHoV3d3JOr4v5XSIgOlHEPU4YjqX+UQ7XEiwWCAox7/c0Q6rRT4XU3atqx6e9
 Q6hw==
X-Gm-Message-State: AOAM533x3e3ZBLNEb82nDBx/qPSZ6WfEuG9X31W3s9jRp5+xfcYMz8dM
 l5WR/mQcdPAgQ30YqyXkgXzb4MMCFqlDCQM5t3c=
X-Google-Smtp-Source: ABdhPJzzqgErpGG2QGq2ufXlG/WtKeFrGazfKRDaI7HoPzfGif4kGa8xG8f56NjrS//SvzhAzhJyoA==
X-Received: by 2002:a17:90a:6343:: with SMTP id
 v3mr7638841pjs.163.1599950741619; 
 Sat, 12 Sep 2020 15:45:41 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:45:40 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/27] gcrypt: test_tls_psk_init should write binary file
 instead text file.
Date: Sun, 13 Sep 2020 06:44:16 +0800
Message-Id: <20200912224431.1428-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On windows, if open file with "w", it's will automatically convert
"\n" to "\r\n" when writing to file.

Convert unlink to use g_remove.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tests/crypto-tls-psk-helpers.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/crypto-tls-psk-helpers.c b/tests/crypto-tls-psk-helpers.c
index a8395477c3..58888d5537 100644
--- a/tests/crypto-tls-psk-helpers.c
+++ b/tests/crypto-tls-psk-helpers.c
@@ -26,13 +26,15 @@
 #include "crypto-tls-psk-helpers.h"
 #include "qemu/sockets.h"
 
+#include <glib/gstdio.h>
+
 #ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
 
 void test_tls_psk_init(const char *pskfile)
 {
     FILE *fp;
 
-    fp = fopen(pskfile, "w");
+    fp = fopen(pskfile, "wb");
     if (fp == NULL) {
         g_critical("Failed to create pskfile %s", pskfile);
         abort();
@@ -44,7 +46,7 @@ void test_tls_psk_init(const char *pskfile)
 
 void test_tls_psk_cleanup(const char *pskfile)
 {
-    unlink(pskfile);
+    g_remove(pskfile);
 }
 
 #endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-- 
2.28.0.windows.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC935E92DD
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:56:42 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQFV-00059z-NR
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqj-0002ef-ON
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:05 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqi-0006Jc-7V
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id l10so3913794plb.10
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uPBeW/aIJLGwHIjEsjRiKxOEq2N/h6aNVIB5R50FGk8=;
 b=Uux5Lb6daqndboYLiMUfTE5xrl/s0e5gWRiLwjf+o0VW+ENtejh47h8TLQCul4bFxe
 HsZy+li4Te6AdtTt+/7Nh2Kt/Vgt3yhPQ6a8n+49gBwHds6UG7B3loTJSyGEEfMTw7ni
 t4IUWySI8suQVEtcY/Hoz/6S2LBMc9SMG1KlBF8gfLYEErOHxpfmozVAEwo+Zs0ScKlh
 DuyDfyby+yHBOgrGZWTPLIaY0ZEkqD0b1zp5gk036v2x4KWJ3tq9dqQWDh7U/gUrZ77v
 iZcN9OWbFUlWljfPcGPv9/hF7mqXNLmn4nlQ6OW9z264h9QSEmPDPRAxR4dV//kLjv0/
 kD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uPBeW/aIJLGwHIjEsjRiKxOEq2N/h6aNVIB5R50FGk8=;
 b=sUaqqXF9Axae/tXkwrDGTojdp5cjX4GvaBDHrLar+Hq+Rkn+hpQkIbIaI29RZWwO8H
 WYoajrhhRHrKTp2SAmxX0TnTmi5Ei4eCF7SyiiRk5g6mBMcd2RK1T6WvCS31WosOsvP5
 eAWHRbvcR92J4/GiMgipZPAFbBpUgeMIn0XCH3zAAKdup/0OyOwHWOVK2Te4z2J4p4OQ
 rnJAxuPUodpNk6wztlmGnfJ6ZRHOPNvvRkG0bAPJUKab2K3fBBJZw3l4luJ5ihtEHAGr
 J42pe4cMSUCFd5Es3ZcLiPyglhGtK5a2FB8ItaFxDk9I5iwo6UCVUtq8Ho8zin0ssbWV
 yKdw==
X-Gm-Message-State: ACrzQf0a7WX2ZjGZE9ylQVgZKi2/fzFr305khLqie11nX/fKGhTM3uPq
 /bomX377bXedG0MP1dN+2mOefP1cEWQ=
X-Google-Smtp-Source: AMsMyM7mDPcgIxQwg079wDhpx4D62sntBZ4neFZUZtbyHWBTEGAdZOa6BTuxFnzwuotk0rCOAsFSBA==
X-Received: by 2002:a17:903:2286:b0:178:349b:d21c with SMTP id
 b6-20020a170903228600b00178349bd21cmr16914230plh.71.1664105462855; 
 Sun, 25 Sep 2022 04:31:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:02 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 08/54] tests/qtest: cxl-test: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:46 +0800
Message-Id: <20220925113032.1949844-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/cxl-test.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 2e14da7dee..cbe0fb549b 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -93,10 +93,9 @@ static void cxl_2root_port(void)
 static void cxl_t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
 
@@ -107,10 +106,9 @@ static void cxl_t3d(void)
 static void cxl_1pxb_2rp_2t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs);
@@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)
 static void cxl_2pxb_4rp_4t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
-- 
2.34.1



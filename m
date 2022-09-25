Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7F5E92CE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:46:03 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQ5D-0007wv-1Y
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrD-0002ic-RZ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqy-0006KI-Q3
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b75so4165190pfb.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2+1alW6pcV3s50DFLFvhmZFtyW2mHcuX13PJl/8tAGE=;
 b=O2fhrHyvNhkWsZFel5Gyd/i8yon/slS7ds0ao06mBc9tnhGQKVzndLeCtG8i9fA36S
 QMNp1ZJVyvQF3EB/golHDF80ALRBC5IMrD4sVH0snIxkRv2QrOJs1xX6HXzKRYaXdrD4
 +wqdnkRiNb0o3qwfHFnfQ1bH7MdzVmCWtQpyCFkTkGCtQFDZ3WGHA1n9yKFoDBdLMx0z
 P0ciQViKcVeM3ap6JkTjS/O11aPfTqzrjLTjjbx0XL3dl3lH0tLrFk7x9dwnofquQj9b
 FyS/ULFHG8Du8l+L11usUn4ws344txev0KrncMGSlTIDPgohZFUQsA1/lNqIz7uO6xn8
 mbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2+1alW6pcV3s50DFLFvhmZFtyW2mHcuX13PJl/8tAGE=;
 b=SVrgzZslYPBqkbLMO9QR5LYENPse/s/a63vwyrVYa3HJtRX7W69uIhiKSG9Zfw92Y/
 JJmml3EO3sF5jln9+yiju7kbfiPzfOULpCTrfpLUW7bKV4ri5Q1oUX7Nl+vaKmPo1Z0J
 5pNxgAYKTYVShQyXl3S82sfcG8HYxhc5EGKPQFwWgNt6cpCam8/f9WL0rtF0rvOrEQCz
 CP1OITs3mDQ/9KJtofuBBRYBAYoSrBIHOV+cccye+iT1/SfPT08vNWCGO8mvIqMQvt5X
 hzbh1KuvPGiEGKF9z32yz9DF92GF8YRf5MYQUI+qdXbd62sL5ijyTohFCf1Rt4f2bVhL
 UQeQ==
X-Gm-Message-State: ACrzQf3/BOFiyzZp8dX/U7CPLd4SLoggUKB/hPnArPX5jErCrfS5lBlm
 1X5MQ57/sooiez+3MrzjBnm0L3AJvus=
X-Google-Smtp-Source: AMsMyM7ugtQ09jHGR73qPmAw5sKaunU+7pHSeKpyokgpQ8bKO8pxLat/btIF05FHZqfL6esn6hAwLA==
X-Received: by 2002:a63:87c8:0:b0:43a:c2e4:efcc with SMTP id
 i191-20020a6387c8000000b0043ac2e4efccmr15732582pge.410.1664105472181; 
 Sun, 25 Sep 2022 04:31:12 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 11/54] tests/qtest: virtio_blk_fuzz: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:49 +0800
Message-Id: <20220925113032.1949844-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42d.google.com
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

Changes in v3:
- Split to a separate patch

 tests/qtest/fuzz/virtio_blk_fuzz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index 236d078cc8..a9fb9ecf6c 100644
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -181,10 +181,10 @@ static void drive_destroy(void *path)
 static char *drive_create(void)
 {
     int fd, ret;
-    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
+    char *t_path;
 
     /* Create a temporary raw image */
-    fd = mkstemp(t_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
     g_assert_cmpint(fd, >=, 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert_cmpint(ret, ==, 0);
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5245E9300
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:13:08 +0200 (CEST)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQVQ-0000il-0l
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrM-0002q5-1Q
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:44 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0006LO-6e
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:43 -0400
Received: by mail-pg1-x531.google.com with SMTP id s206so4232887pgs.3
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5zDG7Ny3LkxdeNWaqDhYiABIowN2pKfIq67zjjwVq/4=;
 b=QgnCuO3NhvxclXmeyb6qshj+/m4KyRrISJAyLt8H5kLyvy6nA2nGFrquGY5hay6flJ
 iUVmWBjAskcDGR9ZK0Ez5erbt28/PQeP1vzlBTasdNmRI8MnnJ0bFwMdKGZMqyicMeNq
 fN5zT8hdR6a6qNdcKRJkTQdC+u55P7yIpTQ3Qrf+PKCVIFJe7Ek4vdkyKKJaK7drhGrh
 AGMJhSgZ07mLaw0uJ38v8gqZN0+sYL3FEakxUnxk85oZJg2lkfaZE9mRNUNyJddZ2Yi8
 zDrf4HWZ57S1Lw1YgYkDoSapMvr7WFAY7dz1rtwRhnnto5jpjVrE2LGcva3oWRFUfcFn
 VOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5zDG7Ny3LkxdeNWaqDhYiABIowN2pKfIq67zjjwVq/4=;
 b=g0G8vnZ5ETkoViM1vU6kp+RJ2ilF0Xj7lBZWU3zVXGn32v78EbsPnlLzpIw734PT5g
 96EKwfvTARApdApP+8NtFosQEvWOiRomwHUKsbblz6Y8pMMj11otLTYqx9EQc+qCcxRI
 +3UZaEY0mw8wPoYxv6MtGfEGnGD6j2fvY+a+j5fnv1gbR0EfeAzNm18xAaaWVGwv3kHI
 2zdXbqEaVRvtQhL2nokGunH+eatB0g4jGtO9JbyTtUL08KE3xPbpzyYv4jY6K09bWVkX
 shdwlN6Cz+TE8T2qWV9emDmwnVASW0inOTz0nOnfAd9ylUUHFVq7c1PFR8XDA8wMQUjn
 MShA==
X-Gm-Message-State: ACrzQf21gGC7qezZNqkDKoxpQzgkkmLgqaPmFcOtVvdxC053BsoLrMuA
 YOftLMz/LV/3bcsgoAh9M11eh5TrKM0=
X-Google-Smtp-Source: AMsMyM5029PkTWax31JH3MZ4vBK7E2iARxalIjXN2NXOremvq0evtswLuDjhMuOVpVXSvoyjQHPgYA==
X-Received: by 2002:a63:d652:0:b0:43c:9566:5394 with SMTP id
 d18-20020a63d652000000b0043c95665394mr4561925pgj.536.1664105494933; 
 Sun, 25 Sep 2022 04:31:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 20/54] tests/qtest: virtio-scsi-test: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:58 +0800
Message-Id: <20220925113032.1949844-21-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
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
- Ensure g_autofree variable is initialized

 tests/qtest/virtio-scsi-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 8ceb12aacd..ceaa7f2415 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void *data,
     QVirtioSCSIPCI *scsi_pci = obj;
     QVirtioSCSI *scsi = &scsi_pci->scsi;
     QVirtioSCSIQueues *vs;
-    char tmp_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *tmp_path = NULL;
     int fd;
     int ret;
 
@@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void *data,
     vs = qvirtio_scsi_init(scsi->vdev);
 
     /* Create a temporary qcow2 overlay*/
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
-- 
2.34.1



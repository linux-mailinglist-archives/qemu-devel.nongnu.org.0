Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174955E92F2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:07:23 +0200 (CEST)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQPq-0005BK-60
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrp-0003Fg-Rl
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:14 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPro-0006Nc-Es
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:13 -0400
Received: by mail-pl1-x631.google.com with SMTP id t3so3951366ply.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xtwjvK+ljk9V4L1gl+kZ+9qGQZitePo4pIZQo5m0KXA=;
 b=GCJCxqp6sS84jyOLLgrXV/2aKNyOFVtS3he2bkmFFcwgBcKOiLUNqPEtnMSMSc+6H7
 waMP5bBKahK2D3qpXEPqzhDP0FMVUdmp0ClKwz8eLHY82SWCWgr6rGtRB2uD5G5FaOJH
 2expNQY3NpsVuwhP7GGLxiWLbpbKG/XQAFd4Dn55MFmWLSFVitzYlLx+Lc8bqB6hlTWF
 lKWDvp6CRWAa+bYITiT7tMTR2qz5gpje22fGksDHok2FiqEtb6RnBlnbGNLKPVn4QkkS
 6QV1kBUNfvhIzYhtJT8XGh0Z5jl4ZKY3+Z7o2RLOglfiZZeT1xjYkunD+qTTGAeRtWx8
 vaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xtwjvK+ljk9V4L1gl+kZ+9qGQZitePo4pIZQo5m0KXA=;
 b=DgzygJHf9Y0ghyP8/J//mo2ZpVzYCXf6hKyLaFgtM2YQ5NlwNgk9A6ZRNdMai97i0X
 VVme38T3c12GSr/S/NyGSJ6cIKY9oCf6uCdeYxOnESNKMim68gcXtWi2/gm6j3iayica
 /nm40PqdfKwbMm1L6o0HOFRA71D5ogltNGjDBSeNCAQ/P5GyfFO5uhZeCCj3y84+O9w+
 OArCcqIJwNMJ83oJbaJ+vDki+IuI//zult4tRS21laaPo8RDm766bJXmUyuYwk7qSKbi
 AGzrrajVlYmdsAFlIO0ngOjDNQZKc/EG3PS57338ptndcPoVa8bv+uinJ0v+Ow05QcJj
 uZAg==
X-Gm-Message-State: ACrzQf15J5wwX+4THawDydp4nLSqfMyTnYdU9TVI17oFhMwm+zG30HBs
 innfteXzPXk92OdUD2esmPYLP3DSeMk=
X-Google-Smtp-Source: AMsMyM6TrXp0WEptusnQztJwbG6B0+cxe1Juza/FM/aCtFa84DXqr/mQ5rxjy1rx2D4ht4LKifdV7Q==
X-Received: by 2002:a17:903:284:b0:178:2a94:9b6a with SMTP id
 j4-20020a170903028400b001782a949b6amr17471306plr.135.1664105531417; 
 Sun, 25 Sep 2022 04:32:11 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 35/54] tests/qtest: libqtest: Install signal handler via
 signal()
Date: Sun, 25 Sep 2022 19:30:13 +0800
Message-Id: <20220925113032.1949844-36-bmeng.cn@gmail.com>
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

At present the codes uses sigaction() to install signal handler with
a flag SA_RESETHAND. Such usage can be covered by the signal() API
that is a simplified interface to the general sigaction() facility.

Update to use signal() to install the signal handler, as it is
available on Windows which we are going to support.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 269d622fe3..f0ac467903 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -66,7 +66,7 @@ struct QTestState
 };
 
 static GHookList abrt_hooks;
-static struct sigaction sigact_old;
+static sighandler_t sighandler_old;
 
 static int qtest_query_target_endianness(QTestState *s);
 
@@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
 
 static void setup_sigabrt_handler(void)
 {
-    struct sigaction sigact;
-
-    /* Catch SIGABRT to clean up on g_assert() failure */
-    sigact = (struct sigaction){
-        .sa_handler = sigabrt_handler,
-        .sa_flags = SA_RESETHAND,
-    };
-    sigemptyset(&sigact.sa_mask);
-    sigaction(SIGABRT, &sigact, &sigact_old);
+    sighandler_old = signal(SIGABRT, sigabrt_handler);
 }
 
 static void cleanup_sigabrt_handler(void)
 {
-    sigaction(SIGABRT, &sigact_old, NULL);
+    signal(SIGABRT, sighandler_old);
 }
 
 static bool hook_list_is_empty(GHookList *hook_list)
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F6E5EC261
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:20:12 +0200 (CEST)
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9ZL-0001dd-5d
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R5-0002nW-2r
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R2-0004wX-JE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s26so9088999pgv.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KL0tmfhCE3HA3lSFZSJgEQPnxsfYzSYvk8Q1ksHvTms=;
 b=ZZ6FnPa28AgcOrns5HF9Gw7Wj6GyYQsPrv43+Rq9aEWMrfSh7829FbtbuMVrPq2vIV
 yPLvtHRpAi/U9xxWm1nEJxL8hRv8FrA6QKm+b8MFMqCaJmGdsCC5owEq8AIbdaCi39Km
 JxCgBuznOu9HU5rhmhlpWGGLa+0eTAF3+XidXg/qEKCGbJeFNL5nmJxLKM3L9cLZcDLZ
 kNWBtay6hqRJdQbkZQY4QN4z3vJNnl/d6fTEwXYt9bhm3SbYB0qj7qy9mQA3HI/bHRMB
 TcHrBDPhG4bILEZHzpWTjEbQK45LcxRBVhkEUf2XtRlFmVmfGZwRN6Sx7nONCJyklr2K
 zEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KL0tmfhCE3HA3lSFZSJgEQPnxsfYzSYvk8Q1ksHvTms=;
 b=mP1CPP6/IQFipe8W/p03oN+aZntgH8ye0NtPoYx4fZ5YNJCYcMbg2p8sYt3J+b7+zP
 vlD2CUDtDQX/8lQ496IUar12IEbZ0a4uCWqpQccZK6r3WG3n4i1v30df080sBo9kZNXj
 EtVj/H+rxHv7XlCh1/VVJMbzsPpaAPEURfk4roJ+h42h9Se8nVn3Cn5uBRKUcE+416VO
 EbW1YbtssQDZV3rpkYVAqxIGiuATvfeRlf3XxL+cyiU5eJD7yWJ8z+16Xm1BGiDCvLdL
 Po4wevxXE8uoQz3/ral4EcOfjBWlEPR/PLJ2d1cKC/47Jtb0sXDzEBZyGtjg6r0dPdRq
 INuQ==
X-Gm-Message-State: ACrzQf0ox+vzMN9mVY2AJd+JNgSmyQhen2CPkTeI9ZmQSAUHACMJnWo9
 yoXu2V0EJL9oiDUoTEQ1Z0HChBbba/k=
X-Google-Smtp-Source: AMsMyM6OUiNtQz0yy+AYc9celMNPzVkleT+aZojsrRK6HpdRrwWGAq0d+b9d8ce/S2V/7hLp8Qi61g==
X-Received: by 2002:a05:6a00:17a1:b0:542:be09:7b23 with SMTP id
 s33-20020a056a0017a100b00542be097b23mr28794978pfg.12.1664276849459; 
 Tue, 27 Sep 2022 04:07:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 17/54] tests/qtest: vhost-user-blk-test: Avoid using
 hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:55 +0800
Message-Id: <20220927110632.1973965-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
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
files. Update to use g_get_tmp_dir() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch

 tests/qtest/vhost-user-blk-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index a81c2a2715..07a4c2d500 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)
     char *path;
 
     /* No race because our pid makes the path unique */
-    path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
+    path = g_strdup_printf("%s/qtest-%d-sock.XXXXXX",
+                           g_get_tmp_dir(), getpid());
     tmp_fd = mkstemp(path);
     g_assert_cmpint(tmp_fd, >=, 0);
     close(tmp_fd);
-- 
2.34.1



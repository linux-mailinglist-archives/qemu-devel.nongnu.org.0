Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3551541470
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:18:22 +0200 (CEST)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfee-0001HY-NM
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb3-000628-JD
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:37 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb1-0004Mx-Rz
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:37 -0400
Received: by mail-il1-x12d.google.com with SMTP id a15so15047707ilq.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFDLahUFH1FoRiJBTiATu0Ur7LkkxBUFWyrxyo8x3g0=;
 b=Rwk0ujVRI91rfza2erBM4XXiYBETULKl1sTz8EAUwHiZpv9mrqSpamDZrxcKFvzDcT
 QJEXUw7xYkcIvm8F7RuYCvAjkQfSHzYLvnjinRfrXrezlrl2bsROZmT0jCEMoooV0uIz
 p2euX/PsfN9TtexGQ/dBFhNMeUTf47numunmpckfAAyM7Q+xw56ylqK82gZYp2m7vJa/
 3DG5YtkUCtl6FWFfkNEA6oAquei4Hm6d+Y/FIEtvhxinNsgolWaRMY0S7QNO6BAMJ5l2
 QmHuu+tBZDt3f3cJPQVB03Ikfg/LLdU+vbyfpb5awiEPpwaZUzTfRUefP86KrUo8QUCJ
 j1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFDLahUFH1FoRiJBTiATu0Ur7LkkxBUFWyrxyo8x3g0=;
 b=06vTRt7DPJUTUSwtcXAahMIN1UGMV6ItoreFnvvD7gbKF2p3qV71BW5fI4to9T8kqC
 RYrWy7rANkVg2sjqgNpertlanDjljRGk3RxKj/lnBynceaacgpNaX6XP61f+pMVkTDzk
 0UCUNMVOxtQNFPT2xB/N9cgtK7F3haUm38Te2AS1fpJeh+fZ7zzkCWJY4CucKMZB6Es1
 DSEj8j+XxdwaxL07+QueUB5hTfFOhFjrpb5CKL4u13mfCYuNKsSiYC+6YW0NtN4AQjfW
 kF6D8Yf268FXTaa0FufuLhpt8l5FPJ9kxWVvSYZDSI5R+taoYpBbLdKCYCptWRAPp5Ie
 vrew==
X-Gm-Message-State: AOAM531BZAwmbS7QYRIUOgzCpg8KYN/KC2tBv1YXiTmMIK/MIqwvhzKR
 wtdR/nzSO4uQ5OXIu7ZR8RfBKgCDg8mOyQ==
X-Google-Smtp-Source: ABdhPJyBTO6DE/2PidUqjS80xlJR/LCPBbaWfsmMWjOq2nmQ7SE0zl3zE2k0yjxxpUDHFLzavw1kFw==
X-Received: by 2002:a05:6e02:b26:b0:2d1:ef19:8f90 with SMTP id
 e6-20020a056e020b2600b002d1ef198f90mr17837704ilu.180.1654632874568; 
 Tue, 07 Jun 2022 13:14:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
Date: Tue,  7 Jun 2022 14:14:36 -0600
Message-Id: <20220607201440.41464-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220607201440.41464-1-imp@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Releases the references to the iovec created by lock_iovec.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c41ef0eda40..510307f29d9 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -186,6 +186,20 @@ fail2:
     return NULL;
 }
 
+void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
+    if (target_vec) {
+        helper_unlock_iovec(target_vec, target_addr, vec, count, copy);
+    }
+
+    g_free(vec);
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1



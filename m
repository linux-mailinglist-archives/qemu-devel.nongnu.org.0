Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE0576312
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:50:52 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLiV-0004Xa-5y
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLgP-0000To-OK
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:48:41 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLgO-0006u1-2F
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:48:41 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q16so1352002pgq.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ylb4woiWl7rRdOJRD6I0pk2qnNC5s/O1KGQ+3BsXcPM=;
 b=m1m9TqU1bLwixnbSjGQt3k1V6m75kmNDq6ipDEgMZ9mdT4V9kQ1Up3i1n4OdN+IfyR
 VLUecg0XNshayVLKbtw+rNCxcGKbHKzw1c1tYHDNNfbMK2R+gc3/rhmVaAYxXDku7/d+
 g+D+Nn5KsBH6WGZawu0+cvHo8YdatkjbOlaxV13D5Bxw+XGxQ2JPHetfs8aro+4lL080
 BcRN9E+ourA5tTuQvci/Hqf/N3Udr5R7as01vaI/bj8+rk4O1Xdju65qzvKDmlgwrWQN
 OSLIYjmekFzM2OVvpdoHoo1TRKwoiwTggOdz8e+zXha6faC6nD/uc5vicXIE1c6yjub/
 jVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylb4woiWl7rRdOJRD6I0pk2qnNC5s/O1KGQ+3BsXcPM=;
 b=K1j/Us/pqAMcVPmb6SK9OSdFjzGe56XAMgd9GiDvmL7dLB81IcYCpQGoUD2pKyimdq
 cGv4kyl1NJFI4Zs6fxCF/Lmw9XTlHcxQ2IctUcPWxxtdCMZnRI8C+6CkGRmRI3NBhgeE
 xQbHRBrftrWtnYXiRVqciT4y72hUNdJyiC242Y2BM6Dg7zGEDF+CQ0YN0DM5j9h2z248
 Qk94x4VnezTACXP6NbYwR3PzeIoMSQvNtd0S45U2kwnlvTC7uPJM/yU0G+hndzwuuuIL
 dGPLRM+n5KvvLGLFULPc87+dipuWE0CKxYOJ9zt2ugw9RrnnYnJmoYvA+ERvX1o3QYtY
 Y7NQ==
X-Gm-Message-State: AJIora+bXCuSX8ILyjuPBSZ1gRyaPduUF9or7uODy4fncNVGx3vN7K5E
 4GarMFs2+ed5BD1V1b1OQv+ob/oppQA=
X-Google-Smtp-Source: AGRyM1slvqB1ALnPH9qMgCEyt0UQJDmbjyMYZACqOHN5M2H2CSFrxV79u9za+qU+8JQBM2RUK+OwOQ==
X-Received: by 2002:a62:542:0:b0:525:a313:fe28 with SMTP id
 63-20020a620542000000b00525a313fe28mr13910056pff.73.1657892918211; 
 Fri, 15 Jul 2022 06:48:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a17090a165600b001f035bfcc53sm5579126pje.18.2022.07.15.06.48.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 06:48:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v3 2/3] Revert "main-loop: Disable block backend global state
 assertion on Cocoa"
Date: Fri, 15 Jul 2022 22:47:49 +0900
Message-Id: <20220715134750.63090-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220715134750.63090-1-akihiko.odaki@gmail.com>
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 47281859f66bdab1974fb122cab2cbb4a1c9af7f.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/main-loop.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 5518845299d..0aa36a4f17e 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -280,23 +280,10 @@ bool qemu_mutex_iothread_locked(void);
 bool qemu_in_main_thread(void);
 
 /* Mark and check that the function is part of the global state API. */
-#ifdef CONFIG_COCOA
-/*
- * When using the Cocoa UI, addRemovableDevicesMenuItems() is called from
- * a thread different from the QEMU main thread and can not take the BQL,
- * triggering this assertions in the block layer (commit 0439c5a462).
- * As the Cocoa fix is not trivial, disable this assertion for the v7.0.0
- * release (when using Cocoa); we will restore it immediately after the
- * release.
- * This issue is tracked as https://gitlab.com/qemu-project/qemu/-/issues/926
- */
-#define GLOBAL_STATE_CODE()
-#else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
         assert(qemu_in_main_thread());                              \
     } while (0)
-#endif /* CONFIG_COCOA */
 
 /* Mark and check that the function is part of the I/O API. */
 #define IO_CODE()                                                   \
-- 
2.32.1 (Apple Git-133)



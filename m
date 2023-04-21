Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE56EA319
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:25:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFV-0003RN-Jq; Fri, 21 Apr 2023 01:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFS-0003Qr-Lr
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:23:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFQ-0001dI-Tk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:23:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so13720305e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054631; x=1684646631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NZapYTDZldP9MBrj5QmJu1CEbfC+yKjdt76fwz1lq8=;
 b=HEyCZ5xvCtFIXY32VYcUjda2wSxZqr5P5Ls6EosEBZwdHNHVeqyOYMvmqMGCx/iDNF
 fDun4q4dvO3qXl6eCi/fj+zvgzuoDDq5U+ddmJjTBrZDU6ZCZXmLb6IF7xI0kzq/MBxc
 H0RmtOlxmkNqw6h93LagYb02ykeCIIcG22vlJfX/TytfUWioeJ+iKX7zN6/6iV17hUpl
 JcT/N2Jn6cwBhky+KuWvNrPUBk+Q6zl70xw3k6os3zkHPV4o6eBIK0k1R/3sZgoNJQiM
 SkvMYySpouB16vVHz9ODGRv8Pug9PqbHqSJzfmyngPqeO7X0qxFb7oKMB7ztz+OGq1z9
 adMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054631; x=1684646631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6NZapYTDZldP9MBrj5QmJu1CEbfC+yKjdt76fwz1lq8=;
 b=HN3nVYoLKFecNWeCExSO0uutL3UMjO8d3h9Wxo/n2gpqReN4bDoOXU/2tnAiAHosC3
 5fDGIK6nDcO39EG640SBYJ1Ma6lueAzlH0fEc74BjSSY6BNAfj+xNX43AnV2KZk/QbFU
 EsFsjc7vEkij+AdscOH909jx4F04J/VgbVs5uAs6oOCiFRmJYfKBsqFM0HtMSEylq2pT
 0fKQ3X6qQEl3KVFhwSco7xWTPVQAFdiSj2Znr7V2Tq1YrufswFqbsIAm4ZeFFadjBPhe
 T+Tkyft5Rfd48HJpEH8MzMsBSBQRQ8YxJXVo2tn8ajmmdcbhwaQ4A/fk6MKgKiu644wH
 SuiA==
X-Gm-Message-State: AAQBX9cRRW8zYgJyBsp0WW3EERM8yG1M8RDMhsut4RZ7rdjFNp1tSVPS
 Nro1CJodXpI9f0wC12+20Lonahog3N4=
X-Google-Smtp-Source: AKy350bAmDkUMp+/RSdTxp51Vj7m/AghHk2bBsan+HmnEF2Xb1eSsWd/wIUR/p4pOF4eXizeMTVlyQ==
X-Received: by 2002:a1c:7408:0:b0:3ed:2a41:8525 with SMTP id
 p8-20020a1c7408000000b003ed2a418525mr808387wmc.22.1682054630598; 
 Thu, 20 Apr 2023 22:23:50 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:23:50 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com
Subject: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:45 +0200
Message-Id: <20230421052255.5603-2-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Warner Losh <imp@bsdimp.com>

Allow guest_base to be initialized on 64-bit hosts, the initial value is used by g2h_untagged function defined in include/exec/cpu_ldst.h
---
 bsd-user/main.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index babc3b009b..afdc1b5f3c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -50,8 +50,22 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
-uintptr_t guest_base;
+
+/*
+ * Going hand in hand with the va space needed (see below), we need
+ * to find a host address to map the guest to. Assume that qemu
+ * itself doesn't need memory above 32GB (or that we don't collide
+ * with anything interesting). This is selected rather arbitrarily,
+ * but seems to produce good results in tests to date.
+ */
+# if HOST_LONG_BITS >= 64
+uintptr_t guest_base = 0x800000000ul;    /* at 32GB */
+bool have_guest_base = true;
+#else
+uintptr_t guest_base;    /* TODO: use sysctl to find big enough hole */
 bool have_guest_base;
+#endif
+
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
  * guest address space into a contiguous chunk of virtual host memory.
-- 
2.40.0



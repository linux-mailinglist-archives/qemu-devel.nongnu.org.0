Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E38E2BE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 04:33:44 +0200 (CEST)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy5aB-00085t-3I
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 22:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5DZ-0006Fo-Dg
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5DX-00007x-BJ
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:21 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:33200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hy5DX-00005W-6i
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:19 -0400
Received: by mail-yw1-xc42.google.com with SMTP id e65so307104ywh.0
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 19:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qlGfxL9SikyisQtWpLQeFtSP20Q8WGkN4u4QmTWngOA=;
 b=ENNmd74uxUtS/bnKqnqsldFjx3FB6/KkZKiukEzG+VOqLXfLq4a8gbHZ/FxO3yL6Ir
 UVuhIioqAe1PJnqxEl+LngDVXtxUf6489g9ieTmCY1wJBtH/c6dqKP9nDZIcHPlNrIaA
 n2IKFwsZviMdUhctw65owb8CErWbUvAggHz1+IrkMIC6oREvC4TkWCvCz8Q2qIPTlDQd
 Wkdb+397oifKFBMlMwd/tnBsxaBmPYd0CpdiQxFJ80hD9329V1BMGeX4p3YNx0HH5E6U
 C9mSPKWs2WhZ91ndkB2sR1ZDdQApJLWM9m86jOwD6IYAo0tgZ5OHhaPO/gLbrSqDSFjw
 xgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qlGfxL9SikyisQtWpLQeFtSP20Q8WGkN4u4QmTWngOA=;
 b=s8/DHnhrSoNL5zd8yxgIz0TxH5Bdd/bMuyqpIQAxYmG+TkzIhoh5Np3xNGaEWaUn3b
 xxktTkOow9NkGbDFRwGDl6J5c7JBaepykYf/zX8rUilEeyL6lxx0EOF6Difl8v2g6mjc
 lx1+wwQ3b97TYjwcXj6+tNwEe492nI/IBq5KjwtbzyTOjRnGoOb5WV5kvHImGP/j+afE
 AgkMw/qxR3BJOjs36KmgAgMSUIzOo829lwpNLDpISxRUYhf+Ov8f8mJ2yVVRIuIfE+nQ
 1i1G9/N0IdL3pUJdm3UPW40RNIY/eKZaq0GaPXRYP4gNk0ta14QmUumBZAdzT9Fgnv3O
 Q+tA==
X-Gm-Message-State: APjAAAWgg7RI/WjH5MMwz2TRkiEyi24Ywx29zTb9x+aNUQN+yA369mXG
 vZnQSMgDd1VEhhsjKS2X+ZoUMZVp
X-Google-Smtp-Source: APXvYqxZL1rrEan71b3D86M6P1PJVhlqVZPOzqGGMiKQ8vIzEDChoMjy4w5LEw1CKtyl4c6SyuFQNA==
X-Received: by 2002:a81:9bca:: with SMTP id s193mr1602510ywg.316.1565835017960; 
 Wed, 14 Aug 2019 19:10:17 -0700 (PDT)
Received: from dionysus.attlocal.net ([2601:c0:c67f:e390:8a9a:e33f:caf8:f018])
 by smtp.gmail.com with ESMTPSA id
 j3sm374882ywk.21.2019.08.14.19.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:10:17 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 22:09:07 -0400
Message-Id: <20190815020928.9679-26-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815020928.9679-1-jan.bobek@gmail.com>
References: <20190815020928.9679-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
Subject: [Qemu-devel] [RFC PATCH v3 25/46] target/i386: introduce Ib
 (immediate) operand
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the immediate-byte operand, which loads a byte from the
instruction stream and passes its value as the operand.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 4562a097fa..78e8f7a212 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4879,6 +4879,24 @@ INSNOP_FINALIZE(vex_v)
 {
 }
 
+/*
+ * Immediate operand
+ */
+typedef uint8_t insnop_arg_t(Ib);
+typedef struct {} insnop_ctxt_t(Ib);
+
+INSNOP_INIT(Ib)
+{
+    return 0;
+}
+INSNOP_PREPARE(Ib)
+{
+    return x86_ldub_code(env, s);
+}
+INSNOP_FINALIZE(Ib)
+{
+}
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1



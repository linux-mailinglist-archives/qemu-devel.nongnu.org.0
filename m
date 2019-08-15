Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15708E2A9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 04:21:42 +0200 (CEST)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy5OX-00020B-Dv
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 22:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5DQ-00066j-TH
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5DP-0008NX-1g
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:12 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:41222)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hy5DO-0008N7-T6
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:10 -0400
Received: by mail-yw1-xc43.google.com with SMTP id i138so291818ywg.8
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9601ErWO7zgsMa+wbbKQmtGl/jKL1D9g8CD0vQWqE9E=;
 b=iNhcdwqqaExZxJiPGrqQyHrClhTFZJNpX/mbXbnosTy9oiDYRbpAsIl+AHxxdx60Ol
 aRPaESzyfwKTcJdT60GO91hh4NGfKi8qaB+Qv0Y4lnQCVV76D4mxRZ346QEYygSNGetS
 qJIiWrG2Kd281uZjCIgENkiS0fNYlKK8omNWVthF06RUllOJqkEiDw5+pC8l3MjeOMiR
 UCt4AJYmCodXWlWthHk9hB08nAND0uUszAJkGeqcEDHxv/FAWpzGupXPkdzkUrZ1tsY3
 HBc3Blvc5+8nWOZnXDTbiI5BUXp0yluePXg2pM5b2ORASHVVZxp9FV+QcTmRkqeaVGIP
 Rilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9601ErWO7zgsMa+wbbKQmtGl/jKL1D9g8CD0vQWqE9E=;
 b=Dw3I10lODpebiziL/RiRFXIBXIHSxSZawgN+siDNP83K89tztiNIALnssfsQjb3oGh
 WjaIF5BOx6BXaf1vLKyRVG3h/h8IY/RXOAaF/H31QqoUQuzVmXR46bkC9wk/n+P5T0KU
 evHawYIvefVZb1aXvX7i7b9XJCU4chZ/e6SUfHLby70nCBWo7adeL+ac0JYKf/dn5C3O
 9DBVrJlc8AeAiPFFZnnT57s+PjvY0uDD1rUa34RD6cOy9vnLaNm4Y2W6Z3R2boxynUIW
 8tD+EKxdxTUq+EXOE9b2/g7xLmTt07FmrmiezWnnRKXU/qm+dP9972s3wC/ov1J630zL
 lzYA==
X-Gm-Message-State: APjAAAVlKPrDUcT2BXOR2Nw77KsbFWUl2ROYCA2m3XLlwqLFM+8PdDYF
 yQEdbxmC1oLLEUhRiIKc0T3EOMav
X-Google-Smtp-Source: APXvYqwHdHY++d1KD7W3zCEVotPiMi/DyEU2xRFwg0KW5omu8cBPQKoTmAPxc2PQe74UTt1m+I/NHg==
X-Received: by 2002:a0d:f2c4:: with SMTP id b187mr1616819ywf.103.1565835010255; 
 Wed, 14 Aug 2019 19:10:10 -0700 (PDT)
Received: from dionysus.attlocal.net ([2601:c0:c67f:e390:8a9a:e33f:caf8:f018])
 by smtp.gmail.com with ESMTPSA id
 j3sm374882ywk.21.2019.08.14.19.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:10:09 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 22:08:59 -0400
Message-Id: <20190815020928.9679-18-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815020928.9679-1-jan.bobek@gmail.com>
References: <20190815020928.9679-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: [Qemu-devel] [RFC PATCH v3 17/46] target/i386: introduce generic
 operand alias
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

It turns out it is useful to be able to declare operand name
aliases. Introduce a macro to capture this functionality.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 9d00b36406..8989e6504c 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4576,6 +4576,26 @@ static int ck_cpuid(CPUX86State *env, DisasContext *s, CkCpuidFeat feat)
                                      int modrm, bool is_write,  \
                                      insnop_arg_t(opT) arg)
 
+/*
+ * Operand alias
+ */
+#define DEF_INSNOP_ALIAS(opT, opT2)                                     \
+    typedef insnop_arg_t(opT2) insnop_arg_t(opT);                       \
+    typedef insnop_ctxt_t(opT2) insnop_ctxt_t(opT);                     \
+                                                                        \
+    INSNOP_INIT(opT)                                                    \
+    {                                                                   \
+        return insnop_init(opT2)(ctxt, env, s, modrm, is_write);        \
+    }                                                                   \
+    INSNOP_PREPARE(opT)                                                 \
+    {                                                                   \
+        return insnop_prepare(opT2)(ctxt, env, s, modrm, is_write);     \
+    }                                                                   \
+    INSNOP_FINALIZE(opT)                                                \
+    {                                                                   \
+        insnop_finalize(opT2)(ctxt, env, s, modrm, is_write, arg);      \
+    }
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1



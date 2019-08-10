Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E77887F5
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:23:53 +0200 (CEST)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwIv2-0004Ef-QF
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34993)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIlD-0006jo-9L
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIlC-0004aP-Bp
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:43 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33391)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIlC-0004aC-6z
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:42 -0400
Received: by mail-ot1-x343.google.com with SMTP id q20so140363080otl.0
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvlDhs+Y7jVChgXE4zpu4PvKaqtaIMBMelU0eaOfnuo=;
 b=F95CQ/gKSHYDT7OFpk5hmp6x9AS01mCWjt1AOl+4JPGA6P0+NAaqBaJFEETDJM5Fqi
 oNCwzSI4xCdts/sAEuBtkmO6FQnXLe7aX/0/l1cw1pn/4Ed5Kc0OMsURlqy47Xlve5mL
 75YJG3Y92Xydmvc2WFW6cXfdkuCEO9UFjKKfIAm8ZH2s+2vmxGR6v+VuC/tIzLgE9Q6f
 CnicH6Vwo6lnThuGfCphzxURZOAXxa70UAPXNVxtW7UvuADA9eT2i/akwpTNapZaRRVN
 LgBL2dBq0h6D1xSZE0BRKonIXawhOlqMgnjFuxVdcNEGJSoFe509dy/BZpIrpaErsdvb
 ieyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvlDhs+Y7jVChgXE4zpu4PvKaqtaIMBMelU0eaOfnuo=;
 b=Sjm6KjAIfLZLpeBC7BqTrNGJA4ShFAqjdmZLOObs44+c1AJXieom3UHs/gxbi14aZK
 faNt7U9BfykXGEqCIqj9LZad+Kjan4x+ecocUSOHGrva6wC+GKSEj90v/kq4CheXwkZC
 k85k0Y3GlZN1k7n/IXABok6BVPkpvo+SLJQBfdDodQdz9qNpzvtnkGvuXoSUtSt3i0Ce
 t9tJoxXzmhZfD/9ApWeUcUE/DHEeL/+xqbuVeGhXOIm6RVxz18WRoBT4xwvLlVyzqZQk
 7p2VrjK4s+vrlkO38yufO6B5K26g/6Nei/ugarGimbLCJrXDPQg0We4e8x5dzmQorYgF
 P4wQ==
X-Gm-Message-State: APjAAAVi3WtOemtthgC//FPGvkvGm1S4vWj6fUs8R+NOU5avYzcoUzXz
 jlu4OCnQgNlgitUgAt/vJiQeb7vU
X-Google-Smtp-Source: APXvYqw/Hl9WaaspMrLMR4MoGO6V6r8Oh7FAD28OvNrRfnpJY5t4CG+Co3HQSEnqjkh8iVsh5b7prA==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr21652829otj.28.1565410421541; 
 Fri, 09 Aug 2019 21:13:41 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:41 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:51 -0400
Message-Id: <20190810041255.6820-36-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-devel] [RFC PATCH v2 35/39] target/i386: introduce UdqMq
 operand
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

The MOVHLPS instruction has a special operand: it reads the high
quadword of the source operand (hence it requires the full
double-quadword width), but if the operand is indirect, only 64-bits
are read from memory. Introduce UdqMq operand to address this case.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 97614e5941..5802b324f0 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4876,6 +4876,11 @@ INSNOP_LDST(UqMq, Uq, Mq, offsetof(CPUX86State, xmm_t0),
              gen_ldq_env_A0(s, reg + offsetof(ZMMReg, ZMM_Q(0)))),
             (assert(ptr == s->A0),
              gen_stq_env_A0(s, reg + offsetof(ZMMReg, ZMM_Q(0)))))
+INSNOP_LDST(UdqMq, Udq, Mq, offsetof(CPUX86State, xmm_t0),
+            (assert(ptr == s->A0),
+             gen_ldq_env_A0(s, reg + offsetof(ZMMReg, ZMM_Q(0)))),
+            (assert(ptr == s->A0),
+             gen_stq_env_A0(s, reg + offsetof(ZMMReg, ZMM_Q(0)))))
 INSNOP_LDST(UdqMdq, Udq, Mdq, offsetof(CPUX86State, xmm_t0),
             (assert(ptr == s->A0), gen_ldo_env_A0(s, reg)),
             (assert(ptr == s->A0), gen_sto_env_A0(s, reg)))
-- 
2.20.1



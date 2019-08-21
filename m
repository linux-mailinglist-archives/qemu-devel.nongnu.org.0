Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C69819E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 19:43:03 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0UdS-0000Tv-8l
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 13:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR4-0000kE-1K
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR2-00077Q-QG
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:13 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:35302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0UR2-000767-Lq
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:12 -0400
Received: by mail-yb1-xb44.google.com with SMTP id c9so1353020ybf.2
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YAMNXlLOuM4Ta9jqg2Fe8pblTj+VNxEkwoFOEYqrh7E=;
 b=JlNm4gqXEy62ha6a6f4ap8noJQ8VLKhi/CmH4NsEw+PWbrcglnYisvy8i5VxZHpTe5
 xDc9gz5/RiOmJwdsnf/1FnkHnOqNzq0w9Xs/jl4LuJjUHxNkz80bHDazU9KeIi697n/k
 ISxlwsFXgZnOGFixjpJEhlbIYIp7Ii3YJdiTXyHwkHcJxmnYIo3UFtonbTK1H9WjmPoH
 0SDruOpEVbCe4xJ8RHJrAr/Gsku99VPV4GLXaPOLgARmQ936wBqxvNFg3AiC7+NEGj/m
 fwgDCVlD8NXlTZneognZV+9LiiDkzG1hubkagkMhol8g3Dv6kna8AThyd39xXC9r8/Bh
 6UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YAMNXlLOuM4Ta9jqg2Fe8pblTj+VNxEkwoFOEYqrh7E=;
 b=m0hmHk0m/fv6yO/1Ftxf4CVn0vpO/epcOsTPf4OutOB7bKD090vgyM0elrp/5ruVvj
 LvSLMT8p2iWi1ClSDiVKFGLe83k8poqzzkPZ91U4aiTt8laIzv93bdmlyw9gfphvEzAM
 +clFz/c5Jflvvx/DQf2RUPLq84MZhykBsduwLyneZ4GjcW1MIRLB2pxgqmVMg3SWAPgm
 TeN64/BftN9ThD2fFKezerMtR1YgJHzCwbRvA2aYtOyvBYt+ju3WJzbfYJ9lMdBunz1N
 u0YUuXZXRk7Pdv5n7BbVGPnbYad5yf1LnfP5HPabUmNOsbtLlbTpCIAfiNHz06CyVOO6
 QmCg==
X-Gm-Message-State: APjAAAXB+/wYzVlJIiFJtVXQvJGtHHTooxgScxQVFCQlHcCHi6G6d6Rw
 o9owv/1xDmGzZsu9A6jv2xEMnWXO
X-Google-Smtp-Source: APXvYqzfUTazJKO8tiolkBFWkiYuIFg81dxKDejSTtcXisSSpRHQwxxfK+LxA3/m+EI76/v4vZGfeg==
X-Received: by 2002:a25:76ca:: with SMTP id r193mr26497258ybc.33.1566408610938; 
 Wed, 21 Aug 2019 10:30:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:10 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:28:46 -0400
Message-Id: <20190821172951.15333-11-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: [Qemu-devel] [RFC PATCH v4 10/75] target/i386: add vector register
 file alignment constraints
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

gvec operations require that all vectors be aligned on 16-byte
boundary; make sure the MM/XMM/YMM/ZMM register file is aligned as
neccessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5f6e3a029a..f226e61724 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1202,9 +1202,9 @@ typedef struct CPUX86State {
     float_status mmx_status; /* for 3DNow! float ops */
     float_status sse_status;
     uint32_t mxcsr;
-    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
-    ZMMReg xmm_t0;
-    MMXReg mmx_t0;
+    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32] QEMU_ALIGNED(16);
+    ZMMReg xmm_t0 QEMU_ALIGNED(16);
+    MMXReg mmx_t0 QEMU_ALIGNED(8);
 
     XMMReg ymmh_regs[CPU_NB_REGS];
 
-- 
2.20.1



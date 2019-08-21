Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3097E37
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 17:11:54 +0200 (CEST)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0SHB-0003TR-9z
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 11:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen.git@gmail.com>) id 1i0SFG-0001hp-05
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen.git@gmail.com>) id 1i0SFF-0002Gz-00
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:09:53 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tony.nguyen.git@gmail.com>)
 id 1i0SFE-0002G0-Po
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:09:52 -0400
Received: by mail-pl1-x642.google.com with SMTP id m9so1478412pls.8
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqYAGHFvR06e3YgHXN9Tnj6p8DXRiDGRFOLRcxpAKMg=;
 b=RPI++ByjCvlUsPs6F5rTwA8Zr1m3bprXpx3BSrYtBSVf/Z3zJMULOk7RN2MvKQZsMT
 39ZpF+wMrtCJE19TXMbjit6nvVAlwOq1afITgJJOFwOrCmcpaEnQJHtOZTAB2UeMDmaT
 /w+kK0QwYDDLmFXbYZgO6XWKrX2/RRgUuJvWfhFRqdNpd74PNKjE6VdPgH8WzoXvWENA
 7pBJiy0IjAPOiDSrO3C8GBR4oa8YJ59Fn2CVsZTr3S6cZLK/FZkij6CeN5PrG+jXwyR9
 BpwewxnjZpsM8GDWnkc7tsYWOIpABYVyYSHb59pnCiK+2L315FtTJi5GUd4n/tmKSsvL
 FtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqYAGHFvR06e3YgHXN9Tnj6p8DXRiDGRFOLRcxpAKMg=;
 b=TyRwDxm6h8RabuXOiM9OKqaEXYIli5YJGryyf0GnmWbBjr5BekyGth1xJXhC1csG2B
 X/LYVSE3Yo6YkkQNR7OiVzH5gBIGAWQwpReOylPjO9RBwYTDbEeE/6naOWsyTL9zdQqz
 P71qrCuTfdoOyFobtEuXnVunWx1nDcKiEiMRD/gxPOc699eJjMS4jmpVNua69Z47ICGd
 V0vlGkW+luI1fmt0FzZDLmpbORVu2TA6+7y57b9cMyYaZb+1LX3Mth0bY1NAs1DQX39h
 uDHvwKB9upD0P2SOdjqDulAd9jAK7j5jULPqIjdB6+noNM5j3oa+WT6PileZyooT5+KA
 oaNw==
X-Gm-Message-State: APjAAAVj4n8CsEoT4qRQMkuf2TYELcYKEqXHCap0W0q4iyp3LsKjnqfe
 absh4wN/u9VrqHEo0NFTn3sNCiHpYBE=
X-Google-Smtp-Source: APXvYqy3PgyKZGraTpOQq2cvTaAOjnu423KprchuGdkvg7SttPjdlTysx9ijw0FV5iJVOvF4a1fLiQ==
X-Received: by 2002:a17:902:2aea:: with SMTP id
 j97mr33875846plb.153.1566400191685; 
 Wed, 21 Aug 2019 08:09:51 -0700 (PDT)
Received: from localhost.localdomain ([58.173.98.68])
 by smtp.gmail.com with ESMTPSA id e19sm5887633pfh.114.2019.08.21.08.09.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 21 Aug 2019 08:09:51 -0700 (PDT)
From: Tony Nguyen <tony.nguyen.git@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 01:08:58 +1000
Message-Id: <a46ceb7a57f6c762b3e5150da8b2ab7160f7ae12.1566397711.git.tony.nguyen.git@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566397711.git.tony.nguyen.git@gmail.com>
References: <cover.1566397711.git.tony.nguyen.git@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v8 04/21] target/mips: Access MemoryRegion with
 MemOp
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Tony Nguyen <tony.nguyen.git@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index f88a3ab904..1f0e88364a 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "exec/memop.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 
@@ -4741,11 +4742,11 @@ void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
     if (op == 9) {
         /* Index Store Tag */
         memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     8, MEMTXATTRS_UNSPECIFIED);
+                                     size_memop(8), MEMTXATTRS_UNSPECIFIED);
     } else if (op == 5) {
         /* Index Load Tag */
         memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    8, MEMTXATTRS_UNSPECIFIED);
+                                    size_memop(8), MEMTXATTRS_UNSPECIFIED);
     }
 #endif
 }
-- 
2.23.0



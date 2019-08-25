Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F386E9C5DE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 21:40:01 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1yMq-0005bE-S1
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 15:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1yKx-0004Qv-Mh
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 15:38:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1yKv-0003LY-UW
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 15:38:03 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1yKv-0003LE-OC
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 15:38:01 -0400
Received: by mail-pl1-x643.google.com with SMTP id m9so8761679pls.8
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 12:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=umjbQvyNhOeOnMJlj/UuLiaomopZxKybKESiEh98ACs=;
 b=rDj3IPrs2U1IEv0sNBvikDZUUz3K38Y3baplRkVH/iwywp5T5hEUJ3KMMSA/vJDFSx
 Ybcz7/9UWa1CeeOTnNpKMePr7OxkjQki5B5xF/8SHoPiwgWZ7lGkA6qWhRUaik4GHoNY
 JEeprwZM0cl5D3qkzIbm67c23lyW/fXi9z8gHo7PuVktQ3MRdSA2jg9cb1TLw4cKUI7c
 Y5tUMHvoQaXAKAYD3Sbb8XY0HEpp0LwdPYTERQwsF2OZtlfzeSg5QTIHFh4lRMI/1d3t
 W79qMVCb/ZIVwrOEh7PaA2cUZ8IsuWMvN5FHeTIWObwkXw96hbicnPNrjszGmUsOQfay
 WJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=umjbQvyNhOeOnMJlj/UuLiaomopZxKybKESiEh98ACs=;
 b=HmvU79vZoFGxtf+QUwa2nYabUaYFvc1Qt3oT/jakThDlQOr5TzRaD3bJT6b9lKYgqv
 K+KAXT4z0wUD8H3RZyCVi8pkottRnZsSWgVQ7LmCyLthGDHfFuUWXlnnYCSRB0Cs3JUS
 tWLB70qnlGnnJU8hkgjda+Rc4GKqmeRHl5DD5HeU1x7yzXCUx0YAw53vw/8EupezRtgn
 Dv9NRzz9rpia2FDzxcTWVgTQ/SYazh8vN7vrdD/fBcjQ/mNfSEvhGOqIHPRFK2+C8ALv
 u4jKiMGth/cDIp7fT4oT259qoQvJNG2HCtaDZUoCd9vxCf2nndIflA2fXx2w2qb8sK5+
 Z+Cg==
X-Gm-Message-State: APjAAAWbwKxWh7EOdxhL1FMXbmLPyufldVxLWM8XyHRKzZ1z0V8s3Brc
 7u/bwm9uuD9ADM4zUJX8JF7UorNqcho=
X-Google-Smtp-Source: APXvYqyp2F6Oh9370KO/U6i7QTp4zeykjhCJxJLvqGZfhZ0FIPIQRkwX5brlcMxXHs5q//pbNf+Mvw==
X-Received: by 2002:a17:902:f30f:: with SMTP id
 gb15mr15732834plb.233.1566761880552; 
 Sun, 25 Aug 2019 12:38:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a6sm10414039pfa.162.2019.08.25.12.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 12:37:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 25 Aug 2019 12:37:57 -0700
Message-Id: <20190825193757.16297-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190825193757.16297-1-richard.henderson@linaro.org>
References: <20190825193757.16297-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PULL 1/1] target/alpha: fix tlb_fill trap_arg2 value
 for instruction fetch
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aurelien Jarno <aurelien@aurel32.net>

Commit e41c94529740cc26 ("target/alpha: Convert to CPUClass::tlb_fill")
slightly changed the way the trap_arg2 value is computed in case of TLB
fill. The type of the variable used in the ternary operator has been
changed from an int to an enum. This causes the -1 value to not be
sign-extended to 64-bit in case of an instruction fetch. The trap_arg2
ends up with 0xffffffff instead of 0xffffffffffffffff. Fix that by
changing the -1 into -1LL.

This fixes the execution of user space processes in qemu-system-alpha.

Fixes: e41c94529740cc26
Cc: qemu-stable@nongnu.org
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
[rth: Test MMU_DATA_LOAD and MMU_DATA_STORE instead of implying them.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index c6998348df..19cda0a2db 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -283,7 +283,9 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         cs->exception_index = EXCP_MMFAULT;
         env->trap_arg0 = addr;
         env->trap_arg1 = fail;
-        env->trap_arg2 = (access_type == MMU_INST_FETCH ? -1 : access_type);
+        env->trap_arg2 = (access_type == MMU_DATA_LOAD ? 0ull :
+                          access_type == MMU_DATA_STORE ? 1ull :
+                          /* access_type == MMU_INST_FETCH */ -1ull);
         cpu_loop_exit_restore(cs, retaddr);
     }
 
-- 
2.17.1



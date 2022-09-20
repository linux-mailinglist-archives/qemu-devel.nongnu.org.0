Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405CD5BF158
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:38:02 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamoS-0007ER-Q3
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8x-0001Si-Sc; Tue, 20 Sep 2022 15:42:58 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001rn-DP; Tue, 20 Sep 2022 15:42:54 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so5752963fac.13; 
 Tue, 20 Sep 2022 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Jfg8z0WGRDgirJjU1ySIfnLP1EXIF1PQKFWI0e3jnO0=;
 b=FrrRxzQ9G1BdzpL6xDgOt9fe+h/Oum6HK0MxR6W8L9BYg8x6+8VsFa7XL12+sNDydr
 srQefsVCrq2YFtr8hcfoXVRQUakHJz9+XskbJmZ4OqUrTSeL0bs6qUx8AkjLDHAhE5Cq
 430+4eLO1jBEOiJmEtxNANZ8UQj2QgY9UjCwuWkZlqMaj9H4p8vvaHiXo0XHkZMLVt/k
 CjVAGblON6FMFnk4J/8mtfyyJmA+WKn9pz2BpZOrtPN1N3XHwRhle3m88RsmZ3PuXMtA
 /iRIK1Miqh7fKvFLc7PhmkOXO9f5HuE0yGODd5yUuOYuqJUgYcYRMK9rpF+bgwGJwp51
 TK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Jfg8z0WGRDgirJjU1ySIfnLP1EXIF1PQKFWI0e3jnO0=;
 b=Rt4U8LkcJFS3c6hgbCmlD5NeTEZyUHpnqOq6GB8YMcdf4BMJfpLs+0D7aJFC2UdHPd
 UAyh3S/0A0Oz90OZ/yw5fTSQB2YNfktq5apsiXDk+25oc5KDSxf9s72OD4PiBLqxozhy
 yqo1nUN2R+DaW3FjtKuFZDXmZdprFWnEx5X3xhct4GuZ63UNoK4ycAMhpha74sza7h9V
 cwOiYFAf5QSjdT82gCKyk5sO/VEsLtKYbjdLLOjYWLPXL+zxaHk7XB0Jrrf0pjgCYH/W
 yqtEmg1bYgcbce5HpHWhxVImn4tieG4GCnWo8iYpTx1hIZ1ekgRiOsLmiz8zF9Zx35Wp
 xWPQ==
X-Gm-Message-State: ACrzQf1eK5xFhzhZmVSXy2xTTFPqWlIsZpqJQDgBFpkNCXPtEtcGrwHQ
 4reejxSHQ//EK7lgoHn4/9CRTuDOaPA=
X-Google-Smtp-Source: AMsMyM5Tq/whG072eIhbnaqwOJhERsmWTx2IV7pC3Y+7LJ7z/VtN7fJZsx4DINzgWyJkIqvtGWoQHQ==
X-Received: by 2002:a05:6870:f612:b0:11c:f79a:784a with SMTP id
 ek18-20020a056870f61200b0011cf79a784amr3198034oab.2.1663702954208; 
 Tue, 20 Sep 2022 12:42:34 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 09/17] target/ppc: Zero second doubleword in DFP instructions
Date: Tue, 20 Sep 2022 16:41:54 -0300
Message-Id: <20220920194202.82615-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Starting at PowerISA v3.1, the second doubleword of the registers
used to store results in DFP instructions are supposed to be zeroed.

From the ISA, chapter 7.2.1.1 Floating-Point Registers:
"""
Chapter 4. Floating-Point Facility provides 32 64-bit
FPRs. Chapter 5. Decimal Floating-Point also employs
FPRs in decimal floating-point (DFP) operations. When
VSX is implemented, the 32 FPRs are mapped to
doubleword 0 of VSRs 0-31. (...)
All instructions that operate on an FPR are redefined
to operate on doubleword element 0 of the
corresponding VSR. (...)
and the contents of doubleword element 1 of the
VSR corresponding to the target FPR or FPR pair for these
instructions are set to 0.
"""

Before, the result stored at doubleword 1 was said to be undefined.

With that, this patch changes the DFP facility to zero doubleword 1
when using set_dfp64 and set_dfp128. This fixes the behavior for ISA
3.1 while keeping the behavior correct for previous ones.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-4-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/dfp_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 5ba74b2124..be7aa5357a 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -42,13 +42,16 @@ static void get_dfp128(ppc_vsr_t *dst, ppc_fprp_t *dfp)
 
 static void set_dfp64(ppc_fprp_t *dfp, ppc_vsr_t *src)
 {
-    dfp->VsrD(0) = src->VsrD(1);
+    dfp[0].VsrD(0) = src->VsrD(1);
+    dfp[0].VsrD(1) = 0ULL;
 }
 
 static void set_dfp128(ppc_fprp_t *dfp, ppc_vsr_t *src)
 {
     dfp[0].VsrD(0) = src->VsrD(0);
     dfp[1].VsrD(0) = src->VsrD(1);
+    dfp[0].VsrD(1) = 0ULL;
+    dfp[1].VsrD(1) = 0ULL;
 }
 
 static void set_dfp128_to_avr(ppc_avr_t *dst, ppc_vsr_t *src)
-- 
2.37.3



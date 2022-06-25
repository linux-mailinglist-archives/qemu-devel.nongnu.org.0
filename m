Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95B55AB47
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 17:25:02 +0200 (CEST)
Received: from localhost ([::1]:55376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o57ef-0002fj-IU
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 11:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=GKyN=XA=zx2c4.com=Jason@kernel.org>)
 id 1o57dL-0001uo-6A
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 11:23:39 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:46360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=GKyN=XA=zx2c4.com=Jason@kernel.org>)
 id 1o57dJ-0005NY-2i
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 11:23:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7EF7FB80B79;
 Sat, 25 Jun 2022 15:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6318C3411C;
 Sat, 25 Jun 2022 15:23:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SKoDA45b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656170603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+KQ9fTqikCtoWxlozsIdrEYs8tjWGyatqOB0/AN3C4g=;
 b=SKoDA45bvvsD2PKqaInLyp4M/7kyK0Un4MQ58AswNkXQoJ2D+5UMU2mWhlCKm2WlPaTMdQ
 1fmc/Fa/usg5a4Q+EGGxJGtmZ/g3B3yEy9pj6hkdF2UQHKS6CjgcOBCnZObrprYy+9RFUz
 cjk5++dfzvnHfS1ZdnbSkXXdl2Dh7So=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1539f70
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 25 Jun 2022 15:23:23 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] m68k: use correct variable name in boot info string macro
Date: Sat, 25 Jun 2022 17:23:18 +0200
Message-Id: <20220625152318.120849-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=GKyN=XA=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Every time this macro is used, the caller is passing in
"parameters_base", so this bug wasn't spotted. But the actual macro
variable name is "base", so use that instead.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/bootinfo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index adbf0c5521..ff4e155a3c 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -54,6 +54,6 @@
             stb_phys(as, base++, string[i]); \
         } \
         stb_phys(as, base++, 0); \
-        base = (parameters_base + 1) & ~1; \
+        base = (base + 1) & ~1; \
     } while (0)
 #endif
-- 
2.35.1



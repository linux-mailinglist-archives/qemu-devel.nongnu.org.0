Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E387655006
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 15:15:27 +0200 (CEST)
Received: from localhost ([::1]:60084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hflIF-0006DY-35
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 09:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hflAQ-0001D2-SJ
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hflAN-0007ld-4E
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:07:20 -0400
Received: from telepax.uni-paderborn.de ([131.234.189.14]:50786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hflAJ-0007g5-C6
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W8OiDWXvhhBXnBnezRJGstX02qXPlNoorrxhyjQkvts=; b=LggFfnaJVroXNDyfu93FVG06eL
 tLzyx5dPyoRUTsCf2rRvmXNvZAlE9FeeDM//qDeNjPjV5HlY+DT04g2z0rbxkNCwoE5C6nlxgElsJ
 q/JAgq0Igjaa3AX9XAzmV1M1nzQjtJFqQQXcwZUmc87eAj5VVIh28eeziKL4jHm3UhZA=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 15:06:57 +0200
Message-Id: <20190625130658.24895-5-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190625130658.24895-1-kbastian@mail.uni-paderborn.de>
References: <20190625130658.24895-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.25.125716, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.4.5630002
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.14
Subject: [Qemu-devel] [PULL 4/5] tricore: sync ctx.hflags with tb->flags
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
Cc: peter.maydell@linaro.org, Lars Biermanski <lars.biermanski@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 David Brenken <david.brenken@efs-auto.de>,
 Robert Rasche <robert.rasche@efs-auto.de>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Hofstetter <georg.hofstetter@efs-auto.de>

Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
Signed-off-by: David Brenken <david.brenken@efs-auto.de>
Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20190624070339.4408-5-david.brenken@efs-auto.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 5d4febf1c0..c79566e56a 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8810,6 +8810,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     ctx.singlestep_enabled = cs->singlestep_enabled;
     ctx.bstate = BS_NONE;
     ctx.mem_idx = cpu_mmu_index(env, false);
+    ctx.hflags = (uint32_t)tb->flags;
 
     tcg_clear_temp_count();
     gen_tb_start(tb);
-- 
2.22.0



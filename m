Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE2420897
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:43:55 +0200 (CEST)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKVm-0006oS-3w
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKE8-0000Xs-Mq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKE6-0008RV-Vp
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id k7so29464459wrd.13
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sqw8p32cW3R+2rJlmWJBHYMa4eW/M+yP4K1wn7vUPXI=;
 b=osZ9v5jSi/9buePdW7pT/+MOnP92wzaAs/8QecX+9H8O86a0PugZxckNzdZTxOQGsJ
 9OAbe0t8siI/qMoJzWKZoBjCkyCHRSolRfgw8Fka8aB0pBWX+JA0NbsTZ/UYHfFq2e1m
 Ljpri306TJS/eyI9qZ3fGkuwh7kmxzJUZIk/Uy0cuGkcslJsgo3iasG3YG29+yFaVwYq
 Gndxbj66U1nU2JCMozACTMt9KwD1qGRr94xrSPGCheUFbieT6Bcx4RXhk1WVr4IyDwEo
 KkoXmGOTHWP6xX3b+BQBSHGIQj5YSW+5VBcqw6C8Bi9CSP6aTMzQU1/heDuXSbYdCVM1
 hkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sqw8p32cW3R+2rJlmWJBHYMa4eW/M+yP4K1wn7vUPXI=;
 b=cY6QTLbDobV2jDYFWpnvh2dG7yboF9K3wJVrGgVfn63VIKkyky1iv17vCuBpFFJBuc
 LDRnOi+rvCroi3syUJmm/JkiJ4AIApF8/01PzLt7NWGAfZqC1ilcNlTJBrKiKbiUcwwV
 ULaOpEnMcKV2lQi40JPAGxpPSCTH8iPfa4T5RhMHoBb+PrrdwxU/sThJ9sNu62APu36S
 bVCZG8+NwzjaZJhCJUDTpWfksf/QEoJ4CzWwGpYFXH2FEa4aDW0mjpcvNLvANxtgjubV
 YorYDWRXBWYrlCRuuaR2pNUmgfBODbWFriS3fvBzm5lprn9ikQhrvPG7aOCCxuLddghW
 sYww==
X-Gm-Message-State: AOAM533Kvnmog9EkFNsy2yzxz2Vii+zN+KGc5rG8FNO84gNFE7xFPn4O
 yrw5vgBwOXXj/Gigi3owyrZ8fEUzH9w=
X-Google-Smtp-Source: ABdhPJwJBrBlaSR33iNkkDEffuneFiPoQoqtsUQ2BW/O0XQ9nzeqO/sKe6AvY2csFHI/Xgy8s12xDQ==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr12948479wrw.226.1633339537438; 
 Mon, 04 Oct 2021 02:25:37 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x17sm13891670wrc.51.2021.10.04.02.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:25:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] MAINTAINERS: Agree to maintain nanoMIPS TCG frontend
Date: Mon,  4 Oct 2021 11:25:15 +0200
Message-Id: <20211004092515.3819836-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004092515.3819836-1-f4bug@amsat.org>
References: <20211004092515.3819836-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of this commit, the nanoMIPS toolchains haven't been merged
in mainstream projects. However MediaTek provides a toolchain:
https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01

Since I now have spent more time with the ISA, I agree to maintain
it along with the other MIPS ISA.

For historical notes, see commit a60442eb8 ("Deprecate nanoMIPS ISA").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1d7279a0f2..8ce47417eff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -237,14 +237,10 @@ R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
 F: disas/mips.c
+X: disas/nanomips.*
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
-MIPS TCG CPUs (nanoMIPS ISA)
-S: Orphan
-F: disas/nanomips.*
-F: target/mips/tcg/*nanomips*
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
-- 
2.31.1



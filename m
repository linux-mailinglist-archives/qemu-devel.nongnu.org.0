Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5E4208BF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:51:12 +0200 (CEST)
Received: from localhost ([::1]:38766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKcp-00065s-63
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKDz-0000UE-Ep
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKDy-0008CH-0x
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id t2so6053010wrb.8
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vTL86efr1hMJs4/XIoLAggzEpcTy0uhJOmacIeRKogE=;
 b=ACNBm9xIMGvkihIU+/9Pt3T8SMCJzI7Vue/aE4/CGjjSXbnrjZmp8+z4OkK9r7o4r8
 A0eAfMdZSICxOiHjqVlSIxbqn4sIxRMQhGARD43HIlpxJFzsmUyjz7CeWtzXQE6vT7cV
 DJvG6CPZjy7fcTYPUlJtXdfpexda147Qyp8owfnXbw1VHhqQt/5aGebcJZNJ+poh4Q7Z
 BF4mNg6pI7W0nhEXCBbvPkasFyZPLCFacjDdKJ4W2/692E49+LPrr4Pnbra2OtLRtdd1
 +HFtInAncOrdXhtwe1f8OqZgXN4seIdprcpnykBt4DTaeLddNJaG1mJBQDSM8zsEgjID
 +dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vTL86efr1hMJs4/XIoLAggzEpcTy0uhJOmacIeRKogE=;
 b=eaVK0PgtOSpZgX5PMpHBphzGINBKLorDJi/vpQRu3XnjvnWUCjkCpN4ZuWHjD861k+
 byqhJc5p22ulrEF1eI8gJ5cUDDusA+SoJqpJaORQkNXCq+4bZzX3OYihDWKt+d/UlKKs
 lGCMQ41rUbXgWrvIXgKGAj2/JnJnUOENva+Im9c5klLy4IfwDASX4wZFZwC/LoJvlh9W
 g/zJ0BS1eR3hunt23xKaN3UzBf6w606Op4aPlUnP9azX2M2xLyiBXLCdUIn2VTCoXWyQ
 zkhiLB8eJfWDFM2qiEowU55uT+9++7u7BRLkYOXZNmMg2Q/3wksTV2tmE5TacDpTmndN
 OmYA==
X-Gm-Message-State: AOAM531kwoV/o5+szWl5RYwSFrgMyZPYjULPvhYrpZuMKJq4/PeJTDf+
 qnHoRnyTcYkc4mAeZsq+qen08DlSotY=
X-Google-Smtp-Source: ABdhPJxu2JbksiX6XRpSSHn5BQqQirciuIN3T3wokfA+2nJjnOKYiHBjigI/LBO7nA4rq2NL4dSjTA==
X-Received: by 2002:adf:f247:: with SMTP id b7mr12483983wrp.283.1633339527411; 
 Mon, 04 Oct 2021 02:25:27 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o8sm7151939wme.38.2021.10.04.02.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:25:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware
Date: Mon,  4 Oct 2021 11:25:13 +0200
Message-Id: <20211004092515.3819836-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004092515.3819836-1-f4bug@amsat.org>
References: <20211004092515.3819836-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

MIPS CPS and GIC models are unrelated to the TCG frontend.
Move them as new sections under the 'Devices' group.

Cc: Paul Burton <paulburton@kernel.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfee52a3046..a5268ad0651 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,14 +239,8 @@ F: target/mips/
 F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
-F: hw/intc/mips_gic.c
 F: hw/mips/
-F: hw/misc/mips_*
-F: hw/timer/mips_gictimer.c
-F: include/hw/intc/mips_gic.h
 F: include/hw/mips/
-F: include/hw/misc/mips_*
-F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
@@ -2271,6 +2265,22 @@ S: Odd Fixes
 F: hw/intc/openpic.c
 F: include/hw/ppc/openpic.h
 
+MIPS CPS
+M: Paul Burton <paulburton@kernel.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: hw/misc/mips_*
+F: include/hw/misc/mips_*
+
+MIPS GIC
+M: Paul Burton <paulburton@kernel.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: hw/intc/mips_gic.c
+F: hw/timer/mips_gictimer.c
+F: include/hw/intc/mips_gic.h
+F: include/hw/timer/mips_gictimer.h
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.31.1



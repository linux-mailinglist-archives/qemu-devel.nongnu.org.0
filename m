Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F732D082D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:47:35 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3kc-0002o5-47
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dQ-0005A6-JT
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:08 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dM-0007Qk-AH
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:05 -0500
Received: by mail-wr1-x441.google.com with SMTP id y17so1608302wrr.10
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DEaTvj3VcNVgO4De83R7lmbSE3LG2HSypVjtVT7iMo8=;
 b=mt0wPXSaue0XcM4NwtYAtuHUaaMWvyXCJ9I38kK0npE2Urhbpu7ArEUijYEMpLXq87
 9/skJR5oZDZbsF55iCgxIUUB+WnXRSJil0LQ72VcLroRWzoVf7t8621ItqDdCvsCvDNn
 CPeRNjP1w8gxvjJrq5yz13E+7nQKxEJudCV5Q6makxw9SVMUeIcZT7iq3+Ke1ICoWvdW
 gYSWUur6AP610nzZa54XyAt/hWSdCyNAWOt9iGlOZqjqX3Fgfh4q/+FngKPFupbL/eef
 nObIJFG2MMzRgpO5Jzda3jbCcHx+J8dHkx3sDPMt0V6amiFX2lcOrm6rFQ1yYl7CLqKx
 DkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DEaTvj3VcNVgO4De83R7lmbSE3LG2HSypVjtVT7iMo8=;
 b=eXyBG9GYnqg+XIpMzGQXYHRsM96AP+r453WJZvFRyx3DdSk2YNoN63mcqf/o7+jPIL
 JqT651IsRws8ntZIZFbOaTqk/Ao9A4nXnGQ7edIHnzYJ6bNQvgKzHICEwS3Jxnucda6M
 pOPr1Fgv1t95+MO4n3OnxyrLwYiES7At4u/9RSrWYK0Zfa28wPY6OdaRpAhgMpqXFmlc
 oYAhuD3KULkoPi0UcBsjMCacWrY6h9N3Vnf3+iz6o7vVIiPkJMEV+4FvLGV4wTK/vgN/
 TI/40bueLbrl4wUnGCaBOkQdVPvP4e6ELjgNl0Ggx8hY0iQr9uWaCQ47V2wY4fXvg5XF
 BGcw==
X-Gm-Message-State: AOAM53211ElznQKopiGeZ2L5KlhTzieyd6b64av7cVAOWA7UwOYgPZb1
 Z+FGk/P28HUUOcHXgR582ry3BNL8nVU=
X-Google-Smtp-Source: ABdhPJwA7CyhC0yC4B3t0LydZBABnTbwqeTRjimAiaidZNwnn2wU7OPS3BL/6Y/lQ7edj6etF4Gu4Q==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr16447548wrv.285.1607298002625; 
 Sun, 06 Dec 2020 15:40:02 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n126sm12302988wmn.21.2020.12.06.15.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/19] target/mips: Remove unused headers from translate.c
Date: Mon,  7 Dec 2020 00:39:32 +0100
Message-Id: <20201206233949.3783184-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 87dc38c0683..346635370c4 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24,8 +24,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
-#include "disas/disas.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21506212B64
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:41:19 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3D4-0006vV-48
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AI-0003pT-H5; Thu, 02 Jul 2020 13:38:27 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AF-00075m-Ec; Thu, 02 Jul 2020 13:38:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e22so24820942edq.8;
 Thu, 02 Jul 2020 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YBfnM+q5yg3eJUDbnFRtNTO7sPPipwkfjylWcljCLs=;
 b=AJV/y7cjKqOnfafA/QgbQZv0bRoQlP64KHdjoFil1PL+orwscBlzMssawH7gtRpLK8
 HShAYA5rYm4QyGYdse53V3iY6nv2XXvEBQjwtqJnCOwTuLnApfJExYrEXwfZH9mnyDxC
 C4xj05ijL1e3fd6D9kb9N26W6xcc2crWnBWNjQVKRjL0BYrfI1PaRJr4A47rwz10YhzB
 OBvY/9P1TnMPiXySZFz0mym6Y0z/Q35Pk3RPN+Ia5Mq8c+r8cuAAMG7+BJ6yseN19KDN
 XXx0AKEXyE65y+rSbJng1yXJnhCzk9zDHFLZT3UgiHZAmGERbKk/fkVug40HvniMuhG5
 XGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/YBfnM+q5yg3eJUDbnFRtNTO7sPPipwkfjylWcljCLs=;
 b=berzzdbz79cFYDXtp2bFBqYE/hzWHra6Ql5tquWTgZiET0CX1Bsk2pz0QeCx0r3FH/
 wrCQujVQoiE4kQatf8pCtsOHCSYPx83vNPZWFXLWLahG1kPIdXyIeCEWuuzyWVrAmQWQ
 znYpxDMqjjKqjh2h+wiLpnTuiMqFCLP/5IBYAIctBFArXe5rOyhtdeJVyoC5n1vFFQoQ
 DzEm4zN1w+9yBP6+M6JbPOkNWUV6QDDgssTgQBsIrYklaZCrczJziNGXQqsZ/xiTC17n
 ZrCjHj4OtJ2QPdh2hk3Yve2KMzdLunUKgStiGqibBL2dagWa/OCl3MklKwbhfhlZdPR4
 EORw==
X-Gm-Message-State: AOAM530Hdg+Kz3ptPmpMDmhbJLp2f5qt7xjCVtHYLWDwSgO+9Z1BPGr+
 JQxXiwSmCXiZsyTrDOtoV1a0AwEtfMI=
X-Google-Smtp-Source: ABdhPJycV5lbcI/X/2qt1Cyrq0OCBLZN6W5bwrEKspbSukQzxktH3YpTDL2ywY09vTC1izais4FpMw==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id
 cy15mr36153680edb.308.1593711501349; 
 Thu, 02 Jul 2020 10:38:21 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w20sm5710344eds.21.2020.07.02.10.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:38:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/19] .mailmap: Update Alexander Graf email address
Date: Thu,  2 Jul 2020 19:38:00 +0200
Message-Id: <20200702173818.14651-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702173818.14651-1-f4bug@amsat.org>
References: <20200702173818.14651-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update Alexander Graf email address to avoid emails bouncing.

Suggested-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 926cac6bb8..e46e6c7302 100644
--- a/.mailmap
+++ b/.mailmap
@@ -44,6 +44,7 @@ Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@imgte
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
+Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
-- 
2.21.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A16FEB32
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 07:31:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwysb-0002YF-6L; Thu, 11 May 2023 01:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sledgeh4w@gmail.com>)
 id 1pww4F-0005OX-VV
 for qemu-devel@nongnu.org; Wed, 10 May 2023 22:30:08 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sledgeh4w@gmail.com>)
 id 1pww4E-0008M8-BN
 for qemu-devel@nongnu.org; Wed, 10 May 2023 22:30:07 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-530638a60e1so1016126a12.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 19:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683772204; x=1686364204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lZs6b6KSMcCgi8eergfaluqwQPHOsarCQ6MoyCcr3RM=;
 b=LOox9Xk5VTmOdugMw5CeDm49ZfSI4ML1mZjFFgY/6Xi/iDVPQNEjkOsAmm0vxbidv2
 REZmoBt2hRi3+dnLFTQiIEnAH/EcjZteLQA3gnivxaYDrxk6nW+gC2RPYQyPkuUP7/Lg
 36p1cXhefEWR9WMkTIPijuseLRBm2Xj58FU/Ed338y37B8RNWUBZSyGWB3iZHaFyUzUD
 QPjtNxFv4n+fD4GhiPpGrR75sas4LKslFtmEGOYdwECWfySxlWfJLm+JWQwl/U5sOUYh
 CyESID7TYwH7KwaaCQUpVj0BDuX4GqrTXQ4j3NbZEa6SOKGdTI2A5VXBEFyJuh63J3bs
 zOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683772204; x=1686364204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZs6b6KSMcCgi8eergfaluqwQPHOsarCQ6MoyCcr3RM=;
 b=G7ITI80VTk8sgwL0SgxXIULbfALWJJgmSE79kIjypj/JGoH0w5z96HcXvMrH+ig2to
 ApE0pHsnG4HUy1OPlbg45aWvMLtHd4x19zbULkH7q3lNNtQOM4J1YsCkDAmniqAOlnNW
 6gC6aHz+bJV3Gjz5e+OEApv+LKRJWJQ/VnTWwvwOKF4mCMXqttcin9UaVHt6h6VloLji
 tdlYO2PmJzSgsabiSKx6FpTOPFpkYzIlSx1GfplYsARSBgtBplBUIlS2uxW5brsQbup4
 VA4kPrWCjM0uH1lR0g3CH36jG9y55hJaP8U2RmG1Pf2zDsxmO+6a6xuu8KVjmkn5nm67
 iZ7g==
X-Gm-Message-State: AC+VfDxeLUhW43362HglF9LOEwH8rZqEMo+uQB8JDXOMtfj2lQPhohWF
 shP3/o/rK23KOHW4nDSk5lg+z/kA5S6TPNmfn1w=
X-Google-Smtp-Source: ACHHUZ5eR02uzEnDsdsUxz4YnseV1XaNDHnFQg+aMg91aGMzOQjZhRqjujfldAnOAsEPr4NbZLhMoA==
X-Received: by 2002:a17:902:dac7:b0:1ac:9103:45aa with SMTP id
 q7-20020a170902dac700b001ac910345aamr12098895plx.49.1683772204318; 
 Wed, 10 May 2023 19:30:04 -0700 (PDT)
Received: from localhost.localdomain ([115.233.220.140])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a170902d70b00b001ac452bbe2asm4511696ply.199.2023.05.10.19.30.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 May 2023 19:30:03 -0700 (PDT)
From: Sh4w <sledgeh4w@gmail.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org,
 Sh4w <sledgeh4w@gmail.com>
Subject: [PATCH] docs/about/emulation: fix typo
Date: Thu, 11 May 2023 10:29:05 +0800
Message-Id: <20230511022905.98241-1-sledgeh4w@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=sledgeh4w@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 May 2023 01:30:08 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Duplicated word "are".

Signed-off-by: Sh4w <sledgeh4w@gmail.com>
---
 docs/about/emulation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index b510a54418..0ad0b86f0d 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -99,7 +99,7 @@ depending on the guest architecture.
     - Yes
     - A configurable 32 bit soft core now owned by Cadence
 
-A number of features are are only available when running under
+A number of features are only available when running under
 emulation including :ref:`Record/Replay<replay>` and :ref:`TCG Plugins`.
 
 .. _Semihosting:
-- 
2.32.0 (Apple Git-132)



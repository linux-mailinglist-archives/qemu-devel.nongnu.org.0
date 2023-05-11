Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3956FED64
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:02:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1FC-0004ek-Jv; Thu, 11 May 2023 04:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sledgeh4w@gmail.com>)
 id 1px1F0-0004e0-LC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:01:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sledgeh4w@gmail.com>)
 id 1px1Ey-0000aG-Qi
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:01:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-24e14a24c9dso5981221a91.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683792090; x=1686384090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MjJnkjnRj2Gof6ijodpWYB4G+3OKbQbE/fVC4qb6Hpc=;
 b=URX+57AQ4WfyCZvkypewjiVe/LoyY5+dqzK36JLTP3a4obkseO5UA+x3yYRCXrV9i1
 0GH8NqM70ujFlGCNQT1Eb6r4twIWAqQwiIweGyzXogfmpPm14kIdUViGifnmCfPXQuNK
 ng1OpSeQny9ss5L1NQwLihMBr7IjJ+kOF49v7zcnn/rqkYyDYd9DYxx9nDBVbcJ3OLRq
 0tLvE7pcSPi5aIHdklwhxgxQn8WtWmDxUnVhOXdlun7Bu8gzAjHGHgiAXoIBhMb5853c
 t18K9GUl/yD8MwK7+hpNrOG9gv7+A+d5rkHP2+JfjGTGyebCYhZy8ssYNy0JX5TZQQVN
 IL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792090; x=1686384090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjJnkjnRj2Gof6ijodpWYB4G+3OKbQbE/fVC4qb6Hpc=;
 b=CQVY0fPmeRcp3hv95IK+9C3ZmANNfzC6dLIuQwZNA97z22XzWjE2zA4SyhSlOsZ8Lc
 7clEH1aP/EAQ70vERSLPtsFcq/Rgz9Kwwb2xWwD0eYcTzs6ijjwS9nKGyzKcW5ZXaSO+
 VZtO0w8Pnd1xvjo8ToX8vA9zLL5/JZRI28xbTJnz3sHnQh4c6xdAvlc8PBXZRQabJlUf
 DBFR0yRgsYvLGwM39iFnpplJSXpzbgNtGCoXy8AzCMpt7BtieWPB/QGwHWmndj6gzgG3
 rS1gEtet3FHfJh5O1dA/qwJe5Kp2n3Y7cyr0kZvK2C7kO2lzeLaSWwcQoZJtqbpUoB+n
 5uqQ==
X-Gm-Message-State: AC+VfDwI+L/Y/Nm5auQHwl6LVmZJdEKe3vy7+gfs10SbpUWwMUDY6WBK
 xIGIQcV0xnjPP0B/iPVMEwnqcHZpseF1TBrz
X-Google-Smtp-Source: ACHHUZ7ICqxjT8IyGkgjFz6ThpOr+24scfG368u8qNfHPP55mFrSlDphvqQzzkPVlonfeWseHfklsQ==
X-Received: by 2002:a17:90a:7801:b0:24e:16aa:48 with SMTP id
 w1-20020a17090a780100b0024e16aa0048mr20089196pjk.15.1683792089750; 
 Thu, 11 May 2023 01:01:29 -0700 (PDT)
Received: from localhost.localdomain ([115.233.220.140])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a631901000000b0051b7d83ff22sm4380787pgl.80.2023.05.11.01.01.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 May 2023 01:01:29 -0700 (PDT)
From: Lizhi Yang <sledgeh4w@gmail.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, thuth@redhat.com,
 Lizhi Yang <sledgeh4w@gmail.com>
Subject: [PATCH v2] docs/about/emulation: fix typo
Date: Thu, 11 May 2023 16:01:19 +0800
Message-Id: <20230511080119.99018-1-sledgeh4w@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sledgeh4w@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Duplicated word "are".

Signed-off-by: Lizhi Yang <sledgeh4w@gmail.com>
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



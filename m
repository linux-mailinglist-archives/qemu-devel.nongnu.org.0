Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF52A39B9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 02:27:40 +0100 (CET)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZl6p-0007WS-V2
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 20:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3H6-gXwsKCgQlwomrriqsirksskpi.gsquiqy-hiziprsrkry.svk@flex--hskinnemoen.bounces.google.com>)
 id 1kZkuu-000843-LL
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 20:15:21 -0500
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:46637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3H6-gXwsKCgQlwomrriqsirksskpi.gsquiqy-hiziprsrkry.svk@flex--hskinnemoen.bounces.google.com>)
 id 1kZkuo-0005m4-WD
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 20:15:20 -0500
Received: by mail-qv1-xf49.google.com with SMTP id s9so6780802qvt.13
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 17:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=ycYciR5K+P3VjbKI2G6b346ExygldG2CPllhZ0dgAr8=;
 b=F3pktjMmfYXQT5zRCT+hrE1y5cWOQZ2Z29Lrj6r59PCX5TsodzC/txAIsk8LlK35XJ
 4dsxmcktrQSoi9nU83EQzxkg/k8+LMRNX0crk1ngRXP9/9c6N6oPzuQuHK/uVA3eaikX
 SvniQPrH0Aa6+Qju1/pnnqdgjbSeDH4DMlfE7G7Wsi8S3dBtL3PSeZLpask4VAxq78nI
 kbqxxaab46G7ac3fCYTX/1zlPHxx+F5C1FnlF8agoIx82IBfB4Y6XoUZdbJ3FSU+qmYE
 EjI9aJVSEWKLfumtP312xXbUoxfni5djsdjybdCmZJQcV0/lsCyy8sC5Je099h6fJAQM
 irJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=ycYciR5K+P3VjbKI2G6b346ExygldG2CPllhZ0dgAr8=;
 b=o6PqV6W8QMDhQkXx3BViTX7FQbaN5GR74yymlJldI8+HxhkMHMzH/4QLInFHeFEsQT
 WoqlfgwsR7sYlZ4lqPOp0NEFPgApstziaT2i4XjzyntI9zcCIPkqPKP7Cx5geyQRtAWs
 EVTOmv4UwgWK3Z1iyqPI7aH4VyvzvAUzKqrfCD8LmFptxAbBK0i+bJm6AnurYXiHgWK4
 6mH2Cz0UkAq7lodtqVK1XwBPwBvBOimhS4TgmexF8gDNmGWBMyRV5Al4QUM27In62yO1
 cVj+wka3OykIB7vMSaCZAZrW7P27v3lE+bHfb+AbYmdM56GrFI8d1PwNQiw7zVLQ8QQ1
 Pbhg==
X-Gm-Message-State: AOAM530NPXXreiduA0FikhLuEWcGvOKRUq2ARt/TjJCPpTun74gi18jR
 PNBzSfVLQ0is3ymOdEyxFlRbrcTo0RLYVp+X1Q==
X-Google-Smtp-Source: ABdhPJzRKuP7UeshsmDbLXs2wmfEy6u85un6m2j8GuPYk9aaciY2PTnHxgEs7+k/8ExtfzxgxGrpswzCdYqgJWcfmw==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a0c:b525:: with SMTP id
 d37mr25079076qve.31.1604366111190; Mon, 02 Nov 2020 17:15:11 -0800 (PST)
Date: Mon,  2 Nov 2020 17:14:54 -0800
Message-Id: <20201103011457.2959989-1-hskinnemoen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH 0/3] tests/qtest: npcm7xx test fixes
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3H6-gXwsKCgQlwomrriqsirksskpi.gsquiqy-hiziprsrkry.svk@flex--hskinnemoen.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

This series contains a fix for the randomness calculation in npcm7xx_rng-test.
It also makes test failures fatal. The last patch would have dumped the random
data to stderr if the randomness test fails, except now that failures are
fatal, it never actually gets a chance to do that.

It may not make sense to apply all three, but I'd definitely take (1), and I'll
leave it up to you whether to apply (2), (3) or both.

Havard Skinnemoen (3):
  tests/qtest/npcm7xx_rng-test: count runs properly
  tests/qtest/npcm7xx: Don't call g_test_set_nonfatal_assertions
  tests/qtest/npcm7xx_rng-test: dump random data on failure

 tests/qtest/npcm7xx_gpio-test.c           |  1 -
 tests/qtest/npcm7xx_rng-test.c            | 15 +++++++++++++--
 tests/qtest/npcm7xx_timer-test.c          |  1 -
 tests/qtest/npcm7xx_watchdog_timer-test.c |  1 -
 4 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.29.1.341.ge80a0c044ae-goog



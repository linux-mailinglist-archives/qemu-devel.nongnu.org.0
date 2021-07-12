Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3C3C601A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:05:53 +0200 (CEST)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yRM-0000KD-IH
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yL4-0000Kc-FW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:59:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yL2-00073Z-VB
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:59:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id b12so6526499plh.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=12zIOb/Uugd1rcj+crbf+ro+UDiWl+wI2TjN8f63REs=;
 b=b/De0igEJNJbm9y+vAoJvzRWRuBwkM3y6zXA2RuWadfit+z01S7GAdu+uYiPd0NmwI
 OstlaQJ2fhZQVXlcyaTCfoQUBROJ1qqtiHrHUD4UIQfpbf0O3TY+PgtX8Xvaxom5lHk3
 q7u+G+E7LLz2mlwXWio/QpB6NtK1/FLnvH7yn6pI5ZUUqtzc9+HcfHYMo3Ti8BtaJoSx
 wvNMsPoI7rnXND66if3MKkq2/+5iQMNicMrAyG01eSCxVU6iq2dxdvEhDKwNPDycg7C2
 9kEYS8ZqAQM4cswAOlqBr69BC/LaRQG7ErtMtsCKoS1Mu1qZTCK2WBBxwtEJdWhk9VZ/
 f/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=12zIOb/Uugd1rcj+crbf+ro+UDiWl+wI2TjN8f63REs=;
 b=h8TlCjqOXZ/TJWbr+iOv+ZVxuR6A6ytAUNwj8YwHDGN4bcg+Ulsvcu8Hi4YWvamCdf
 OM3okZsp22We9EudMPl/CfXgGpiTlQYOIO26N0Rh6AuwocP1zFaVispqYGvGaoSwrplU
 RQHPD5ZyEaXNtsM6H80YYcK54Rre2Y5i658VqEJV7IOUksQkTYrh3dC10PftQLpMH1JE
 g5kWKMYply0d53R7X5r3D2q6d2RoP9Q6BTTh5q4BNS77SY/grRroCbCb1PqyDMe+2tvk
 LhsvCMpIZcebUmARD/IGJpKJX0/fFUu4P0AqSgKqtIo73H8l9gCLvUiJ+RogADbg2vXX
 D16Q==
X-Gm-Message-State: AOAM533Fe8RbH7qOWVEBNp5hPqxfvq/VgAH3S/ZQEYzYLFaHBUlumfYo
 OzQjTSpK4QkXo7g+/rffSavT28qbUn8OmA==
X-Google-Smtp-Source: ABdhPJywvI80QO8o5LW+XX5H0VdlKzg1/0vzt5/zBOUft+uQTPS6QtqdpcTGQNotvk7dAhPzzHwTwQ==
X-Received: by 2002:a17:90a:bc83:: with SMTP id
 x3mr17906617pjr.17.1626105559408; 
 Mon, 12 Jul 2021 08:59:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j16sm16745021pfi.165.2021.07.12.08.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:59:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Atomic cleanup + clang-12 build fix
Date: Mon, 12 Jul 2021 08:59:15 -0700
Message-Id: <20210712155918.1422519-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first two patches are not strictly required, but they
were useful in tracking down the root problem here.

I understand the logic behind the clang-12 warning, but I think
it's a clear mistake that it should be enabled by default for a
target where alignment is not enforced by default.

I found over a dozen places where we would have to manually add
QEMU_ALIGNED(8) to uint64_t declarations in order to suppress
all of the instances.  IMO there's no point fighting this.


r~


Richard Henderson (3):
  qemu/atomic: Remove pre-C11 atomic fallbacks
  qemu/atomic: Use macros for CONFIG_ATOMIC64
  configure: Conditionally disable clang-12 -Watomic-alignment

 configure             |  23 +++--
 include/qemu/atomic.h | 229 +++---------------------------------------
 2 files changed, 31 insertions(+), 221 deletions(-)

-- 
2.25.1



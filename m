Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A14306C62
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:47:10 +0100 (CET)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zD2-0006U2-KW
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBe-0004pO-Qe
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:44 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:36153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBc-00074Z-74
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:42 -0500
Received: by mail-oi1-x22e.google.com with SMTP id d18so4777311oic.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9oIDhyRx3QYDZ5oE61Hw8gBEFHY09qDJelXq8Ud5avA=;
 b=tGP6sQI00eP3qk5iCCBoERudP4aSjpT18gK7QAisxmzhooXHnww5iYmdV7icwfq8nb
 WoyqAvuJKvDVXQ7Y76L41xZiXGC274SM3fHI/ERTv/R5VNes8JOlfdTc3/VhHlsBWMiL
 TcIJ3IpSSBfwE5kfhncChKEgGMmWA0FT9e07wKwbk3cFSr6bpop3hGPwUHTZ5+fLFI0S
 MByHX28gTpPvzt1hM+M3ZKuL8z0NIiH5+XsSIiiMa6uMSFayVJh1whOGKP9jfJUiw+Fk
 4QP0uJ7bzpiX0JN5syR4Q3NXs6GYTsRbE+cfLNtp4HYdND0IXyLdO3R2robl2/wDNTCO
 mb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9oIDhyRx3QYDZ5oE61Hw8gBEFHY09qDJelXq8Ud5avA=;
 b=OPzxAmfjZ2V3rw9OxAxsYXcnvrsKISunkSev07FlBwzpNCJFWMlQKhQoiusRWIApkY
 zgJkjeAqXUh/C1sV5T2ULspNshW83KDMl48kVLZsuhVgq5P37nkCNK8eMWLcsJbFwUo2
 /S1sqb32KP6Jvyr88zACJrE8KcXUHsAMpnEl+kYzo+KX/oh25dpwnvW5inzlBMA76T81
 8YdrpSidtFHszG4XX0YizZherAwSl9X3EKAc8ZltDs6Svk8KcT2BoOlDSGZnv8zF5R2c
 /cKwIt1gGMMD10vUFaKuZUbhXKuRNb6caSkc1Y2nUiebQCyp2gkeAaRzc/tejZ72adwO
 Cfqw==
X-Gm-Message-State: AOAM531zYllGr/yTOh53wIzAeyQRs+WA5r8OHLWatuCISvNzH6HuZlHR
 v0c/8DZO5K2eW6IgdwFshH70D8rl2s8290qhQJsoMx4iu0sG0OkLNpkq24ALuCe0YD8OVH6uAXB
 rdTfWmNBij6IxRognouI2VS4cJGPGVZONrc+YKY3QG1RICb4faHfSrRrYAmus0ZilUTRS3wY=
X-Google-Smtp-Source: ABdhPJzpBXeDXNMW0j2c6KjO5jS1VJSrabic8WnIwrGP1FMD2hhXd0p6CtEfW7oeC3hn0ExfRTbAiw==
X-Received: by 2002:aca:57c8:: with SMTP id l191mr5480402oib.23.1611809137184; 
 Wed, 27 Jan 2021 20:45:37 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k198sm887399oih.33.2021.01.27.20.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 20:45:36 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Wed, 27 Jan 2021 21:45:25 -0700
Message-Id: <20210128044529.1403-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
feature for ARMv8.4.

Changes from v2 to v3:

o Fixed PSTATE_SS patch:
  - Reverted the singlestep removal.
  - Fixed saving cpsr into spsr.

o Added DIT to the max 32-bit CPU.

Rebecca Cran (4):
  target/arm: Remove PSTATE_SS from cpsr and move it into env->pstate.
  target/arm: Add support for FEAT_DIT, Data Independent Timing
  target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64
    CPU
  target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 ++++
 target/arm/cpu.h           | 12 ++++++++++
 target/arm/cpu64.c         |  5 ++++
 target/arm/helper-a64.c    |  2 +-
 target/arm/helper.c        | 24 +++++++++++++++++++-
 target/arm/internals.h     |  6 +++++
 target/arm/op_helper.c     |  9 +-------
 target/arm/translate-a64.c | 12 ++++++++++
 8 files changed, 64 insertions(+), 10 deletions(-)

-- 
2.26.2



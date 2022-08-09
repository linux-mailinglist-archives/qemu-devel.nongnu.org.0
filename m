Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0758D223
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 04:52:35 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLFMA-0001Ij-Qz
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 22:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLFKa-0006yr-Aa
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:50:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLFKY-0001rB-HP
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:50:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id x10so10203675plb.3
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcEPuYfzQeBC7V4DOsKPicmVNABeSwSuj/2SODpphSQ=;
 b=m914P8b1GhZZ6RQNcfH22pJfOXSDU1+xQtGbgSNg1fZ1vgdTVoamBlMDsZIy+ONyTd
 EZWkwa4YEl0OfYZSpjF2E8cP0rVyAvAtmBwXzoFGkC1NfndaXBc6HFEpQFmtBlB1R46t
 btef6U3o4eiuCne5u+7z2Qg1jDBAjO7XxncrE+QZOkVOIbOPkkYWi+n0AgaOQec6BLWj
 PDfJ6WFziitaLmA3NE9enmigevDSHnvRBkEZNGTT2AesZUjL0up6s4wofZiZbVnkNDdB
 IX5UlOaBdn84PajNsQO6D188lNP5q+Zpb90Btwbh9ga836+GQuFVkeZEfUpEQOzqsRK+
 pE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcEPuYfzQeBC7V4DOsKPicmVNABeSwSuj/2SODpphSQ=;
 b=HaESqH0c2wkUvf/BZvT1C+mVORX5zlxAGdvzszG3+76E6cFeG99r0ovX948Hx4tYx9
 LVo2i4zDo54zc5/nnjbU3IHG/JMA28SC9gTrjTijfVN3bm9RxeWvNFZU82u/y/DhwSw7
 7Rxh1Qi1Azg8DjdHrEaZD3hDojVLjqpA9OhNys03XCzkyBusSpQePnxzPxYZkdY9N7AQ
 XliyreIkfwJOVwIxRm4SvpFOImh/Lt9r/Yk6d5KJD9q/Gf/oaB3cIKFY/Q4OPjvN9E5W
 JfJwyA2CpXiuQN1GUCBcHItsxmbtpX3HuA/hwviJvvVkyzf/Y/a0lHvTRaLSFxhfXdDB
 3I6w==
X-Gm-Message-State: ACgBeo13w6qHnO+hxooz6UZyFZPxzDh5PiQJbvfKDM9/z8cZF/H7VP6f
 MMm2TUVAHWRZ2xbDH6HENmWMBNoYxJUnKA==
X-Google-Smtp-Source: AA6agR5mZ74A17HrtEiAu62ccRYpGmPmmZ59KRtmsshcgTC2uCcooWGnFHm9qoYAYeR5mCHzuJNpdg==
X-Received: by 2002:a17:902:8343:b0:16d:d2ff:c91d with SMTP id
 z3-20020a170902834300b0016dd2ffc91dmr20906765pln.142.1660013452803; 
 Mon, 08 Aug 2022 19:50:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:8c1b:1e6f:caf3:a217])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0016be834d54asm1298148pll.306.2022.08.08.19.50.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 19:50:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] loongarch patch queue
Date: Mon,  8 Aug 2022 19:50:49 -0700
Message-Id: <20220809025050.781846-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully the last such last minute bug for this new target.


r~


The following changes since commit 7b06148df8a22d984e77e796322aeb5901dc653c:

  Merge tag 'mips-20220809' of https://github.com/philmd/qemu into staging (2022-08-08 17:59:27 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20220808

for you to fetch changes up to 10dcb08b03863221faa41f4f1aa835cdca441b96:

  target/loongarch: Remove cpu_fcsr0 (2022-08-08 19:42:53 -0700)

----------------------------------------------------------------
loongarch: fix emulation of fcsr register

----------------------------------------------------------------
Richard Henderson (1):
      target/loongarch: Remove cpu_fcsr0

 target/loongarch/helper.h                    |  2 +-
 target/loongarch/fpu_helper.c                |  4 ++--
 target/loongarch/translate.c                 |  3 ---
 tests/tcg/loongarch64/test_fcsr.c            | 15 +++++++++++++
 target/loongarch/insn_trans/trans_fmov.c.inc | 33 ++++++++++++++--------------
 tests/tcg/loongarch64/Makefile.target        |  1 +
 6 files changed, 36 insertions(+), 22 deletions(-)
 create mode 100644 tests/tcg/loongarch64/test_fcsr.c


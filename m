Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCEE588541
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 03:05:11 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ2ov-00033g-96
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 21:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJ2jH-00078Q-9H
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 20:59:19 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJ2jE-0008Tp-LF
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 20:59:18 -0400
Received: by mail-pf1-x436.google.com with SMTP id y141so15097209pfb.7
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 17:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d1BSp3px0Ssc3e6jOJNbaegJ9/pGXCcmPnMJ3Qu2T4g=;
 b=BYoL4BtvAm6JCjzPruw55XlnA2Q83ayUShCQ7RwfmpO9C1a7/sdRKOvLAClTrNu0NA
 UcTUKF7caKhw2hM4spZ8YHpjXZATl22O9QHt4D63NxtPyMLBg02vHMlUk/cXH+mINykn
 zuNX1W8Oh82EbsHW0cja0vIfJE49gDivvPHJoV5vPJ93wD3myBDDrCQo4rX9Ja90OXt3
 OlJuvPtJnjBWkOsJATdhxnSeWv7gqUiWp/bWOMWYsXtSZQM9YzDhLo/npfgV7h6N7W3s
 5JSjYzIO1Ch7An4POgH+ASr84G4+2nPJwHVyZn/udWfJ9kCvl+9BQZc03tpMzzYn8BbL
 aC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d1BSp3px0Ssc3e6jOJNbaegJ9/pGXCcmPnMJ3Qu2T4g=;
 b=ljggEnSEunGkAeIKl8ubSrhYN/jJ6oe5pTFeaScBi/4nyZjWGvXwdLzLlhrLlcHn0r
 kkacDLindqHaaUFTuaA9D4Bcjy894lGjPwFFscue1lxijwnB9rRCrGKkWYzh0gXHIYMh
 G+Mll0TT5DunauCWulieaHrR+li8bNPgRdRewAcLIJcSfFlLAmuAwKdunRNA85cjdYoN
 e5fo6t/DprMfBK42tuHs0USNMuYYzhs4bawvaohOog6R1JEne1UPNIIN8jyDD3/6bDKE
 8x2xpUPpw4p+ZnJKw/oMEZXdTi/nrMnJX+4keYHHJyNYqTQNEIabKz1us+YTWya/MbzB
 wJVw==
X-Gm-Message-State: ACgBeo0rp+vLaKYx5xs4SQmOZzYvj0DM8Bc+rju6bPcQ97ef5igakd6p
 HIs3yIwfvXomPeDudekwZ/xmlY7Eae4WQNk+
X-Google-Smtp-Source: AA6agR46Z1EonVcw7+xb5Hr197GPjNegMQRyYs8jtPFtzsrHQtBn+pvRrUMKqe5tfr6iAOMLh6xdYQ==
X-Received: by 2002:a05:6a00:181f:b0:52d:87ef:f9bb with SMTP id
 y31-20020a056a00181f00b0052d87eff9bbmr11491425pfa.70.1659488354768; 
 Tue, 02 Aug 2022 17:59:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:5d51:f79f:db32:93ed])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a17090aa59000b001f303d149casm142698pjq.50.2022.08.02.17.59.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 17:59:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] semihosting patch queue
Date: Tue,  2 Aug 2022 17:59:11 -0700
Message-Id: <20220803005912.1593116-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

The following changes since commit 430a388ef4a6e02e762a9c5f86c539f886a6a61a:

  Merge tag 'pull-migration-20220802c' of https://gitlab.com/dagrh/qemu into staging (2022-08-02 10:03:18 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-semi-20220802

for you to fetch changes up to d44971e725c02e0656d2f53d4fb564f92e06aef7:

  target/mips: Advance pc after semihosting exception (2022-08-02 12:34:00 -0700)

----------------------------------------------------------------
Fix mips semihosting regression.

----------------------------------------------------------------
Richard Henderson (1):
      target/mips: Advance pc after semihosting exception

 target/mips/tcg/translate.h               |  4 ++++
 target/mips/tcg/sysemu/tlb_helper.c       |  1 +
 target/mips/tcg/translate.c               | 10 +++++-----
 target/mips/tcg/micromips_translate.c.inc |  6 +++---
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
 6 files changed, 16 insertions(+), 11 deletions(-)


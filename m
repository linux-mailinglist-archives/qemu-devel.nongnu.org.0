Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2200313151
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:49:15 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l952Y-0001nX-NN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Us-0005C5-6A
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:16 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90UQ-0003xR-0n
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:01 -0500
Received: by mail-il1-x12d.google.com with SMTP id e7so11769559ile.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5LUzWkDUIUkg/m6VHaSnNo3KbO29m90yIlclzvye/w=;
 b=BCvSqUCkxXrh8tpkjl/lsUg4iWjf2rXT3ZCQ3qjnKm1u0XtRDS/zucaUb8weY1UDqA
 ciAIO4L+V/LMZkv9jyjyQPIZD4b7MtqgUzjdBx7JWmpReyHH+9QIKis+wrR5zQ4w795h
 cv/crrlVlVLF9RDW+Mtl4gMN1ESCzdbSSUxNx2wuY8izZqE3GmPWrG0Fz2xVvuhSYELF
 ebauSaxtSc344+FhlqsWB7kwewWE4Dh+ON/gyJdoP7qXuOstR6KqxFAaQ2zl/bTzuKmC
 0/AM/B+uxBMnjHVOjfHuo9X3rq6jMhqAu2T9z6ntjIl8W2EiShqPN7oBm1E463Mu9UHU
 Ip5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5LUzWkDUIUkg/m6VHaSnNo3KbO29m90yIlclzvye/w=;
 b=cfld8EqidTWjZ6wRqlLaa7ipDivEYWwH+NydaJKUMt8iry0JEr02rnxQpzwjrG0mgc
 mnN1Ma3tTcY8208H+gJYtLDFAjOJiFc73Myc84B6HlLUDCQeReki5biGhsRivizvaM5y
 Jvnw0ITHPKj490Rd9PFzNpxX1uTTQGu/3UlbABwsElKVuUkG3JrsHGFoRBFiyt/nJh5s
 GLQaUhKoUZGNHcSfz8k4iM53wmTNiCG6FSKbS3if5hn+ZeOxci2m98/86i7ZrJ9VNEsO
 H1lCI3eCeNUoJ33SBPVNrSQrLhlIaRNXOjgUBB7JkF0/JpgzTYncdsFobImjjyS85kqJ
 poYA==
X-Gm-Message-State: AOAM531W12di34JSr4YMMOh+hJPRiUwj7MYKl9J0JMjYLAUCXXPdlh5q
 fKDFGcWIjkOSMs6xGMM1cgQrPBUfYAcGv55+7kRgRtdGtVhcG+SQEyGnvaDLPOFzWvkhpl63XEE
 4tb6EqWsIm47ZzX5cGZ29pwR1alWX1fo0KdXeuJEjKwI/JNcR6W7NPPIy2GzX6kjmhPC+JO0=
X-Google-Smtp-Source: ABdhPJx2X/nRBxfC5kZyWRbSzesTG6gGTN8Ve/pQqfoFWt+LQH2gW+swEgu8r6exK59Fm2QTD3KWjg==
X-Received: by 2002:a92:8e0c:: with SMTP id c12mr14539652ild.35.1612767423314; 
 Sun, 07 Feb 2021 22:57:03 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id c19sm8335904ile.17.2021.02.07.22.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 22:57:02 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Sun,  7 Feb 2021 23:56:56 -0700
Message-Id: <20210208065700.19454-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Changes from v4 to v5:

o Addressed review feedback.


Rebecca Cran (4):
  target/arm: Add support for FEAT_DIT, Data Independent Timing
  target/arm: Support AA32 DIT by moving PSTATE_SS from cpsr into
    env->pstate
  target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64
    CPU
  target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 ++
 target/arm/cpu.h           | 12 +++++
 target/arm/cpu64.c         |  5 +++
 target/arm/helper-a64.c    | 27 ++++++++++--
 target/arm/helper.c        | 46 +++++++++++++++++---
 target/arm/internals.h     |  6 +++
 target/arm/op_helper.c     |  9 +---
 target/arm/translate-a64.c | 12 +++++
 8 files changed, 103 insertions(+), 18 deletions(-)

-- 
2.26.2



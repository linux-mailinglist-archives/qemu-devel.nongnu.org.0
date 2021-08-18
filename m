Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD273F0CEF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:48:15 +0200 (CEST)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSTu-00032G-3J
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGSEt-0001Wx-5X
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:32:43 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGSEq-0006wj-St
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:32:42 -0400
Received: by mail-lf1-x133.google.com with SMTP id u22so7256543lfq.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yyP9Uo8AYWAYA0i+ZM7gx16XbfLPRnM2u82C81Na/g=;
 b=SEqaA4OnSloFbwa87pDS/TSGWIaRNG00FPm/jAuumqsK0Hn1LMvJuAevE5oRGabD/t
 tlTdVSNY9/mfdZx6QvSzfTy74iqlfo1YqW8xWHiFoJ5Dxby3EuPJycGwCAjuBToQOIAk
 v4/qM41L6XQUskFIV2H96KYWQTlxPqtZWvNFfSyDg0LP94ZQHfLhQNES2KkG8jdSPFlz
 GvputSP2RalEnluoJiLLPN1/SxCOW8Xn1ijPbmpTYYZnlhT1K6Xy9DjIF3tYI+kRY6V6
 4CSAc0bvW5jzJJBJzTrTwJsWDWSfEota47afssBResZitdvPFGsAlzUEI0s+F9HGB0wR
 y0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yyP9Uo8AYWAYA0i+ZM7gx16XbfLPRnM2u82C81Na/g=;
 b=AjmA+x85QIalSGe9AnwZgTitq4CpXhtzuXV7Z/Vm6i/XWnhEiNV0tlcNa6qLYSzhPW
 2VhYaghfZiTurspfiiaNzBy0DQPKfHYwEwsXqURc6sMhBY2FW53x/EVbsTh4WPVJJ1F7
 SLFOHH5PuwP0vnlRrMt2uJkcZz83+yaujFf8waUkG/p4KEHhSXGk03xALoTGG12gkClm
 Vlm6Pe86cabuscZQX73MV5ngxAwEy6ktp/8Prbtfw8987vJlU/qYx8E/GAKCCdxlvVDn
 uOp1/Qf8vQAVXGkFfMmDufNnWaYxwVOOA3pEXVS7xYLCycTFOxSarzi3R78QRSbZjWMh
 kGEA==
X-Gm-Message-State: AOAM5329ALtqJmoKrc8uR/kBU0OwIwbNNSlk5FkvNZSD/OObiDr1qpDs
 6mHsarLgO2f5xFnrwCYqW5wgqmyz7c9yxZiep6w=
X-Google-Smtp-Source: ABdhPJxKpHLejnXy6RYLPRIhvrc+fpUbFPRPT1Pt+CtARYhROHKgM+6p0KTT/iqJrL6J2VTkKjRJoQ==
X-Received: by 2002:a19:f017:: with SMTP id p23mr7633837lfc.547.1629318758074; 
 Wed, 18 Aug 2021 13:32:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c2sm92831lji.57.2021.08.18.13.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:32:37 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Wed, 18 Aug 2021 22:32:30 +0200
Message-Id: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Aug 2021 16:43:43 -0400
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


The Zb[abcs] extensions have complete public review and are nearing
ratifications. These individual extensions are one part of what was
previously though of as the "BitManip" (B) extension, leaving the
final details of future Zb* extensions open as they will undergo
further public discourse.

This series updates the earlier support for the B extension by
 - removing those instructions that are not included in Zb[abcs]
 - splitting this into 4 separate extensions that can be independently
   enabled
 - update the to the 1.0.0 version (e.g. w-forms of rev8 and Zbs
   instructions no longer exist)


Changes in v2:
- Fix missing ';' from last-minute whitespace cleanups.

Philipp Tomsich (3):
  target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
  target/riscv: update Zb[abcs] to 1.0.0 (public review) specification
  disas/riscv: Add Zb[abcs] instructions

 disas/riscv.c                           | 157 ++++++++++-
 target/riscv/cpu.c                      |  31 +-
 target/riscv/cpu.h                      |   7 +-
 target/riscv/insn32.decode              | 119 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 357 ++++++++++--------------
 target/riscv/translate.c                | 128 +++------
 6 files changed, 400 insertions(+), 399 deletions(-)

-- 
2.25.1



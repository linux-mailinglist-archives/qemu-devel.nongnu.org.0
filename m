Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609023BB8DB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:20:35 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JqE-0008Im-CN
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo2-0006Lp-Ha
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jnx-0005Ys-7V
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id q17so581859wrv.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gVBZdf7dDXiZrFmATYNWC1LTfG3a27RPbL0eFSHrn8=;
 b=LN1FLiTtDwHGHRT58fx5FrZNZXKltEwS5r3rgnLk88KLPaeHaWKdLeaKOwSrjxwomt
 cJm7DPk5FoFBdKcIgByrA2sKDYcV5/8Mi+iLZxRwX6mVCO+mBsmCh5fKXUubqZbcKlgy
 nFTcN1WM7HgqJGrhAE/Tql7ICVpiTjrbUwaR6OqDOQRZRJpS+2tmi8A62m/HEcYimvfU
 Bf8kp3pvCRgqgeeBDPwvcpBaxCiy3A3Zr7aghRsMT+/AkgvG7i1ojs8GBj+5oG5HXF1P
 UMaHEvNdaoUOv/O1vkr5ofPRd04n8HWFY0RjW2nVwA0W/WNF5C6vCCrsbselMEK+rF8i
 BYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gVBZdf7dDXiZrFmATYNWC1LTfG3a27RPbL0eFSHrn8=;
 b=S9VT/R3u6UTOHndzKxI4ZkRGcNfTq2+pOtHQwOrwSB3TCkGfncqukIosACRKGjt9FU
 d3DMpfuCtoHCceZD/9eUP9a+ipQ6Y7b+NJh+I2j2pJ5Fw8fN4Xl8iNLNtkugqlNt9u8O
 48w9kmzXUzXyMjCeCMMNneRAOxd4cygkPBFlBtLihhHEHtcfzQP+l8lf+UG8o4U0aQ69
 Hu/vvG4YrvbkGqtyEqFsKWhgHbbuTpONmZBo9hRc/cvDaeZJTtKMy7wU5AkPxEqMnbrA
 fHpq24F588qu5HlG3qZIc2dXQYFPTlaXbya8uS/tWUMzoIfP9VufWOp3EruTsZC640h8
 07Fg==
X-Gm-Message-State: AOAM533EyxW10oAgpN02TuOrsANX7IvASrnGO9xfl+Le9ktHAve52yEr
 ujfcIZ2zPujxLP/5PLfMdKBCzBiBiZLrQA==
X-Google-Smtp-Source: ABdhPJwXgpfyWsA24bytwj1q0EVUn0oYbg1IeiYEZgsTrdHfgYq2PLWdmwm0BtYxhx4yHknUAeZ8XA==
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr14402135wrm.237.1625473090895; 
 Mon, 05 Jul 2021 01:18:10 -0700 (PDT)
Received: from localhost.localdomain ([37.160.151.142])
 by smtp.gmail.com with ESMTPSA id n5sm3662014wri.31.2021.07.05.01.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:18:10 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/i386: Continuing fixing kvm-unit-tests for svm
Date: Mon,  5 Jul 2021 10:17:58 +0200
Message-Id: <20210705081802.18960-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the APM2 I added some consistency checks to
resolve the following tests in kvm-unit-tests for svm:

 * EFER.SVME: 1500
 * EFER.SVME: 500
 * Test EFER 9:8: 1700
 * Test EFER 63:16: 11500
 * Test EFER 63:16: 101500
 * Test EFER 63:16: 1001500
 * Test EFER 63:16: 10001500
 * Test EFER 63:16: 100001500
 * Test EFER 63:16: 1000001500
 * Test EFER 63:16: 10000001500
 * Test EFER 63:16: 100000001500
 * Test EFER 63:16: 1000000001500
 * Test EFER 63:16: 10000000001500
 * Test EFER 63:16: 100000000001500
 * Test EFER 63:16: 1000000000001500
 * EFER.LME=1, CR0.PG=1 and CR4.PAE=0
 * EFER.LME=1, CR0.PG=1 and CR0.PE=0
 * EFER.LME=1, CR0.PG=1, CR4.PAE=1, CS.L=1 and CS.D=1
 * Test CR3 63:0: 10000001007000
 * Test CR3 63:0: 20000001007000
 * Test CR3 63:0: 40000001007000
 * Test CR3 63:0: 80000001007000
 * Test CR3 63:0: 100000001007000
 * Test CR3 63:0: 200000001007000
 * Test CR3 63:0: 400000001007000
 * Test CR3 63:0: 800000001007000
 * Test CR3 63:0: 1000000001007000
 * Test CR3 63:0: 2000000001007000
 * Test CR3 63:0: 4000000001007000
 * Test CR3 63:0: 8000000001007000
 * Test CR3 63:0: 1007000
 * Test CR4 31:12: 1020
 * Test CR4 31:12: 2020
 * Test CR4 31:12: 4020
 * Test CR4 31:12: 8020
 * Test CR4 31:12: 80020
 * Test CR4 31:12: 800020
 * Test CR4 31:12: 1000020
 * Test CR4 31:12: 2000020
 * Test CR4 31:12: 4000020
 * Test CR4 31:12: 8000020
 * Test CR4 31:12: 10000020
 * Test CR4 31:12: 20000020
 * Test CR4 31:12: 40000020
 * Test CR4 31:12: 80000020
 * Test CR4 31:12: 1020
 * Test CR4 31:12: 2020
 * Test CR4 31:12: 4020
 * Test CR4 31:12: 8020
 * Test CR4 31:12: 80020
 * Test CR4 31:12: 800020
 * Test CR4 31:12: 1000020
 * Test CR4 31:12: 2000020
 * Test CR4 31:12: 4000020
 * Test CR4 31:12: 8000020
 * Test CR4 31:12: 10000020
 * Test CR4 31:12: 20000020
 * Test CR4 31:12: 40000020
 * Test CR4 31:12: 80000020
 * Test CR4 63:32: 100000020
 * Test CR4 63:32: 1000000020
 * Test CR4 63:32: 10000000020
 * Test CR4 63:32: 100000000020
 * Test CR4 63:32: 1000000000020
 * Test CR4 63:32: 10000000000020
 * Test CR4 63:32: 100000000000020
 * Test CR4 63:32: 1000000000000020
 * Test DR6 63:32: 1ffff0ff0
 * Test DR6 63:32: 10ffff0ff0
 * Test DR6 63:32: 100ffff0ff0
 * Test DR6 63:32: 1000ffff0ff0
 * Test DR6 63:32: 10000ffff0ff0
 * Test DR6 63:32: 100000ffff0ff0
 * Test DR6 63:32: 1000000ffff0ff0
 * Test DR6 63:32: 10000000ffff0ff0
 * Test DR7 63:32: 100000400
 * Test DR7 63:32: 1000000400
 * Test DR7 63:32: 10000000400
 * Test DR7 63:32: 100000000400
 * Test DR7 63:32: 1000000000400
 * Test DR7 63:32: 10000000000400
 * Test DR7 63:32: 100000000000400
 * Test DR7 63:32: 1000000000000400
 * Test MSRPM address: ffffffe000
 * Test MSRPM address: ffffffe001
 * Test MSRPM address: fffffff000
 * Test MSRPM address: 435000
 * Test MSRPM address: 435fff
 * Test IOPM address: ffffffc000
 * Test IOPM address: ffffffd000
 * Test IOPM address: ffffffdffe
 * Test IOPM address: ffffffe000
 * Test IOPM address: fffffff000
 * Test IOPM address: 438000
 * Test IOPM address: 438fff

Lara Lazier (4):
  target/i386: Added MSRPM and IOPM size check
  target/i386: Added DR6 and DR7 consistency checks
  target/i386: Added consistency checks for EFER
  target/i386: Added VMRUN consistency checks for CR3 and CR4

 target/i386/cpu.h                    | 31 +++++++++++
 target/i386/svm.h                    |  5 ++
 target/i386/tcg/sysemu/misc_helper.c |  6 +++
 target/i386/tcg/sysemu/svm_helper.c  | 80 +++++++++++++++++++++++++---
 4 files changed, 115 insertions(+), 7 deletions(-)

-- 
2.25.1



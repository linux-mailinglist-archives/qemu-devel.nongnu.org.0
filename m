Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4215420DC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 05:46:59 +0200 (CEST)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nymen-0000kg-M0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 23:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nymcu-0007gt-BE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 23:45:00 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nymcs-00060n-Jm
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 23:45:00 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so22634042pjl.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 20:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=UT4LMP4I1zhgcEIg4bdaQZSn8vjSpcWhVX2N0nvmdzS2Hl7FHwyDGHSXjU/SvKTiVG
 JXlNaM1r+r2TLGRD+xmUAKQV5RPPhXbceaTTJbCd5CYOkeCjDUt94WfkjSwBe1UoMtlR
 ZNOCdpQ1wk0tr6gmWSdtfBtTluRwMuovNOvWMYi1rCn6jz3DDcKzFrdJpnXFSge4huNP
 4pECV2lHywBdvE7g4CmxwBB477+PREPianSItTrO9Yxp1kn2e5veqXwpNUAX+EzPe33s
 M9zA2am4/9Ah1FeBk6o0c2QauA+OSkCH5fghLPOfmfZNTs4KT0t/Q+1VteeH6mYxA9W+
 1dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=6yidHfJ3Wekegm6C2of1b1OeYQgDq+eRZtwcA+fNmaFVlxjBeBbCewLk0cFJaUWfQP
 5z/GR0kzojxQ79NzHs4N2Yb71lg2TYYtJHhiTRvWHPrQDjSX+XlzRJAa5SecVpoulJRu
 kyjoe7jkFdZ2HdlvIo5LG1niH6OUJdnixZVJQorHlFYz6B7kAuN+hmqfZlrBYBwoqjzZ
 bx9YGWp5bZ8/wOJ8Ai5m62fUVgjLLxxgM5LTtBMhfcKvVyfCNPht5pd9cKe20U6hUTp1
 IHq2mYYTqQ3+BVp7uMpFig5NQerjgKDpFQJmeydIzrQ0wgiRFBUOHtgZzfhTBcykEvcF
 Zs+A==
X-Gm-Message-State: AOAM532tPmaO4N8FsdCm7cn/tAW6z4FA5bGYaRqgSzKnfoOZqe/I9a7M
 3u6FUmFN9vmKnrpkko0s+23c7/t3qC+A+Q==
X-Google-Smtp-Source: ABdhPJzO0zbUiARHT0DGTmFVAXkzWEgvwy/kRsiK0+Pmtd6eWfw/zlsnziwbAznZqerVJ81EOL2ClQ==
X-Received: by 2002:a17:90a:468d:b0:1df:39da:322b with SMTP id
 z13-20020a17090a468d00b001df39da322bmr35338551pjf.137.1654659896870; 
 Tue, 07 Jun 2022 20:44:56 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a056a00216200b0051bd9981cacsm10258214pff.123.2022.06.07.20.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 20:44:56 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 0/1] target/riscv: Add Zihintpause support
Date: Tue,  7 Jun 2022 20:44:52 -0700
Message-Id: <20220608034454.1528469-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause for TCG to mainly to break reservation and exit the TB.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

--------
Changelog:

v1 -> v2
1. Pause now also exit the TB and return to main loop
2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function

v2 -> v3
No changes, v2 was lost from the list

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1



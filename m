Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9E3567605
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:54:29 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mkm-0007hK-6P
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o8mgI-000489-Go
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:49:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o8mgB-0005AY-2o
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:49:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso5330576pjz.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4azkuwIy0LyIoitAMeFygcelBPbgpncCgtZ0mgkTiI=;
 b=336zJp2MWF9yFITe8fha3W7AjClD5yL2G6EQHcp/4pajG7OXlnJ/9ffz3LHRK2vS6p
 s1QfSsP4hrLgP6Prfdy3NajoWGmq7PqLYJaOHJ4V55+DREYN0cuWWxlHn8wGPwkKtCwG
 SRnluu7xkiYYRIB9f1rWxmvXtMPtjdwZu8IpcJ4emMoJ33iOZ6ZiYUdVX9IfxVLtpOdv
 tnpwn7GUgAXZu31uipgSC3WD2ldnwYOUWEbsBH1RP2areleIiQyWYNHDWkEdzFe3WofH
 Z1GL1lTFgI09WwK9FkzK6bwMF1J9PWRSoqrRVvatWYLU1QIfQyLAXMm9nvKA7ZKZcP4d
 XYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4azkuwIy0LyIoitAMeFygcelBPbgpncCgtZ0mgkTiI=;
 b=VEitXKT4QSRWzB53Ju1zBRNNTefDuDoRiLMPCX7Mhdjdh442wdX/Oa3F1dk9jKdZql
 1m1gooO8pXPuzr1OTwVSCh8Qmei8CmweJcFs6AGI4NlXN44Eg/5tmRsZTDCLCNDXnWc3
 kElf5dfyISMI+a6Uns11ZmxZegbCN7tmfU9QDQmrL2Dydzdj09dcj23tAIHkTNiw2w0d
 TP8e+TkkhQc8B02DIyyjTNIsBPYBj9Lli/VOcKgusGBTEvCGI9UrOA+CcZxiJlMcEhyl
 Yo38WqQ7Fls/+rUNaEc+zJa/k4oKczNVPI/wCPibmv+sKv0Zg3tOsSVP7Av+lfQWLyuJ
 6tFg==
X-Gm-Message-State: AJIora/g/hQ6BLz4zD69Sccj6LQ5m4lZcmuLdKjI0K2kzQ4l+fv4vMsd
 6Iiy0UkAaeahKJV+wOxDd9vzvbLdIOb9Ug==
X-Google-Smtp-Source: AGRyM1tUUKeOkkiCl/T73KFH+NWw3+5wpyiuY64BoRg3joDhe396r+9G8wGIr2nsw2KAn2wJX6ePDQ==
X-Received: by 2002:a17:903:2310:b0:16b:fbc4:bfb1 with SMTP id
 d16-20020a170903231000b0016bfbc4bfb1mr1082903plh.100.1657043378437; 
 Tue, 05 Jul 2022 10:49:38 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902d50500b0016be372a10esm4952004plg.20.2022.07.05.10.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:49:38 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v4 0/1] target/riscv: Add Zihintpause support
Date: Tue,  5 Jul 2022 10:49:31 -0700
Message-Id: <20220705174933.2898412-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1033.google.com
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

Added trans_pause to exit the TB and return to main loop.

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

v3 -> v4
No longer break the reservation in trans_pause

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.25.1



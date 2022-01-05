Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1751484BDD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 01:48:14 +0100 (CET)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4uTL-00084a-Pk
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 19:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMO-0005Bp-JS
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:00 -0500
Received: from [2607:f8b0:4864:20::1030] (port=43701
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uML-0005er-6F
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:40:59 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so4791110pjw.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 16:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BU7hQhPI30vNQW8esI0F+rgfU62/lW8WhNUZdINuOtg=;
 b=npsd9I99WGOlbRLSO6sBCa8C2dfLD5R4pP+6cCDroKnpElW/hoFivfq9hXzXsBttYA
 OmjD/ZNFHvEsigFVjfoYgjskw7LqBa+zZPeyxoLs9Sh0Fl3WibJttiTrbY+z8y0MrELD
 RuxeOuB/MSSef0lzlcw3cRLcxVoa+oeLvI7CHLDoQF3FfwPaiCkj0RUqWF2W4+RiYnD+
 uJ17euT6WDxTnApRDLSa7EFyAiARrgRbF78rhAVwXYFE6vv2ZucKrZrYvhDdjwq7MjA0
 YXRrzcmzG+ymh3Gxn9oPlGfGO9kVsl2jKvI1/RmiMDEQmwcDupmH96f7OtKeJLKfEBrF
 ZNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BU7hQhPI30vNQW8esI0F+rgfU62/lW8WhNUZdINuOtg=;
 b=Qz/ap+wyRbWmx/jraj4WWABnDknGQFHzHuLa2+BTJN/3Ot9PnRxT9qjkt2V0nEqPBD
 qrSQUA+3YAyWIZZ9fWVnL3NCvld1U8x/eKMMCtHcBXKOqIacgwmIZ6mv/KWJtfY4bnlP
 ofle7iG2bUyfhg/6PiLyJR9z8HrV0FOcZ/Y49OTH1wJEpNLx5GhOVChik/UwzJPpNY2T
 i5HWxbcSjlLMRFypPtPr0DkmlvnqLwWO+PR8PJSJztvexDKhfDszSmyxYp90IHewSDhg
 KoMmfd58cWYlWbqoEPdlO3qse0Jag/Mcg8aAv7vwYUPrj2Hg+Mrn4eSPX0wmZnI/o5dm
 NT5Q==
X-Gm-Message-State: AOAM531UleH9Ji64ryJu3rvftUHOj4ouusD3GJkUpL6Rb8YlYEbi1rdO
 YltrEHIstCcZP3d9qJAQyFq+mlsE67bMig==
X-Google-Smtp-Source: ABdhPJzij8NYofrBFU8TS/U9Huz2dm66sZCjDERCvxF8vCeuj7ku3M8pTqGQdG4NN1KYiplr5lH4sw==
X-Received: by 2002:a17:902:da81:b0:149:4b25:a587 with SMTP id
 j1-20020a170902da8100b001494b25a587mr51592139plx.103.1641343255542; 
 Tue, 04 Jan 2022 16:40:55 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k3sm35312356pgq.54.2022.01.04.16.40.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 16:40:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] tcg patch queue
Date: Tue,  4 Jan 2022 16:40:50 -0800
Message-Id: <20220105004054.587588-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 67e41fe0cfb62e6cdfa659f0155417d17e5274ea:

  Merge tag 'pull-ppc-20220104' of https://github.com/legoater/qemu into staging (2022-01-04 07:23:27 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220104

for you to fetch changes up to d7478d4229f0a2b2817a55487e6b17081099fae4:

  common-user: Fix tail calls to safe_syscall_set_errno_tail (2022-01-04 15:41:03 -0800)

----------------------------------------------------------------
Fix for safe_syscall_base.
Fix for folding of vector add/sub.
Fix build on loongarch64 with gcc 8.
Remove decl for qemu_run_machine_init_done_notifiers.

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      linux-user: Fix trivial build error on loongarch64 hosts

Richard Henderson (2):
      tcg/optimize: Fix folding of vector ops
      common-user: Fix tail calls to safe_syscall_set_errno_tail

Xiaoyao Li (1):
      sysemu: Cleanup qemu_run_machine_init_done_notifiers()

 include/sysemu/sysemu.h                    |  1 -
 linux-user/host/loongarch64/host-signal.h  |  4 +--
 tcg/optimize.c                             | 49 +++++++++++++++++++++++-------
 common-user/host/i386/safe-syscall.inc.S   |  1 +
 common-user/host/mips/safe-syscall.inc.S   |  1 +
 common-user/host/x86_64/safe-syscall.inc.S |  1 +
 6 files changed, 42 insertions(+), 15 deletions(-)


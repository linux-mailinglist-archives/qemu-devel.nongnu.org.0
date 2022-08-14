Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08360591FEE
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 15:49:42 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNDzp-00012X-4G
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 09:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNDyA-0006fW-M3
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 09:47:58 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNDy8-0006ef-D6
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 09:47:58 -0400
Received: by mail-qv1-xf33.google.com with SMTP id l8so3835218qvr.5
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=OOv0uFODaafLAH5pgfRRMbcD68wMRADw82qCwDYZVas=;
 b=LCMYQScYCnGKo7EruoQA6bnN4R9368tSlmw4JtRti4OhFFgDQ/FjfJ/fjDJ3lgXHEL
 3JUt/rAP2sE5ccRzFLG+aur1T28j1kWY7RQX+ZUEt0cVaZG1rQmaH6E842ARsaqIbIrU
 UKeB2hxhbZaD++kb8t93V7CZXjAK/RFbjBebRnQrWNEOBBxGR9fhn7HQGPOSWKgIQbQt
 8dE9arAs++sz+18cfzRUS+E22NYVILxx/yG7xxCJoTwplc8+I7cxofViu/+z1BXmLe+u
 S+cKnWVMebRXSzSr7++ttbCscRuGY6B7XqDclwhKEdbwKO+DU263kCqTfY+JIKhdR6Xb
 PcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=OOv0uFODaafLAH5pgfRRMbcD68wMRADw82qCwDYZVas=;
 b=ARznao36RaLh9GfOEbm8MIAEVsGCxMWp/s0INNlq/zEb/G3IZkZMG/7bbrHt93NeVF
 fjKFghTn5N/tf/qj8OKWzPdhhct/4Z5jyMkNwiAVZG+OnDVj7HHHGV5aAqKU9xZ1XDuC
 A3ZeAAYyoVR5qZDBG+0gGRAZo3Wfpe2Y4xwuHyYuPobeheM4f3i2X0l7Sl2nZ/L/iNAn
 wp70F+0OBQFb6kSaS80IGovez4CV9v+pU4/43XSvL/objnSPVIbaHLTI0LTgG4mHWKTk
 gTgUkSYibP+/w2QR9QBSSR3r7wCUqZ7EpNV3a+ANVfc99na8+A/LO3PHT5I+LDqoDsex
 m6wg==
X-Gm-Message-State: ACgBeo3+v8R7+4FriTuWieSGl5LyzpaHnCeqkYnkfAq510b++rZXTWG+
 pFFaYKfb/oRBA2J8lXHBgFt1eI6SDNNAQw==
X-Google-Smtp-Source: AA6agR7cI48HzK9Op3rnHVCIRRWCY2vgAm/FgXjdfwTac7xO4CHo8SQLSREP80LuKEV9WVTS6H1iSA==
X-Received: by 2002:a05:6214:dcd:b0:47b:4097:93ff with SMTP id
 13-20020a0562140dcd00b0047b409793ffmr10386760qvt.73.1660484873296; 
 Sun, 14 Aug 2022 06:47:53 -0700 (PDT)
Received: from stoup.. ([50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 u67-20020ae9d846000000b006b89b9024ddsm6224456qkf.24.2022.08.14.06.47.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 06:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] loongarch patch queue
Date: Sun, 14 Aug 2022 08:47:44 -0500
Message-Id: <20220814134745.8824-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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

The following changes since commit 93f3dd604825824a7239aaf704baf74730aa3007:

  Merge tag 'pull-target-arm-20220812' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-08-12 10:46:43 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20220814

for you to fetch changes up to 1f90ce64fc6043470209f825c7763950ec2067a1:

  docs/system/loongarch: Update the LoongArch document (2022-08-13 04:45:03 -0700)

----------------------------------------------------------------
Loongarch docs update

----------------------------------------------------------------
Xiaojuan Yang (1):
      docs/system/loongarch: Update the LoongArch document

 docs/system/loongarch/loongson3.rst | 104 +++++++++++++++++++++++++++++++++---
 target/loongarch/README             |  49 +----------------
 2 files changed, 97 insertions(+), 56 deletions(-)


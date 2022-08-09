Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5D58D8A2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 14:16:54 +0200 (CEST)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLOAB-0001fW-Th
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 08:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLO6m-0006sM-9P
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 08:13:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLO6i-0003at-Ev
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 08:13:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id h13so14108296wrf.6
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=GMQT6LvusKdq2u6eA84id4/9Fbv/1vsA+JoqFifKJ8g=;
 b=gpguNoXEzSWED52E9MNCL8LQnxQKBZNG3aAfoTbPVZiT7EL0u8KyJJqIR/DZho9jin
 xzX+py3mvmBvlDVdV4iM440oeLb79YwDDqBeZQnlBLxN9fLwV5ovRDosPSN9V5zWDE+U
 qmHS68Bv7KSn9f9GapcJG+ufNnU7zgUZHT6XEMVWfrRMVWyLku4A3hozxvPK5zf1qxNo
 x7P5lHWbuV3b6niI9+1VBQx9uGzhsrSF1YwNrL9b8Xf3LjAdIiMkz6ZXp200ZLnWgTpf
 7sP1x8099SOXGD2xpiUKOO59O9DEfJfOCdb7ZylzMA8rcN3Q+ICbFSUXl334Vt8zSmAk
 eq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=GMQT6LvusKdq2u6eA84id4/9Fbv/1vsA+JoqFifKJ8g=;
 b=1cqc1noT1mMmwdMxLLnxGDHyd98KILm3TqMsZH7YOo8Y2O3dM9ABrCmyubP0hbBCO4
 2IsAOnqydaJLkbKXGAJN8kLZZ1biQVNakwBgZQt7F9Ub+B9ajuT28Jr4LwTzNGyv0xss
 EtOihFCs/Jvjir5FYdS5A013B09MmtNKdHuFd8piTeuXfR95QjQnGzYCfFYq18euFdyl
 hMM+lNZKjpTXYvv/QoOoPDVroXIpHbAWqYD+AfdHZTEbNeNAglZgovEnCf12w3xxKbPV
 TyBrR7UzwDnmWmqYO14ovq/eqWLkV0090xp9be50XWBrt5n1saDNUb+HXa5GjrmeIg45
 3bFA==
X-Gm-Message-State: ACgBeo0MnzzBclepo9uhyUnX9GH5kn87Ei/OCrGxDa5HUDfCiYsRzv64
 w16hiSXtw8ErZ7h3tmskmdGradSHgm0u+A==
X-Google-Smtp-Source: AA6agR7iDxb7EDYI/2httl6Iv88BVzK2yHObL5o8qDkl18pC85xrEecMpDNK7KBOVJ55UQoSLQ6C+A==
X-Received: by 2002:adf:eb4c:0:b0:220:6aaf:ef5e with SMTP id
 u12-20020adfeb4c000000b002206aafef5emr13667298wrn.488.1660047189984; 
 Tue, 09 Aug 2022 05:13:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a55e5d0d54sm2423169wms.36.2022.08.09.05.13.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 05:13:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target-arm queue
Date: Tue,  9 Aug 2022 13:13:06 +0100
Message-Id: <20220809121307.560286-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Just one bugfix patch for this rc:

The following changes since commit ca5f3d4df1b47d7f66a109cdb504e83dfd7ec433:

  Merge tag 'pull-la-20220808' of https://gitlab.com/rth7680/qemu into staging (2022-08-08 19:51:12 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220809

for you to fetch changes up to c7f26ded6d5065e4116f630f6a490b55f6c5f58e:

  icount: Take iothread lock when running QEMU timers (2022-08-09 10:55:14 +0100)

----------------------------------------------------------------
target-arm queue:
 * icount: Take iothread lock when running QEMU timers

----------------------------------------------------------------
Peter Maydell (1):
      icount: Take iothread lock when running QEMU timers

 accel/tcg/tcg-accel-ops-icount.c | 6 ++++++
 1 file changed, 6 insertions(+)


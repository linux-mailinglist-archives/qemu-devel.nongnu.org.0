Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F23B1B8D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:49:37 +0200 (CEST)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3G4-0002KA-Si
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw3EX-0000Bn-TH
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:48:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw3EW-0005Ag-82
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:48:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id j1so2724993wrn.9
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mKeh9+oCOdbbQtjsNswxIB7djIHCtAuFKXsPUeL6FN4=;
 b=WAYB6LJn04waRqk0YLmQgdJykKan94lScBq9wU95BC6DrSLy9zBXTjGb7I+BT2+xte
 9zjKufr27I7mNyUqRdU6yxvipN9cDeYuLX+YJd5qK4kfUoJky+K586sN/uBBqEtcX/pL
 oyrBrEMoePLsHuZo6a1NJdZ5PpaAb8O2ZqrUhFlnIfbXfuYP8JbpD7bClF5U9dwQZCJY
 eQgNJhuzSSpJvnGglQ599sSSDxfTQQOtzHWsxo/fDZi3kn9XTG7coJoqzExDSYjgwix3
 UIwCR4BgRsNE8IYDzVTMzbuqFC0CcTK63UGiB5a6qOD39cGLLvkusqYJw6sGXF8U71st
 DWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mKeh9+oCOdbbQtjsNswxIB7djIHCtAuFKXsPUeL6FN4=;
 b=tsHYYqd7It1/Cna9YFFDPRCWe+IG2v0u41Iw0+lS1NYf6F/A5q228gKzT1qpPSYRMG
 9xip2Nzhr3rjeqF0tDuYLOQXSI8Zt5Qj+IgEUTYpNJjWM/x7tkTBO7M7iVD3zKgsuR4l
 uR2z/lcTjWCxOBF8vovlIldjmS0LJNEs5I93b13zpamF6/KlPVh2EprytuE5S9pNAWRI
 B7LakWoFokQr9o9t9hWMif9bEsrkNjgTH5RYBbVLpUFB5Wuv9uRiO3QCxWnxBzBLELcY
 q5i8yy+8QA38K21t3inBIlLT+5aRXS/f1/sV9rAdnCqAUyyEWlKT8p7jrMJy6tTQIqcT
 SNuQ==
X-Gm-Message-State: AOAM5301peiIg7Wsnq9ZrdhwEQmgj6RA2P0g5lq6cq/LLeAP6q7pPXr1
 2hNc6Tkbb8YESGTDXHeLCZa+wg==
X-Google-Smtp-Source: ABdhPJwgF2nKDxQxXmEvvFSBHTk6VtNlBZZrqkFZEuDTnD08JbHL4bWgKkpjhyhVikKY/Al2+lH/tg==
X-Received: by 2002:adf:d216:: with SMTP id j22mr150531wrh.2.1624456078661;
 Wed, 23 Jun 2021 06:47:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm143492wrx.0.2021.06.23.06.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:47:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01CB91FF7E;
 Wed, 23 Jun 2021 14:47:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 0/2] semihosting/next (SYS_HEAPINFO)
Date: Wed, 23 Jun 2021 14:47:54 +0100
Message-Id: <20210623134756.30930-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

This is v4 of the semihosting changes with your proposed algorithm for
finding the largest gap in the various loaded ROMS. The included test
is fairly simple but I also did a bit of manual testing with
guest-loader and loader stanzas and it seemed to do the right thing. I
think this is ready if you are happy with it.

Currently all patches need fresh review and testing given the change
from the originally very simple implementation I proposed on v1 ;-)

Alex Bennée (2):
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

 include/hw/loader.h                 |  16 ++++
 hw/core/loader.c                    |  74 ++++++++++++++++
 semihosting/arm-compat-semi.c       | 129 +++++++++++++++-------------
 tests/tcg/aarch64/system/semiheap.c |  74 ++++++++++++++++
 4 files changed, 232 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

-- 
2.20.1



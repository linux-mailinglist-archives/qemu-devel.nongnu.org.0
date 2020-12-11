Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B62D6D1F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:14:59 +0100 (CET)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knX1O-0006GW-0j
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knWxU-0005L6-Gz
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:10:56 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knWxS-0001zk-1n
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:10:56 -0500
Received: by mail-oi1-x22b.google.com with SMTP id l207so8045560oib.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oohFGdh0ylVwe78ogBngje1zkzScymm7NgN+7LfaU+g=;
 b=uvH0+bBrpKvQuQU+hCn+pGB43nix/6bVphApnoRESzyER026zguo9sk98owMwU8IE2
 D6Yv0R098vIFZITWMrUAbdAPZgPDzO+WA4Jo22YghDrF/UVPeyJt+0ynj8WgyU8qtsTi
 OktbIVLw8yEO0hjfCmojt6pQdn5av6o6PFTXBvhaCWE1cD2Bge9ai7mkTsNLxTPYsm3Y
 5+hA9NwqnutMNdG4gS1/nJiyT9J2kekSnXKAHZLxRtaK5Ql5PmQ89WsuzFVzJ8DBfXEm
 kTgkMcqeUcopy4v6YAIsNd4qzQBH45sbCVGuQEtcc8ocDxM3GxdegSP/bUDSIKF2/iLP
 Y2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oohFGdh0ylVwe78ogBngje1zkzScymm7NgN+7LfaU+g=;
 b=HZ8+FSwuzoi4oJqGPlxNSJWr73yy5g/gaZurj3kl0QwK4RoIQ4QwORnVWnamvxP1Us
 5JetuaN+HwxGJ64pb2C7KpoJZjfFuAoxupIjz6OhaB0JBkj8EX2jeW0kfmnzYKwM3WKo
 I2Jv/0qqL0a1RMx0qxFV7b+RW6NiFjeV68hl+edp0+Tni+BEo/8YPHAG17+9z+V1VKMM
 MB/BOXU3rAuDrMlPB/v95+AiYN7tq354PNCyRy0oqYXbdzRWTAuXXucoz39EW29THYZX
 iKZblVK1Ud8bLhYqxrcIiBl/jN3S/pjWIkNDneOWn80OKjja+ahQFy/79HllOr7pMzlG
 HoCA==
X-Gm-Message-State: AOAM532b3S/F2cUAiqwNjWv+HV22j94fhbza7RXHN9H+gEdBUksCm8uP
 6HkrpofSUf9GhuPZcvnwrm7xASaVLr4DH9Hs
X-Google-Smtp-Source: ABdhPJzq4oPdxl4ahgDlTacYQLiMwy5An6ACQR/b0cx7rlw62T0ffFayy0LntRThFDbp6jEszSf7Fw==
X-Received: by 2002:aca:bb43:: with SMTP id l64mr7377684oif.52.1607649051919; 
 Thu, 10 Dec 2020 17:10:51 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w8sm1412905oos.37.2020.12.10.17.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:10:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] tcg patch queue
Date: Thu, 10 Dec 2020 19:10:46 -0600
Message-Id: <20201211011049.474889-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20201210

for you to fetch changes up to 9e2658d62ebc23efe7df43fc0e306f129510d874:

  accel/tcg: rename tcg-cpus functions to match module name (2020-12-10 17:44:10 -0600)

----------------------------------------------------------------
Split CpusAccel for tcg variants

----------------------------------------------------------------
Claudio Fontana (3):
      accel/tcg: split CpusAccel into three TCG variants
      accel/tcg: split tcg_start_vcpu_thread
      accel/tcg: rename tcg-cpus functions to match module name

 accel/tcg/tcg-cpus-icount.h |  17 ++
 accel/tcg/tcg-cpus-rr.h     |  21 ++
 accel/tcg/tcg-cpus.h        |  12 +-
 accel/tcg/tcg-all.c         |  13 +-
 accel/tcg/tcg-cpus-icount.c | 147 +++++++++++++
 accel/tcg/tcg-cpus-mttcg.c  | 140 ++++++++++++
 accel/tcg/tcg-cpus-rr.c     | 305 ++++++++++++++++++++++++++
 accel/tcg/tcg-cpus.c        | 506 +-------------------------------------------
 softmmu/icount.c            |   2 +-
 accel/tcg/meson.build       |   9 +-
 10 files changed, 670 insertions(+), 502 deletions(-)
 create mode 100644 accel/tcg/tcg-cpus-icount.h
 create mode 100644 accel/tcg/tcg-cpus-rr.h
 create mode 100644 accel/tcg/tcg-cpus-icount.c
 create mode 100644 accel/tcg/tcg-cpus-mttcg.c
 create mode 100644 accel/tcg/tcg-cpus-rr.c


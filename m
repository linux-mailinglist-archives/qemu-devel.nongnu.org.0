Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D9390734
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:12:42 +0200 (CEST)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llabg-00037Y-VQ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llZYZ-0007lB-Sw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:05:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llZYX-0006wl-Ug
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:05:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so6892587wmq.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 09:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UbgaWJ3t1U6HB4JiiWg9Kncy9nhohZ2qlPWKyV6gFgE=;
 b=ZC3GwMMl+gNf7bfXtvZBd6KpZ8ADkSEWiYZFPA1TW77kbI2yWIBJWZITRTgErRPBOT
 ZZdffY1W3PSWBQjYKfp/l/bgJq5QtzQm44G9/pBzWoJ02Ass2U1uPyDXHdr5yvuYYX9c
 cPIc0cx3tunZipB4HHo0AfNQOU4e9sTi7FY0f7eEr6PHjAbnBXLdA9OHhmvYwUKHiquM
 Tqx4zuw5pKdyqEGwrgGdwPVWd14cgFKROupW/MrOdHd9GD75EyrYAAaq/4M7UpFwOAa3
 drE4cB/o38uwygJROzlcc212/q6/+9GWlO2flwCOYNW+Sfpy5R74oM06s6Rc7QMtni5X
 wDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UbgaWJ3t1U6HB4JiiWg9Kncy9nhohZ2qlPWKyV6gFgE=;
 b=tXQW5HXIYAUYVTtdsdMG4U6dd3SNgC1AeNdR4fQCJhQJJsmMOt6Q2fex7FYdTM5ipG
 otFAA6HEmLBj35iuQds+rzyXBvjsluC54T1H36R5TkT8vRClG5VTIUc3EnIZHbi4nz9G
 gEOXFQ1pEMQL5PTYMgBr6vNUxTZ6qcmJetnsKWFce1xhq0wmb5Jexyn4YHmHUcmwVRdw
 R47VMJG0bpSKhyXHXNKucHDPfQxhAoVWRHGv/rOMVBM0tSq+Iy66NCHQEu5QYSks7qjO
 k8ZTAafAktd1eFltoKm8cW9tfKqgMnaNziFh3cn7xPxu6oBvLhZyjVYtbsbZ3uPtrQ+U
 HLJQ==
X-Gm-Message-State: AOAM532JIdOTSLLOJgLLZbfH/iHO6W0rQR1T3RfmFN1j4JChpgesfiGI
 +eCYLftLoq29PqiaOaHNK/WYFg==
X-Google-Smtp-Source: ABdhPJxGO3ITrZI+Ztc/d4NXbi1ZqUqICRpByd4FXIemiYqfqG4sY3LoOZmSmRGjfW4z/urpRE7Knw==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr24531576wmb.72.1621958719504; 
 Tue, 25 May 2021 09:05:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm10396870wra.5.2021.05.25.09.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:05:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E16E01FF7E;
 Tue, 25 May 2021 17:05:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 0/7] testing, gdbstub and plugin updates
Date: Tue, 25 May 2021 17:05:17 +0100
Message-Id: <20210525160517.1367-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tweaked the rules so the needs: line is optional

The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a63049:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-05-24 15:48:08 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates-250521-2

for you to fetch changes up to a6851b49e3b0509168d74050d0e59fe0121b2898:

  plugins/syscall: Added a table-like summary output (2021-05-25 16:52:50 +0100)

----------------------------------------------------------------
Testing, gdbstub and plugin updates

  - ensure gitlab references master registry
  - add special rule for hexagon image
  - clean-up gdbstub's argument handling
  - fix replay HMP commands to accept long icount
  - minor re-factor of gdbstub replay handling
  - update syscall plugin to be more useful

----------------------------------------------------------------
Alex Bennée (5):
      gitlab: explicitly reference the upstream registry
      gitlab: add special rule for the hexagon container
      gdbstub: Replace GdbCmdContext with plain g_array()
      hmp-commands: expand type of icount to "l" in replay commands
      gdbstub: tidy away reverse debugging check into function

Mahmoud Mandour (1):
      plugins/syscall: Added a table-like summary output

Philippe Mathieu-Daudé (1):
      gdbstub: Constify GdbCmdParseEntry

 gdbstub.c                   | 343 ++++++++++++++++++++++----------------------
 tests/plugin/syscall.c      |  98 ++++++++++++-
 .gitlab-ci.d/containers.yml |  31 +++-
 .gitlab-ci.yml              |   5 +-
 hmp-commands.hx             |   4 +-
 5 files changed, 297 insertions(+), 184 deletions(-)

-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A993638FFE8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:27:00 +0200 (CEST)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVD9-0004vT-Ln
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAs-0002Ad-Sa
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAp-0002rb-9g
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id z17so31808959wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BkXsqHizHw9wM0WkeSLUm9nhlW9Qcw++iMAUwyh8BTY=;
 b=DIzr8KZLW4m8rB0GJFJUK8jvfeMulOltqre74rwtAMupWGnR+RcNkdq66plvyvcZvz
 Bq3U3JXni1TN0HDhDNx1rVVqqTGyJOkrbHDS8hRlgCoGvFNLBMH0zPTglfFOqdBuQ8mf
 Ui55zl0tOX1qL8JKKG6OXLII2CVWL3uaxwMxUrclMegJz4p0wZqa4anhmmLV6KSOnDrf
 HmaCa20wB1mp/7nLGqHE34Ri4O5uXnM3gHG/9F1wQKVhTIkHuC/lGuJ6iIFnCrnR/6Ea
 kwcL6+YjbJ+h6PFfT6RclY3EIYB7XuNTkOUnRAotOl0lGB1yHxsQvPT64gO88QqEX0sp
 4xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BkXsqHizHw9wM0WkeSLUm9nhlW9Qcw++iMAUwyh8BTY=;
 b=NX1TwCudv/Dbdq5KRMxar41n3f90+IG1RYRk9dP7yVcyeo18cfM87rmhNP6/CIZJ4b
 +uxnCvXJ9zt0AzfCS/NMLSzEKhyd7oSsonJ98Bork1qnclTwNazOqLM7kD8la7BL93E7
 xmAvcmrhqWgp3zLUbnSDk9xhknMUHY7nNMYhXS744IPXROOoWyNlbznli8wSttdkJrxd
 qAQMyZOXVO9XQRWP8nddr+lwJFaS1BBnupGMvbgbiUVCamCms9z9JyX4bvPsVFEI0oR8
 qP/2vntvthVfuRAOaQ/c/P704VEwQ9shmlumadG6gCoAfpkJYquitsL1rhKxrgQd0tjd
 O0GA==
X-Gm-Message-State: AOAM53018N3SokzyyDgXnMsQaqBbdD5uOrdIn3dUFjwE/W9bWphD4F3n
 jgiKqmIsRpV8fwMfjcWCD3xDRA==
X-Google-Smtp-Source: ABdhPJwGhRoDS0DF9oGasU1SDvc9fV74ZlaJ6mWZK1oA+Du8xR+HKzw1e28rxTMeR5L28PnWaKdHMA==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr26408736wrq.134.1621941873917; 
 Tue, 25 May 2021 04:24:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm19494788wrs.36.2021.05.25.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B19591FF7E;
 Tue, 25 May 2021 12:24:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 0/7] testing, gdbstub and plugin updates
Date: Tue, 25 May 2021 12:24:24 +0100
Message-Id: <20210525112431.22005-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

The gprof/gcov passed on retry. I'll continue to look at it but didn't want
to hold up the PR because of it. - Alex

The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a63049:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-05-24 15:48:08 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates-250521-1

for you to fetch changes up to bb84bcf61495e9c2907b0659a60beacd2e92e34e:

  plugins/syscall: Added a table-like summary output (2021-05-25 09:24:21 +0100)

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
 .gitlab-ci.d/containers.yml |  30 +++-
 .gitlab-ci.yml              |   2 +
 hmp-commands.hx             |   4 +-
 5 files changed, 294 insertions(+), 183 deletions(-)

-- 
2.20.1

Message-ID: <87r1hv2h0i.fsf@linaro.org>


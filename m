Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB02739F2E2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:51:38 +0200 (CEST)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYOX-0008Nh-NL
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDk-0004YK-Qe
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDi-0001lx-KK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id h3so1395151wmq.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I2kT/dS/ECpbE9gGHst9QJWHHcKql4EDTqtckMPDwtA=;
 b=f0tJ+TpL9tr0Oa4xKHCs4fXY0tW9jdHZuZ0LV8FRVf6Og/5Wpi20A48Fj5w314q9qd
 yTe8q0RMr470QMw4BMoowPdKLOf3njGOhXXrtibZmtYYzDcNFvg364BAattrm3yd02Ae
 uSpDr69bCMB5JYPsbBp8V3/CoIte7f+NdSmoOXZnQ8KgtzTkh8TaIW4uPm+BIbPuMVBL
 TW5k2v2QyV8v6pZ6AXXy1obJjJxq+1A9GwCUZO5f5ljyVtFfvoVTZzB6YmD+FGyaC8sT
 5lTKpFR5ksGBkxa0x6xI7DdvKlR9S2r3Elyp3G8S1Hbnitm2nE7RYrs0aZe7+tv+tksf
 ePzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=I2kT/dS/ECpbE9gGHst9QJWHHcKql4EDTqtckMPDwtA=;
 b=U7f/YVFO1RPjAfCJ4mwp+/lyssPZfteVXRxKPPzGyP4jWT1p4is8//drWJ77d97dcM
 7k5usXlNNWM5vYzBEmJhnerNv3c1MsMPbuHie4zZdmoVtaLhefwDIH4Ege9waousX/B2
 bFCvxxYfFjuhdnNtMfA0tIFXQiHexESgTb1TzChhLN/zTuOc6inZ3LpSEscUHuZPAV9g
 HTRnOwIQ186aft13C8ZMKnylpjohwgRE7QXbBlUENRvPkwOLLxSDt0Vx49qnk18xJ+oC
 8sQco2/LHG5mCRTGjnwGFgP+j/v3RhG9sYGG1RAWMZUwpm9Tr8qK3FHUVNqHc2USyR8C
 4BNw==
X-Gm-Message-State: AOAM533BApfXVE4I5YBljBkLUOxE4T2Pr6MI3Z57RhCg3cBEsnKoYtK7
 xA8mFVWEDpiUMSHDo8mxFRde8DdvIII=
X-Google-Smtp-Source: ABdhPJy9KeZlrrRK9zhnzFk1Oc2kjzwBsJwWiE+ssJkyPjyRgb9VLbJbfRtVd+F4F/drH9G+ffRkJw==
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr3172528wmm.113.1623145220089; 
 Tue, 08 Jun 2021 02:40:20 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Machine and OS X changes for 2021-06-08 
Date: Tue,  8 Jun 2021 11:40:05 +0200
Message-Id: <20210608094017.392673-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d166:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210604' into staging (2021-06-05 11:25:52 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8f9f729185e3ac8d3c5a65d81eb9e74e229901ea:

  vnc: avoid deprecation warnings for SASL on OS X (2021-06-07 10:20:23 -0400)

----------------------------------------------------------------
* introduce "-M smp" (myself)
* avoid deprecation warnings for SASL on macOS 10.11 or newer.

----------------------------------------------------------------
Paolo Bonzini (12):
      qom: export more functions for use with non-UserCreatable objects
      keyval: introduce keyval_merge
      keyval: introduce keyval_parse_into
      vl: switch -M parsing to keyval
      qemu-option: remove now-dead code
      machine: move dies from X86MachineState to CpuTopology
      machine: move common smp_parse code to caller
      machine: add error propagation to mc->smp_parse
      machine: pass QAPI struct to mc->smp_parse
      machine: reject -smp dies!=1 for non-PC machines
      machine: add smp compound property
      vnc: avoid deprecation warnings for SASL on OS X

 hw/core/machine.c           | 184 ++++++++++++++----------
 hw/i386/pc.c                | 108 +++++++-------
 hw/i386/x86.c               |  15 +-
 include/hw/boards.h         |   4 +-
 include/hw/i386/pc.h        |   3 -
 include/hw/i386/x86.h       |   1 -
 include/qemu/option.h       |   6 +-
 include/qom/object.h        |  23 +++
 qapi/machine.json           |  27 ++++
 qom/object_interfaces.c     |  58 +++++---
 softmmu/vl.c                | 336 ++++++++++++++++++++++----------------------
 tests/qtest/numa-test.c     |  22 +--
 tests/unit/test-keyval.c    |  56 ++++++++
 tests/unit/test-qemu-opts.c |  35 -----
 ui/vnc-auth-sasl.c          |  20 +++
 ui/vnc-auth-sasl.h          |   1 +
 ui/vnc.c                    |  10 +-
 util/keyval.c               |  90 ++++++++++--
 util/qemu-option.c          |  51 ++-----
 19 files changed, 607 insertions(+), 443 deletions(-)
-- 
2.31.1



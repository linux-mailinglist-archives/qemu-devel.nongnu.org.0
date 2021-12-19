Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C347A0DD
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:19:52 +0100 (CET)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx2V-0000Ev-8u
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx02-00063o-Ll
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:18 -0500
Received: from [2a00:1450:4864:20::535] (port=33311
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx00-0005wa-Rg
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:18 -0500
Received: by mail-ed1-x535.google.com with SMTP id m21so608007edc.0
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QEuEsXUdLQxXJxDPtJ0/zpqTwFRrrO1nM+RCi1MJTuI=;
 b=kS4t5X2lu68DdOjp2jWR3M3pfjSukBafgs4/KBxT5mf9QmlXxNl1Sl9iW4lIGhDISz
 qpA53WU6oR25CblHEYuIspVe53Tg5RD03WWFGgUUI1vZg3u6Q6jA/8WTg2Bm++zdrW6X
 pt5Q4F8s99ZGMXu45nhTEAoNhngXirzXyN4eBDk2MfLUWbzoFkUUZGAVsVdnpV7iOs2C
 24J/yoRlU5GDoiZe+2PZxRRjgaN44FFyMHB4fxjsmd3bJkQNei3NzEzDwG8icHOusleD
 DT02Qy0rqBBldbFmznuC4kUOUx5EzmHEK2vmL7aDXY5Cu2wzeu26cy8xWUuYLwS9qZVH
 9YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QEuEsXUdLQxXJxDPtJ0/zpqTwFRrrO1nM+RCi1MJTuI=;
 b=gZeZt/8zwhXLNYdf662RwZTm+BSisiiO7evcLbmXhaO/UKJJ9Te9WmyOphjvhsqvnE
 j8JYvVmsA86RSrmrFn9wokIaEqFi5Rvvw/GtLKQdfnZIrGgDaG6+l93Vw+MplZUFPrfv
 XEa23X7lBteQACFT8XS8o0a7je7UM2WP5Npm6u92cSDy+phXZzqwaoNSuUBYdgf1DHY4
 gzbnzhs6wI9DMAIbkGuPSqcpmIYCY5D4dTb+HeAxsTm74fWM6lPVieHS97oaQUNsl/Um
 m0hMheuLFKAuBAqta5RMi7lO0rMClel8JsJobHiTur6sABvpBTmBKvsoS+aPJZoVH4be
 C69Q==
X-Gm-Message-State: AOAM531bApkE5ptZYEipqFi+fwF+BHAtIerCI9X+yRxviUFndR4tOtgY
 4sQpDiqq5KFtoyqdv5B9l7oa/x8nC90=
X-Google-Smtp-Source: ABdhPJwxpiDeS8CQOM6Kr74ymwBHRMDKrjV9BmCp5Nom1goxRoZkNlVcmhAj/WmZ3dV4C7D9XuWejQ==
X-Received: by 2002:a17:906:e2c5:: with SMTP id
 gr5mr10000884ejb.282.1639923433957; 
 Sun, 19 Dec 2021 06:17:13 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] Misc patches for 2021-12-20
Date: Sun, 19 Dec 2021 15:16:55 +0100
Message-Id: <20211219141711.248066-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

The following changes since commit 90978e15bc9a23c208b25bf7ea697a5d0925562b:

  Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2021-12-17 13:15:38 -0800)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 5a3a2eb3b1096a52580c1b8c3eb0739714e7d941:

  hw/i386/vmmouse: Require 'i8042' property to be set (2021-12-18 10:57:37 +0100)

----------------------------------------------------------------
* configure and meson cleanups and fixes
* remove unnecessary #ifdef
* SCSI and i386 fixes

----------------------------------------------------------------
Paolo Bonzini (12):
      configure: make $targetos lowercase, use windows instead of MINGW32
      configure: move target detection before CPU detection
      configure: unify two case statements on $cpu
      configure: unify ppc64 and ppc64le
      configure: unify x86_64 and x32
      meson: rename "arch" variable
      configure, meson: move ARCH to meson.build
      configure: remove unnecessary symlinks
      configure: remove DIRS
      meson: reenable test-fdmon-epoll
      cpu: remove unnecessary #ifdef CONFIG_TCG
      meson: add "check" argument to run_command

Philippe Mathieu-Daudé (4):
      hw/scsi: Fix scsi_bus_init_named() docstring
      hw/scsi/megasas: Fails command if SGL buffer overflows
      tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521
      hw/i386/vmmouse: Require 'i8042' property to be set

 configure                       | 253 +++++++++++++++++-----------------------
 cpu.c                           |   5 -
 docs/meson.build                |   6 +-
 hw/i386/vmmouse.c               |   4 +
 hw/scsi/megasas.c               |   1 +
 include/exec/cpu-all.h          |   2 -
 include/hw/scsi/scsi.h          |   2 +-
 meson.build                     |  39 ++++---
 pc-bios/meson.build             |   2 +-
 tests/qtest/fuzz-megasas-test.c |  30 +++++
 tests/tcg/configure.sh          |   4 +-
 tests/unit/meson.build          |   2 +-
 12 files changed, 173 insertions(+), 177 deletions(-)
-- 
2.33.1



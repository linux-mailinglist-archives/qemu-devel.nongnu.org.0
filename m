Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15AF4C7787
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:22:40 +0100 (CET)
Received: from localhost ([::1]:46664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkfP-0001fk-RJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUu-00084f-VY
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:49 -0500
Received: from [2607:f8b0:4864:20::136] (port=38679
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUp-0006WJ-CG
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:48 -0500
Received: by mail-il1-x136.google.com with SMTP id w4so10648492ilj.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lLe7r4PKkdGdKbGPBXEhUvCMgN4fDYLd8OL6a0xHwU=;
 b=EJ/Uw79+meF8xbNEMITfCTh3Rkkf3BbW9LMlUXTtBZj/YM4IOx/cnHl7h76wXRDUuU
 aOsLjpcq4vXbVYN2mxLJuYHqj4POEhxkk81KBSeyzCc1Cnxn4XMFcS5O6BBi80ORxOWE
 70trY9Stlcxh6jHEPtrAJQCk737wBqOZZAHg1zmde4qtBHzDtV+AVuWp1YQND8CCRz7c
 GvjDfAhT1swOdGrN2GlOnAsftE4wmBZwKFmGsvZUAH5i/6YTA5lD1szFqjx5h65ln/jn
 +M0ADnZ3XponwPPGgWhV51vxyyDj0iywSgopoVG8NOL3XhvBXuFQQ7g6TjZ8uQGLHAgt
 VVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lLe7r4PKkdGdKbGPBXEhUvCMgN4fDYLd8OL6a0xHwU=;
 b=dx8NHk+X7iQRg5kwAG3crwDW2xuVCktkDc5GBNpAQnfwsBJHGuF0sSwhosDH5DSsHL
 r91AnWUM4tDgTmSG08R2kcA1rzictB/tyG0uH+rdDve0uKuAAksGbmlGq9okiecuiVOS
 WBLWYhay6604yy+yqQo5sSv9mMrGPu1LXK5g6AeOIjl5o+IBecxpXVQPljIqdC0Lgh5M
 FNgd+3XjcUAljqlj9vjhNNB1x8VS8qyMtvFBo7lhXng+bO0VKG2UNhc80DsZ4b/B/Xi+
 MsMTffaY1IsfdtvFF3jpLvY5yjpr5NWq3havrp3ds16LCzTeLjpCP+IbuHv9y60yI1x7
 ZEbQ==
X-Gm-Message-State: AOAM532QgIG3OCNsCgJvYUDbw+XWQ3KXLZbmMr25Le+npiFKdTN2LvVs
 kbf3i+PpxlpBMiN5hE+DwQrBLWZI0XEUkA==
X-Google-Smtp-Source: ABdhPJwJMFVcYOAFzJkNDFtfzzfk3C8OhOPbZhz1c0v59d4AY7N+ukjVeMi9efmliA3I3CsAoNdl3w==
X-Received: by 2002:a05:6e02:19cf:b0:2c2:8a8c:f56f with SMTP id
 r15-20020a056e0219cf00b002c28a8cf56fmr19352982ill.11.1646071901427; 
 Mon, 28 Feb 2022 10:11:41 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] Bsd user preen 2022q1 patches
Date: Mon, 28 Feb 2022 11:11:58 -0700
Message-Id: <20220228181214.2602-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/bsd-user-preen-2022q1-pull-request

for you to fetch changes up to a5b8816636ebd7665d96122c5568192e04c5a888:

  bsd-user: Add safe system call macros (2022-02-26 21:05:21 -0700)

----------------------------------------------------------------
bsd-user: Prepare for future upstream of system calls.

This series of patches does three things.

First, it starts to give up on the idea that you can run FooBSD binaries on
BarBSD. They are too different to make that happen any time soon, though I've
kept the support for Net/OpenBSD, even though they haven't built. We'll need a
lot of work to make that happen, though, and I need to simplify to get things
upstream.

Second, it starts to move some of the ifdef trees into target.h.

Third, it starts to upstream bsd-file.h, but the remainder of the file in the
bsd-user fork had some issues that will be resolved before next quarter's
update.

----------------------------------------------------------------

Warner Losh (16):
  bsd-user/main.c: Drop syscall flavor arg -bsd
  bsd-user/x86_64/target_arch_cpu.h: int $80 never was a BSD system call
    on amd64
  bsd-user/x86_64/target_arch_cpu.h: Remove openbsd syscall
  bsd-user/i386/target_arch_cpu.h: Remove openbsd syscall
  bsd-user/arm/target_arch_cpu.h: Only support FreeBSD sys calls
  bsd-user/arm/target_arch_thread.h: Assume a FreeBSD target
  bsd-user/x86_64/target_arch_thread.h: Assume a FreeBSD target
  bsd-user: Remove bsd_type
  bsd-user/freebsd/os-syscall.c: Move syscall processing here
  bsd-user: Move system call building to os-syscall.c
  bsd-user/sycall.c: Now obsolete, remove
  bsd-user/freebsd/os-syscall.c: Add get_errno and host_to_target_errno
  bsd-user/bsd-file.h: Implementation details for the filesystem calls
  bsd-user: introduce target.h
  bsd-user: Define target_arg64
  bsd-user: Add safe system call macros

 bsd-user/arm/target.h                |  21 ++
 bsd-user/arm/target_arch_cpu.h       | 139 ++++----
 bsd-user/arm/target_arch_thread.h    |   4 +-
 bsd-user/bsd-file.h                  |  30 ++
 bsd-user/freebsd/meson.build         |   1 +
 bsd-user/freebsd/os-syscall.c        |  92 +++++
 bsd-user/i386/target.h               |  21 ++
 bsd-user/i386/target_arch_cpu.h      |  84 ++---
 bsd-user/main.c                      |  14 -
 bsd-user/meson.build                 |   1 -
 bsd-user/qemu.h                      |  24 +-
 bsd-user/syscall.c                   | 516 ---------------------------
 bsd-user/syscall_defs.h              |  47 +++
 bsd-user/x86_64/target.h             |  21 ++
 bsd-user/x86_64/target_arch_cpu.h    |  85 +----
 bsd-user/x86_64/target_arch_thread.h |   4 +-
 16 files changed, 362 insertions(+), 742 deletions(-)
 create mode 100644 bsd-user/arm/target.h
 create mode 100644 bsd-user/bsd-file.h
 create mode 100644 bsd-user/freebsd/os-syscall.c
 create mode 100644 bsd-user/i386/target.h
 delete mode 100644 bsd-user/syscall.c
 create mode 100644 bsd-user/x86_64/target.h

-- 
2.33.1



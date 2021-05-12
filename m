Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620B37CEFD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:26:27 +0200 (CEST)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgscs-0002hR-2a
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUH-0006zu-BZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:33 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUE-0008G5-SY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:33 -0400
Received: by mail-io1-xd36.google.com with SMTP id z24so22425590ioj.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u9Nxu8HC0qcCp6GbZrO8NGZAy8juOzXwTelo6GKVH+g=;
 b=isGWoAsjiw+X++O0wzE4pxqYAIgGQ9jh0nh3QaQiRV1cox2QZveqgkuR4m0qCOA7Uc
 dISoHwaLDWJX+Q+OJzvvKGz7HK2eiYCO2ekIUkzKfaCxFYxy5SHrGjx+bFzaYCeZEj9i
 Q2xAcxqF7sosL9L7ndNHz4ubgkxfTai1eaLj3FvXCrqSjsGxpiTv01KlS3+uFD/NW+8O
 PqC1ugVJn2UnQRKW9mk7hAvRSeGO14E0925eWM86h+O4+nlpyYg3iRrdZ3tyVpc/Midz
 Xf3MWvN6vBlAp5+uCfUJXqb8K35LgRy3+P97OGTqfufjruU2zvZi2mt4KuMyRUyIkeNa
 Iv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u9Nxu8HC0qcCp6GbZrO8NGZAy8juOzXwTelo6GKVH+g=;
 b=dUS+vKEXCJfnJ2qHjK06YmmMWEjmFTIAT+rHKHZevxX7cOHavIJCvxJGxoFrsbL8Q1
 rGPvvi10UUU2ZVc8lHQQThjD1rAI29hINPIRrScRrWF3cnJu5RmK5FGo5nJD8vWAPGWK
 Luw4UkY9xGlQTk1pIEeYRjSGcLF6jdEfs12e7YM2P328t2dCtsDsjHHer+kV48ZvAgEb
 Y/ZztD+19/VlL1ieOjqWl4ySav0lDyEj5WZ7OcHIuYGYYYELjp/0AaKiQbFLrThYswfA
 sbPeIlUDQxkUtAy658+PRh/SM0N1igdMar/D2tSWmD+nELc2LjIGpDmBzyxM4dmmZT5C
 gEKQ==
X-Gm-Message-State: AOAM530Iz0ful/qsdum3cQpzRoquRrlh2Elr3k0dFCJCQAG4kWAYVP7h
 SfERuOcQMWQWbvoTmiqadnCKPpyq+WyaVA==
X-Google-Smtp-Source: ABdhPJy0UEYGAR0AH7//QpSyiu+EZJS/4EJrfBihHW2tx6QTEc1mCxjLZ+fK4wMQvBN3m7JAOKCmsw==
X-Received: by 2002:a6b:156:: with SMTP id 83mr6498287iob.22.1620839848040;
 Wed, 12 May 2021 10:17:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] bsd-user style tweaks and start cleanup
Date: Wed, 12 May 2021 11:17:00 -0600
Message-Id: <20210512171720.46744-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f9a576a818044133f8564e0d243ebd97df0b3280:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210506' into staging (2021-05-11 13:03:44 +0100)

are available in the Git repository at:

  https://gitlab.com/bsdimp/qemu.git tags/pull-bsd-user-20210511

for you to fetch changes up to afcbcff80bf81a3399e24c7908b17776e1489df9:

  bsd-user: rename linux_binprm to bsd_binprm (2021-05-11 13:53:52 -0600)

----------------------------------------------------------------

pull-bsd-user-20210511 is the next round of cleanups to bsd-user in merging the
bsd-user fork into qemu. It contains a number of style commits, as well as 3
commits that start to change things: Some unused files are deleted, building the
sparc and sparc64 targets are removed, and a structure is renamed.

The next set of pull requests will start to execute the following plan:
1. Move existing code around to have a structure similar to the bsd-user fork.
2. Incrementally merge groups of system calls, focused on making x86 work.
3. Once the groups of system calls are all merged, additional platforms will
   be added back.
4. Concurrently, as changes are requested as part of the merge happen, those
   changes will be merged into the fork.
5. Eventually, there will be no diference, and the bsd-user fork will only
   be a staging area for cutting-edge features prior to upstreaming into
   qemu mainline.

The bsd-user code in qemu has a lot of style issues. This cleans up a number in
the files touched. However, the checkpatch.pl detects some incremental issues in
the commits. The following are expected, but are corrected in later hashes in
this branch. MAINTAINERS does not need to be updated, since all the files added
or deleted are covered under existing regexp in MAINTAINERS.

Checking all commits since f9a576a818044133f8564e0d243ebd97df0b3280...
d60c3b932e2fa06aba5d7aa1c451b5d287095dc8:101: ERROR: consider using qemu_strtol in preference to strtol
d60c3b932e2fa06aba5d7aa1c451b5d287095dc8:142: ERROR: braces {} are necessary for all arms of this statement
d60c3b932e2fa06aba5d7aa1c451b5d287095dc8:145: ERROR: braces {} are necessary for all arms of this statement
total: 3 errors, 0 warnings, 119 lines checked
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:148: WARNING: line over 80 characters
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:330: ERROR: braces {} are necessary for all arms of this statement
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:340: ERROR: braces {} are necessary for all arms of this statement
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:381: ERROR: space prohibited between function name and open parenthesis '('
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:390: ERROR: spaces required around that '<' (ctx:VxV)
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:408: WARNING: Block comments use a leading /* on a separate line
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:409: WARNING: Block comments use * on subsequent lines
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:409: WARNING: Block comments use a trailing */ on a separate line
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:441: WARNING: line over 80 characters
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:445: WARNING: line over 80 characters
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:502: ERROR: line over 90 characters
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:551: ERROR: space required after that ',' (ctx:VxV)
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:552: ERROR: space required after that ',' (ctx:VxV)
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:587: ERROR: space required after that ';' (ctx:VxV)
b4bebeee1dee8d333bfa105a6c28fec5eb34b147:623: ERROR: suspect code indent for conditional statements (12, 14)
total: 9 errors, 6 warnings, 664 lines checked
86545e7afe3f822b8561c7ceee7540fc3b19c3f0:31: ERROR: space required after that ';' (ctx:VxV)
86545e7afe3f822b8561c7ceee7540fc3b19c3f0:40: ERROR: space required after that ';' (ctx:VxV)
total: 2 errors, 0 warnings, 60 lines checked
Use of uninitialized value $acpi_testexpected in string eq at scripts/checkpatch.pl line 1529.
65d58c91ef1a15ad945ece367983437576f8e82b:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
total: 0 errors, 1 warnings, 14 lines checked
Use of uninitialized value $acpi_testexpected in string eq at scripts/checkpatch.pl line 1529.
f8ce39701b5be032fb3f9c05e8adb4055f70eec2:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
total: 0 errors, 1 warnings, 0 lines checked
   FAIL one or more commits failed scripts/checkpatch.pl
Cleaning up file based variables
ERROR: Job failed: exit code 1

Warner Losh (20):
      bsd-user: whitespace changes
      bsd-user: style tweak: use C not C++ comments
      bsd-user: style tweak: Remove #if 0'd code
      bsd-user: style tweak: Use preferred block comments
      bsd-user: Remove commented out code
      bsd-user: style tweak: move extern to header file
      bsd-user: style tweak: remove spacing after '*' and add after }
      bsd-user: style tweak: Use preferred block comments
      bsd-user: style tweak: don't assign in if statements
      bsd-user: style tweak: use {} for all if statements, format else correctly
      bsd-user: style tweak: use {} consistently in for / if / else statements
      bsd-user: use qemu_strtoul in preference to strtol
      bsd-user: whitespace changes
      bsd-user: style tweak: keyword space (
      bsd-user: style tweak: keyword space (
      bsd-user: style tweak: Remove #if 0'd code
      bsd-user: style tweak: keyword space (
      bsd-user: remove target_signal.h, it's unused
      bsd-user: Stop building the sparc targets
      bsd-user: rename linux_binprm to bsd_binprm

 bsd-user/bsdload.c                           |   4 +-
 bsd-user/elfload.c                           | 328 +++++++++++++--------------
 bsd-user/i386/target_signal.h                |  20 --
 bsd-user/main.c                              | 290 ++++++++---------------
 bsd-user/mmap.c                              |  22 +-
 bsd-user/qemu.h                              | 127 ++++++-----
 bsd-user/signal.c                            |   1 -
 bsd-user/sparc/target_signal.h               |  27 ---
 bsd-user/sparc64/target_signal.h             |  27 ---
 bsd-user/strace.c                            |   8 -
 bsd-user/syscall.c                           |  18 +-
 bsd-user/uaccess.c                           |   2 +-
 bsd-user/x86_64/target_signal.h              |  19 --
 default-configs/targets/sparc-bsd-user.mak   |   3 -
 default-configs/targets/sparc64-bsd-user.mak |   4 -
 15 files changed, 348 insertions(+), 552 deletions(-)
 delete mode 100644 bsd-user/i386/target_signal.h
 delete mode 100644 bsd-user/sparc/target_signal.h
 delete mode 100644 bsd-user/sparc64/target_signal.h
 delete mode 100644 bsd-user/x86_64/target_signal.h
 delete mode 100644 default-configs/targets/sparc-bsd-user.mak
 delete mode 100644 default-configs/targets/sparc64-bsd-user.mak

-- 
2.22.1



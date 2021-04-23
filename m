Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF0369B6D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:40:58 +0200 (CEST)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2bh-0005Qq-Gh
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aA-0004V8-RA
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:22 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2a8-0007el-BY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:22 -0400
Received: by mail-oi1-x235.google.com with SMTP id u80so16787975oia.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vf34mZ3riq9FeL+s+KZ75uaL1iX0ckHHtv7W0zO1FO0=;
 b=nc0nFCGSDCzPqGDMDplUi9SE625QgmBYhNCecJqPOg1PY8XXoueIaPzSmgCgtVedMX
 CmdsjiaiXqBmNog776fyiXsyZSS5IGXURTIsV44L8SJTbwalOXs/TL1ST2AZAagPMn6U
 sNDEedzskBIbwsl1+KYhGOBCk7K5DFcQuOXtbGvcyXoWqWseHBnf61D291TS10CpZjb3
 DsU4W3kcpTHFQ7sdIEmVOUDaErrfnpZ+laOx7yUisA4fkU/wVEd2ly7JnCLmzYWhvkNu
 yeYdS0oswvaosusjXQCS021jj/1KboNbV0igDg59kNqot4Px0UbRtXaYArOCz4iQdSEF
 94gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vf34mZ3riq9FeL+s+KZ75uaL1iX0ckHHtv7W0zO1FO0=;
 b=S4Vc5thBMA1oEkR5Up45QiOkl/YY/Jq/CCfr/01YsCcX9vhofU+2uljuHANRCyOu5Q
 f17uWoK4ARv254/Z6MkjntobZsMmEvW5+6thIgiyoCimuX81EjMUmlE+BiqgmwFd5Ht6
 FaDoViksEtAmqaanrKJeSWSk4LIe1RUfU5SAdvrGOztRt6qnmPdIVQz9QE2TKtJ28Zlh
 uR/PcnBkOAx69g6DcYv4ThdJ0TapdZi3c78wBpGjFbpXGpCG05QIRP7Y8XKTaGzZhRxA
 3E5k3XpgOAsrjrkIpegz/QXer5hePcDF8KXgp4urUwveTS/iEwfu6MwpNHkOPVREISdY
 AOTg==
X-Gm-Message-State: AOAM531v0uh2MJ7r9rL2yrxhe4EiiFGUnJGyceIh7lOxG2MclBwBO5aS
 jXUcSvptIO8MUFJFxfnqMP0CEHxVGeRcrkG3
X-Google-Smtp-Source: ABdhPJzV7KZGUP02XxwNiaQ31wtGiMfJODq41c+M89jaQZs1P84wWujfosqC2Xwwj7NZMwBrVW/v0w==
X-Received: by 2002:aca:fd57:: with SMTP id b84mr5210601oii.81.1619210358059; 
 Fri, 23 Apr 2021 13:39:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x45sm1676206otr.35.2021.04.23.13.39.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:17 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] bsd-user style and reorg patches
Date: Fri, 23 Apr 2021 14:39:03 -0600
Message-Id: <20210423203903.78183-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::235;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x235.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Greetings,

This series starts to cleanup bsd-user. The current checkpatch.pl output is on
the order of 4500 lines long. These cleanups don't fix everything (there's still
plenty of errors, even in some of the files the patches touch). I've tried to
make things better in every case, but be advised that checkpatch.pl is unhappy
with many of the files still in the first 15 commits. I do plan on addressing
the issues in the future as I need to make real commits to those files. The
changes were ones that were trivial to do with scripts that I had to do for
main.c anyway. main.c is now completely clean. All the cleanup I've done
myself, and at the end of this patch trail the output is only 3500 lines...

Next, I've started to reorg the bsd-user sources. There's really 4 BSDs in the
wild (FreeBSD, NetBSD, OpenBSD and Dragonfly) that these could, in theory,
target. In the bsd-user branch, we've broken the emulation of these apart. It
largely preserves the other BSD's as is, and greatly expands FreeBSD so that we
can do package builds in user-land emulation. The other BSDs have not been
run-time tested, though the CI tooling builds some of them. It's my belief that
in the current state, even an old-school cat(1) would fail, though I am to fix
that at least for FreeBSD...

We've also added a number of other architectures than sparc and i386. Those
additions, though, are dependent on other things not yet reshuffled and or
merged, so they will be coming along in due time: mips (32 and 64 bit), arm,
aarch64 and riscv willl come in due time. powerpc might, but it's in a frightful
state. I'm open to other BSDs that wish to work along with me as well, though it
may be best to wait until after future patch sets as much is still set to
change. CHERI and related work may also happen, but that's still TBD.

In this installement, after the style stuff, I've created a
target_arch_cpu.h. Here, all the functions related to the cpu loop and similar
things are moved into there on a per-architecture basis to start to tame the
number of #ifdefs in mail. Linux-user did a similar thing years after we had
done it in the repo, and a number of different choices were made. Rather than
redo all the work from the bsd-user repo, I'm recreating / rebasing it on a
current qemu. Future patch series will address other aspects. Once they are
complete, we can look, potentially, at any refactoring between linux-user and
bsd-user. I very much explicitly want to push that to the end because otherwise
I'm completely recreating a lot of the work on the bsd-user branch rather than
just transitioning it forward to a newer qemu. This reorg was started by Stacey
Son and I've redone it with the latest code. I've added his signoff (with his
blanket permission) to those commits. Also, all of these commits pass
checkpatch.pl

Please let me know what you think, and how I might structure future patches if
there's ways I can do them better. I've switched to pull-requests with this series
since it will be easier to keep track of, especially in the future.

Warner

P.S. This has no relevance to 6.0 at all: we're too late and this feature
isn't fully integrated by this patch trail.

The following changes since commit 9950da284fa5e2ea9ab57d87e05b693fb60c79ce:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210322-2' into staging (2021-03-23 15:30:46 +0000)

are available in the Git repository at:

  https://gitlab.com/bsdimp/qemu.git tags/pull-request-2021-04-23

for you to fetch changes up to cc6e9793094f5207509bb74b90854a89195d22db:

  bsd-user: move sparc cpu_loop into target_arch_cpu.h as target_cpu_loop (2021-04-23 13:13:13 -0600)

----------------------------------------------------------------
April 23, 2021 bsd-user	update

Style changes to reduce	checkpatch whinage (much more needed as only some issues
globally and all issues	in main.c have been address, other files need much love).

Start to reorg so we can bring in all the work from the	bsd-user repo.

----------------------------------------------------------------
Warner Losh (24):
  bsd-user: whitespace changes
  bsd-user: whitespace changes
  bsd-user: whitespace changes
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: keyword space (
  bsd-user: style tweak: use C not C++ comments
  bsd-user: style tweak: use C not C++ comments
  bsd-user: style tweak: use C not C++ comments
  bsd-user: style tweak: if 0 -> ifdef notyet for code needed in future
  bsd-user: style tweak: if 0 -> ifdef notyet for code needed in future
  bsd-user: style tweak: if 0 -> ifdef notyet for code needed in future
  bsd-user: style tweak: if 0 -> ifdef notyet for code needed in future
  bsd-user: Fix commentary issues
  bsd-user: Use preferred block comments
  bsd-user: move extern to header file
  bsd-user: style changes for {}
  bsd-user: use qemu_strtol in preference to strtol
  bsd-user: introduce host_os.h for bsd-specific code and defaults
  bsd-user: add arm target_signal.h
  bsd-user: create target_arch_cpu.h
  bsd-user: move x86 (i386 and x86_64) cpu_loop to target_arch_cpu.h
  bsd-user: move sparc cpu_loop into target_arch_cpu.h as
    target_cpu_loop

 bsd-user/arm/target_arch_cpu.h     |  22 +
 bsd-user/arm/target_signal.h       |  31 ++
 bsd-user/bsd-mman.h                |  42 +-
 bsd-user/bsdload.c                 |  26 +-
 bsd-user/elfload.c                 | 334 +++++++--------
 bsd-user/freebsd/host_os.h         |  25 ++
 bsd-user/i386/target_arch_cpu.h    | 305 ++++++++++++++
 bsd-user/main.c                    | 651 +++--------------------------
 bsd-user/mmap.c                    |  22 +-
 bsd-user/netbsd/host_os.h          |  25 ++
 bsd-user/openbsd/host_os.h         |  25 ++
 bsd-user/qemu.h                    |  16 +-
 bsd-user/sparc/target_arch_cpu.h   | 322 ++++++++++++++
 bsd-user/sparc64/target_arch_cpu.h |  19 +
 bsd-user/strace.c                  |   2 +-
 bsd-user/syscall.c                 |  18 +-
 bsd-user/uaccess.c                 |   2 +-
 bsd-user/x86_64/target_arch_cpu.h  |  19 +
 bsd-user/x86_64/target_syscall.h   |   2 +-
 19 files changed, 1081 insertions(+), 827 deletions(-)
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/arm/target_signal.h
 create mode 100644 bsd-user/freebsd/host_os.h
 create mode 100644 bsd-user/i386/target_arch_cpu.h
 create mode 100644 bsd-user/netbsd/host_os.h
 create mode 100644 bsd-user/openbsd/host_os.h
 create mode 100644 bsd-user/sparc/target_arch_cpu.h
 create mode 100644 bsd-user/sparc64/target_arch_cpu.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.h

-- 
2.22.1



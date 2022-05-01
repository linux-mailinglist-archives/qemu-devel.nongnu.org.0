Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE3516495
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 15:23:35 +0200 (CEST)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl9Xy-0008Eq-Pa
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 09:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <063c75db2e03938b2fadb052c4661adae36e352c@lizzy.crudebyte.com>)
 id 1nl9SI-00012c-Tz
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:17:44 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <063c75db2e03938b2fadb052c4661adae36e352c@lizzy.crudebyte.com>)
 id 1nl9S6-0005G5-5Y
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=Pip1ufG09bjL7k/DwWDje4Bd5BZlqJ6Tu2fW6CrT+y4=; b=TkRjo
 Hyo/9LPfDU/3qZCi+UjZRUEB7W4K7MsHEghopq2UsK7+CdK7QvKsKcQQrwkW2am2tw+Na9/J+UlfZ
 xeNzFVQrl/zrrhxkGQoGzIMzTxEkx1z781EUBLjdgjzMuWhlu8A+OQz0nQ0aIGe+V5CvczZsAGSaB
 r4nEuolaYnxixjEP9SVWA+oz55LYjK3P2qEBrbJMgXzBAU0+ypFLFYzLcJIUmRVZPXjMRwfDttNVC
 10A8ADNuy+NxqyylsJR86aLTNNbPYpm/9TrBXX3WKPtJG/9D7BLeZNrNGeEaTjb/sghWIzzD+TnU5
 CiBe3rJIgBAfhYVQ9Gs/8vXrHQWEw==;
Message-Id: <cover.1651410615.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 01 May 2022 15:10:16 +0200
Subject: [PULL v2 0/7] 9p queue 2022-05-01 (previous 2022-04-30)
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=063c75db2e03938b2fadb052c4661adae36e352c@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:

  Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220501

for you to fetch changes up to 063c75db2e03938b2fadb052c4661adae36e352c:

  9pfs: fix qemu_mknodat() to always return -1 on error on macOS host (2022-05-01 14:07:03 +0200)

----------------------------------------------------------------
9pfs: various fixes

* macOS: Fix recently (in QEMU 7.0) added 9p support for macOS hosts.

* Tests: Fix inode sequencing in 'synth' driver.

----------------------------------------------------------------
Christian Schoenebeck (7):
      9pfs: fix inode sequencing in 'synth' driver
      9pfs: fix qemu_mknodat(S_IFREG) on macOS
      9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
      9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
      9pfs: fix wrong errno being sent to Linux client on macOS host
      9pfs: fix removing non-existent POSIX ACL xattr on macOS host
      9pfs: fix qemu_mknodat() to always return -1 on error on macOS host

 hw/9pfs/9p-posix-acl.c   | 12 +++++++--
 hw/9pfs/9p-synth.c       |  4 +--
 hw/9pfs/9p-util-darwin.c | 54 +++++++++++++++++++++++++++++++++++--
 hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c             |  4 ++-
 5 files changed, 136 insertions(+), 7 deletions(-)


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DCD515C93
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 13:56:36 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkliE-0004Ee-4m
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 07:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e8fb9ed725fe2ed00a275674a84beb5ba6e538a7@lizzy.crudebyte.com>)
 id 1nklfe-0002Tk-3w
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 07:53:54 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e8fb9ed725fe2ed00a275674a84beb5ba6e538a7@lizzy.crudebyte.com>)
 id 1nklfc-0007IB-BT
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 07:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=TlUq2p7/5dZ7G8+iW8GVv1PRYiv/kThu4XVAG2tdrpI=; b=mBvrh
 5s5tCykewpbJIa3Ir8jmbeHx49Pu2kz6B6m3qulT/UByDjYTVwn1njP+QxYNjZ+wToI9PDdTCWvGt
 uzXXWJqymPZTMmMn/yp/hWVTd0li5GjT8Rk8O4wlCiyXbcHi0PDAffUL/q2nclU7rQhQQC8B2m+AL
 mXErerb2EKYXOEf+0NUnRIiHWAvt0kFSzdIIzpcEHceZq6I3BIbuae5pzDR09nUagbmAkvPG2bXa9
 zOFpH31iW/NBZGqUXXKU+CYTXQl9OsJ7uyCIuKwWWF8SAgdOxb3VSiR3nkgfl5g2fFVl/rCvDjtoB
 f9l/hGSm2XLJEOjGrbfT0cPrtE/aQ==;
Message-Id: <cover.1651319081.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 30 Apr 2022 13:44:42 +0200
Subject: [PULL 0/7] 9p queue 2022-04-30
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e8fb9ed725fe2ed00a275674a84beb5ba6e538a7@lizzy.crudebyte.com;
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

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220430

for you to fetch changes up to e8fb9ed725fe2ed00a275674a84beb5ba6e538a7:

  9pfs: fix qemu_mknodat() to always return -1 on error on macOS host (2022-04-30 13:11:48 +0200)

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


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE124CD56A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:46:52 +0100 (CET)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Gh-0000kc-Vp
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <39edfe337c418995b2932a9a14a612fb0c329dc5@lizzy.crudebyte.com>)
 id 1nQ7r6-00057x-2a
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:20:25 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <39edfe337c418995b2932a9a14a612fb0c329dc5@lizzy.crudebyte.com>)
 id 1nQ7r3-0000qW-C9
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=Ecg+BkDcL9Ts4aGsF13kdRip6OlHmOvp8Nk/EdKkiS8=; b=NeA+V
 jJvQ9PGaYI1uPB3IX4YKZPt01yMNnNnsc/o2c7LtAVFDiZ5bkqMh/aBVuboCMVeWjO6KKdqfe0u0J
 lG9wYN/KparMBa/2jpaMPDSkwvml8jrpd+mmKI7AY8VWm9mFM/xntRkpvMFEwUgBBHGrV/Vztqvlp
 W5qbA8sriTqtGIza3O5MJyre3dcmebk+drl3f0hoY8uoh+7KgfYcEOr57HnKnd1ur8A9HXca7eRIh
 OtfHkf9VypYaSaM/ANL8lnrOIhA2FqaZ8Fi9h3j2swOq4tGsENeimtEtX+xTGyUHG3OynTOoPpmkn
 b/3WYCeTWzkcFebL2MbGhuVNgt6ag==;
Message-Id: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 00/19] 9p queue 2022-03-04
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=39edfe337c418995b2932a9a14a612fb0c329dc5@lizzy.crudebyte.com;
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

The following changes since commit 5959ef7d431ffd02db112209cf55e47b677256fd:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220303' into staging (2022-03-03 19:59:38 +0000)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220304

for you to fetch changes up to 39edfe337c418995b2932a9a14a612fb0c329dc5:

  fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-04 13:07:39 +0100)

----------------------------------------------------------------
9pfs: introduce macOS host support and cleanup

* Add support for Darwin (a.k.a. macOS) hosts.

* Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).

* API doc cleanup (convert Doxygen -> kerneldoc format).

----------------------------------------------------------------
Christian Schoenebeck (8):
      9pfs: move qemu_dirent_dup() from osdep -> 9p-util
      9pfs: drop Doxygen format from qemu_dirent_dup() API comment
      9pfs/9p.h: convert Doxygen -> kerneldoc format
      9pfs/codir.c: convert Doxygen -> kerneldoc format
      9pfs/9p.c: convert Doxygen -> kerneldoc format
      9pfs/9p-util.h: convert Doxygen -> kerneldoc format
      9pfs/coth.h: drop Doxygen format on v9fs_co_run_in_worker()
      fsdev/p9array.h: convert Doxygen -> kerneldoc format

Keno Fischer (10):
      9p: linux: Fix a couple Linux assumptions
      9p: Rename 9p-util -> 9p-util-linux
      9p: darwin: Handle struct stat(fs) differences
      9p: darwin: Handle struct dirent differences
      9p: darwin: Ignore O_{NOATIME, DIRECT}
      9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
      9p: darwin: *xattr_nofollow implementations
      9p: darwin: Compatibility for f/l*xattr
      9p: darwin: Implement compatibility for mknodat
      9p: darwin: meson: Allow VirtFS on Darwin

Will Cohen (1):
      9p: darwin: Adjust assumption on virtio-9p-test

 fsdev/file-op-9p.h                     |   9 ++-
 fsdev/meson.build                      |   1 +
 fsdev/p9array.h                        |  38 ++++++------
 hw/9pfs/9p-local.c                     |  27 +++++++--
 hw/9pfs/9p-proxy.c                     |  38 +++++++++++-
 hw/9pfs/9p-synth.c                     |   6 ++
 hw/9pfs/9p-util-darwin.c               |  97 ++++++++++++++++++++++++++++++
 hw/9pfs/{9p-util.c => 9p-util-linux.c} |   8 ++-
 hw/9pfs/9p-util.h                      |  76 ++++++++++++++++++++++++
 hw/9pfs/9p.c                           | 104 ++++++++++++++++++++++-----------
 hw/9pfs/9p.h                           |  30 ++++++++--
 hw/9pfs/codir.c                        |  34 ++++++-----
 hw/9pfs/coth.h                         |   4 +-
 hw/9pfs/meson.build                    |   3 +-
 include/qemu/osdep.h                   |  13 -----
 include/qemu/xattr.h                   |   4 +-
 meson.build                            |  13 +++--
 tests/qtest/virtio-9p-test.c           |   2 +-
 util/osdep.c                           |  21 -------
 19 files changed, 401 insertions(+), 127 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)


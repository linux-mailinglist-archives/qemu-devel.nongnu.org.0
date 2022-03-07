Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C484CFDF8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:17:40 +0100 (CET)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCJ1-0004BE-Fx
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <35b6466459f9234b9cb30296f243a70b6f1b44b7@lizzy.crudebyte.com>)
 id 1nRBmP-0002Tc-7P
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:43:57 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:53379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <35b6466459f9234b9cb30296f243a70b6f1b44b7@lizzy.crudebyte.com>)
 id 1nRBmN-00029D-JY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=KAD5TkEn+eLXMzOllwRgusc1JeI1lqYqQiKHjgzGSWM=; b=aRQlm
 ocsbhCfVjdmsmKv/HInY/5wuKTN2wB4MGOaI+MczZjRyTX53CrLoVoLts7nDSwCPV3YnOTpKYV4KY
 90JPNTENRjzrsZVP7j3vAmVeUGCFS1ysmfPwyhYU9sB/6P5kgTCnfvK7V1qtcHke9tjCWCojgM+11
 UcVjhJYefs0v3ePClegufdMNvQ14N4+SFSEjiv4rooLcd1eRrvOvg9z3ZO99yU4I8QPzeA2rAs+JW
 6NlWmOBEAly/AAozrOwxedp/D2V/xK3z8+18IUziw3WNjeWIFfAx2QFPNMXrnXcFpOmL6U/tIsPtq
 yy89AfhcBBBxN30y2TYDwGelXxK3g==;
Message-Id: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 00/19] 9p queue 2022-03-07 (previous 2022-03-04)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=35b6466459f9234b9cb30296f243a70b6f1b44b7@lizzy.crudebyte.com;
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

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220307

for you to fetch changes up to 35b6466459f9234b9cb30296f243a70b6f1b44b7:

  fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-07 11:49:31 +0100)

----------------------------------------------------------------
9pfs: introduce macOS host support and cleanup

* Add support for Darwin (a.k.a. macOS) hosts.

* Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).

* API doc cleanup (convert Doxygen -> kerneldoc format).

----------------------------------------------------------------
v1 -> v2:
  - Fix compiler warning "unused label 'again'" [patch 5].

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
 hw/9pfs/9p-util.h                      |  78 +++++++++++++++++++++++++
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
 19 files changed, 403 insertions(+), 127 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)


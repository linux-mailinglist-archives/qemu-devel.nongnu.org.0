Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C46BEAF9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAuU-0006Wp-2p; Fri, 17 Mar 2023 10:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuO-0006WC-Dt; Fri, 17 Mar 2023 10:18:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuM-0004t8-IN; Fri, 17 Mar 2023 10:18:16 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MpDVx-1qImmj0ZTj-00ql7J; Fri, 17
 Mar 2023 15:18:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/3] Trivial branch for 8.0 patches
Date: Fri, 17 Mar 2023 15:18:05 +0100
Message-Id: <20230317141808.826875-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LrgWGrO3jG4Os6eZUtHHUea7bQzbyGm34oquIGhYTbteK6V8XPn
 iOIiN/VXzmVdqj93vlJv1et726CZ/qc2yrSnoGuI8QZQYhUuR0AuO0xqSMkg3EpCBQf2jSa
 R+EKkprUGbaX096AaDZLt9Wn3EOiyhlA8Sz0hNUA3kKvjbh+hK+iF+oGUP3rxsKIjgYZBHL
 EjoJnRxlzmZ76feXd790Q==
UI-OutboundReport: notjunk:1;M01:P0:9SnXGM6ThRE=;/gzGBn3tbMWd1FGMzLG7h3kDHJz
 y2mhvOdBt6aLe20nswkZTatnDuOyXGcwh2Kgu1pPVRbps4FzAnkxXj6fzlBe00AyJJEmcg4BP
 CymkISmLNTTefzdlTqWsLAZP9V+LEnGypB2ew2tb57RjSCj+KrQKIiS08QuPI5DSoKYP9sTHH
 5Ubvr1/qXrSlMldJe64IlLi6HdFKh+ZFX2AXLhhAEuV/oRuh7nrRUlvL482MuUx6QsIxauilz
 +LGWIT+kQz+POXSbpGOVv+G9lvUS5Alvf1tJB9YKqJ5EEpNT5UF4D2IopuYR+0Cnn6FcsLQoh
 5gJ845ooynktSRSv9csEZnL9QXuc0IZHwiCEXz1VY4af+f8uE35mxFpDN80mUEAU0MsLSE9sr
 qnleK/9dJxTD0R2LgkAszAosd/HzF26xfUEUg3ezsYvmaDG5QLT4jeHTlTmtAFDRrzb5xegPb
 JMdDP0zCENSDU3cRbUESUsrSHbVzsuoiV+eU0IkM8r8gxQJu1EYmCT7QNaoG1RJecKXWuNBwN
 dO9RjZUxZKJ3NwuSbkHuucn+JSd4yB/l3xO1AC04QSJp+k22hvwcGjE1oNz2BElwzUtdm+C/j
 60gqROea8U1Zk7JShlfp9GE7ZG2wvlssl4eAOIvPYKF+GbqwIO9lwCDnuaAnO2VGp35FMvJ4G
 mecXq/37owY/9wjiEUm6W6M6jv0bPurHLNdE9jDeMA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 652737c8090eb3792f8b4c4b22ab12d7cc32073f:

  Update version for v8.0.0-rc0 release (2023-03-14 19:25:05 +0000)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-8.0-pull-request

for you to fetch changes up to 364206640c6b34bae3bb9e428817e51d23a794d0:

  docs/sphinx/kerneldoc.py: Honour --enable-werror (2023-03-16 14:39:10 +0100)

----------------------------------------------------------------
Trivial branch pull request 20230317

Fix doc
Fix sh4 cpu log output

----------------------------------------------------------------

Bernhard Beschow (1):
  exec/memory: Fix kernel-doc warning

Ilya Leoshkevich (1):
  target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu

Peter Maydell (1):
  docs/sphinx/kerneldoc.py: Honour --enable-werror

 docs/meson.build         |  2 +-
 docs/sphinx/kerneldoc.py |  5 +++++
 include/exec/memory.h    |  2 +-
 softmmu/memory.c         |  8 ++++----
 target/sh4/translate.c   | 14 +++++++-------
 5 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.39.2



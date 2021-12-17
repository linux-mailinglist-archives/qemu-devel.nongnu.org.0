Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90D479542
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:12:27 +0100 (CET)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJab-00006N-Pe
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:12:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYf-0005o9-BI; Fri, 17 Dec 2021 15:10:25 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:59017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYd-0001FZ-Gh; Fri, 17 Dec 2021 15:10:25 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N9Md2-1mSBk82YMe-015MdZ; Fri, 17
 Dec 2021 21:10:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Trivial branch for 7.0 patches
Date: Fri, 17 Dec 2021 21:10:10 +0100
Message-Id: <20211217201019.1652798-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iJL3Z6RukqQrjYj6Hm9jeyUPxOpUeWj2l6uNey/dPND/FU8TVPb
 0/QElQblkVExYA6kp1DrgcePUZuBpn8ODpP1RwOppGFPfP7E0SKbID+dTsv2TJpedGjWqlz
 G6BvMwqbS+6vcmTzp4NTY5f2yPfxAuQvIMlFtQ25xmjyDogj4rCkt2EEHWnyhEqQgLRWps6
 +MhupfNkWtOPAP74GorOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h1TASiOxzzM=:L4zkYzz7FHTUrct84upUVh
 R+4bhvJrHQGsQQLcH361c7mxSHL5gWVdxuAmdiIvDqO8hXKMU1adVwHHfV+i/XYGP9lQvubun
 fxsWVFK+PlfrAqp5Tt5LmryCb7y+TVREjcnU/Bn3lP9nRc9VrlPRf/oq1NPJhjVEzuUCopeZQ
 7Dq7HLL/2Xo23Zb7In+iv2SJi83iAw1vV5BI/KQe17qxqSJa0E5gSr2G67HbTELwxp05bEzYs
 5yAPiMnkXeHxOxu7smw0VBDqxRgiWrOwzKOAjXhzn+LlEC3KgpoAUyg6YelAv+Z4SzQ2OPXM5
 HyCbqdfivfWOy0wxTHkhCMuMscMHU6wmD3bfw9Q/79kBijLeWG6X0YasOod7drJv/j+9ZrIDt
 jXLYhr37SluxYX1uPx+sUp2aC5cyIJCE5KR/gdpVBYIm9M8x6YdEhxh++PkRHcjDxOvho2U9A
 F8uVM5/XaPzxtg7DwC68VKTtvdHR/mK8VrOY6THTn7AX3kGfP19qlA+l6qe/W+Uzv2zysOGQl
 PrLKJ2/U00r59bIyolL6rY2rriHhRMZChFZnCOs1EEtKmKU3TMPb4nKaSAOg16hGblQHRuQZJ
 5xfqtVkWxI7rXWI76gW9sIOoDB8iAz/8VME4qGj/R7IsGZt9qc3KhdKehp6nW2oleI9UWCM1S
 TmE/t/H2UUNhGGYghbFf95lOyZcJ/ewOwtbhnvro0kx4JqOpsKY9RBKNfV2tT5c/hbLA=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 29eb5c2c86f935b0e9700fad2ecfe8a32b011d57=
:=0D
=0D
  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging =
(2021-12-16 08:39:20 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pu=
ll-request=0D
=0D
for you to fetch changes up to ce2ff9cccf0c5f123f9d1e3d5e4fc07d1c2c159d:=0D
=0D
  checkpatch: Do not allow deprecated g_memdup() (2021-12-17 11:57:35 +0100=
)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches pull request 20211217=0D
=0D
----------------------------------------------------------------=0D
=0D
Leonardo Garcia (1):=0D
  hw/virtio/vhost: Fix typo in comment.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  configure: Symlink binaries using .exe suffix with MinGW=0D
  target/i386/kvm: Replace use of __u32 type=0D
  qemu-keymap: Add license in generated files=0D
  hw/avr: Realize AVRCPU qdev object using qdev_realize()=0D
  glib-compat: Introduce g_memdup2() wrapper=0D
  tests/qtest: Replace g_memdup() by g_memdup2()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
=0D
Zhang Chen (1):=0D
  docs/block-replication.txt: Fix replication top-id command demo=0D
=0D
 configure                   |  2 +-=0D
 docs/block-replication.txt  |  2 +-=0D
 hw/avr/atmega.c             |  2 +-=0D
 hw/virtio/vhost.c           |  2 +-=0D
 include/glib-compat.h       | 37 +++++++++++++++++++++++++++++++++++++=0D
 qemu-keymap.c               |  1 +=0D
 scripts/checkpatch.pl       |  5 +++++=0D
 target/i386/kvm/kvm.c       |  2 +-=0D
 tests/qtest/libqos/ahci.c   |  6 +++---=0D
 tests/qtest/libqos/qgraph.c |  2 +-=0D
 10 files changed, 52 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D


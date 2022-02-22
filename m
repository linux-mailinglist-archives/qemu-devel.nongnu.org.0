Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F54D4BFED9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:35:20 +0100 (CET)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMY8E-00076g-N7
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq7-0007tp-2T; Tue, 22 Feb 2022 11:16:35 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:57123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq4-0005Wm-Rd; Tue, 22 Feb 2022 11:16:34 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5gAG-1nKuCe2uLq-007DA8; Tue, 22
 Feb 2022 17:16:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Trivial branch for 7.0 patches
Date: Tue, 22 Feb 2022 17:16:17 +0100
Message-Id: <20220222161624.382218-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lIchfWVqWlloEWuyT7oRKUpfhQjWAH/4SF5AhCztBezyvfWgTje
 dUe+ucHeixFH2pxA4D+Cs0175kmwMpBl5eh3V+9rBlsXD6YMfNOlvZTbeRt2qpJsTMLJ1vP
 XlN6MuBC0QAoBs+rV/gxHn1hGItXCn7qGS3AfR2lAfC+eE1qPbnaERYDV9gD2fqH1S0Tj0j
 uNjjSC/4+nwOXOPhRLhRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xyJSD4xIq+E=:zgxJg7ll+5JncH7NRfc4Ua
 0iLkHuaINFIzWwUU3VlNzY1uCq7gmCRp30loFjxR2dcgSKY6DLkeVahh+v8dRQZC0kyhMHz4D
 xLbwM/ASbsdExMOcym7Z1vurKzhYElcogAOf/yY+zgn+5F66xuD0Wj9MCk9EJmWfQ0r9f19E4
 r8On9bRibAa2p+T80nTraBLS7sZZuVdewcTQImDM+29k7qdj/ga6aiCtNoLH+l3JnRDEuDqXa
 jf3dAYTKhEaBGa8RNYlxAOxZ26vzp7wJVRUivJoH+Mj53LfprIzRYlekJNs0fFFkHgcm58y6i
 VnQG1sqcwTrSCEroTm6PQkeGhJVUy5ef8jyN+7c75ZP9n4puTzifRJ6UhwrhMdg0Zo9iWpgST
 P7fLpB6v0h7/9lpemt3SMej84LyyLyKUW3gD+Qx3jrcO4ymtOf9WoHOSJ2HYEeH13D5pnRInz
 k/b5PdUOP8Jr4z00XFDGeJLjVDTwxMWxdd/WHNKS9IKZzkz3z+ZKGH93mPD5azxV409EI/kko
 Xzgg9iSXFnyzrCO8b0bxulJwAYwHRnIxJSEsc0WXV5mMj3F+c/f2oojEjgMnJzw0HHPW15vii
 bxGO0v9yxve1lw/0nEAvmX5zTGsSaLv+tka6E1beN7cguoLioK0Ry0akLiXVS5gt0Z5/bswbA
 XvuPKSsvggm6OIsCMb9PMdyPVzi3XhGVuYfTYtA3Q8yu83OGFJGSCN/KbWIIrQPoyCck=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e670f6d825d4dee248b311197fd4048469d6772b=
:=0D
=0D
  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220218' in=
to staging (2022-02-20 15:05:41 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pu=
ll-request=0D
=0D
for you to fetch changes up to 1e2d555846226a9e5fb1052fe8ba6f30480f33a9:=0D
=0D
  hid: Implement support for side and extra buttons (2022-02-22 17:15:36 +0=
100)=0D
=0D
----------------------------------------------------------------=0D
Trivial branch pull request 20220222=0D
=0D
----------------------------------------------------------------=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  vdpa: Make ncs autofree=0D
=0D
Laurent Vivier (1):=0D
  qemu-options: fix incorrect description for '-drive index=3D'=0D
=0D
Noah Bergbauer (1):=0D
  hid: Implement support for side and extra buttons=0D
=0D
Patrick Venture (1):=0D
  hw/nvram: use at24 macro=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/avr: Correct AVRCPUClass docstring=0D
  target/rx: Remove unused ENV_OFFSET definition=0D
=0D
Thomas Huth (1):=0D
  configure: Disable capstone and slirp in the=0D
    --without-default-features mode=0D
=0D
 configure               | 9 +++++++--=0D
 hw/input/hid.c          | 2 ++=0D
 hw/nvram/eeprom_at24c.c | 2 +-=0D
 hw/usb/dev-hid.c        | 6 +++---=0D
 net/vhost-vdpa.c        | 5 ++---=0D
 qemu-options.hx         | 2 +-=0D
 target/avr/cpu-qom.h    | 1 -=0D
 target/rx/cpu.h         | 2 --=0D
 8 files changed, 16 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


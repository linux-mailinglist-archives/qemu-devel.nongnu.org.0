Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E173744AA67
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:16:38 +0100 (CET)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNF8-0004mu-22
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:16:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBN-0006Wr-HX; Tue, 09 Nov 2021 04:12:45 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:43279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBL-00053h-SN; Tue, 09 Nov 2021 04:12:45 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmDZI-1mK4r12RLk-00iFhu; Tue, 09
 Nov 2021 10:12:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Trivial branch for 6.2 patches
Date: Tue,  9 Nov 2021 10:12:32 +0100
Message-Id: <20211109091238.817997-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gFpRCG6SxcsFoY58k6RedZW58XJ2ASin3ZguFyFxQbX2jnWlbwc
 EcpA755ei7iFVZ3M2UYgSzbn2KWB7UItarLhxu2z4bPq1SnHIoY6cadfwAoDQ1o75pN1GnF
 bWkBMIV88WqYrmaNhRN0bRF6LE6Dj8ao7qg1UgnJ80hA3gNSclH852ruZEtMvBJALMjVrMx
 P1IeRsJB2iaeVddPLU3Aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HQ4tjmdKNVg=:W8m9gS78t804z+bLKC+Y1A
 SBLRfk+uchWHGDlI72W8YPdcYJujzp65kVIu4VyIgAbtOSQgnujGJth2o9flZwrNjsWAtU4pV
 zxYaoB726M54tkA+YmWnjBf5Od9TLBbO0FY5oFzbzNxl/y0wqDvArusdYuA2Lvmg4uhO+j8By
 1cfUmJvpOjHQMVQh50ei5WXvdMK515eUrtPgcnxcQ/+1G1acdL0nvRtY9YdBXAu/CVOjp7zyd
 0ZUQFFkpw89EwW6BEIM60VBdIes5vOpHtP030XCZdeTQSQQups7DUyTQKQL8rs9ns1GZteqwR
 95SV7ZPBtUvOKnvv11smj+HE1uNZV5+WIm7lFHqWjf3cLCP1qpqRg0Q0NUyFMjDFFvWG4b5fU
 Aj9HLhfpvje/321yNjhF/QW7X4xDyp1AM92t8Vkk94N8ZcPpWn1vPxtLR0Vf16lb0gmMO8cku
 1mh8LliVhxznrTtmjYS9Tx3pyFz/neiSviqwLLiGP+yBLS1VxPjvM4FYA203hfLjgc9rATjrw
 5AiEP+JNxrOTisLguX9U37iTo/kzuGe7xS4YBBpgLDbFL072YNznh6g6xTF5QGq4wUHCcWyAe
 FGa+u1WSTqPnnykwo06jodMSt5h0D7TSNoEechFOfJj5y+hwmsJrvqNAKVPcu2ZjrsesDo/Jk
 R1acAsw6cQiE6uDAoNED9NsesS5sT0DbbDcY9jfH0iR6OkDi5QfFprj31QD8GebidLbM=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f10e7b9f6fc18be390b3bc189e04b5147eb8dbf8=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-6.2-20211109' =
into staging (2021-11-09 07:18:33 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to 66d96a1901b7d9cfdbc454d407710ca8bfb90947:=0D
=0D
  docs/about/deprecated: Remove empty 'related binaries' section (2021-11-0=
9 10:11:27 +0100)=0D
=0D
----------------------------------------------------------------=0D
Trivial branch patches pull request 20211109=0D
=0D
----------------------------------------------------------------=0D
=0D
BALATON Zoltan (1):=0D
  hmp: Add shortcut to stop command to match cont=0D
=0D
Laurent Vivier (1):=0D
  tests/qtest/virtio-net: fix hotplug test case=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/m68k: Fix typo in SPDX tag=0D
  .mailmap: Fix more contributor entries=0D
  meson: Fix 'interpretor' typo=0D
  docs/about/deprecated: Remove empty 'related binaries' section=0D
=0D
 .mailmap                       | 4 ++++=0D
 docs/about/deprecated.rst      | 3 ---=0D
 hmp-commands.hx                | 4 ++--=0D
 hw/char/goldfish_tty.c         | 2 +-=0D
 hw/intc/goldfish_pic.c         | 2 +-=0D
 hw/intc/m68k_irqc.c            | 2 +-=0D
 hw/m68k/virt.c                 | 2 +-=0D
 hw/misc/virt_ctrl.c            | 2 +-=0D
 include/hw/char/goldfish_tty.h | 2 +-=0D
 include/hw/intc/goldfish_pic.h | 2 +-=0D
 include/hw/intc/m68k_irqc.h    | 2 +-=0D
 include/hw/misc/virt_ctrl.h    | 2 +-=0D
 meson.build                    | 2 +-=0D
 tests/qtest/virtio-net-test.c  | 2 +-=0D
 14 files changed, 17 insertions(+), 16 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


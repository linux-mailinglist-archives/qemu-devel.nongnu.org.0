Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9444154C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:29:50 +0100 (CET)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhShR-00088N-9E
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfa-0005sF-OD; Mon, 01 Nov 2021 04:27:54 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfY-00085u-NZ; Mon, 01 Nov 2021 04:27:54 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M8k65-1mcnq80o5J-004laj; Mon, 01
 Nov 2021 09:27:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Trivial branch for 6.2 patches
Date: Mon,  1 Nov 2021 09:27:41 +0100
Message-Id: <20211101082747.2524909-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SRKYVP9A+K7pB3Fy+XZb+755061HJ5rMHUOxADsVnuD2D90YqvG
 Xc+ecAQWeGjeXQyyj8ZKt9I7H6ZDejoPxgoDvRJnowf9jIKqh9+6SUkZBMO6YK0wvnwwJSI
 ee5Cr9vHJ/bxuL5c+YNSOtaaznGjsyOOZ/7TkxtuYF4xgp6GsGsNfzuekYvvQHYGcvsfSAQ
 apNzbLH1UmNIj35ITfrWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UH0IZkTvLBk=:84gIIppeIiCNEmXt3IfCkS
 ctXH0fG/6LnhW3cysTwrE9OjAgNTHylH55ulscw1kOKPheN+4VAjitTa1MBichMsWwCRnAHOL
 M1k6mrMmZhLi3mu80ebce0UIcanaHQFluabrjdiLTk9mWvlvgneT72DV+5oqlqlI5Cfag1a/N
 ZNTiyJ45C/8zPsNyAK+7wKqFD/Sfx0EK/kBB8jOOVbsMNk+QJmdQxIMxyir/7m+D2fThqJgu0
 IYy+7Ear5P6yeN3T+Z4PJQD6L+H3zG3eSEO90o9++Uq/wM8nDom8tkLBFJW4+dOaIKXWBIU77
 f8ipO/sGNf1G7fKB9I8Q3B0/jnv4UhszXPEx5q9XhneIKdGEaL0thtLS+u1lctiq+MXUgZBbq
 TD4V8W6Y7V/6jsxF07DANpDm8tKSFqH2g97981lZE2RGInSAY0zVnOQaAno+t0y1EnCiSg7Vd
 aqE01v9xXQE8RGbfBNEGG2SfPz9u+rGSbjX1PLlGqPh/BdS7YmGN1mkX26VzWtM3Q9On3OA/r
 TWBWOkIUW9WROa3XMUT5NVq8LHaWp6DeZm8AHb5PabKrA8XxdLi/LSDRYgYMXOCrXTnw8oa8v
 /OSJ5rIzlIOYS+OfsesAMiKTm7X5dC1RPkFKMO3sRS3ICKttKjaYUaFr6yUR2yp5g7o/CHZMP
 nPjFoeDvxUJ5Wz7YS4ljbPFAY7o0HAlnEV/M39FnMM4D2JQdq4QoRfrT7oqH/h7uvUss=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into =
staging (2021-10-30 11:31:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to c3f93230df9ad1d3260f03655faa8f9f23c90a52:=0D
=0D
  hw/input/lasips2: QOM'ify the Lasi PS/2 (2021-10-31 21:05:40 +0100)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches branch pull request 20211101=0D
=0D
----------------------------------------------------------------=0D
=0D
Markus Armbruster (1):=0D
  monitor: Trim some trailing space from human-readable output=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware=0D
  hw/input/lasips2: Fix typos in function names=0D
  hw/input/lasips2: Move LASIPS2State declaration to=0D
    'hw/input/lasips2.h'=0D
  hw/input/lasips2: QOM'ify the Lasi PS/2=0D
=0D
Yanan Wang (1):=0D
  hw/core/machine: Add the missing delimiter in cpu_slot_to_string()=0D
=0D
 MAINTAINERS                |  5 ++-=0D
 hw/core/machine.c          |  3 ++=0D
 hw/hppa/lasi.c             | 10 +++++-=0D
 hw/input/lasips2.c         | 64 +++++++++++++++++++-------------------=0D
 include/hw/input/lasips2.h | 31 ++++++++++++++++--=0D
 monitor/hmp-cmds.c         |  2 +-=0D
 target/i386/cpu-dump.c     |  4 +--=0D
 target/i386/cpu.c          |  2 +-=0D
 target/ppc/cpu_init.c      |  2 +-=0D
 target/s390x/cpu_models.c  |  4 +--=0D
 target/xtensa/mmu_helper.c |  2 +-=0D
 11 files changed, 83 insertions(+), 46 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB2437296
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:19:04 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdopT-0003WP-Jd
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonh-0000wh-8b
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:13 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:46201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonf-0003Hg-6m
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:13 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MG9Pg-1mTuEJ16HE-00GaLS; Fri, 22
 Oct 2021 09:17:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Q800 patches
Date: Fri, 22 Oct 2021 09:16:56 +0200
Message-Id: <20211022071705.471954-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G5b+mvKd/GiWMJs1c9WhYTYyQDixRcrVo1K09O4XRi2h4/4Y/2J
 8rp3riZvIRZzQvLOEW/m+zH8vJM0f84keICIRtDkYnFWvRycGyZ+5D8QM/weE9py7OChCh/
 0X6KwqVNacbQZZYvI8M4SeBxI7GNcAn3bgmwNQQjV82m3E2poGy1S2xfTqK6UiJMyF9r8rh
 1siRedn3QJ+VUXNrGwp1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pVIt5G66moc=:ctHsDec8dXBbNcmd56YnO9
 fWpxcrZs3q3m38Y7JqmRagOCsXKg0UqWhTD28WGjyxiNf3NlzT3qxlTtl1WJ+CUvpKu3oAos1
 XVOqD6HLDpcQfpsItAmgCCyWmjXb6rXBOTg4x43uBRjqU8pv8AHvvirP8aFF7IaO6w0tHD3h2
 TmoWXV5v6hyuZxtBEM+W48GYjYiloFTUW9vb393oyDhyvmip/PBOeJd3bTiCDerZppdSklxNW
 SE2KMbfm8ozo8KIZ74zzVKhkoNU8eFnL+64LonFS3OBzRt96toVZBZGWLc4TZOF3BFiQhmu4Q
 yEVc09KFQF1x4Up17+6zfzy1n5txkKoXdvdUyKRPDAkjtjmCZppAoMFZlUxK0gUOXPG8FAmFU
 t2JduagpY9dK3193O9bNty7ZwV4kfUNeDCdwkbHCbeRqcvhJeiNeDmBVOSrnmtwRW4YsDQDHt
 LgEwxbkK0Te8lQCjVIeeBXXPRdbJ8VfHJYYgKdRPRrU/GF4UI+dWWQV8au9phdDaFPBapSiXs
 /I+nkuK4eCC4gNl3+cX3Vq06vRlRYt8+kJ9IAPpdp9mgnEqFfony1hnJCWVn7ymrZTPyIwWMv
 6kK3u+J+yYCWi/Yu87iAoMXfPEoRSYy151iWQEAPsLeZDa7p39jy5Q5tDvrcTYHry35KuGhmb
 GOOC8nJfcUxB258KUnFqdz/aSuWZBHdhrs8akmBk7XxD85CetKDf0r6rmTFCM+O/M6+M=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 50352cce138ef3b30c1cda28a4df68fff5da3202=
:=0D
=0D
  Merge remote-tracking branch 'remotes/juanquintela/tags/migration.next-pu=
ll-request' into staging (2021-10-19 07:41:04 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/q800-pull-request=0D
=0D
for you to fetch changes up to a56c12fb760a57c1419df4a34e930160f1d8d428:=0D
=0D
  q800: drop 8-bit graphic_depth check for Apple 21 inch display (2021-10-2=
0 16:25:04 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request Q800 20211022=0D
=0D
GLUE updates for A/UX mode=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (9):=0D
  mac_via: update comment for VIA1B_vMystery bit=0D
  q800: move VIA1 IRQ from level 1 to level 6=0D
  q800: use GLUE IRQ numbers instead of IRQ level for GLUE IRQs=0D
  mac_via: add GPIO for A/UX mode=0D
  q800: wire up auxmode GPIO to GLUE=0D
  q800: route SONIC on-board Ethernet IRQ via nubus IRQ 9 in classic=0D
    mode=0D
  q800: wire up remaining IRQs in classic mode=0D
  q800: add NMI handler=0D
  q800: drop 8-bit graphic_depth check for Apple 21 inch display=0D
=0D
 include/hw/misc/mac_via.h |   1 +=0D
 hw/m68k/q800.c            | 169 ++++++++++++++++++++++++++++++++++++--=0D
 hw/misc/mac_via.c         |  23 ++++++=0D
 hw/misc/trace-events      |   1 +=0D
 4 files changed, 189 insertions(+), 5 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


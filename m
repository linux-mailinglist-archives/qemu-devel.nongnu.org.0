Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649633E078
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:27:24 +0100 (CET)
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHDn-0003Zt-Dd
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3T-0006ey-He
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3P-0003wH-RG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:42 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MIdW7-1lRUEj13g5-00Ei22; Tue, 16 Mar 2021 22:16:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Q800 for 6.0 patches
Date: Tue, 16 Mar 2021 22:16:24 +0100
Message-Id: <20210316211631.107417-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ezhP7UhtxEnoR3Uf2PL4PCK9ZVEo7AJ8GO3gOR6CK8fUXqFbXCs
 MO69hXbThFMy4gEUOvoFklAnykVir95IYxFAVO6qGz0DYTjkWbvLN3V9OurJ6vuTjPIGtH4
 vMXimSscr3ROWXlCQ5E88kBM7y3BTF2x3a/mzrNOaLX2pmbw4kTpdlynD098mmEChrKKHGa
 A566PrFu8UH/BdIcCafFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T4AaXVEN0xk=:xSewY6xXk/GkUYVlAcqym4
 Ci4JGD3Ojsc8TaCxxw+eJ3fVShFbT09VUSRUCGngokISQRv/Of44QiPayCrkcjv25tBw5MsIl
 5fkfUdn4VfY/IAs6mSdKNk0nm9SZUapWdSgou69Twiz9+HuIyZv2V4AuwvpGOh6SSODufbIQL
 pzclx0PzNjhKTMzzlbf3BExHAiLEMlhs1hzOPnaA7oSaskmuZuEKdnw0VKb8D4xLYbmBZjL14
 h3xeB12eIi/lm3+yHjkP50xPgiuWC6jW1Nm0AAcxr2qYm2s/G6bW9AZH84HCkmmYPb8ieq1Td
 79QPNwl0mj+ZGhdJgub8RqxhBltWTxKhPefbiWway7z53Ei7PzD3ZUveazfxG+V4pogIjewDT
 ZAE3g6nA98NXldIODTeyLbfddvKk5YyReMWSOIOKaYhN3qEzIka5aoJ1KEl8HH9KPx7urkW4n
 +cJn5ZsXjA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o =3D=0D
staging (2021-03-16 10:53:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/q800-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 30ca7eddc486646fa19c9619fcf233ceaa65e28c:=0D
=0D
  mac_via: remove VIA1 timer optimisations (2021-03-16 21:41:37 +0100)=0D
=0D
----------------------------------------------------------------=0D
q800 pull request 20210316=0D
=0D
Several fixes for mac_via needed for future support of MacOS ROM=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (7):=0D
  mac_via: switch rtc pram trace-events to use hex rather than decimal=0D
    for addresses=0D
  mac_via: fix up adb_via_receive() trace events=0D
  mac_via: allow long accesses to VIA registers=0D
  mac_via: don't re-inject ADB response when switching to IDLE state=0D
  mac_via: rename VBL timer to 60Hz timer=0D
  mac_via: fix 60Hz VIA1 timer interval=0D
  mac_via: remove VIA1 timer optimisations=0D
=0D
 include/hw/misc/mac_via.h |   8 +-=0D
 hw/misc/mac_via.c         | 194 +++++++++++++++-----------------------=0D
 hw/misc/trace-events      |   4 +-=0D
 3 files changed, 81 insertions(+), 125 deletions(-)=0D
=0D
--=3D20=0D
2.30.2=0D
=0D


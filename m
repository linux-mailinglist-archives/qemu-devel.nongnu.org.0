Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79F4191EE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:02:48 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnTC-0007nT-S0
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJq-0005Ob-Gl; Mon, 27 Sep 2021 05:53:06 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJl-0004E5-UR; Mon, 27 Sep 2021 05:53:05 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYNW6-1mIEUv0P0E-00VNNo; Mon, 27
 Sep 2021 11:52:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Trivial branch for 6.2 patches
Date: Mon, 27 Sep 2021 11:52:47 +0200
Message-Id: <20210927095252.2374148-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kay5MoSs2RnKhs7D8dW83gItPK0twtQkyoTlc/XcdMJKUL4HTXp
 K4VYkmcSvKnufl+PxCGEOFPJqx51acjFiMe/9giDOHw9TY69Pia7cfNqlTfG//AQjEJqeR2
 ZGXvff+m/RDoVg0Jre11Xcey/xQrF2psWEnj5be55+QbgUxBPC5WQrDGNluhrwkAvvNjWIu
 WQuFl1q4i7Qxmzp0n+eFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uAQADNVxdBk=:C5G36dm8uZhnjaYihHMeIh
 3pyQJcO48ivBcvCw4Xu3BRkmFITKjKd9ipgRwDdb5Y+12qBTpBXB8cXWGK+ku0EuY5y1inVxQ
 X0Eim6wCJ9JymDY+dGDbFkketSAQXuEfqfc80KhFTaux3A3MXkVQbay844DBnIxfWzIsXPry6
 lifCha8AT1cnX9YXv2o4tt0Vb7HhRTgyzUykKWRzh8O7TNXkPrTqLLllRH7+mANnYSnozc8Or
 EdLVVVVWKWcKW7FP5H6J98RhKy+LHMUJDRFuLYuVl4uBZ6yBzMI8qPCJEm9ZIdI9glaGle8Jf
 OKpuJpPxPANBiFBojtKQBGs46c5JjRe486Gint7mfrujYVWcwq+5fG+m18cc1msVPX7HIli6o
 haGwlsWX6RKFMTWEcyJReRd7pV+ZfpVnkbcObU5rwWtz8P093NG5ydMVwzr2g5VxAABEYYGx6
 pNKtipg1B5Sku9c0cK9Ku2vsNafeOXRdVNuFuFZD5sX0C3QwG4McAfTKXRG99PPscUpPlu0/U
 Og4+tt8RP2qhfWnCW2MS+ewcIZCVlwffEwxAVreIkz+LgHFLZbiNhSfwk14nUHPDutsMGS4CB
 bZ5v1HfQJ6iv7PHBOYevNPsWdEFeCD7g9v1yAvFBV5davA68xoAppcUFWhj6cfDaT6O8ZW1e8
 nn+R7zS2RyAXgTBXWqsamab98+BmniUpYObtLBRr1CBScsye2jhgaDCyvuPqRHJvfnTXuOEFJ
 Y+uBa+KOSXPmtO03UsF3eCoR62c5kYddr7SgTQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into st=
aging (2021-09-24 13:21:18 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to 45b09cb12f5440971b321fc255e3930f38366ace:=0D
=0D
  multi-process: fix usage information (2021-09-27 10:57:21 +0200)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches pull request 20210927=0D
=0D
----------------------------------------------------------------=0D
=0D
Dongli Zhang (1):=0D
  multi-process: fix usage information=0D
=0D
Markus Armbruster (2):=0D
  hmp: Unbreak "change vnc"=0D
  hmp: Drop a bogus sentence from set_password's documentation=0D
=0D
Pankaj Gupta (1):=0D
  docs/nvdimm: Update nvdimm option value in machine example=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/loader: Restrict PC_ROM_* definitions to hw/i386/pc=0D
=0D
 docs/nvdimm.txt               |  2 +-=0D
 docs/system/multi-process.rst |  2 +-=0D
 hmp-commands.hx               | 11 +++++------=0D
 hw/i386/pc.c                  |  6 ++++++=0D
 include/hw/loader.h           |  6 ------=0D
 monitor/hmp-cmds.c            |  2 +-=0D
 6 files changed, 14 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


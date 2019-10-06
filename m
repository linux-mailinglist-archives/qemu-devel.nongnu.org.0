Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8266ACD9C8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 01:57:38 +0200 (CEST)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHGPB-0001nU-GB
	for lists+qemu-devel@lfdr.de; Sun, 06 Oct 2019 19:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1iHGNQ-0000tg-SH
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 19:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1iHGNP-0008Bs-Tp
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 19:55:48 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:54132)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iHGNP-0008Bk-O2
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 19:55:47 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 230741FD4;
 Mon,  7 Oct 2019 01:55:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77tFWhywbz32; Mon,  7 Oct 2019 01:55:39 +0200 (CEST)
Received: from function.home (lfbn-bor-1-306-163.w109-215.abo.wanadoo.fr
 [109.215.28.163])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3285E1E8A;
 Mon,  7 Oct 2019 01:55:39 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iHGNG-0008L8-7J; Mon, 07 Oct 2019 01:55:38 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/1] slirp update
Date: Mon,  7 Oct 2019 01:55:36 +0200
Message-Id: <20191006235537.32016-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.233.100.1
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 860d9048c78ce59c5903c3d5209df56f384009=
86:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20190924-pull-r=
equest' into staging (2019-09-24 13:51:51 +0100)

are available in the Git repository at:

  https://people.debian.org/~sthibault/qemu.git tags/samuel-thibault

for you to fetch changes up to 120b721f5b590393971673a315f02969ec89cccb:

  slirp: Allow non-local DNS address when restrict is off (2019-10-01 19:=
03:08 +0200)

----------------------------------------------------------------
slirp: Allow non-local DNS address when restrict is off

----------------------------------------------------------------
Samuel Thibault (1):
      slirp: Allow non-local DNS address when restrict is off

 net/slirp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


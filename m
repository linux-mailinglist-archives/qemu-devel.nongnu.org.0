Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3062114BB8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 05:43:30 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1id5Sj-00034f-Gr
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 23:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1id5R2-0002AK-RY
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 23:41:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1id5R1-0001Vv-9O
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 23:41:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53017 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1id5R0-0001LF-P4; Thu, 05 Dec 2019 23:41:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47Tg0L0287z9sQp; Fri,  6 Dec 2019 15:41:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575607298;
 bh=6wvdo54BG1/nTyGgNjAYsHRye6Z56+rsEJEEi2LLsN8=;
 h=From:To:Cc:Subject:Date:From;
 b=TCqAWgY1rBQ65QSXMXy9yF/wczATgMKDTfqHW2qFGq8PqtlhBIb9SsGyvDpGVYHka
 Ghy9kvB6zK1pBnp/SUgiUFhArqqtgWv2XOH4VB8tf92Osf0r00PQW8XxyZdzTVhNP8
 gHfEDQZX4RXjl3aeCmkiZYseQ+wLN7K89cC4N3hA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 0/1] ppc-for-4.2 queue 20191206
Date: Fri,  6 Dec 2019 15:41:33 +1100
Message-Id: <20191206044134.259488-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1bdc319ab5d289ce6b822e06fb2b13666fd927=
8e:

  Update version for v4.2.0-rc4 release (2019-12-03 17:56:30 +0000)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-4.2-20191206

for you to fetch changes up to d887a8cfc083bcf3856f9f42352989f3624e0cae:

  pseries: Update SLOF firmware image (2019-12-06 15:33:23 +1100)

----------------------------------------------------------------
ppc patch queue 2019-12-06

This is a last minute pull request for ppc-for-4.2.  I know it's very
late in freeze, but this does fix a regression: a bad interaction
between the new qemu and SLOF device tree construction code means that
SLOF will crash if PCI to PCI bridges are included in the system.

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 928552 -> 931032 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


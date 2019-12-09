Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C34116746
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 08:02:31 +0100 (CET)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieD3t-000586-Q2
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 02:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ieD1E-0003Xq-H9
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 01:59:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ieD1D-00080p-9e
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 01:59:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46381 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ieD1C-00080O-AX; Mon, 09 Dec 2019 01:59:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47WYwB0WRTz9sPc; Mon,  9 Dec 2019 17:59:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575874778;
 bh=oxSseDrFZ+7AgEYNg9E8ZC4uEMRpHyYwCqlmouoIRWI=;
 h=From:To:Cc:Subject:Date:From;
 b=I/xc4CRXSvWNGtJS4vQAIm0U6I7ipWX21pvGjiAfvMM1qIjgWMq7Pnk6dphzWeIPR
 eqjPAZB8X1mTw2I7Hk/dpNbLkgVlTRtmqKqw4yWhEFOibiWC9HYAIp7ekqc9+qjA5T
 0KpnAoIpEVDtfPtptuNCR7GnxVq+DNTyq+E6thG8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 0/1] ppc-for-4.2 queue 2019-12-06
Date: Mon,  9 Dec 2019 17:59:26 +1100
Message-Id: <20191209065928.204264-1-david@gibson.dropbear.id.au>
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

The following changes since commit 02f9c885edefae66d787847758d13ed60c0f53=
9e:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into s=
taging (2019-12-06 15:05:20 +0000)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-4.2-20191209

for you to fetch changes up to a2fad86497b981426dc720236c15f2a99ca674a9:

  pseries: Update SLOF firmware image (2019-12-09 12:16:26 +1100)

----------------------------------------------------------------
ppc patch queue 2019-12-09

This is a last minute pull request for ppc-for-4.2.  It fixes a
regression: a bad interaction between the new qemu and SLOF device
tree construction code means that SLOF will crash if PCI to PCI
bridges are included in the system.

This PR supersedes ppc-for-4.2-20191206.  This one has only a more
minimal change to the firmware addressed only at fixing this bug and
not incorporating some other unrelated changes that happened in the
meantime.

This is very late, maybe too late.  However, since there appears to be
an -rc5 in the works for other reasons, I figured it was worth
submitting this in case.
----------------------------------------------------------------
Alexey Kardashevskiy (1): pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 928552 -> 931040 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


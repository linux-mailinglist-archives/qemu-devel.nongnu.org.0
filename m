Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C837547
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 15:34:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYsWo-0007c7-Qh
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 09:34:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hYsUE-0006Iq-Vi
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hYsUD-00084v-VH
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:31:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>) id 1hYsUD-000826-Q7
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:31:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D22E18DF7A
	for <qemu-devel@nongnu.org>; Thu,  6 Jun 2019 13:31:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-196.ams2.redhat.com
	[10.36.116.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD9268424;
	Thu,  6 Jun 2019 13:31:13 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Date: Thu,  6 Jun 2019 15:31:04 +0200
Message-Id: <20190606133110.13754-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 06 Jun 2019 13:31:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/6] update edk2 submodule & binaries to
 edk2-stable201905
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Launchpad: https://bugs.launchpad.net/qemu/+bug/1831477
Repo:      https://github.com/lersek/qemu.git
Branch:    edk2-stable201905-lp-1831477

edk2-stable201905 has been released today; let's update QEMU's
submodule, and the binaries built thereof. This should be the edk2
release that goes into QEMU 4.1.

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks
Laszlo

Laszlo Ersek (6):
  roms/Makefile.edk2: define edk2-stable201905 network feature test
    macros
  roms/edk2: update submodule from edk2-stable201903 to
    edk2-stable201905
  roms/Makefile.edk2: remove edk2-stable201903 network feature test
    macros
  roms/Makefile.edk2: update input file list for
    "pc-bios/edk2-licenses.txt"
  pc-bios: refresh edk2 build artifacts for edk2-stable201905
  pc-bios: update the README file with edk2-stable201905 information

 pc-bios/README                         |  14 +-
 pc-bios/edk2-aarch64-code.fd.bz2       | Bin 1177603 -> 1178070 bytes
 pc-bios/edk2-arm-code.fd.bz2           | Bin 1173662 -> 1172752 bytes
 pc-bios/edk2-i386-code.fd.bz2          | Bin 1688659 -> 1736199 bytes
 pc-bios/edk2-i386-secure-code.fd.bz2   | Bin 1881979 -> 1943949 bytes
 pc-bios/edk2-licenses.txt              | 752 ++++++++++++++++++--
 pc-bios/edk2-x86_64-code.fd.bz2        | Bin 1669280 -> 1717094 bytes
 pc-bios/edk2-x86_64-secure-code.fd.bz2 | Bin 1901210 -> 1958037 bytes
 roms/Makefile.edk2                     |  22 +-
 roms/edk2                              |   2 +-
 10 files changed, 714 insertions(+), 76 deletions(-)

--=20
2.19.1.3.g30247aa5d201



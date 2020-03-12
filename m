Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C451827A4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 05:11:36 +0100 (CET)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCFC2-0006iO-It
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 00:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1jCFBH-0006Db-Bg
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 00:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1jCFBG-0002Bu-3C
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 00:10:46 -0400
Received: from [107.174.27.60] (port=41980 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1jCFBF-00026A-Tw; Thu, 12 Mar 2020 00:10:46 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id DDBE3AE80016;
 Thu, 12 Mar 2020 00:08:30 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Thu, 12 Mar 2020 15:10:10 +1100
Message-Id: <20200312041010.16229-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0ba04f78e7c37748db89885249a653b28c962b=
d9:

  ppc/spapr: Move GPRs setup to one place (2020-03-12 10:21:16 +1100)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20200312

for you to fetch changes up to 8b1987b232d0da2df1f33bf9e3e25fcb1874b91d:

  pseries: Update SLOF firmware image (2020-03-12 15:04:40 +1100)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 968616 -> 968848 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries


This mainly fixes virtio-serial with and without
enabled iommu-platform.

The full list of changes is:

Alexey Kardashevskiy (3):
      llfw: Fix debug printf warnings
      virtio-serial: Close device completely
      version: update to 20200312

C=C3=A9dric Le Goater (1):
      virtio: Fix typo in virtio_serial_init()

Greg Kurz (2):
      virtio-serial: Don't override some words
      virtio-serial: Rework shutdown sequence



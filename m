Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B331F45C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 05:14:36 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCxBa-00070h-SW
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 23:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1lCxAp-0006a1-73; Thu, 18 Feb 2021 23:13:47 -0500
Received: from ozlabs.ru ([107.174.27.60]:42796)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1lCxAm-0003CM-G9; Thu, 18 Feb 2021 23:13:46 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id CA243AE8003F;
 Thu, 18 Feb 2021 23:13:37 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Fri, 19 Feb 2021 15:13:33 +1100
Message-Id: <20210219041333.74096-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ef450767d7d162dec67ec4674f85f9044a3d80cc:

  spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logical() (2021-02-17 11:50:21 +1100)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20210217

for you to fetch changes up to 7745df3b2bc512e71badb52f8f07452260ad7409:

  pseries: Update SLOF firmware image (2021-02-19 14:56:39 +1100)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 968368 -> 968888 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

This is mostly compiler warnings fixed but while doing this,
a bug in MIN() in tcgbios was found.

Alexey Kardashevskiy (14):
      helpers: Define MIN()
      libc: Compile with -Wextra
      elf: Compile with -Wextra
      usb: Compile with -Wextra
      veth: Compile with -Wextra
      virtio: Compile with -Wextra
      e1000: Compile with -Wextra
      libnet: Compile with -Wextra
      libhv: Compile with -Wextra
      libnvram: Compile with -Wextra
      libtpm: Compile with -Wextra
      slof/prim: Compile with -Wextra
      Makefile: Actually compile with -Wextra
      version: update to 20210217

Thomas Huth (1):
      virtio-serial: Remove superfluous serial-* words



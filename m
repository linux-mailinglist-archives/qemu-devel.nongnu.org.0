Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12569194F65
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 04:04:05 +0100 (CET)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHfHv-0001Se-U4
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 23:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1jHfGw-0000eI-CX
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1jHfGu-0004wp-TJ
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:03:01 -0400
Received: from [107.174.27.60] (port=45240 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1jHfGu-0004uy-OG; Thu, 26 Mar 2020 23:03:00 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id BE9B1AE8000E;
 Thu, 26 Mar 2020 23:01:09 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Fri, 27 Mar 2020 14:02:54 +1100
Message-Id: <20200327030254.21487-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 736cf607e40674776d752acc201f565723e86045:

  Update version for v5.0.0-rc0 release (2020-03-24 17:50:00 +0000)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20200327

for you to fetch changes up to 78b145a0330b9c44478f7404b97a710e692bfc96:

  pseries: Update SLOF firmware image (2020-03-27 13:58:00 +1100)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 965008 -> 965112 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

This is a single regression fix for for 5.0:

Greg Kurz (1):
      slof: Only close stdout for virtio-serial devices



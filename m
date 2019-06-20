Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169994D221
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:27:36 +0200 (CEST)
Received: from localhost ([::1]:49244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdyyN-0006h6-8G
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45319)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hdypE-000652-Fr
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hdyia-0003tr-3L
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:11:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18983)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hdyiY-0003nz-RZ
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:11:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E2E0308339E;
 Thu, 20 Jun 2019 15:11:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E538619C67;
 Thu, 20 Jun 2019 15:11:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B886916E08; Thu, 20 Jun 2019 17:11:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 17:11:01 +0200
Message-Id: <20190620151104.2678-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 20 Jun 2019 15:11:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] add ati vgabios
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Gerd Hoffmann (3):
  seabios: add config for ati vgabios
  seabios: add ati vgabios binary
  ati-vga: switch to vgabios-ati.bin

 hw/display/ati.c        |   2 +-
 pc-bios/vgabios-ati.bin | Bin 0 -> 38912 bytes
 roms/config.vga-ati     |   4 ++++
 3 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 pc-bios/vgabios-ati.bin
 create mode 100644 roms/config.vga-ati

-- 
2.18.1



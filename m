Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F343433CC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 09:40:41 +0200 (CEST)
Received: from localhost ([::1]:37482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbKLe-0005R1-0M
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 03:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52841)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hbKJm-00044B-VZ
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 03:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hbKJl-00064U-TH
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 03:38:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hbKJl-00063r-N2
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 03:38:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 409392F8BC0;
 Thu, 13 Jun 2019 07:38:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82C077943D;
 Thu, 13 Jun 2019 07:38:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44F4211AB8; Thu, 13 Jun 2019 09:38:34 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 09:38:32 +0200
Message-Id: <20190613073834.22001-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 13 Jun 2019 07:38:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Vga 20190613 patches
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a050901d4b40092dc356b59912c6df39e389c7b9:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190612' into staging (2019-06-12 14:43:47 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20190613-pull-request

for you to fetch changes up to 0a71966253c8b07586ebd6bee094a818e1e163b8:

  edid: flip the default to enabled (2019-06-13 09:34:50 +0200)

----------------------------------------------------------------
edid: add xmax + ymax properties, enable by default.

----------------------------------------------------------------

Gerd Hoffmann (2):
  edid: add xmax + ymax properties
  edid: flip the default to enabled

 include/hw/display/edid.h      | 4 +++-
 include/hw/virtio/virtio-gpu.h | 2 +-
 hw/core/machine.c              | 8 +++++++-
 hw/display/bochs-display.c     | 2 +-
 hw/display/vga-pci.c           | 4 ++--
 5 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.18.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9D19A3E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 05:12:24 +0200 (CEST)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJTnj-0002eG-9o
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 23:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jJTmp-00022W-Dj
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 23:11:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jJTmn-00029m-La
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 23:11:26 -0400
Received: from [192.146.154.243] (port=34750 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jJTmn-00027Y-GQ
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 23:11:25 -0400
Received: from localhost.localdomain.com (unknown [10.40.48.82])
 by mcp01.nutanix.com (Postfix) with ESMTP id 8DEC7100ABF8;
 Wed,  1 Apr 2020 03:11:23 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH] MAINTAINERS: Add myself as vhost-user-blk maintainer
Date: Thu, 26 Mar 2020 04:57:27 -0400
Message-Id: <1585213047-20089-1-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.243
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
Cc: peter.maydell@linaro.org, raphael.s.norwitz@gmail.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As suggested by Michael, let's add me as a maintainer of
vhost-user-blk and vhost-user-scsi.

CC: Michael S. Tsirkin <mst@redhat.com>
CC Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e580276..239ecc1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1845,6 +1845,18 @@ F: hw/display/virtio-gpu*
 F: hw/display/virtio-vga.*
 F: include/hw/virtio/virtio-gpu.h
=20
+vhost-user-blk
+M: Raphael Norwitz <raphael.norwitz@nutanix.com>
+S: Maintained
+F: contrib/vhost-user-blk/
+F: contrib/vhost-user-scsi/
+F: hw/block/vhost-user-blk.c
+F: hw/scsi/vhost-user-scsi.c
+F: hw/virtio/vhost-user-blk-pci.c
+F: hw/virtio/vhost-user-scsi-pci.c
+F: include/hw/virtio/vhost-user-blk.h
+F: include/hw/virtio/vhost-user-scsi.h
+
 vhost-user-gpu
 M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
 M: Gerd Hoffmann <kraxel@redhat.com>
--=20
1.8.3.1



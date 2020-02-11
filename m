Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CA0159192
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 15:08:58 +0100 (CET)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1WDh-0001Dy-9H
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 09:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WCr-0000aN-BQ
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:08:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WCq-0001Y6-6I
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:08:05 -0500
Received: from relay.sw.ru ([185.231.240.75]:44258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WCp-0001XX-VH
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:08:04 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WCk-0008PU-RT; Tue, 11 Feb 2020 17:07:59 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pc: remove erroneous seg_max_adjust setting for
 vhost-blk-device
Date: Tue, 11 Feb 2020 17:07:58 +0300
Message-Id: <20200211140758.11627-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-blk-device isn't a part of qemu.git

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 hw/core/machine.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d8e30e4895..2501b540ec 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -31,7 +31,6 @@ GlobalProperty hw_compat_4_2[] = {
     { "virtio-blk-device", "x-enable-wce-if-config-wce", "off" },
     { "virtio-blk-device", "seg-max-adjust", "off"},
     { "virtio-scsi-device", "seg_max_adjust", "off"},
-    { "vhost-blk-device", "seg_max_adjust", "off"},
     { "usb-host", "suppress-remote-wake", "off" },
     { "usb-redir", "suppress-remote-wake", "off" },
 };
-- 
2.17.0



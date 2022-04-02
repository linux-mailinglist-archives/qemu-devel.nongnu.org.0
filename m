Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715064F063C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 22:47:07 +0200 (CEST)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nakeI-0004MW-0O
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 16:47:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1nakdT-0003ch-DK; Sat, 02 Apr 2022 16:46:15 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1nakdR-0006vo-46; Sat, 02 Apr 2022 16:46:15 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id 2389030AE009;
 Sat,  2 Apr 2022 22:45:31 +0200 (CEST)
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id 6DC0030ADE45;
 Sat,  2 Apr 2022 22:45:30 +0200 (CEST)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 232KjUHg026970; Sat, 2 Apr 2022 22:45:30 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 232KjTST026969;
 Sat, 2 Apr 2022 22:45:29 +0200
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] docs/system/devices/can.rst: correct links to CTU CAN FD IP
 core documentation.
Date: Sat,  2 Apr 2022 22:45:23 +0200
Message-Id: <20220402204523.32643-1-pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-stable@nongnu.org,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
---
 docs/system/devices/can.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
index 16d72c3ac3..fe37af8223 100644
--- a/docs/system/devices/can.rst
+++ b/docs/system/devices/can.rst
@@ -182,7 +182,7 @@ Links to other resources
  (5) `GNU/Linux, CAN and CANopen in Real-time Control Applications Slides from LinuxDays 2017 (include updated RTLWS 2015 content) <https://www.linuxdays.cz/2017/video/Pavel_Pisa-CAN_canopen.pdf>`_
  (6) `Linux SocketCAN utilities <https://github.com/linux-can/can-utils>`_
  (7) `CTU CAN FD project including core VHDL design, Linux driver, test utilities etc. <https://gitlab.fel.cvut.cz/canbus/ctucanfd_ip_core>`_
- (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/Progdokum.pdf>`_
- (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architecture.pdf>`_
- (10) `CTU CAN FD Driver Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-driver.html>`_
+ (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/Datasheet.pdf>`_
+ (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/System_Architecture.pdf>`_
+ (10) `CTU CAN FD Driver Documentation <https://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/linux_driver/build/ctucanfd-driver.html>`_
  (11) `Integration with PCIe interfacing for Intel/Altera Cyclone IV based board <https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd>`_
-- 
2.20.1




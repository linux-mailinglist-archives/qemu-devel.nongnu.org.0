Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EE50B11B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 09:09:16 +0200 (CEST)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhnPn-0001p8-4H
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 03:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhnJ9-0003kS-HI
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:02:26 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:50542
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhnJ6-00005p-T4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:02:22 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id BEA4DDA192E;
 Fri, 22 Apr 2022 09:02:19 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id BC0A0462074; Fri, 22 Apr 2022 09:02:19 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] libvhost-user: Fix format strings
Date: Fri, 22 Apr 2022 09:01:43 +0200
Message-Id: <20220422070144.1043697-3-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422070144.1043697-1-sw@weilnetz.de>
References: <20220422070144.1043697-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2d29140a8f..94645f9154 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -700,7 +700,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
         close(vmsg->fds[0]);
         vu_panic(dev, "VHOST_USER_ADD_MEM_REG requires a message size of at "
-                      "least %d bytes and only %d bytes were received",
+                      "least %zu bytes and only %d bytes were received",
                       VHOST_USER_MEM_REG_SIZE, vmsg->size);
         return false;
     }
@@ -833,7 +833,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
         close(vmsg->fds[0]);
         vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of at "
-                      "least %d bytes and only %d bytes were received",
+                      "least %zu bytes and only %d bytes were received",
                       VHOST_USER_MEM_REG_SIZE, vmsg->size);
         return false;
     }
-- 
2.30.2



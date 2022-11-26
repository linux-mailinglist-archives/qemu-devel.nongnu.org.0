Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC46396C0
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 16:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyx3o-0008OJ-Aa; Sat, 26 Nov 2022 10:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3n-0008Nq-1j
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:43 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3l-0006tw-Kl
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:42 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 57042DA1049;
 Sat, 26 Nov 2022 16:25:40 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 53F1746000E; Sat, 26 Nov 2022 16:25:40 +0100 (CET)
To: qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 for-7.2 2/6] libvhost-user: Fix format strings
Date: Sat, 26 Nov 2022 16:25:03 +0100
Message-Id: <20221126152507.283271-3-sw@weilnetz.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
References: <20221126152507.283271-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220422070144.1043697-3-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d9a6e3e556..d67953a1c3 100644
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
@@ -826,7 +826,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
         vmsg_close_fds(vmsg);
         vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of at "
-                      "least %d bytes and only %d bytes were received",
+                      "least %zu bytes and only %d bytes were received",
                       VHOST_USER_MEM_REG_SIZE, vmsg->size);
         return false;
     }
-- 
2.35.1



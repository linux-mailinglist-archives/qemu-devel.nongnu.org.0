Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BB61842D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwS-0003bA-BC; Thu, 03 Nov 2022 12:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuU-0000p2-K7; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuP-00085v-40; Thu, 03 Nov 2022 12:17:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N49Yn-1oyuQk1rXN-0100kB; Thu, 03
 Nov 2022 17:17:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/10] libvhost-user: Fix format strings
Date: Thu,  3 Nov 2022 17:17:22 +0100
Message-Id: <20221103161727.4116147-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DaAzxpunnE4Trt5uAmlU5MSU3Szgv3nMuT8A+6hWxO2xE+/myHE
 1AkAsavioJvVsBH8HijkdqFuBx68ZLXpxrjFgMhYUIVQ3Y5/OL7Yc81mUsKIj6ZXXbzwpps
 TPa4GkwOI5WG0NvgDqSuduFn7mgNABCY/f8AGDgCLvV2mOREkKjNjtZezN6zPEi0748y/xl
 hqbel2qfBJXEbAwtB5jVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X3oWzjLM9Fs=:DF3uP6tbNHT+f+HjTYmqcU
 aYBD3NXAo+GDAhb3yfkBIt0RcUMb80eP7kBwplOoQO4bSGcP5ck4przsZH0sE93TKX8DJxBIX
 6QZIG6m73GnPDpE+yN88QPs3Lafd7jiDIHbyEsCJ4yItoUrM8hwez1IcmWecrDKcpH2M80lRA
 gaaDipje2I+ZNxQnxyF6GrEodjYh9NXr8bz03U1RpnrpUt+iwJBpp5dOWpRR2siNV0790XHOG
 E+fY3Wi0bodHo8zuLyK9pN4l4TgbuGGlkvy3CWSORsIulnFdkAxnUCP1ZPpIKYLpPWbxFXJuc
 BH6pbmMVM6c04oq43Sg2Re1P/D/zArXWL5lE7WechfI7Gdb9wUxkbg7JCUcv04C7V9RRwdFbK
 fFEeYyJKbucciW/lDYqyI/8bxrnPn55omS+Prlbq2XlAOMvbk18LzMs3Y4DPdGbYX1SWTdq1R
 zumstXa19CPA0rqGtySuZ51PbNfpx5KqcPrvDBFBlPm7FVxCbTDTIFXVZdi8SJS6njaqMqcCg
 37gyKRYyLT+OnX4T3HcfSxijXBTLovw8Sc+UeI6hqzQ+TnAOiGFDnwww56OTeuqJBTmLYHUgW
 xWuVWGWSBNjT8xbPZ/yH62hhV8dJqtwcR32xgPiX9Vi9IuH1LiL0xUBLAL5aBWe9r9706v98+
 A8Gm67IZI5P3vTRgCgnAJz0f3HmsndGrgTiMyHowNyfbyarBkPywR7XkAAbD6N+7h8nDmp4+k
 qmIvRAEcQBHZ2VqJitkNgBVBGXKK10SBT3RqyhICIdnqj+upBWCNKw0oKbpQsY8wilEhTLVnA
 zg9CaCT
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220422070144.1043697-3-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d9a6e3e5560f..d67953a1c39c 100644
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
2.37.3



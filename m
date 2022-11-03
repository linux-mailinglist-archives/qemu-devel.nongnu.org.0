Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210D7618422
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwg-0005An-Aa; Thu, 03 Nov 2022 12:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuR-0000oR-Lu; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuO-00085X-QX; Thu, 03 Nov 2022 12:17:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mwfj0-1pE4y83nLO-00y8uq; Thu, 03
 Nov 2022 17:17:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/10] libvhost-user: Fix wrong type of argument to formatting
 function (reported by LGTM)
Date: Thu,  3 Nov 2022 17:17:21 +0100
Message-Id: <20221103161727.4116147-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DRx/k9FrF3CT7v/leTeBoqsMrLA3YzW11Mk/egNgsQZzlXaZl7/
 GBQPo5f2uWN4kaaSDC0SavYb4BNqUStO4bddj1F1Tz4dm6cDM+x9A4yrBpCTJe4EBxpOxNN
 VxwcYq2L9BJvuxnHW+qiw+zBEMgYoGyvUEPn169twa/FfRrLULOeHV0/EHrM5qleSj4Y/Dn
 ilqp4AEbHFVhpoZqnorUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6QWw3QR2Hmg=:OfRFcUsb2VroKZGwJ69juo
 uRah2E7SOaudj4i/A+osJTTU5F8+ovsHm7rPtBLvDBUFmpNWavycqg/LLFmW52WMAC3sHBAhd
 HDfHnw/Ss96wYIAC+ecjKqQG7ct0oVLA+aZDxjjOCjEyBiVrENt7Cb1gyIp/4J4kqbwi62YA4
 RsNIVpVAcBRFIIOBfGDnhMX6WBIB9hVQTBidFJxPegPIW7zVHfIJIE0gOxSBJ80clB69ZWm1F
 ivqCA84Ynf5WEmHAR/ZhDrzgGDT86QpjQjeA41Lq9V1LL/KLvGhUv4GTzpAghiWU7F/xCCAaU
 HG6fH9si7HZyKR4P4VPi3Tnm7sLUCXwOwHcWLugt1+VQ96UtnuzOBWpTgY4ZT21t5bsduIIR7
 PLfgyKMsjLl3YkO/2q6vzn7iCCWwrxW+vrvz7IJIa7uIVosvVFxI2LSYKKb5gM0K1mhGF+WSl
 spdtO3A7Th/KLnvX+DjbZm3zToT6PcjCrbk9qtuG10Iu7kzuXtyXggOAh56yTiCCsIABF4Wjp
 VHM7FR3JPw7mNzhlHeQu820C6cMQU2PTvtURwokjNMTErEvKmPTGcEK/tLHMstyQKM6GDhq6c
 btrsp2/4viobF5S95lmjauhUD70xtjoM++nRxaiWTdLP9zVTTLM7pjn/y3wjmFfM6RohSl2ua
 lAY8LKl8TwSS/mVHh7go0ayCzl1ipY2swKi2wm6V2rH8bRUSj68+ingGl3/M+mDDsFcqtl3gq
 EAx6RMj5DIPZy8CeLT3Nd9Px41iNa0w7hO/x38j0pJQzpsUUo8CfvGbJvxE01hrTXn9a1cttD
 JqYdfBz
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20220422070144.1043697-2-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index ffed4729a3dc..d9a6e3e5560f 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -651,7 +651,7 @@ generate_faults(VuDev *dev) {
 
         if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
             vu_panic(dev, "%s: Failed to userfault region %d "
-                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
+                          "@%" PRIx64 " + size:%zx offset: %zx: (ufd=%d)%s\n",
                      __func__, i,
                      dev_region->mmap_addr,
                      dev_region->size, dev_region->mmap_offset,
-- 
2.37.3



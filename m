Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9632055E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:40:09 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRYO-0002Ex-L0
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRU4-0006q6-MA; Sat, 20 Feb 2021 07:35:40 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRU2-0003DN-KU; Sat, 20 Feb 2021 07:35:40 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N49Qd-1lvPIh0PIX-0100dm; Sat, 20 Feb 2021 13:35:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] hw/i386/xen: Remove dead code
Date: Sat, 20 Feb 2021 13:35:14 +0100
Message-Id: <20210220123525.1353731-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mhZaUWgBUaKPf8aOirp3XkLpuYNuO93zyNYUgU5p6/IfMCYt/YN
 vPMxAJS7NO+mfwLoC/G7FCY/+Y4XQt7QZWb/N7ZfJHVrqE4pG8SedgB1oqtGnj6geDAMjqj
 XqUMkKO+1FsiN4j/NMEHQizSXmpdydRVdd2+QFXuaGehZy90nd20mBwSBng0p+g6MonAcnN
 G8G0EQwUXBqKv+11Iti7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SAjuCbSPHqc=:5paBi1ardjxjVHLrVag0e5
 0a+AWgcaF+IPwFocH9fwbaxMAnS3Z+R7LanEUVyFOWhHWkhZ9GN0BZJC6ttCntpSwDxAt+dJu
 Eff+Q5FMkgToxfS98NN99fyuhhSh9+pxfxR4AHi8Va2Jv1A9EoGa216/99cSuRJYbEgl/RCpj
 sU34sc+B8/CaCDPpzVTtHREU5tjnYTjdAmkDGgh9tFv55oVsiYe/EWA0uk83fmRrIk1voy/JT
 7zMhKYFBxsRtRpxJ6aDnER17yWu00ah/Au5keNaj+CKyKJMUdXb7POr0G9ceBMGMAwovKiWiM
 82NdvYZmDC7r86x8xJKZa2AEDld/DSX9M4QL368+/nm7UdRzrIk+vkmUiLPbaGjLUnhwQpkFI
 kV7vQUL6VeZ7SFWWUO9Gm7sKE5GB7yaEBGDNAd0SY40xXZ/U66NJ0Z3XT0M5yTAfdB0PePM5g
 AGtl58x51A==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'drivers_blacklisted' is never accessed, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-Id: <20210202155644.998812-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/xen/xen_platform.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 7c4db35debbd..01ae1fb16184 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -60,7 +60,6 @@ struct PCIXenPlatformState {
     MemoryRegion bar;
     MemoryRegion mmio_bar;
     uint8_t flags; /* used only for version_id == 2 */
-    int drivers_blacklisted;
     uint16_t driver_product_version;
 
     /* Log from guest drivers */
@@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
 
 static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
 {
-    PCIXenPlatformState *s = opaque;
-
     switch (addr) {
     case 0:
-        if (s->drivers_blacklisted) {
-            /* The drivers will recognise this magic number and refuse
-             * to do anything. */
-            return 0xd249;
-        } else {
-            /* Magic value so that you can identify the interface. */
-            return 0x49d2;
-        }
+        /* Magic value so that you can identify the interface. */
+        return 0x49d2;
     default:
         return 0xffff;
     }
-- 
2.29.2



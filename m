Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8776334A48
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:01:08 +0100 (CET)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6t9-0006OJ-Om
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6eB-0003Gd-Qf; Wed, 10 Mar 2021 16:45:39 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e2-0004TM-9C; Wed, 10 Mar 2021 16:45:39 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKc0o-1l1SlW00cO-00KzQK; Wed, 10 Mar 2021 22:45:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
Date: Wed, 10 Mar 2021 22:45:00 +0100
Message-Id: <20210310214504.1183162-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ct+iw0tX67eaWDqE2ug6gbDbBjow/TT/waBA/swxsUtlgvcFUkf
 sp4Wpe1pm+z9KfkLtZMm5RXvIU/Or/DT5Ue604d4t9YFcfmk5Dz/IqE9wY2jcl3gKV+DbTd
 Qddv48QsoEsgTER4vRYC5u0j9YE0b9wy8XkTkya5qN0Mk+No6pevGK198vo6JdePAZqFVGn
 rMqHuftwx1fa4IsAx2GdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:awrn5DEDePI=:KCBJxuv/kyvwBufu80I3D3
 Rm+kcb/SK/GBWDH3zsdtVFXSvdLtce32BJDE18B+M1jIH7rHwYex4Wqvgqgs/xih12fJn2jr2
 AlTqiH49Kfk+V68TYMWr9nV++PiDx5AnxzekivZrIcUuWEU/59kJWh8VloU1q+WewuO3dypUh
 ol8lWu/kZ0fCehgqfjzLxpK/qmFSWhijG/3KzkPzJv5Jb1CbNMFAX4g8c3fAXCYGM05eZ72L0
 4Ey27g9g5sydUid8Bvl+m07ozFQ6oz66tRgCJd1LmR+G2Y/IYVKno1dJUpRW69ugkkHFtocpW
 zDfHQPmpRXBRSBfoh6nehFCPRmVq8RlGPrhfYAgUsHTPSYiK5a2qMbSPekVWe6NZvZQAqDb/4
 4mmeJWRGU0LO55yu+25pvE8pzdZsJ0hPaG0wRAkV2ZA74DaFBGaEv3ensn7Hi1sSnfTsITkZ1
 uTZbnC5TaQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to be able to use the 'LM32' config for architecture
specific features. Introduce CONFIG_LM32_EVR to select the
lm32-evr / lm32-uclinux boards.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210221225626.2589247-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 default-configs/devices/lm32-softmmu.mak | 2 +-
 hw/lm32/Kconfig                          | 6 +++++-
 hw/lm32/meson.build                      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
index 115b3e34c983..1bce3f6e8b64 100644
--- a/default-configs/devices/lm32-softmmu.mak
+++ b/default-configs/devices/lm32-softmmu.mak
@@ -8,5 +8,5 @@ CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
-CONFIG_LM32=y
+CONFIG_LM32_EVR=y
 CONFIG_MILKYMIST=y
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index ed2e3060b040..20c36edc402c 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,7 +1,6 @@
 config LM32
     bool
     select PTIMER
-    select PFLASH_CFI02
 
 config MILKYMIST
     bool
@@ -12,3 +11,8 @@ config MILKYMIST
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+
+config LM32_EVR
+    bool
+    select LM32
+    select PFLASH_CFI02
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
index 8caf0a727ff8..42d6f8db3d97 100644
--- a/hw/lm32/meson.build
+++ b/hw/lm32/meson.build
@@ -1,6 +1,6 @@
 lm32_ss = ss.source_set()
 # LM32 boards
-lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
+lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
 lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
 
 hw_arch += {'lm32': lm32_ss}
-- 
2.29.2



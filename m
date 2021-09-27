Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16F4191E2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:57:18 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnNt-0007mm-BO
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJp-0005Lx-83; Mon, 27 Sep 2021 05:53:05 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJl-0004H3-Ua; Mon, 27 Sep 2021 05:53:04 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MxUfh-1mjqHx1HyL-00xrMp; Mon, 27
 Sep 2021 11:52:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/loader: Restrict PC_ROM_* definitions to hw/i386/pc
Date: Mon, 27 Sep 2021 11:52:49 +0200
Message-Id: <20210927095252.2374148-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
References: <20210927095252.2374148-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kvXIkTMs5+i+HOrg0WV/nFmJ5xhRTcf22bLqre8Fax7m4j/iLS/
 +B6gAQq0Ha5m/GzJ1ZtQsNzNpWJbhszQx8sSfXR1MixPdPVoycJwzK9fGb0jv7mRiJ8rRvs
 timCoDUk07TvzS9nCpGQVLkADbi+QyrMn2WDytvFg5KG/3/kK7JGVa0C57CBg9Rm2LtVPuY
 I8vTeC6xvjQrT1thh9dOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rlIvtZAPNIY=:4FgaRclfLkWl5RHkuzJnVy
 LmqOTY9OSoDsT3ho7scGNhGfzQdgUWeRd+jLs6eZLIqW12o6mb0u920ZvTdvkF2U4QCo5fa9o
 zSnNvseYsicBKih2DqSYpTc1geq0ch/kvydiNRXUy0ahxO/lZf00OdDETp33dMdLjTUNqREkt
 QUnuFmRLLDHg655Sp9NJhue0wgna1IqqiQ3751y7R+MLKFZ3pPmysCGlxEDV1D/9vra0ufojE
 riW8nYvEQRpN5MIoDLoL9kO39tz6XOukiNnsU59RAukyNAyfWHpYTWspSVep54xdy6KkrQFJc
 Lkxh2p+tm7BJM0+3fJnEPmL6xyhUOAWcTQFlrzaf4R0ljqySqV2Rk+jrzAXlA+LYkbSQsXnFa
 SAX2+0BKkgLWYmyL3STbMkv5HDXw+97+6oW2dSPCrtrhBo3EI3mPFgvqQu4jZ053RcDc+MLTW
 g/ddgzhYd2pXpYnKfUexTmVQ015A9MfP9fb/46P5u7Fqo4LfwitTxr4nilOePfdTryB/D/IYd
 b+ZZazLGvhMZvUr/N+mqCtjIO+kcaiYOaJHoNFbWkJvlD+JlJRRPFKhs+gBSYhKlyexWPDHcE
 L6ev9n44Fy+flgY8hgGKnB0Y+d4bNqkn7loHptc7zY8lTHPGx7fL3XSiYROjxI2PuQ1wPwEJN
 FrFZZecVojhI+V5TqxQ30LpLL/Kx21S8YO/uYi5+XnTOcMINpcxKizvTTvSyBhA8a242lX3Rq
 5G8VeaMpuANm4sqhZ0OwrA3ROZSOje+3j1JHAg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The PC_ROM_* definitions are only used by the PC machine,
and are irrelevant to the other architectures / machines.
Reduce their scope by moving them to hw/i386/pc.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210917185949.2244956-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/pc.c        | 6 ++++++
 include/hw/loader.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7e523b913caa..557d49c9f8f1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -843,6 +843,12 @@ void xen_load_linux(PCMachineState *pcms)
     x86ms->fw_cfg = fw_cfg;
 }
 
+#define PC_ROM_MIN_VGA     0xc0000
+#define PC_ROM_MIN_OPTION  0xc8000
+#define PC_ROM_MAX         0xe0000
+#define PC_ROM_ALIGN       0x800
+#define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
diff --git a/include/hw/loader.h b/include/hw/loader.h
index cbfc1848737c..81104cb02fed 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -336,12 +336,6 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
     rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as, true)
 
-#define PC_ROM_MIN_VGA     0xc0000
-#define PC_ROM_MIN_OPTION  0xc8000
-#define PC_ROM_MAX         0xe0000
-#define PC_ROM_ALIGN       0x800
-#define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
-
 int rom_add_vga(const char *file);
 int rom_add_option(const char *file, int32_t bootindex);
 
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54C3712C3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:57:44 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUOe-0006kV-0q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4S-0003O1-7t; Mon, 03 May 2021 04:36:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:55397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4G-0000jC-3y; Mon, 03 May 2021 04:36:52 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mgebs-1l5Ei83Lci-00h7yH; Mon, 03
 May 2021 10:36:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
Date: Mon,  3 May 2021 10:36:03 +0200
Message-Id: <20210503083623.139700-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EIdyqqiYgUrrZj2RSmpT0HhtrqZEXYQZqUs+K/GhORXTptMAkv0
 62Vdes5Dj7gcWm8LcQBqra02GZk9lhcUnvH4UDSPpC0UP6spCW1pGMnFRtVo/lRfPv9tUDM
 hwRc+KXovN/UQ8O9tuqHS5t4FoHPBaGuJCuKWnKvxk30WTX+BY6luvx0oskBLUyEcOT6j7O
 M9X/dFgPcMmPDB2NLENWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sxh0g8FtvZc=:1IwzSeI/UXY+YMgnY91sJC
 Mc1gj54hjdWHs/xeLPBS4K8QqPOZs9aHfJslpEAS9AvuVyOh02niZyfqP9PlTxKX/xZJFLvSq
 UTkpdz4r1peYxMjuWXKQ8CN4S7h3NHudEN9ZP6n+x7dcyr5zhG1O6Dkx542nxb4R/wlRD38it
 4GNklx7PmoD1Kg097dX1sQm3x0c9AL2LDhKWtEJMgcpQkcRrEl907vTip0FDwMJe6yt2LlD3h
 7rzOC/H1wCksAPE0sxsROYPAWv2+DWcz/wayMuyRjZyMy0W+18LSE4NYjqyLJ9pXsXDBmc/7P
 sbvz6net0AfiaDkci5g6fZS7oMUgGyxuTzEk/usYHAsoJsugEBgsG2V/Yp5vA0gBA9MroP3vh
 LwliBvqfbCelxAFPTUwG/TEf0ORpd+WrV8FF0rekDluLk6GeltBIVmlJX1uoCiwsOfnTjgC/8
 y6mtj2lLQxmBYAybJ2y0vqDG73cZZpTUveXLK4lycoJ5EHOrCqp/L1PLS/eEfzNlr46HI1z9m
 XwTcOZEM4DRAC5cjNFlOHo=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Microdrive Compact Flash can be plugged on a PCMCIA bus.
Express the dependency using the 'depends on' Kconfig expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210424222057.3434459-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ide/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 5d9106b1ac2b..8e2c89345497 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -41,6 +41,7 @@ config IDE_VIA
 config MICRODRIVE
     bool
     select IDE_QDEV
+    depends on PCMCIA
 
 config AHCI
     bool
-- 
2.31.1



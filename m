Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06439E72D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:05:01 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKYW-0001rC-NS
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRm-00041d-HM; Mon, 07 Jun 2021 14:58:03 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRY-0005rD-5w; Mon, 07 Jun 2021 14:58:00 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MDhV1-1lg7RK36wR-00ApZL; Mon, 07
 Jun 2021 20:57:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] target/riscv: Do not include 'pmp.h' in user emulation
Date: Mon,  7 Jun 2021 20:57:20 +0200
Message-Id: <20210607185730.346641-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QbBK+DAwqqb5iS6m76eXQ5QRQ7wkFI5GTnLMrBXPPjaONlCmtae
 cfsMU1oUCwqw+I8vv+SMSbU6U/3pZN0xw90biY5CTJI3Sfbvq1r4RF+avrPR1PBaeGXBAUf
 pkK3QV+1K4dV0B14RdIhfPemcD5sjMzksaPeYXiNmabvFTOboeVp6EcMaMihy+bJiXid4ZE
 nmUK8vU1Y/2SWA9eNJNTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bLliPhQbR1A=:aTB7GfM+xTbyFyHCoLmN44
 bizWkT1izq/oRe2tg9lbDGubszLHtAqDUvOQMg2ZMPv1UEgQclnhDDSToezgp9SxXrFTLJP71
 GLCgd3k7AOZrGNKA9A3mmRixAWlZfT6Mgc3LWhSsnYvNUFOV+trdigJ4EN8m+HMqLlCx+3+av
 w2xBiPjggsXDWlHCTvt2TlYzdGxSRgvFOADQe3PLeaO0A3Bv+OIw/DoWcNaAQ9mTp2M5lscl8
 1U7eJQ2aSYgRLPQP0txauoc6Qv0tmE9itjvbGhUkE0jOhx1j+woYhzS+xAO64qcUVLUScnoYj
 6CM7A1m5La0ofEkW/Ye7kksTaEmIgaZoRCGMJ+y9z1SgOIYlm7S7CK3AxY4Or3Mq1CN2hHKiI
 yYqONzScN652OOCRgKDbPepoFofKJNc6fheg15g6SaWbMmV8ApvSG6MweJbHPCbKGI/W39YrF
 NvHoeJufM1+MS50RDCeP4woJeTXsY1nLOoMUmrR/9JFuykRdeEfaozuAggnMXU/5zxV1snfUm
 30A8IkkaAWa1NWj26kfQCI=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Physical Memory Protection is a system feature.
Avoid polluting the user-mode emulation by its definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210516205333.696094-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7e879fb9ca58..0619b491a423 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -97,7 +97,9 @@ enum {
 
 typedef struct CPURISCVState CPURISCVState;
 
+#if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
+#endif
 
 #define RV_VLEN_MAX 256
 
-- 
2.31.1



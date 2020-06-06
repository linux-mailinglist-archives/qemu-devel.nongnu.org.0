Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC31F06BB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jun 2020 15:25:11 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhYow-0005T3-Op
	for lists+qemu-devel@lfdr.de; Sat, 06 Jun 2020 09:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jhYge-0007P1-GR
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 09:16:36 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jhYgc-0007gQ-E5
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 09:16:36 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqK6l-1jBoQg1q7v-00nSDN; Sat, 06 Jun 2020 15:16:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/19] arch_init: Remove unused 'qapi-commands-misc.h'
 include
Date: Sat,  6 Jun 2020 15:16:03 +0200
Message-Id: <20200606131607.1250819-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200606131607.1250819-1-laurent@vivier.eu>
References: <20200606131607.1250819-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ebDdUmNyWE+JgGJagF70UCUYs+/bfqnwJWD1t7CsFIiXdAvEzjx
 7+gvQ1Wu2BHfGpBBtIVo1pOwsbMkMZRfuNfgoGjDBv/wVvAFouA/wrdaVyLtL1Y+dgIeTZV
 ucYet67GGwQzlmMZqawlz2gDO5uC8nT3wjRJTlIDLsq4lpJ7RkYKzdOGz5E7ggey6Rjhkas
 7wK8tSlyafXTg2YZ2iNdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PFwp7he4/P8=:N94OsXo35uBaB8tKXMNQ7h
 aBHAupNsRt2sRUffN/NBAIHtDjeHyXlXAUARv9/HoGP2gxbf5oaU76Yi53X+NGPcQiyFOe+UX
 n3Kt6mQS0TijvFISz9TZjCU0xwTc0SRU7F1U94wAqHPJ/BWuNUV6geNLAbvd4eDh/UmNdbE5H
 TZyqhUxfVVmPygM7OOzzyPjf429ky6jivs/MhbI3OYCqKVfAtsy7qTHgyZcH75RWVD1B7ZP5+
 kb/gbFY8zcH0gnkDMrJyBPb7miy/L/eSrdn6MSrpzy4bmlks5w9CqYFQwFpxYlef69HZGDaa3
 MpMX23ikTDEj7VC/FcyANqZb+t+xaUvxNswcdkJ/+hoURwKvRE3xTGMOWGoPENyxm9KYnrcgz
 ccX5HVZTnn3yc3O1ITHTVffq8BEa1ke8ZBP3AX/aDzfhnBQhAWZhxkWCMlKSFrEE6lcwm8HcR
 WkFm80vmVGUpqfLVsOAtnhm/8F80YuOqMjnesKXPu/1aBTZxJ0BOKUXE9xaWLFlJ0B2Qc/h2S
 tHR7WOkCwJAVXI7JLErKP35j2ox53gqI/+BPeFYiewpw4k1pzVD5pCoZAtiO9w2Y+FJVYOb32
 l6f1nuFII3sZz2/I5QkKKg/6tqdiafaSNnU784IRstu2o1KbLPGYRrFqhVVVP4r/A0VJQyFZE
 aBmNqGnfascNCO1LMiYivRSBQVCCujTX+8fdAzeXAghBB4kICAE5ZdeGOCKALFXLOHfeSjoDE
 L36W3+DG8XZ6zXiNClPjbjbeHE40DRPYraMkTCYo45papYF0mtiJKZDlcOVM34+VKkRpaQoYe
 R4cAPN6skdle1KtyeqD2InyBEMC1NnPL9ZUKs0jenrA/QOPfIxEfdiEsdRKdoFMy60ZT1pJ
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/06 09:16:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
this include.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200522172510.25784-10-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 arch_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index d9eb0ec1dd03..8afea4748bad 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -27,7 +27,6 @@
 #include "sysemu/arch_init.h"
 #include "hw/pci/pci.h"
 #include "hw/audio/soundhw.h"
-#include "qapi/qapi-commands-misc.h"
 #include "qapi/error.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
-- 
2.26.2



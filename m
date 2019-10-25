Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8538E4682
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 11:00:29 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNvSO-0004fo-HA
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 05:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5S-0001Yv-Tv
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5R-0008EK-Ja
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:46 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38447)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5R-0008Db-9l; Fri, 25 Oct 2019 04:36:45 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsZBb-1i8BJJ30n5-00tzih; Fri, 25 Oct 2019 10:36:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] hw/rtc/aspeed_rtc: Remove unused includes
Date: Fri, 25 Oct 2019 10:35:11 +0200
Message-Id: <20191025083511.11463-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lI4TkJBfUxQ5RUOYwYG6bZuJbjXKspVRe+W4swlSFBSBuyu1HyO
 oGI5K+mtI61xh7jqUe3m6LSb3lrFZg+MIJ7wO/nMJc+SIeIdCgZJKcEbcmODzjZCSma2lFo
 tOco3nWHNYjLvbaKhkQEdvylcdcg1UlgmfthPhGT2Teigyfy8Baas7MAOUxTGhA450sJE3P
 NWwOdmXP1/hHaCyGdh5fQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WkqHmDlHu1I=:h3ysTFZt4csUPLJ1KgbzED
 0pHTtKygM0HBCR4yG0JHlk1O/NITsvm0giRboM72MDietvJTfkJXH/Dc1lg0LFT9UouQzaA8x
 Z/9Y/lnNRvIp9WHpZ+doEmRk/aKSjk0zTDLZU/RXQ03dsa0Xdr/tGdo7OHElwZQRA3eiFxlq6
 SHTeg2Mo9hBQNh6slq/OS1S6y6y5Guj4h/wKcD5w39+ok5XNYI+ugF7nBPAq/5g/q9eTGv5cN
 elWCDRdvM4LTaL6A0ke1t5pFeuzolMDuJsXGvLid/+suyDynf4nSX+4P9XFQ1agDFD7ChlcV0
 Xzx807xY9G1rQ8qH21o5oTMTbZR2ws77x3j8q/T29deCb2TCR3xCbJp2INX+JpA9dLQhlPvTz
 kiD6q848GzxcJQbFQevCgTOOazm6TAFOJrLpwQ+7joU2HyQp4V0jkEQJ7QdkcNQBgzeI9dJ8M
 J/AC+ahJpEaZ3G1cFjhV+UHpGnqpqpTUXHSVkjqVf1A0EqqC7GcKVwAZRo6K78mP5fAozb6oW
 VewGL0zxB54FZr6r4m8vnTyHt7AfoyfuPysU+Pz4mDH5ZQkfvIO1Mkbghm3dEMdB8bqItXQ3q
 8BdIz2nGmXXoxThnlMlCeHARJkTRFA+ujljeKiu7UgCRzohVhXYUH+yLePwrhEiwy874YNtpD
 iMpsalYXpPGu6kckyvKBVznBdZ381nzX/n/FKERWcWjC7PTXx4E4gwfOCGzbCWpYO6xq27cxn
 d2O1wlv0E2pFqqWWKxXbjtYXSWB8MAfpF1+EwtJ8gUB9BcjmDc3athEhWFYTlprp3+zQHoWnW
 F7VyTJvbuKH3tpwM8yDxNN+0NXtpiw9hN9EKbFwCvqe6KyNKnc6H+bu6svvtELo+gPNSSW91i
 aVqLg5isJOUIrrzKB1f1iAPs/28s+eW5UbCiAvfMo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The system <stdint.h> include is already provided by "osdep.h"
(the scripts/clean-includes file clean such headers).

Commit 64552b6be47 suggests we don't need to include "hw/irq.h":

    Move the qemu_irq and qemu_irq_handler typedefs from hw/irq.h to
    qemu/typedefs.h, and then include hw/irq.h only where it's still
    needed.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191003230404.19384-15-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/rtc/aspeed_rtc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/rtc/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
index 3fde854ad99c..b94a7102688a 100644
--- a/include/hw/rtc/aspeed_rtc.h
+++ b/include/hw/rtc/aspeed_rtc.h
@@ -8,9 +8,6 @@
 #ifndef HW_RTC_ASPEED_RTC_H
 #define HW_RTC_ASPEED_RTC_H
 
-#include <stdint.h>
-
-#include "hw/irq.h"
 #include "hw/sysbus.h"
 
 typedef struct AspeedRtcState {
-- 
2.21.0



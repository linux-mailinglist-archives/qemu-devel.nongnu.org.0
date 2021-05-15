Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A610381791
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:19:18 +0200 (CEST)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrO9-0001cq-F2
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9z-00071z-CW; Sat, 15 May 2021 06:04:39 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9u-0006sA-Pa; Sat, 15 May 2021 06:04:37 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N63NW-1lSOg302zg-016Rv7; Sat, 15
 May 2021 12:03:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] hw/avr/atmega.c: use the avr51 cpu for atmega1280
Date: Sat, 15 May 2021 12:03:34 +0200
Message-Id: <20210515100335.1245468-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IaGvjdPnZiCNCj+YRP9z/DxTQN993nu7OfbqwwHixMhluyG8SDy
 0eDWBXAP2d59UBMnFBq5xE8SmhTWXg1UnvrSrfUokMFyuRSzSpXxGGUISYLsZzPninpyr1Q
 VEwkt9sPj9YVCpjSNFHvGmunic4mpzOusFd+wBY8hh7vwlhNr7c9Zelg61OSDQHPQl9hf1C
 XCPxo6pMGbM7gmjrvzKgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bufLQu0WX80=:zcEP2f+8JVe4pEnKixET9Y
 JItrUW7mF56E0ARZk+sNv/ns9HQhHBEqJIHKjtJmGwbOSmJXlOTVCdm2aD57c6A3EMZrlukI/
 xeRWliW9WDmf6DZQcS/yfvlKIIy3TSeUk+nCaJIk31/i/32/dBTfMpSgh4FYvTlNakgh2Fbb/
 0jSckwo+8z1ipmYYcm9+l0Sut8JZiTUFIErGPcdRZzjBghKYtF9p2Pq+9lkEC/F+8biU47Jiu
 FJy4Srz1agC9/GjAqqM+ihv419tOdQt26lKh1KhjygZUwSkHohsC9haYnoh3Bwi7w532BfTfc
 Ka4JkGvy8avgugbsJvt7Wcf4/BG0MAd+lDPHz/EkCpS6ObI5PioUMzN1i3MRVAnUfsRYhvjrI
 L8dO+we8sjgzNDE8d1Cr8kfvp044fl8kPX8SjABnN/F26CV4n1u7z4nmJX0exOdNOls+4M3P4
 c58gFuh9y2fFcZh+exw2Nq7izKbeiXb4lK06480T/OPpIZ9YYl/ZYW4xajAYa4/ssVuMkVom0
 522rTJfw3wuVYYP1GwQyII=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Frederic Konrad <frederic.konrad@adacore.com>,
 Frederic Konrad <konrad@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Konrad <konrad@adacore.com>

According to the as documentation:
 (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)

"Instruction set avr51 is for the enhanced AVR core with exactly 128K
 program memory space (MCU types: atmega128, atmega128a, atmega1280,
 atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
 atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."

But when compiling a program for atmega1280 or avr51 and trying to execute
it:

$ cat > test.S << EOF
> loop:
>     rjmp loop
> EOF
$ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
$ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
                  -bios test.elf
qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with 'avr6' CPU
qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU

So this fixes the atmega1280 class to use an avr51 CPU.

Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>
Message-Id: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/avr/atmega.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 80b8a41cb5a5..0608e2d475ee 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -401,7 +401,7 @@ static void atmega1280_class_init(ObjectClass *oc, void *data)
 {
     AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
 
-    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
+    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
     amc->flash_size = 128 * KiB;
     amc->eeprom_size = 4 * KiB;
     amc->sram_size = 8 * KiB;
-- 
2.31.1



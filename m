Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833F33E097
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:34:30 +0100 (CET)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHKf-0002h7-De
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3V-0006kH-TK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3T-0003yr-Q4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:45 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MV6G0-1lFAK40HsE-00S62v; Tue, 16 Mar 2021 22:16:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] mac_via: remove VIA1 timer optimisations
Date: Tue, 16 Mar 2021 22:16:31 +0100
Message-Id: <20210316211631.107417-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S/r5LIf4Ot8NttTzssD2oP9kzbyOVUfmDdAUTwwuRVip+tlCRtC
 k/NvEWQbSH6F+JYYzrVygN84H5ia+jWUQPUAMxSssnr8Tp3oOCwCsaOZkIDI+5QOl13N4xS
 Bh08cmm9+ZGmIXXsbE5yCrgcECRUQuFLi6+Bq/NoODktr7UZJdUvJqjj8r4kbSVK81rzpwU
 4hgdqZrq75y3ETOQwy2lA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M3Q7F/IxJd4=:eI+F055F3LAJq+vKS7Hgj/
 UAwvPucwka2g7PCm+er1IKr0IV7VH+aoJmorUaSh5bS1Nh5np3b36m69kQ6wvPfGH6KWSpLjZ
 B+pQCDg8BknQiFh2WwMLT5U1CmWwzwAaNqY8WeEYudTqdWc/n0ljzdIv+wk215Fvl4HfC4OdU
 ck52XcvOf53uRzQS2cxkdhkKvGqjrg9dkPITRKVLCQH8KkkN7dTFOhx7pq63eQU2MEEfMj6m6
 lsKhi8SkxklP2YXIW4j5z0OdR1n9OtHG4SrGQeZUEi3VmfFpzjJujoCYfKY6fuUqd1COnL1Nh
 CA1H0ZFn9/WfLCtZ0LwJsAfzW+oARAPiGyEpChYnmHG5YnIv4lEZ6MqzIVcxiwFPdSIqzO+zU
 vQoePzyDPwE4OfCF0cl/gmJ1dJcmjBlyut3ShpNxPINCs8Im8XZPNas9E3890dMxCoJvwqt7r
 hj/4I4klGw==
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The original implementation of the Macintosh VIA devices in commit 6dca62a000
"hw/m68k: add VIA support" used timer optimisations to reduce high CPU usage on
the host when booting Linux. These optimisations worked by waiting until VIA1
port B was accessed before re-arming the timers.

The MacOS toolbox ROM constantly writes to VIA1 port B which calls
via1_one_second_update() and via1_sixty_hz_update() to calculate the new expiry
time, causing the timers to constantly reset and never fire. The effect of this
is that the Ticks (0x16a) global variable holding the number of 60Hz timer ticks
since reset is never incremented by the interrupt causing time to stand still.

Whilst the code was introduced as a performance optimisation, it is likely that
the high CPU usage was actually caused by the incorrect 60Hz timer interval
fixed in the previous patch. Remove the optimisation to keep everything simple
and enable the MacOS toolbox ROM to start keeping time.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210311100505.22596-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 43 ++++---------------------------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 36e70674feda..ff0156db76f2 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -305,31 +305,18 @@ enum {
 
 static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522State *s = MOS6522(v1s);
-
     /* 60 Hz irq */
     v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                           VIA_60HZ_TIMER_PERIOD_NS) /
                           VIA_60HZ_TIMER_PERIOD_NS * VIA_60HZ_TIMER_PERIOD_NS;
-
-    if (s->ier & VIA1_IRQ_60HZ) {
-        timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
-    } else {
-        timer_del(v1s->sixty_hz_timer);
-    }
+    timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
 }
 
 static void via1_one_second_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522State *s = MOS6522(v1s);
-
     v1s->next_second = (qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1000) /
                        1000 * 1000;
-    if (s->ier & VIA1_IRQ_ONE_SECOND) {
-        timer_mod(v1s->one_second_timer, v1s->next_second);
-    } else {
-        timer_del(v1s->one_second_timer);
-    }
+    timer_mod(v1s->one_second_timer, v1s->next_second);
 }
 
 static void via1_sixty_hz(void *opaque)
@@ -900,21 +887,6 @@ static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
     MOS6522State *ms = MOS6522(s);
-    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
-
-    /*
-     * If IRQs are disabled, timers are disabled, but we need to update
-     * VIA1_IRQ_60HZ and VIA1_IRQ_ONE_SECOND bits in the IFR
-     */
-
-    if (now >= s->next_sixty_hz) {
-        ms->ifr |= VIA1_IRQ_60HZ;
-        via1_sixty_hz_update(s);
-    }
-    if (now >= s->next_second) {
-        ms->ifr |= VIA1_IRQ_ONE_SECOND;
-        via1_one_second_update(s);
-    }
 
     addr = (addr >> 9) & 0xf;
     return mos6522_read(ms, addr, size);
@@ -938,9 +910,6 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
         v1s->last_b = ms->b;
         break;
     }
-
-    via1_one_second_update(v1s);
-    via1_sixty_hz_update(v1s);
 }
 
 static const MemoryRegionOps mos6522_q800_via1_ops = {
@@ -985,16 +954,10 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
 static void mac_via_reset(DeviceState *dev)
 {
     MacVIAState *m = MAC_VIA(dev);
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     ADBBusState *adb_bus = &m->adb_bus;
 
     adb_set_autopoll_enabled(adb_bus, true);
 
-    timer_del(v1s->sixty_hz_timer);
-    v1s->next_sixty_hz = 0;
-    timer_del(v1s->one_second_timer);
-    v1s->next_second = 0;
-
     m->cmd = REG_EMPTY;
     m->alt = REG_EMPTY;
 }
@@ -1033,9 +996,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                                      via1_one_second,
                                                      &m->mos6522_via1);
+    via1_one_second_update(&m->mos6522_via1);
     m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                                   via1_sixty_hz,
                                                   &m->mos6522_via1);
+    via1_sixty_hz_update(&m->mos6522_via1);
 
     qemu_get_timedate(&tm, 0);
     m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
-- 
2.30.2



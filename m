Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B65B59A4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:51:01 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhxs-00089A-9M
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVe-0007uw-5a
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:56 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVc-0000Xk-Do
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ51YB5qN/dAK65+75ddY7C7jS/BdVoUJVO01V/vTpjHIeMIyk5eAHmpGJYlS9fTX0QoJ81zOyN4OIQ3b6z8cLAwDuRIue5ZLz/daXqClhVF76DJus7XNySSuS2QCCr4VZZdlGAF7ctTTk0Akq/5g5sbX8o1LrKfrrpFu+Q1HFN2aCPOXAfVv0u6FloIBsM6rWVevVtty6wRSGxu1VEqOfnO+417AtVq+JYD4jRTmUAOQ3cEfXjQz0k0hKmglxz8r3ZlCy8GrS8xujPw/Uc2Dpkb9fcMuPE5bUuUr76z89iN1Eafmsw3/7RXK948/P8oYIbf2XxXgPEVxRhQsVVT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVnueI5fBkxJtBzGKO9tajMDGBxmeIiMebQB0DfBE3k=;
 b=jK8i9YvxS5LarOi8ri5i/6XFyIIE/qmpYrt+Yuioxz4YDl3+ocwRNkQeJAn+cjNLHNPAA3VWG9BpQetlXQbtsS3N0PvwON+vZCrRoeqvKjFwaioZKVjofBcOjTZ+WZJjmVMr/It8C6zLcPxJQjZyEekdcYbl3oMRmfn+FLDlGhlJP9ivyAeN5yWXpfNtq3jjnX+u4DXe3WDG7ipA8G3morz/bVCwEWIgaYwfO/Huhm+23tXr96GOzpUVQbA8x+s9FVYuuMdDIkiKFbzsOlQcbN+HYQOHRFagTEg1XzZl3xx0n6iPcb6rgCgg7keRC6lHSaIT+OVUFipdNIRgHQAlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVnueI5fBkxJtBzGKO9tajMDGBxmeIiMebQB0DfBE3k=;
 b=atYDQAYYlpEuJ9gOfiLybyvkn91TBqndVHi9B4XsH8iTkO+5itSxpmcvxkO1nWmVePBgM7LofQGCCYV9HjW86IY2sA2jtxzanxmUI3xiSj43geDyw1iCe/J3iFj/0QSuXTXaEaOxB1Ht3Avj8NyeVjEL6rqg/ZyqoHYLX6u0LSxVWlQhK+xRimQtQ2clmTJ1x310kEy4Tra3x7GBpPnzq4y09Okm3HSwxJn4joWWC738ejG7gG7mA2zCKnUcv4h3ip2mcNSXwT6zPM88q6U185f4c6RyeDsaQ00kzx3f0DXZGiixYkl/cTLY9lP0pdSRG3C4//v7zo72VqF+43DBJg==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:40 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:40 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 5/8] hw/gpio/avr_gpio: Add tracing for reads and writes
Date: Mon, 12 Sep 2022 20:21:03 +0900
Message-ID: <DM5PR06MB2537A9450801CC79DCD955B4E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [tn4nRy6f4HyAh50oNY3cN2jy2ErIC7/y]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-5-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4cbbbd-1d26-475d-81eb-08da94b0f699
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmqxq1ifAc9vd1hrDdkf/Zi2KGZXlYKUcfBMOFbMOXN0G6acWTOsYBhPhFDYsnGA+t7NOIeHL8iixt0dJTjlOCBY+QJETnqoqFfgXUgvOXlrCfurUgt9O7FhfCpjhMS+2Pcokm2AQKy/WRPA3Ng6hqTbdlsnJY8nNr9tJKN5JbBwSO3n8XlRp8EqoPKg/8RKM87gs4+64c7rcmTqcNpPBwKDHj1lwHKfr1dgaX4U43ifPaC3Kn/32kUfhfFl8DfNeirzmVD9zoHKFax4YzTRUZFEqsGFONeLxLq6tjCgemZU8UyOq44GDaCTQZKLivAQU/4hCEtYowCzA8lIY9HIgJPJGMfb6WfYqRxeBpO/pV/N8USENZO/1fCpoyM6iH9el7UxuFBUWezeJjzPWjI5oMJmvATtLIwA0BmSA+FtPbnLXR1p50spI+e+JFlrXpMaim/yu3/BBCXKA1PPJafjPr/HD09auZfkpNNzJMLLFoTMN5qxHf4qUh8AeGZp/RUJT44w6RuuYGNGH05BkYFCDUlFnFKdI9P4EzWZgNUNo7bv9zagubvOhEfB1vI8b0KsZJK8x6LBVPtnTDSGXFxGSsz8ny5gGLpAo0wu2jfXIG8bMHng7hVBaG7F49uOnhDMedj4YKawpMwCX/+fBS8HswdurhuJbX5CTG+7Scc7kaogoXM4yEcKdtDe3uXKFTzsyCG4yKtkKsPnKsKMVwxNpy7tBG5paA/tN/ZPelxvXuvPdmW/9p4ZST0AyWDJVkMsJIQ=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpPrXp5kueYKDNp+QAQGou1H2NBiynIfJwQyFc76WeO+tblMgbcKXGz7kLqNGQhN7kvspM+OKVZk3rk9yV6hjseqj60+BJf0Rgj3XmqMssVFaX72s3IiQpiQ5lprncuFwjjTDzAh26dPLijklvLtr5luGAZStouvLp/4qIxz+qQXLK/DteJgASGq85M6Cn6YE1tjHsmLHt8kjenIlnvM9uRxitNDjJRG1IwJpv7hDz3sWIt+Dima2xkXLCKAbOn8ySAPlV93j+9HgI2GBk9F2B5LJLf8ot00Yk6zfuDNJkXrxzgfmaSjdiex7zcoByJgKiYKY+S6IVmHZFesnky2D5LzmLks3Ml1Vs6dolq0u3ZrXRZu7kghv8QeYE2XMzfunu7ZUUmz2dgLSbnxfZ7g8tjmq5ZbL3zj6eyGoKsX13sod5z62rvYxN/ffWq+8rObsQ4QptN3KAwipFaFC2NZ8F+8RnUHUGEMJ06ZH+i0CFcOBHQW2WEIkjEBKf+dpvHx8JWHmbxGhdO/j3vu7sYiM3GEltBo9FMPjABNm9nKHtSwezjmtf088WGYYW+T26dVwLyUTKy9GuJZvL04anT/I0Iqtu2fvzFF0GtSdZ6hxhuIozSKg81cBZXTnqCorkqbCe8WHZiSordLiJX0NkZAdA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlAvb1crUlhVMzZ2OWF5N2diT0h0eUlwcC8xdCtvcURFb1V5U1Iwemx1RE1R?=
 =?utf-8?B?MkFpMlM0NEN5UjM5emg1QjBDQTlzQXp3SndkdTRQVTJ5Q2NVbGJCWXFBa3Va?=
 =?utf-8?B?QnpXcG1scm0xVURMSDRzQ0h0VDl0NUN4eVZkSHlqRi9MQVR5WE05RzZQTzF5?=
 =?utf-8?B?MThRc1JhSGxUL0wweXBsMEx0TTg3c3pEbzdxNk41MFhmN1B3U2hTazQybFZR?=
 =?utf-8?B?citCa2swWnFPVG0za2dmRWhCZE5LZUJGRGZEQjlUTjBuc3JkWWI4TFQ4VXpX?=
 =?utf-8?B?c24wTTlMVDFhSjlhQWtHZnVHeFBOZk9Ga3BxNVg0MmcrYTVXZEI3QjJpSTlN?=
 =?utf-8?B?TEM2a2kxYnZCRVRYNnZHRWxTc3BCdkVmb1JXMHd1RWJwU29nZERXMzlaU2cx?=
 =?utf-8?B?NjM3a01Gai9CaVZTdjN3M25meTU1alhrUTlQR3RROThaODZFM0p2R3hLQ1Vz?=
 =?utf-8?B?SGljVml5ZTEzOFEwdjBZUkpGTkh1TWk0ZzZuREd3SHdGVG5nQVJUdGRGWlJt?=
 =?utf-8?B?N2pvRVZ0U2V1L2VsTHdZSnlOTUdiQklpTnlyWW1Qa3hjc0x1ZFBTK0tndnRG?=
 =?utf-8?B?VUN1bXZoejl6ZDgycGJwa3RQMXIzN29QdGgrTkt0V0tzczR3TW9kOHpvb0Iw?=
 =?utf-8?B?bzNsNTJhUEk0enRVenQ2NkxCMU8wUnFrUnFTYjFXWDdLOGtscklyY09vUURm?=
 =?utf-8?B?QWlpREM0bEttRUFjVW1pUkpNVy9ZSGlmS0N2QVpWUElQbHlUMUZCK0lBai9I?=
 =?utf-8?B?d1Q3YU5QcWJKbFIrYVJxWCtabXo5VTRVMVZ2ZUQ1ekpGeXdRb0gzZm04MWtK?=
 =?utf-8?B?OVdjNlgvSncrQ0g3K3ZaZ0x3RVFrZ2F4YnFOL1hYYTEraGZBQkhTMFhoSWtX?=
 =?utf-8?B?ZkI2MlArdzZ2UlRNWmFLbkpZcDdSRHpSTjFGOWorZWdPaU1ielJMay83YlI2?=
 =?utf-8?B?dVVpZGtOVlNybUNRczF1cktMSXdGM1pyc3NEQThmaWpiVEpYcWpwNzA0WWE1?=
 =?utf-8?B?RU1xSVE5dXBxLzk3Qms0ZFdsK2Y2QTRybVNZUmR3c2lWakxGWWtFbHhhOGg4?=
 =?utf-8?B?YWRwcG1zU0tYZ2dtNGVSZ25zTXZhemc0RnYxNTc5eFdBNlJGbnNJR1owSXFa?=
 =?utf-8?B?cEMvdVBONG83WHBjMFFKc1gybDFwTUhCbWE4aTcvS3B6ZmxNV0FTajloT29E?=
 =?utf-8?B?Y0JzbHhPMFRCdFF5SlNpZlRidm90ZUNVOUxFYVk0NFlQM2FoUGE4T0VBTWNH?=
 =?utf-8?B?NXlkQmJHK3VxVW9sWGgxaGxsenJ2SUQ1ZjJTUGxJNTVYSExsUFNGYmlZUUl3?=
 =?utf-8?B?MkNkMUhhZk9taERsT3UvaGpqNWVJT1JuNHJFbUROVGM4N0lJZmpPRnlFWWlP?=
 =?utf-8?B?ZmY4MEh4Qi95V2RzMVpYT1RQUWVUTXBOR0VvYzE2OUxNaitxWWhuZUE1U3Bz?=
 =?utf-8?B?WXVCZEl1dWxtdmgyd2tHL1FYYnBoSm12c2VxTWdzUTh6Q05mM29EeTdQb2tC?=
 =?utf-8?B?ZHhwUlNJL2ZFL0xobjRYb3JjckNkQi9WNHJabEx3N2JhckxwM3dMU3dZTE9x?=
 =?utf-8?B?eVZxcE84WkVNV2RYRUdjNjhyc2JCYS8yeDdKRmViK3dacVVETXYvZU5iWUZm?=
 =?utf-8?B?SVUzeTVGdm9Hb0dUY2k0dWdnRExsSWhtVzBoS1RoNHlXZEFCVk9JV2wzNjFY?=
 =?utf-8?B?elQ0b0p5dS9MRXFoZXBNNEVKOEVRdzdrUEt2VjdqQTNYbHZHQjk4RmxCTGpM?=
 =?utf-8?Q?Gxr+bsDxbE4CL0ymiA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4cbbbd-1d26-475d-81eb-08da94b0f699
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:40.4381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB3876
Received-SPF: pass client-ip=40.92.20.10;
 envelope-from=heecheol.yang@outlook.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Added tracing for gpio read, write, and update output irq.

1) trace_avr_gpio_update_ouput_irq
2) trace_avr_gpio_read
3) trace_avr_gpio_write

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210311135539.10206-3-niteesh.gs@gmail.com>
[PMD: Added port_name(), display port name in trace events]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210313165445.2113938-8-f4bug@amsat.org>
Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/gpio/avr_gpio.c   | 26 +++++++++++++++++++++-----
 hw/gpio/trace-events |  5 +++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index e4c7122e62..29252d6ccf 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -2,6 +2,7 @@
  * AVR processors GPIO registers emulation.
  *
  * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
+ * Copyright (C) 2021 Niteesh Babu G S <niteesh.gs@gmail.com>
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
@@ -26,6 +27,12 @@
 #include "hw/gpio/avr_gpio.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "trace.h"
+
+static char port_name(AVRGPIOState *s)
+{
+    return 'A' + s->id;
+}
 
 static void avr_gpio_reset(DeviceState *dev)
 {
@@ -47,32 +54,41 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 
         if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
             qemu_set_irq(s->out[pin], new_port_pin_val);
+            trace_avr_gpio_update_output_irq(port_name(s), pin, new_port_pin_val);
         }
     }
     s->reg.port = value & s->reg.ddr;
 }
 static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int size)
 {
+    uint8_t val = 0;
     AVRGPIOState *s = (AVRGPIOState *)opaque;
     switch (offset) {
     case GPIO_PIN:
-        return s->reg.pin;
+        val = s->reg.pin;
+        break;
     case GPIO_DDR:
-        return s->reg.ddr;
+        val = s->reg.ddr;
+        break;
     case GPIO_PORT:
-        return s->reg.port;
+        val = s->reg.port;
+        break;
     default:
         g_assert_not_reached();
         break;
     }
-    return 0;
+
+    trace_avr_gpio_read(port_name(s), offset, val);
+    return val;
 }
 
 static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
                                 unsigned int size)
 {
     AVRGPIOState *s = (AVRGPIOState *)opaque;
-    value = value & 0xF;
+    value = value & 0xFF;
+
+    trace_avr_gpio_write(port_name(s), offset, value);
     switch (offset) {
     case GPIO_PIN:
         s->reg.pin = value;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 9736b362ac..5f89c30910 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -31,3 +31,8 @@ sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " val
 # aspeed_gpio.c
 aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
 aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+
+# avr_gpio.c
+avr_gpio_read(unsigned id, uint64_t offset, uint64_t r) "port %c offset 0x%" PRIx64 " value 0x%" PRIx64
+avr_gpio_write(unsigned id, uint64_t offset, uint64_t value) "port %c offset 0x%" PRIx64 " value 0x%" PRIx64
+avr_gpio_update_output_irq(unsigned id, int64_t line, int64_t value) "port %c pin %" PRIi64 " value %" PRIi64
-- 
2.34.1



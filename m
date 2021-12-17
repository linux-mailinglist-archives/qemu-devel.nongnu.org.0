Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E2C479561
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:21:18 +0100 (CET)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJjB-0005H8-IA
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:21:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJZ1-0006Fu-66; Fri, 17 Dec 2021 15:10:50 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:51513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYq-0001MG-54; Fri, 17 Dec 2021 15:10:37 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmUYD-1mGQ9O0Ufx-00iSYq; Fri, 17
 Dec 2021 21:10:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] hw/avr: Realize AVRCPU qdev object using qdev_realize()
Date: Fri, 17 Dec 2021 21:10:14 +0100
Message-Id: <20211217201019.1652798-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R70kTna8rRJD+JhV25qXyrvnmPOe12pS+SsPgukOH90eTZXweCA
 7oAzql7rmqeoaa5XjpS0rM3IyHKylb8F19Ln4DCO2wNSKold5GtjTAktFdQe3T7wCFwmNIc
 0nV5U4r/szSoe5ijt7qjXeUDka/g/2sSR6Z+k0RrNPhz7Wp3xpMOrKZmukyJc6xwU1ZxknJ
 PaH06bjPvZSan6pnD2XLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fZ9wgF/45kY=:2MSIvKqM72rNPqLGLj0AXS
 MVccKNUGRv4s4/DJAJNGs0AtUXeaCaOZ7MYQPQVadbqPwHFK+4MEFlrbCkmA1OJNgJWe/1+OC
 1nKkXtYDv1Gtq3xIBgAA5kDEnBPsv13lyegeHVDVbX1LNd2cdKJ81FqOPMmCPRhyTxUNxP2GC
 c3bZs9ZH5JwXjFP9JdtUh16RZub4wW4/EufA5DA9s473izfGuCrCCqk0UM3YFK2yHL1dOUswH
 yLrlqNED+GwNv1KZq1kOtkJrf0BuWWHM8JFivZbve9mcE0PWtzbGuAtu6TW2NbeMeb2RUJRD4
 J5tXGueGYZtpHlISsc45fPOZlOCHGSE4KXo4IAy97FaqBFhEZ33NsRjJHlMNm7xJhDNWM2nlU
 s6rT/LmafAza0a8xc1R89/Q5VZyAd6uAHXLBlvsnKVK8pNYaEHSfoWOxdCG8TvJ3+eV5Qiuaw
 Ny4aWNDnPl+Lx0vNTaXqN3ufR2lqCtzyMl+vrCF9DMM9eYt05L/SSZmEHfOYPxefcO3HlzcqY
 wgp/Blg9G1BJCm2F9VO67Hc4/ZnciNR/uId65/vVPWUTpyFJeFt/3TIKCihaBl1ML6f41YZFb
 w6sZ44wbRCXdamMzbE0Dg/2Vpk9pgXlWk9xQj/gYWmL40GlHydQsVvBDfI6N9u4Tki1whVQXY
 aeYGh/fcS5koBmN+4LtgfDGR3FkmGgGbjo0L/EKptP+w+h1QYsgniEFWruYGoMDQsbg0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_AVR_CPU inherits TYPE_CPU, which itself inherits TYPE_DEVICE.
TYPE_DEVICE instances are realized using qdev_realize(), we don't
need to access QOM internal values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20211205224109.322152-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/avr/atmega.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 0608e2d475ee..a34803e64272 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -233,7 +233,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     object_initialize_child(OBJECT(dev), "cpu", &s->cpu, mc->cpu_type);
-    object_property_set_bool(OBJECT(&s->cpu), "realized", true, &error_abort);
+    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
     cpudev = DEVICE(&s->cpu);
 
     /* SRAM */
-- 
2.33.1



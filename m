Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA941C211
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:54:24 +0200 (CEST)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWIB-0002p3-Mb
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVth-000298-TP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtf-0005tu-DR
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:05 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFsIZ-1mbnh52jhn-00HLlU; Wed, 29
 Sep 2021 11:28:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] nubus-bridge: make slot_available_mask a qdev property
Date: Wed, 29 Sep 2021 11:28:40 +0200
Message-Id: <20210929092843.2686234-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eez8eukwqbtoR2kUc/QwB0UrrA09Mk1K/YSDhY154iCYJwPvdDd
 sgcvsaYAQ1pYzbn7ZixAu2gDjynfdzEKiHW5oHWuU6xNI4laXvnAxkhgzRe+ni8TnJAsjxy
 hVJlx0ktfCzMKsaf+p6+wc28F1KKEHflI4JmX+v8Ul7nFAcZQOmjMJyY8D/aWAptmBZXSAt
 ZlLe45gj4yjB4FO/8wr/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qT21YRm5jpw=:+CB5vNaJ2MzuOAXv7UfdE4
 0Q9agFJeFYnSL9F16mKhXhtDNy6WeDZffwso0sXgVxOftMWX54UlffExLXuB4kj9U0c7vh+oB
 8wbprBbqPiUyuk66sjlZaF/Fd03yKdL1ESt6CQFc2ClPIUu26NMjSahXYTKY+6qH/qQTQQtpa
 0OaMpPES7KVXfdi+z5WC4gfDsM4LLSkO6soOM3Z8W9SnDSuzUbIOQb/GyAErBiDABg/v30JpL
 EBiYfNdNuV5eRZUnU/LlHUNsqZNOoT5oTIdnPAKj6yTc88wAkCK0r2ltLe/PSKUNJJTFOGwDd
 qGZuz3dFoz9qcOpNWZyyQzKlJpHrSFsyYROPspTBMvuWJQtxtJtmg5NNgExK7yWSRZ1ohz52a
 jrdjQInQaDHd4ZLz+7Xen3TNaIR37gUiumVq70d+K55fOTIBWa9IOuEMOxGV1HhlkA9llSxNj
 eRDqL5SWapGYYNwXH9+CEOpabCYRDtRZksZ3zkbOeQPXwOTV7YQOOTjzAoFhA3CPSFX9FAsl6
 KTzobjZ5drh+6JZKMTOcLk0KZoe5rfqdf6tLnlKM4lHxx4mzjMizJ1LWxiRs0Je6O+Z7oHVG8
 7iYt/k7rP/Hq43zqTpCOGiqm7g35Wr1WP7fxfdohYLib+v5OIOaXwu8WZE17qA3D62+LQwJ7c
 H8ey/Kv7yss/NQAcYUQqejmTC7t53+uNrVuXixlwPSkAHVHvJeQqbJAWTl4S5o5vF5k/JMuac
 Snfg+h/Ulmdn4nSoI42GSTK6FajZ184z6qd/dA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This is to allow Macintosh machines to further specify which slots are available
since the number of addressable slots may not match the number of physical slots
present in the machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210924073808.1041-18-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 1adda7f5a609..7b51722f66ec 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -21,11 +21,18 @@ static void nubus_bridge_init(Object *obj)
     qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
 }
 
+static Property nubus_bridge_properties[] = {
+    DEFINE_PROP_UINT16("slot-available-mask", NubusBridge,
+                       bus.slot_available_mask, 0xffff),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->fw_name = "nubus";
+    device_class_set_props(dc, nubus_bridge_properties);
 }
 
 static const TypeInfo nubus_bridge_info = {
-- 
2.31.1



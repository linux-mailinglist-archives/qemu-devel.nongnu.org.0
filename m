Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B24EA806
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 08:39:35 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ5Vt-00078D-Ld
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 02:39:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1nZ5Tn-0006Fw-Su
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 02:37:23 -0400
Received: from [2607:f8b0:4864:20::232] (port=41623
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1nZ5Tl-0005eO-W2
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 02:37:23 -0400
Received: by mail-oi1-x232.google.com with SMTP id e189so18109291oia.8
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:content-transfer-encoding:mime-version:subject
 :message-id:date:cc:to;
 bh=dk4PDr/IrhZHimukzUXQU8eZaGRS/UpBqgN4SHfOOq8=;
 b=G8EkB3MrUOL101CtzPW9P5xdbDyMOj2er2nNkaEhruvyb0OzCS6FZcMutch/78eTGs
 aZB9hl11mWf0Unbyzx/5e74EE08BXLHeSCfmnxoMg382I0kklrqVDjOIsdqzJHrXejfQ
 XqCkU2tc2swvthQSqmSQ3I5wAPv8pe8rRBfUMAA9Eksu97aBOc/ZYNhokXb2JlTIMmMj
 uU+e1nGl9NHqGEpV/tyFP4Dcdm5AGF6I1x217uATcNYyz1pfHFb3cnEO0McXmBFVt8bV
 gBbC2pbtOKqSpwbgZIE84tyXpGs5bftOiphCpStw9/ongkh4K2T8eLAQq/5lAgAqaoJ7
 e0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:content-transfer-encoding
 :mime-version:subject:message-id:date:cc:to;
 bh=dk4PDr/IrhZHimukzUXQU8eZaGRS/UpBqgN4SHfOOq8=;
 b=5Y1lhzzIF74rYywfcQov9xR49b+d2UrdBvpCchD6NefIQjpiW0eyLwCpLKnx5z1/2e
 w+K811cWCJuAd9B2vMK0rPmuMHqmQviRTAiQY/aWbtWgCWyaWZVwzeYlIOSvizGz6evI
 0i3O56wDcB+w2zQBVnFyVdI9DMAPySWcaEw9L/wMsOJMiZjad4kC8f6k4zOJhjhepKoo
 2RYaWpVF16BHe21uPafeRLrN0AeFpX7ptAokUJem05v8G2K/UzvDV6J5yt3o58IqytBN
 9Aoe7qiCnLR8dVLmbwFNAW1oTgVzHA/oP1dCZKzyMKIROVSIVnXKIr1MSzVU9fV5yaw3
 nyxw==
X-Gm-Message-State: AOAM532Tbgt8YLCmPNRnqdNU/A6gnoAmtBNitDRwClTswU634MKCc5a8
 0UOy18soM9x2fbSFD2zqXiapzntYw/lNUxt0
X-Google-Smtp-Source: ABdhPJzIbiHDgotRx6izIVNq7YRtn4tz+d/kD4E1O1K+TwKs0D3Tg+q6X2FQBJ/ZTizKqoZdX62HxQ==
X-Received: by 2002:a05:6870:912c:b0:de:411d:9ad3 with SMTP id
 o44-20020a056870912c00b000de411d9ad3mr618056oae.134.1648535494854; 
 Mon, 28 Mar 2022 23:31:34 -0700 (PDT)
Received: from smtpclient.apple ([179.54.212.73])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056830448a00b005c9344dac06sm8677514otv.19.2022.03.28.23.31.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Mar 2022 23:31:34 -0700 (PDT)
From: =?utf-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: [PATCH v2] hw/misc: applesmc: use host osk as default on macs
Message-Id: <B36B58F4-B15D-4584-9318-1AFC6E2CCE9C@gmail.com>
Date: Tue, 29 Mar 2022 03:31:28 -0300
To: qemu-devel <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=t0rr3sp3dr0@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, rene@exactcode.de, "Kiszka,
 Jan" <jan.kiszka@siemens.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de,
 Paolo Bonzini <pbonzini@redhat.com>, afaerber <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running on a Mac, QEMU is able to get the host OSK and use it as
the default value for the AppleSMC device. The OSK query operation
doesn't require administrator privileges and can be executed by any user
on the system. This patch is based on Phil Dennis-Jordan's description
of the process for reading OSK from SCM on macOS:
https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html

In the future, this could also be extended to work on Linux and Windows
when running on Macs. Just implement the applesmc_read_osk function for
those platforms.

The Apple SMC driver for Linux is currently being rewritten by Hector
Martin as part of the effort to bring Linux to Macs with Apple Silicon
(Asahi Linux). When the new driver gets merged to the Linux Kernel, it
will be a good time to extend this to work with it.

Signed-off-by: Pedro To=CC=82rres <t0rr3sp3dr0@gmail.com>
---
hw/misc/applesmc.c | 75 ++++++++++++++++++++++++++++++++++++++++++++--
1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 81cd6b6423..d7f6702cf0 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -5,6 +5,7 @@
 *
 *  Authors: Alexander Graf <agraf@suse.de>
 *           Susanne Graf <suse@csgraf.de>
+ *           Pedro To=CC=82rres <t0rr3sp3dr0@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
@@ -28,8 +29,16 @@
 * This driver was mostly created by looking at the Linux AppleSMC =
driver
 * implementation and does not support IRQ.
 *
+ * Reading OSK from SCM on macOS was implemented based on Phil =
Dennis-Jordan's
+ * description of the process:
+ * =
https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html
+ *=20
 */

+#if defined(__APPLE__) && defined(__MACH__)
+#include <IOKit/IOKitLib.h>
+#endif
+
#include "qemu/osdep.h"
#include "hw/isa/isa.h"
#include "hw/qdev-properties.h"
@@ -312,9 +321,62 @@ static const MemoryRegionOps applesmc_err_io_ops =3D =
{
    },
};

+static bool applesmc_read_osk(uint8_t *osk)
+{
+#if defined(__APPLE__) && defined(__MACH__)
+    struct AppleSMCParams {
+        uint32_t key;
+        uint8_t __pad0[16];
+        uint8_t result;
+        uint8_t __pad1[7];
+        uint32_t size;
+        uint8_t __pad2[10];
+        uint8_t data8;
+        uint8_t __pad3[5];
+        uint8_t output[32];
+    };
+
+    io_service_t svc;
+    io_connect_t conn;
+    kern_return_t ret;
+    size_t size =3D sizeof(struct AppleSMCParams);
+    struct AppleSMCParams params_in =3D { .size =3D 32, .data8 =3D 5 };
+    struct AppleSMCParams params_out =3D {};
+
+    svc =3D IOServiceGetMatchingService(0, =
IOServiceMatching("AppleSMC"));
+    if (svc =3D=3D 0) {
+        return false;
+    }
+
+    ret =3D IOServiceOpen(svc, mach_task_self(), 0, &conn);
+    if (ret !=3D 0) {
+        return false;
+    }
+
+    for (params_in.key =3D 'OSK0'; params_in.key <=3D 'OSK1'; =
++params_in.key) {
+        ret =3D IOConnectCallStructMethod(conn, 2, &params_in, size, =
&params_out, &size);
+        if (ret !=3D 0) {
+            return false;
+        }
+
+        if (params_out.result !=3D 0) {
+            return false;
+        }
+        memcpy(osk, params_out.output, params_in.size);
+
+        osk +=3D params_in.size;
+    }
+
+    return true;
+#else
+    return false;
+#endif
+}
+
static void applesmc_isa_realize(DeviceState *dev, Error **errp)
{
    AppleSMCState *s =3D APPLE_SMC(dev);
+    bool valid_osk =3D false;

    memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, =
s,
                          "applesmc-data", 1);
@@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState *dev, =
Error **errp)
    isa_register_ioport(&s->parent_obj, &s->io_err,
                        s->iobase + APPLESMC_ERR_PORT);

-    if (!s->osk || (strlen(s->osk) !=3D 64)) {
-        warn_report("Using AppleSMC with invalid key");
+    if (s->osk) {
+        valid_osk =3D strlen(s->osk) =3D=3D 64;
+    } else {
+        valid_osk =3D applesmc_read_osk((uint8_t *) default_osk);
+        if (valid_osk) {
+            warn_report("Using AppleSMC with host OSK");
+            s->osk =3D default_osk;
+        }
+    }
+    if (!valid_osk) {
+        warn_report("Using AppleSMC with invalid OSK");
        s->osk =3D default_osk;
    }

--=20
2.32.0 (Apple Git-132)



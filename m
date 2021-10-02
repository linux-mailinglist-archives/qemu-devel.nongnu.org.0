Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE3441FE3C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 23:17:32 +0200 (CEST)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWmNu-0004fp-Vr
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 17:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1mWlYQ-0004Hz-NL
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:24:18 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1mWlYO-0002wN-KU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:24:18 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id f73so5928349vkf.6
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:content-transfer-encoding:mime-version:subject
 :message-id:date:cc:to;
 bh=29xMJJQpS5B4ahOHabNNGiToCmMTgU/mw89YtSYpFaI=;
 b=GOeiQsMylTHfgOfApvSHSR06LyGCb91pNIbXAWpXAHQEqPfc+bzUTPQz30n0zWwjI5
 2KYmigzl7Chohn4FkCcU4tX8Aysi82fn49v+SG56gaRLntqeMHFneSi9j8F6nUrz51Ca
 7ODzuZLFEXojqb/p7bQSsV8h/+BEkE/i379pRc9Mcu6Mse6nUkC8dW4kWy43bZ2wtzlZ
 7U1Ckj1+cVdQ34MecALdIdHYpturx4vMt7C7dIfRdecaxg3G/h/ydwr9Y+j1hZ4Wfb07
 0GfJr8GjTWyMy/rZlbQaE8gA2Vne4JUC6Yx75kru7t7rBuIAa4uUeL8gzV8b3PIgq58v
 3u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:content-transfer-encoding
 :mime-version:subject:message-id:date:cc:to;
 bh=29xMJJQpS5B4ahOHabNNGiToCmMTgU/mw89YtSYpFaI=;
 b=R5Nd49YEbSnYP53wtS52zdA3XqBo7kWWYPEaCLJkZKWzibP4t1y8grEwytH1JVwoAV
 E8d+j4NADzfBbZprF+z1FRrNKMKbvOli2lI5joANyDyccWQ8xOxcTuahRXA6jDYr4RGK
 vL2+bPksr+vVbRe7BiggpvptvrTCPIhnJEj/fFL3hjwRVqnyx5zbTabWaVPYB0oGfhO5
 N5RxK/A/8mw8BGORtOYN4MT/sPvbl/8es41Y2QqVWMrj7XDa7+4SfdMn0FA/a3BJxDrB
 5vN5S93ngCUxi/Zz4S+c7ut5uG1Qe0MGutEi2VPh+sLXOBgbveaf/NYWVZUi1Q6SaYwi
 YHJg==
X-Gm-Message-State: AOAM5302GsiJLGe1n2vn5U3mm9Mijsq4sox+6xRPUMno20mt79RdFK0u
 TFmz7n1NzLO54O0gkEULDF2ylLpd9D0=
X-Google-Smtp-Source: ABdhPJzqNZn0ZYUf44YGzZ3baWoJE5F5iyM9Ri4cCpJUKgn3GkJSF7m1KoiPJwDsD3IZqNDOgsjGYg==
X-Received: by 2002:a1f:b6d1:: with SMTP id g200mr12995272vkf.14.1633206254306; 
 Sat, 02 Oct 2021 13:24:14 -0700 (PDT)
Received: from smtpclient.apple ([191.187.160.179])
 by smtp.gmail.com with ESMTPSA id g10sm4583659vss.25.2021.10.02.13.24.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:24:13 -0700 (PDT)
From: =?utf-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: [PATCH] hw/misc: applesmc: use host osk as default on macs
Message-Id: <4E271071-0799-4948-A445-134E7FAAD48D@gmail.com>
Date: Sat, 2 Oct 2021 17:24:08 -0300
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=t0rr3sp3dr0@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Oct 2021 17:15:42 -0400
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
Cc: phil@philjordan.eu, rene@exactcode.de, jan.kiszka@siemens.com,
 agraf@suse.de, f4bug@amsat.org, gsomlo@gmail.com, suse@csgraf.de,
 afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running on a Mac, QEMU is able to get the host OSK and use it as
the default value for the AppleSMC device. The OSK query operation
doesn't require administrator privileges and can be executed by any user
on the system. This patch is based on open-source code from Apple, just
like the implementation from VirtualBox.

Apple:
=
https://opensource.apple.com/source/IOKitUser/IOKitUser-647.6.13/pwr_mgt.s=
ubproj/IOPMLibPrivate.c
=
https://opensource.apple.com/source/PowerManagement/PowerManagement-637.60=
.1/pmconfigd/PrivateLib.c

VirtualBox:
=
https://www.virtualbox.org/browser/vbox/trunk/src/VBox/Devices/EFI/DevSmc.=
cpp#L516

Signed-off-by: Pedro To=CC=82rres <t0rr3sp3dr0@gmail.com>
---
hw/misc/applesmc.c | 185 +++++++++++++++++++++++++++++++++++++++++++++
1 file changed, 185 insertions(+)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf..824135d 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -38,6 +38,171 @@
#include "qemu/timer.h"
#include "qom/object.h"

+#if defined(__APPLE__) && defined(__MACH__)
+#include <IOKit/IOKitLib.h>
+
+enum {
+    kSMCSuccess     =3D 0x00,
+    kSMCKeyNotFound =3D 0x84
+};
+
+enum {
+    kSMCUserClientOpen  =3D 0x00,
+    kSMCUserClientClose =3D 0x01,
+    kSMCHandleYPCEvent  =3D 0x02,
+    kSMCReadKey         =3D 0x05,
+    kSMCGetKeyInfo      =3D 0x09
+};
+
+typedef struct SMCVersion {
+    uint8_t  major;
+    uint8_t  minor;
+    uint8_t  build;
+    uint8_t  reserved;
+    uint16_t release;
+} SMCVersion;
+
+typedef struct SMCPLimitData {
+    uint16_t version;
+    uint16_t length;
+    uint32_t cpuPLimit;
+    uint32_t gpuPLimit;
+    uint32_t memPLimit;
+} SMCPLimitData;
+
+typedef struct SMCKeyInfoData {
+    IOByteCount dataSize;
+    uint32_t    dataType;
+    uint8_t     dataAttributes;
+} SMCKeyInfoData;
+
+typedef struct {
+    uint32_t       key;
+    SMCVersion     vers;
+    SMCPLimitData  pLimitData;
+    SMCKeyInfoData keyInfo;
+    uint8_t        result;
+    uint8_t        status;
+    uint8_t        data8;
+    uint32_t       data32;
+    uint8_t        bytes[32];
+} SMCParamStruct;
+
+static IOReturn smc_call_struct_method(uint32_t selector,
+                                       SMCParamStruct *inputStruct,
+                                       SMCParamStruct *outputStruct)
+{
+    IOReturn ret;
+
+    size_t inputStructCnt =3D sizeof(SMCParamStruct);
+    size_t outputStructCnt =3D sizeof(SMCParamStruct);
+
+    io_service_t smcService =3D IO_OBJECT_NULL;
+    io_connect_t smcConnect =3D IO_OBJECT_NULL;
+
+    smcService =3D IOServiceGetMatchingService(kIOMasterPortDefault,
+                                             =
IOServiceMatching("AppleSMC"));
+    if (smcService =3D=3D IO_OBJECT_NULL) {
+        ret =3D kIOReturnNotFound;
+        goto exit;
+    }
+
+    ret =3D IOServiceOpen(smcService, mach_task_self(), 1, =
&smcConnect);
+    if (ret !=3D kIOReturnSuccess) {
+        smcConnect =3D IO_OBJECT_NULL;
+        goto exit;
+    }
+    if (smcConnect =3D=3D IO_OBJECT_NULL) {
+        ret =3D kIOReturnError;
+        goto exit;
+    }
+
+    ret =3D IOConnectCallMethod(smcConnect, kSMCUserClientOpen,
+                              NULL, 0, NULL, 0,
+                              NULL, NULL, NULL, NULL);
+    if (ret !=3D kIOReturnSuccess) {
+        goto exit;
+    }
+
+    ret =3D IOConnectCallStructMethod(smcConnect, selector,
+                                    inputStruct, inputStructCnt,
+                                    outputStruct, &outputStructCnt);
+
+exit:
+    if (smcConnect !=3D IO_OBJECT_NULL) {
+        IOConnectCallMethod(smcConnect, kSMCUserClientClose,
+                            NULL, 0, NULL, 0, NULL,
+                            NULL, NULL, NULL);
+        IOServiceClose(smcConnect);
+    }
+
+    return ret;
+}
+
+static IOReturn smc_read_key(uint32_t key,
+                             uint8_t *bytes,
+                             IOByteCount *dataSize)
+{
+    IOReturn ret;
+
+    SMCParamStruct inputStruct;
+    SMCParamStruct outputStruct;
+
+    if (key =3D=3D 0 || bytes =3D=3D NULL) {
+        ret =3D kIOReturnCannotWire;
+        goto exit;
+    }
+
+    /* determine key's data size */
+    memset(&inputStruct, 0, sizeof(SMCParamStruct));
+    inputStruct.data8 =3D kSMCGetKeyInfo;
+    inputStruct.key =3D key;
+
+    memset(&outputStruct, 0, sizeof(SMCParamStruct));
+    ret =3D smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct, =
&outputStruct);
+    if (ret !=3D kIOReturnSuccess) {
+        goto exit;
+    }
+    if (outputStruct.result =3D=3D kSMCKeyNotFound) {
+        ret =3D kIOReturnNotFound;
+        goto exit;
+    }
+    if (outputStruct.result !=3D kSMCSuccess) {
+        ret =3D kIOReturnInternalError;
+        goto exit;
+    }
+
+    /* get key value */
+    memset(&inputStruct, 0, sizeof(SMCParamStruct));
+    inputStruct.data8 =3D kSMCReadKey;
+    inputStruct.key =3D key;
+    inputStruct.keyInfo.dataSize =3D outputStruct.keyInfo.dataSize;
+
+    memset(&outputStruct, 0, sizeof(SMCParamStruct));
+    ret =3D smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct, =
&outputStruct);
+    if (ret !=3D kIOReturnSuccess) {
+        goto exit;
+    }
+    if (outputStruct.result =3D=3D kSMCKeyNotFound) {
+        ret =3D kIOReturnNotFound;
+        goto exit;
+    }
+    if (outputStruct.result !=3D kSMCSuccess) {
+        ret =3D kIOReturnInternalError;
+        goto exit;
+    }
+
+    memset(bytes, 0, *dataSize);
+    if (*dataSize > inputStruct.keyInfo.dataSize) {
+        *dataSize =3D inputStruct.keyInfo.dataSize;
+    }
+    memcpy(bytes, outputStruct.bytes, *dataSize);
+
+exit:
+    return ret;
+}
+#endif
+
/* #define DEBUG_SMC */

#define APPLESMC_DEFAULT_IOBASE        0x300
@@ -332,7 +497,27 @@ static void applesmc_isa_realize(DeviceState *dev, =
Error **errp)
                        s->iobase + APPLESMC_ERR_PORT);

    if (!s->osk || (strlen(s->osk) !=3D 64)) {
+#if defined(__APPLE__) && defined(__MACH__)
+        IOReturn ret;
+        IOByteCount size =3D 32;
+
+        ret =3D smc_read_key('OSK0', (uint8_t *) default_osk, &size);
+        if (ret !=3D kIOReturnSuccess) {
+            goto failure;
+        }
+
+        ret =3D smc_read_key('OSK1', (uint8_t *) default_osk + size, =
&size);
+        if (ret !=3D kIOReturnSuccess) {
+            goto failure;
+        }
+
+        warn_report("Using AppleSMC with host key");
+        goto success;
+#endif
+failure:
        warn_report("Using AppleSMC with invalid key");
+
+success:
        s->osk =3D default_osk;
    }

--=20
2.30.1 (Apple Git-130)



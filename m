Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F842BBD7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:43:10 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maamz-0004Ot-2L
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEy-0002cV-TI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:06 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEu-0005z9-S3
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:00 -0400
Received: by mail-ed1-x533.google.com with SMTP id t16so7204876eds.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NeO3EvyOv7NFzaEw8iL4zutsirDjVhen3zbJex2mzhU=;
 b=FAS2kViGBbTAbjU+oLc5TtpvVQ0oFjPhKmFexZXhdhZjvwCWYtIrENkTQfyWiu5RnA
 YyF9k7NuoO3WpyPGlM8JuQ4oXrxparplxn+IGEjrBt4aN8qO33GZtD+ugD1sRqf+TKxm
 zfYIp3PnUl38IJLNr9B4+HfGycOkn45Ug0miSzaZ7ppRWu2aRpkOCmc8DeV52EIBtOIO
 L7hx92IuFywZhxvVDf7EccpR9++2T/faiy8zrPr1ha3KXVQ4KD5ACsNqZpEclBbFJE7a
 ybqFMq9JABIR3rLINhDfhlhJhK8mGvyeVQsI7nnDtOUGvMGZJ4TRNhL6iu4AdB362IvU
 AeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NeO3EvyOv7NFzaEw8iL4zutsirDjVhen3zbJex2mzhU=;
 b=Gy8AoU+RorpRQ78pJ32Oo64AgjFXK1Y23Z7xKUZZ69n6PpG4CKMvcIDkr99+Aej3hK
 r6HJcZI20d5I+JB4YdmZIBF/L2feF8xjfaBcF0rlKHajCZ0t1eiulfkqhAMI34uqvc+T
 SzBGnGLZTK8xiuVDDNz0m+ENe/0XzisTlsJ50bHOWNP+esGOMqg8W/xWJ0esoPvJUJAz
 g+xFs4PUASanDpCebq4mD52NqHhByGvmlElmmsf23mBabVhWdKvG9whVplBdd5swHo7P
 uohZPokFFO3yJeos3AaivQxr7+nrnGt9YzxDDoDZhC7q2N6FD2XrixL77eho1uB1nPUY
 yuAA==
X-Gm-Message-State: AOAM533k3jna9Juyxdjt8gvALeYvsfDy6P5eZb7+oELU/0PLfXdhYCes
 k/qUGavqWuUqCD7qZ7e7cpUYhMA1R04=
X-Google-Smtp-Source: ABdhPJzJfek99zSOChCQxTrWss3oHl+elKG8D62Yd1gJ+e3lq5qr9gJCTJjVJjcmDJzOq5on1lKSsQ==
X-Received: by 2002:a50:d802:: with SMTP id o2mr7432152edj.331.1634116074659; 
 Wed, 13 Oct 2021 02:07:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/40] Revert "hw/misc: applesmc: use host osk as default on
 macs"
Date: Wed, 13 Oct 2021 11:07:24 +0200
Message-Id: <20211013090728.309365-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 93ddefbc3c909bb6c3b76086f1dfc8ad98dd3725.
The commit included code under the APSL 2.0, which is incompatible
with the GPL v2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/applesmc.c | 192 +--------------------------------------------
 1 file changed, 1 insertion(+), 191 deletions(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index cec247b5ee..1b9acaf1d3 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -38,171 +38,6 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
-#if defined(__APPLE__) && defined(__MACH__)
-#include <IOKit/IOKitLib.h>
-
-enum {
-    kSMCSuccess     = 0x00,
-    kSMCKeyNotFound = 0x84
-};
-
-enum {
-    kSMCUserClientOpen  = 0x00,
-    kSMCUserClientClose = 0x01,
-    kSMCHandleYPCEvent  = 0x02,
-    kSMCReadKey         = 0x05,
-    kSMCGetKeyInfo      = 0x09
-};
-
-typedef struct SMCVersion {
-    uint8_t  major;
-    uint8_t  minor;
-    uint8_t  build;
-    uint8_t  reserved;
-    uint16_t release;
-} SMCVersion;
-
-typedef struct SMCPLimitData {
-    uint16_t version;
-    uint16_t length;
-    uint32_t cpuPLimit;
-    uint32_t gpuPLimit;
-    uint32_t memPLimit;
-} SMCPLimitData;
-
-typedef struct SMCKeyInfoData {
-    IOByteCount dataSize;
-    uint32_t    dataType;
-    uint8_t     dataAttributes;
-} SMCKeyInfoData;
-
-typedef struct {
-    uint32_t       key;
-    SMCVersion     vers;
-    SMCPLimitData  pLimitData;
-    SMCKeyInfoData keyInfo;
-    uint8_t        result;
-    uint8_t        status;
-    uint8_t        data8;
-    uint32_t       data32;
-    uint8_t        bytes[32];
-} SMCParamStruct;
-
-static IOReturn smc_call_struct_method(uint32_t selector,
-                                       SMCParamStruct *inputStruct,
-                                       SMCParamStruct *outputStruct)
-{
-    IOReturn ret;
-
-    size_t inputStructCnt = sizeof(SMCParamStruct);
-    size_t outputStructCnt = sizeof(SMCParamStruct);
-
-    io_service_t smcService = IO_OBJECT_NULL;
-    io_connect_t smcConnect = IO_OBJECT_NULL;
-
-    smcService = IOServiceGetMatchingService(kIOMasterPortDefault,
-                                             IOServiceMatching("AppleSMC"));
-    if (smcService == IO_OBJECT_NULL) {
-        ret = kIOReturnNotFound;
-        goto exit;
-    }
-
-    ret = IOServiceOpen(smcService, mach_task_self(), 1, &smcConnect);
-    if (ret != kIOReturnSuccess) {
-        smcConnect = IO_OBJECT_NULL;
-        goto exit;
-    }
-    if (smcConnect == IO_OBJECT_NULL) {
-        ret = kIOReturnError;
-        goto exit;
-    }
-
-    ret = IOConnectCallMethod(smcConnect, kSMCUserClientOpen,
-                              NULL, 0, NULL, 0,
-                              NULL, NULL, NULL, NULL);
-    if (ret != kIOReturnSuccess) {
-        goto exit;
-    }
-
-    ret = IOConnectCallStructMethod(smcConnect, selector,
-                                    inputStruct, inputStructCnt,
-                                    outputStruct, &outputStructCnt);
-
-exit:
-    if (smcConnect != IO_OBJECT_NULL) {
-        IOConnectCallMethod(smcConnect, kSMCUserClientClose,
-                            NULL, 0, NULL, 0, NULL,
-                            NULL, NULL, NULL);
-        IOServiceClose(smcConnect);
-    }
-
-    return ret;
-}
-
-static IOReturn smc_read_key(uint32_t key,
-                             uint8_t *bytes,
-                             IOByteCount *dataSize)
-{
-    IOReturn ret;
-
-    SMCParamStruct inputStruct;
-    SMCParamStruct outputStruct;
-
-    if (key == 0 || bytes == NULL) {
-        ret = kIOReturnCannotWire;
-        goto exit;
-    }
-
-    /* determine key's data size */
-    memset(&inputStruct, 0, sizeof(SMCParamStruct));
-    inputStruct.data8 = kSMCGetKeyInfo;
-    inputStruct.key = key;
-
-    memset(&outputStruct, 0, sizeof(SMCParamStruct));
-    ret = smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct, &outputStruct);
-    if (ret != kIOReturnSuccess) {
-        goto exit;
-    }
-    if (outputStruct.result == kSMCKeyNotFound) {
-        ret = kIOReturnNotFound;
-        goto exit;
-    }
-    if (outputStruct.result != kSMCSuccess) {
-        ret = kIOReturnInternalError;
-        goto exit;
-    }
-
-    /* get key value */
-    memset(&inputStruct, 0, sizeof(SMCParamStruct));
-    inputStruct.data8 = kSMCReadKey;
-    inputStruct.key = key;
-    inputStruct.keyInfo.dataSize = outputStruct.keyInfo.dataSize;
-
-    memset(&outputStruct, 0, sizeof(SMCParamStruct));
-    ret = smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct, &outputStruct);
-    if (ret != kIOReturnSuccess) {
-        goto exit;
-    }
-    if (outputStruct.result == kSMCKeyNotFound) {
-        ret = kIOReturnNotFound;
-        goto exit;
-    }
-    if (outputStruct.result != kSMCSuccess) {
-        ret = kIOReturnInternalError;
-        goto exit;
-    }
-
-    memset(bytes, 0, *dataSize);
-    if (*dataSize > inputStruct.keyInfo.dataSize) {
-        *dataSize = inputStruct.keyInfo.dataSize;
-    }
-    memcpy(bytes, outputStruct.bytes, *dataSize);
-
-exit:
-    return ret;
-}
-#endif
-
 /* #define DEBUG_SMC */
 
 #define APPLESMC_DEFAULT_IOBASE        0x300
@@ -480,7 +315,6 @@ static const MemoryRegionOps applesmc_err_io_ops = {
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
-    bool valid_key = false;
 
     memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                           "applesmc-data", 1);
@@ -497,31 +331,7 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (s->osk) {
-        valid_key = strlen(s->osk) == 64;
-    } else {
-#if defined(__APPLE__) && defined(__MACH__)
-        IOReturn ret;
-        IOByteCount size = 32;
-
-        ret = smc_read_key('OSK0', (uint8_t *) default_osk, &size);
-        if (ret != kIOReturnSuccess) {
-            goto failure;
-        }
-
-        ret = smc_read_key('OSK1', (uint8_t *) default_osk + size, &size);
-        if (ret != kIOReturnSuccess) {
-            goto failure;
-        }
-
-        warn_report("Using AppleSMC with host key");
-        valid_key = true;
-        s->osk = default_osk;
-failure:;
-#endif
-    }
-
-    if (!valid_key) {
+    if (!s->osk || (strlen(s->osk) != 64)) {
         warn_report("Using AppleSMC with invalid key");
         s->osk = default_osk;
     }
-- 
2.31.1




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B737B694
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:08:26 +0200 (CEST)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgiyn-0002Ma-4t
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgixk-0000et-Eo
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgixi-0003Cw-OP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620803238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+WOfYdVRGGFXTGfPsi4NkvxnlL28c3Y4OEsAOzytlxo=;
 b=SOQuunLUkJsSkGsC2fN8K+QRmmH3SxwQ1Fb3k2bzZYaXhQor+aZgnu7wngica+gYUDMU/9
 aRFHpDvCAa6JGSAX4jawUAjEf04GOXWHGTOC79bBGJ9+SnceKAVsu0jrEWecj9sIfVobyo
 j4P2EmHy4AMj58VoBXDvIbtf/eX6K8o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-fqoKM0b0Poit9rDmbsg4vg-1; Wed, 12 May 2021 03:07:17 -0400
X-MC-Unique: fqoKM0b0Poit9rDmbsg4vg-1
Received: by mail-wr1-f70.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so193086wrp.15
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+WOfYdVRGGFXTGfPsi4NkvxnlL28c3Y4OEsAOzytlxo=;
 b=ERMWVfYs5223Na/ZiKs8TKHO7V4oQ2kg7P5Qdk2zSq/JEeKNDwa+9+peCmYzXXRGfM
 9jlfJ46DkgM/Gf06WJ7iUlNBr89vOGzXnqX08jHvIvFgazFD24nkYtUpx3R3nVePzOWP
 4U/3DMGj1mTE2sglB0mFyH+3o4EnWElvmbbaboM83dw4RK0HTUERAKTbTpluuEfhyxhi
 6fWbR645zYk8TTo9C8iH0BUoOW2w43mj2QgGuGnxhXXl2jeZzuDXCKIcC/6A0QI6pyKx
 TN16Ul0NjZyFdIquZMKZr3lPCwW79EvXIT0Nn3WJO190jkH8frZkJ3t0C4knJTq2c+Jx
 IRNA==
X-Gm-Message-State: AOAM5315af6KZINyopePUprjTAdSZPjWDddfRteOSJGVkDHSXrOVq6CE
 G0uo3T0pmH8Hvv0PpFh97rblVwyS1/KntGS6v4LS4g8cN4RA4DjiDZR4BqnH4kffwc3G94DTuKo
 qJzVs3Eghyb+udkTEhKp5OlcZOQm1hTn9vTkclak6zbLA31MPXoD0fqmcMrHqLvLM
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr13844015wmc.142.1620803235581; 
 Wed, 12 May 2021 00:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKNw9EQ5nYfUPZ/q9G6qxX/cj+mGCOKf+69GWkQwHQP/PgD2zbT0QXiOvyP2tXiaUzuVB4vA==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr13843990wmc.142.1620803235335; 
 Wed, 12 May 2021 00:07:15 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i2sm35171165wro.0.2021.05.12.00.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 00:07:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Wed, 12 May 2021 09:07:13 +0200
Message-Id: <20210512070713.3286188-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Christophe de Dinechin <dinechin@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc1934..e5f1063ab6c 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
+#include "qemu/lockable.h"
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
@@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     uint8_t *buf = NULL;
-    int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
+        buf = g_alloca(n);
+        memcpy(buf, &cmd_no, sizeof(cmd_no));
+        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-    buf = g_alloca(n);
-    memcpy(buf, &cmd_no, sizeof(cmd_no));
-    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-
-    n = qemu_chr_fe_write_all(dev, buf, n);
-    if (n <= 0) {
-        goto end;
-    }
-
-    if (msg_len_out != 0) {
-        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+        n = qemu_chr_fe_write_all(dev, buf, n);
         if (n <= 0) {
-            goto end;
+            return -1;
+        }
+
+        if (msg_len_out != 0) {
+            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+            if (n <= 0) {
+                return -1;
+            }
         }
     }
 
-    ret = 0;
-
-end:
-    qemu_mutex_unlock(&tpm->mutex);
-    return ret;
+    return 0;
 }
 
 static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-- 
2.26.3



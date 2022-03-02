Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8389A4C99E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:31:56 +0100 (CET)
Received: from localhost ([::1]:53272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCuJ-00083t-Iw
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_bgeYgYKCgIvkvwutiqqing.eqosgow-fgxgnpqpipw.qti@flex--titusr.bounces.google.com>)
 id 1nPCsM-0006Lo-Aa
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:29:54 -0500
Received: from [2607:f8b0:4864:20::1149] (port=57234
 helo=mail-yw1-x1149.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_bgeYgYKCgIvkvwutiqqing.eqosgow-fgxgnpqpipw.qti@flex--titusr.bounces.google.com>)
 id 1nPCsK-00085I-7R
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:29:54 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2d6d36ec646so143650297b3.23
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
 b=QP2mFJ7P2kORaGo6uuhsS19D0Uy6/4OMoWWS5LqizEHUT1u05R0AVRy2kXQmTHe7xE
 bqQP29gov2gtVUTjcJqRaf5p8i9fVXo8qctTCevw9TGVmvD8ijOtq53seujGePx/HJ3s
 b3+CAmG9opTKp/YOoSaI2vaJm4TUuN4Gd2ch6H4aB9SK7n/Id9/sfsAHOYmpUeyd+rI8
 VXBU0Bi3HRI2OIB5bvSkDeVveFDHLqWLHzkNxJmnioNHJXS1NVsG/8cX6k8MLTWoKQKX
 NkURM6IDMlNmdhpSYw/r96+KL1oZZ6zdNau115wFfeSFZs5KZhBVMWau8fdrSMz5FvQv
 +7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
 b=FKFPGGvaskA6JtGd2MLK3KaSpnl8NBn8lcDovNHY16bVGYMGPQDOyfDQBPKwavXGWQ
 EcDYVjA2hKkRFbznNBGLZLJExgd9XH/nOEqwD5FD0pr7ahUK6qPiEdl+kHQaHhRswjtQ
 MZAdzf0UaEAHGkj8WXd/mrNijvM8wvKJDPMJacfabxiSG9QMJpyWyhUX2jni1LdivFCm
 eka6W7c4WcdrtthKYDxTUs+IuZNu82QxLa68liHrM3wmE415g37T49LDaziScH/verkh
 QGP/t7U3XFVH0A7AovDG3JNzuytNbzMVQBVprtkYBiRGI+Ym2BOWa/sJVk2IdakLf8L7
 +GAQ==
X-Gm-Message-State: AOAM530056KGYl4so5EdZNM0V7d4UwSA6FZwVu3AcFwCabkIjpVbY66E
 l+6wUC8isxVF3BufIIurcvb4DMLanEk=
X-Google-Smtp-Source: ABdhPJwH9k4NyQxg5DHTthz8sMzJhsmvaC0YmnDVaTyIGEHD3bTa8K76ehvzEyNCZORN5qPr4CEQVEwLlmI=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a0d:cc93:0:b0:2db:931f:1e90 with SMTP id
 o141-20020a0dcc93000000b002db931f1e90mr11479404ywd.307.1646180605715; Tue, 01
 Mar 2022 16:23:25 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:00 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-3-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 2/9] hw/i2c: pmbus: guard against out of range accesses
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1149
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3_bgeYgYKCgIvkvwutiqqing.eqosgow-fgxgnpqpipw.qti@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 07a45c99f9..93c746bab3 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -243,18 +243,47 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
 
+/* assert the status_cml error upon receipt of malformed command */
+static void pmbus_cml_error(PMBusDevice *pmdev)
+{
+    for (int i = 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word |= PMBUS_STATUS_CML;
+        pmdev->pages[i].status_cml |= PB_CML_FAULT_INVALID_CMD;
+    }
+}
+
 static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(smd);
     PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
     uint8_t ret = 0xFF;
-    uint8_t index = pmdev->page;
+    uint8_t index;
 
     if (pmdev->out_buf_len != 0) {
         ret = pmbus_out_buf_pop(pmdev);
         return ret;
     }
 
+    /*
+     * Reading from all pages will return the value from page 0,
+     * this is unspecified behaviour in general.
+     */
+    if (pmdev->page == PB_ALL_PAGES) {
+        index = 0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from all pages\n",
+                      __func__);
+        pmbus_cml_error(pmdev);
+    } else if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: page %d is out of range\n",
+                      __func__, pmdev->page);
+        pmbus_cml_error(pmdev);
+        return -1;
+    } else {
+        index = pmdev->page;
+    }
+
     switch (pmdev->code) {
     case PMBUS_PAGE:
         pmbus_send8(pmdev, pmdev->page);
@@ -1038,6 +1067,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->page = pmbus_receive8(pmdev);
         return 0;
     }
+
     /* loop through all the pages when 0xFF is received */
     if (pmdev->page == PB_ALL_PAGES) {
         for (int i = 0; i < pmdev->num_pages; i++) {
@@ -1048,6 +1078,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         return 0;
     }
 
+    if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: page %u is out of range\n",
+                        __func__, pmdev->page);
+        pmdev->page = 0; /* undefined behaviour - reset to page 0 */
+        pmbus_cml_error(pmdev);
+        return -1;
+    }
+
     index = pmdev->page;
 
     switch (pmdev->code) {
-- 
2.35.1.616.g0bdcbb4464-goog



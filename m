Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EE4D1FE9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:17:54 +0100 (CET)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRePB-0007tf-CW
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLJ-00086S-R4
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:53 -0500
Received: from [2607:f8b0:4864:20::430] (port=40829
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLI-0001zl-Aq
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:53 -0500
Received: by mail-pf1-x430.google.com with SMTP id z15so65619pfe.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4Db/Dt+62NTZoEc2RNqo+nknrOXJfr6drmpsye6pfc=;
 b=CVqdELJ/3tIBnpDUpyGjCmC+iokdxDaQYWQUgrHa2YT2/HWAJY9Gi1tcag9K804yfT
 7nCUojfM5GpxSdhB5UeU1zy7mY6jaDQAF3zX1eYmQEY4cFBMxJq3uyYNtj9F0RJEoZ+H
 BQvZ7B4dNIKTXZw1ihYTFu9mKbxE4qQeEjan1QIriKmcRiHeE7tGi2ZinlAHFEG3meA+
 Uon+gvqY4k4PHO6JXywkJDGCp0yjsbNskMwtYxTBEm6cuQEy/bRiXPUJ61GWasI/xot8
 vEMJnAXhr4mJLVBOf1YojPC0C3WWOl9GL2q7n1vtui32BKuqef/baZN+qHoNs5Y1l/9P
 K5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4Db/Dt+62NTZoEc2RNqo+nknrOXJfr6drmpsye6pfc=;
 b=a2pVVmwuwyUrkW2mQnk6TFEf17rNdlnwwhyxcypUHLQka/GcrNVf31VyFQlUD1QHsE
 y1+le3POEus/t9RtCtiuDX2OHXU43JwBSm8Tq905e3Vcr6f8mrAdiauMjqOwIoK0i7b5
 GC3CiG9Oiu/46ANGLCcTgfW2DAnqy+zVGAMMXGaF23gtSpIGWim0QBmNToSuDtcxv1aM
 DxMmNY9wfw0Q6INHnpbCwZcewCVuZdhV9LHneaGQ6aVpuZom9O7jVIEhkHTEdwrRr1eu
 3X6HvWPm+XISYkhEpD8dUfpcrN579GawIx0uCduWUvV+OxHze/elSBEIM12fBzqtav3/
 vDgA==
X-Gm-Message-State: AOAM531xtHw/n48t1ZZTDZwRXLEt7Bm88ZUVth02uML4UWcS9dKNKVsY
 2HSH/A1TudXgTcjIXYURPNj6fXgkF2o=
X-Google-Smtp-Source: ABdhPJwv3pHUsDnWOA8o3Q9V50Rv7u9TrybFE4qwwDxLvm0jHyZpAbCIvbYc4WFewCgqHCNFmqsACA==
X-Received: by 2002:aa7:943a:0:b0:4f6:adc9:d741 with SMTP id
 y26-20020aa7943a000000b004f6adc9d741mr19392827pfo.30.1646763230799; 
 Tue, 08 Mar 2022 10:13:50 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm15122868pgl.36.2022.03.08.10.13.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:13:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] hw/i2c: pmbus: add PEC unsupported warning
Date: Tue,  8 Mar 2022 19:13:14 +0100
Message-Id: <20220308181320.79400-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Titus Rwantare <titusr@google.com>

Signed-off-by: Titus Rwantare <titusr@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220307200605.4001451-4-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c7ec8e5499..ff644c1d4a 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.34.1



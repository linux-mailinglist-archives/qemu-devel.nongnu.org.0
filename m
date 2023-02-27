Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631A6A4469
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeBY-0003y5-7T; Mon, 27 Feb 2023 09:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBT-0003SZ-0y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBR-0000UX-2r
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id e37so3887261wri.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mYWHqZNBGHAOEgv7ZOTXSvVJJmng/wfNhhXsX59Blok=;
 b=zixwW8N2iMVDXxKOvk521LqOGgNUs97Ca5RqZbHTGjHXSCZ5ceKg9I7pnQ3TebkSm3
 S8AO+4HrLJw/g9xeDCLO2SW3t2Ymbmg99Vd1+djwp8sF08AF5+Nu61/eiL/PK0fCaj0n
 atC0lQ/dF1ALVeQzIs2bpG2jOWhnbPjGgmBd5GG72/BuXH+OIoqENFYpkUp1O2nuTiN2
 mpBO5oofDPuqewIQ8tTT45q9bVV42ES85Joz0nnsLDusGOaSGLg2r1yClhXa0ztEZgIf
 selqS6hxUOfcqNJZGD03Os+KKstwovFZUdsUbGnxyrQkN7xVEftxap5IgQrwi9MnCrcl
 zyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYWHqZNBGHAOEgv7ZOTXSvVJJmng/wfNhhXsX59Blok=;
 b=vt/EVDfe1oo4aslm+blPs/lAQYYJNNSgTDbuG/NqqVj9U1pfd6L6HEYFrKqJbJXBaF
 z3kbRrJdEpVotRr/C6LA7mU3BCrnWKrrJtRTqZQQobRxX/HAumBwAWwdxrBwEnXWUoQu
 lnPGU93LpXbVXZK9XYmdRJwT8ORUDg8uVXjtB7C2QoVt9BONw6UiuQw79kOW6wVXhM/5
 Y2E5Z+klvYh1OwcVUslcYlzm1KHFLix6edKXJ7nUCwMFURw2GbY65mf3j2peqRAefW3t
 BI7jvNOoIxYRc3+VyCqqTm402itWb/TXwhCxoVZnYtHjm7ipjNm6/nT8tDN3Vv7tGlNE
 ek/A==
X-Gm-Message-State: AO0yUKVEZPsRK6L02FY0tg5ifh9ePCaXUnu0nbprQcmu0TSz8/qgOGtH
 8kzFtggYSW3H6GVZ/nsiX6LSTjQn9C3ZyJ/d
X-Google-Smtp-Source: AK7set9okw5rffdQYjcBPzVtJvE2g/zSd3piZ9FCZsSMf4wr88mQF43pzJF2AllmNjqXhXLqGa7X6w==
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr10571872wrp.13.1677506930747; 
 Mon, 27 Feb 2023 06:08:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b002c70bfe505esm7153059wrr.82.2023.02.27.06.08.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 082/126] hw/usb/ohci: Move a function next to where it is used
Date: Mon, 27 Feb 2023 15:01:29 +0100
Message-Id: <20230227140213.35084-73-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

The ohci_port_set_if_connected() function is only used by
ohci_port_set_status(), move next to it to have them at the same place.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <46411d4980ab0fba61ab0d2209a939fdc41eb573.1676916640.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c | 60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index b7877866f6..2a52aace80 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1271,36 +1271,6 @@ void ohci_bus_stop(OHCIState *ohci)
     timer_del(ohci->eof_timer);
 }
 
-/*
- * Sets a flag in a port status reg but only set it if the port is connected.
- * If not set ConnectStatusChange flag. If flag is enabled return 1.
- */
-static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
-{
-    int ret = 1;
-
-    /* writing a 0 has no effect */
-    if (val == 0) {
-        return 0;
-    }
-    /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
-    if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
-        ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
-        if (ohci->rhstatus & OHCI_RHS_DRWE) {
-            /* TODO: CSC is a wakeup event */
-        }
-        return 0;
-    }
-
-    if (ohci->rhport[i].ctrl & val) {
-        ret = 0;
-    }
-    /* set the bit */
-    ohci->rhport[i].ctrl |= val;
-
-    return ret;
-}
-
 /* Frame interval toggle is manipulated by the hcd only */
 static void ohci_set_frame_interval(OHCIState *ohci, uint16_t val)
 {
@@ -1422,6 +1392,36 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
     }
 }
 
+/*
+ * Sets a flag in a port status reg but only set it if the port is connected.
+ * If not set ConnectStatusChange flag. If flag is enabled return 1.
+ */
+static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
+{
+    int ret = 1;
+
+    /* writing a 0 has no effect */
+    if (val == 0) {
+        return 0;
+    }
+    /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
+    if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
+        ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
+        if (ohci->rhstatus & OHCI_RHS_DRWE) {
+            /* TODO: CSC is a wakeup event */
+        }
+        return 0;
+    }
+
+    if (ohci->rhport[i].ctrl & val) {
+        ret = 0;
+    }
+    /* set the bit */
+    ohci->rhport[i].ctrl |= val;
+
+    return ret;
+}
+
 /* Set root hub port status */
 static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
 {
-- 
2.38.1



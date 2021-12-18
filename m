Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B67479AF5
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 14:11:48 +0100 (CET)
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myZV5-0004IH-IB
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 08:11:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOS-0005LL-6E; Sat, 18 Dec 2021 08:05:00 -0500
Received: from [2a00:1450:4864:20::432] (port=42844
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOM-00039F-7s; Sat, 18 Dec 2021 08:04:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so9355194wrd.9;
 Sat, 18 Dec 2021 05:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nYRF7Ay5OmCxJuygY/6kEra6OgWNJoLw6b9JAs3k8BU=;
 b=Shd/zgl3ELASaHx9wYSpKSpYkTvs9+mfYx8Zs1hReJVHtAkLgsaC4VCZX/62bHNpYx
 bcj1eIlZynEEPlR44NHnZirUCNq5Snpm9GcNG2Ac0UE3KD/uwy5Kwg+SGrsgVtlMNyZC
 qyOE1WCt7ZGA5kXjvfo+0xsDIezMmvoZmJPJ+/ioRq511m2WEAJZca+Cw+5cDaUiTeoC
 L8yN1ZstmBSRzOeGR35qPvZmLjATm1e2pyG6eyqXBJLQmy2QJJ9dNI5iB/lps6nGa91o
 nkaoz8hkvs15im8aFY1tc0vDR1Dv+epQAOMzMNXe1/M9F81bVNBdp5GYbBDSPpBewp5d
 u+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nYRF7Ay5OmCxJuygY/6kEra6OgWNJoLw6b9JAs3k8BU=;
 b=7Z6WXG/22D9XHg9u1vM1EPri5IPJvNaP20ELkqymUZCe6UpVU7MM38RFFUqt/cS1yb
 kdm0NdqMEPJmqBCMUdYBN/LvyrI1qZzztgDeMX+ehS9VFJk0g78qxsWJJInXhAKYk0Ri
 u+Wm7OaEYRH6O8+WVMkfVkQe7tophE9YEbqxlupgLWHjXiT9q8kHsbGz0EoVFrGZRjRt
 0FaWfDjr94t8yCDZAzaAn+JBYQF49Q78x5MD+BBNokoYRDEWpZ81O4uExWv4uHhpZefi
 iMxMIugV1UVJjwjgO4uIau5eN1CrhzQb4LaRCOx+oKiWHJt7YYt/RRzDBOcx1jnkV0Vj
 phtg==
X-Gm-Message-State: AOAM533g/tJQeaapqVbkF2ZXnnHnSOB4jylvoj2x1ohzpG1+mVlpMiXu
 gmt2KdZStT8FHjzTDyxZgDGKNNC/j8Q=
X-Google-Smtp-Source: ABdhPJze2AoGxcaNhhLfnqvIHl4vgbhOWKltiE50QHLnG110Iwfpjyxn5rdDtpz2b5jJZbN0nRWfnw==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr6427715wry.407.1639832684399; 
 Sat, 18 Dec 2021 05:04:44 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n1sm12456386wrc.54.2021.12.18.05.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 05:04:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/qdev: Cosmetic around documentation
Date: Sat, 18 Dec 2021 14:04:33 +0100
Message-Id: <20211218130437.1516929-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add empty lines to have a clearer distinction between different
functions declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 20d3066595e..59a822ffceb 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -321,6 +321,7 @@ compat_props_add(GPtrArray *arr,
  * The returned object has a reference count of 1.
  */
 DeviceState *qdev_new(const char *name);
+
 /**
  * qdev_try_new: Try to create a device on the heap
  * @name: device type to create
@@ -329,6 +330,7 @@ DeviceState *qdev_new(const char *name);
  * does not exist, rather than asserting.
  */
 DeviceState *qdev_try_new(const char *name);
+
 /**
  * qdev_realize: Realize @dev.
  * @dev: device to realize
@@ -347,6 +349,7 @@ DeviceState *qdev_try_new(const char *name);
  * qdev_realize_and_unref() instead.
  */
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
+
 /**
  * qdev_realize_and_unref: Realize @dev and drop a reference
  * @dev: device to realize
@@ -372,6 +375,7 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
  * would be incorrect. For that use case you want qdev_realize().
  */
 bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
+
 /**
  * qdev_unrealize: Unrealize a device
  * @dev: device to unrealize
@@ -450,6 +454,7 @@ typedef enum {
  * For named input GPIO lines, use qdev_get_gpio_in_named().
  */
 qemu_irq qdev_get_gpio_in(DeviceState *dev, int n);
+
 /**
  * qdev_get_gpio_in_named: Get one of a device's named input GPIO lines
  * @dev: Device whose GPIO we want
@@ -497,6 +502,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  * For named output GPIO lines, use qdev_connect_gpio_out_named().
  */
 void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
+
 /**
  * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
  * @dev: Device whose GPIO to connect
@@ -524,6 +530,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
                                  qemu_irq pin);
+
 /**
  * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
  * @dev: Device whose output GPIO we are interested in
@@ -541,6 +548,7 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
  * by the platform-bus subsystem.
  */
 qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
+
 /**
  * qdev_intercept_gpio_out: Intercept an existing GPIO connection
  * @dev: Device to intercept the outbound GPIO line from
@@ -582,6 +590,7 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
  * hold of an input GPIO line to manipulate it.
  */
 void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
+
 /**
  * qdev_init_gpio_out: create an array of anonymous output GPIO lines
  * @dev: Device to create output GPIOs for
@@ -610,6 +619,7 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
  * handler.
  */
 void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
+
 /**
  * qdev_init_gpio_out: create an array of named output GPIO lines
  * @dev: Device to create output GPIOs for
@@ -623,6 +633,7 @@ void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
  */
 void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
                               const char *name, int n);
+
 /**
  * qdev_init_gpio_in_named_with_opaque: create an array of input GPIO lines
  *   for the specified device
-- 
2.33.1



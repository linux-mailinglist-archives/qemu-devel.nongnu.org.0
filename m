Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C956D149D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:04:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39Y-0003LK-AI; Thu, 30 Mar 2023 21:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BzEmZAcKCioQUSRUJOMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--komlodi.bounces.google.com>)
 id 1pi39W-0003Io-Ia
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:02:02 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BzEmZAcKCioQUSRUJOMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--komlodi.bounces.google.com>)
 id 1pi39V-0006d5-01
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:02:02 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 4-20020a251904000000b00b7f75c3cafdso5283176ybz.16
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224519;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kmOrD5Vl4Y3U3Y6s4gR2tn0DFm2ngoTvHdEN5WGZh6c=;
 b=iFV4HOPJhcq8QsMTJo5PY+ChsGvjewzILUIQXbOEESoleXU6e9dcnJ9RpQ+KhQkgEt
 8kjFLIWseT6GPoUgOf9rRBpNfWHIIvZ176kCpvPqPpwJ3WY5S/sNEcWZfCeZOvUxOhwN
 /FH+/0G00pwBhtzNMgTGOapR7yTwwLtli7OkUiutc10Wq3j/RTJv49LU0Yf1C77cxwVN
 et8aXzPtCf5pfSn+2iKrFgBiZ1oTnJfNC0WXj1+xMwn6858tCe4WfjYRNjOD3fnSWQPU
 BOQ0tHcRR59VdpHN9C3K7oXu2S33Ebu2uPcyz/BZSfLrAxhT5w+VvdBFOx48oTb0tTa6
 +eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224519;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kmOrD5Vl4Y3U3Y6s4gR2tn0DFm2ngoTvHdEN5WGZh6c=;
 b=l8aO94EIjw9d1v0FpedQoPMuWlpvuplSLzWEKTDFAjoaznjG6QDtPYVL6pfdEyCdeD
 enFaltzQLrJsdSh0UAsHSjfls5bsBmsIRGQ9TnKva4Un4nB9FjNn9TWn2/iAqSu40V5P
 Y98Wt0WN/8oHYUMLixODZSb0uJ1DIchje3o8UbsiuGmxK36qxlKAelp+GoTH28YmlSTi
 figNYi8M8zhCheGluyL4sCtbCeH72rNNEXH7W/YwewBO0RBxGicgXhOI3b/xZPrDek9L
 ByRkdNM9SyhHmGrxaYcx5A/X5CbX8MNrYe/m778VAm3+dQb51L3c+WJQBA674K8SLMGs
 h4OA==
X-Gm-Message-State: AAQBX9cXTvXHjC8KmqY0gl07rF8n9G7VAw7Sl4+IUQkfO59FAjPIDqUo
 fdgJSHIeKXohlcz6kG9ejIu8PzFcht1fnNdKnmBxLNw0eLgXrfGI5n7JXeo39xOKUpLQAvC9WIj
 fUCzV7DjKUIjegJnV+u1N4DYBqXcMC2gEz9RcUKO94Tbu1auvRxWM3ytdjUmeYZs=
X-Google-Smtp-Source: AKy350Y3uBp7XH8uLzMYOyFTDesmXEfmKbpvUfPJAqHAvauTbeVA7/5qnxjcXCMZ0PeJ1LI0R29h4iYaIKZF
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6902:1549:b0:b77:be38:6406 with SMTP
 id r9-20020a056902154900b00b77be386406mr13272549ybu.9.1680224519758; Thu, 30
 Mar 2023 18:01:59 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:31 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-17-komlodi@google.com>
Subject: [PATCH 16/16] hw/i3c: Add hotplug support
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3BzEmZAcKCioQUSRUJOMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--komlodi.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This adds support for hotplugging in I3C.
Conceptually this can be thought of as an I3C target being physically
socketed onto a board.
It is then the target's responsibility to go through the hot-join and
DAA process so it can participate on the bus.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/i3c/core.c b/hw/i3c/core.c
index 758dd7141f..c6ef16bbba 100644
--- a/hw/i3c/core.c
+++ b/hw/i3c/core.c
@@ -19,6 +19,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "hw/i3c/i3c.h"
+#include "hw/hotplug.h"
 #include "hw/qdev-properties.h"
 
 static Property i3c_props[] = {
@@ -29,11 +30,27 @@ static Property i3c_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void i3c_realize(BusState *bus, Error **errp)
+{
+    qbus_set_bus_hotplug_handler(bus);
+}
+
+static void i3c_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+    k->realize = i3c_realize;
+}
+
 static const TypeInfo i3c_bus_info = {
     .name = TYPE_I3C_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(I3CBus),
     .class_size = sizeof(I3CBusClass),
+    .class_init = i3c_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 I3CBus *i3c_init_bus(DeviceState *parent, const char *name)
-- 
2.40.0.348.gf938b09366-goog



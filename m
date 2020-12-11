Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E022D6DF5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:05:03 +0100 (CET)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knXnq-0002DW-DS
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32NDSXwgKCskB9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1knXbj-0001mp-T2
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:31 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:47881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32NDSXwgKCskB9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1knXbg-0007DJ-Sq
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:31 -0500
Received: by mail-pf1-x449.google.com with SMTP id x21so2283742pff.14
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=4VHKIK3Zl3M4dYV9Wc80s3WWD/x1jRZu8ubXlR1N6DM=;
 b=uQFAe2BpBghVBNc/UxrQNiWLx5F9dWy4QS68F88VuJyt2d0na3IygfiXqkO0Yic8pR
 P61dCepmArZITifLBTjO7Tn96mQZhBdKEzreU8KWkcNsVQepHLMzGj0KCj8xJalLJDgx
 pKkPRDVho8l9GL5BuXS1SCZihDLQB54q87pP17ALcVk1/Ny/fd7oX4xRBrjCoE/njMeZ
 lCuQVZrVV4JkJWldeY61RSfPOy0Er9dtBe8cXhc60YGzQ5gozFBkQxeKrlj7ZkB0F5ad
 O3s1QIWwdwrFpP2g2M1pO0mNOAwlx3UZOUrZJPXY/Y47nf6SiKyTdTZLT+7l3/X4rcKj
 vKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4VHKIK3Zl3M4dYV9Wc80s3WWD/x1jRZu8ubXlR1N6DM=;
 b=P5NLOXEJVMwl3s/CHOgirQ5TWV8yo3sg3+0irWot6lDIKkvSmagNeq2Kf1ZsCglp9y
 QsMXBSyLsBkpjrbM+zIxu3jYRu1byitjE/a0RUVvu5quaubIIHK6L/W0ifoX+aUEoxGZ
 C0jwsoqCBphoQBDYaAo5+b/1VB1iwk3Qpqw5dEQQbLZgxieq2DCY/rfhPp3euX9c7106
 69GIAA36+ubnEoXI71/r5GPwXR6m7OMB+NFoIP9IHYLLBT2UIXuD/dSHCi23bk4Hb46L
 SsDBakv1WcC+gs+gomziPiHg6Eo/NBI7a2IL9jCOuUyP3UXD4zrriO+EvkA5C9pFCj/U
 UBCg==
X-Gm-Message-State: AOAM530PtQwJ4KjSdXSzFP2TSrMlwbxbvYFE2R3JbzUH2dLv6D558csJ
 7GhIgToctkjl151rjK0nuMB7xME/6VH/7w==
X-Google-Smtp-Source: ABdhPJwy0+jZcwcZ+gKJtVGJkJVSzKMWmTbD6ZaqSa0gZaii1fa6++vlodZFDlhHwSo2He8fFTwVHKnuLMKM+w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:414d:: with SMTP id
 m13mr10864989pjg.229.1607651544556; Thu, 10 Dec 2020 17:52:24 -0800 (PST)
Date: Thu, 10 Dec 2020 17:51:56 -0800
In-Reply-To: <20201211015156.2053372-1-wuhaotsh@google.com>
Message-Id: <20201211015156.2053372-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201211015156.2053372-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 7/7] hw/ipmi: Add an IPMI external host device
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=32NDSXwgKCskB9wp387wv33v0t.r315t19-stAt0232v29.36v@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

The IPMI external host device works for Baseband Management Controller
(BMC) emulations. It works as a representation of a host class that
connects to a given BMC.  It can connect to a real host hardware or a
emulated or simulated host device. In particular it can connect to a
host QEMU instance with device ipmi-bmc-extern.

For more details of IPMI host device in BMC emulation, see
docs/specs/ipmi.rst.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/ipmi/ipmi_host_extern.c | 435 +++++++++++++++++++++++++++++++++++++
 hw/ipmi/meson.build        |   1 +
 2 files changed, 436 insertions(+)
 create mode 100644 hw/ipmi/ipmi_host_extern.c

diff --git a/hw/ipmi/ipmi_host_extern.c b/hw/ipmi/ipmi_host_extern.c
new file mode 100644
index 0000000000..6b5d45d403
--- /dev/null
+++ b/hw/ipmi/ipmi_host_extern.c
@@ -0,0 +1,435 @@
+/*
+ * IPMI Host external connection
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+/*
+ * This is designed to connect to a host QEMU VM that runs ipmi_bmc_extern.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+#include "chardev/char-fe.h"
+#include "hw/ipmi/ipmi.h"
+#include "hw/ipmi/ipmi_host.h"
+#include "hw/ipmi/ipmi_responder.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#define VM_MSG_CHAR        0xA0 /* Marks end of message */
+#define VM_CMD_CHAR        0xA1 /* Marks end of a command */
+#define VM_ESCAPE_CHAR     0xAA /* Set bit 4 from the next byte to 0 */
+
+#define VM_PROTOCOL_VERSION        1
+#define VM_CMD_VERSION             0xff /* A version number byte follows */
+#define VM_CMD_RESET               0x04
+#define VM_CMD_CAPABILITIES        0x08
+
+#define TYPE_IPMI_HOST_EXTERN "ipmi-host-extern"
+#define IPMI_HOST_EXTERN(obj) OBJECT_CHECK(IPMIHostExtern, (obj), \
+                                        TYPE_IPMI_HOST_EXTERN)
+
+typedef struct IPMIHostExtern {
+    IPMIHost parent;
+    CharBackend chr;
+    struct QEMUTimer *extern_timer;
+
+    bool connected;
+    uint8_t capability;
+
+    unsigned char inbuf[MAX_IPMI_MSG_SIZE + 2];
+    unsigned int inpos;
+    bool in_escape;
+    bool in_too_many;
+    bool sending_cmd;
+
+    unsigned char outbuf[(MAX_IPMI_MSG_SIZE + 2) * 2 + 1];
+    unsigned int outpos;
+    unsigned int outlen;
+} IPMIHostExtern;
+
+static unsigned char
+ipmb_checksum(const unsigned char *data, int size, unsigned char start)
+{
+    unsigned char csum = start;
+
+    for (; size > 0; size--, data++) {
+            csum += *data;
+    }
+    return csum;
+}
+
+static void continue_send(IPMIHostExtern *ihe)
+{
+    int ret;
+
+    if (ihe->outlen == 0) {
+        return;
+    }
+    ret = qemu_chr_fe_write(&ihe->chr, ihe->outbuf + ihe->outpos,
+                            ihe->outlen - ihe->outpos);
+    if (ret > 0) {
+        ihe->outpos += ret;
+    }
+    if (ihe->outpos < ihe->outlen) {
+        /* Not fully transmitted, try again in a 10ms */
+        timer_mod_ns(ihe->extern_timer,
+                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 10000000);
+    } else {
+        /* Sent */
+        ihe->outlen = 0;
+        ihe->outpos = 0;
+    }
+}
+
+static void extern_timeout(void *opaque)
+{
+    IPMIHostExtern *ihe = opaque;
+
+    if (ihe->connected) {
+        continue_send(ihe);
+    }
+}
+
+static void addchar(IPMIHostExtern *ihe, unsigned char ch)
+{
+    switch (ch) {
+    case VM_MSG_CHAR:
+    case VM_CMD_CHAR:
+    case VM_ESCAPE_CHAR:
+        /* Escape the special characters. */
+        ihe->outbuf[ihe->outlen++] = VM_ESCAPE_CHAR;
+        ch |= 0x10;
+        /* fall through */
+    default:
+        ihe->outbuf[ihe->outlen++] = ch;
+    }
+}
+
+static void send_version(IPMIHostExtern *ihe)
+{
+    addchar(ihe, VM_CMD_VERSION);
+    addchar(ihe, VM_PROTOCOL_VERSION);
+    ihe->outbuf[ihe->outlen++] = VM_CMD_CHAR;
+    continue_send(ihe);
+}
+
+/*
+ * Handle a command (typically IPMI response) from IPMI responder
+ * and send it out to the external host.
+ */
+static void ipmi_host_extern_handle_command(IPMIHost *h, uint8_t *cmd,
+        unsigned cmd_len, unsigned max_cmd_len, uint8_t msg_id)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(h);
+    uint8_t err = 0, csum;
+    int i;
+
+    if (!ihe->connected) {
+        /* We are not connected to external host. Just do nothing. */
+        return;
+    }
+    addchar(ihe, msg_id);
+    /* If it's too short or it was truncated, return an error. */
+    if (cmd_len < 2) {
+        err = IPMI_CC_REQUEST_DATA_LENGTH_INVALID;
+    } else if ((cmd_len > max_cmd_len) || (cmd_len > MAX_IPMI_MSG_SIZE)) {
+        err = IPMI_CC_REQUEST_DATA_TRUNCATED;
+    }
+    if (err) {
+        /* Send out the error message */
+        unsigned char rsp[3];
+
+        rsp[0] = cmd[0] | 0x04;
+        rsp[1] = cmd[1];
+        rsp[2] = err;
+        for (i = 0; i < 3; ++i) {
+            addchar(ihe, rsp[i]);
+        }
+        csum = ipmb_checksum(&msg_id, 1, 0);
+        addchar(ihe, -ipmb_checksum(rsp, 3, csum));
+    } else {
+        for (i = 0; i < cmd_len; i++) {
+            addchar(ihe, cmd[i]);
+        }
+        csum = ipmb_checksum(&msg_id, 1, 0);
+        addchar(ihe, -ipmb_checksum(cmd, cmd_len, csum));
+    }
+
+    ihe->outbuf[ihe->outlen++] = VM_MSG_CHAR;
+
+    /* Start the transmit */
+    continue_send(ihe);
+}
+
+/*
+ * This function handles an IPMI message received from an external host by
+ * sending it to the IPMI responder class.
+ */
+static void handle_msg(IPMIHostExtern *ihe)
+{
+    IPMIResponderClass *k = IPMI_RESPONDER_GET_CLASS(ihe->parent.responder);
+    if (unlikely(ihe->in_escape)) {
+        ipmi_debug("msg escape not ended\n");
+        return;
+    }
+    if (unlikely(ihe->inpos < 4)) {
+        ipmi_debug("msg too short\n");
+        return;
+    }
+    if (unlikely(ihe->in_too_many)) {
+        ihe->inbuf[3] = IPMI_CC_REQUEST_DATA_TRUNCATED;
+        ihe->inpos = 4;
+    } else if (unlikely(ipmb_checksum(ihe->inbuf, ihe->inpos, 0) != 0)) {
+        ipmi_debug("msg checksum failure\n");
+        return;
+    } else {
+        ihe->inpos--; /* Remove checkum */
+    }
+
+    k->handle_req(ihe->parent.responder, ihe->inbuf[0], ihe->inbuf + 1,
+            ihe->inpos - 1);
+}
+
+/* This function handles a control command from the host. */
+static void handle_command(IPMIHostExtern *ihe)
+{
+    uint8_t cmd;
+
+    if (unlikely(ihe->in_too_many)) {
+        ipmi_debug("cmd in too many\n");
+        return;
+    }
+
+    if (unlikely(ihe->in_escape)) {
+        ipmi_debug("cmd ends with escape character\n");
+        return;
+    }
+
+    if (unlikely(ihe->inpos < 1)) {
+        ipmi_debug("empty command.\n");
+        return;
+    }
+
+    cmd = ihe->inbuf[0];
+    switch (cmd) {
+    case VM_CMD_VERSION:
+        /* The host informs us the protocol version. */
+        if (unlikely(ihe->inpos < 2)) {
+            ipmi_debug("Host cmd version truncated.\n");
+            break;
+        }
+        if (unlikely(ihe->inbuf[1] != VM_PROTOCOL_VERSION)) {
+            ipmi_debug("Host protocol version %u is different from our version"
+                    " %u\n", ihe->inbuf[1], VM_PROTOCOL_VERSION);
+        }
+        break;
+    case VM_CMD_RESET:
+        /* The host tells us a reset has happened. */
+        break;
+    case VM_CMD_CAPABILITIES:
+        /* The host tells us its capability. */
+        if (unlikely(ihe->inpos < 2)) {
+            ipmi_debug("Host cmd capability truncated.\n");
+            break;
+        }
+        ihe->capability = ihe->inbuf[1];
+        break;
+    default:
+        /* The host shouldn't send us this command. Just ignore if they do. */
+        ipmi_debug("Host cmd type %02x is invalid.\n", cmd);
+    }
+}
+
+/* Clear the state of ipmi-host-extern. Happens at the end of a message. */
+static void clear_state(IPMIHostExtern *ihe)
+{
+    ihe->in_escape = false;
+    ihe->in_too_many = false;
+    ihe->inpos = 0;
+}
+
+/* We always welcome an incoming request. */
+static int can_receive(void *opaque)
+{
+    return 1;
+}
+
+/*
+ * This function mirrors ipmi-bmc-extern. It handles an incoming character
+ * sequence and translates it into IPMI message.
+ */
+static void receive(void *opaque, const uint8_t *buf, int size)
+{
+    IPMIHostExtern *ihe = opaque;
+    int i;
+
+    for (i = 0; i < size; ++i) {
+        uint8_t ch = buf[i];
+
+        switch (ch) {
+        case VM_MSG_CHAR:
+            /* The preceding characters are an IPMI message. */
+            handle_msg(ihe);
+            clear_state(ihe);
+            break;
+
+        case VM_CMD_CHAR:
+            /* The preceding characters are a control command. */
+            handle_command(ihe);
+            clear_state(ihe);
+            break;
+
+        case VM_ESCAPE_CHAR:
+            ihe->in_escape = true;
+            break;
+
+        default:
+            if (ihe->in_escape) {
+                ch &= ~0x10;
+                ihe->in_escape = false;
+            }
+            if (ihe->in_too_many) {
+                break;
+            }
+            if (ihe->inpos >= ARRAY_SIZE(ihe->inbuf)) {
+                ihe->in_too_many = true;
+                break;
+            }
+            ihe->inbuf[ihe->inpos++] = ch;
+            break;
+        }
+    }
+    return;
+}
+
+static void chr_event(void *opaque, QEMUChrEvent event)
+{
+    IPMIHostExtern *ihe = opaque;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        ihe->connected = true;
+        clear_state(ihe);
+        send_version(ihe);
+        break;
+
+    case CHR_EVENT_CLOSED:
+        ihe->connected = false;
+        break;
+
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void ipmi_host_extern_responder_check(const Object *obj,
+        const char *name, Object *val, Error **errp)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(obj);
+
+    if (ihe->parent.responder) {
+        error_setg(errp, "IPMI host already has a responder");
+    }
+}
+
+static void ipmi_host_extern_realize(DeviceState *dev, Error **errp)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(dev);
+    IPMIResponderClass *rk;
+
+    if (!qemu_chr_fe_backend_connected(&ihe->chr)) {
+        error_setg(errp, "IPMI external host requires chardev attribute");
+        return;
+    }
+
+    qemu_chr_fe_set_handlers(&ihe->chr, can_receive, receive,
+                             chr_event, NULL, ihe, NULL, true);
+
+    if (ihe->parent.responder == NULL) {
+        error_setg(errp, "IPMI host requires responder attribute");
+        return;
+    }
+    rk = IPMI_RESPONDER_GET_CLASS(ihe->parent.responder);
+    rk->set_host(ihe->parent.responder, &ihe->parent);
+}
+
+static const VMStateDescription vmstate_ipmi_host_extern = {
+    .name = TYPE_IPMI_HOST_EXTERN,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields      = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ipmi_host_extern_init(Object *obj)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(obj);
+
+    object_property_add_link(OBJECT(ihe), "responder", TYPE_IPMI_RESPONDER,
+            (Object **)(&ihe->parent.responder),
+            ipmi_host_extern_responder_check, OBJ_PROP_LINK_STRONG);
+    ihe->extern_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, extern_timeout, ihe);
+    vmstate_register(NULL, 0, &vmstate_ipmi_host_extern, ihe);
+}
+
+static void ipmi_host_extern_finalize(Object *obj)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(obj);
+
+    timer_del(ihe->extern_timer);
+    timer_free(ihe->extern_timer);
+}
+
+static Property ipmi_host_extern_properties[] = {
+    DEFINE_PROP_CHR("chardev", IPMIHostExtern, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ipmi_host_extern_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    IPMIHostClass *bk = IPMI_HOST_CLASS(oc);
+
+    bk->handle_command = ipmi_host_extern_handle_command;
+    dc->hotpluggable = false;
+    dc->realize = ipmi_host_extern_realize;
+    device_class_set_props(dc, ipmi_host_extern_properties);
+}
+
+static const TypeInfo ipmi_host_extern_type = {
+    .name          = TYPE_IPMI_HOST_EXTERN,
+    .parent        = TYPE_IPMI_HOST,
+    .instance_size = sizeof(IPMIHostExtern),
+    .instance_init = ipmi_host_extern_init,
+    .instance_finalize = ipmi_host_extern_finalize,
+    .class_init    = ipmi_host_extern_class_init,
+ };
+
+static void ipmi_host_extern_register_types(void)
+{
+    type_register_static(&ipmi_host_extern_type);
+}
+
+type_init(ipmi_host_extern_register_types)
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index 1261489fbd..8352913288 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -8,6 +8,7 @@ ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host.c'))
+ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host_extern.c'))
 ipmi_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_kcs.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
-- 
2.29.2.684.gfbc64c5ab5-goog



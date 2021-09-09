Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAE405FE6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:12:57 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTE0-0002ue-4j
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ppM6YQgKCsc97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8d-0004ly-Hc
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:24 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:33531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ppM6YQgKCsc97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8Z-0003bR-Rs
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:23 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 o76-20020a25414f000000b0059bb8130257so4569435yba.0
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=q2HspjkQGp6Pxy9tVcuH1pGOja3ICX8wGe0oj0Uv7jY=;
 b=se4+1X+ggT2kRYWWgDtfpoTgHUhi8CZVMPMr4JudJv98Cxa9U0t0QS0g8wJSXwT8T/
 yJgRAdtit/e+God+X419yjxpzoCtB6LtKtviLzspnefl2fPpowkb0JqSPHWEFf3WIiNH
 cn6UEUkAT/CP6hw9D9w2kJqcZFaEx8e+g+0KjKBGSatZwOWqmFh5tOOzfhzWrFw9Pm+5
 OQeY63z2+gbOOUO4rPj2Zk78Xd/m7prwTbmcc8dBvE5UGsDnEF2l6LZsplgf+6+y9jrr
 E7M+V0ce4MfP3AcWEFZZsQSTHKnaelUOcjor4xmHFDSjh88dET4PgLw/4jDZ4+FsusN2
 I5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=q2HspjkQGp6Pxy9tVcuH1pGOja3ICX8wGe0oj0Uv7jY=;
 b=ejs4k8Umahg6sPyjUK+FVLjDEOux1u2aRGkS68TgBz2WQkofojLxONzle/1y0PyAp5
 PvMQt3IDSrdeNQxwgWWMmUuvs+SyvrsX2F64A3/dNvQ06E/+/SCAy9Z/hUpSSSqKRYPX
 4BzS8WpyBqS0DCZFH+p0hhYxJeh0Wp6NJBYHnyQ2dqe2TA6p4uGxu2hwV69J0Ioot8cI
 2k2H/QC1cMM/zW1WwGtThYGyDWOFZfYvSE7qzb5thQmPjqsSwZyk20l8VW5UY7Ot5xIC
 IN4kr3imEXV7+o5Xl+EmTZ2TH48n0ROwRLvqEVu5s1mldcmJaL7+0RmM0IrWW9fcDpbt
 fsqA==
X-Gm-Message-State: AOAM5324mMMNddvO9hIEEf94PshfA1wlb4Sg5OR0iLLfwEkZT5BawPVG
 APQy/z3QGqGakGoa2WnWAVAF6hp6UM8Q/w==
X-Google-Smtp-Source: ABdhPJy7pVPxdXXSk5E0H9T4PgmIZ7nVUTX3qkIQJugiPRXwcrX44zh+LJsTv5LP5eifuprrXV4Cce9ECBd1Sg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a5b:cc7:: with SMTP id
 e7mr7243409ybr.152.1631228838379; Thu, 09 Sep 2021 16:07:18 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:17 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 5/8] hw/ipmi: Take out common from ipmi_bmc_extern.c
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ppM6YQgKCsc97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patch refactors ipmi_bmc_extern.c and takes out the parts that can
be used both ipmi_bmc_extern.c and bmc_host_extern.c to a common file
ipmi_extern.c.

Now we have a connection called IPMIExtern which handles the connection,
and IPMIBmcExtern that handles core-side emulation specific stuff.

Basically most of the message transaction are moved. The stuff remained
are basically hardware operations like handle_reset and handle_hw_op.
These stuff have different behaviors in core-side and BMC-side
emulation.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/ipmi/ipmi_bmc_extern.c | 420 ++++----------------------------------
 hw/ipmi/ipmi_extern.c     | 415 +++++++++++++++++++++++++++++++++++++
 hw/ipmi/ipmi_extern.h     |  90 ++++++++
 hw/ipmi/meson.build       |   2 +-
 4 files changed, 543 insertions(+), 384 deletions(-)
 create mode 100644 hw/ipmi/ipmi_extern.c
 create mode 100644 hw/ipmi/ipmi_extern.h

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index a0c3a40e7c..24979ecfd5 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -34,211 +34,43 @@
 #include "qemu/timer.h"
 #include "chardev/char-fe.h"
 #include "hw/ipmi/ipmi.h"
+#include "hw/ipmi/ipmi_extern.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
 
-#define VM_MSG_CHAR        0xA0 /* Marks end of message */
-#define VM_CMD_CHAR        0xA1 /* Marks end of a command */
-#define VM_ESCAPE_CHAR     0xAA /* Set bit 4 from the next byte to 0 */
-
-#define VM_PROTOCOL_VERSION        1
-#define VM_CMD_VERSION             0xff /* A version number byte follows */
-#define VM_CMD_NOATTN              0x00
-#define VM_CMD_ATTN                0x01
-#define VM_CMD_ATTN_IRQ            0x02
-#define VM_CMD_POWEROFF            0x03
-#define VM_CMD_RESET               0x04
-#define VM_CMD_ENABLE_IRQ          0x05 /* Enable/disable the messaging irq */
-#define VM_CMD_DISABLE_IRQ         0x06
-#define VM_CMD_SEND_NMI            0x07
-#define VM_CMD_CAPABILITIES        0x08
-#define   VM_CAPABILITIES_POWER    0x01
-#define   VM_CAPABILITIES_RESET    0x02
-#define   VM_CAPABILITIES_IRQ      0x04
-#define   VM_CAPABILITIES_NMI      0x08
-#define   VM_CAPABILITIES_ATTN     0x10
-#define   VM_CAPABILITIES_GRACEFUL_SHUTDOWN 0x20
-#define VM_CMD_GRACEFUL_SHUTDOWN   0x09
-
 #define TYPE_IPMI_BMC_EXTERN "ipmi-bmc-extern"
 OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcExtern, IPMI_BMC_EXTERN)
+
 struct IPMIBmcExtern {
     IPMIBmc parent;
 
-    CharBackend chr;
-
-    bool connected;
-
-    unsigned char inbuf[MAX_IPMI_MSG_SIZE + 2];
-    unsigned int inpos;
-    bool in_escape;
-    bool in_too_many;
-    bool waiting_rsp;
-    bool sending_cmd;
-
-    unsigned char outbuf[(MAX_IPMI_MSG_SIZE + 2) * 2 + 1];
-    unsigned int outpos;
-    unsigned int outlen;
-
-    struct QEMUTimer *extern_timer;
+    IPMIExtern conn;
 
     /* A reset event is pending to be sent upstream. */
     bool send_reset;
 };
 
-static unsigned char
-ipmb_checksum(const unsigned char *data, int size, unsigned char start)
+static void continue_send_bmc(IPMIBmcExtern *ibe)
 {
-        unsigned char csum = start;
-
-        for (; size > 0; size--, data++) {
-                csum += *data;
-        }
-        return csum;
-}
-
-static void continue_send(IPMIBmcExtern *ibe)
-{
-    int ret;
-    if (ibe->outlen == 0) {
-        goto check_reset;
-    }
- send:
-    ret = qemu_chr_fe_write(&ibe->chr, ibe->outbuf + ibe->outpos,
-                            ibe->outlen - ibe->outpos);
-    if (ret > 0) {
-        ibe->outpos += ret;
-    }
-    if (ibe->outpos < ibe->outlen) {
-        /* Not fully transmitted, try again in a 10ms */
-        timer_mod_ns(ibe->extern_timer,
-                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 10000000);
-    } else {
-        /* Sent */
-        ibe->outlen = 0;
-        ibe->outpos = 0;
-        if (!ibe->sending_cmd) {
-            ibe->waiting_rsp = true;
-        } else {
-            ibe->sending_cmd = false;
-        }
-    check_reset:
-        if (ibe->connected && ibe->send_reset) {
+    if (continue_send(&ibe->conn)) {
+        if (ibe->conn.connected && ibe->send_reset) {
             /* Send the reset */
-            ibe->outbuf[0] = VM_CMD_RESET;
-            ibe->outbuf[1] = VM_CMD_CHAR;
-            ibe->outlen = 2;
-            ibe->outpos = 0;
+            ibe->conn.outbuf[0] = VM_CMD_RESET;
+            ibe->conn.outbuf[1] = VM_CMD_CHAR;
+            ibe->conn.outlen = 2;
+            ibe->conn.outpos = 0;
             ibe->send_reset = false;
-            ibe->sending_cmd = true;
-            goto send;
-        }
-
-        if (ibe->waiting_rsp) {
-            /* Make sure we get a response within 4 seconds. */
-            timer_mod_ns(ibe->extern_timer,
-                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 4000000000ULL);
+            ibe->conn.sending_cmd = true;
+            continue_send(&ibe->conn);
         }
     }
-    return;
 }
 
-static void extern_timeout(void *opaque)
+static void ipmi_bmc_handle_hw_op(IPMICore *ic, unsigned char hw_op,
+                                  uint8_t operand)
 {
-    IPMICore *ic = opaque;
-    IPMIBmcExtern *ibe = opaque;
-    IPMIInterface *s = ic->intf;
-
-    if (ibe->connected) {
-        if (ibe->waiting_rsp && (ibe->outlen == 0)) {
-            IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
-            /* The message response timed out, return an error. */
-            ibe->waiting_rsp = false;
-            ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
-            ibe->inbuf[2] = ibe->outbuf[2];
-            ibe->inbuf[3] = IPMI_CC_TIMEOUT;
-            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
-        } else {
-            continue_send(ibe);
-        }
-    }
-}
-
-static void addchar(IPMIBmcExtern *ibe, unsigned char ch)
-{
-    switch (ch) {
-    case VM_MSG_CHAR:
-    case VM_CMD_CHAR:
-    case VM_ESCAPE_CHAR:
-        ibe->outbuf[ibe->outlen] = VM_ESCAPE_CHAR;
-        ibe->outlen++;
-        ch |= 0x10;
-        /* fall through */
-    default:
-        ibe->outbuf[ibe->outlen] = ch;
-        ibe->outlen++;
-    }
-}
-
-static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
-                                       uint8_t *cmd, unsigned int cmd_len,
-                                       unsigned int max_cmd_len,
-                                       uint8_t msg_id)
-{
-    IPMICore *ic = IPMI_CORE(b);
-    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(b);
-    IPMIInterface *s = ic->intf;
-    uint8_t err = 0, csum;
-    unsigned int i;
-
-    if (ibe->outlen) {
-        /* We already have a command queued.  Shouldn't ever happen. */
-        error_report("IPMI KCS: Got command when not finished with the"
-                     " previous command");
-        abort();
-    }
-
-    /* If it's too short or it was truncated, return an error. */
-    if (cmd_len < 2) {
-        err = IPMI_CC_REQUEST_DATA_LENGTH_INVALID;
-    } else if ((cmd_len > max_cmd_len) || (cmd_len > MAX_IPMI_MSG_SIZE)) {
-        err = IPMI_CC_REQUEST_DATA_TRUNCATED;
-    } else if (!ibe->connected) {
-        err = IPMI_CC_BMC_INIT_IN_PROGRESS;
-    }
-    if (err) {
-        IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
-        unsigned char rsp[3];
-        rsp[0] = cmd[0] | 0x04;
-        rsp[1] = cmd[1];
-        rsp[2] = err;
-        ibe->waiting_rsp = false;
-        k->handle_msg(s, msg_id, rsp, 3);
-        goto out;
-    }
-
-    addchar(ibe, msg_id);
-    for (i = 0; i < cmd_len; i++) {
-        addchar(ibe, cmd[i]);
-    }
-    csum = ipmb_checksum(&msg_id, 1, 0);
-    addchar(ibe, -ipmb_checksum(cmd, cmd_len, csum));
-
-    ibe->outbuf[ibe->outlen] = VM_MSG_CHAR;
-    ibe->outlen++;
-
-    /* Start the transmit */
-    continue_send(ibe);
-
- out:
-    return;
-}
-
-static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
-{
-    IPMICore *ic = IPMI_CORE(ibe);
     IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
 
@@ -285,169 +117,22 @@ static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
     }
 }
 
-static void handle_msg(IPMIBmcExtern *ibe)
-{
-    IPMICore *ic = IPMI_CORE(ibe);
-    IPMIInterface *s = ic->intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
-
-    if (ibe->in_escape) {
-        ipmi_debug("msg escape not ended\n");
-        return;
-    }
-    if (ibe->inpos < 5) {
-        ipmi_debug("msg too short\n");
-        return;
-    }
-    if (ibe->in_too_many) {
-        ibe->inbuf[3] = IPMI_CC_REQUEST_DATA_TRUNCATED;
-        ibe->inpos = 4;
-    } else if (ipmb_checksum(ibe->inbuf, ibe->inpos, 0) != 0) {
-        ipmi_debug("msg checksum failure\n");
-        return;
-    } else {
-        ibe->inpos--; /* Remove checkum */
-    }
-
-    timer_del(ibe->extern_timer);
-    ibe->waiting_rsp = false;
-    k->handle_msg(s, ibe->inbuf[0], ibe->inbuf + 1, ibe->inpos - 1);
-}
-
-static int can_receive(void *opaque)
-{
-    return 1;
-}
-
-static void receive(void *opaque, const uint8_t *buf, int size)
+static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
+                                       uint8_t *cmd, unsigned int cmd_len,
+                                       unsigned int max_cmd_len,
+                                       uint8_t msg_id)
 {
-    IPMIBmcExtern *ibe = opaque;
-    int i;
-    unsigned char hw_op;
-
-    for (i = 0; i < size; i++) {
-        unsigned char ch = buf[i];
-
-        switch (ch) {
-        case VM_MSG_CHAR:
-            handle_msg(ibe);
-            ibe->in_too_many = false;
-            ibe->inpos = 0;
-            break;
-
-        case VM_CMD_CHAR:
-            if (ibe->in_too_many) {
-                ipmi_debug("cmd in too many\n");
-                ibe->in_too_many = false;
-                ibe->inpos = 0;
-                break;
-            }
-            if (ibe->in_escape) {
-                ipmi_debug("cmd in escape\n");
-                ibe->in_too_many = false;
-                ibe->inpos = 0;
-                ibe->in_escape = false;
-                break;
-            }
-            ibe->in_too_many = false;
-            if (ibe->inpos < 1) {
-                break;
-            }
-            hw_op = ibe->inbuf[0];
-            ibe->inpos = 0;
-            goto out_hw_op;
-            break;
-
-        case VM_ESCAPE_CHAR:
-            ibe->in_escape = true;
-            break;
-
-        default:
-            if (ibe->in_escape) {
-                ch &= ~0x10;
-                ibe->in_escape = false;
-            }
-            if (ibe->in_too_many) {
-                break;
-            }
-            if (ibe->inpos >= sizeof(ibe->inbuf)) {
-                ibe->in_too_many = true;
-                break;
-            }
-            ibe->inbuf[ibe->inpos] = ch;
-            ibe->inpos++;
-            break;
-        }
-    }
-    return;
+    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(b);
 
- out_hw_op:
-    handle_hw_op(ibe, hw_op);
+    ipmi_extern_handle_command(&ibe->conn, cmd, cmd_len, max_cmd_len, msg_id);
 }
 
-static void chr_event(void *opaque, QEMUChrEvent event)
+static void ipmi_bmc_extern_realize(DeviceState *dev, Error **errp)
 {
-    IPMICore *ic = opaque;
-    IPMIBmcExtern *ibe = opaque;
-    IPMIInterface *s = ic->intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
-    unsigned char v;
-
-    switch (event) {
-    case CHR_EVENT_OPENED:
-        ibe->connected = true;
-        ibe->outpos = 0;
-        ibe->outlen = 0;
-        addchar(ibe, VM_CMD_VERSION);
-        addchar(ibe, VM_PROTOCOL_VERSION);
-        ibe->outbuf[ibe->outlen] = VM_CMD_CHAR;
-        ibe->outlen++;
-        addchar(ibe, VM_CMD_CAPABILITIES);
-        v = VM_CAPABILITIES_IRQ | VM_CAPABILITIES_ATTN;
-        if (k->do_hw_op(s, IPMI_POWEROFF_CHASSIS, 1) == 0) {
-            v |= VM_CAPABILITIES_POWER;
-        }
-        if (k->do_hw_op(s, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
-            == 0) {
-            v |= VM_CAPABILITIES_GRACEFUL_SHUTDOWN;
-        }
-        if (k->do_hw_op(s, IPMI_RESET_CHASSIS, 1) == 0) {
-            v |= VM_CAPABILITIES_RESET;
-        }
-        if (k->do_hw_op(s, IPMI_SEND_NMI, 1) == 0) {
-            v |= VM_CAPABILITIES_NMI;
-        }
-        addchar(ibe, v);
-        ibe->outbuf[ibe->outlen] = VM_CMD_CHAR;
-        ibe->outlen++;
-        ibe->sending_cmd = false;
-        continue_send(ibe);
-        break;
-
-    case CHR_EVENT_CLOSED:
-        if (!ibe->connected) {
-            return;
-        }
-        ibe->connected = false;
-        /*
-         * Don't hang the OS trying to handle the ATN bit, other end will
-         * resend on a reconnect.
-         */
-        k->set_atn(s, 0, 0);
-        if (ibe->waiting_rsp) {
-            ibe->waiting_rsp = false;
-            ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
-            ibe->inbuf[2] = ibe->outbuf[2];
-            ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
-            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
-        }
-        break;
+    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(dev);
 
-    case CHR_EVENT_BREAK:
-    case CHR_EVENT_MUX_IN:
-    case CHR_EVENT_MUX_OUT:
-        /* Ignore */
-        break;
+    if (!qdev_realize(DEVICE(&ibe->conn), NULL, errp)) {
+        return;
     }
 }
 
@@ -456,42 +141,14 @@ static void ipmi_bmc_extern_handle_reset(IPMIBmc *b)
     IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(b);
 
     ibe->send_reset = true;
-    continue_send(ibe);
-}
-
-static void ipmi_bmc_extern_realize(DeviceState *dev, Error **errp)
-{
-    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(dev);
-
-    if (!qemu_chr_fe_backend_connected(&ibe->chr)) {
-        error_setg(errp, "IPMI external bmc requires chardev attribute");
-        return;
-    }
-
-    qemu_chr_fe_set_handlers(&ibe->chr, can_receive, receive,
-                             chr_event, NULL, ibe, NULL, true);
+    continue_send_bmc(ibe);
 }
 
 static int ipmi_bmc_extern_post_migrate(void *opaque, int version_id)
 {
-    IPMIBmcExtern *ibe = opaque;
-
-    /*
-     * We don't directly restore waiting_rsp, Instead, we return an
-     * error on the interface if a response was being waited for.
-     */
-    if (ibe->waiting_rsp) {
-        IPMICore *ic = opaque;
-        IPMIInterface *ii = ic->intf;
-        IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
-
-        ibe->waiting_rsp = false;
-        ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
-        ibe->inbuf[2] = ibe->outbuf[2];
-        ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
-        iic->handle_msg(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
-    }
-    return 0;
+    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(opaque);
+
+    return ipmi_extern_post_migrate(&ibe->conn, version_id);
 }
 
 static const VMStateDescription vmstate_ipmi_bmc_extern = {
@@ -501,28 +158,24 @@ static const VMStateDescription vmstate_ipmi_bmc_extern = {
     .post_load = ipmi_bmc_extern_post_migrate,
     .fields      = (VMStateField[]) {
         VMSTATE_BOOL(send_reset, IPMIBmcExtern),
-        VMSTATE_BOOL(waiting_rsp, IPMIBmcExtern),
+        VMSTATE_BOOL(conn.waiting_rsp, IPMIBmcExtern),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static void ipmi_bmc_extern_init(Object *obj)
 {
+    IPMICore *ic = IPMI_CORE(obj);
     IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(obj);
 
-    ibe->extern_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, extern_timeout, ibe);
+    object_initialize_child(obj, "extern", &ibe->conn,
+                            TYPE_IPMI_EXTERN);
+    ibe->conn.core = ic;
     vmstate_register(NULL, 0, &vmstate_ipmi_bmc_extern, ibe);
 }
 
-static void ipmi_bmc_extern_finalize(Object *obj)
-{
-    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(obj);
-
-    timer_free(ibe->extern_timer);
-}
-
 static Property ipmi_bmc_extern_properties[] = {
-    DEFINE_PROP_CHR("chardev", IPMIBmcExtern, chr),
+    DEFINE_PROP_CHR("chardev", IPMIBmcExtern, conn.chr),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -530,9 +183,11 @@ static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     IPMIBmcClass *bk = IPMI_BMC_CLASS(oc);
+    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
 
     bk->handle_command = ipmi_bmc_extern_handle_command;
     bk->handle_reset = ipmi_bmc_extern_handle_reset;
+    ck->handle_hw_op = ipmi_bmc_handle_hw_op;
     dc->hotpluggable = false;
     dc->realize = ipmi_bmc_extern_realize;
     device_class_set_props(dc, ipmi_bmc_extern_properties);
@@ -543,9 +198,8 @@ static const TypeInfo ipmi_bmc_extern_type = {
     .parent        = TYPE_IPMI_BMC,
     .instance_size = sizeof(IPMIBmcExtern),
     .instance_init = ipmi_bmc_extern_init,
-    .instance_finalize = ipmi_bmc_extern_finalize,
     .class_init    = ipmi_bmc_extern_class_init,
- };
+};
 
 static void ipmi_bmc_extern_register_types(void)
 {
diff --git a/hw/ipmi/ipmi_extern.c b/hw/ipmi/ipmi_extern.c
new file mode 100644
index 0000000000..f139eaef24
--- /dev/null
+++ b/hw/ipmi/ipmi_extern.c
@@ -0,0 +1,415 @@
+/*
+ * IPMI external connection
+ *
+ * Copyright (c) 2015 Corey Minyard, MontaVista Software, LLC
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+#include "chardev/char-fe.h"
+#include "hw/ipmi/ipmi.h"
+#include "hw/ipmi/ipmi_extern.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qom/object.h"
+
+static unsigned char
+ipmb_checksum(const unsigned char *data, int size, unsigned char start)
+{
+        unsigned char csum = start;
+
+        for (; size > 0; size--, data++) {
+                csum += *data;
+        }
+        return csum;
+}
+
+/* Returns whether check_reset is required for IPMI_BMC_EXTERN. */
+bool continue_send(IPMIExtern *ibe)
+{
+    int ret;
+    if (ibe->outlen == 0) {
+        return true;
+    }
+    ret = qemu_chr_fe_write(&ibe->chr, ibe->outbuf + ibe->outpos,
+                            ibe->outlen - ibe->outpos);
+    if (ret > 0) {
+        ibe->outpos += ret;
+    }
+    if (ibe->outpos < ibe->outlen) {
+        /* Not fully transmitted, try again in a 10ms */
+        timer_mod_ns(ibe->extern_timer,
+                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 10000000);
+        return false;
+    } else {
+        /* Sent */
+        ibe->outlen = 0;
+        ibe->outpos = 0;
+        if (!ibe->bmc_side && !ibe->sending_cmd) {
+            ibe->waiting_rsp = true;
+        } else {
+            ibe->sending_cmd = false;
+        }
+
+        if (ibe->waiting_rsp) {
+            /* Make sure we get a response within 4 seconds. */
+            timer_mod_ns(ibe->extern_timer,
+                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 4000000000ULL);
+        }
+        return true;
+    }
+}
+
+static void extern_timeout(void *opaque)
+{
+    IPMIExtern *ibe = opaque;
+    IPMIInterface *s = ibe->core->intf;
+
+    if (ibe->connected) {
+        /*TODO: only core-side */
+        if (ibe->waiting_rsp && (ibe->outlen == 0)) {
+            IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+            /* The message response timed out, return an error. */
+            ibe->waiting_rsp = false;
+            ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
+            ibe->inbuf[2] = ibe->outbuf[2];
+            ibe->inbuf[3] = IPMI_CC_TIMEOUT;
+            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
+        } else {
+            continue_send(ibe);
+        }
+    }
+}
+
+static void addchar(IPMIExtern *ibe, unsigned char ch)
+{
+    switch (ch) {
+    case VM_MSG_CHAR:
+    case VM_CMD_CHAR:
+    case VM_ESCAPE_CHAR:
+        ibe->outbuf[ibe->outlen] = VM_ESCAPE_CHAR;
+        ibe->outlen++;
+        ch |= 0x10;
+        /* fall through */
+    default:
+        ibe->outbuf[ibe->outlen] = ch;
+        ibe->outlen++;
+    }
+}
+
+void ipmi_extern_handle_command(IPMIExtern *ibe,
+                                       uint8_t *cmd, unsigned int cmd_len,
+                                       unsigned int max_cmd_len,
+                                       uint8_t msg_id)
+{
+    IPMIInterface *s = ibe->core->intf;
+    uint8_t err = 0, csum;
+    unsigned int i;
+
+    if (ibe->outlen) {
+        /* We already have a command queued.  Shouldn't ever happen. */
+        error_report("IPMI KCS: Got command when not finished with the"
+                     " previous command");
+        abort();
+    }
+
+    /* If it's too short or it was truncated, return an error. */
+    if (cmd_len < 2) {
+        err = IPMI_CC_REQUEST_DATA_LENGTH_INVALID;
+    } else if ((cmd_len > max_cmd_len) || (cmd_len > MAX_IPMI_MSG_SIZE)) {
+        err = IPMI_CC_REQUEST_DATA_TRUNCATED;
+    } else if (!ibe->connected) {
+        err = IPMI_CC_BMC_INIT_IN_PROGRESS;
+    }
+    if (err) {
+        IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+        unsigned char rsp[3];
+        rsp[0] = cmd[0] | 0x04;
+        rsp[1] = cmd[1];
+        rsp[2] = err;
+        ibe->waiting_rsp = false;
+        k->handle_msg(s, msg_id, rsp, 3);
+        goto out;
+    }
+
+    addchar(ibe, msg_id);
+    for (i = 0; i < cmd_len; i++) {
+        addchar(ibe, cmd[i]);
+    }
+    csum = ipmb_checksum(&msg_id, 1, 0);
+    addchar(ibe, -ipmb_checksum(cmd, cmd_len, csum));
+
+    ibe->outbuf[ibe->outlen] = VM_MSG_CHAR;
+    ibe->outlen++;
+
+    /* Start the transmit */
+    continue_send(ibe);
+
+ out:
+    return;
+}
+
+static void handle_msg(IPMIExtern *ibe)
+{
+    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(ibe->core->intf);
+
+    if (ibe->in_escape) {
+        ipmi_debug("msg escape not ended\n");
+        return;
+    }
+    if (ibe->inpos < (ibe->bmc_side ? 4 : 5)) {
+        ipmi_debug("msg too short\n");
+        return;
+    }
+    if (ibe->in_too_many) {
+        ibe->inbuf[3] = IPMI_CC_REQUEST_DATA_TRUNCATED;
+        ibe->inpos = 4;
+    } else if (ipmb_checksum(ibe->inbuf, ibe->inpos, 0) != 0) {
+        ipmi_debug("msg checksum failure\n");
+        return;
+    } else {
+        ibe->inpos--; /* Remove checkum */
+    }
+
+    timer_del(ibe->extern_timer);
+    ibe->waiting_rsp = false;
+    k->handle_msg(ibe->core->intf, ibe->inbuf[0],
+                  ibe->inbuf + 1, ibe->inpos - 1);
+}
+
+static int can_receive(void *opaque)
+{
+    return 1;
+}
+
+static void receive(void *opaque, const uint8_t *buf, int size)
+{
+    IPMIExtern *ibe = opaque;
+    IPMICoreClass *ck = IPMI_CORE_GET_CLASS(ibe->core);
+    int i;
+    unsigned char hw_op;
+    unsigned char hw_operand = 0;
+
+    for (i = 0; i < size; i++) {
+        unsigned char ch = buf[i];
+
+        switch (ch) {
+        case VM_MSG_CHAR:
+            handle_msg(ibe);
+            ibe->in_too_many = false;
+            ibe->inpos = 0;
+            break;
+
+        case VM_CMD_CHAR:
+            if (ibe->in_too_many) {
+                ipmi_debug("cmd in too many\n");
+                ibe->in_too_many = false;
+                ibe->inpos = 0;
+                break;
+            }
+            if (ibe->in_escape) {
+                ipmi_debug("cmd in escape\n");
+                ibe->in_too_many = false;
+                ibe->inpos = 0;
+                ibe->in_escape = false;
+                break;
+            }
+            ibe->in_too_many = false;
+            if (ibe->inpos < 1) {
+                break;
+            }
+            hw_op = ibe->inbuf[0];
+            if (ibe->inpos > 1) {
+                hw_operand = ibe->inbuf[1];
+            }
+            ibe->inpos = 0;
+            goto out_hw_op;
+            break;
+
+        case VM_ESCAPE_CHAR:
+            ibe->in_escape = true;
+            break;
+
+        default:
+            if (ibe->in_escape) {
+                ch &= ~0x10;
+                ibe->in_escape = false;
+            }
+            if (ibe->in_too_many) {
+                break;
+            }
+            if (ibe->inpos >= sizeof(ibe->inbuf)) {
+                ibe->in_too_many = true;
+                break;
+            }
+            ibe->inbuf[ibe->inpos] = ch;
+            ibe->inpos++;
+            break;
+        }
+    }
+    return;
+
+ out_hw_op:
+    ck->handle_hw_op(ibe->core, hw_op, hw_operand);
+}
+
+static void chr_event(void *opaque, QEMUChrEvent event)
+{
+    IPMIExtern *ibe = opaque;
+    IPMIInterface *s = ibe->core->intf;
+    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    unsigned char v;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        ibe->connected = true;
+        ibe->outpos = 0;
+        ibe->outlen = 0;
+        addchar(ibe, VM_CMD_VERSION);
+        addchar(ibe, VM_PROTOCOL_VERSION);
+        ibe->outbuf[ibe->outlen] = VM_CMD_CHAR;
+        ibe->outlen++;
+        /* Only send capability for core side. */
+        if (!ibe->bmc_side) {
+            addchar(ibe, VM_CMD_CAPABILITIES);
+            v = VM_CAPABILITIES_IRQ | VM_CAPABILITIES_ATTN;
+            if (k->do_hw_op(ibe->core->intf, IPMI_POWEROFF_CHASSIS, 1) == 0) {
+                v |= VM_CAPABILITIES_POWER;
+            }
+            if (k->do_hw_op(ibe->core->intf, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
+                == 0) {
+                v |= VM_CAPABILITIES_GRACEFUL_SHUTDOWN;
+            }
+            if (k->do_hw_op(ibe->core->intf, IPMI_RESET_CHASSIS, 1) == 0) {
+                v |= VM_CAPABILITIES_RESET;
+            }
+            if (k->do_hw_op(ibe->core->intf, IPMI_SEND_NMI, 1) == 0) {
+                v |= VM_CAPABILITIES_NMI;
+            }
+            addchar(ibe, v);
+            ibe->outbuf[ibe->outlen] = VM_CMD_CHAR;
+            ibe->outlen++;
+        }
+        ibe->sending_cmd = false;
+        continue_send(ibe);
+        break;
+
+    case CHR_EVENT_CLOSED:
+        if (!ibe->connected) {
+            return;
+        }
+        ibe->connected = false;
+        /*
+         * Don't hang the OS trying to handle the ATN bit, other end will
+         * resend on a reconnect.
+         */
+        k->set_atn(s, 0, 0);
+        if (ibe->waiting_rsp) {
+            ibe->waiting_rsp = false;
+            ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
+            ibe->inbuf[2] = ibe->outbuf[2];
+            ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
+            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
+        }
+        break;
+
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void ipmi_extern_realize(DeviceState *dev, Error **errp)
+{
+    IPMIExtern *ibe = IPMI_EXTERN(dev);
+
+    if (!qemu_chr_fe_backend_connected(&ibe->chr)) {
+        error_setg(errp, "IPMI external bmc requires chardev attribute");
+        return;
+    }
+
+    qemu_chr_fe_set_handlers(&ibe->chr, can_receive, receive,
+                             chr_event, NULL, ibe, NULL, true);
+}
+
+int ipmi_extern_post_migrate(IPMIExtern *ibe, int version_id)
+{
+    /*
+     * We don't directly restore waiting_rsp, Instead, we return an
+     * error on the interface if a response was being waited for.
+     */
+    if (ibe->waiting_rsp) {
+        IPMIInterface *ii = ibe->core->intf;
+        IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+
+        ibe->waiting_rsp = false;
+        ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
+        ibe->inbuf[2] = ibe->outbuf[2];
+        ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
+        iic->handle_msg(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
+    }
+    return 0;
+}
+
+static void ipmi_extern_init(Object *obj)
+{
+    IPMIExtern *ibe = IPMI_EXTERN(obj);
+
+    ibe->extern_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, extern_timeout, ibe);
+}
+
+static void ipmi_extern_finalize(Object *obj)
+{
+    IPMIExtern *ibe = IPMI_EXTERN(obj);
+
+    timer_del(ibe->extern_timer);
+    timer_free(ibe->extern_timer);
+}
+
+
+static void ipmi_extern_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->hotpluggable = false;
+    dc->realize = ipmi_extern_realize;
+}
+
+static const TypeInfo ipmi_extern_type = {
+    .name          = TYPE_IPMI_EXTERN,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(IPMIExtern),
+    .instance_init = ipmi_extern_init,
+    .instance_finalize = ipmi_extern_finalize,
+    .class_init    = ipmi_extern_class_init,
+ };
+
+static void ipmi_extern_register_types(void)
+{
+    type_register_static(&ipmi_extern_type);
+}
+
+type_init(ipmi_extern_register_types)
diff --git a/hw/ipmi/ipmi_extern.h b/hw/ipmi/ipmi_extern.h
new file mode 100644
index 0000000000..e4aa80a0f6
--- /dev/null
+++ b/hw/ipmi/ipmi_extern.h
@@ -0,0 +1,90 @@
+/*
+ * IPMI external connection
+ *
+ * Copyright (c) 2015 Corey Minyard, MontaVista Software, LLC
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_IPMI_EXTERN_H
+#define HW_IPMI_EXTERN_H
+
+#include "qemu/osdep.h"
+#include "hw/ipmi/ipmi.h"
+
+#define VM_MSG_CHAR        0xA0 /* Marks end of message */
+#define VM_CMD_CHAR        0xA1 /* Marks end of a command */
+#define VM_ESCAPE_CHAR     0xAA /* Set bit 4 from the next byte to 0 */
+
+#define VM_PROTOCOL_VERSION        1
+#define VM_CMD_VERSION             0xff /* A version number byte follows */
+#define VM_CMD_NOATTN              0x00
+#define VM_CMD_ATTN                0x01
+#define VM_CMD_ATTN_IRQ            0x02
+#define VM_CMD_POWEROFF            0x03
+#define VM_CMD_RESET               0x04
+#define VM_CMD_ENABLE_IRQ          0x05 /* Enable/disable the messaging irq */
+#define VM_CMD_DISABLE_IRQ         0x06
+#define VM_CMD_SEND_NMI            0x07
+#define VM_CMD_CAPABILITIES        0x08
+#define   VM_CAPABILITIES_POWER    0x01
+#define   VM_CAPABILITIES_RESET    0x02
+#define   VM_CAPABILITIES_IRQ      0x04
+#define   VM_CAPABILITIES_NMI      0x08
+#define   VM_CAPABILITIES_ATTN     0x10
+#define   VM_CAPABILITIES_GRACEFUL_SHUTDOWN 0x20
+#define VM_CMD_GRACEFUL_SHUTDOWN   0x09
+
+typedef struct IPMIExtern {
+    DeviceState parent;
+
+    CharBackend chr;
+
+    IPMICore *core;
+
+    bool bmc_side;
+    bool connected;
+
+    unsigned char inbuf[MAX_IPMI_MSG_SIZE + 2];
+    unsigned int inpos;
+    bool in_escape;
+    bool in_too_many;
+    bool waiting_rsp;
+    bool sending_cmd;
+
+    unsigned char outbuf[(MAX_IPMI_MSG_SIZE + 2) * 2 + 1];
+    unsigned int outpos;
+    unsigned int outlen;
+
+    struct QEMUTimer *extern_timer;
+} IPMIExtern;
+
+#define TYPE_IPMI_EXTERN "ipmi-extern"
+#define IPMI_EXTERN(obj) \
+    OBJECT_CHECK(IPMIExtern, (obj), TYPE_IPMI_EXTERN)
+
+void ipmi_extern_handle_command(IPMIExtern *ibe,
+                                uint8_t *cmd, unsigned int cmd_len,
+                                unsigned int max_cmd_len,
+                                uint8_t msg_id);
+
+bool continue_send(IPMIExtern *ibe);
+int ipmi_extern_post_migrate(IPMIExtern *ibe, int version_id);
+
+#endif /* HW_IPMI_EXTERN_H */
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index 9622ea2a2c..edd0bf9af9 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -1,5 +1,5 @@
 ipmi_ss = ss.source_set()
-ipmi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c', 'ipmi_kcs.c', 'ipmi_bt.c'))
+ipmi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c', 'ipmi_kcs.c', 'ipmi_bt.c', 'ipmi_extern.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_LOCAL', if_true: files('ipmi_bmc_sim.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_EXTERN', if_true: files('ipmi_bmc_extern.c'))
 ipmi_ss.add(when: 'CONFIG_ISA_IPMI_KCS', if_true: files('isa_ipmi_kcs.c'))
-- 
2.33.0.309.g3052b89438-goog



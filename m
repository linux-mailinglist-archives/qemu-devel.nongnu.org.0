Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73446EDBAF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:37:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCI4-0005OV-JM; Tue, 25 Apr 2023 02:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHN-0004NY-8w; Tue, 25 Apr 2023 02:35:57 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHL-0003C2-0G; Tue, 25 Apr 2023 02:35:56 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C5CC35C0059;
 Tue, 25 Apr 2023 02:35:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 Apr 2023 02:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1682404553; x=
 1682490953; bh=9qx6CjVUXSv7kqpytsuI9dsaNTcKs3DVHw+c1HJ+txY=; b=e
 Qa5MAQnZfUx1w+vVjCAFB0AyjT6f7qHTEoGW176wfrTwYdeqAAXdQzpp7A4x/ZWS
 NNoVDhZmoVdr0JEBpT0cLtqkUAiHAX4lIhztzjrUIAI7u834wbke6ZFv5FmHjO7f
 Y89cdQ+9t/sgGWjEiebgDjVSIvifKbT2uRSvdh9bII6mYWeq29E15trsefNiUjo+
 Mbr8NXxCOCW5tKAMrA4C9w6KiNY7wBamj6O63ZCy8BjY7ClNxRmtkNsGzDbm1mRs
 3r5XGXb6h4m/VYvk/pFXdRVYtGV0o+FcIUSJJhSJJPvcg+FFKWlzkswDOJN6M6Zh
 aiaqM1eJJJLS5XhO+zAkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1682404553; x=
 1682490953; bh=9qx6CjVUXSv7kqpytsuI9dsaNTcKs3DVHw+c1HJ+txY=; b=g
 ApVb8EBambTSPNSGDu9+J281Yrq9XSEpzxs++miWjtWtfrm+jU/Hy6brRvrG9+o+
 EbHfc9H3FXGxwnJuaMcLhv51snxzCI3hxan67e/11+8PpT4ymTgBPN9STYAwGUPY
 TdJePv0NOoFKAUajEcaHHhEtjDpBeMdSv/mjJs0XaqWOjD3s7ldv/i0KWPQ4s7J+
 W3PKALhz5DmjRiyg6JKFn07EeCTJxzqQCSyrS/xWfHnx65oLL5+tcnDGvw3n8IfI
 8UFJolBwX1cwDMUwkLaGFtWCpm/4y7qhuBGkAcqfl61nq2aDMsgf3xLzy5hajLNC
 Q8zd9PQA00mk4OyyKMelw==
X-ME-Sender: <xms:yXRHZMcJWwSw9nUamQMVxvXeAcT7xTnKCmQmaZzO1-PL8IcWGNaC9w>
 <xme:yXRHZOMP9oLKk-JwB7QN7Vgbv2x-BZ-Y_Y1C9ZIlbsRX5RrRWVOMTAhsc_wyBVuoD
 n3eN2s6sHfpzoBkBgU>
X-ME-Received: <xmr:yXRHZNgNr0v_hk9ihGKun0oe2xd9Wyv2k5YDZOTiCA-_zUx6SP7Ps84wDIcttCHpcqGEakfjMaM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:yXRHZB9h_NdhWm3sJuPoMhpwMc-suzesUJvALYqyQmCVsQvu8Sjo1A>
 <xmx:yXRHZIv4jlyTREhuGW997_IMmYkTPFKwf-j9nyIZvZ9FjqzEBmhwIQ>
 <xmx:yXRHZIFRNwdWuSpSvNeJrlpYJNsld3RJnVrZpk118w5nHncqQbHTTQ>
 <xmx:yXRHZFNV-wVt9Y2c8Bj41ep9GoLSAJmRND0QWtQoVhiKbRBcHQSLsg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 02:35:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <cminyard@mvista.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Klaus Jensen <its@irrelevant.dk>, qemu-arm@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 3/3] hw/nvme: add nvme management interface model
Date: Tue, 25 Apr 2023 08:35:40 +0200
Message-Id: <20230425063540.46143-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425063540.46143-1-its@irrelevant.dk>
References: <20230425063540.46143-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11764; i=k.jensen@samsung.com;
 h=from:subject; bh=d98r3oYwcA/yo1yV6Nhqc1L79jhKGvkbzI6P9wxy6ns=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGRHdLu4QmDnunlBhX41jnXmkJYJeAGXteOP7
 S9veyfR2DqLDYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkR3S7AAoJEE3hrzFt
 Tw3p310IAIAVNLZii88cyOreKpUkv9Us9j1o5Fzizzu3pjROnBMWh2BmazTkTxW3TDkHm41pq/I
 INsczQ/cl62kBeCp+5YqX5fYJm03Q6bC53lfGCvfPCLew0cWpEAPgxzRxUf+SCtxt5r6bDEXgUi
 DpEWkx4A0Nx80aB2IerfENExuoow9VO94Aljjv4SE/8uxuq5FNC9HaE2QB0X1PMQSfIXh8XS+tK
 bjoEnvhxMWCoKW7sCd2DlRSGCsOjqaTtATtbPDpJmzbFIa4FKYHLjQcq6g7pyKrF1RoJuf+c1Ns
 OWIjJ8bx+M5FbEzolnAiRneTAzeFsAF9+Y82YdGM2qKfTeZ9zvnZM6Sl
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Klaus Jensen <k.jensen@samsung.com>

Add the 'nmi-i2c' device that emulates an NVMe Management Interface
controller.

Initial support is very basic (Read NMI DS, Configuration Get).

This is based on previously posted code by Padmakar Kalghatgi, Arun
Kumar Agasar and Saurav Kumar.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/meson.build  |   1 +
 hw/nvme/nmi-i2c.c    | 382 +++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/trace-events |   6 +
 3 files changed, 389 insertions(+)
 create mode 100644 hw/nvme/nmi-i2c.c

diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
index 3cf40046eea9..b231e3fa12c2 100644
--- a/hw/nvme/meson.build
+++ b/hw/nvme/meson.build
@@ -1 +1,2 @@
 softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
+softmmu_ss.add(when: 'CONFIG_MCTP_I2C', if_true: files('nmi-i2c.c'))
diff --git a/hw/nvme/nmi-i2c.c b/hw/nvme/nmi-i2c.c
new file mode 100644
index 000000000000..81738f185bba
--- /dev/null
+++ b/hw/nvme/nmi-i2c.c
@@ -0,0 +1,382 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * SPDX-FileCopyrightText: Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ *
+ * SPDX-FileContributor: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
+ * SPDX-FileContributor: Arun Kumar Agasar <arun.kka@samsung.com>
+ * SPDX-FileContributor: Saurav Kumar <saurav.29@partner.samsung.com>
+ * SPDX-FileContributor: Klaus Jensen <k.jensen@samsung.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/crc32c.h"
+#include "hw/i2c/i2c.h"
+#include "hw/registerfields.h"
+#include "hw/i2c/mctp.h"
+#include "trace.h"
+
+#define NMI_MAX_MESSAGE_LENGTH 4224
+
+#define TYPE_NMI_I2C_DEVICE "nmi-i2c"
+OBJECT_DECLARE_SIMPLE_TYPE(NMIDevice, NMI_I2C_DEVICE)
+
+typedef struct NMIDevice {
+    MCTPI2CEndpoint mctp;
+
+    uint8_t buffer[NMI_MAX_MESSAGE_LENGTH];
+    uint8_t scratch[NMI_MAX_MESSAGE_LENGTH];
+
+    size_t  len;
+    int64_t pos;
+} NMIDevice;
+
+FIELD(NMI_NMP, ROR, 7, 1)
+FIELD(NMI_NMP, NMIMT, 3, 4)
+
+#define NMI_NMP_NMIMT_NMI_CMD 0x1
+#define NMI_NMP_NMIMT_NM_ADMIN 0x2
+
+typedef struct NMIMessage {
+    uint8_t mctpd;
+    uint8_t nmp;
+    uint8_t rsvd2[2];
+    uint8_t payload[]; /* includes the Message Integrity Check */
+} NMIMessage;
+
+typedef struct NMIRequest {
+   uint8_t opc;
+   uint8_t rsvd1[3];
+   uint32_t dw0;
+   uint32_t dw1;
+   uint32_t mic;
+} NMIRequest;
+
+typedef struct NMIResponse {
+    uint8_t status;
+    uint8_t response[3];
+    uint8_t payload[]; /* includes the Message Integrity Check */
+} NMIResponse;
+
+typedef enum NMIReadDSType {
+    NMI_CMD_READ_NMI_DS_SUBSYSTEM       = 0x0,
+    NMI_CMD_READ_NMI_DS_PORTS           = 0x1,
+    NMI_CMD_READ_NMI_DS_CTRL_LIST       = 0x2,
+    NMI_CMD_READ_NMI_DS_CTRL_INFO       = 0x3,
+    NMI_CMD_READ_NMI_DS_CMD_SUPPORT     = 0x4,
+    NMI_CMD_READ_NMI_DS_MEB_CMD_SUPPORT = 0x5,
+} NMIReadDSType;
+
+static void nmi_handle_mi_read_nmi_ds(NMIDevice *nmi, NMIRequest *request)
+{
+    I2CSlave *i2c = I2C_SLAVE(nmi);
+
+    uint32_t dw0 = le32_to_cpu(request->dw0);
+    uint8_t dtyp = (dw0 >> 24) & 0xf;
+    uint8_t *buf;
+    size_t len;
+
+    trace_nmi_handle_mi_read_nmi_ds(dtyp);
+
+    static uint8_t nmi_ds_subsystem[36] = {
+        0x00,       /* success */
+        0x20,       /* response data length */
+        0x00, 0x00, /* reserved */
+        0x00,       /* number of ports */
+        0x01,       /* major version */
+        0x01,       /* minor version */
+    };
+
+    static uint8_t nmi_ds_ports[36] = {
+        0x00,       /* success */
+        0x20,       /* response data length */
+        0x00, 0x00, /* reserved */
+        0x02,       /* port type (smbus) */
+        0x00,       /* reserved */
+        0x40, 0x00, /* maximum mctp transission unit size (64 bytes) */
+        0x00, 0x00, 0x00, 0x00, /* management endpoint buffer size */
+        0x00, 0x00, /* vpd i2c address/freq */
+        0x00, 0x01, /* management endpoint i2c address/freq */
+    };
+
+    static uint8_t nmi_ds_error[4] = {
+        0x04,       /* invalid parameter */
+        0x00,       /* first invalid bit position */
+        0x00, 0x00, /* first invalid byte position */
+    };
+
+    static uint8_t nmi_ds_empty[8] = {
+        0x00,       /* success */
+        0x02,       /* response data length */
+        0x00, 0x00, /* reserved */
+        0x00, 0x00, /* number of controllers */
+        0x00, 0x00, /* padding */
+    };
+
+    switch (dtyp) {
+    case NMI_CMD_READ_NMI_DS_SUBSYSTEM:
+        len = 36;
+        buf = nmi_ds_subsystem;
+
+        break;
+
+    case NMI_CMD_READ_NMI_DS_PORTS:
+        len = 36;
+        buf = nmi_ds_ports;
+
+        /* patch in the i2c address of the endpoint */
+        buf[14] = i2c->address;
+
+        break;
+
+    case NMI_CMD_READ_NMI_DS_CTRL_INFO:
+        len = 4;
+        buf = nmi_ds_error;
+
+        break;
+
+    case NMI_CMD_READ_NMI_DS_CTRL_LIST:
+    case NMI_CMD_READ_NMI_DS_CMD_SUPPORT:
+    case NMI_CMD_READ_NMI_DS_MEB_CMD_SUPPORT:
+        len = 8;
+        buf = nmi_ds_empty;
+
+        break;
+
+    default:
+        len = 4;
+        buf = nmi_ds_error;
+
+        /* patch in the invalid parameter position */
+        buf[2] = 0x03; /* first invalid byte position (dtyp) */
+
+        break;
+    }
+
+    memcpy(nmi->scratch + nmi->pos, buf, len);
+    nmi->pos += len;
+}
+
+enum {
+    NMI_CMD_CONFIGURATION_GET_SMBUS_FREQ                = 0x1,
+    NMI_CMD_CONFIGURATION_GET_HEALTH_STATUS_CHANGE      = 0x2,
+    NMI_CMD_CONFIGURATION_GET_MCTP_TRANSMISSION_UNIT    = 0x3,
+};
+
+static void nmi_handle_mi_config_get(NMIDevice *nmi, NMIRequest *request)
+{
+    uint32_t dw0 = le32_to_cpu(request->dw0);
+    uint8_t identifier = dw0 & 0xff;
+    uint8_t *buf;
+
+    trace_nmi_handle_mi_config_get(identifier);
+
+    switch (identifier) {
+    case NMI_CMD_CONFIGURATION_GET_SMBUS_FREQ:
+        buf = (uint8_t[]) {
+            0x0, 0x1, 0x0, 0x0,
+        };
+
+        break;
+
+    case NMI_CMD_CONFIGURATION_GET_HEALTH_STATUS_CHANGE:
+        buf = (uint8_t[]) {
+            0x0, 0x0, 0x0, 0x0,
+        };
+
+        break;
+
+    case NMI_CMD_CONFIGURATION_GET_MCTP_TRANSMISSION_UNIT:
+        buf = (uint8_t[]) {
+            0x0, 0x40, 0x0, 0x0,
+        };
+
+        break;
+    }
+
+    memcpy(nmi->scratch + nmi->pos, buf, 4);
+    nmi->pos += 4;
+}
+
+enum {
+    NMI_CMD_READ_NMI_DS         = 0x0,
+    NMI_CMD_CONFIGURATION_GET   = 0x4,
+};
+
+static void nmi_set_parameter_error(NMIDevice *nmi, uint8_t bit, uint16_t byte)
+{
+    nmi->scratch[nmi->pos++] = 0x4;
+    nmi->scratch[nmi->pos++] = bit;
+    nmi->scratch[nmi->pos++] = (byte >> 4) & 0xf;
+    nmi->scratch[nmi->pos++] = byte & 0xf;
+}
+
+static void nmi_set_error(NMIDevice *nmi, uint8_t status)
+{
+    uint8_t buf[4] = {};
+
+    buf[0] = status;
+
+    memcpy(nmi->scratch + nmi->pos, buf, 4);
+    nmi->pos += 4;
+}
+
+static void nmi_handle_mi(NMIDevice *nmi, NMIMessage *msg)
+{
+    NMIRequest *request = (NMIRequest *)msg->payload;
+
+    trace_nmi_handle_mi(request->opc);
+
+    switch (request->opc) {
+    case NMI_CMD_READ_NMI_DS:
+        nmi_handle_mi_read_nmi_ds(nmi, request);
+        break;
+
+    case NMI_CMD_CONFIGURATION_GET:
+        nmi_handle_mi_config_get(nmi, request);
+        break;
+
+    default:
+        nmi_set_parameter_error(nmi, 0x0, 0x0);
+        fprintf(stderr, "nmi command 0x%x not handled\n", request->opc);
+
+        break;
+    }
+}
+
+enum {
+    NMI_MESSAGE_TYPE_NMI = 0x1,
+};
+
+static void nmi_handle_message(MCTPI2CEndpoint *mctp)
+{
+    NMIDevice *nmi = NMI_I2C_DEVICE(mctp);
+    NMIMessage *msg = (NMIMessage *)nmi->buffer;
+    uint32_t crc;
+    uint8_t nmimt;
+
+    uint8_t buf[] = {
+        MCTP_MESSAGE_TYPE_NMI | MCTP_MESSAGE_IC,
+        FIELD_DP8(msg->nmp, NMI_NMP, ROR, 1),
+        0x0, 0x0,
+    };
+
+    memcpy(nmi->scratch, buf, sizeof(buf));
+    nmi->pos = sizeof(buf);
+
+    nmimt = FIELD_EX8(msg->nmp, NMI_NMP, NMIMT);
+
+    trace_nmi_handle_msg(nmimt);
+
+    switch (nmimt) {
+    case NMI_MESSAGE_TYPE_NMI:
+        nmi_handle_mi(nmi, msg);
+        break;
+
+    default:
+        fprintf(stderr, "nmi message type 0x%x not handled\n", nmimt);
+
+        nmi_set_error(nmi, 0x3);
+
+        break;
+    }
+
+    /* add message integrity check */
+    memset(nmi->scratch + nmi->pos, 0x0, sizeof(crc));
+
+    crc = crc32c(0xffffffff, nmi->scratch, nmi->pos);
+    memcpy(nmi->scratch + nmi->pos, &crc, sizeof(crc));
+
+    nmi->len = nmi->pos + sizeof(crc);
+    nmi->pos = 0;
+
+    i2c_mctp_schedule_send(mctp);
+}
+
+static size_t nmi_get_message_bytes(MCTPI2CEndpoint *mctp, uint8_t *buf,
+                                    size_t maxlen, uint8_t *mctp_flags)
+{
+    NMIDevice *nmi = NMI_I2C_DEVICE(mctp);
+    size_t len;
+
+    len = MIN(maxlen, nmi->len - nmi->pos);
+
+    if (len == 0) {
+        return 0;
+    }
+
+    if (nmi->pos == 0) {
+        *mctp_flags |= MCTP_H_FLAGS_SOM;
+    }
+
+    memcpy(buf, nmi->scratch + nmi->pos, len);
+    nmi->pos += len;
+
+    if (nmi->pos == nmi->len) {
+        *mctp_flags |= MCTP_H_FLAGS_EOM;
+
+        nmi->pos = nmi->len = 0;
+    }
+
+    return len;
+}
+
+static int nmi_put_message_bytes(MCTPI2CEndpoint *mctp, uint8_t *buf,
+                                 size_t len)
+{
+    NMIDevice *nmi = NMI_I2C_DEVICE(mctp);
+
+    if (nmi->len + len > NMI_MAX_MESSAGE_LENGTH) {
+        return -1;
+    }
+
+    memcpy(nmi->buffer + nmi->len, buf, len);
+    nmi->len += len;
+
+    return 0;
+}
+
+static void nmi_reset_message(MCTPI2CEndpoint *mctp)
+{
+    NMIDevice *nmi = NMI_I2C_DEVICE(mctp);
+    nmi->len = 0;
+}
+
+static size_t nmi_get_message_types(MCTPI2CEndpoint *mctp, uint8_t *data,
+                                    size_t maxlen)
+{
+    uint8_t buf[] = {
+        0x0, 0x1, 0x4,
+    };
+
+    memcpy(data, buf, sizeof(buf));
+
+    return sizeof(buf);
+}
+
+static void nvme_mi_class_init(ObjectClass *oc, void *data)
+{
+    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_CLASS(oc);
+
+    mc->get_message_types = nmi_get_message_types;
+
+    mc->get_message_bytes = nmi_get_message_bytes;
+    mc->put_message_bytes = nmi_put_message_bytes;
+
+    mc->handle_message = nmi_handle_message;
+    mc->reset_message = nmi_reset_message;
+}
+
+static const TypeInfo nvme_mi = {
+    .name = TYPE_NMI_I2C_DEVICE,
+    .parent = TYPE_MCTP_I2C_ENDPOINT,
+    .instance_size = sizeof(NMIDevice),
+    .class_init = nvme_mi_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&nvme_mi);
+}
+
+type_init(register_types);
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 9afddf3b951c..e71171c539bd 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -215,3 +215,9 @@ pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for
 pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
 pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"
 pci_nvme_ub_too_many_mappings(void) "too many prp/sgl mappings"
+
+# nmi-i2c
+nmi_handle_mi_read_nmi_ds(uint8_t dtyp) "dtyp 0x%"PRIx8""
+nmi_handle_mi_config_get(uint8_t identifier) "identifier 0x%"PRIx8""
+nmi_handle_mi(uint8_t opc) "opc 0x%"PRIx8""
+nmi_handle_msg(uint8_t nmint) "nmint 0x%"PRIx8""
-- 
2.40.0



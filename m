Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C462B56F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovE18-0005I6-KP; Wed, 16 Nov 2022 03:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovE13-0005C8-6k; Wed, 16 Nov 2022 03:43:29 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovE11-0001tZ-2b; Wed, 16 Nov 2022 03:43:28 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E93085C028D;
 Wed, 16 Nov 2022 03:43:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Nov 2022 03:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668588205; x=
 1668674605; bh=2c/TERD17gl9VYRuxGXF81cpmlodkST+HavpPPoOTUU=; b=m
 c1MFfMr6ki5uVQ1XwUcxKOsSfUr2KICjxoVIju2pX0fEgtNsZif3Za/W7VU2Tp1K
 EwK1cWvcEaF/Q1r1TKQbkwPbgngr15hTNkBBMXNiu5+5pth9l6bXhqG+pWOe5o09
 R+K9YLiYwKlsPzgJp5TMSSAuDWtlwiFsQ45khsxEZYHBC/IGwS3AiroN+R+9XDCX
 CBMKzet9sbxERy8yqb0rcIujUtL6a+fEwpMy6e12BkbQLcADH3O+5Utix1ZiAGOl
 OGteHLSghzyQoGSvdkeJ/C05rDQUWp8Y+Tmhlqb+R8wR/auOGtz04mDWMLAxQm59
 AtOpUlykwE4xXtVjtzeUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668588205; x=1668674605; bh=2c/TERD17gl9V
 YRuxGXF81cpmlodkST+HavpPPoOTUU=; b=Qm9gEjbDxPu+h0P3OABQZh5D53e5/
 usYlOyVVgjeBEMO2F4FfYlUOkDIHrFQkoVU6frt7vo57gbQ1PvKliMXKKm3RUwyZ
 zBjGjpShajikaQJ4ONqD/wcXNLEFBitlYnQuHwSVhTMBo1wDhioFLdvpSR1QG9ie
 wmfNPZG/x0nw72GyKzXeA476RKAfYAV358Rd+4hx1cOqUyBpbRdes9SRDRRz+7tw
 4tXkzaC1O5R+0yJXF3pWXVwF1JBkiMF3B0AddBL86An3O6Koya71YlhMJo7cgtMg
 cC827sYte+c2ZKAlPnU1tGuaq6ZMXfYs5qIbBSJu0ByMn65ZpcdndWkZQ==
X-ME-Sender: <xms:rKJ0Y2mjI3ufvo0JGy5cCa0YOHoWs5kklCrivaKzIkIWmc7c-gZO8A>
 <xme:rKJ0Y90Fv23uuidKjlMkm5d7rathBHZ41ZKwEYG82oKX_2JyproNbNoQZ3arOJnfG
 mXQ_vg3xIuixSC9_2o>
X-ME-Received: <xmr:rKJ0Y0pltl6-av220GfgdzJCK7BM0tDY7mB3WvSeV_M8w348bAFZJD6o1wPshRqRWMa-cPi3YS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:rKJ0Y6kIxQPGoMUrZgqLx3L1_gmHgL-wlNQGolAcOwL4yre_--Inyw>
 <xmx:rKJ0Y01KvGaisBRrgiRIPfE1ezW7589DNtHD_wQ5KAUUEFZy18rujw>
 <xmx:rKJ0Yxttz67CGoibk9dnlti1b7eqtKwfHwjLGCbvwPCL1xREh-c22A>
 <xmx:raJ0Y5v8VtD1K6w_Xn8NV1Pd0npFFLIj7-oIBhlJuLZyNjrr1beLQg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 03:43:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>,
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH RFC 3/3] hw/nvme: add nvme management interface model
Date: Wed, 16 Nov 2022 09:43:12 +0100
Message-Id: <20221116084312.35808-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116084312.35808-1-its@irrelevant.dk>
References: <20221116084312.35808-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11707; i=k.jensen@samsung.com;
 h=from:subject; bh=NN3rgSR1PoHVKTWqAhcnEeOVUsbkEmb3ZeTlUCMCOf8=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN0oqAsRSA28MKGYEk3VYPct+c1EIwcuZxYcvcv
 841WBy3om4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjdKKgAAoJEE3hrzFtTw3p5q
 MH/2Nb9fEGcIzU9tt0iLd3D16Q0YAfgSrFyQoCRcvJet7PeEEo9MGPfKFRaaP4nttUkh+PTHgnHo8/
 JFWKXbkZjlgZv9W+UJEUmesGcXUHNTFpdcxUJdvZSt3MdzgEUNIaaPRx2J3RRA2PxKktDt3L3IlrKt
 PkqN/SZ9+XoBKv4DfCTGTYD0O3C3K8yNVVuUsjN9lbmljYnZekoi0Rlh5kUjA8woGuCpwKaAEL5ofs
 lbYVUmd5owH4rMzqG98VcsbU6hhVOCfIoLUJBgl4hJNULr+ysuDWPGXsytJzMtibjy5C/tpMQofbEL
 iMTydLbsBy0L+DtygBdlqYDhtDa0jlGueBMaiC
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/nvme/nmi-i2c.c    | 381 +++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/trace-events |   6 +
 3 files changed, 388 insertions(+)
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
index 000000000000..79fd18cdc5cf
--- /dev/null
+++ b/hw/nvme/nmi-i2c.c
@@ -0,0 +1,381 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only
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
+static size_t nmi_get_message_types(MCTPI2CEndpoint *mctp, uint8_t *data)
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
index fccb79f48973..669785780b2a 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -214,3 +214,9 @@ pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for
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
2.38.1



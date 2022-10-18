Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35760311A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:56:44 +0200 (CEST)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okptS-0003xD-UH
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okpPe-0002KF-24
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:25:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okpPY-0000ho-Vy
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:25:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id iv17so11107651wmb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wWq6hnsaFLz+MOuTFr1IgBVv3W9pMuAAjIbbxnfc4s=;
 b=Oydacf69ugJJQemV5HZfFV3mOxa/+/7mhe7jS9Jn4zzRVRjHPSd5IP75LwFubb8MCC
 QsTPsnqD+6o46ySbTm7vOlBYWNzKC+C0T8waSNWJjfC6kr+kEvO5lpGpsYADk8i+YemI
 oK088PUHxRjgfWQwi7+FExJdMJtm2+DDONrr0ICL9Jr3R6Q+/DdhRXWEkk0wbsuaX97E
 prRCMLthMxPUu6UZekXO6opbl2IRx19wt3tzTizT3NBS707Zr+CHegzFV+DGJ9DMHKug
 NQs+xQshMdLRzduSz5h8X4hA5/ilkP0b0l77OYBG77X5EfFrS2Tf6S7yMwVfIKqZoe+f
 j19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wWq6hnsaFLz+MOuTFr1IgBVv3W9pMuAAjIbbxnfc4s=;
 b=0bd/NRSVP6izuF/cvyN3C4tyC7y48f4AycUVzyy9T0orqgfgcQoZj3Vrnc3UD2PbcU
 fp2xYArGYFyCuaT2WDBG59nYfsa92HG8dDVdm7g5niKCUbovPOcccs2MusASQgMoXmDi
 yW6I4JWSKv/GFLccQBPoua//SYqypzrY7PY600DR40GiFtg4UCOp/x8CaJwqoUs9kVi8
 hLNMEMsYmgvCQtYvo9Zz611eJQg1HErDsJJ+vUYFlxyKWOeUE+gyorI3EIEz38kXxJT/
 OD/FN1ASwAdmU/gKnsUJkkEx/FCqDRjAh2C67aK5OMgPGohD20shAdK6sVuIVq5HBPLE
 ceYA==
X-Gm-Message-State: ACrzQf3t9utYIdO8EqKKXxtshhSeBpiNMM0ptOEW3vTSWbWoF4K0OBaE
 nvFFaz1qRvhbpKM98SfGZ5pJzFOH19eoGOgXia1WBA==
X-Google-Smtp-Source: AMsMyM6X1BcWs/ZtxnWACHfHpYewVixfQT31+LbSbl2r4JcDKqvwRmabFTV9vipaDVyjuRDQYcZeeg==
X-Received: by 2002:a05:600c:3b99:b0:3c6:8b8e:a624 with SMTP id
 n25-20020a05600c3b9900b003c68b8ea624mr2657350wms.113.1666110345594; 
 Tue, 18 Oct 2022 09:25:45 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.48])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b003b4de550e34sm14250012wmq.40.2022.10.18.09.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:25:45 -0700 (PDT)
From: Amarjargal Gundjalam <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	Amarjargal Gundjalam <amarjargal16@gmail.com>
Subject: [PATCH v2 4/4] hw/usb: fix tab indentation
Date: Wed, 19 Oct 2022 00:25:20 +0800
Message-Id: <8e769ec37cec1127fa5464713c6810737d4e8445.1666110191.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666110191.git.amarjargal16@gmail.com>
References: <cover.1666110191.git.amarjargal16@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=amarjargal16@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

The TABs should be replaced with spaces, to make sure that we have a
consistent coding style with an indentation of 4 spaces everywhere.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370

Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
---
 hw/usb/dev-hub.c           |   86 +-
 hw/usb/dev-network.c       |  286 +++----
 hw/usb/dev-wacom.c         |    4 +-
 hw/usb/hcd-musb.c          |  328 ++++----
 hw/usb/quirks-pl2303-ids.h |  180 ++--
 include/hw/usb.h           |  118 +--
 include/hw/usb/dwc2-regs.h | 1628 ++++++++++++++++++------------------
 7 files changed, 1315 insertions(+), 1315 deletions(-)

diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index e35813d772..2873c327b5 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -54,46 +54,46 @@ struct USBHubState {
 #define TYPE_USB_HUB "usb-hub"
 OBJECT_DECLARE_SIMPLE_TYPE(USBHubState, USB_HUB)
 
-#define ClearHubFeature		(0x2000 | USB_REQ_CLEAR_FEATURE)
-#define ClearPortFeature	(0x2300 | USB_REQ_CLEAR_FEATURE)
-#define GetHubDescriptor	(0xa000 | USB_REQ_GET_DESCRIPTOR)
-#define GetHubStatus		(0xa000 | USB_REQ_GET_STATUS)
-#define GetPortStatus		(0xa300 | USB_REQ_GET_STATUS)
-#define SetHubFeature		(0x2000 | USB_REQ_SET_FEATURE)
-#define SetPortFeature		(0x2300 | USB_REQ_SET_FEATURE)
-
-#define PORT_STAT_CONNECTION	0x0001
-#define PORT_STAT_ENABLE	0x0002
-#define PORT_STAT_SUSPEND	0x0004
-#define PORT_STAT_OVERCURRENT	0x0008
-#define PORT_STAT_RESET		0x0010
-#define PORT_STAT_POWER		0x0100
-#define PORT_STAT_LOW_SPEED	0x0200
+#define ClearHubFeature     (0x2000 | USB_REQ_CLEAR_FEATURE)
+#define ClearPortFeature    (0x2300 | USB_REQ_CLEAR_FEATURE)
+#define GetHubDescriptor    (0xa000 | USB_REQ_GET_DESCRIPTOR)
+#define GetHubStatus        (0xa000 | USB_REQ_GET_STATUS)
+#define GetPortStatus       (0xa300 | USB_REQ_GET_STATUS)
+#define SetHubFeature       (0x2000 | USB_REQ_SET_FEATURE)
+#define SetPortFeature      (0x2300 | USB_REQ_SET_FEATURE)
+
+#define PORT_STAT_CONNECTION    0x0001
+#define PORT_STAT_ENABLE        0x0002
+#define PORT_STAT_SUSPEND       0x0004
+#define PORT_STAT_OVERCURRENT   0x0008
+#define PORT_STAT_RESET         0x0010
+#define PORT_STAT_POWER         0x0100
+#define PORT_STAT_LOW_SPEED     0x0200
 #define PORT_STAT_HIGH_SPEED    0x0400
 #define PORT_STAT_TEST          0x0800
 #define PORT_STAT_INDICATOR     0x1000
 
-#define PORT_STAT_C_CONNECTION	0x0001
-#define PORT_STAT_C_ENABLE	0x0002
-#define PORT_STAT_C_SUSPEND	0x0004
-#define PORT_STAT_C_OVERCURRENT	0x0008
-#define PORT_STAT_C_RESET	0x0010
-
-#define PORT_CONNECTION	        0
-#define PORT_ENABLE		1
-#define PORT_SUSPEND		2
-#define PORT_OVERCURRENT	3
-#define PORT_RESET		4
-#define PORT_POWER		8
-#define PORT_LOWSPEED		9
-#define PORT_HIGHSPEED		10
-#define PORT_C_CONNECTION	16
-#define PORT_C_ENABLE		17
-#define PORT_C_SUSPEND		18
-#define PORT_C_OVERCURRENT	19
-#define PORT_C_RESET		20
-#define PORT_TEST               21
-#define PORT_INDICATOR          22
+#define PORT_STAT_C_CONNECTION    0x0001
+#define PORT_STAT_C_ENABLE        0x0002
+#define PORT_STAT_C_SUSPEND       0x0004
+#define PORT_STAT_C_OVERCURRENT   0x0008
+#define PORT_STAT_C_RESET         0x0010
+
+#define PORT_CONNECTION       0
+#define PORT_ENABLE           1
+#define PORT_SUSPEND          2
+#define PORT_OVERCURRENT      3
+#define PORT_RESET            4
+#define PORT_POWER            8
+#define PORT_LOWSPEED         9
+#define PORT_HIGHSPEED        10
+#define PORT_C_CONNECTION     16
+#define PORT_C_ENABLE         17
+#define PORT_C_SUSPEND        18
+#define PORT_C_OVERCURRENT    19
+#define PORT_C_RESET          20
+#define PORT_TEST             21
+#define PORT_INDICATOR        22
 
 /* same as Linux kernel root hubs */
 
@@ -155,13 +155,13 @@ static const USBDesc desc_hub = {
 
 static const uint8_t qemu_hub_hub_descriptor[] =
 {
-        0x00,			/*  u8  bLength; patched in later */
-        0x29,			/*  u8  bDescriptorType; Hub-descriptor */
-        0x00,			/*  u8  bNbrPorts; (patched later) */
-        0x0a,			/* u16  wHubCharacteristics; */
-        0x00,			/*   (per-port OC, no power switching) */
-        0x01,			/*  u8  bPwrOn2pwrGood; 2ms */
-        0x00			/*  u8  bHubContrCurrent; 0 mA */
+        0x00,            /*  u8  bLength; patched in later */
+        0x29,            /*  u8  bDescriptorType; Hub-descriptor */
+        0x00,            /*  u8  bNbrPorts; (patched later) */
+        0x0a,            /* u16  wHubCharacteristics; */
+        0x00,            /*   (per-port OC, no power switching) */
+        0x01,            /*  u8  bPwrOn2pwrGood; 2ms */
+        0x00            /*  u8  bHubContrCurrent; 0 mA */
 
         /* DeviceRemovable and PortPwrCtrlMask patched in later */
 };
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index ac1adca543..b449e402c7 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -52,7 +52,7 @@
 #define RNDIS_PRODUCT_NUM       0xa4a2  /* Ethernet/RNDIS Gadget */
 
 enum usbstring_idx {
-    STRING_MANUFACTURER		= 1,
+    STRING_MANUFACTURER        = 1,
     STRING_PRODUCT,
     STRING_ETHADDR,
     STRING_DATA,
@@ -64,39 +64,39 @@ enum usbstring_idx {
     STRING_SERIALNUMBER,
 };
 
-#define DEV_CONFIG_VALUE		1	/* CDC or a subset */
-#define DEV_RNDIS_CONFIG_VALUE		2	/* RNDIS; optional */
+#define DEV_CONFIG_VALUE                1    /* CDC or a subset */
+#define DEV_RNDIS_CONFIG_VALUE          2    /* RNDIS; optional */
 
-#define USB_CDC_SUBCLASS_ACM		0x02
-#define USB_CDC_SUBCLASS_ETHERNET	0x06
+#define USB_CDC_SUBCLASS_ACM            0x02
+#define USB_CDC_SUBCLASS_ETHERNET       0x06
 
-#define USB_CDC_PROTO_NONE		0
-#define USB_CDC_ACM_PROTO_VENDOR	0xff
+#define USB_CDC_PROTO_NONE              0
+#define USB_CDC_ACM_PROTO_VENDOR        0xff
 
-#define USB_CDC_HEADER_TYPE		0x00	/* header_desc */
-#define USB_CDC_CALL_MANAGEMENT_TYPE	0x01	/* call_mgmt_descriptor */
-#define USB_CDC_ACM_TYPE		0x02	/* acm_descriptor */
-#define USB_CDC_UNION_TYPE		0x06	/* union_desc */
-#define USB_CDC_ETHERNET_TYPE		0x0f	/* ether_desc */
+#define USB_CDC_HEADER_TYPE             0x00    /* header_desc */
+#define USB_CDC_CALL_MANAGEMENT_TYPE    0x01    /* call_mgmt_descriptor */
+#define USB_CDC_ACM_TYPE                0x02    /* acm_descriptor */
+#define USB_CDC_UNION_TYPE              0x06    /* union_desc */
+#define USB_CDC_ETHERNET_TYPE           0x0f    /* ether_desc */
 
-#define USB_CDC_SEND_ENCAPSULATED_COMMAND	0x00
-#define USB_CDC_GET_ENCAPSULATED_RESPONSE	0x01
-#define USB_CDC_REQ_SET_LINE_CODING		0x20
-#define USB_CDC_REQ_GET_LINE_CODING		0x21
-#define USB_CDC_REQ_SET_CONTROL_LINE_STATE	0x22
-#define USB_CDC_REQ_SEND_BREAK			0x23
-#define USB_CDC_SET_ETHERNET_MULTICAST_FILTERS	0x40
-#define USB_CDC_SET_ETHERNET_PM_PATTERN_FILTER	0x41
-#define USB_CDC_GET_ETHERNET_PM_PATTERN_FILTER	0x42
-#define USB_CDC_SET_ETHERNET_PACKET_FILTER	0x43
-#define USB_CDC_GET_ETHERNET_STATISTIC		0x44
+#define USB_CDC_SEND_ENCAPSULATED_COMMAND         0x00
+#define USB_CDC_GET_ENCAPSULATED_RESPONSE         0x01
+#define USB_CDC_REQ_SET_LINE_CODING               0x20
+#define USB_CDC_REQ_GET_LINE_CODING               0x21
+#define USB_CDC_REQ_SET_CONTROL_LINE_STATE        0x22
+#define USB_CDC_REQ_SEND_BREAK                    0x23
+#define USB_CDC_SET_ETHERNET_MULTICAST_FILTERS    0x40
+#define USB_CDC_SET_ETHERNET_PM_PATTERN_FILTER    0x41
+#define USB_CDC_GET_ETHERNET_PM_PATTERN_FILTER    0x42
+#define USB_CDC_SET_ETHERNET_PACKET_FILTER        0x43
+#define USB_CDC_GET_ETHERNET_STATISTIC            0x44
 
-#define USB_CDC_NETWORK_CONNECTION	0x00
+#define USB_CDC_NETWORK_CONNECTION    0x00
 
-#define LOG2_STATUS_INTERVAL_MSEC	5    /* 1 << 5 == 32 msec */
-#define STATUS_BYTECOUNT		16   /* 8 byte header + data */
+#define LOG2_STATUS_INTERVAL_MSEC   5    /* 1 << 5 == 32 msec */
+#define STATUS_BYTECOUNT            16   /* 8 byte header + data */
 
-#define ETH_FRAME_LEN			1514 /* Max. octets in frame sans FCS */
+#define ETH_FRAME_LEN               1514 /* Max. octets in frame sans FCS */
 
 static const USBDescStrings usb_net_stringtable = {
     [STRING_MANUFACTURER]       = "QEMU",
@@ -306,57 +306,57 @@ static const USBDesc desc_net = {
 /*
  * RNDIS Definitions - in theory not specific to USB.
  */
-#define RNDIS_MAXIMUM_FRAME_SIZE	1518
-#define RNDIS_MAX_TOTAL_SIZE		1558
+#define RNDIS_MAXIMUM_FRAME_SIZE    1518
+#define RNDIS_MAX_TOTAL_SIZE        1558
 
 /* Remote NDIS Versions */
-#define RNDIS_MAJOR_VERSION		1
-#define RNDIS_MINOR_VERSION		0
+#define RNDIS_MAJOR_VERSION        1
+#define RNDIS_MINOR_VERSION        0
 
 /* Status Values */
-#define RNDIS_STATUS_SUCCESS		0x00000000U /* Success */
-#define RNDIS_STATUS_FAILURE		0xc0000001U /* Unspecified error */
-#define RNDIS_STATUS_INVALID_DATA	0xc0010015U /* Invalid data */
-#define RNDIS_STATUS_NOT_SUPPORTED	0xc00000bbU /* Unsupported request */
-#define RNDIS_STATUS_MEDIA_CONNECT	0x4001000bU /* Device connected */
-#define RNDIS_STATUS_MEDIA_DISCONNECT	0x4001000cU /* Device disconnected */
+#define RNDIS_STATUS_SUCCESS        0x00000000U /* Success */
+#define RNDIS_STATUS_FAILURE        0xc0000001U /* Unspecified error */
+#define RNDIS_STATUS_INVALID_DATA    0xc0010015U /* Invalid data */
+#define RNDIS_STATUS_NOT_SUPPORTED    0xc00000bbU /* Unsupported request */
+#define RNDIS_STATUS_MEDIA_CONNECT    0x4001000bU /* Device connected */
+#define RNDIS_STATUS_MEDIA_DISCONNECT    0x4001000cU /* Device disconnected */
 
 /* Message Set for Connectionless (802.3) Devices */
 enum {
-    RNDIS_PACKET_MSG		= 1,
-    RNDIS_INITIALIZE_MSG	= 2,	/* Initialize device */
-    RNDIS_HALT_MSG		= 3,
-    RNDIS_QUERY_MSG		= 4,
-    RNDIS_SET_MSG		= 5,
-    RNDIS_RESET_MSG		= 6,
-    RNDIS_INDICATE_STATUS_MSG	= 7,
-    RNDIS_KEEPALIVE_MSG		= 8,
+    RNDIS_PACKET_MSG        = 1,
+    RNDIS_INITIALIZE_MSG    = 2,    /* Initialize device */
+    RNDIS_HALT_MSG        = 3,
+    RNDIS_QUERY_MSG        = 4,
+    RNDIS_SET_MSG        = 5,
+    RNDIS_RESET_MSG        = 6,
+    RNDIS_INDICATE_STATUS_MSG    = 7,
+    RNDIS_KEEPALIVE_MSG        = 8,
 };
 
 /* Message completion */
 enum {
-    RNDIS_INITIALIZE_CMPLT	= 0x80000002U,
-    RNDIS_QUERY_CMPLT		= 0x80000004U,
-    RNDIS_SET_CMPLT		= 0x80000005U,
-    RNDIS_RESET_CMPLT		= 0x80000006U,
-    RNDIS_KEEPALIVE_CMPLT	= 0x80000008U,
+    RNDIS_INITIALIZE_CMPLT    = 0x80000002U,
+    RNDIS_QUERY_CMPLT        = 0x80000004U,
+    RNDIS_SET_CMPLT        = 0x80000005U,
+    RNDIS_RESET_CMPLT        = 0x80000006U,
+    RNDIS_KEEPALIVE_CMPLT    = 0x80000008U,
 };
 
 /* Device Flags */
 enum {
-    RNDIS_DF_CONNECTIONLESS	= 1,
-    RNDIS_DF_CONNECTIONORIENTED	= 2,
+    RNDIS_DF_CONNECTIONLESS    = 1,
+    RNDIS_DF_CONNECTIONORIENTED    = 2,
 };
 
-#define RNDIS_MEDIUM_802_3		0x00000000U
+#define RNDIS_MEDIUM_802_3        0x00000000U
 
 /* from drivers/net/sk98lin/h/skgepnmi.h */
-#define OID_PNP_CAPABILITIES		0xfd010100
-#define OID_PNP_SET_POWER		0xfd010101
-#define OID_PNP_QUERY_POWER		0xfd010102
-#define OID_PNP_ADD_WAKE_UP_PATTERN	0xfd010103
-#define OID_PNP_REMOVE_WAKE_UP_PATTERN	0xfd010104
-#define OID_PNP_ENABLE_WAKE_UP		0xfd010106
+#define OID_PNP_CAPABILITIES        0xfd010100
+#define OID_PNP_SET_POWER        0xfd010101
+#define OID_PNP_QUERY_POWER        0xfd010102
+#define OID_PNP_ADD_WAKE_UP_PATTERN    0xfd010103
+#define OID_PNP_REMOVE_WAKE_UP_PATTERN    0xfd010104
+#define OID_PNP_ENABLE_WAKE_UP        0xfd010106
 
 typedef uint32_t le32;
 
@@ -494,88 +494,88 @@ enum rndis_state
 /* from ndis.h */
 enum ndis_oid {
     /* Required Object IDs (OIDs) */
-    OID_GEN_SUPPORTED_LIST		= 0x00010101,
-    OID_GEN_HARDWARE_STATUS		= 0x00010102,
-    OID_GEN_MEDIA_SUPPORTED		= 0x00010103,
-    OID_GEN_MEDIA_IN_USE		= 0x00010104,
-    OID_GEN_MAXIMUM_LOOKAHEAD		= 0x00010105,
-    OID_GEN_MAXIMUM_FRAME_SIZE		= 0x00010106,
-    OID_GEN_LINK_SPEED			= 0x00010107,
-    OID_GEN_TRANSMIT_BUFFER_SPACE	= 0x00010108,
-    OID_GEN_RECEIVE_BUFFER_SPACE	= 0x00010109,
-    OID_GEN_TRANSMIT_BLOCK_SIZE		= 0x0001010a,
-    OID_GEN_RECEIVE_BLOCK_SIZE		= 0x0001010b,
-    OID_GEN_VENDOR_ID			= 0x0001010c,
-    OID_GEN_VENDOR_DESCRIPTION		= 0x0001010d,
-    OID_GEN_CURRENT_PACKET_FILTER	= 0x0001010e,
-    OID_GEN_CURRENT_LOOKAHEAD		= 0x0001010f,
-    OID_GEN_DRIVER_VERSION		= 0x00010110,
-    OID_GEN_MAXIMUM_TOTAL_SIZE		= 0x00010111,
-    OID_GEN_PROTOCOL_OPTIONS		= 0x00010112,
-    OID_GEN_MAC_OPTIONS			= 0x00010113,
-    OID_GEN_MEDIA_CONNECT_STATUS	= 0x00010114,
-    OID_GEN_MAXIMUM_SEND_PACKETS	= 0x00010115,
-    OID_GEN_VENDOR_DRIVER_VERSION	= 0x00010116,
-    OID_GEN_SUPPORTED_GUIDS		= 0x00010117,
-    OID_GEN_NETWORK_LAYER_ADDRESSES	= 0x00010118,
-    OID_GEN_TRANSPORT_HEADER_OFFSET	= 0x00010119,
-    OID_GEN_MACHINE_NAME		= 0x0001021a,
-    OID_GEN_RNDIS_CONFIG_PARAMETER	= 0x0001021b,
-    OID_GEN_VLAN_ID			= 0x0001021c,
+    OID_GEN_SUPPORTED_LIST        = 0x00010101,
+    OID_GEN_HARDWARE_STATUS        = 0x00010102,
+    OID_GEN_MEDIA_SUPPORTED        = 0x00010103,
+    OID_GEN_MEDIA_IN_USE        = 0x00010104,
+    OID_GEN_MAXIMUM_LOOKAHEAD        = 0x00010105,
+    OID_GEN_MAXIMUM_FRAME_SIZE        = 0x00010106,
+    OID_GEN_LINK_SPEED            = 0x00010107,
+    OID_GEN_TRANSMIT_BUFFER_SPACE    = 0x00010108,
+    OID_GEN_RECEIVE_BUFFER_SPACE    = 0x00010109,
+    OID_GEN_TRANSMIT_BLOCK_SIZE        = 0x0001010a,
+    OID_GEN_RECEIVE_BLOCK_SIZE        = 0x0001010b,
+    OID_GEN_VENDOR_ID            = 0x0001010c,
+    OID_GEN_VENDOR_DESCRIPTION        = 0x0001010d,
+    OID_GEN_CURRENT_PACKET_FILTER    = 0x0001010e,
+    OID_GEN_CURRENT_LOOKAHEAD        = 0x0001010f,
+    OID_GEN_DRIVER_VERSION        = 0x00010110,
+    OID_GEN_MAXIMUM_TOTAL_SIZE        = 0x00010111,
+    OID_GEN_PROTOCOL_OPTIONS        = 0x00010112,
+    OID_GEN_MAC_OPTIONS            = 0x00010113,
+    OID_GEN_MEDIA_CONNECT_STATUS    = 0x00010114,
+    OID_GEN_MAXIMUM_SEND_PACKETS    = 0x00010115,
+    OID_GEN_VENDOR_DRIVER_VERSION    = 0x00010116,
+    OID_GEN_SUPPORTED_GUIDS        = 0x00010117,
+    OID_GEN_NETWORK_LAYER_ADDRESSES    = 0x00010118,
+    OID_GEN_TRANSPORT_HEADER_OFFSET    = 0x00010119,
+    OID_GEN_MACHINE_NAME        = 0x0001021a,
+    OID_GEN_RNDIS_CONFIG_PARAMETER    = 0x0001021b,
+    OID_GEN_VLAN_ID            = 0x0001021c,
 
     /* Optional OIDs */
-    OID_GEN_MEDIA_CAPABILITIES		= 0x00010201,
-    OID_GEN_PHYSICAL_MEDIUM		= 0x00010202,
+    OID_GEN_MEDIA_CAPABILITIES        = 0x00010201,
+    OID_GEN_PHYSICAL_MEDIUM        = 0x00010202,
 
     /* Required statistics OIDs */
-    OID_GEN_XMIT_OK			= 0x00020101,
-    OID_GEN_RCV_OK			= 0x00020102,
-    OID_GEN_XMIT_ERROR			= 0x00020103,
-    OID_GEN_RCV_ERROR			= 0x00020104,
-    OID_GEN_RCV_NO_BUFFER		= 0x00020105,
+    OID_GEN_XMIT_OK            = 0x00020101,
+    OID_GEN_RCV_OK            = 0x00020102,
+    OID_GEN_XMIT_ERROR            = 0x00020103,
+    OID_GEN_RCV_ERROR            = 0x00020104,
+    OID_GEN_RCV_NO_BUFFER        = 0x00020105,
 
     /* Optional statistics OIDs */
-    OID_GEN_DIRECTED_BYTES_XMIT		= 0x00020201,
-    OID_GEN_DIRECTED_FRAMES_XMIT	= 0x00020202,
-    OID_GEN_MULTICAST_BYTES_XMIT	= 0x00020203,
-    OID_GEN_MULTICAST_FRAMES_XMIT	= 0x00020204,
-    OID_GEN_BROADCAST_BYTES_XMIT	= 0x00020205,
-    OID_GEN_BROADCAST_FRAMES_XMIT	= 0x00020206,
-    OID_GEN_DIRECTED_BYTES_RCV		= 0x00020207,
-    OID_GEN_DIRECTED_FRAMES_RCV		= 0x00020208,
-    OID_GEN_MULTICAST_BYTES_RCV		= 0x00020209,
-    OID_GEN_MULTICAST_FRAMES_RCV	= 0x0002020a,
-    OID_GEN_BROADCAST_BYTES_RCV		= 0x0002020b,
-    OID_GEN_BROADCAST_FRAMES_RCV	= 0x0002020c,
-    OID_GEN_RCV_CRC_ERROR		= 0x0002020d,
-    OID_GEN_TRANSMIT_QUEUE_LENGTH	= 0x0002020e,
-    OID_GEN_GET_TIME_CAPS		= 0x0002020f,
-    OID_GEN_GET_NETCARD_TIME		= 0x00020210,
-    OID_GEN_NETCARD_LOAD		= 0x00020211,
-    OID_GEN_DEVICE_PROFILE		= 0x00020212,
-    OID_GEN_INIT_TIME_MS		= 0x00020213,
-    OID_GEN_RESET_COUNTS		= 0x00020214,
-    OID_GEN_MEDIA_SENSE_COUNTS		= 0x00020215,
-    OID_GEN_FRIENDLY_NAME		= 0x00020216,
-    OID_GEN_MINIPORT_INFO		= 0x00020217,
-    OID_GEN_RESET_VERIFY_PARAMETERS	= 0x00020218,
+    OID_GEN_DIRECTED_BYTES_XMIT        = 0x00020201,
+    OID_GEN_DIRECTED_FRAMES_XMIT    = 0x00020202,
+    OID_GEN_MULTICAST_BYTES_XMIT    = 0x00020203,
+    OID_GEN_MULTICAST_FRAMES_XMIT    = 0x00020204,
+    OID_GEN_BROADCAST_BYTES_XMIT    = 0x00020205,
+    OID_GEN_BROADCAST_FRAMES_XMIT    = 0x00020206,
+    OID_GEN_DIRECTED_BYTES_RCV        = 0x00020207,
+    OID_GEN_DIRECTED_FRAMES_RCV        = 0x00020208,
+    OID_GEN_MULTICAST_BYTES_RCV        = 0x00020209,
+    OID_GEN_MULTICAST_FRAMES_RCV    = 0x0002020a,
+    OID_GEN_BROADCAST_BYTES_RCV        = 0x0002020b,
+    OID_GEN_BROADCAST_FRAMES_RCV    = 0x0002020c,
+    OID_GEN_RCV_CRC_ERROR        = 0x0002020d,
+    OID_GEN_TRANSMIT_QUEUE_LENGTH    = 0x0002020e,
+    OID_GEN_GET_TIME_CAPS        = 0x0002020f,
+    OID_GEN_GET_NETCARD_TIME        = 0x00020210,
+    OID_GEN_NETCARD_LOAD        = 0x00020211,
+    OID_GEN_DEVICE_PROFILE        = 0x00020212,
+    OID_GEN_INIT_TIME_MS        = 0x00020213,
+    OID_GEN_RESET_COUNTS        = 0x00020214,
+    OID_GEN_MEDIA_SENSE_COUNTS        = 0x00020215,
+    OID_GEN_FRIENDLY_NAME        = 0x00020216,
+    OID_GEN_MINIPORT_INFO        = 0x00020217,
+    OID_GEN_RESET_VERIFY_PARAMETERS    = 0x00020218,
 
     /* IEEE 802.3 (Ethernet) OIDs */
-    OID_802_3_PERMANENT_ADDRESS		= 0x01010101,
-    OID_802_3_CURRENT_ADDRESS		= 0x01010102,
-    OID_802_3_MULTICAST_LIST		= 0x01010103,
-    OID_802_3_MAXIMUM_LIST_SIZE		= 0x01010104,
-    OID_802_3_MAC_OPTIONS		= 0x01010105,
-    OID_802_3_RCV_ERROR_ALIGNMENT	= 0x01020101,
-    OID_802_3_XMIT_ONE_COLLISION	= 0x01020102,
-    OID_802_3_XMIT_MORE_COLLISIONS	= 0x01020103,
-    OID_802_3_XMIT_DEFERRED		= 0x01020201,
-    OID_802_3_XMIT_MAX_COLLISIONS	= 0x01020202,
-    OID_802_3_RCV_OVERRUN		= 0x01020203,
-    OID_802_3_XMIT_UNDERRUN		= 0x01020204,
-    OID_802_3_XMIT_HEARTBEAT_FAILURE	= 0x01020205,
-    OID_802_3_XMIT_TIMES_CRS_LOST	= 0x01020206,
-    OID_802_3_XMIT_LATE_COLLISIONS	= 0x01020207,
+    OID_802_3_PERMANENT_ADDRESS        = 0x01010101,
+    OID_802_3_CURRENT_ADDRESS        = 0x01010102,
+    OID_802_3_MULTICAST_LIST        = 0x01010103,
+    OID_802_3_MAXIMUM_LIST_SIZE        = 0x01010104,
+    OID_802_3_MAC_OPTIONS        = 0x01010105,
+    OID_802_3_RCV_ERROR_ALIGNMENT    = 0x01020101,
+    OID_802_3_XMIT_ONE_COLLISION    = 0x01020102,
+    OID_802_3_XMIT_MORE_COLLISIONS    = 0x01020103,
+    OID_802_3_XMIT_DEFERRED        = 0x01020201,
+    OID_802_3_XMIT_MAX_COLLISIONS    = 0x01020202,
+    OID_802_3_RCV_OVERRUN        = 0x01020203,
+    OID_802_3_XMIT_UNDERRUN        = 0x01020204,
+    OID_802_3_XMIT_HEARTBEAT_FAILURE    = 0x01020205,
+    OID_802_3_XMIT_TIMES_CRS_LOST    = 0x01020206,
+    OID_802_3_XMIT_LATE_COLLISIONS    = 0x01020207,
 };
 
 static const uint32_t oid_supported_list[] =
@@ -618,13 +618,13 @@ static const uint32_t oid_supported_list[] =
     OID_802_3_XMIT_MORE_COLLISIONS,
 };
 
-#define NDIS_MAC_OPTION_COPY_LOOKAHEAD_DATA	(1 << 0)
-#define NDIS_MAC_OPTION_RECEIVE_SERIALIZED	(1 << 1)
-#define NDIS_MAC_OPTION_TRANSFERS_NOT_PEND	(1 << 2)
-#define NDIS_MAC_OPTION_NO_LOOPBACK		(1 << 3)
-#define NDIS_MAC_OPTION_FULL_DUPLEX		(1 << 4)
-#define NDIS_MAC_OPTION_EOTX_INDICATION		(1 << 5)
-#define NDIS_MAC_OPTION_8021P_PRIORITY		(1 << 6)
+#define NDIS_MAC_OPTION_COPY_LOOKAHEAD_DATA    (1 << 0)
+#define NDIS_MAC_OPTION_RECEIVE_SERIALIZED    (1 << 1)
+#define NDIS_MAC_OPTION_TRANSFERS_NOT_PEND    (1 << 2)
+#define NDIS_MAC_OPTION_NO_LOOPBACK        (1 << 3)
+#define NDIS_MAC_OPTION_FULL_DUPLEX        (1 << 4)
+#define NDIS_MAC_OPTION_EOTX_INDICATION        (1 << 5)
+#define NDIS_MAC_OPTION_8021P_PRIORITY        (1 << 6)
 
 struct rndis_response {
     QTAILQ_ENTRY(rndis_response) entries;
@@ -1375,12 +1375,12 @@ static void usb_net_realize(USBDevice *dev, Error **errp)
     s->rndis_state = RNDIS_UNINITIALIZED;
     QTAILQ_INIT(&s->rndis_resp);
 
-    s->medium = 0;	/* NDIS_MEDIUM_802_3 */
+    s->medium = 0;    /* NDIS_MEDIUM_802_3 */
     s->speed = 1000000; /* 100MBps, in 100Bps units */
-    s->media_state = 0;	/* NDIS_MEDIA_STATE_CONNECTED */;
+    s->media_state = 0;    /* NDIS_MEDIA_STATE_CONNECTED */;
     s->filter = 0;
     s->vendorid = 0x1234;
-    s->connection = 1;	/* Connected */
+    s->connection = 1;    /* Connected */
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
     s->bulk_in = usb_ep_get(dev, USB_TOKEN_IN, 2);
 
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 8323650c6a..7177c17f03 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -36,8 +36,8 @@
 #include "qom/object.h"
 
 /* Interface requests */
-#define WACOM_GET_REPORT	0x2101
-#define WACOM_SET_REPORT	0x2109
+#define WACOM_GET_REPORT    0x2101
+#define WACOM_SET_REPORT    0x2109
 
 struct USBWacomState {
     USBDevice dev;
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 85f5ff5bd4..be76e98fad 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -28,227 +28,227 @@
 #include "hw/hw.h"
 
 /* Common USB registers */
-#define MUSB_HDRC_FADDR		0x00	/* 8-bit */
-#define MUSB_HDRC_POWER		0x01	/* 8-bit */
-
-#define MUSB_HDRC_INTRTX	0x02	/* 16-bit */
-#define MUSB_HDRC_INTRRX	0x04
-#define MUSB_HDRC_INTRTXE	0x06  
-#define MUSB_HDRC_INTRRXE	0x08  
-#define MUSB_HDRC_INTRUSB	0x0a	/* 8 bit */
-#define MUSB_HDRC_INTRUSBE	0x0b	/* 8 bit */
-#define MUSB_HDRC_FRAME		0x0c	/* 16-bit */
-#define MUSB_HDRC_INDEX		0x0e	/* 8 bit */
-#define MUSB_HDRC_TESTMODE	0x0f	/* 8 bit */
+#define MUSB_HDRC_FADDR         0x00    /* 8-bit */
+#define MUSB_HDRC_POWER         0x01    /* 8-bit */
+
+#define MUSB_HDRC_INTRTX        0x02    /* 16-bit */
+#define MUSB_HDRC_INTRRX        0x04
+#define MUSB_HDRC_INTRTXE       0x06
+#define MUSB_HDRC_INTRRXE       0x08
+#define MUSB_HDRC_INTRUSB       0x0a    /* 8 bit */
+#define MUSB_HDRC_INTRUSBE      0x0b    /* 8 bit */
+#define MUSB_HDRC_FRAME         0x0c    /* 16-bit */
+#define MUSB_HDRC_INDEX         0x0e    /* 8 bit */
+#define MUSB_HDRC_TESTMODE      0x0f    /* 8 bit */
 
 /* Per-EP registers in indexed mode */
-#define MUSB_HDRC_EP_IDX	0x10	/* 8-bit */
+#define MUSB_HDRC_EP_IDX        0x10    /* 8-bit */
 
 /* EP FIFOs */
-#define MUSB_HDRC_FIFO		0x20
+#define MUSB_HDRC_FIFO          0x20
 
 /* Additional Control Registers */
-#define	MUSB_HDRC_DEVCTL	0x60	/* 8 bit */
+#define    MUSB_HDRC_DEVCTL     0x60    /* 8 bit */
 
 /* These are indexed */
-#define MUSB_HDRC_TXFIFOSZ	0x62	/* 8 bit (see masks) */
-#define MUSB_HDRC_RXFIFOSZ	0x63	/* 8 bit (see masks) */
-#define MUSB_HDRC_TXFIFOADDR	0x64	/* 16 bit offset shifted right 3 */
-#define MUSB_HDRC_RXFIFOADDR	0x66	/* 16 bit offset shifted right 3 */
+#define MUSB_HDRC_TXFIFOSZ      0x62    /* 8 bit (see masks) */
+#define MUSB_HDRC_RXFIFOSZ      0x63    /* 8 bit (see masks) */
+#define MUSB_HDRC_TXFIFOADDR    0x64    /* 16 bit offset shifted right 3 */
+#define MUSB_HDRC_RXFIFOADDR    0x66    /* 16 bit offset shifted right 3 */
 
 /* Some more registers */
-#define MUSB_HDRC_VCTRL		0x68	/* 8 bit */
-#define MUSB_HDRC_HWVERS	0x6c	/* 8 bit */
+#define MUSB_HDRC_VCTRL         0x68    /* 8 bit */
+#define MUSB_HDRC_HWVERS        0x6c    /* 8 bit */
 
 /* Added in HDRC 1.9(?) & MHDRC 1.4 */
 /* ULPI pass-through */
-#define MUSB_HDRC_ULPI_VBUSCTL	0x70
-#define MUSB_HDRC_ULPI_REGDATA	0x74
-#define MUSB_HDRC_ULPI_REGADDR	0x75
-#define MUSB_HDRC_ULPI_REGCTL	0x76
+#define MUSB_HDRC_ULPI_VBUSCTL    0x70
+#define MUSB_HDRC_ULPI_REGDATA    0x74
+#define MUSB_HDRC_ULPI_REGADDR    0x75
+#define MUSB_HDRC_ULPI_REGCTL     0x76
 
 /* Extended config & PHY control */
-#define MUSB_HDRC_ENDCOUNT	0x78	/* 8 bit */
-#define MUSB_HDRC_DMARAMCFG	0x79	/* 8 bit */
-#define MUSB_HDRC_PHYWAIT	0x7a	/* 8 bit */
-#define MUSB_HDRC_PHYVPLEN	0x7b	/* 8 bit */
-#define MUSB_HDRC_HS_EOF1	0x7c	/* 8 bit, units of 546.1 us */
-#define MUSB_HDRC_FS_EOF1	0x7d	/* 8 bit, units of 533.3 ns */
-#define MUSB_HDRC_LS_EOF1	0x7e	/* 8 bit, units of 1.067 us */
+#define MUSB_HDRC_ENDCOUNT      0x78    /* 8 bit */
+#define MUSB_HDRC_DMARAMCFG     0x79    /* 8 bit */
+#define MUSB_HDRC_PHYWAIT       0x7a    /* 8 bit */
+#define MUSB_HDRC_PHYVPLEN      0x7b    /* 8 bit */
+#define MUSB_HDRC_HS_EOF1       0x7c    /* 8 bit, units of 546.1 us */
+#define MUSB_HDRC_FS_EOF1       0x7d    /* 8 bit, units of 533.3 ns */
+#define MUSB_HDRC_LS_EOF1       0x7e    /* 8 bit, units of 1.067 us */
 
 /* Per-EP BUSCTL registers */
-#define MUSB_HDRC_BUSCTL	0x80
+#define MUSB_HDRC_BUSCTL    0x80
 
 /* Per-EP registers in flat mode */
-#define MUSB_HDRC_EP		0x100
+#define MUSB_HDRC_EP        0x100
 
 /* offsets to registers in flat model */
-#define MUSB_HDRC_TXMAXP	0x00	/* 16 bit apparently */
-#define MUSB_HDRC_TXCSR		0x02	/* 16 bit apparently */
-#define MUSB_HDRC_CSR0		MUSB_HDRC_TXCSR		/* re-used for EP0 */
-#define MUSB_HDRC_RXMAXP	0x04	/* 16 bit apparently */
-#define MUSB_HDRC_RXCSR		0x06	/* 16 bit apparently */
-#define MUSB_HDRC_RXCOUNT	0x08	/* 16 bit apparently */
-#define MUSB_HDRC_COUNT0	MUSB_HDRC_RXCOUNT	/* re-used for EP0 */
-#define MUSB_HDRC_TXTYPE	0x0a	/* 8 bit apparently */
-#define MUSB_HDRC_TYPE0		MUSB_HDRC_TXTYPE	/* re-used for EP0 */
-#define MUSB_HDRC_TXINTERVAL	0x0b	/* 8 bit apparently */
-#define MUSB_HDRC_NAKLIMIT0	MUSB_HDRC_TXINTERVAL	/* re-used for EP0 */
-#define MUSB_HDRC_RXTYPE	0x0c	/* 8 bit apparently */
-#define MUSB_HDRC_RXINTERVAL	0x0d	/* 8 bit apparently */
-#define MUSB_HDRC_FIFOSIZE	0x0f	/* 8 bit apparently */
-#define MUSB_HDRC_CONFIGDATA	MGC_O_HDRC_FIFOSIZE	/* re-used for EP0 */
+#define MUSB_HDRC_TXMAXP        0x00    /* 16 bit apparently */
+#define MUSB_HDRC_TXCSR         0x02    /* 16 bit apparently */
+#define MUSB_HDRC_CSR0          MUSB_HDRC_TXCSR        /* re-used for EP0 */
+#define MUSB_HDRC_RXMAXP        0x04    /* 16 bit apparently */
+#define MUSB_HDRC_RXCSR         0x06    /* 16 bit apparently */
+#define MUSB_HDRC_RXCOUNT       0x08    /* 16 bit apparently */
+#define MUSB_HDRC_COUNT0        MUSB_HDRC_RXCOUNT    /* re-used for EP0 */
+#define MUSB_HDRC_TXTYPE        0x0a    /* 8 bit apparently */
+#define MUSB_HDRC_TYPE0         MUSB_HDRC_TXTYPE    /* re-used for EP0 */
+#define MUSB_HDRC_TXINTERVAL    0x0b    /* 8 bit apparently */
+#define MUSB_HDRC_NAKLIMIT0     MUSB_HDRC_TXINTERVAL    /* re-used for EP0 */
+#define MUSB_HDRC_RXTYPE        0x0c    /* 8 bit apparently */
+#define MUSB_HDRC_RXINTERVAL    0x0d    /* 8 bit apparently */
+#define MUSB_HDRC_FIFOSIZE      0x0f    /* 8 bit apparently */
+#define MUSB_HDRC_CONFIGDATA    MGC_O_HDRC_FIFOSIZE    /* re-used for EP0 */
 
 /* "Bus control" registers */
-#define MUSB_HDRC_TXFUNCADDR	0x00
-#define MUSB_HDRC_TXHUBADDR	0x02
-#define MUSB_HDRC_TXHUBPORT	0x03
+#define MUSB_HDRC_TXFUNCADDR    0x00
+#define MUSB_HDRC_TXHUBADDR     0x02
+#define MUSB_HDRC_TXHUBPORT     0x03
 
-#define MUSB_HDRC_RXFUNCADDR	0x04
-#define MUSB_HDRC_RXHUBADDR	0x06
-#define MUSB_HDRC_RXHUBPORT	0x07
+#define MUSB_HDRC_RXFUNCADDR    0x04
+#define MUSB_HDRC_RXHUBADDR     0x06
+#define MUSB_HDRC_RXHUBPORT     0x07
 
 /*
  * MUSBHDRC Register bit masks
  */
 
 /* POWER */
-#define MGC_M_POWER_ISOUPDATE		0x80 
-#define	MGC_M_POWER_SOFTCONN		0x40
-#define	MGC_M_POWER_HSENAB		0x20
-#define	MGC_M_POWER_HSMODE		0x10
-#define MGC_M_POWER_RESET		0x08
-#define MGC_M_POWER_RESUME		0x04
-#define MGC_M_POWER_SUSPENDM		0x02
-#define MGC_M_POWER_ENSUSPEND		0x01
+#define MGC_M_POWER_ISOUPDATE         0x80
+#define MGC_M_POWER_SOFTCONN          0x40
+#define MGC_M_POWER_HSENAB            0x20
+#define MGC_M_POWER_HSMODE            0x10
+#define MGC_M_POWER_RESET             0x08
+#define MGC_M_POWER_RESUME            0x04
+#define MGC_M_POWER_SUSPENDM          0x02
+#define MGC_M_POWER_ENSUSPEND         0x01
 
 /* INTRUSB */
-#define MGC_M_INTR_SUSPEND		0x01
-#define MGC_M_INTR_RESUME		0x02
-#define MGC_M_INTR_RESET		0x04
-#define MGC_M_INTR_BABBLE		0x04
-#define MGC_M_INTR_SOF			0x08 
-#define MGC_M_INTR_CONNECT		0x10
-#define MGC_M_INTR_DISCONNECT		0x20
-#define MGC_M_INTR_SESSREQ		0x40
-#define MGC_M_INTR_VBUSERROR		0x80	/* FOR SESSION END */
-#define MGC_M_INTR_EP0			0x01	/* FOR EP0 INTERRUPT */
+#define MGC_M_INTR_SUSPEND            0x01
+#define MGC_M_INTR_RESUME             0x02
+#define MGC_M_INTR_RESET              0x04
+#define MGC_M_INTR_BABBLE             0x04
+#define MGC_M_INTR_SOF                0x08
+#define MGC_M_INTR_CONNECT            0x10
+#define MGC_M_INTR_DISCONNECT         0x20
+#define MGC_M_INTR_SESSREQ            0x40
+#define MGC_M_INTR_VBUSERROR          0x80    /* FOR SESSION END */
+#define MGC_M_INTR_EP0                0x01    /* FOR EP0 INTERRUPT */
 
 /* DEVCTL */
-#define MGC_M_DEVCTL_BDEVICE		0x80   
-#define MGC_M_DEVCTL_FSDEV		0x40
-#define MGC_M_DEVCTL_LSDEV		0x20
-#define MGC_M_DEVCTL_VBUS		0x18
-#define MGC_S_DEVCTL_VBUS		3
-#define MGC_M_DEVCTL_HM			0x04
-#define MGC_M_DEVCTL_HR			0x02
-#define MGC_M_DEVCTL_SESSION		0x01
+#define MGC_M_DEVCTL_BDEVICE          0x80
+#define MGC_M_DEVCTL_FSDEV            0x40
+#define MGC_M_DEVCTL_LSDEV            0x20
+#define MGC_M_DEVCTL_VBUS             0x18
+#define MGC_S_DEVCTL_VBUS             3
+#define MGC_M_DEVCTL_HM               0x04
+#define MGC_M_DEVCTL_HR               0x02
+#define MGC_M_DEVCTL_SESSION          0x01
 
 /* TESTMODE */
-#define MGC_M_TEST_FORCE_HOST		0x80
-#define MGC_M_TEST_FIFO_ACCESS		0x40
-#define MGC_M_TEST_FORCE_FS		0x20
-#define MGC_M_TEST_FORCE_HS		0x10
-#define MGC_M_TEST_PACKET		0x08
-#define MGC_M_TEST_K			0x04
-#define MGC_M_TEST_J			0x02
-#define MGC_M_TEST_SE0_NAK		0x01
+#define MGC_M_TEST_FORCE_HOST         0x80
+#define MGC_M_TEST_FIFO_ACCESS        0x40
+#define MGC_M_TEST_FORCE_FS           0x20
+#define MGC_M_TEST_FORCE_HS           0x10
+#define MGC_M_TEST_PACKET             0x08
+#define MGC_M_TEST_K                  0x04
+#define MGC_M_TEST_J                  0x02
+#define MGC_M_TEST_SE0_NAK            0x01
 
 /* CSR0 */
-#define	MGC_M_CSR0_FLUSHFIFO		0x0100
-#define MGC_M_CSR0_TXPKTRDY		0x0002
-#define MGC_M_CSR0_RXPKTRDY		0x0001
+#define MGC_M_CSR0_FLUSHFIFO          0x0100
+#define MGC_M_CSR0_TXPKTRDY           0x0002
+#define MGC_M_CSR0_RXPKTRDY           0x0001
 
 /* CSR0 in Peripheral mode */
-#define MGC_M_CSR0_P_SVDSETUPEND	0x0080
-#define MGC_M_CSR0_P_SVDRXPKTRDY	0x0040
-#define MGC_M_CSR0_P_SENDSTALL		0x0020
-#define MGC_M_CSR0_P_SETUPEND		0x0010
-#define MGC_M_CSR0_P_DATAEND		0x0008
-#define MGC_M_CSR0_P_SENTSTALL		0x0004
+#define MGC_M_CSR0_P_SVDSETUPEND      0x0080
+#define MGC_M_CSR0_P_SVDRXPKTRDY      0x0040
+#define MGC_M_CSR0_P_SENDSTALL        0x0020
+#define MGC_M_CSR0_P_SETUPEND         0x0010
+#define MGC_M_CSR0_P_DATAEND          0x0008
+#define MGC_M_CSR0_P_SENTSTALL        0x0004
 
 /* CSR0 in Host mode */
-#define MGC_M_CSR0_H_NO_PING		0x0800
-#define MGC_M_CSR0_H_WR_DATATOGGLE	0x0400	/* set to allow setting: */
-#define MGC_M_CSR0_H_DATATOGGLE		0x0200	/* data toggle control */
-#define	MGC_M_CSR0_H_NAKTIMEOUT		0x0080
-#define MGC_M_CSR0_H_STATUSPKT		0x0040
-#define MGC_M_CSR0_H_REQPKT		0x0020
-#define MGC_M_CSR0_H_ERROR		0x0010
-#define MGC_M_CSR0_H_SETUPPKT		0x0008
-#define MGC_M_CSR0_H_RXSTALL		0x0004
+#define MGC_M_CSR0_H_NO_PING          0x0800
+#define MGC_M_CSR0_H_WR_DATATOGGLE    0x0400    /* set to allow setting: */
+#define MGC_M_CSR0_H_DATATOGGLE       0x0200    /* data toggle control */
+#define MGC_M_CSR0_H_NAKTIMEOUT       0x0080
+#define MGC_M_CSR0_H_STATUSPKT        0x0040
+#define MGC_M_CSR0_H_REQPKT           0x0020
+#define MGC_M_CSR0_H_ERROR            0x0010
+#define MGC_M_CSR0_H_SETUPPKT         0x0008
+#define MGC_M_CSR0_H_RXSTALL          0x0004
 
 /* CONFIGDATA */
-#define MGC_M_CONFIGDATA_MPRXE		0x80	/* auto bulk pkt combining */
-#define MGC_M_CONFIGDATA_MPTXE		0x40	/* auto bulk pkt splitting */
-#define MGC_M_CONFIGDATA_BIGENDIAN	0x20
-#define MGC_M_CONFIGDATA_HBRXE		0x10	/* HB-ISO for RX */
-#define MGC_M_CONFIGDATA_HBTXE		0x08	/* HB-ISO for TX */
-#define MGC_M_CONFIGDATA_DYNFIFO	0x04	/* dynamic FIFO sizing */
-#define MGC_M_CONFIGDATA_SOFTCONE	0x02	/* SoftConnect */
-#define MGC_M_CONFIGDATA_UTMIDW		0x01	/* Width, 0 => 8b, 1 => 16b */
+#define MGC_M_CONFIGDATA_MPRXE        0x80    /* auto bulk pkt combining */
+#define MGC_M_CONFIGDATA_MPTXE        0x40    /* auto bulk pkt splitting */
+#define MGC_M_CONFIGDATA_BIGENDIAN    0x20
+#define MGC_M_CONFIGDATA_HBRXE        0x10    /* HB-ISO for RX */
+#define MGC_M_CONFIGDATA_HBTXE        0x08    /* HB-ISO for TX */
+#define MGC_M_CONFIGDATA_DYNFIFO      0x04    /* dynamic FIFO sizing */
+#define MGC_M_CONFIGDATA_SOFTCONE     0x02    /* SoftConnect */
+#define MGC_M_CONFIGDATA_UTMIDW       0x01    /* Width, 0 => 8b, 1 => 16b */
 
 /* TXCSR in Peripheral and Host mode */
-#define MGC_M_TXCSR_AUTOSET		0x8000
-#define MGC_M_TXCSR_ISO			0x4000
-#define MGC_M_TXCSR_MODE		0x2000
-#define MGC_M_TXCSR_DMAENAB		0x1000
-#define MGC_M_TXCSR_FRCDATATOG		0x0800
-#define MGC_M_TXCSR_DMAMODE		0x0400
-#define MGC_M_TXCSR_CLRDATATOG		0x0040
-#define MGC_M_TXCSR_FLUSHFIFO		0x0008
-#define MGC_M_TXCSR_FIFONOTEMPTY	0x0002
-#define MGC_M_TXCSR_TXPKTRDY		0x0001
+#define MGC_M_TXCSR_AUTOSET           0x8000
+#define MGC_M_TXCSR_ISO               0x4000
+#define MGC_M_TXCSR_MODE              0x2000
+#define MGC_M_TXCSR_DMAENAB           0x1000
+#define MGC_M_TXCSR_FRCDATATOG        0x0800
+#define MGC_M_TXCSR_DMAMODE           0x0400
+#define MGC_M_TXCSR_CLRDATATOG        0x0040
+#define MGC_M_TXCSR_FLUSHFIFO         0x0008
+#define MGC_M_TXCSR_FIFONOTEMPTY      0x0002
+#define MGC_M_TXCSR_TXPKTRDY          0x0001
 
 /* TXCSR in Peripheral mode */
-#define MGC_M_TXCSR_P_INCOMPTX		0x0080
-#define MGC_M_TXCSR_P_SENTSTALL		0x0020
-#define MGC_M_TXCSR_P_SENDSTALL		0x0010
-#define MGC_M_TXCSR_P_UNDERRUN		0x0004
+#define MGC_M_TXCSR_P_INCOMPTX        0x0080
+#define MGC_M_TXCSR_P_SENTSTALL       0x0020
+#define MGC_M_TXCSR_P_SENDSTALL       0x0010
+#define MGC_M_TXCSR_P_UNDERRUN        0x0004
 
 /* TXCSR in Host mode */
-#define MGC_M_TXCSR_H_WR_DATATOGGLE	0x0200
-#define MGC_M_TXCSR_H_DATATOGGLE	0x0100
-#define MGC_M_TXCSR_H_NAKTIMEOUT	0x0080
-#define MGC_M_TXCSR_H_RXSTALL		0x0020
-#define MGC_M_TXCSR_H_ERROR		0x0004
+#define MGC_M_TXCSR_H_WR_DATATOGGLE   0x0200
+#define MGC_M_TXCSR_H_DATATOGGLE      0x0100
+#define MGC_M_TXCSR_H_NAKTIMEOUT      0x0080
+#define MGC_M_TXCSR_H_RXSTALL         0x0020
+#define MGC_M_TXCSR_H_ERROR           0x0004
 
 /* RXCSR in Peripheral and Host mode */
-#define MGC_M_RXCSR_AUTOCLEAR		0x8000
-#define MGC_M_RXCSR_DMAENAB		0x2000
-#define MGC_M_RXCSR_DISNYET		0x1000
-#define MGC_M_RXCSR_DMAMODE		0x0800
-#define MGC_M_RXCSR_INCOMPRX		0x0100
-#define MGC_M_RXCSR_CLRDATATOG		0x0080
-#define MGC_M_RXCSR_FLUSHFIFO		0x0010
-#define MGC_M_RXCSR_DATAERROR		0x0008
-#define MGC_M_RXCSR_FIFOFULL		0x0002
-#define MGC_M_RXCSR_RXPKTRDY		0x0001
+#define MGC_M_RXCSR_AUTOCLEAR         0x8000
+#define MGC_M_RXCSR_DMAENAB           0x2000
+#define MGC_M_RXCSR_DISNYET           0x1000
+#define MGC_M_RXCSR_DMAMODE           0x0800
+#define MGC_M_RXCSR_INCOMPRX          0x0100
+#define MGC_M_RXCSR_CLRDATATOG        0x0080
+#define MGC_M_RXCSR_FLUSHFIFO         0x0010
+#define MGC_M_RXCSR_DATAERROR         0x0008
+#define MGC_M_RXCSR_FIFOFULL          0x0002
+#define MGC_M_RXCSR_RXPKTRDY          0x0001
 
 /* RXCSR in Peripheral mode */
-#define MGC_M_RXCSR_P_ISO		0x4000
-#define MGC_M_RXCSR_P_SENTSTALL		0x0040
-#define MGC_M_RXCSR_P_SENDSTALL		0x0020
-#define MGC_M_RXCSR_P_OVERRUN		0x0004
+#define MGC_M_RXCSR_P_ISO             0x4000
+#define MGC_M_RXCSR_P_SENTSTALL       0x0040
+#define MGC_M_RXCSR_P_SENDSTALL       0x0020
+#define MGC_M_RXCSR_P_OVERRUN         0x0004
 
 /* RXCSR in Host mode */
-#define MGC_M_RXCSR_H_AUTOREQ		0x4000
-#define MGC_M_RXCSR_H_WR_DATATOGGLE	0x0400
-#define MGC_M_RXCSR_H_DATATOGGLE	0x0200
-#define MGC_M_RXCSR_H_RXSTALL		0x0040
-#define MGC_M_RXCSR_H_REQPKT		0x0020
-#define MGC_M_RXCSR_H_ERROR		0x0004
+#define MGC_M_RXCSR_H_AUTOREQ         0x4000
+#define MGC_M_RXCSR_H_WR_DATATOGGLE   0x0400
+#define MGC_M_RXCSR_H_DATATOGGLE      0x0200
+#define MGC_M_RXCSR_H_RXSTALL         0x0040
+#define MGC_M_RXCSR_H_REQPKT          0x0020
+#define MGC_M_RXCSR_H_ERROR           0x0004
 
 /* HUBADDR */
-#define MGC_M_HUBADDR_MULTI_TT		0x80
+#define MGC_M_HUBADDR_MULTI_TT            0x80
 
 /* ULPI: Added in HDRC 1.9(?) & MHDRC 1.4 */
-#define MGC_M_ULPI_VBCTL_USEEXTVBUSIND	0x02
-#define MGC_M_ULPI_VBCTL_USEEXTVBUS	0x01
-#define MGC_M_ULPI_REGCTL_INT_ENABLE	0x08
-#define MGC_M_ULPI_REGCTL_READNOTWRITE	0x04
-#define MGC_M_ULPI_REGCTL_COMPLETE	0x02
-#define MGC_M_ULPI_REGCTL_REG		0x01
+#define MGC_M_ULPI_VBCTL_USEEXTVBUSIND    0x02
+#define MGC_M_ULPI_VBCTL_USEEXTVBUS       0x01
+#define MGC_M_ULPI_REGCTL_INT_ENABLE      0x08
+#define MGC_M_ULPI_REGCTL_READNOTWRITE    0x04
+#define MGC_M_ULPI_REGCTL_COMPLETE        0x02
+#define MGC_M_ULPI_REGCTL_REG             0x01
 
 /* #define MUSB_DEBUG */
 
@@ -296,7 +296,7 @@ struct MUSBEndPoint {
     uint8_t interval[2];
     uint8_t config;
     uint8_t fifosize;
-    int timeout[2];	/* Always in microframes */
+    int timeout[2];    /* Always in microframes */
 
     uint8_t *buf[2];
     int fifolen[2];
@@ -542,7 +542,7 @@ static void musb_cb_tick1(void *opaque)
     ep->delayed_cb[1](&ep->packey[1].p, opaque);
 }
 
-#define musb_cb_tick	(dir ? musb_cb_tick1 : musb_cb_tick0)
+#define musb_cb_tick    (dir ? musb_cb_tick1 : musb_cb_tick0)
 
 static void musb_schedule_cb(USBPort *port, USBPacket *packey)
 {
@@ -1323,7 +1323,7 @@ static void musb_writeb(void *opaque, hwaddr addr, uint32_t value)
             /* Negotiate high-speed operation if MGC_M_POWER_HSENAB is set.  */
             if ((value & MGC_M_POWER_HSENAB) &&
                             s->port.dev->speed == USB_SPEED_HIGH)
-                s->power |= MGC_M_POWER_HSMODE;	/* Success */
+                s->power |= MGC_M_POWER_HSMODE;    /* Success */
             /* Restart frame counting.  */
         }
         if (value & MGC_M_POWER_SUSPENDM) {
diff --git a/hw/usb/quirks-pl2303-ids.h b/hw/usb/quirks-pl2303-ids.h
index 8dbdb46ffe..0aa0258f6b 100644
--- a/hw/usb/quirks-pl2303-ids.h
+++ b/hw/usb/quirks-pl2303-ids.h
@@ -1,150 +1,150 @@
 /*
  * Prolific PL2303 USB to serial adaptor driver header file
  *
- *	This program is free software; you can redistribute it and/or modify
- *	it under the terms of the GNU General Public License as published by
- *	the Free Software Foundation; either version 2 of the License, or
- *	(at your option) any later version.
+ *    This program is free software; you can redistribute it and/or modify
+ *    it under the terms of the GNU General Public License as published by
+ *    the Free Software Foundation; either version 2 of the License, or
+ *    (at your option) any later version.
  *
  */
 
-#define BENQ_VENDOR_ID			0x04a5
-#define BENQ_PRODUCT_ID_S81		0x4027
+#define BENQ_VENDOR_ID            0x04a5
+#define BENQ_PRODUCT_ID_S81       0x4027
 
-#define PL2303_VENDOR_ID	0x067b
-#define PL2303_PRODUCT_ID	0x2303
-#define PL2303_PRODUCT_ID_RSAQ2		0x04bb
-#define PL2303_PRODUCT_ID_DCU11		0x1234
-#define PL2303_PRODUCT_ID_PHAROS	0xaaa0
-#define PL2303_PRODUCT_ID_RSAQ3		0xaaa2
-#define PL2303_PRODUCT_ID_ALDIGA	0x0611
-#define PL2303_PRODUCT_ID_MMX		0x0612
-#define PL2303_PRODUCT_ID_GPRS		0x0609
-#define PL2303_PRODUCT_ID_HCR331	0x331a
-#define PL2303_PRODUCT_ID_MOTOROLA	0x0307
+#define PL2303_VENDOR_ID              0x067b
+#define PL2303_PRODUCT_ID             0x2303
+#define PL2303_PRODUCT_ID_RSAQ2       0x04bb
+#define PL2303_PRODUCT_ID_DCU11       0x1234
+#define PL2303_PRODUCT_ID_PHAROS      0xaaa0
+#define PL2303_PRODUCT_ID_RSAQ3       0xaaa2
+#define PL2303_PRODUCT_ID_ALDIGA      0x0611
+#define PL2303_PRODUCT_ID_MMX         0x0612
+#define PL2303_PRODUCT_ID_GPRS        0x0609
+#define PL2303_PRODUCT_ID_HCR331      0x331a
+#define PL2303_PRODUCT_ID_MOTOROLA    0x0307
 
-#define ATEN_VENDOR_ID		0x0557
-#define ATEN_VENDOR_ID2		0x0547
-#define ATEN_PRODUCT_ID		0x2008
+#define ATEN_VENDOR_ID            0x0557
+#define ATEN_VENDOR_ID2           0x0547
+#define ATEN_PRODUCT_ID           0x2008
 
-#define IODATA_VENDOR_ID	0x04bb
-#define IODATA_PRODUCT_ID	0x0a03
-#define IODATA_PRODUCT_ID_RSAQ5	0x0a0e
+#define IODATA_VENDOR_ID          0x04bb
+#define IODATA_PRODUCT_ID         0x0a03
+#define IODATA_PRODUCT_ID_RSAQ5   0x0a0e
 
-#define ELCOM_VENDOR_ID		0x056e
-#define ELCOM_PRODUCT_ID	0x5003
-#define ELCOM_PRODUCT_ID_UCSGT	0x5004
+#define ELCOM_VENDOR_ID           0x056e
+#define ELCOM_PRODUCT_ID          0x5003
+#define ELCOM_PRODUCT_ID_UCSGT    0x5004
 
-#define ITEGNO_VENDOR_ID	0x0eba
-#define ITEGNO_PRODUCT_ID	0x1080
-#define ITEGNO_PRODUCT_ID_2080	0x2080
+#define ITEGNO_VENDOR_ID          0x0eba
+#define ITEGNO_PRODUCT_ID         0x1080
+#define ITEGNO_PRODUCT_ID_2080    0x2080
 
-#define MA620_VENDOR_ID		0x0df7
-#define MA620_PRODUCT_ID	0x0620
+#define MA620_VENDOR_ID           0x0df7
+#define MA620_PRODUCT_ID          0x0620
 
-#define RATOC_VENDOR_ID		0x0584
-#define RATOC_PRODUCT_ID	0xb000
+#define RATOC_VENDOR_ID           0x0584
+#define RATOC_PRODUCT_ID          0xb000
 
-#define TRIPP_VENDOR_ID		0x2478
-#define TRIPP_PRODUCT_ID	0x2008
+#define TRIPP_VENDOR_ID           0x2478
+#define TRIPP_PRODUCT_ID          0x2008
 
-#define RADIOSHACK_VENDOR_ID	0x1453
-#define RADIOSHACK_PRODUCT_ID	0x4026
+#define RADIOSHACK_VENDOR_ID      0x1453
+#define RADIOSHACK_PRODUCT_ID     0x4026
 
-#define DCU10_VENDOR_ID		0x0731
-#define DCU10_PRODUCT_ID	0x0528
+#define DCU10_VENDOR_ID           0x0731
+#define DCU10_PRODUCT_ID          0x0528
 
-#define SITECOM_VENDOR_ID	0x6189
-#define SITECOM_PRODUCT_ID	0x2068
+#define SITECOM_VENDOR_ID         0x6189
+#define SITECOM_PRODUCT_ID        0x2068
 
 /* Alcatel OT535/735 USB cable */
-#define ALCATEL_VENDOR_ID	0x11f7
-#define ALCATEL_PRODUCT_ID	0x02df
+#define ALCATEL_VENDOR_ID         0x11f7
+#define ALCATEL_PRODUCT_ID        0x02df
 
 /* Samsung I330 phone cradle */
-#define SAMSUNG_VENDOR_ID	0x04e8
-#define SAMSUNG_PRODUCT_ID	0x8001
+#define SAMSUNG_VENDOR_ID         0x04e8
+#define SAMSUNG_PRODUCT_ID        0x8001
 
-#define SIEMENS_VENDOR_ID	0x11f5
-#define SIEMENS_PRODUCT_ID_SX1	0x0001
-#define SIEMENS_PRODUCT_ID_X65	0x0003
-#define SIEMENS_PRODUCT_ID_X75	0x0004
-#define SIEMENS_PRODUCT_ID_EF81	0x0005
+#define SIEMENS_VENDOR_ID         0x11f5
+#define SIEMENS_PRODUCT_ID_SX1    0x0001
+#define SIEMENS_PRODUCT_ID_X65    0x0003
+#define SIEMENS_PRODUCT_ID_X75    0x0004
+#define SIEMENS_PRODUCT_ID_EF81   0x0005
 
-#define SYNTECH_VENDOR_ID	0x0745
-#define SYNTECH_PRODUCT_ID	0x0001
+#define SYNTECH_VENDOR_ID         0x0745
+#define SYNTECH_PRODUCT_ID        0x0001
 
 /* Nokia CA-42 Cable */
-#define NOKIA_CA42_VENDOR_ID	0x078b
-#define NOKIA_CA42_PRODUCT_ID	0x1234
+#define NOKIA_CA42_VENDOR_ID      0x078b
+#define NOKIA_CA42_PRODUCT_ID     0x1234
 
 /* CA-42 CLONE Cable www.ca-42.com chipset: Prolific Technology Inc */
-#define CA_42_CA42_VENDOR_ID	0x10b5
-#define CA_42_CA42_PRODUCT_ID	0xac70
+#define CA_42_CA42_VENDOR_ID      0x10b5
+#define CA_42_CA42_PRODUCT_ID     0xac70
 
-#define SAGEM_VENDOR_ID		0x079b
-#define SAGEM_PRODUCT_ID	0x0027
+#define SAGEM_VENDOR_ID           0x079b
+#define SAGEM_PRODUCT_ID          0x0027
 
 /* Leadtek GPS 9531 (ID 0413:2101) */
-#define LEADTEK_VENDOR_ID	0x0413
-#define LEADTEK_9531_PRODUCT_ID	0x2101
+#define LEADTEK_VENDOR_ID         0x0413
+#define LEADTEK_9531_PRODUCT_ID   0x2101
 
 /* USB GSM cable from Speed Dragon Multimedia, Ltd */
-#define SPEEDDRAGON_VENDOR_ID	0x0e55
-#define SPEEDDRAGON_PRODUCT_ID	0x110b
+#define SPEEDDRAGON_VENDOR_ID     0x0e55
+#define SPEEDDRAGON_PRODUCT_ID    0x110b
 
 /* DATAPILOT Universal-2 Phone Cable */
-#define DATAPILOT_U2_VENDOR_ID	0x0731
-#define DATAPILOT_U2_PRODUCT_ID	0x2003
+#define DATAPILOT_U2_VENDOR_ID    0x0731
+#define DATAPILOT_U2_PRODUCT_ID   0x2003
 
 /* Belkin "F5U257" Serial Adapter */
-#define BELKIN_VENDOR_ID	0x050d
-#define BELKIN_PRODUCT_ID	0x0257
+#define BELKIN_VENDOR_ID          0x050d
+#define BELKIN_PRODUCT_ID         0x0257
 
 /* Alcor Micro Corp. USB 2.0 TO RS-232 */
-#define ALCOR_VENDOR_ID		0x058F
-#define ALCOR_PRODUCT_ID	0x9720
+#define ALCOR_VENDOR_ID           0x058F
+#define ALCOR_PRODUCT_ID          0x9720
 
 /* Willcom WS002IN Data Driver (by NetIndex Inc.) */
-#define WS002IN_VENDOR_ID	0x11f6
-#define WS002IN_PRODUCT_ID	0x2001
+#define WS002IN_VENDOR_ID         0x11f6
+#define WS002IN_PRODUCT_ID        0x2001
 
 /* Corega CG-USBRS232R Serial Adapter */
-#define COREGA_VENDOR_ID	0x07aa
-#define COREGA_PRODUCT_ID	0x002a
+#define COREGA_VENDOR_ID          0x07aa
+#define COREGA_PRODUCT_ID         0x002a
 
 /* Y.C. Cable U.S.A., Inc - USB to RS-232 */
-#define YCCABLE_VENDOR_ID	0x05ad
-#define YCCABLE_PRODUCT_ID	0x0fba
+#define YCCABLE_VENDOR_ID         0x05ad
+#define YCCABLE_PRODUCT_ID        0x0fba
 
 /* "Superial" USB - Serial */
-#define SUPERIAL_VENDOR_ID	0x5372
-#define SUPERIAL_PRODUCT_ID	0x2303
+#define SUPERIAL_VENDOR_ID        0x5372
+#define SUPERIAL_PRODUCT_ID       0x2303
 
 /* Hewlett-Packard LD220-HP POS Pole Display */
-#define HP_VENDOR_ID		0x03f0
-#define HP_LD220_PRODUCT_ID	0x3524
+#define HP_VENDOR_ID              0x03f0
+#define HP_LD220_PRODUCT_ID       0x3524
 
 /* Cressi Edy (diving computer) PC interface */
-#define CRESSI_VENDOR_ID	0x04b8
-#define CRESSI_EDY_PRODUCT_ID	0x0521
+#define CRESSI_VENDOR_ID          0x04b8
+#define CRESSI_EDY_PRODUCT_ID     0x0521
 
 /* Zeagle dive computer interface */
-#define ZEAGLE_VENDOR_ID	0x04b8
-#define ZEAGLE_N2ITION3_PRODUCT_ID	0x0522
+#define ZEAGLE_VENDOR_ID              0x04b8
+#define ZEAGLE_N2ITION3_PRODUCT_ID    0x0522
 
 /* Sony, USB data cable for CMD-Jxx mobile phones */
-#define SONY_VENDOR_ID		0x054c
-#define SONY_QN3USB_PRODUCT_ID	0x0437
+#define SONY_VENDOR_ID            0x054c
+#define SONY_QN3USB_PRODUCT_ID    0x0437
 
 /* Sanwa KB-USB2 multimeter cable (ID: 11ad:0001) */
-#define SANWA_VENDOR_ID		0x11ad
-#define SANWA_PRODUCT_ID	0x0001
+#define SANWA_VENDOR_ID           0x11ad
+#define SANWA_PRODUCT_ID          0x0001
 
 /* ADLINK ND-6530 RS232,RS485 and RS422 adapter */
-#define ADLINK_VENDOR_ID		0x0b63
-#define ADLINK_ND6530_PRODUCT_ID	0x6530
+#define ADLINK_VENDOR_ID          0x0b63
+#define ADLINK_ND6530_PRODUCT_ID  0x6530
 
 /* SMART USB Serial Adapter */
-#define SMART_VENDOR_ID	0x0b8c
-#define SMART_PRODUCT_ID	0x2303
+#define SMART_VENDOR_ID     0x0b8c
+#define SMART_PRODUCT_ID    0x2303
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 33668dd0a9..50bbae183e 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -32,7 +32,7 @@
 #include "qom/object.h"
 
 /* Constants related to the USB / PCI interaction */
-#define USB_SBRN    0x60 /* Serial Bus Release Number Register */
+#define USB_SBRN       0x60 /* Serial Bus Release Number Register */
 #define USB_RELEASE_1  0x10 /* USB 1.0 */
 #define USB_RELEASE_2  0x20 /* USB 2.0 */
 #define USB_RELEASE_3  0x30 /* USB 3.0 */
@@ -66,42 +66,42 @@
 //#define USB_STATE_POWERED     2
 #define USB_STATE_DEFAULT     3
 //#define USB_STATE_ADDRESS     4
-//#define	USB_STATE_CONFIGURED  5
+//#define    USB_STATE_CONFIGURED  5
 #define USB_STATE_SUSPENDED   6
 
-#define USB_CLASS_AUDIO			1
-#define USB_CLASS_COMM			2
-#define USB_CLASS_HID			3
-#define USB_CLASS_PHYSICAL		5
-#define USB_CLASS_STILL_IMAGE		6
-#define USB_CLASS_PRINTER		7
-#define USB_CLASS_MASS_STORAGE		8
-#define USB_CLASS_HUB			9
-#define USB_CLASS_CDC_DATA		0x0a
-#define USB_CLASS_CSCID			0x0b
-#define USB_CLASS_CONTENT_SEC		0x0d
-#define USB_CLASS_APP_SPEC		0xfe
-#define USB_CLASS_VENDOR_SPEC		0xff
-
-#define USB_SUBCLASS_UNDEFINED          0
-#define USB_SUBCLASS_AUDIO_CONTROL      1
-#define USB_SUBCLASS_AUDIO_STREAMING    2
+#define USB_CLASS_AUDIO           1
+#define USB_CLASS_COMM            2
+#define USB_CLASS_HID             3
+#define USB_CLASS_PHYSICAL        5
+#define USB_CLASS_STILL_IMAGE     6
+#define USB_CLASS_PRINTER         7
+#define USB_CLASS_MASS_STORAGE    8
+#define USB_CLASS_HUB             9
+#define USB_CLASS_CDC_DATA        0x0a
+#define USB_CLASS_CSCID           0x0b
+#define USB_CLASS_CONTENT_SEC     0x0d
+#define USB_CLASS_APP_SPEC        0xfe
+#define USB_CLASS_VENDOR_SPEC     0xff
+
+#define USB_SUBCLASS_UNDEFINED           0
+#define USB_SUBCLASS_AUDIO_CONTROL       1
+#define USB_SUBCLASS_AUDIO_STREAMING     2
 #define USB_SUBCLASS_AUDIO_MIDISTREAMING 3
 
-#define USB_DIR_OUT			0
-#define USB_DIR_IN			0x80
+#define USB_DIR_OUT            0
+#define USB_DIR_IN             0x80
 
-#define USB_TYPE_MASK			(0x03 << 5)
-#define USB_TYPE_STANDARD		(0x00 << 5)
-#define USB_TYPE_CLASS			(0x01 << 5)
-#define USB_TYPE_VENDOR			(0x02 << 5)
-#define USB_TYPE_RESERVED		(0x03 << 5)
+#define USB_TYPE_MASK            (0x03 << 5)
+#define USB_TYPE_STANDARD        (0x00 << 5)
+#define USB_TYPE_CLASS           (0x01 << 5)
+#define USB_TYPE_VENDOR          (0x02 << 5)
+#define USB_TYPE_RESERVED        (0x03 << 5)
 
-#define USB_RECIP_MASK			0x1f
-#define USB_RECIP_DEVICE		0x00
-#define USB_RECIP_INTERFACE		0x01
-#define USB_RECIP_ENDPOINT		0x02
-#define USB_RECIP_OTHER			0x03
+#define USB_RECIP_MASK            0x1f
+#define USB_RECIP_DEVICE          0x00
+#define USB_RECIP_INTERFACE       0x01
+#define USB_RECIP_ENDPOINT        0x02
+#define USB_RECIP_OTHER           0x03
 
 #define DeviceRequest ((USB_DIR_IN|USB_TYPE_STANDARD|USB_RECIP_DEVICE)<<8)
 #define DeviceOutRequest ((USB_DIR_OUT|USB_TYPE_STANDARD|USB_RECIP_DEVICE)<<8)
@@ -126,28 +126,28 @@
 #define EndpointOutRequest \
         ((USB_DIR_OUT|USB_TYPE_STANDARD|USB_RECIP_ENDPOINT)<<8)
 
-#define USB_REQ_GET_STATUS		0x00
-#define USB_REQ_CLEAR_FEATURE		0x01
-#define USB_REQ_SET_FEATURE		0x03
-#define USB_REQ_SET_ADDRESS		0x05
-#define USB_REQ_GET_DESCRIPTOR		0x06
-#define USB_REQ_SET_DESCRIPTOR		0x07
-#define USB_REQ_GET_CONFIGURATION	0x08
-#define USB_REQ_SET_CONFIGURATION	0x09
-#define USB_REQ_GET_INTERFACE		0x0A
-#define USB_REQ_SET_INTERFACE		0x0B
-#define USB_REQ_SYNCH_FRAME		0x0C
-#define USB_REQ_SET_SEL                 0x30
-#define USB_REQ_SET_ISOCH_DELAY         0x31
-
-#define USB_DEVICE_SELF_POWERED		0
-#define USB_DEVICE_REMOTE_WAKEUP	1
-
-#define USB_DT_DEVICE			0x01
-#define USB_DT_CONFIG			0x02
-#define USB_DT_STRING			0x03
-#define USB_DT_INTERFACE		0x04
-#define USB_DT_ENDPOINT			0x05
+#define USB_REQ_GET_STATUS           0x00
+#define USB_REQ_CLEAR_FEATURE        0x01
+#define USB_REQ_SET_FEATURE          0x03
+#define USB_REQ_SET_ADDRESS          0x05
+#define USB_REQ_GET_DESCRIPTOR       0x06
+#define USB_REQ_SET_DESCRIPTOR       0x07
+#define USB_REQ_GET_CONFIGURATION    0x08
+#define USB_REQ_SET_CONFIGURATION    0x09
+#define USB_REQ_GET_INTERFACE        0x0A
+#define USB_REQ_SET_INTERFACE        0x0B
+#define USB_REQ_SYNCH_FRAME          0x0C
+#define USB_REQ_SET_SEL              0x30
+#define USB_REQ_SET_ISOCH_DELAY      0x31
+
+#define USB_DEVICE_SELF_POWERED      0
+#define USB_DEVICE_REMOTE_WAKEUP     1
+
+#define USB_DT_DEVICE                   0x01
+#define USB_DT_CONFIG                   0x02
+#define USB_DT_STRING                   0x03
+#define USB_DT_INTERFACE                0x04
+#define USB_DT_ENDPOINT                 0x05
 #define USB_DT_DEVICE_QUALIFIER         0x06
 #define USB_DT_OTHER_SPEED_CONFIG       0x07
 #define USB_DT_DEBUG                    0x0A
@@ -167,10 +167,10 @@
 #define USB_CFG_ATT_WAKEUP           (1 << 5)
 #define USB_CFG_ATT_BATTERY          (1 << 4)
 
-#define USB_ENDPOINT_XFER_CONTROL	0
-#define USB_ENDPOINT_XFER_ISOC		1
-#define USB_ENDPOINT_XFER_BULK		2
-#define USB_ENDPOINT_XFER_INT		3
+#define USB_ENDPOINT_XFER_CONTROL     0
+#define USB_ENDPOINT_XFER_ISOC        1
+#define USB_ENDPOINT_XFER_BULK        2
+#define USB_ENDPOINT_XFER_INT         3
 #define USB_ENDPOINT_XFER_INVALID     255
 
 #define USB_INTERFACE_INVALID         255
@@ -569,9 +569,9 @@ static inline bool usb_device_is_scsi_storage(USBDevice *dev)
 /* quirks.c */
 
 /* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
-#define USB_QUIRK_BUFFER_BULK_IN	0x01
+#define USB_QUIRK_BUFFER_BULK_IN    0x01
 /* Bulk pkts in FTDI format, need special handling when combining packets */
-#define USB_QUIRK_IS_FTDI		0x02
+#define USB_QUIRK_IS_FTDI        0x02
 
 int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
                    uint8_t interface_class, uint8_t interface_subclass,
diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
index 4015c1d691..dfb937ff4a 100644
--- a/include/hw/usb/dwc2-regs.h
+++ b/include/hw/usb/dwc2-regs.h
@@ -42,788 +42,788 @@
 #ifndef DWC2_REGS_H
 #define DWC2_REGS_H
 
-#define HSOTG_REG(x)	(x)
-
-#define GOTGCTL				HSOTG_REG(0x000)
-#define GOTGCTL_CHIRPEN			BIT(27)
-#define GOTGCTL_MULT_VALID_BC_MASK	(0x1f << 22)
-#define GOTGCTL_MULT_VALID_BC_SHIFT	22
-#define GOTGCTL_OTGVER			BIT(20)
-#define GOTGCTL_BSESVLD			BIT(19)
-#define GOTGCTL_ASESVLD			BIT(18)
-#define GOTGCTL_DBNC_SHORT		BIT(17)
-#define GOTGCTL_CONID_B			BIT(16)
-#define GOTGCTL_DBNCE_FLTR_BYPASS	BIT(15)
-#define GOTGCTL_DEVHNPEN		BIT(11)
-#define GOTGCTL_HSTSETHNPEN		BIT(10)
-#define GOTGCTL_HNPREQ			BIT(9)
-#define GOTGCTL_HSTNEGSCS		BIT(8)
-#define GOTGCTL_SESREQ			BIT(1)
-#define GOTGCTL_SESREQSCS		BIT(0)
-
-#define GOTGINT				HSOTG_REG(0x004)
-#define GOTGINT_DBNCE_DONE		BIT(19)
-#define GOTGINT_A_DEV_TOUT_CHG		BIT(18)
-#define GOTGINT_HST_NEG_DET		BIT(17)
-#define GOTGINT_HST_NEG_SUC_STS_CHNG	BIT(9)
-#define GOTGINT_SES_REQ_SUC_STS_CHNG	BIT(8)
-#define GOTGINT_SES_END_DET		BIT(2)
-
-#define GAHBCFG				HSOTG_REG(0x008)
-#define GAHBCFG_AHB_SINGLE		BIT(23)
-#define GAHBCFG_NOTI_ALL_DMA_WRIT	BIT(22)
-#define GAHBCFG_REM_MEM_SUPP		BIT(21)
-#define GAHBCFG_P_TXF_EMP_LVL		BIT(8)
-#define GAHBCFG_NP_TXF_EMP_LVL		BIT(7)
-#define GAHBCFG_DMA_EN			BIT(5)
-#define GAHBCFG_HBSTLEN_MASK		(0xf << 1)
-#define GAHBCFG_HBSTLEN_SHIFT		1
-#define GAHBCFG_HBSTLEN_SINGLE		0
-#define GAHBCFG_HBSTLEN_INCR		1
-#define GAHBCFG_HBSTLEN_INCR4		3
-#define GAHBCFG_HBSTLEN_INCR8		5
-#define GAHBCFG_HBSTLEN_INCR16		7
-#define GAHBCFG_GLBL_INTR_EN		BIT(0)
-#define GAHBCFG_CTRL_MASK		(GAHBCFG_P_TXF_EMP_LVL | \
-					 GAHBCFG_NP_TXF_EMP_LVL | \
-					 GAHBCFG_DMA_EN | \
-					 GAHBCFG_GLBL_INTR_EN)
-
-#define GUSBCFG				HSOTG_REG(0x00C)
-#define GUSBCFG_FORCEDEVMODE		BIT(30)
-#define GUSBCFG_FORCEHOSTMODE		BIT(29)
-#define GUSBCFG_TXENDDELAY		BIT(28)
-#define GUSBCFG_ICTRAFFICPULLREMOVE	BIT(27)
-#define GUSBCFG_ICUSBCAP		BIT(26)
-#define GUSBCFG_ULPI_INT_PROT_DIS	BIT(25)
-#define GUSBCFG_INDICATORPASSTHROUGH	BIT(24)
-#define GUSBCFG_INDICATORCOMPLEMENT	BIT(23)
-#define GUSBCFG_TERMSELDLPULSE		BIT(22)
-#define GUSBCFG_ULPI_INT_VBUS_IND	BIT(21)
-#define GUSBCFG_ULPI_EXT_VBUS_DRV	BIT(20)
-#define GUSBCFG_ULPI_CLK_SUSP_M		BIT(19)
-#define GUSBCFG_ULPI_AUTO_RES		BIT(18)
-#define GUSBCFG_ULPI_FS_LS		BIT(17)
-#define GUSBCFG_OTG_UTMI_FS_SEL		BIT(16)
-#define GUSBCFG_PHY_LP_CLK_SEL		BIT(15)
-#define GUSBCFG_USBTRDTIM_MASK		(0xf << 10)
-#define GUSBCFG_USBTRDTIM_SHIFT		10
-#define GUSBCFG_HNPCAP			BIT(9)
-#define GUSBCFG_SRPCAP			BIT(8)
-#define GUSBCFG_DDRSEL			BIT(7)
-#define GUSBCFG_PHYSEL			BIT(6)
-#define GUSBCFG_FSINTF			BIT(5)
-#define GUSBCFG_ULPI_UTMI_SEL		BIT(4)
-#define GUSBCFG_PHYIF16			BIT(3)
-#define GUSBCFG_PHYIF8			(0 << 3)
-#define GUSBCFG_TOUTCAL_MASK		(0x7 << 0)
-#define GUSBCFG_TOUTCAL_SHIFT		0
-#define GUSBCFG_TOUTCAL_LIMIT		0x7
-#define GUSBCFG_TOUTCAL(_x)		((_x) << 0)
-
-#define GRSTCTL				HSOTG_REG(0x010)
-#define GRSTCTL_AHBIDLE			BIT(31)
-#define GRSTCTL_DMAREQ			BIT(30)
-#define GRSTCTL_TXFNUM_MASK		(0x1f << 6)
-#define GRSTCTL_TXFNUM_SHIFT		6
-#define GRSTCTL_TXFNUM_LIMIT		0x1f
-#define GRSTCTL_TXFNUM(_x)		((_x) << 6)
-#define GRSTCTL_TXFFLSH			BIT(5)
-#define GRSTCTL_RXFFLSH			BIT(4)
-#define GRSTCTL_IN_TKNQ_FLSH		BIT(3)
-#define GRSTCTL_FRMCNTRRST		BIT(2)
-#define GRSTCTL_HSFTRST			BIT(1)
-#define GRSTCTL_CSFTRST			BIT(0)
-
-#define GINTSTS				HSOTG_REG(0x014)
-#define GINTMSK				HSOTG_REG(0x018)
-#define GINTSTS_WKUPINT			BIT(31)
-#define GINTSTS_SESSREQINT		BIT(30)
-#define GINTSTS_DISCONNINT		BIT(29)
-#define GINTSTS_CONIDSTSCHNG		BIT(28)
-#define GINTSTS_LPMTRANRCVD		BIT(27)
-#define GINTSTS_PTXFEMP			BIT(26)
-#define GINTSTS_HCHINT			BIT(25)
-#define GINTSTS_PRTINT			BIT(24)
-#define GINTSTS_RESETDET		BIT(23)
-#define GINTSTS_FET_SUSP		BIT(22)
-#define GINTSTS_INCOMPL_IP		BIT(21)
-#define GINTSTS_INCOMPL_SOOUT		BIT(21)
-#define GINTSTS_INCOMPL_SOIN		BIT(20)
-#define GINTSTS_OEPINT			BIT(19)
-#define GINTSTS_IEPINT			BIT(18)
-#define GINTSTS_EPMIS			BIT(17)
-#define GINTSTS_RESTOREDONE		BIT(16)
-#define GINTSTS_EOPF			BIT(15)
-#define GINTSTS_ISOUTDROP		BIT(14)
-#define GINTSTS_ENUMDONE		BIT(13)
-#define GINTSTS_USBRST			BIT(12)
-#define GINTSTS_USBSUSP			BIT(11)
-#define GINTSTS_ERLYSUSP		BIT(10)
-#define GINTSTS_I2CINT			BIT(9)
-#define GINTSTS_ULPI_CK_INT		BIT(8)
-#define GINTSTS_GOUTNAKEFF		BIT(7)
-#define GINTSTS_GINNAKEFF		BIT(6)
-#define GINTSTS_NPTXFEMP		BIT(5)
-#define GINTSTS_RXFLVL			BIT(4)
-#define GINTSTS_SOF			BIT(3)
-#define GINTSTS_OTGINT			BIT(2)
-#define GINTSTS_MODEMIS			BIT(1)
-#define GINTSTS_CURMODE_HOST		BIT(0)
-
-#define GRXSTSR				HSOTG_REG(0x01C)
-#define GRXSTSP				HSOTG_REG(0x020)
-#define GRXSTS_FN_MASK			(0x7f << 25)
-#define GRXSTS_FN_SHIFT			25
-#define GRXSTS_PKTSTS_MASK		(0xf << 17)
-#define GRXSTS_PKTSTS_SHIFT		17
-#define GRXSTS_PKTSTS_GLOBALOUTNAK	1
-#define GRXSTS_PKTSTS_OUTRX		2
-#define GRXSTS_PKTSTS_HCHIN		2
-#define GRXSTS_PKTSTS_OUTDONE		3
-#define GRXSTS_PKTSTS_HCHIN_XFER_COMP	3
-#define GRXSTS_PKTSTS_SETUPDONE		4
-#define GRXSTS_PKTSTS_DATATOGGLEERR	5
-#define GRXSTS_PKTSTS_SETUPRX		6
-#define GRXSTS_PKTSTS_HCHHALTED		7
-#define GRXSTS_HCHNUM_MASK		(0xf << 0)
-#define GRXSTS_HCHNUM_SHIFT		0
-#define GRXSTS_DPID_MASK		(0x3 << 15)
-#define GRXSTS_DPID_SHIFT		15
-#define GRXSTS_BYTECNT_MASK		(0x7ff << 4)
-#define GRXSTS_BYTECNT_SHIFT		4
-#define GRXSTS_EPNUM_MASK		(0xf << 0)
-#define GRXSTS_EPNUM_SHIFT		0
-
-#define GRXFSIZ				HSOTG_REG(0x024)
-#define GRXFSIZ_DEPTH_MASK		(0xffff << 0)
-#define GRXFSIZ_DEPTH_SHIFT		0
-
-#define GNPTXFSIZ			HSOTG_REG(0x028)
+#define HSOTG_REG(x)    (x)
+
+#define GOTGCTL                       HSOTG_REG(0x000)
+#define GOTGCTL_CHIRPEN               BIT(27)
+#define GOTGCTL_MULT_VALID_BC_MASK    (0x1f << 22)
+#define GOTGCTL_MULT_VALID_BC_SHIFT   22
+#define GOTGCTL_OTGVER                BIT(20)
+#define GOTGCTL_BSESVLD               BIT(19)
+#define GOTGCTL_ASESVLD               BIT(18)
+#define GOTGCTL_DBNC_SHORT            BIT(17)
+#define GOTGCTL_CONID_B               BIT(16)
+#define GOTGCTL_DBNCE_FLTR_BYPASS     BIT(15)
+#define GOTGCTL_DEVHNPEN              BIT(11)
+#define GOTGCTL_HSTSETHNPEN           BIT(10)
+#define GOTGCTL_HNPREQ                BIT(9)
+#define GOTGCTL_HSTNEGSCS             BIT(8)
+#define GOTGCTL_SESREQ                BIT(1)
+#define GOTGCTL_SESREQSCS             BIT(0)
+
+#define GOTGINT                       HSOTG_REG(0x004)
+#define GOTGINT_DBNCE_DONE            BIT(19)
+#define GOTGINT_A_DEV_TOUT_CHG        BIT(18)
+#define GOTGINT_HST_NEG_DET           BIT(17)
+#define GOTGINT_HST_NEG_SUC_STS_CHNG    BIT(9)
+#define GOTGINT_SES_REQ_SUC_STS_CHNG    BIT(8)
+#define GOTGINT_SES_END_DET           BIT(2)
+
+#define GAHBCFG                       HSOTG_REG(0x008)
+#define GAHBCFG_AHB_SINGLE            BIT(23)
+#define GAHBCFG_NOTI_ALL_DMA_WRIT     BIT(22)
+#define GAHBCFG_REM_MEM_SUPP          BIT(21)
+#define GAHBCFG_P_TXF_EMP_LVL         BIT(8)
+#define GAHBCFG_NP_TXF_EMP_LVL        BIT(7)
+#define GAHBCFG_DMA_EN                BIT(5)
+#define GAHBCFG_HBSTLEN_MASK          (0xf << 1)
+#define GAHBCFG_HBSTLEN_SHIFT         1
+#define GAHBCFG_HBSTLEN_SINGLE        0
+#define GAHBCFG_HBSTLEN_INCR          1
+#define GAHBCFG_HBSTLEN_INCR4         3
+#define GAHBCFG_HBSTLEN_INCR8         5
+#define GAHBCFG_HBSTLEN_INCR16        7
+#define GAHBCFG_GLBL_INTR_EN          BIT(0)
+#define GAHBCFG_CTRL_MASK        (GAHBCFG_P_TXF_EMP_LVL | \
+                                  GAHBCFG_NP_TXF_EMP_LVL | \
+                                  GAHBCFG_DMA_EN | \
+                                  GAHBCFG_GLBL_INTR_EN)
+
+#define GUSBCFG                         HSOTG_REG(0x00C)
+#define GUSBCFG_FORCEDEVMODE            BIT(30)
+#define GUSBCFG_FORCEHOSTMODE           BIT(29)
+#define GUSBCFG_TXENDDELAY              BIT(28)
+#define GUSBCFG_ICTRAFFICPULLREMOVE     BIT(27)
+#define GUSBCFG_ICUSBCAP                BIT(26)
+#define GUSBCFG_ULPI_INT_PROT_DIS       BIT(25)
+#define GUSBCFG_INDICATORPASSTHROUGH    BIT(24)
+#define GUSBCFG_INDICATORCOMPLEMENT     BIT(23)
+#define GUSBCFG_TERMSELDLPULSE          BIT(22)
+#define GUSBCFG_ULPI_INT_VBUS_IND       BIT(21)
+#define GUSBCFG_ULPI_EXT_VBUS_DRV       BIT(20)
+#define GUSBCFG_ULPI_CLK_SUSP_M         BIT(19)
+#define GUSBCFG_ULPI_AUTO_RES           BIT(18)
+#define GUSBCFG_ULPI_FS_LS              BIT(17)
+#define GUSBCFG_OTG_UTMI_FS_SEL         BIT(16)
+#define GUSBCFG_PHY_LP_CLK_SEL          BIT(15)
+#define GUSBCFG_USBTRDTIM_MASK          (0xf << 10)
+#define GUSBCFG_USBTRDTIM_SHIFT         10
+#define GUSBCFG_HNPCAP            BIT(9)
+#define GUSBCFG_SRPCAP            BIT(8)
+#define GUSBCFG_DDRSEL            BIT(7)
+#define GUSBCFG_PHYSEL            BIT(6)
+#define GUSBCFG_FSINTF            BIT(5)
+#define GUSBCFG_ULPI_UTMI_SEL     BIT(4)
+#define GUSBCFG_PHYIF16           BIT(3)
+#define GUSBCFG_PHYIF8            (0 << 3)
+#define GUSBCFG_TOUTCAL_MASK      (0x7 << 0)
+#define GUSBCFG_TOUTCAL_SHIFT     0
+#define GUSBCFG_TOUTCAL_LIMIT     0x7
+#define GUSBCFG_TOUTCAL(_x)       ((_x) << 0)
+
+#define GRSTCTL                    HSOTG_REG(0x010)
+#define GRSTCTL_AHBIDLE            BIT(31)
+#define GRSTCTL_DMAREQ             BIT(30)
+#define GRSTCTL_TXFNUM_MASK        (0x1f << 6)
+#define GRSTCTL_TXFNUM_SHIFT       6
+#define GRSTCTL_TXFNUM_LIMIT       0x1f
+#define GRSTCTL_TXFNUM(_x)         ((_x) << 6)
+#define GRSTCTL_TXFFLSH            BIT(5)
+#define GRSTCTL_RXFFLSH            BIT(4)
+#define GRSTCTL_IN_TKNQ_FLSH       BIT(3)
+#define GRSTCTL_FRMCNTRRST         BIT(2)
+#define GRSTCTL_HSFTRST            BIT(1)
+#define GRSTCTL_CSFTRST            BIT(0)
+
+#define GINTSTS                HSOTG_REG(0x014)
+#define GINTMSK                HSOTG_REG(0x018)
+#define GINTSTS_WKUPINT            BIT(31)
+#define GINTSTS_SESSREQINT         BIT(30)
+#define GINTSTS_DISCONNINT         BIT(29)
+#define GINTSTS_CONIDSTSCHNG       BIT(28)
+#define GINTSTS_LPMTRANRCVD        BIT(27)
+#define GINTSTS_PTXFEMP            BIT(26)
+#define GINTSTS_HCHINT             BIT(25)
+#define GINTSTS_PRTINT             BIT(24)
+#define GINTSTS_RESETDET           BIT(23)
+#define GINTSTS_FET_SUSP           BIT(22)
+#define GINTSTS_INCOMPL_IP         BIT(21)
+#define GINTSTS_INCOMPL_SOOUT      BIT(21)
+#define GINTSTS_INCOMPL_SOIN       BIT(20)
+#define GINTSTS_OEPINT             BIT(19)
+#define GINTSTS_IEPINT             BIT(18)
+#define GINTSTS_EPMIS              BIT(17)
+#define GINTSTS_RESTOREDONE        BIT(16)
+#define GINTSTS_EOPF               BIT(15)
+#define GINTSTS_ISOUTDROP          BIT(14)
+#define GINTSTS_ENUMDONE           BIT(13)
+#define GINTSTS_USBRST             BIT(12)
+#define GINTSTS_USBSUSP            BIT(11)
+#define GINTSTS_ERLYSUSP           BIT(10)
+#define GINTSTS_I2CINT             BIT(9)
+#define GINTSTS_ULPI_CK_INT        BIT(8)
+#define GINTSTS_GOUTNAKEFF         BIT(7)
+#define GINTSTS_GINNAKEFF          BIT(6)
+#define GINTSTS_NPTXFEMP           BIT(5)
+#define GINTSTS_RXFLVL             BIT(4)
+#define GINTSTS_SOF                BIT(3)
+#define GINTSTS_OTGINT             BIT(2)
+#define GINTSTS_MODEMIS            BIT(1)
+#define GINTSTS_CURMODE_HOST       BIT(0)
+
+#define GRXSTSR                HSOTG_REG(0x01C)
+#define GRXSTSP                HSOTG_REG(0x020)
+#define GRXSTS_FN_MASK             (0x7f << 25)
+#define GRXSTS_FN_SHIFT            25
+#define GRXSTS_PKTSTS_MASK         (0xf << 17)
+#define GRXSTS_PKTSTS_SHIFT        17
+#define GRXSTS_PKTSTS_GLOBALOUTNAK       1
+#define GRXSTS_PKTSTS_OUTRX              2
+#define GRXSTS_PKTSTS_HCHIN              2
+#define GRXSTS_PKTSTS_OUTDONE            3
+#define GRXSTS_PKTSTS_HCHIN_XFER_COMP    3
+#define GRXSTS_PKTSTS_SETUPDONE          4
+#define GRXSTS_PKTSTS_DATATOGGLEERR      5
+#define GRXSTS_PKTSTS_SETUPRX            6
+#define GRXSTS_PKTSTS_HCHHALTED          7
+#define GRXSTS_HCHNUM_MASK         (0xf << 0)
+#define GRXSTS_HCHNUM_SHIFT        0
+#define GRXSTS_DPID_MASK           (0x3 << 15)
+#define GRXSTS_DPID_SHIFT          15
+#define GRXSTS_BYTECNT_MASK        (0x7ff << 4)
+#define GRXSTS_BYTECNT_SHIFT       4
+#define GRXSTS_EPNUM_MASK          (0xf << 0)
+#define GRXSTS_EPNUM_SHIFT         0
+
+#define GRXFSIZ                    HSOTG_REG(0x024)
+#define GRXFSIZ_DEPTH_MASK         (0xffff << 0)
+#define GRXFSIZ_DEPTH_SHIFT        0
+
+#define GNPTXFSIZ            HSOTG_REG(0x028)
 /* Use FIFOSIZE_* constants to access this register */
 
-#define GNPTXSTS			HSOTG_REG(0x02C)
-#define GNPTXSTS_NP_TXQ_TOP_MASK		(0x7f << 24)
-#define GNPTXSTS_NP_TXQ_TOP_SHIFT		24
-#define GNPTXSTS_NP_TXQ_SPC_AVAIL_MASK		(0xff << 16)
-#define GNPTXSTS_NP_TXQ_SPC_AVAIL_SHIFT		16
-#define GNPTXSTS_NP_TXQ_SPC_AVAIL_GET(_v)	(((_v) >> 16) & 0xff)
-#define GNPTXSTS_NP_TXF_SPC_AVAIL_MASK		(0xffff << 0)
-#define GNPTXSTS_NP_TXF_SPC_AVAIL_SHIFT		0
-#define GNPTXSTS_NP_TXF_SPC_AVAIL_GET(_v)	(((_v) >> 0) & 0xffff)
-
-#define GI2CCTL				HSOTG_REG(0x0030)
-#define GI2CCTL_BSYDNE			BIT(31)
-#define GI2CCTL_RW			BIT(30)
-#define GI2CCTL_I2CDATSE0		BIT(28)
-#define GI2CCTL_I2CDEVADDR_MASK		(0x3 << 26)
-#define GI2CCTL_I2CDEVADDR_SHIFT	26
-#define GI2CCTL_I2CSUSPCTL		BIT(25)
-#define GI2CCTL_ACK			BIT(24)
-#define GI2CCTL_I2CEN			BIT(23)
-#define GI2CCTL_ADDR_MASK		(0x7f << 16)
-#define GI2CCTL_ADDR_SHIFT		16
-#define GI2CCTL_REGADDR_MASK		(0xff << 8)
-#define GI2CCTL_REGADDR_SHIFT		8
-#define GI2CCTL_RWDATA_MASK		(0xff << 0)
-#define GI2CCTL_RWDATA_SHIFT		0
-
-#define GPVNDCTL			HSOTG_REG(0x0034)
-#define GGPIO				HSOTG_REG(0x0038)
-#define GGPIO_STM32_OTG_GCCFG_PWRDWN	BIT(16)
-
-#define GUID				HSOTG_REG(0x003c)
-#define GSNPSID				HSOTG_REG(0x0040)
-#define GHWCFG1				HSOTG_REG(0x0044)
-#define GSNPSID_ID_MASK			GENMASK(31, 16)
-
-#define GHWCFG2				HSOTG_REG(0x0048)
-#define GHWCFG2_OTG_ENABLE_IC_USB		BIT(31)
-#define GHWCFG2_DEV_TOKEN_Q_DEPTH_MASK		(0x1f << 26)
-#define GHWCFG2_DEV_TOKEN_Q_DEPTH_SHIFT		26
-#define GHWCFG2_HOST_PERIO_TX_Q_DEPTH_MASK	(0x3 << 24)
-#define GHWCFG2_HOST_PERIO_TX_Q_DEPTH_SHIFT	24
-#define GHWCFG2_NONPERIO_TX_Q_DEPTH_MASK	(0x3 << 22)
-#define GHWCFG2_NONPERIO_TX_Q_DEPTH_SHIFT	22
-#define GHWCFG2_MULTI_PROC_INT			BIT(20)
-#define GHWCFG2_DYNAMIC_FIFO			BIT(19)
-#define GHWCFG2_PERIO_EP_SUPPORTED		BIT(18)
-#define GHWCFG2_NUM_HOST_CHAN_MASK		(0xf << 14)
-#define GHWCFG2_NUM_HOST_CHAN_SHIFT		14
-#define GHWCFG2_NUM_DEV_EP_MASK			(0xf << 10)
-#define GHWCFG2_NUM_DEV_EP_SHIFT		10
-#define GHWCFG2_FS_PHY_TYPE_MASK		(0x3 << 8)
-#define GHWCFG2_FS_PHY_TYPE_SHIFT		8
-#define GHWCFG2_FS_PHY_TYPE_NOT_SUPPORTED	0
-#define GHWCFG2_FS_PHY_TYPE_DEDICATED		1
-#define GHWCFG2_FS_PHY_TYPE_SHARED_UTMI		2
-#define GHWCFG2_FS_PHY_TYPE_SHARED_ULPI		3
-#define GHWCFG2_HS_PHY_TYPE_MASK		(0x3 << 6)
-#define GHWCFG2_HS_PHY_TYPE_SHIFT		6
-#define GHWCFG2_HS_PHY_TYPE_NOT_SUPPORTED	0
-#define GHWCFG2_HS_PHY_TYPE_UTMI		1
-#define GHWCFG2_HS_PHY_TYPE_ULPI		2
-#define GHWCFG2_HS_PHY_TYPE_UTMI_ULPI		3
-#define GHWCFG2_POINT2POINT			BIT(5)
-#define GHWCFG2_ARCHITECTURE_MASK		(0x3 << 3)
-#define GHWCFG2_ARCHITECTURE_SHIFT		3
-#define GHWCFG2_SLAVE_ONLY_ARCH			0
-#define GHWCFG2_EXT_DMA_ARCH			1
-#define GHWCFG2_INT_DMA_ARCH			2
-#define GHWCFG2_OP_MODE_MASK			(0x7 << 0)
-#define GHWCFG2_OP_MODE_SHIFT			0
-#define GHWCFG2_OP_MODE_HNP_SRP_CAPABLE		0
-#define GHWCFG2_OP_MODE_SRP_ONLY_CAPABLE	1
-#define GHWCFG2_OP_MODE_NO_HNP_SRP_CAPABLE	2
-#define GHWCFG2_OP_MODE_SRP_CAPABLE_DEVICE	3
-#define GHWCFG2_OP_MODE_NO_SRP_CAPABLE_DEVICE	4
-#define GHWCFG2_OP_MODE_SRP_CAPABLE_HOST	5
-#define GHWCFG2_OP_MODE_NO_SRP_CAPABLE_HOST	6
-#define GHWCFG2_OP_MODE_UNDEFINED		7
-
-#define GHWCFG3				HSOTG_REG(0x004c)
-#define GHWCFG3_DFIFO_DEPTH_MASK		(0xffff << 16)
-#define GHWCFG3_DFIFO_DEPTH_SHIFT		16
-#define GHWCFG3_OTG_LPM_EN			BIT(15)
-#define GHWCFG3_BC_SUPPORT			BIT(14)
-#define GHWCFG3_OTG_ENABLE_HSIC			BIT(13)
-#define GHWCFG3_ADP_SUPP			BIT(12)
-#define GHWCFG3_SYNCH_RESET_TYPE		BIT(11)
-#define GHWCFG3_OPTIONAL_FEATURES		BIT(10)
-#define GHWCFG3_VENDOR_CTRL_IF			BIT(9)
-#define GHWCFG3_I2C				BIT(8)
-#define GHWCFG3_OTG_FUNC			BIT(7)
-#define GHWCFG3_PACKET_SIZE_CNTR_WIDTH_MASK	(0x7 << 4)
-#define GHWCFG3_PACKET_SIZE_CNTR_WIDTH_SHIFT	4
-#define GHWCFG3_XFER_SIZE_CNTR_WIDTH_MASK	(0xf << 0)
-#define GHWCFG3_XFER_SIZE_CNTR_WIDTH_SHIFT	0
-
-#define GHWCFG4				HSOTG_REG(0x0050)
-#define GHWCFG4_DESC_DMA_DYN			BIT(31)
-#define GHWCFG4_DESC_DMA			BIT(30)
-#define GHWCFG4_NUM_IN_EPS_MASK			(0xf << 26)
-#define GHWCFG4_NUM_IN_EPS_SHIFT		26
-#define GHWCFG4_DED_FIFO_EN			BIT(25)
-#define GHWCFG4_DED_FIFO_SHIFT		25
-#define GHWCFG4_SESSION_END_FILT_EN		BIT(24)
-#define GHWCFG4_B_VALID_FILT_EN			BIT(23)
-#define GHWCFG4_A_VALID_FILT_EN			BIT(22)
-#define GHWCFG4_VBUS_VALID_FILT_EN		BIT(21)
-#define GHWCFG4_IDDIG_FILT_EN			BIT(20)
-#define GHWCFG4_NUM_DEV_MODE_CTRL_EP_MASK	(0xf << 16)
-#define GHWCFG4_NUM_DEV_MODE_CTRL_EP_SHIFT	16
-#define GHWCFG4_UTMI_PHY_DATA_WIDTH_MASK	(0x3 << 14)
-#define GHWCFG4_UTMI_PHY_DATA_WIDTH_SHIFT	14
-#define GHWCFG4_UTMI_PHY_DATA_WIDTH_8		0
-#define GHWCFG4_UTMI_PHY_DATA_WIDTH_16		1
-#define GHWCFG4_UTMI_PHY_DATA_WIDTH_8_OR_16	2
-#define GHWCFG4_ACG_SUPPORTED			BIT(12)
-#define GHWCFG4_IPG_ISOC_SUPPORTED		BIT(11)
-#define GHWCFG4_SERVICE_INTERVAL_SUPPORTED      BIT(10)
-#define GHWCFG4_XHIBER				BIT(7)
-#define GHWCFG4_HIBER				BIT(6)
-#define GHWCFG4_MIN_AHB_FREQ			BIT(5)
-#define GHWCFG4_POWER_OPTIMIZ			BIT(4)
-#define GHWCFG4_NUM_DEV_PERIO_IN_EP_MASK	(0xf << 0)
-#define GHWCFG4_NUM_DEV_PERIO_IN_EP_SHIFT	0
-
-#define GLPMCFG				HSOTG_REG(0x0054)
-#define GLPMCFG_INVSELHSIC		BIT(31)
-#define GLPMCFG_HSICCON			BIT(30)
-#define GLPMCFG_RSTRSLPSTS		BIT(29)
-#define GLPMCFG_ENBESL			BIT(28)
-#define GLPMCFG_LPM_RETRYCNT_STS_MASK	(0x7 << 25)
-#define GLPMCFG_LPM_RETRYCNT_STS_SHIFT	25
-#define GLPMCFG_SNDLPM			BIT(24)
-#define GLPMCFG_RETRY_CNT_MASK		(0x7 << 21)
-#define GLPMCFG_RETRY_CNT_SHIFT		21
-#define GLPMCFG_LPM_REJECT_CTRL_CONTROL	BIT(21)
-#define GLPMCFG_LPM_ACCEPT_CTRL_ISOC	BIT(22)
-#define GLPMCFG_LPM_CHNL_INDX_MASK	(0xf << 17)
-#define GLPMCFG_LPM_CHNL_INDX_SHIFT	17
-#define GLPMCFG_L1RESUMEOK		BIT(16)
-#define GLPMCFG_SLPSTS			BIT(15)
-#define GLPMCFG_COREL1RES_MASK		(0x3 << 13)
-#define GLPMCFG_COREL1RES_SHIFT		13
-#define GLPMCFG_HIRD_THRES_MASK		(0x1f << 8)
-#define GLPMCFG_HIRD_THRES_SHIFT	8
-#define GLPMCFG_HIRD_THRES_EN		(0x10 << 8)
-#define GLPMCFG_ENBLSLPM		BIT(7)
-#define GLPMCFG_BREMOTEWAKE		BIT(6)
-#define GLPMCFG_HIRD_MASK		(0xf << 2)
-#define GLPMCFG_HIRD_SHIFT		2
-#define GLPMCFG_APPL1RES		BIT(1)
-#define GLPMCFG_LPMCAP			BIT(0)
-
-#define GPWRDN				HSOTG_REG(0x0058)
-#define GPWRDN_MULT_VAL_ID_BC_MASK	(0x1f << 24)
-#define GPWRDN_MULT_VAL_ID_BC_SHIFT	24
-#define GPWRDN_ADP_INT			BIT(23)
-#define GPWRDN_BSESSVLD			BIT(22)
-#define GPWRDN_IDSTS			BIT(21)
-#define GPWRDN_LINESTATE_MASK		(0x3 << 19)
-#define GPWRDN_LINESTATE_SHIFT		19
-#define GPWRDN_STS_CHGINT_MSK		BIT(18)
-#define GPWRDN_STS_CHGINT		BIT(17)
-#define GPWRDN_SRP_DET_MSK		BIT(16)
-#define GPWRDN_SRP_DET			BIT(15)
-#define GPWRDN_CONNECT_DET_MSK		BIT(14)
-#define GPWRDN_CONNECT_DET		BIT(13)
-#define GPWRDN_DISCONN_DET_MSK		BIT(12)
-#define GPWRDN_DISCONN_DET		BIT(11)
-#define GPWRDN_RST_DET_MSK		BIT(10)
-#define GPWRDN_RST_DET			BIT(9)
-#define GPWRDN_LNSTSCHG_MSK		BIT(8)
-#define GPWRDN_LNSTSCHG			BIT(7)
-#define GPWRDN_DIS_VBUS			BIT(6)
-#define GPWRDN_PWRDNSWTCH		BIT(5)
-#define GPWRDN_PWRDNRSTN		BIT(4)
-#define GPWRDN_PWRDNCLMP		BIT(3)
-#define GPWRDN_RESTORE			BIT(2)
-#define GPWRDN_PMUACTV			BIT(1)
-#define GPWRDN_PMUINTSEL		BIT(0)
-
-#define GDFIFOCFG			HSOTG_REG(0x005c)
-#define GDFIFOCFG_EPINFOBASE_MASK	(0xffff << 16)
-#define GDFIFOCFG_EPINFOBASE_SHIFT	16
-#define GDFIFOCFG_GDFIFOCFG_MASK	(0xffff << 0)
-#define GDFIFOCFG_GDFIFOCFG_SHIFT	0
-
-#define ADPCTL				HSOTG_REG(0x0060)
-#define ADPCTL_AR_MASK			(0x3 << 27)
-#define ADPCTL_AR_SHIFT			27
-#define ADPCTL_ADP_TMOUT_INT_MSK	BIT(26)
-#define ADPCTL_ADP_SNS_INT_MSK		BIT(25)
-#define ADPCTL_ADP_PRB_INT_MSK		BIT(24)
-#define ADPCTL_ADP_TMOUT_INT		BIT(23)
-#define ADPCTL_ADP_SNS_INT		BIT(22)
-#define ADPCTL_ADP_PRB_INT		BIT(21)
-#define ADPCTL_ADPENA			BIT(20)
-#define ADPCTL_ADPRES			BIT(19)
-#define ADPCTL_ENASNS			BIT(18)
-#define ADPCTL_ENAPRB			BIT(17)
-#define ADPCTL_RTIM_MASK		(0x7ff << 6)
-#define ADPCTL_RTIM_SHIFT		6
-#define ADPCTL_PRB_PER_MASK		(0x3 << 4)
-#define ADPCTL_PRB_PER_SHIFT		4
-#define ADPCTL_PRB_DELTA_MASK		(0x3 << 2)
-#define ADPCTL_PRB_DELTA_SHIFT		2
-#define ADPCTL_PRB_DSCHRG_MASK		(0x3 << 0)
-#define ADPCTL_PRB_DSCHRG_SHIFT		0
-
-#define GREFCLK				    HSOTG_REG(0x0064)
-#define GREFCLK_REFCLKPER_MASK		    (0x1ffff << 15)
-#define GREFCLK_REFCLKPER_SHIFT		    15
-#define GREFCLK_REF_CLK_MODE		    BIT(14)
-#define GREFCLK_SOF_CNT_WKUP_ALERT_MASK	    (0x3ff)
-#define GREFCLK_SOF_CNT_WKUP_ALERT_SHIFT    0
-
-#define GINTMSK2			HSOTG_REG(0x0068)
-#define GINTMSK2_WKUP_ALERT_INT_MSK	BIT(0)
-
-#define GINTSTS2			HSOTG_REG(0x006c)
-#define GINTSTS2_WKUP_ALERT_INT		BIT(0)
-
-#define HPTXFSIZ			HSOTG_REG(0x100)
+#define GNPTXSTS             HSOTG_REG(0x02C)
+#define GNPTXSTS_NP_TXQ_TOP_MASK             (0x7f << 24)
+#define GNPTXSTS_NP_TXQ_TOP_SHIFT            24
+#define GNPTXSTS_NP_TXQ_SPC_AVAIL_MASK       (0xff << 16)
+#define GNPTXSTS_NP_TXQ_SPC_AVAIL_SHIFT      16
+#define GNPTXSTS_NP_TXQ_SPC_AVAIL_GET(_v)    (((_v) >> 16) & 0xff)
+#define GNPTXSTS_NP_TXF_SPC_AVAIL_MASK       (0xffff << 0)
+#define GNPTXSTS_NP_TXF_SPC_AVAIL_SHIFT      0
+#define GNPTXSTS_NP_TXF_SPC_AVAIL_GET(_v)    (((_v) >> 0) & 0xffff)
+
+#define GI2CCTL                     HSOTG_REG(0x0030)
+#define GI2CCTL_BSYDNE              BIT(31)
+#define GI2CCTL_RW                  BIT(30)
+#define GI2CCTL_I2CDATSE0           BIT(28)
+#define GI2CCTL_I2CDEVADDR_MASK     (0x3 << 26)
+#define GI2CCTL_I2CDEVADDR_SHIFT    26
+#define GI2CCTL_I2CSUSPCTL          BIT(25)
+#define GI2CCTL_ACK                 BIT(24)
+#define GI2CCTL_I2CEN               BIT(23)
+#define GI2CCTL_ADDR_MASK           (0x7f << 16)
+#define GI2CCTL_ADDR_SHIFT          16
+#define GI2CCTL_REGADDR_MASK        (0xff << 8)
+#define GI2CCTL_REGADDR_SHIFT       8
+#define GI2CCTL_RWDATA_MASK         (0xff << 0)
+#define GI2CCTL_RWDATA_SHIFT        0
+
+#define GPVNDCTL               HSOTG_REG(0x0034)
+#define GGPIO                  HSOTG_REG(0x0038)
+#define GGPIO_STM32_OTG_GCCFG_PWRDWN    BIT(16)
+
+#define GUID                   HSOTG_REG(0x003c)
+#define GSNPSID                HSOTG_REG(0x0040)
+#define GHWCFG1                HSOTG_REG(0x0044)
+#define GSNPSID_ID_MASK        GENMASK(31, 16)
+
+#define GHWCFG2                HSOTG_REG(0x0048)
+#define GHWCFG2_OTG_ENABLE_IC_USB             BIT(31)
+#define GHWCFG2_DEV_TOKEN_Q_DEPTH_MASK        (0x1f << 26)
+#define GHWCFG2_DEV_TOKEN_Q_DEPTH_SHIFT       26
+#define GHWCFG2_HOST_PERIO_TX_Q_DEPTH_MASK    (0x3 << 24)
+#define GHWCFG2_HOST_PERIO_TX_Q_DEPTH_SHIFT   24
+#define GHWCFG2_NONPERIO_TX_Q_DEPTH_MASK      (0x3 << 22)
+#define GHWCFG2_NONPERIO_TX_Q_DEPTH_SHIFT     22
+#define GHWCFG2_MULTI_PROC_INT                BIT(20)
+#define GHWCFG2_DYNAMIC_FIFO                  BIT(19)
+#define GHWCFG2_PERIO_EP_SUPPORTED            BIT(18)
+#define GHWCFG2_NUM_HOST_CHAN_MASK            (0xf << 14)
+#define GHWCFG2_NUM_HOST_CHAN_SHIFT           14
+#define GHWCFG2_NUM_DEV_EP_MASK               (0xf << 10)
+#define GHWCFG2_NUM_DEV_EP_SHIFT              10
+#define GHWCFG2_FS_PHY_TYPE_MASK              (0x3 << 8)
+#define GHWCFG2_FS_PHY_TYPE_SHIFT             8
+#define GHWCFG2_FS_PHY_TYPE_NOT_SUPPORTED     0
+#define GHWCFG2_FS_PHY_TYPE_DEDICATED         1
+#define GHWCFG2_FS_PHY_TYPE_SHARED_UTMI       2
+#define GHWCFG2_FS_PHY_TYPE_SHARED_ULPI       3
+#define GHWCFG2_HS_PHY_TYPE_MASK              (0x3 << 6)
+#define GHWCFG2_HS_PHY_TYPE_SHIFT             6
+#define GHWCFG2_HS_PHY_TYPE_NOT_SUPPORTED     0
+#define GHWCFG2_HS_PHY_TYPE_UTMI              1
+#define GHWCFG2_HS_PHY_TYPE_ULPI              2
+#define GHWCFG2_HS_PHY_TYPE_UTMI_ULPI         3
+#define GHWCFG2_POINT2POINT                      BIT(5)
+#define GHWCFG2_ARCHITECTURE_MASK                (0x3 << 3)
+#define GHWCFG2_ARCHITECTURE_SHIFT               3
+#define GHWCFG2_SLAVE_ONLY_ARCH                  0
+#define GHWCFG2_EXT_DMA_ARCH                     1
+#define GHWCFG2_INT_DMA_ARCH                     2
+#define GHWCFG2_OP_MODE_MASK                     (0x7 << 0)
+#define GHWCFG2_OP_MODE_SHIFT                    0
+#define GHWCFG2_OP_MODE_HNP_SRP_CAPABLE          0
+#define GHWCFG2_OP_MODE_SRP_ONLY_CAPABLE         1
+#define GHWCFG2_OP_MODE_NO_HNP_SRP_CAPABLE       2
+#define GHWCFG2_OP_MODE_SRP_CAPABLE_DEVICE       3
+#define GHWCFG2_OP_MODE_NO_SRP_CAPABLE_DEVICE    4
+#define GHWCFG2_OP_MODE_SRP_CAPABLE_HOST         5
+#define GHWCFG2_OP_MODE_NO_SRP_CAPABLE_HOST      6
+#define GHWCFG2_OP_MODE_UNDEFINED                7
+
+#define GHWCFG3                           HSOTG_REG(0x004c)
+#define GHWCFG3_DFIFO_DEPTH_MASK          (0xffff << 16)
+#define GHWCFG3_DFIFO_DEPTH_SHIFT         16
+#define GHWCFG3_OTG_LPM_EN                BIT(15)
+#define GHWCFG3_BC_SUPPORT                BIT(14)
+#define GHWCFG3_OTG_ENABLE_HSIC           BIT(13)
+#define GHWCFG3_ADP_SUPP                  BIT(12)
+#define GHWCFG3_SYNCH_RESET_TYPE          BIT(11)
+#define GHWCFG3_OPTIONAL_FEATURES         BIT(10)
+#define GHWCFG3_VENDOR_CTRL_IF            BIT(9)
+#define GHWCFG3_I2C                       BIT(8)
+#define GHWCFG3_OTG_FUNC                  BIT(7)
+#define GHWCFG3_PACKET_SIZE_CNTR_WIDTH_MASK    (0x7 << 4)
+#define GHWCFG3_PACKET_SIZE_CNTR_WIDTH_SHIFT   4
+#define GHWCFG3_XFER_SIZE_CNTR_WIDTH_MASK      (0xf << 0)
+#define GHWCFG3_XFER_SIZE_CNTR_WIDTH_SHIFT     0
+
+#define GHWCFG4                              HSOTG_REG(0x0050)
+#define GHWCFG4_DESC_DMA_DYN                 BIT(31)
+#define GHWCFG4_DESC_DMA                     BIT(30)
+#define GHWCFG4_NUM_IN_EPS_MASK              (0xf << 26)
+#define GHWCFG4_NUM_IN_EPS_SHIFT             26
+#define GHWCFG4_DED_FIFO_EN                  BIT(25)
+#define GHWCFG4_DED_FIFO_SHIFT               25
+#define GHWCFG4_SESSION_END_FILT_EN          BIT(24)
+#define GHWCFG4_B_VALID_FILT_EN              BIT(23)
+#define GHWCFG4_A_VALID_FILT_EN              BIT(22)
+#define GHWCFG4_VBUS_VALID_FILT_EN           BIT(21)
+#define GHWCFG4_IDDIG_FILT_EN                BIT(20)
+#define GHWCFG4_NUM_DEV_MODE_CTRL_EP_MASK    (0xf << 16)
+#define GHWCFG4_NUM_DEV_MODE_CTRL_EP_SHIFT   16
+#define GHWCFG4_UTMI_PHY_DATA_WIDTH_MASK     (0x3 << 14)
+#define GHWCFG4_UTMI_PHY_DATA_WIDTH_SHIFT    14
+#define GHWCFG4_UTMI_PHY_DATA_WIDTH_8        0
+#define GHWCFG4_UTMI_PHY_DATA_WIDTH_16       1
+#define GHWCFG4_UTMI_PHY_DATA_WIDTH_8_OR_16  2
+#define GHWCFG4_ACG_SUPPORTED                BIT(12)
+#define GHWCFG4_IPG_ISOC_SUPPORTED           BIT(11)
+#define GHWCFG4_SERVICE_INTERVAL_SUPPORTED   BIT(10)
+#define GHWCFG4_XHIBER                       BIT(7)
+#define GHWCFG4_HIBER                        BIT(6)
+#define GHWCFG4_MIN_AHB_FREQ                 BIT(5)
+#define GHWCFG4_POWER_OPTIMIZ                BIT(4)
+#define GHWCFG4_NUM_DEV_PERIO_IN_EP_MASK     (0xf << 0)
+#define GHWCFG4_NUM_DEV_PERIO_IN_EP_SHIFT    0
+
+#define GLPMCFG                           HSOTG_REG(0x0054)
+#define GLPMCFG_INVSELHSIC                BIT(31)
+#define GLPMCFG_HSICCON                   BIT(30)
+#define GLPMCFG_RSTRSLPSTS                BIT(29)
+#define GLPMCFG_ENBESL                    BIT(28)
+#define GLPMCFG_LPM_RETRYCNT_STS_MASK     (0x7 << 25)
+#define GLPMCFG_LPM_RETRYCNT_STS_SHIFT    25
+#define GLPMCFG_SNDLPM                    BIT(24)
+#define GLPMCFG_RETRY_CNT_MASK            (0x7 << 21)
+#define GLPMCFG_RETRY_CNT_SHIFT           21
+#define GLPMCFG_LPM_REJECT_CTRL_CONTROL   BIT(21)
+#define GLPMCFG_LPM_ACCEPT_CTRL_ISOC   BIT(22)
+#define GLPMCFG_LPM_CHNL_INDX_MASK     (0xf << 17)
+#define GLPMCFG_LPM_CHNL_INDX_SHIFT    17
+#define GLPMCFG_L1RESUMEOK             BIT(16)
+#define GLPMCFG_SLPSTS                 BIT(15)
+#define GLPMCFG_COREL1RES_MASK         (0x3 << 13)
+#define GLPMCFG_COREL1RES_SHIFT        13
+#define GLPMCFG_HIRD_THRES_MASK        (0x1f << 8)
+#define GLPMCFG_HIRD_THRES_SHIFT       8
+#define GLPMCFG_HIRD_THRES_EN          (0x10 << 8)
+#define GLPMCFG_ENBLSLPM               BIT(7)
+#define GLPMCFG_BREMOTEWAKE            BIT(6)
+#define GLPMCFG_HIRD_MASK              (0xf << 2)
+#define GLPMCFG_HIRD_SHIFT             2
+#define GLPMCFG_APPL1RES               BIT(1)
+#define GLPMCFG_LPMCAP                 BIT(0)
+
+#define GPWRDN                      HSOTG_REG(0x0058)
+#define GPWRDN_MULT_VAL_ID_BC_MASK    (0x1f << 24)
+#define GPWRDN_MULT_VAL_ID_BC_SHIFT   24
+#define GPWRDN_ADP_INT              BIT(23)
+#define GPWRDN_BSESSVLD             BIT(22)
+#define GPWRDN_IDSTS                BIT(21)
+#define GPWRDN_LINESTATE_MASK       (0x3 << 19)
+#define GPWRDN_LINESTATE_SHIFT      19
+#define GPWRDN_STS_CHGINT_MSK       BIT(18)
+#define GPWRDN_STS_CHGINT           BIT(17)
+#define GPWRDN_SRP_DET_MSK          BIT(16)
+#define GPWRDN_SRP_DET              BIT(15)
+#define GPWRDN_CONNECT_DET_MSK      BIT(14)
+#define GPWRDN_CONNECT_DET          BIT(13)
+#define GPWRDN_DISCONN_DET_MSK      BIT(12)
+#define GPWRDN_DISCONN_DET          BIT(11)
+#define GPWRDN_RST_DET_MSK          BIT(10)
+#define GPWRDN_RST_DET              BIT(9)
+#define GPWRDN_LNSTSCHG_MSK         BIT(8)
+#define GPWRDN_LNSTSCHG             BIT(7)
+#define GPWRDN_DIS_VBUS             BIT(6)
+#define GPWRDN_PWRDNSWTCH           BIT(5)
+#define GPWRDN_PWRDNRSTN            BIT(4)
+#define GPWRDN_PWRDNCLMP            BIT(3)
+#define GPWRDN_RESTORE              BIT(2)
+#define GPWRDN_PMUACTV              BIT(1)
+#define GPWRDN_PMUINTSEL            BIT(0)
+
+#define GDFIFOCFG                   HSOTG_REG(0x005c)
+#define GDFIFOCFG_EPINFOBASE_MASK   (0xffff << 16)
+#define GDFIFOCFG_EPINFOBASE_SHIFT  16
+#define GDFIFOCFG_GDFIFOCFG_MASK    (0xffff << 0)
+#define GDFIFOCFG_GDFIFOCFG_SHIFT   0
+
+#define ADPCTL                      HSOTG_REG(0x0060)
+#define ADPCTL_AR_MASK              (0x3 << 27)
+#define ADPCTL_AR_SHIFT             27
+#define ADPCTL_ADP_TMOUT_INT_MSK    BIT(26)
+#define ADPCTL_ADP_SNS_INT_MSK      BIT(25)
+#define ADPCTL_ADP_PRB_INT_MSK      BIT(24)
+#define ADPCTL_ADP_TMOUT_INT        BIT(23)
+#define ADPCTL_ADP_SNS_INT          BIT(22)
+#define ADPCTL_ADP_PRB_INT          BIT(21)
+#define ADPCTL_ADPENA               BIT(20)
+#define ADPCTL_ADPRES               BIT(19)
+#define ADPCTL_ENASNS               BIT(18)
+#define ADPCTL_ENAPRB               BIT(17)
+#define ADPCTL_RTIM_MASK            (0x7ff << 6)
+#define ADPCTL_RTIM_SHIFT           6
+#define ADPCTL_PRB_PER_MASK         (0x3 << 4)
+#define ADPCTL_PRB_PER_SHIFT        4
+#define ADPCTL_PRB_DELTA_MASK       (0x3 << 2)
+#define ADPCTL_PRB_DELTA_SHIFT      2
+#define ADPCTL_PRB_DSCHRG_MASK      (0x3 << 0)
+#define ADPCTL_PRB_DSCHRG_SHIFT     0
+
+#define GREFCLK                            HSOTG_REG(0x0064)
+#define GREFCLK_REFCLKPER_MASK             (0x1ffff << 15)
+#define GREFCLK_REFCLKPER_SHIFT            15
+#define GREFCLK_REF_CLK_MODE               BIT(14)
+#define GREFCLK_SOF_CNT_WKUP_ALERT_MASK    (0x3ff)
+#define GREFCLK_SOF_CNT_WKUP_ALERT_SHIFT   0
+
+#define GINTMSK2            HSOTG_REG(0x0068)
+#define GINTMSK2_WKUP_ALERT_INT_MSK    BIT(0)
+
+#define GINTSTS2            HSOTG_REG(0x006c)
+#define GINTSTS2_WKUP_ALERT_INT        BIT(0)
+
+#define HPTXFSIZ            HSOTG_REG(0x100)
 /* Use FIFOSIZE_* constants to access this register */
 
-#define DPTXFSIZN(_a)			HSOTG_REG(0x104 + (((_a) - 1) * 4))
+#define DPTXFSIZN(_a)            HSOTG_REG(0x104 + (((_a) - 1) * 4))
 /* Use FIFOSIZE_* constants to access this register */
 
 /* These apply to the GNPTXFSIZ, HPTXFSIZ and DPTXFSIZN registers */
-#define FIFOSIZE_DEPTH_MASK		(0xffff << 16)
-#define FIFOSIZE_DEPTH_SHIFT		16
-#define FIFOSIZE_STARTADDR_MASK		(0xffff << 0)
-#define FIFOSIZE_STARTADDR_SHIFT	0
-#define FIFOSIZE_DEPTH_GET(_x)		(((_x) >> 16) & 0xffff)
+#define FIFOSIZE_DEPTH_MASK         (0xffff << 16)
+#define FIFOSIZE_DEPTH_SHIFT        16
+#define FIFOSIZE_STARTADDR_MASK     (0xffff << 0)
+#define FIFOSIZE_STARTADDR_SHIFT    0
+#define FIFOSIZE_DEPTH_GET(_x)      (((_x) >> 16) & 0xffff)
 
 /* Device mode registers */
 
-#define DCFG				HSOTG_REG(0x800)
-#define DCFG_DESCDMA_EN			BIT(23)
-#define DCFG_EPMISCNT_MASK		(0x1f << 18)
-#define DCFG_EPMISCNT_SHIFT		18
-#define DCFG_EPMISCNT_LIMIT		0x1f
-#define DCFG_EPMISCNT(_x)		((_x) << 18)
-#define DCFG_IPG_ISOC_SUPPORDED		BIT(17)
-#define DCFG_PERFRINT_MASK		(0x3 << 11)
-#define DCFG_PERFRINT_SHIFT		11
-#define DCFG_PERFRINT_LIMIT		0x3
-#define DCFG_PERFRINT(_x)		((_x) << 11)
-#define DCFG_DEVADDR_MASK		(0x7f << 4)
-#define DCFG_DEVADDR_SHIFT		4
-#define DCFG_DEVADDR_LIMIT		0x7f
-#define DCFG_DEVADDR(_x)		((_x) << 4)
-#define DCFG_NZ_STS_OUT_HSHK		BIT(2)
-#define DCFG_DEVSPD_MASK		(0x3 << 0)
-#define DCFG_DEVSPD_SHIFT		0
-#define DCFG_DEVSPD_HS			0
-#define DCFG_DEVSPD_FS			1
-#define DCFG_DEVSPD_LS			2
-#define DCFG_DEVSPD_FS48		3
-
-#define DCTL				HSOTG_REG(0x804)
+#define DCFG                     HSOTG_REG(0x800)
+#define DCFG_DESCDMA_EN          BIT(23)
+#define DCFG_EPMISCNT_MASK       (0x1f << 18)
+#define DCFG_EPMISCNT_SHIFT      18
+#define DCFG_EPMISCNT_LIMIT      0x1f
+#define DCFG_EPMISCNT(_x)        ((_x) << 18)
+#define DCFG_IPG_ISOC_SUPPORDED  BIT(17)
+#define DCFG_PERFRINT_MASK       (0x3 << 11)
+#define DCFG_PERFRINT_SHIFT      11
+#define DCFG_PERFRINT_LIMIT      0x3
+#define DCFG_PERFRINT(_x)        ((_x) << 11)
+#define DCFG_DEVADDR_MASK        (0x7f << 4)
+#define DCFG_DEVADDR_SHIFT       4
+#define DCFG_DEVADDR_LIMIT       0x7f
+#define DCFG_DEVADDR(_x)         ((_x) << 4)
+#define DCFG_NZ_STS_OUT_HSHK     BIT(2)
+#define DCFG_DEVSPD_MASK         (0x3 << 0)
+#define DCFG_DEVSPD_SHIFT        0
+#define DCFG_DEVSPD_HS           0
+#define DCFG_DEVSPD_FS           1
+#define DCFG_DEVSPD_LS           2
+#define DCFG_DEVSPD_FS48         3
+
+#define DCTL                     HSOTG_REG(0x804)
 #define DCTL_SERVICE_INTERVAL_SUPPORTED BIT(19)
-#define DCTL_PWRONPRGDONE		BIT(11)
-#define DCTL_CGOUTNAK			BIT(10)
-#define DCTL_SGOUTNAK			BIT(9)
-#define DCTL_CGNPINNAK			BIT(8)
-#define DCTL_SGNPINNAK			BIT(7)
-#define DCTL_TSTCTL_MASK		(0x7 << 4)
-#define DCTL_TSTCTL_SHIFT		4
-#define DCTL_GOUTNAKSTS			BIT(3)
-#define DCTL_GNPINNAKSTS		BIT(2)
-#define DCTL_SFTDISCON			BIT(1)
-#define DCTL_RMTWKUPSIG			BIT(0)
-
-#define DSTS				HSOTG_REG(0x808)
-#define DSTS_SOFFN_MASK			(0x3fff << 8)
-#define DSTS_SOFFN_SHIFT		8
-#define DSTS_SOFFN_LIMIT		0x3fff
-#define DSTS_SOFFN(_x)			((_x) << 8)
-#define DSTS_ERRATICERR			BIT(3)
-#define DSTS_ENUMSPD_MASK		(0x3 << 1)
-#define DSTS_ENUMSPD_SHIFT		1
-#define DSTS_ENUMSPD_HS			0
-#define DSTS_ENUMSPD_FS			1
-#define DSTS_ENUMSPD_LS			2
-#define DSTS_ENUMSPD_FS48		3
-#define DSTS_SUSPSTS			BIT(0)
-
-#define DIEPMSK				HSOTG_REG(0x810)
-#define DIEPMSK_NAKMSK			BIT(13)
-#define DIEPMSK_BNAININTRMSK		BIT(9)
-#define DIEPMSK_TXFIFOUNDRNMSK		BIT(8)
-#define DIEPMSK_TXFIFOEMPTY		BIT(7)
-#define DIEPMSK_INEPNAKEFFMSK		BIT(6)
-#define DIEPMSK_INTKNEPMISMSK		BIT(5)
-#define DIEPMSK_INTKNTXFEMPMSK		BIT(4)
-#define DIEPMSK_TIMEOUTMSK		BIT(3)
-#define DIEPMSK_AHBERRMSK		BIT(2)
-#define DIEPMSK_EPDISBLDMSK		BIT(1)
-#define DIEPMSK_XFERCOMPLMSK		BIT(0)
-
-#define DOEPMSK				HSOTG_REG(0x814)
-#define DOEPMSK_BNAMSK			BIT(9)
-#define DOEPMSK_BACK2BACKSETUP		BIT(6)
-#define DOEPMSK_STSPHSERCVDMSK		BIT(5)
-#define DOEPMSK_OUTTKNEPDISMSK		BIT(4)
-#define DOEPMSK_SETUPMSK		BIT(3)
-#define DOEPMSK_AHBERRMSK		BIT(2)
-#define DOEPMSK_EPDISBLDMSK		BIT(1)
-#define DOEPMSK_XFERCOMPLMSK		BIT(0)
-
-#define DAINT				HSOTG_REG(0x818)
-#define DAINTMSK			HSOTG_REG(0x81C)
-#define DAINT_OUTEP_SHIFT		16
-#define DAINT_OUTEP(_x)			(1 << ((_x) + 16))
-#define DAINT_INEP(_x)			(1 << (_x))
-
-#define DTKNQR1				HSOTG_REG(0x820)
-#define DTKNQR2				HSOTG_REG(0x824)
-#define DTKNQR3				HSOTG_REG(0x830)
-#define DTKNQR4				HSOTG_REG(0x834)
-#define DIEPEMPMSK			HSOTG_REG(0x834)
-
-#define DVBUSDIS			HSOTG_REG(0x828)
-#define DVBUSPULSE			HSOTG_REG(0x82C)
-
-#define DIEPCTL0			HSOTG_REG(0x900)
-#define DIEPCTL(_a)			HSOTG_REG(0x900 + ((_a) * 0x20))
-
-#define DOEPCTL0			HSOTG_REG(0xB00)
-#define DOEPCTL(_a)			HSOTG_REG(0xB00 + ((_a) * 0x20))
+#define DCTL_PWRONPRGDONE        BIT(11)
+#define DCTL_CGOUTNAK            BIT(10)
+#define DCTL_SGOUTNAK            BIT(9)
+#define DCTL_CGNPINNAK           BIT(8)
+#define DCTL_SGNPINNAK           BIT(7)
+#define DCTL_TSTCTL_MASK         (0x7 << 4)
+#define DCTL_TSTCTL_SHIFT        4
+#define DCTL_GOUTNAKSTS          BIT(3)
+#define DCTL_GNPINNAKSTS         BIT(2)
+#define DCTL_SFTDISCON           BIT(1)
+#define DCTL_RMTWKUPSIG          BIT(0)
+
+#define DSTS                     HSOTG_REG(0x808)
+#define DSTS_SOFFN_MASK          (0x3fff << 8)
+#define DSTS_SOFFN_SHIFT         8
+#define DSTS_SOFFN_LIMIT         0x3fff
+#define DSTS_SOFFN(_x)           ((_x) << 8)
+#define DSTS_ERRATICERR          BIT(3)
+#define DSTS_ENUMSPD_MASK        (0x3 << 1)
+#define DSTS_ENUMSPD_SHIFT       1
+#define DSTS_ENUMSPD_HS          0
+#define DSTS_ENUMSPD_FS          1
+#define DSTS_ENUMSPD_LS          2
+#define DSTS_ENUMSPD_FS48        3
+#define DSTS_SUSPSTS             BIT(0)
+
+#define DIEPMSK                       HSOTG_REG(0x810)
+#define DIEPMSK_NAKMSK                BIT(13)
+#define DIEPMSK_BNAININTRMSK          BIT(9)
+#define DIEPMSK_TXFIFOUNDRNMSK        BIT(8)
+#define DIEPMSK_TXFIFOEMPTY           BIT(7)
+#define DIEPMSK_INEPNAKEFFMSK         BIT(6)
+#define DIEPMSK_INTKNEPMISMSK         BIT(5)
+#define DIEPMSK_INTKNTXFEMPMSK        BIT(4)
+#define DIEPMSK_TIMEOUTMSK            BIT(3)
+#define DIEPMSK_AHBERRMSK             BIT(2)
+#define DIEPMSK_EPDISBLDMSK           BIT(1)
+#define DIEPMSK_XFERCOMPLMSK          BIT(0)
+
+#define DOEPMSK                       HSOTG_REG(0x814)
+#define DOEPMSK_BNAMSK                BIT(9)
+#define DOEPMSK_BACK2BACKSETUP        BIT(6)
+#define DOEPMSK_STSPHSERCVDMSK        BIT(5)
+#define DOEPMSK_OUTTKNEPDISMSK        BIT(4)
+#define DOEPMSK_SETUPMSK              BIT(3)
+#define DOEPMSK_AHBERRMSK             BIT(2)
+#define DOEPMSK_EPDISBLDMSK           BIT(1)
+#define DOEPMSK_XFERCOMPLMSK          BIT(0)
+
+#define DAINT                  HSOTG_REG(0x818)
+#define DAINTMSK               HSOTG_REG(0x81C)
+#define DAINT_OUTEP_SHIFT      16
+#define DAINT_OUTEP(_x)        (1 << ((_x) + 16))
+#define DAINT_INEP(_x)         (1 << (_x))
+
+#define DTKNQR1                HSOTG_REG(0x820)
+#define DTKNQR2                HSOTG_REG(0x824)
+#define DTKNQR3                HSOTG_REG(0x830)
+#define DTKNQR4                HSOTG_REG(0x834)
+#define DIEPEMPMSK             HSOTG_REG(0x834)
+
+#define DVBUSDIS               HSOTG_REG(0x828)
+#define DVBUSPULSE             HSOTG_REG(0x82C)
+
+#define DIEPCTL0               HSOTG_REG(0x900)
+#define DIEPCTL(_a)            HSOTG_REG(0x900 + ((_a) * 0x20))
+
+#define DOEPCTL0               HSOTG_REG(0xB00)
+#define DOEPCTL(_a)            HSOTG_REG(0xB00 + ((_a) * 0x20))
 
 /* EP0 specialness:
  * bits[29..28] - reserved (no SetD0PID, SetD1PID)
  * bits[25..22] - should always be zero, this isn't a periodic endpoint
  * bits[10..0]  - MPS setting different for EP0
  */
-#define D0EPCTL_MPS_MASK		(0x3 << 0)
-#define D0EPCTL_MPS_SHIFT		0
-#define D0EPCTL_MPS_64			0
-#define D0EPCTL_MPS_32			1
-#define D0EPCTL_MPS_16			2
-#define D0EPCTL_MPS_8			3
-
-#define DXEPCTL_EPENA			BIT(31)
-#define DXEPCTL_EPDIS			BIT(30)
-#define DXEPCTL_SETD1PID		BIT(29)
-#define DXEPCTL_SETODDFR		BIT(29)
-#define DXEPCTL_SETD0PID		BIT(28)
-#define DXEPCTL_SETEVENFR		BIT(28)
-#define DXEPCTL_SNAK			BIT(27)
-#define DXEPCTL_CNAK			BIT(26)
-#define DXEPCTL_TXFNUM_MASK		(0xf << 22)
-#define DXEPCTL_TXFNUM_SHIFT		22
-#define DXEPCTL_TXFNUM_LIMIT		0xf
-#define DXEPCTL_TXFNUM(_x)		((_x) << 22)
-#define DXEPCTL_STALL			BIT(21)
-#define DXEPCTL_SNP			BIT(20)
-#define DXEPCTL_EPTYPE_MASK		(0x3 << 18)
-#define DXEPCTL_EPTYPE_CONTROL		(0x0 << 18)
-#define DXEPCTL_EPTYPE_ISO		(0x1 << 18)
-#define DXEPCTL_EPTYPE_BULK		(0x2 << 18)
-#define DXEPCTL_EPTYPE_INTERRUPT	(0x3 << 18)
-
-#define DXEPCTL_NAKSTS			BIT(17)
-#define DXEPCTL_DPID			BIT(16)
-#define DXEPCTL_EOFRNUM			BIT(16)
-#define DXEPCTL_USBACTEP		BIT(15)
-#define DXEPCTL_NEXTEP_MASK		(0xf << 11)
-#define DXEPCTL_NEXTEP_SHIFT		11
-#define DXEPCTL_NEXTEP_LIMIT		0xf
-#define DXEPCTL_NEXTEP(_x)		((_x) << 11)
-#define DXEPCTL_MPS_MASK		(0x7ff << 0)
-#define DXEPCTL_MPS_SHIFT		0
-#define DXEPCTL_MPS_LIMIT		0x7ff
-#define DXEPCTL_MPS(_x)			((_x) << 0)
-
-#define DIEPINT(_a)			HSOTG_REG(0x908 + ((_a) * 0x20))
-#define DOEPINT(_a)			HSOTG_REG(0xB08 + ((_a) * 0x20))
-#define DXEPINT_SETUP_RCVD		BIT(15)
-#define DXEPINT_NYETINTRPT		BIT(14)
-#define DXEPINT_NAKINTRPT		BIT(13)
-#define DXEPINT_BBLEERRINTRPT		BIT(12)
-#define DXEPINT_PKTDRPSTS		BIT(11)
-#define DXEPINT_BNAINTR			BIT(9)
-#define DXEPINT_TXFIFOUNDRN		BIT(8)
-#define DXEPINT_OUTPKTERR		BIT(8)
-#define DXEPINT_TXFEMP			BIT(7)
-#define DXEPINT_INEPNAKEFF		BIT(6)
-#define DXEPINT_BACK2BACKSETUP		BIT(6)
-#define DXEPINT_INTKNEPMIS		BIT(5)
-#define DXEPINT_STSPHSERCVD		BIT(5)
-#define DXEPINT_INTKNTXFEMP		BIT(4)
-#define DXEPINT_OUTTKNEPDIS		BIT(4)
-#define DXEPINT_TIMEOUT			BIT(3)
-#define DXEPINT_SETUP			BIT(3)
-#define DXEPINT_AHBERR			BIT(2)
-#define DXEPINT_EPDISBLD		BIT(1)
-#define DXEPINT_XFERCOMPL		BIT(0)
-
-#define DIEPTSIZ0			HSOTG_REG(0x910)
-#define DIEPTSIZ0_PKTCNT_MASK		(0x3 << 19)
-#define DIEPTSIZ0_PKTCNT_SHIFT		19
-#define DIEPTSIZ0_PKTCNT_LIMIT		0x3
-#define DIEPTSIZ0_PKTCNT(_x)		((_x) << 19)
-#define DIEPTSIZ0_XFERSIZE_MASK		(0x7f << 0)
-#define DIEPTSIZ0_XFERSIZE_SHIFT	0
-#define DIEPTSIZ0_XFERSIZE_LIMIT	0x7f
-#define DIEPTSIZ0_XFERSIZE(_x)		((_x) << 0)
-
-#define DOEPTSIZ0			HSOTG_REG(0xB10)
-#define DOEPTSIZ0_SUPCNT_MASK		(0x3 << 29)
-#define DOEPTSIZ0_SUPCNT_SHIFT		29
-#define DOEPTSIZ0_SUPCNT_LIMIT		0x3
-#define DOEPTSIZ0_SUPCNT(_x)		((_x) << 29)
-#define DOEPTSIZ0_PKTCNT		BIT(19)
-#define DOEPTSIZ0_XFERSIZE_MASK		(0x7f << 0)
-#define DOEPTSIZ0_XFERSIZE_SHIFT	0
-
-#define DIEPTSIZ(_a)			HSOTG_REG(0x910 + ((_a) * 0x20))
-#define DOEPTSIZ(_a)			HSOTG_REG(0xB10 + ((_a) * 0x20))
-#define DXEPTSIZ_MC_MASK		(0x3 << 29)
-#define DXEPTSIZ_MC_SHIFT		29
-#define DXEPTSIZ_MC_LIMIT		0x3
-#define DXEPTSIZ_MC(_x)			((_x) << 29)
-#define DXEPTSIZ_PKTCNT_MASK		(0x3ff << 19)
-#define DXEPTSIZ_PKTCNT_SHIFT		19
-#define DXEPTSIZ_PKTCNT_LIMIT		0x3ff
-#define DXEPTSIZ_PKTCNT_GET(_v)		(((_v) >> 19) & 0x3ff)
-#define DXEPTSIZ_PKTCNT(_x)		((_x) << 19)
-#define DXEPTSIZ_XFERSIZE_MASK		(0x7ffff << 0)
-#define DXEPTSIZ_XFERSIZE_SHIFT		0
-#define DXEPTSIZ_XFERSIZE_LIMIT		0x7ffff
-#define DXEPTSIZ_XFERSIZE_GET(_v)	(((_v) >> 0) & 0x7ffff)
-#define DXEPTSIZ_XFERSIZE(_x)		((_x) << 0)
-
-#define DIEPDMA(_a)			HSOTG_REG(0x914 + ((_a) * 0x20))
-#define DOEPDMA(_a)			HSOTG_REG(0xB14 + ((_a) * 0x20))
-
-#define DTXFSTS(_a)			HSOTG_REG(0x918 + ((_a) * 0x20))
-
-#define PCGCTL				HSOTG_REG(0x0e00)
-#define PCGCTL_IF_DEV_MODE		BIT(31)
-#define PCGCTL_P2HD_PRT_SPD_MASK	(0x3 << 29)
-#define PCGCTL_P2HD_PRT_SPD_SHIFT	29
-#define PCGCTL_P2HD_DEV_ENUM_SPD_MASK	(0x3 << 27)
-#define PCGCTL_P2HD_DEV_ENUM_SPD_SHIFT	27
-#define PCGCTL_MAC_DEV_ADDR_MASK	(0x7f << 20)
-#define PCGCTL_MAC_DEV_ADDR_SHIFT	20
-#define PCGCTL_MAX_TERMSEL		BIT(19)
-#define PCGCTL_MAX_XCVRSELECT_MASK	(0x3 << 17)
-#define PCGCTL_MAX_XCVRSELECT_SHIFT	17
-#define PCGCTL_PORT_POWER		BIT(16)
-#define PCGCTL_PRT_CLK_SEL_MASK		(0x3 << 14)
-#define PCGCTL_PRT_CLK_SEL_SHIFT	14
-#define PCGCTL_ESS_REG_RESTORED		BIT(13)
-#define PCGCTL_EXTND_HIBER_SWITCH	BIT(12)
-#define PCGCTL_EXTND_HIBER_PWRCLMP	BIT(11)
-#define PCGCTL_ENBL_EXTND_HIBER		BIT(10)
-#define PCGCTL_RESTOREMODE		BIT(9)
-#define PCGCTL_RESETAFTSUSP		BIT(8)
-#define PCGCTL_DEEP_SLEEP		BIT(7)
-#define PCGCTL_PHY_IN_SLEEP		BIT(6)
-#define PCGCTL_ENBL_SLEEP_GATING	BIT(5)
-#define PCGCTL_RSTPDWNMODULE		BIT(3)
-#define PCGCTL_PWRCLMP			BIT(2)
-#define PCGCTL_GATEHCLK			BIT(1)
-#define PCGCTL_STOPPCLK			BIT(0)
-
-#define PCGCCTL1                        HSOTG_REG(0xe04)
-#define PCGCCTL1_TIMER                  (0x3 << 1)
-#define PCGCCTL1_GATEEN                 BIT(0)
-
-#define EPFIFO(_a)			HSOTG_REG(0x1000 + ((_a) * 0x1000))
+#define D0EPCTL_MPS_MASK          (0x3 << 0)
+#define D0EPCTL_MPS_SHIFT         0
+#define D0EPCTL_MPS_64            0
+#define D0EPCTL_MPS_32            1
+#define D0EPCTL_MPS_16            2
+#define D0EPCTL_MPS_8             3
+
+#define DXEPCTL_EPENA             BIT(31)
+#define DXEPCTL_EPDIS             BIT(30)
+#define DXEPCTL_SETD1PID          BIT(29)
+#define DXEPCTL_SETODDFR          BIT(29)
+#define DXEPCTL_SETD0PID          BIT(28)
+#define DXEPCTL_SETEVENFR         BIT(28)
+#define DXEPCTL_SNAK              BIT(27)
+#define DXEPCTL_CNAK              BIT(26)
+#define DXEPCTL_TXFNUM_MASK       (0xf << 22)
+#define DXEPCTL_TXFNUM_SHIFT      22
+#define DXEPCTL_TXFNUM_LIMIT      0xf
+#define DXEPCTL_TXFNUM(_x)        ((_x) << 22)
+#define DXEPCTL_STALL             BIT(21)
+#define DXEPCTL_SNP               BIT(20)
+#define DXEPCTL_EPTYPE_MASK       (0x3 << 18)
+#define DXEPCTL_EPTYPE_CONTROL    (0x0 << 18)
+#define DXEPCTL_EPTYPE_ISO        (0x1 << 18)
+#define DXEPCTL_EPTYPE_BULK       (0x2 << 18)
+#define DXEPCTL_EPTYPE_INTERRUPT  (0x3 << 18)
+
+#define DXEPCTL_NAKSTS            BIT(17)
+#define DXEPCTL_DPID              BIT(16)
+#define DXEPCTL_EOFRNUM           BIT(16)
+#define DXEPCTL_USBACTEP          BIT(15)
+#define DXEPCTL_NEXTEP_MASK       (0xf << 11)
+#define DXEPCTL_NEXTEP_SHIFT      11
+#define DXEPCTL_NEXTEP_LIMIT      0xf
+#define DXEPCTL_NEXTEP(_x)        ((_x) << 11)
+#define DXEPCTL_MPS_MASK          (0x7ff << 0)
+#define DXEPCTL_MPS_SHIFT         0
+#define DXEPCTL_MPS_LIMIT         0x7ff
+#define DXEPCTL_MPS(_x)           ((_x) << 0)
+
+#define DIEPINT(_a)               HSOTG_REG(0x908 + ((_a) * 0x20))
+#define DOEPINT(_a)               HSOTG_REG(0xB08 + ((_a) * 0x20))
+#define DXEPINT_SETUP_RCVD        BIT(15)
+#define DXEPINT_NYETINTRPT        BIT(14)
+#define DXEPINT_NAKINTRPT         BIT(13)
+#define DXEPINT_BBLEERRINTRPT     BIT(12)
+#define DXEPINT_PKTDRPSTS         BIT(11)
+#define DXEPINT_BNAINTR           BIT(9)
+#define DXEPINT_TXFIFOUNDRN       BIT(8)
+#define DXEPINT_OUTPKTERR         BIT(8)
+#define DXEPINT_TXFEMP            BIT(7)
+#define DXEPINT_INEPNAKEFF        BIT(6)
+#define DXEPINT_BACK2BACKSETUP    BIT(6)
+#define DXEPINT_INTKNEPMIS        BIT(5)
+#define DXEPINT_STSPHSERCVD       BIT(5)
+#define DXEPINT_INTKNTXFEMP       BIT(4)
+#define DXEPINT_OUTTKNEPDIS       BIT(4)
+#define DXEPINT_TIMEOUT           BIT(3)
+#define DXEPINT_SETUP             BIT(3)
+#define DXEPINT_AHBERR            BIT(2)
+#define DXEPINT_EPDISBLD          BIT(1)
+#define DXEPINT_XFERCOMPL         BIT(0)
+
+#define DIEPTSIZ0                    HSOTG_REG(0x910)
+#define DIEPTSIZ0_PKTCNT_MASK        (0x3 << 19)
+#define DIEPTSIZ0_PKTCNT_SHIFT       19
+#define DIEPTSIZ0_PKTCNT_LIMIT       0x3
+#define DIEPTSIZ0_PKTCNT(_x)         ((_x) << 19)
+#define DIEPTSIZ0_XFERSIZE_MASK      (0x7f << 0)
+#define DIEPTSIZ0_XFERSIZE_SHIFT     0
+#define DIEPTSIZ0_XFERSIZE_LIMIT     0x7f
+#define DIEPTSIZ0_XFERSIZE(_x)       ((_x) << 0)
+
+#define DOEPTSIZ0                    HSOTG_REG(0xB10)
+#define DOEPTSIZ0_SUPCNT_MASK        (0x3 << 29)
+#define DOEPTSIZ0_SUPCNT_SHIFT       29
+#define DOEPTSIZ0_SUPCNT_LIMIT       0x3
+#define DOEPTSIZ0_SUPCNT(_x)         ((_x) << 29)
+#define DOEPTSIZ0_PKTCNT             BIT(19)
+#define DOEPTSIZ0_XFERSIZE_MASK      (0x7f << 0)
+#define DOEPTSIZ0_XFERSIZE_SHIFT     0
+
+#define DIEPTSIZ(_a)                 HSOTG_REG(0x910 + ((_a) * 0x20))
+#define DOEPTSIZ(_a)                 HSOTG_REG(0xB10 + ((_a) * 0x20))
+#define DXEPTSIZ_MC_MASK             (0x3 << 29)
+#define DXEPTSIZ_MC_SHIFT            29
+#define DXEPTSIZ_MC_LIMIT            0x3
+#define DXEPTSIZ_MC(_x)              ((_x) << 29)
+#define DXEPTSIZ_PKTCNT_MASK         (0x3ff << 19)
+#define DXEPTSIZ_PKTCNT_SHIFT        19
+#define DXEPTSIZ_PKTCNT_LIMIT        0x3ff
+#define DXEPTSIZ_PKTCNT_GET(_v)      (((_v) >> 19) & 0x3ff)
+#define DXEPTSIZ_PKTCNT(_x)          ((_x) << 19)
+#define DXEPTSIZ_XFERSIZE_MASK       (0x7ffff << 0)
+#define DXEPTSIZ_XFERSIZE_SHIFT      0
+#define DXEPTSIZ_XFERSIZE_LIMIT      0x7ffff
+#define DXEPTSIZ_XFERSIZE_GET(_v)    (((_v) >> 0) & 0x7ffff)
+#define DXEPTSIZ_XFERSIZE(_x)        ((_x) << 0)
+
+#define DIEPDMA(_a)            HSOTG_REG(0x914 + ((_a) * 0x20))
+#define DOEPDMA(_a)            HSOTG_REG(0xB14 + ((_a) * 0x20))
+
+#define DTXFSTS(_a)            HSOTG_REG(0x918 + ((_a) * 0x20))
+
+#define PCGCTL                 HSOTG_REG(0x0e00)
+#define PCGCTL_IF_DEV_MODE             BIT(31)
+#define PCGCTL_P2HD_PRT_SPD_MASK       (0x3 << 29)
+#define PCGCTL_P2HD_PRT_SPD_SHIFT      29
+#define PCGCTL_P2HD_DEV_ENUM_SPD_MASK    (0x3 << 27)
+#define PCGCTL_P2HD_DEV_ENUM_SPD_SHIFT    27
+#define PCGCTL_MAC_DEV_ADDR_MASK       (0x7f << 20)
+#define PCGCTL_MAC_DEV_ADDR_SHIFT      20
+#define PCGCTL_MAX_TERMSEL             BIT(19)
+#define PCGCTL_MAX_XCVRSELECT_MASK     (0x3 << 17)
+#define PCGCTL_MAX_XCVRSELECT_SHIFT    17
+#define PCGCTL_PORT_POWER              BIT(16)
+#define PCGCTL_PRT_CLK_SEL_MASK        (0x3 << 14)
+#define PCGCTL_PRT_CLK_SEL_SHIFT       14
+#define PCGCTL_ESS_REG_RESTORED        BIT(13)
+#define PCGCTL_EXTND_HIBER_SWITCH      BIT(12)
+#define PCGCTL_EXTND_HIBER_PWRCLMP     BIT(11)
+#define PCGCTL_ENBL_EXTND_HIBER        BIT(10)
+#define PCGCTL_RESTOREMODE             BIT(9)
+#define PCGCTL_RESETAFTSUSP            BIT(8)
+#define PCGCTL_DEEP_SLEEP              BIT(7)
+#define PCGCTL_PHY_IN_SLEEP            BIT(6)
+#define PCGCTL_ENBL_SLEEP_GATING       BIT(5)
+#define PCGCTL_RSTPDWNMODULE           BIT(3)
+#define PCGCTL_PWRCLMP                 BIT(2)
+#define PCGCTL_GATEHCLK                BIT(1)
+#define PCGCTL_STOPPCLK                BIT(0)
+
+#define PCGCCTL1                       HSOTG_REG(0xe04)
+#define PCGCCTL1_TIMER                 (0x3 << 1)
+#define PCGCCTL1_GATEEN                BIT(0)
+
+#define EPFIFO(_a)            HSOTG_REG(0x1000 + ((_a) * 0x1000))
 
 /* Host Mode Registers */
 
-#define HCFG				HSOTG_REG(0x0400)
-#define HCFG_MODECHTIMEN		BIT(31)
-#define HCFG_PERSCHEDENA		BIT(26)
-#define HCFG_FRLISTEN_MASK		(0x3 << 24)
-#define HCFG_FRLISTEN_SHIFT		24
-#define HCFG_FRLISTEN_8				(0 << 24)
-#define FRLISTEN_8_SIZE				8
-#define HCFG_FRLISTEN_16			BIT(24)
-#define FRLISTEN_16_SIZE			16
-#define HCFG_FRLISTEN_32			(2 << 24)
-#define FRLISTEN_32_SIZE			32
-#define HCFG_FRLISTEN_64			(3 << 24)
-#define FRLISTEN_64_SIZE			64
-#define HCFG_DESCDMA			BIT(23)
-#define HCFG_RESVALID_MASK		(0xff << 8)
-#define HCFG_RESVALID_SHIFT		8
-#define HCFG_ENA32KHZ			BIT(7)
-#define HCFG_FSLSSUPP			BIT(2)
-#define HCFG_FSLSPCLKSEL_MASK		(0x3 << 0)
-#define HCFG_FSLSPCLKSEL_SHIFT		0
-#define HCFG_FSLSPCLKSEL_30_60_MHZ	0
-#define HCFG_FSLSPCLKSEL_48_MHZ		1
-#define HCFG_FSLSPCLKSEL_6_MHZ		2
-
-#define HFIR				HSOTG_REG(0x0404)
-#define HFIR_FRINT_MASK			(0xffff << 0)
-#define HFIR_FRINT_SHIFT		0
-#define HFIR_RLDCTRL			BIT(16)
-
-#define HFNUM				HSOTG_REG(0x0408)
-#define HFNUM_FRREM_MASK		(0xffff << 16)
-#define HFNUM_FRREM_SHIFT		16
-#define HFNUM_FRNUM_MASK		(0xffff << 0)
-#define HFNUM_FRNUM_SHIFT		0
-#define HFNUM_MAX_FRNUM			0x3fff
-
-#define HPTXSTS				HSOTG_REG(0x0410)
-#define TXSTS_QTOP_ODD			BIT(31)
-#define TXSTS_QTOP_CHNEP_MASK		(0xf << 27)
-#define TXSTS_QTOP_CHNEP_SHIFT		27
-#define TXSTS_QTOP_TOKEN_MASK		(0x3 << 25)
-#define TXSTS_QTOP_TOKEN_SHIFT		25
-#define TXSTS_QTOP_TERMINATE		BIT(24)
-#define TXSTS_QSPCAVAIL_MASK		(0xff << 16)
-#define TXSTS_QSPCAVAIL_SHIFT		16
-#define TXSTS_FSPCAVAIL_MASK		(0xffff << 0)
-#define TXSTS_FSPCAVAIL_SHIFT		0
-
-#define HAINT				HSOTG_REG(0x0414)
-#define HAINTMSK			HSOTG_REG(0x0418)
-#define HFLBADDR			HSOTG_REG(0x041c)
-
-#define HPRT0				HSOTG_REG(0x0440)
-#define HPRT0_SPD_MASK			(0x3 << 17)
-#define HPRT0_SPD_SHIFT			17
-#define HPRT0_SPD_HIGH_SPEED		0
-#define HPRT0_SPD_FULL_SPEED		1
-#define HPRT0_SPD_LOW_SPEED		2
-#define HPRT0_TSTCTL_MASK		(0xf << 13)
-#define HPRT0_TSTCTL_SHIFT		13
-#define HPRT0_PWR			BIT(12)
-#define HPRT0_LNSTS_MASK		(0x3 << 10)
-#define HPRT0_LNSTS_SHIFT		10
-#define HPRT0_RST			BIT(8)
-#define HPRT0_SUSP			BIT(7)
-#define HPRT0_RES			BIT(6)
-#define HPRT0_OVRCURRCHG		BIT(5)
-#define HPRT0_OVRCURRACT		BIT(4)
-#define HPRT0_ENACHG			BIT(3)
-#define HPRT0_ENA			BIT(2)
-#define HPRT0_CONNDET			BIT(1)
-#define HPRT0_CONNSTS			BIT(0)
-
-#define HCCHAR(_ch)			HSOTG_REG(0x0500 + 0x20 * (_ch))
-#define HCCHAR_CHENA			BIT(31)
-#define HCCHAR_CHDIS			BIT(30)
-#define HCCHAR_ODDFRM			BIT(29)
-#define HCCHAR_DEVADDR_MASK		(0x7f << 22)
-#define HCCHAR_DEVADDR_SHIFT		22
-#define HCCHAR_MULTICNT_MASK		(0x3 << 20)
-#define HCCHAR_MULTICNT_SHIFT		20
-#define HCCHAR_EPTYPE_MASK		(0x3 << 18)
-#define HCCHAR_EPTYPE_SHIFT		18
-#define HCCHAR_LSPDDEV			BIT(17)
-#define HCCHAR_EPDIR			BIT(15)
-#define HCCHAR_EPNUM_MASK		(0xf << 11)
-#define HCCHAR_EPNUM_SHIFT		11
-#define HCCHAR_MPS_MASK			(0x7ff << 0)
-#define HCCHAR_MPS_SHIFT		0
-
-#define HCSPLT(_ch)			HSOTG_REG(0x0504 + 0x20 * (_ch))
-#define HCSPLT_SPLTENA			BIT(31)
-#define HCSPLT_COMPSPLT			BIT(16)
-#define HCSPLT_XACTPOS_MASK		(0x3 << 14)
-#define HCSPLT_XACTPOS_SHIFT		14
-#define HCSPLT_XACTPOS_MID		0
-#define HCSPLT_XACTPOS_END		1
-#define HCSPLT_XACTPOS_BEGIN		2
-#define HCSPLT_XACTPOS_ALL		3
-#define HCSPLT_HUBADDR_MASK		(0x7f << 7)
-#define HCSPLT_HUBADDR_SHIFT		7
-#define HCSPLT_PRTADDR_MASK		(0x7f << 0)
-#define HCSPLT_PRTADDR_SHIFT		0
-
-#define HCINT(_ch)			HSOTG_REG(0x0508 + 0x20 * (_ch))
-#define HCINTMSK(_ch)			HSOTG_REG(0x050c + 0x20 * (_ch))
-#define HCINTMSK_RESERVED14_31		(0x3ffff << 14)
-#define HCINTMSK_FRM_LIST_ROLL		BIT(13)
-#define HCINTMSK_XCS_XACT		BIT(12)
-#define HCINTMSK_BNA			BIT(11)
-#define HCINTMSK_DATATGLERR		BIT(10)
-#define HCINTMSK_FRMOVRUN		BIT(9)
-#define HCINTMSK_BBLERR			BIT(8)
-#define HCINTMSK_XACTERR		BIT(7)
-#define HCINTMSK_NYET			BIT(6)
-#define HCINTMSK_ACK			BIT(5)
-#define HCINTMSK_NAK			BIT(4)
-#define HCINTMSK_STALL			BIT(3)
-#define HCINTMSK_AHBERR			BIT(2)
-#define HCINTMSK_CHHLTD			BIT(1)
-#define HCINTMSK_XFERCOMPL		BIT(0)
-
-#define HCTSIZ(_ch)			HSOTG_REG(0x0510 + 0x20 * (_ch))
-#define TSIZ_DOPNG			BIT(31)
-#define TSIZ_SC_MC_PID_MASK		(0x3 << 29)
-#define TSIZ_SC_MC_PID_SHIFT		29
-#define TSIZ_SC_MC_PID_DATA0		0
-#define TSIZ_SC_MC_PID_DATA2		1
-#define TSIZ_SC_MC_PID_DATA1		2
-#define TSIZ_SC_MC_PID_MDATA		3
-#define TSIZ_SC_MC_PID_SETUP		3
-#define TSIZ_PKTCNT_MASK		(0x3ff << 19)
-#define TSIZ_PKTCNT_SHIFT		19
-#define TSIZ_NTD_MASK			(0xff << 8)
-#define TSIZ_NTD_SHIFT			8
-#define TSIZ_SCHINFO_MASK		(0xff << 0)
-#define TSIZ_SCHINFO_SHIFT		0
-#define TSIZ_XFERSIZE_MASK		(0x7ffff << 0)
-#define TSIZ_XFERSIZE_SHIFT		0
-
-#define HCDMA(_ch)			HSOTG_REG(0x0514 + 0x20 * (_ch))
-
-#define HCDMAB(_ch)			HSOTG_REG(0x051c + 0x20 * (_ch))
-
-#define HCFIFO(_ch)			HSOTG_REG(0x1000 + 0x1000 * (_ch))
+#define HCFG                          HSOTG_REG(0x0400)
+#define HCFG_MODECHTIMEN              BIT(31)
+#define HCFG_PERSCHEDENA              BIT(26)
+#define HCFG_FRLISTEN_MASK            (0x3 << 24)
+#define HCFG_FRLISTEN_SHIFT           24
+#define HCFG_FRLISTEN_8               (0 << 24)
+#define FRLISTEN_8_SIZE               8
+#define HCFG_FRLISTEN_16              BIT(24)
+#define FRLISTEN_16_SIZE              16
+#define HCFG_FRLISTEN_32              (2 << 24)
+#define FRLISTEN_32_SIZE              32
+#define HCFG_FRLISTEN_64              (3 << 24)
+#define FRLISTEN_64_SIZE              64
+#define HCFG_DESCDMA                  BIT(23)
+#define HCFG_RESVALID_MASK            (0xff << 8)
+#define HCFG_RESVALID_SHIFT           8
+#define HCFG_ENA32KHZ                 BIT(7)
+#define HCFG_FSLSSUPP                 BIT(2)
+#define HCFG_FSLSPCLKSEL_MASK         (0x3 << 0)
+#define HCFG_FSLSPCLKSEL_SHIFT        0
+#define HCFG_FSLSPCLKSEL_30_60_MHZ    0
+#define HCFG_FSLSPCLKSEL_48_MHZ       1
+#define HCFG_FSLSPCLKSEL_6_MHZ        2
+
+#define HFIR                    HSOTG_REG(0x0404)
+#define HFIR_FRINT_MASK         (0xffff << 0)
+#define HFIR_FRINT_SHIFT        0
+#define HFIR_RLDCTRL            BIT(16)
+
+#define HFNUM                   HSOTG_REG(0x0408)
+#define HFNUM_FRREM_MASK        (0xffff << 16)
+#define HFNUM_FRREM_SHIFT       16
+#define HFNUM_FRNUM_MASK        (0xffff << 0)
+#define HFNUM_FRNUM_SHIFT       0
+#define HFNUM_MAX_FRNUM         0x3fff
+
+#define HPTXSTS                      HSOTG_REG(0x0410)
+#define TXSTS_QTOP_ODD               BIT(31)
+#define TXSTS_QTOP_CHNEP_MASK        (0xf << 27)
+#define TXSTS_QTOP_CHNEP_SHIFT       27
+#define TXSTS_QTOP_TOKEN_MASK        (0x3 << 25)
+#define TXSTS_QTOP_TOKEN_SHIFT       25
+#define TXSTS_QTOP_TERMINATE         BIT(24)
+#define TXSTS_QSPCAVAIL_MASK         (0xff << 16)
+#define TXSTS_QSPCAVAIL_SHIFT        16
+#define TXSTS_FSPCAVAIL_MASK         (0xffff << 0)
+#define TXSTS_FSPCAVAIL_SHIFT        0
+
+#define HAINT                HSOTG_REG(0x0414)
+#define HAINTMSK             HSOTG_REG(0x0418)
+#define HFLBADDR             HSOTG_REG(0x041c)
+
+#define HPRT0                HSOTG_REG(0x0440)
+#define HPRT0_SPD_MASK          (0x3 << 17)
+#define HPRT0_SPD_SHIFT         17
+#define HPRT0_SPD_HIGH_SPEED    0
+#define HPRT0_SPD_FULL_SPEED    1
+#define HPRT0_SPD_LOW_SPEED     2
+#define HPRT0_TSTCTL_MASK       (0xf << 13)
+#define HPRT0_TSTCTL_SHIFT      13
+#define HPRT0_PWR               BIT(12)
+#define HPRT0_LNSTS_MASK        (0x3 << 10)
+#define HPRT0_LNSTS_SHIFT       10
+#define HPRT0_RST               BIT(8)
+#define HPRT0_SUSP              BIT(7)
+#define HPRT0_RES               BIT(6)
+#define HPRT0_OVRCURRCHG        BIT(5)
+#define HPRT0_OVRCURRACT        BIT(4)
+#define HPRT0_ENACHG            BIT(3)
+#define HPRT0_ENA               BIT(2)
+#define HPRT0_CONNDET           BIT(1)
+#define HPRT0_CONNSTS           BIT(0)
+
+#define HCCHAR(_ch)                 HSOTG_REG(0x0500 + 0x20 * (_ch))
+#define HCCHAR_CHENA                BIT(31)
+#define HCCHAR_CHDIS                BIT(30)
+#define HCCHAR_ODDFRM               BIT(29)
+#define HCCHAR_DEVADDR_MASK         (0x7f << 22)
+#define HCCHAR_DEVADDR_SHIFT        22
+#define HCCHAR_MULTICNT_MASK        (0x3 << 20)
+#define HCCHAR_MULTICNT_SHIFT       20
+#define HCCHAR_EPTYPE_MASK          (0x3 << 18)
+#define HCCHAR_EPTYPE_SHIFT         18
+#define HCCHAR_LSPDDEV              BIT(17)
+#define HCCHAR_EPDIR                BIT(15)
+#define HCCHAR_EPNUM_MASK           (0xf << 11)
+#define HCCHAR_EPNUM_SHIFT          11
+#define HCCHAR_MPS_MASK             (0x7ff << 0)
+#define HCCHAR_MPS_SHIFT            0
+
+#define HCSPLT(_ch)                 HSOTG_REG(0x0504 + 0x20 * (_ch))
+#define HCSPLT_SPLTENA              BIT(31)
+#define HCSPLT_COMPSPLT             BIT(16)
+#define HCSPLT_XACTPOS_MASK         (0x3 << 14)
+#define HCSPLT_XACTPOS_SHIFT        14
+#define HCSPLT_XACTPOS_MID          0
+#define HCSPLT_XACTPOS_END          1
+#define HCSPLT_XACTPOS_BEGIN        2
+#define HCSPLT_XACTPOS_ALL          3
+#define HCSPLT_HUBADDR_MASK         (0x7f << 7)
+#define HCSPLT_HUBADDR_SHIFT        7
+#define HCSPLT_PRTADDR_MASK         (0x7f << 0)
+#define HCSPLT_PRTADDR_SHIFT        0
+
+#define HCINT(_ch)                  HSOTG_REG(0x0508 + 0x20 * (_ch))
+#define HCINTMSK(_ch)               HSOTG_REG(0x050c + 0x20 * (_ch))
+#define HCINTMSK_RESERVED14_31      (0x3ffff << 14)
+#define HCINTMSK_FRM_LIST_ROLL      BIT(13)
+#define HCINTMSK_XCS_XACT           BIT(12)
+#define HCINTMSK_BNA                BIT(11)
+#define HCINTMSK_DATATGLERR         BIT(10)
+#define HCINTMSK_FRMOVRUN           BIT(9)
+#define HCINTMSK_BBLERR             BIT(8)
+#define HCINTMSK_XACTERR            BIT(7)
+#define HCINTMSK_NYET               BIT(6)
+#define HCINTMSK_ACK                BIT(5)
+#define HCINTMSK_NAK                BIT(4)
+#define HCINTMSK_STALL              BIT(3)
+#define HCINTMSK_AHBERR             BIT(2)
+#define HCINTMSK_CHHLTD             BIT(1)
+#define HCINTMSK_XFERCOMPL          BIT(0)
+
+#define HCTSIZ(_ch)                 HSOTG_REG(0x0510 + 0x20 * (_ch))
+#define TSIZ_DOPNG                  BIT(31)
+#define TSIZ_SC_MC_PID_MASK         (0x3 << 29)
+#define TSIZ_SC_MC_PID_SHIFT        29
+#define TSIZ_SC_MC_PID_DATA0        0
+#define TSIZ_SC_MC_PID_DATA2        1
+#define TSIZ_SC_MC_PID_DATA1        2
+#define TSIZ_SC_MC_PID_MDATA        3
+#define TSIZ_SC_MC_PID_SETUP        3
+#define TSIZ_PKTCNT_MASK            (0x3ff << 19)
+#define TSIZ_PKTCNT_SHIFT           19
+#define TSIZ_NTD_MASK               (0xff << 8)
+#define TSIZ_NTD_SHIFT              8
+#define TSIZ_SCHINFO_MASK           (0xff << 0)
+#define TSIZ_SCHINFO_SHIFT          0
+#define TSIZ_XFERSIZE_MASK          (0x7ffff << 0)
+#define TSIZ_XFERSIZE_SHIFT         0
+
+#define HCDMA(_ch)             HSOTG_REG(0x0514 + 0x20 * (_ch))
+
+#define HCDMAB(_ch)            HSOTG_REG(0x051c + 0x20 * (_ch))
+
+#define HCFIFO(_ch)            HSOTG_REG(0x1000 + 0x1000 * (_ch))
 
 /**
  * struct dwc2_dma_desc - DMA descriptor structure,
@@ -836,64 +836,64 @@
  * Status quadlet and Data buffer pointer.
  */
 struct dwc2_dma_desc {
-	uint32_t status;
-	uint32_t buf;
+    uint32_t status;
+    uint32_t buf;
 } __packed;
 
 /* Host Mode DMA descriptor status quadlet */
 
-#define HOST_DMA_A			BIT(31)
-#define HOST_DMA_STS_MASK		(0x3 << 28)
-#define HOST_DMA_STS_SHIFT		28
-#define HOST_DMA_STS_PKTERR		BIT(28)
-#define HOST_DMA_EOL			BIT(26)
-#define HOST_DMA_IOC			BIT(25)
-#define HOST_DMA_SUP			BIT(24)
-#define HOST_DMA_ALT_QTD		BIT(23)
-#define HOST_DMA_QTD_OFFSET_MASK	(0x3f << 17)
-#define HOST_DMA_QTD_OFFSET_SHIFT	17
-#define HOST_DMA_ISOC_NBYTES_MASK	(0xfff << 0)
-#define HOST_DMA_ISOC_NBYTES_SHIFT	0
-#define HOST_DMA_NBYTES_MASK		(0x1ffff << 0)
-#define HOST_DMA_NBYTES_SHIFT		0
-#define HOST_DMA_NBYTES_LIMIT		131071
+#define HOST_DMA_A                   BIT(31)
+#define HOST_DMA_STS_MASK            (0x3 << 28)
+#define HOST_DMA_STS_SHIFT           28
+#define HOST_DMA_STS_PKTERR          BIT(28)
+#define HOST_DMA_EOL                 BIT(26)
+#define HOST_DMA_IOC                 BIT(25)
+#define HOST_DMA_SUP                 BIT(24)
+#define HOST_DMA_ALT_QTD             BIT(23)
+#define HOST_DMA_QTD_OFFSET_MASK     (0x3f << 17)
+#define HOST_DMA_QTD_OFFSET_SHIFT    17
+#define HOST_DMA_ISOC_NBYTES_MASK    (0xfff << 0)
+#define HOST_DMA_ISOC_NBYTES_SHIFT   0
+#define HOST_DMA_NBYTES_MASK         (0x1ffff << 0)
+#define HOST_DMA_NBYTES_SHIFT        0
+#define HOST_DMA_NBYTES_LIMIT        131071
 
 /* Device Mode DMA descriptor status quadlet */
 
-#define DEV_DMA_BUFF_STS_MASK		(0x3 << 30)
-#define DEV_DMA_BUFF_STS_SHIFT		30
-#define DEV_DMA_BUFF_STS_HREADY		0
-#define DEV_DMA_BUFF_STS_DMABUSY	1
-#define DEV_DMA_BUFF_STS_DMADONE	2
-#define DEV_DMA_BUFF_STS_HBUSY		3
-#define DEV_DMA_STS_MASK		(0x3 << 28)
-#define DEV_DMA_STS_SHIFT		28
-#define DEV_DMA_STS_SUCC		0
-#define DEV_DMA_STS_BUFF_FLUSH		1
-#define DEV_DMA_STS_BUFF_ERR		3
-#define DEV_DMA_L			BIT(27)
-#define DEV_DMA_SHORT			BIT(26)
-#define DEV_DMA_IOC			BIT(25)
-#define DEV_DMA_SR			BIT(24)
-#define DEV_DMA_MTRF			BIT(23)
-#define DEV_DMA_ISOC_PID_MASK		(0x3 << 23)
-#define DEV_DMA_ISOC_PID_SHIFT		23
-#define DEV_DMA_ISOC_PID_DATA0		0
-#define DEV_DMA_ISOC_PID_DATA2		1
-#define DEV_DMA_ISOC_PID_DATA1		2
-#define DEV_DMA_ISOC_PID_MDATA		3
-#define DEV_DMA_ISOC_FRNUM_MASK		(0x7ff << 12)
-#define DEV_DMA_ISOC_FRNUM_SHIFT	12
-#define DEV_DMA_ISOC_TX_NBYTES_MASK	(0xfff << 0)
-#define DEV_DMA_ISOC_TX_NBYTES_LIMIT	0xfff
-#define DEV_DMA_ISOC_RX_NBYTES_MASK	(0x7ff << 0)
-#define DEV_DMA_ISOC_RX_NBYTES_LIMIT	0x7ff
-#define DEV_DMA_ISOC_NBYTES_SHIFT	0
-#define DEV_DMA_NBYTES_MASK		(0xffff << 0)
-#define DEV_DMA_NBYTES_SHIFT		0
-#define DEV_DMA_NBYTES_LIMIT		0xffff
-
-#define MAX_DMA_DESC_NUM_GENERIC	64
-#define MAX_DMA_DESC_NUM_HS_ISOC	256
+#define DEV_DMA_BUFF_STS_MASK        (0x3 << 30)
+#define DEV_DMA_BUFF_STS_SHIFT       30
+#define DEV_DMA_BUFF_STS_HREADY      0
+#define DEV_DMA_BUFF_STS_DMABUSY     1
+#define DEV_DMA_BUFF_STS_DMADONE     2
+#define DEV_DMA_BUFF_STS_HBUSY       3
+#define DEV_DMA_STS_MASK             (0x3 << 28)
+#define DEV_DMA_STS_SHIFT            28
+#define DEV_DMA_STS_SUCC             0
+#define DEV_DMA_STS_BUFF_FLUSH       1
+#define DEV_DMA_STS_BUFF_ERR         3
+#define DEV_DMA_L                    BIT(27)
+#define DEV_DMA_SHORT                BIT(26)
+#define DEV_DMA_IOC                  BIT(25)
+#define DEV_DMA_SR                   BIT(24)
+#define DEV_DMA_MTRF                 BIT(23)
+#define DEV_DMA_ISOC_PID_MASK        (0x3 << 23)
+#define DEV_DMA_ISOC_PID_SHIFT       23
+#define DEV_DMA_ISOC_PID_DATA0       0
+#define DEV_DMA_ISOC_PID_DATA2       1
+#define DEV_DMA_ISOC_PID_DATA1       2
+#define DEV_DMA_ISOC_PID_MDATA       3
+#define DEV_DMA_ISOC_FRNUM_MASK        (0x7ff << 12)
+#define DEV_DMA_ISOC_FRNUM_SHIFT       12
+#define DEV_DMA_ISOC_TX_NBYTES_MASK    (0xfff << 0)
+#define DEV_DMA_ISOC_TX_NBYTES_LIMIT   0xfff
+#define DEV_DMA_ISOC_RX_NBYTES_MASK    (0x7ff << 0)
+#define DEV_DMA_ISOC_RX_NBYTES_LIMIT   0x7ff
+#define DEV_DMA_ISOC_NBYTES_SHIFT      0
+#define DEV_DMA_NBYTES_MASK            (0xffff << 0)
+#define DEV_DMA_NBYTES_SHIFT           0
+#define DEV_DMA_NBYTES_LIMIT           0xffff
+
+#define MAX_DMA_DESC_NUM_GENERIC    64
+#define MAX_DMA_DESC_NUM_HS_ISOC    256
 
 #endif /* DWC2_REGS_H */
-- 
2.25.1



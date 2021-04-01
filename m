Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23213510D3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:27:46 +0200 (CEST)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsg5-0005rf-Uc
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lRsei-0004ig-NH
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:20 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lRseZ-0006vs-GI
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:20 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 03F442EE1;
 Thu,  1 Apr 2021 04:26:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 04:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=qDBNOGoq67J8P3QxkeO1hibArm
 5MTYTvYuAbSz0uRjU=; b=Ub5y/HVVcFrAt/uxblI+tlYzHXejxIe321P9kIigA/
 6znMkNyD8WFqyTLPXgERy/K3LP96tR/t0HXi0/2osJKrZNO/qK9FSKuNJT/WlN1r
 u2OWL0v+bkGKXoVW1KPIffkeqpOvSGBwFfyh6PFTcxLju2CvZvZVrLr+whIZ96bi
 qkCXnaQYL8IEnNeTIdTvvyrcWro1sjeMo6QLmPFuuKhXuLygzuVj3wSUj74x4DwZ
 Yl9NPS456vvW0oEfRjmaIIQMhjz4n00CF+RdyVqTrJN02MGsz1pGQFKJTdeDQx0L
 b53JQ6U6q6OR6uurtBEnJvGog50aZtKXPKc6uC8IfVJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qDBNOGoq67J8P3Qxk
 eO1hibArm5MTYTvYuAbSz0uRjU=; b=NQZFDf++aF1koukv7NbAs8+xLqtzgxYgX
 C1OtEj0XlbaW2zvHGjnWqqoICzUpmdesEPgsNH6M99hjuv3JbUhEDXd/jRcjH3pE
 fVKHWMOWCLlJ6vnabsu7M0C8xzyTh2p3ZYlGOlbIjJaju/GoxcEhNUr3bev4j9nP
 ML7Vpz+81WZ+EHrBrvMAipIQHfcjBDH9IP8cTf/cIQaqdcw+Zv2Lzh2kdagStMXH
 tPkZzPwUqCDYrtqc5oE0EfucFHyb7N4hDiGSHwNoplqPCeZ4U6wa7XG43k0ybhKr
 TDAeLPkPr2XR9Z45I6hHmya+m8EG7cXnztauTk3Pzd9eKPEvyZJTg==
X-ME-Sender: <xms:m4NlYIkOHZ0SHGq5c5PKTuy4-NDTzYkAO3y7VzI8L4caUQai-DKYXQ>
 <xme:m4NlYH1isHzgkey8PjyhtITxvs9Lh9nWMXBfFJvPuotwXWCKLs6P79ADFH-gBtlDD
 nNBQd16ad5WjCXHTSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgudeftdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepgghinhgtvghn
 thcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrfgrth
 htvghrnhepvdeiffetueektdelveffhfdvfefgtdffhedtudekteevfffgvedtfeehveff
 hefgnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepsggvrhhnrghtsehluhhffhihrdgtgi
X-ME-Proxy: <xmx:m4NlYGqVMriNtoVUmrkuLNd4xgPkeI6fiCr8uc9eWHQuDnY5T-g3Hg>
 <xmx:m4NlYElGYs7wbIIpgkF13JHDSJi7fqoM04t5wWz_t7pjtr7EUEciSw>
 <xmx:m4NlYG1HjYD17fthV01gqWkW0s6QQijxj__rMBgerZ0RreXpxH-XwQ>
 <xmx:nYNlYED1HhRNWOi2T4qkAxtQLxG1bURxqwxXKeT-EmRyq-RtdRCZ2A>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E810240065;
 Thu,  1 Apr 2021 04:26:03 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 01F4AA28; Thu,  1 Apr 2021 10:26:00 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/2] hw/smbios: support for type 41 (onboard devices
 extended information)
Date: Thu,  1 Apr 2021 10:25:43 +0200
Message-Id: <20210401082544.16522-1-vincent@bernat.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=bernat@luffy.cx;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Type 41 defines the attributes of devices that are onboard. The
original intent was to imply the BIOS had some level of control over
the enablement of the associated devices.

If network devices are present in this table, by default, udev will
name the corresponding interfaces enoX, X being the instance number.
Without such information, udev will fallback to using the PCI ID and
this usually gives ens3 or ens4. This can be a bit annoying as the
name of the network card may depend on the order of options and may
change if a new PCI device is added earlier on the commande line.
Being able to provide SMBIOS type 41 entry ensure the name of the
interface won't change and helps the user guess the right name without
booting a first time.

This can be invoked with:

    $QEMU -netdev user,id=internet
          -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet \
          -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pci=0000:00:09.0

Which results in the guest seeing dmidecode data and the interface
exposed as "eno1":

    $ dmidecode -t 41
    # dmidecode 3.3
    Getting SMBIOS data from sysfs.
    SMBIOS 2.8 present.Handle 0x2900, DMI type 41, 11 bytes
    Onboard Device
            Reference Designation: Onboard LAN
            Type: Ethernet
            Status: Enabled
            Type Instance: 1
            Bus Address: 0000:00:09.0
    $ udevadm info -p /sys/class/net/eno1 | grep ONBOARD
    E: ID_NET_NAME_ONBOARD=eno1
    E: ID_NET_LABEL_ONBOARD=Onboard LAN

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
---
 hw/smbios/smbios.c           | 119 +++++++++++++++++++++++++++++++++++
 include/hw/firmware/smbios.h |  11 ++++
 qemu-options.hx              |   7 ++-
 3 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index f22c4f5b734e..46a08652dff4 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -118,6 +118,32 @@ static struct {
     uint16_t speed;
 } type17;
 
+static QEnumLookup type41_kind_lookup = {
+    .array = (const char *const[]) {
+        "other",
+        "unknown",
+        "video",
+        "scsi",
+        "ethernet",
+        "tokenring",
+        "sound",
+        "pata",
+        "sata",
+        "sas",
+    },
+    .size = 10
+};
+struct type41_instance {
+    const char *designation;
+    uint8_t instance, kind;
+    struct {
+        uint16_t segment;
+        uint8_t bus, device;
+    } pci;
+    QTAILQ_ENTRY(type41_instance) next;
+};
+static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
+
 static QemuOptsList qemu_smbios_opts = {
     .name = "smbios",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_smbios_opts.head),
@@ -358,6 +384,33 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
     { /* end of list */ }
 };
 
+static const QemuOptDesc qemu_smbios_type41_opts[] = {
+    {
+        .name = "type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "SMBIOS element type",
+    },{
+        .name = "designation",
+        .type = QEMU_OPT_STRING,
+        .help = "reference designation string",
+    },{
+        .name = "kind",
+        .type = QEMU_OPT_STRING,
+        .help = "device type",
+        .def_value_str = "other",
+    },{
+        .name = "instance",
+        .type = QEMU_OPT_NUMBER,
+        .help = "device type instance",
+    },{
+        .name = "pci",
+        .type = QEMU_OPT_STRING,
+        .help = "PCI device",
+        .def_value_str = "0:0.0",
+    },
+    { /* end of list */ }
+};
+
 static void smbios_register_config(void)
 {
     qemu_add_opts(&qemu_smbios_opts);
@@ -773,6 +826,26 @@ static void smbios_build_type_32_table(void)
     SMBIOS_BUILD_TABLE_POST;
 }
 
+static void smbios_build_type_41_table(void)
+{
+    unsigned instance = 0;
+    struct type41_instance *t41;
+
+    QTAILQ_FOREACH(t41, &type41, next) {
+        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
+
+        SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
+        t->device_type = t41->kind;
+        t->device_type_instance = t41->instance;
+        t->segment_group_number = cpu_to_le16(t41->pci.segment);
+        t->bus_number = t41->pci.bus;
+        t->device_number = t41->pci.device;
+
+        SMBIOS_BUILD_TABLE_POST;
+        instance++;
+    }
+}
+
 static void smbios_build_type_127_table(void)
 {
     SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
@@ -928,6 +1001,7 @@ void smbios_get_tables(MachineState *ms,
 
         smbios_build_type_32_table();
         smbios_build_type_38_table();
+        smbios_build_type_41_table();
         smbios_build_type_127_table();
 
         smbios_validate_table(ms);
@@ -1224,6 +1298,51 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             save_opt(&type17.part, opts, "part");
             type17.speed = qemu_opt_get_number(opts, "speed", 0);
             return;
+        case 41: {
+            struct type41_instance *t;
+            Error *local_err = NULL;
+            int pseg, pbus, pdevice, pfunction;
+
+            if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
+                return;
+            }
+            t = calloc(1, sizeof(struct type41_instance));
+            if (!t) {
+                error_setg(errp,
+                           "Unable to allocate memory for a new type 41 instance");
+                return;
+            }
+
+            save_opt(&t->designation, opts, "designation");
+            t->kind = qapi_enum_parse(&type41_kind_lookup,
+                                      qemu_opt_get(opts, "kind"),
+                                      0, &local_err) + 1;
+            t->kind |= 0x80;     /* enabled */
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                free(t);
+                return;
+            }
+            t->instance = qemu_opt_get_number(opts, "instance", 1);
+            if (sscanf(qemu_opt_get(opts, "pci"), "%x:%x:%x.%x",
+                       &pseg,
+                       &pbus,
+                       &pdevice,
+                       &pfunction) != 4) {
+                error_setg(errp, "unable to parse %s: %s",
+                           qemu_opt_get(opts, "pci"),
+                           g_strerror(errno));
+                free(t);
+                return;
+            }
+            t->pci.segment = pseg;
+            t->pci.bus = pbus;
+            t->pci.device = ((uint8_t)pdevice << 3) +
+                ((uint8_t)pfunction & 0x7);
+
+            QTAILQ_INSERT_TAIL(&type41, t, next);
+            return;
+        }
         default:
             error_setg(errp,
                        "Don't know how to build fields for SMBIOS type %ld",
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 02a0ced0a09f..4504dd03c303 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -258,6 +258,17 @@ struct smbios_type_32 {
     uint8_t boot_status;
 } QEMU_PACKED;
 
+/* SMBIOS type 41 - Onboard Devices Extended Information */
+struct smbios_type_41 {
+    struct smbios_structure_header header;
+    uint8_t reference_designation_str;
+    uint8_t device_type;
+    uint8_t device_type_instance;
+    uint16_t segment_group_number;
+    uint8_t bus_number;
+    uint8_t device_number;
+} QEMU_PACKED;
+
 /* SMBIOS type 127 -- End-of-table */
 struct smbios_type_127 {
     struct smbios_structure_header header;
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd61d..eb2de7c372c7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2370,7 +2370,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 11 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
     "               [,asset=str][,part=str][,speed=%d]\n"
-    "                specify SMBIOS type 17 fields\n",
+    "                specify SMBIOS type 17 fields\n"
+    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pci=%x:%x:%x.%x]\n"
+    "                specify SMBIOS type 41 fields\n",
     QEMU_ARCH_I386 | QEMU_ARCH_ARM)
 SRST
 ``-smbios file=binary``
@@ -2432,6 +2434,9 @@ SRST
 
 ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
     Specify SMBIOS type 17 fields
+
+``-smbios type=41[,designation=str][,kind=str][,instance=%d][,dev=str]``
+    Specify SMBIOS type 41 fields
 ERST
 
 DEFHEADING()
-- 
2.31.0



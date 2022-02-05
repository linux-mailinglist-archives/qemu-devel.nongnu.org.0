Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1744AA580
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:59:28 +0100 (CET)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAMJ-0003Vh-DO
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7M-0003xV-SF
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7K-0003Pp-72
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=khQalQB6Tn2bzPaF1TcsZBjtnToq63R/r1Y7j7Hsluw=;
 b=AqK9O0PHM4C3El7/NUl7UGvp2eTeI19N/1PoWGXFasRCRikxSRFO8p7uEtdAePYGBMMwUO
 vN7BTI5QaQ7kTAX3QE0Q9xZ1b6vp4tqpCWHz2+N/kTGHJRbEMg5IOopmR6wvd0k5on2dRC
 xgjIdNLXbPz0kEztbe9CGW9J6Xsf6dk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-nYUuqedrPZ-eKU-KJBE4mQ-1; Fri, 04 Feb 2022 20:43:56 -0500
X-MC-Unique: nYUuqedrPZ-eKU-KJBE4mQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n22-20020a05600c3b9600b00352d3f6a850so1218932wms.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=khQalQB6Tn2bzPaF1TcsZBjtnToq63R/r1Y7j7Hsluw=;
 b=U6YtQM7ZU1Yz8MqoV4N/KQBciNULk6OFJNv8eXV/XaeyKmtogxju+2/kKU6pi+favp
 Z0xMsyPmdZogrCGIoiclW0SLVPfE9N09rDDphODbYDOXuANVYHb8WyBjjHbNALhFWLc9
 JwX9KqsUJryBBHlwzBR9sscMqQoj3o4EyNS17TcyTY19Dw/KYEoqsngzAVMkMRidzmxM
 8Nj6sQ/tEEBkwnRkUn1oqDhWJKcii5/Civ5dm44bpKA+dBePTvbDw65t75honV23xwS5
 Nx8ljPVL++h3LUYRihdqhE9oFzpToLAaxvFaNQl+ODI4SgkvESUce1CmVSZomH9FeRl3
 l7Mg==
X-Gm-Message-State: AOAM532vvHjil2tRkff1n41h5PYUBMEkG7+d4oAvizYIlABGkAPUqUAZ
 Zq3uO8hnk7t0uNif4PEBfTMd9zwilY3LmLv6gsXeOBblwjunv3pKeF8rv/84es8OsDJ5nPsEwiR
 bKggt+RgtieW/7fEgJBd7/m4LiA4APrgVfEu+WMb9CioJeI61igyqs53xzHw2
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr4382794wmc.177.1644025435389; 
 Fri, 04 Feb 2022 17:43:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtUOOLBJnF2zXv2zAj5RmbXeduo/Kvpp3VFqi5M4S7yX9UARPjBFkfMPh72QzAyDsWxIvbsA==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr4382784wmc.177.1644025435061; 
 Fri, 04 Feb 2022 17:43:55 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id s9sm3435810wrr.84.2022.02.04.17.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:54 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/32] ACPI ERST: build the ACPI ERST table
Message-ID: <20220205014149.1189026-28-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

This builds the ACPI ERST table to inform OSPM how to communicate
with the acpi-erst device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1643402289-22216-7-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c | 211 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index fe9ba51de7..cd32aa7d4f 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -59,6 +59,27 @@
 #define STATUS_RECORD_STORE_EMPTY     0x04
 #define STATUS_RECORD_NOT_FOUND       0x05
 
+/* ACPI 4.0: Table 17-19 Serialization Instructions */
+#define INST_READ_REGISTER                 0x00
+#define INST_READ_REGISTER_VALUE           0x01
+#define INST_WRITE_REGISTER                0x02
+#define INST_WRITE_REGISTER_VALUE          0x03
+#define INST_NOOP                          0x04
+#define INST_LOAD_VAR1                     0x05
+#define INST_LOAD_VAR2                     0x06
+#define INST_STORE_VAR1                    0x07
+#define INST_ADD                           0x08
+#define INST_SUBTRACT                      0x09
+#define INST_ADD_VALUE                     0x0A
+#define INST_SUBTRACT_VALUE                0x0B
+#define INST_STALL                         0x0C
+#define INST_STALL_WHILE_TRUE              0x0D
+#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define INST_GOTO                          0x0F
+#define INST_SET_SRC_ADDRESS_BASE          0x10
+#define INST_SET_DST_ADDRESS_BASE          0x11
+#define INST_MOVE_DATA                     0x12
+
 /* UEFI 2.1: Appendix N Common Platform Error Record */
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
@@ -170,6 +191,196 @@ typedef struct {
 
 } ERSTDeviceState;
 
+/*******************************************************************/
+/*******************************************************************/
+typedef struct {
+    GArray *table_data;
+    pcibus_t bar;
+    uint8_t instruction;
+    uint8_t flags;
+    uint8_t register_bit_width;
+    pcibus_t register_offset;
+} BuildSerializationInstructionEntry;
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction(
+    BuildSerializationInstructionEntry *e,
+    uint8_t serialization_action,
+    uint64_t value)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+    uint64_t mask;
+
+    /* Serialization Action */
+    build_append_int_noprefix(e->table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(e->table_data, e->instruction, 1);
+    /* Flags */
+    build_append_int_noprefix(e->table_data, e->flags, 1);
+    /* Reserved */
+    build_append_int_noprefix(e->table_data, 0, 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = e->register_bit_width;
+    gas.bit_offset = 0;
+    gas.access_width = (uint8_t)ctz32(e->register_bit_width) - 2;
+    gas.address = (uint64_t)(e->bar + e->register_offset);
+    build_append_gas_from_struct(e->table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(e->table_data, value, 8);
+    /* Mask */
+    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
+    build_append_int_noprefix(e->table_data, mask, 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    unsigned action;
+    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+    /* Contexts for the different ways ACTION and VALUE are accessed */
+    BuildSerializationInstructionEntry rd_value_32_val = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_READ_REGISTER_VALUE,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry rd_value_32 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_READ_REGISTER,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry rd_value_64 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_READ_REGISTER,
+        .register_bit_width = 64,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_32_val = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER_VALUE,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_32 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_64 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER,
+        .register_bit_width = 64,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_action = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER_VALUE,
+        .register_bit_width = 32,
+        .register_offset = ERST_ACTION_OFFSET,
+    };
+
+    trace_acpi_erst_pci_bar_0(bar0);
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction(&wr_value_32, action, 0);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction(&wr_value_32_val, action,
+        ERST_EXECUTE_OPERATION_MAGIC);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32_val, action, 0x01);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction(&wr_value_64, action, 0);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    /* Serialization Header */
+    acpi_table_begin(&table, table_data);
+
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    g_assert((table_instruction_data->len) % 32 == 0);
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    acpi_table_end(linker, &table);
+}
+
 /*******************************************************************/
 /*******************************************************************/
 static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
-- 
MST



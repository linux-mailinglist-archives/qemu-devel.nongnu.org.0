Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823BB1E117A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 17:16:11 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdEpm-0007SK-EX
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 11:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdEhR-00060h-Kc
 for qemu-devel@nongnu.org; Mon, 25 May 2020 11:07:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55474
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdEhQ-0006lT-1h
 for qemu-devel@nongnu.org; Mon, 25 May 2020 11:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590419250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzY0Zi9W4LdLuqEd5SDPILPIqLHrl6uTPzfQWotzWik=;
 b=LScRIRrkjK67npQmwyPGIRgtEuhl5DVkAYSHUewX7PI915dz4IvJyXuOnlP8Yi8TQNG/yZ
 YZHihpyoXRwEKzAgsLNM/j6uM3jhqjVKNJFq2HkvHMlCmvjVvIvJKcCq1rhshiM87AcRYe
 G7sYltGN6X2OnSmeKdCkMNPFQNG2mKI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Am5Ly--lP8CYL8y4Yx4V9g-1; Mon, 25 May 2020 11:07:29 -0400
X-MC-Unique: Am5Ly--lP8CYL8y4Yx4V9g-1
Received: by mail-ej1-f72.google.com with SMTP id bo19so2894503ejb.0
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 08:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzY0Zi9W4LdLuqEd5SDPILPIqLHrl6uTPzfQWotzWik=;
 b=hshXrpqx2qxJq7zUTqEYqyTC6q930y0KuYMXZqVVf17RGtJlg3hfEQq3She0UcIY/J
 0k5axF3mLE+5HiUH/i8zAt0rw4W/P2jJd8rwMDXaFbIvLgLe19Xz1CUuJ3Dp2P+u5tAm
 fN8HeY6atBZ0V7xn01xR4s69qEcxLKDzfx98nnHWi/YcJmqn9MaCZWQShmq7snkbZeBr
 rGFSm2gROZdsjTpEUxX4rr8W+dH5HxE3yPXYLLtP99abQ0WjKKK09STrr7m4tuTNLjL/
 U3Vl9qOgiHsFOPiaZ6OZHWGTj+u2a6sTxOZTWZ/R4SXMgq83I3tO3fCcx2RmNQUJ0vqU
 CxjA==
X-Gm-Message-State: AOAM530T28e3/22CMFEe5+5kLbiiqp6u8ThndAxJAVccxdCtT/lblr0J
 wzLFo4nLefHzC9iGh9KEUS8nyXq16xGsgJrQF6XmvRm4lcPw7uXNwBb94NiNDY2xLvWFkmK7eXs
 3QjnTqyzc5qjLAuw=
X-Received: by 2002:aa7:db4a:: with SMTP id n10mr15872719edt.11.1590419246900; 
 Mon, 25 May 2020 08:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Y5ycO7FJSq/p+tdTdtlrMuLAnL8w5xb1miKZz3vITdkhWsGqffRKPud3DAqxaubOmrR2oA==
X-Received: by 2002:aa7:db4a:: with SMTP id n10mr15872661edt.11.1590419246412; 
 Mon, 25 May 2020 08:07:26 -0700 (PDT)
Received: from x1w.redhat.com (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id i6sm14394964ejh.4.2020.05.25.08.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 08:07:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] qapi/misc: Restrict ACPI commands to machine code
Date: Mon, 25 May 2020 17:06:38 +0200
Message-Id: <20200525150640.30879-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200525150640.30879-1-philmd@redhat.com>
References: <20200525150640.30879-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ben Warren <ben@skyportsystems.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Lieven <pl@kamp.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json                    | 154 +++++++++++++++++++++++++++
 qapi/misc.json                       | 154 ---------------------------
 include/hw/acpi/acpi_dev_interface.h |   2 +-
 hw/acpi/core.c                       |   2 +-
 hw/acpi/cpu.c                        |   2 +-
 hw/acpi/memory_hotplug.c             |   2 +-
 6 files changed, 158 insertions(+), 158 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 7420c4f5ee..04b124be67 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1061,3 +1061,157 @@
 ##
 { 'event': 'BALLOON_CHANGE',
   'data': { 'actual': 'int' } }
+
+##
+# @AcpiTableOptions:
+#
+# Specify an ACPI table on the command line to load.
+#
+# At most one of @file and @data can be specified. The list of files specified
+# by any one of them is loaded and concatenated in order. If both are omitted,
+# @data is implied.
+#
+# Other fields / optargs can be used to override fields of the generic ACPI
+# table header; refer to the ACPI specification 5.0, section 5.2.6 System
+# Description Table Header. If a header field is not overridden, then the
+# corresponding value from the concatenated blob is used (in case of @file), or
+# it is filled in with a hard-coded value (in case of @data).
+#
+# String fields are copied into the matching ACPI member from lowest address
+# upwards, and silently truncated / NUL-padded to length.
+#
+# @sig: table signature / identifier (4 bytes)
+#
+# @rev: table revision number (dependent on signature, 1 byte)
+#
+# @oem_id: OEM identifier (6 bytes)
+#
+# @oem_table_id: OEM table identifier (8 bytes)
+#
+# @oem_rev: OEM-supplied revision number (4 bytes)
+#
+# @asl_compiler_id: identifier of the utility that created the table
+#                   (4 bytes)
+#
+# @asl_compiler_rev: revision number of the utility that created the
+#                    table (4 bytes)
+#
+# @file: colon (:) separated list of pathnames to load and
+#        concatenate as table data. The resultant binary blob is expected to
+#        have an ACPI table header. At least one file is required. This field
+#        excludes @data.
+#
+# @data: colon (:) separated list of pathnames to load and
+#        concatenate as table data. The resultant binary blob must not have an
+#        ACPI table header. At least one file is required. This field excludes
+#        @file.
+#
+# Since: 1.5
+##
+{ 'struct': 'AcpiTableOptions',
+  'data': {
+    '*sig':               'str',
+    '*rev':               'uint8',
+    '*oem_id':            'str',
+    '*oem_table_id':      'str',
+    '*oem_rev':           'uint32',
+    '*asl_compiler_id':   'str',
+    '*asl_compiler_rev':  'uint32',
+    '*file':              'str',
+    '*data':              'str' }}
+
+##
+# @MEM_UNPLUG_ERROR:
+#
+# Emitted when memory hot unplug error occurs.
+#
+# @device: device name
+#
+# @msg: Informative message
+#
+# Since: 2.4
+#
+# Example:
+#
+# <- { "event": "MEM_UNPLUG_ERROR"
+#      "data": { "device": "dimm1",
+#                "msg": "acpi: device unplug for unsupported device"
+#      },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'MEM_UNPLUG_ERROR',
+  'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @ACPISlotType:
+#
+# @DIMM: memory slot
+# @CPU: logical CPU slot (since 2.7)
+##
+{ 'enum': 'ACPISlotType', 'data': [ 'DIMM', 'CPU' ] }
+
+##
+# @ACPIOSTInfo:
+#
+# OSPM Status Indication for a device
+# For description of possible values of @source and @status fields
+# see "_OST (OSPM Status Indication)" chapter of ACPI5.0 spec.
+#
+# @device: device ID associated with slot
+#
+# @slot: slot ID, unique per slot of a given @slot-type
+#
+# @slot-type: type of the slot
+#
+# @source: an integer containing the source event
+#
+# @status: an integer containing the status code
+#
+# Since: 2.1
+##
+{ 'struct': 'ACPIOSTInfo',
+  'data'  : { '*device': 'str',
+              'slot': 'str',
+              'slot-type': 'ACPISlotType',
+              'source': 'int',
+              'status': 'int' } }
+
+##
+# @query-acpi-ospm-status:
+#
+# Return a list of ACPIOSTInfo for devices that support status
+# reporting via ACPI _OST method.
+#
+# Since: 2.1
+#
+# Example:
+#
+# -> { "execute": "query-acpi-ospm-status" }
+# <- { "return": [ { "device": "d1", "slot": "0", "slot-type": "DIMM", "source": 1, "status": 0},
+#                  { "slot": "1", "slot-type": "DIMM", "source": 0, "status": 0},
+#                  { "slot": "2", "slot-type": "DIMM", "source": 0, "status": 0},
+#                  { "slot": "3", "slot-type": "DIMM", "source": 0, "status": 0}
+#    ]}
+#
+##
+{ 'command': 'query-acpi-ospm-status', 'returns': ['ACPIOSTInfo'] }
+
+##
+# @ACPI_DEVICE_OST:
+#
+# Emitted when guest executes ACPI _OST method.
+#
+# @info: OSPM Status Indication
+#
+# Since: 2.1
+#
+# Example:
+#
+# <- { "event": "ACPI_DEVICE_OST",
+#      "data": { "device": "d1", "slot": "0",
+#                "slot-type": "DIMM", "source": 1, "status": 0 } }
+#
+##
+{ 'event': 'ACPI_DEVICE_OST',
+     'data': { 'info': 'ACPIOSTInfo' } }
diff --git a/qapi/misc.json b/qapi/misc.json
index 49ca97f712..ecceba9d32 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -1000,64 +1000,6 @@
 ##
 { 'command': 'query-fdsets', 'returns': ['FdsetInfo'] }
 
-##
-# @AcpiTableOptions:
-#
-# Specify an ACPI table on the command line to load.
-#
-# At most one of @file and @data can be specified. The list of files specified
-# by any one of them is loaded and concatenated in order. If both are omitted,
-# @data is implied.
-#
-# Other fields / optargs can be used to override fields of the generic ACPI
-# table header; refer to the ACPI specification 5.0, section 5.2.6 System
-# Description Table Header. If a header field is not overridden, then the
-# corresponding value from the concatenated blob is used (in case of @file), or
-# it is filled in with a hard-coded value (in case of @data).
-#
-# String fields are copied into the matching ACPI member from lowest address
-# upwards, and silently truncated / NUL-padded to length.
-#
-# @sig: table signature / identifier (4 bytes)
-#
-# @rev: table revision number (dependent on signature, 1 byte)
-#
-# @oem_id: OEM identifier (6 bytes)
-#
-# @oem_table_id: OEM table identifier (8 bytes)
-#
-# @oem_rev: OEM-supplied revision number (4 bytes)
-#
-# @asl_compiler_id: identifier of the utility that created the table
-#                   (4 bytes)
-#
-# @asl_compiler_rev: revision number of the utility that created the
-#                    table (4 bytes)
-#
-# @file: colon (:) separated list of pathnames to load and
-#        concatenate as table data. The resultant binary blob is expected to
-#        have an ACPI table header. At least one file is required. This field
-#        excludes @data.
-#
-# @data: colon (:) separated list of pathnames to load and
-#        concatenate as table data. The resultant binary blob must not have an
-#        ACPI table header. At least one file is required. This field excludes
-#        @file.
-#
-# Since: 1.5
-##
-{ 'struct': 'AcpiTableOptions',
-  'data': {
-    '*sig':               'str',
-    '*rev':               'uint8',
-    '*oem_id':            'str',
-    '*oem_table_id':      'str',
-    '*oem_rev':           'uint32',
-    '*asl_compiler_id':   'str',
-    '*asl_compiler_rev':  'uint32',
-    '*file':              'str',
-    '*data':              'str' }}
-
 ##
 # @CommandLineParameterType:
 #
@@ -1250,102 +1192,6 @@
 ##
 { 'command': 'query-memory-devices', 'returns': ['MemoryDeviceInfo'] }
 
-##
-# @MEM_UNPLUG_ERROR:
-#
-# Emitted when memory hot unplug error occurs.
-#
-# @device: device name
-#
-# @msg: Informative message
-#
-# Since: 2.4
-#
-# Example:
-#
-# <- { "event": "MEM_UNPLUG_ERROR"
-#      "data": { "device": "dimm1",
-#                "msg": "acpi: device unplug for unsupported device"
-#      },
-#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
-##
-{ 'event': 'MEM_UNPLUG_ERROR',
-  'data': { 'device': 'str', 'msg': 'str' } }
-
-##
-# @ACPISlotType:
-#
-# @DIMM: memory slot
-# @CPU: logical CPU slot (since 2.7)
-##
-{ 'enum': 'ACPISlotType', 'data': [ 'DIMM', 'CPU' ] }
-
-##
-# @ACPIOSTInfo:
-#
-# OSPM Status Indication for a device
-# For description of possible values of @source and @status fields
-# see "_OST (OSPM Status Indication)" chapter of ACPI5.0 spec.
-#
-# @device: device ID associated with slot
-#
-# @slot: slot ID, unique per slot of a given @slot-type
-#
-# @slot-type: type of the slot
-#
-# @source: an integer containing the source event
-#
-# @status: an integer containing the status code
-#
-# Since: 2.1
-##
-{ 'struct': 'ACPIOSTInfo',
-  'data'  : { '*device': 'str',
-              'slot': 'str',
-              'slot-type': 'ACPISlotType',
-              'source': 'int',
-              'status': 'int' } }
-
-##
-# @query-acpi-ospm-status:
-#
-# Return a list of ACPIOSTInfo for devices that support status
-# reporting via ACPI _OST method.
-#
-# Since: 2.1
-#
-# Example:
-#
-# -> { "execute": "query-acpi-ospm-status" }
-# <- { "return": [ { "device": "d1", "slot": "0", "slot-type": "DIMM", "source": 1, "status": 0},
-#                  { "slot": "1", "slot-type": "DIMM", "source": 0, "status": 0},
-#                  { "slot": "2", "slot-type": "DIMM", "source": 0, "status": 0},
-#                  { "slot": "3", "slot-type": "DIMM", "source": 0, "status": 0}
-#    ]}
-#
-##
-{ 'command': 'query-acpi-ospm-status', 'returns': ['ACPIOSTInfo'] }
-
-##
-# @ACPI_DEVICE_OST:
-#
-# Emitted when guest executes ACPI _OST method.
-#
-# @info: OSPM Status Indication
-#
-# Since: 2.1
-#
-# Example:
-#
-# <- { "event": "ACPI_DEVICE_OST",
-#      "data": { "device": "d1", "slot": "0",
-#                "slot-type": "DIMM", "source": 1, "status": 0 } }
-#
-##
-{ 'event': 'ACPI_DEVICE_OST',
-     'data': { 'info': 'ACPIOSTInfo' } }
-
 ##
 # @ReplayMode:
 #
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index a2a12af9b9..a1b63d51db 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -1,7 +1,7 @@
 #ifndef ACPI_DEV_INTERFACE_H
 #define ACPI_DEV_INTERFACE_H
 
-#include "qapi/qapi-types-misc.h"
+#include "qapi/qapi-types-machine.h"
 #include "qom/object.h"
 #include "hw/boards.h"
 #include "hw/qdev-core.h"
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 45cbed49ab..4f8d90f50b 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -27,7 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/opts-visitor.h"
 #include "qapi/qapi-events-run-state.h"
-#include "qapi/qapi-visit-misc.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 3d6a500fb7..532d8a6e4b 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -3,7 +3,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc.h"
+#include "qapi/qapi-events-machine.h"
 #include "trace.h"
 #include "sysemu/numa.h"
 
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 8d2e82240f..aa454f5cb2 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -7,7 +7,7 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc.h"
+#include "qapi/qapi-events-machine.h"
 
 #define MEMORY_SLOTS_NUMBER          "MDNR"
 #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
-- 
2.21.3



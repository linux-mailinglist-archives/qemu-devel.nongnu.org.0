Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB355ABD4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:50:08 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59v5-0007s9-P8
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@kangae.exyr.org>)
 id 1o58jE-0005Pu-E2
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:33:49 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:56929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@kangae.exyr.org>)
 id 1o58jB-0002bW-R1
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0xGlG45MqkJpcMIUzJEb5Z2g2YpmBdyWzGO8wFyoOo=; b=V+DHCVdw7Ki708Ic/5jGMrVUyj
 uE23KzoXcL3fi7OY0Ou2evEf6ZMynCSnvBHTMrCtDg1MUA5PUYcWTkX2RTbSiDu3MXjpRmZXqSr2v
 U9uKu360HIXAvqZjgR3V2XlxIKKtyvBa40hcSanfv0kOg3rrvZpkgBIyfdMf2Vrke29k=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee] (helo=kangae.exyr.org)
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <simon@kangae.exyr.org>)
 id 1o58Re-00073x-UJ; Sat, 25 Jun 2022 18:15:38 +0200
Received: from simon by kangae.exyr.org with local (Exim 4.95)
 (envelope-from <simon@kangae.exyr.org>) id 1o58Re-005Anh-NQ;
 Sat, 25 Jun 2022 18:15:38 +0200
From: Simon Sapin <simon.sapin@exyr.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Simon Sapin <simon.sapin@exyr.org>
Subject: [PATCH 2/2] Convert fw_cfg.rst to reStructuredText syntax
Date: Sat, 25 Jun 2022 18:14:55 +0200
Message-Id: <20220625161455.1232954-2-simon.sapin@exyr.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625161455.1232954-1-simon.sapin@exyr.org>
References: <20220625161455.1232954-1-simon.sapin@exyr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-alwaysdata-ID: 127134847
Received-SPF: none client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon@kangae.exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jun 2022 13:44:35 -0400
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

And add it to specs/index.rst

Signed-off-by: Simon Sapin <simon.sapin@exyr.org>
---
 docs/specs/fw_cfg.rst | 211 +++++++++++++++++++++++-------------------
 docs/specs/index.rst  |   1 +
 2 files changed, 119 insertions(+), 93 deletions(-)

diff --git docs/specs/fw_cfg.rst docs/specs/fw_cfg.rst
index 3e6d586f66..5ad47a901c 100644
--- docs/specs/fw_cfg.rst
+++ docs/specs/fw_cfg.rst
@@ -1,7 +1,9 @@
+===========================================
 QEMU Firmware Configuration (fw_cfg) Device
 ===========================================
 
-= Guest-side Hardware Interface =
+Guest-side Hardware Interface
+=============================
 
 This hardware interface allows the guest to retrieve various data items
 (blobs) that can influence how the firmware configures itself, or may
@@ -9,7 +11,8 @@ contain tables to be installed for the guest OS. Examples include device
 boot order, ACPI and SMBIOS tables, virtual machine UUID, SMP and NUMA
 information, kernel/initrd images for direct (Linux) kernel booting, etc.
 
-== Selector (Control) Register ==
+Selector (Control) Register
+---------------------------
 
 * Write only
 * Location: platform dependent (IOport or MMIO)
@@ -30,10 +33,12 @@ of 1 means the item's data can be overwritten by writes to the data
 register. In other words, configuration write mode is enabled when
 the selector value is between 0x4000-0x7fff or 0xc000-0xffff.
 
-NOTE: As of QEMU v2.4, writes to the fw_cfg data register are no
+.. NOTE::
+      As of QEMU v2.4, writes to the fw_cfg data register are no
       longer supported, and will be ignored (treated as no-ops)!
 
-NOTE: As of QEMU v2.9, writes are reinstated, but only through the DMA
+.. NOTE::
+      As of QEMU v2.9, writes are reinstated, but only through the DMA
       interface (see below). Furthermore, writeability of any specific item is
       governed independently of Bit14 in the selector key value.
 
@@ -45,17 +50,19 @@ items are accessed with a selector value between 0x0000-0x7fff, and
 architecture specific configuration items are accessed with a selector
 value between 0x8000-0xffff.
 
-== Data Register ==
+Data Register
+-------------
 
 * Read/Write (writes ignored as of QEMU v2.4, but see the DMA interface)
-* Location: platform dependent (IOport [*] or MMIO)
+* Location: platform dependent (IOport [#]_ or MMIO)
 * Width: 8-bit (if IOport), 8/16/32/64-bit (if MMIO)
 * Endianness: string-preserving
 
-[*] On platforms where the data register is exposed as an IOport, its
-port number will always be one greater than the port number of the
-selector register. In other words, the two ports overlap, and can not
-be mapped separately.
+.. [#]
+    On platforms where the data register is exposed as an IOport, its
+    port number will always be one greater than the port number of the
+    selector register. In other words, the two ports overlap, and can not
+    be mapped separately.
 
 The data register allows access to an array of bytes for each firmware
 configuration data item. The specific item is selected by writing to
@@ -74,91 +81,103 @@ An N-byte wide read of the data register will return the next available
 N bytes of the selected firmware configuration item, as a substring, in
 increasing address order, similar to memcpy().
 
-== Register Locations ==
-
-=== x86, x86_64 Register Locations ===
+Register Locations
+------------------
 
-Selector Register IOport: 0x510
-Data Register IOport:     0x511
-DMA Address IOport:       0x514
+x86, x86_64
+    * Selector Register IOport: 0x510
+    * Data Register IOport:     0x511
+    * DMA Address IOport:       0x514
 
-=== Arm Register Locations ===
+Arm
+    * Selector Register address: Base + 8 (2 bytes)
+    * Data Register address:     Base + 0 (8 bytes)
+    * DMA Address address:       Base + 16 (8 bytes)
 
-Selector Register address: Base + 8 (2 bytes)
-Data Register address:     Base + 0 (8 bytes)
-DMA Address address:       Base + 16 (8 bytes)
+ACPI Interface
+--------------
 
-== ACPI Interface ==
-
-The fw_cfg device is defined with ACPI ID "QEMU0002". Since we expect
+The fw_cfg device is defined with ACPI ID ``QEMU0002``. Since we expect
 ACPI tables to be passed into the guest through the fw_cfg device itself,
 the guest-side firmware can not use ACPI to find fw_cfg. However, once the
 firmware is finished setting up ACPI tables and hands control over to the
 guest kernel, the latter can use the fw_cfg ACPI node for a more accurate
 inventory of in-use IOport or MMIO regions.
 
-== Firmware Configuration Items ==
+Firmware Configuration Items
+----------------------------
 
-=== Signature (Key 0x0000, FW_CFG_SIGNATURE) ===
+Signature (Key 0x0000, ``FW_CFG_SIGNATURE``)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The presence of the fw_cfg selector and data registers can be verified
-by selecting the "signature" item using key 0x0000 (FW_CFG_SIGNATURE),
+by selecting the "signature" item using key 0x0000 (``FW_CFG_SIGNATURE``),
 and reading four bytes from the data register. If the fw_cfg device is
-present, the four bytes read will contain the characters "QEMU".
+present, the four bytes read will contain the characters ``QEMU``.
 
 If the DMA interface is available, then reading the DMA Address
-Register returns 0x51454d5520434647 ("QEMU CFG" in big-endian format).
+Register returns 0x51454d5520434647 (``QEMU CFG`` in big-endian format).
 
-=== Revision / feature bitmap (Key 0x0001, FW_CFG_ID) ===
+Revision / feature bitmap (Key 0x0001, ``FW_CFG_ID``)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 A 32-bit little-endian unsigned int, this item is used to check for enabled
 features.
- - Bit 0: traditional interface. Always set.
- - Bit 1: DMA interface.
 
-=== File Directory (Key 0x0019, FW_CFG_FILE_DIR) ===
+- Bit 0: traditional interface. Always set.
+- Bit 1: DMA interface.
+
+File Directory (Key 0x0019, ``FW_CFG_FILE_DIR``)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. highlight:: c
 
 Firmware configuration items stored at selector keys 0x0020 or higher
-(FW_CFG_FILE_FIRST or higher) have an associated entry in a directory
+(``FW_CFG_FILE_FIRST`` or higher) have an associated entry in a directory
 structure, which makes it easier for guest-side firmware to identify
-and retrieve them. The format of this file directory (from fw_cfg.h in
-the QEMU source tree) is shown here, slightly annotated for clarity:
+and retrieve them. The format of this file directory (from ``fw_cfg.h`` in
+the QEMU source tree) is shown here, slightly annotated for clarity::
 
-struct FWCfgFiles {		/* the entire file directory fw_cfg item */
-    uint32_t count;		/* number of entries, in big-endian format */
-    struct FWCfgFile f[];	/* array of file entries, see below */
-};
+    struct FWCfgFiles {		/* the entire file directory fw_cfg item */
+        uint32_t count;		/* number of entries, in big-endian format */
+        struct FWCfgFile f[];	/* array of file entries, see below */
+    };
 
-struct FWCfgFile {		/* an individual file entry, 64 bytes total */
-    uint32_t size;		/* size of referenced fw_cfg item, big-endian */
-    uint16_t select;		/* selector key of fw_cfg item, big-endian */
-    uint16_t reserved;
-    char name[56];		/* fw_cfg item name, NUL-terminated ascii */
-};
+    struct FWCfgFile {		/* an individual file entry, 64 bytes total */
+        uint32_t size;		/* size of referenced fw_cfg item, big-endian */
+        uint16_t select;	/* selector key of fw_cfg item, big-endian */
+        uint16_t reserved;
+        char name[56];		/* fw_cfg item name, NUL-terminated ascii */
+    };
 
-=== All Other Data Items ===
+All Other Data Items
+~~~~~~~~~~~~~~~~~~~~
 
 Please consult the QEMU source for the most up-to-date and authoritative list
 of selector keys and their respective items' purpose, format and writeability.
 
-=== Ranges ===
+Ranges
+~~~~~~
 
 Theoretically, there may be up to 0x4000 generic firmware configuration
 items, and up to 0x4000 architecturally specific ones.
 
+===============  ===========
 Selector Reg.    Range Usage
----------------  -----------
+===============  ===========
 0x0000 - 0x3fff  Generic (0x0000 - 0x3fff, generally RO, possibly RW through
-                          the DMA interface in QEMU v2.9+)
+                 the DMA interface in QEMU v2.9+)
 0x4000 - 0x7fff  Generic (0x0000 - 0x3fff, RW, ignored in QEMU v2.4+)
 0x8000 - 0xbfff  Arch. Specific (0x0000 - 0x3fff, generally RO, possibly RW
-                                 through the DMA interface in QEMU v2.9+)
+                 through the DMA interface in QEMU v2.9+)
 0xc000 - 0xffff  Arch. Specific (0x0000 - 0x3fff, RW, ignored in v2.4+)
+===============  ===========
 
 In practice, the number of allowed firmware configuration items depends on the
 machine type/version.
 
-= Guest-side DMA Interface =
+Guest-side DMA Interface
+========================
 
 If bit 1 of the feature bitmap is set, the DMA interface is present. This does
 not replace the existing fw_cfg interface, it is an add-on. This interface
@@ -171,68 +190,74 @@ addresses can be triggered with just one write, whereas operations with
 64-bit addresses can be triggered with one 64-bit write or two 32-bit writes,
 starting with the most significant half (at offset 0).
 
-In this register, the physical address of a FWCfgDmaAccess structure in RAM
-should be written. This is the format of the FWCfgDmaAccess structure:
+In this register, the physical address of a ``FWCfgDmaAccess`` structure in RAM
+should be written. This is the format of the ``FWCfgDmaAccess`` structure::
 
-typedef struct FWCfgDmaAccess {
-    uint32_t control;
-    uint32_t length;
-    uint64_t address;
-} FWCfgDmaAccess;
+    typedef struct FWCfgDmaAccess {
+        uint32_t control;
+        uint32_t length;
+        uint64_t address;
+    } FWCfgDmaAccess;
 
 The fields of the structure are in big endian mode, and the field at the lowest
-address is the "control" field.
+address is the ``control`` field.
+
+The ``control`` field has the following bits:
 
-The "control" field has the following bits:
- - Bit 0: Error
- - Bit 1: Read
- - Bit 2: Skip
- - Bit 3: Select. The upper 16 bits are the selected index.
- - Bit 4: Write
+- Bit 0: Error
+- Bit 1: Read
+- Bit 2: Skip
+- Bit 3: Select. The upper 16 bits are the selected index.
+- Bit 4: Write
 
-When an operation is triggered, if the "control" field has bit 3 set, the
+When an operation is triggered, if the ``control`` field has bit 3 set, the
 upper 16 bits are interpreted as an index of a firmware configuration item.
 This has the same effect as writing the selector register.
 
-If the "control" field has bit 1 set, a read operation will be performed.
-"length" bytes for the current selector and offset will be copied into the
-physical RAM address specified by the "address" field.
+If the ``control`` field has bit 1 set, a read operation will be performed.
+``length`` bytes for the current selector and offset will be copied into the
+physical RAM address specified by the ``address`` field.
 
-If the "control" field has bit 4 set (and not bit 1), a write operation will be
-performed. "length" bytes will be copied from the physical RAM address
-specified by the "address" field to the current selector and offset. QEMU
+If the ``control`` field has bit 4 set (and not bit 1), a write operation will be
+performed. ``length`` bytes will be copied from the physical RAM address
+specified by the ``address`` field to the current selector and offset. QEMU
 prevents starting or finishing the write beyond the end of the item associated
 with the current selector (i.e., the item cannot be resized). Truncated writes
 are dropped entirely. Writes to read-only items are also rejected. All of these
-write errors set bit 0 (the error bit) in the "control" field.
+write errors set bit 0 (the error bit) in the ``control`` field.
 
-If the "control" field has bit 2 set (and neither bit 1 nor bit 4), a skip
+If the ``control`` field has bit 2 set (and neither bit 1 nor bit 4), a skip
 operation will be performed. The offset for the current selector will be
-advanced "length" bytes.
+advanced ``length`` bytes.
+
+To check the result, read the ``control`` field:
 
-To check the result, read the "control" field:
-   error bit set        ->  something went wrong.
-   all bits cleared     ->  transfer finished successfully.
-   otherwise            ->  transfer still in progress (doesn't happen
-                            today due to implementation not being async,
-                            but may in the future).
+Error bit set
+    Something went wrong.
+All bits cleared
+    Transfer finished successfully.
+Otherwise
+    Transfer still in progress
+    (doesn't happen today due to implementation not being async,
+    but may in the future).
 
-= Externally Provided Items =
+Externally Provided Items
+=========================
 
 Since v2.4, "file" fw_cfg items (i.e., items with selector keys above
-FW_CFG_FILE_FIRST, and with a corresponding entry in the fw_cfg file
+``FW_CFG_FILE_FIRST``, and with a corresponding entry in the fw_cfg file
 directory structure) may be inserted via the QEMU command line, using
-the following syntax:
+the following syntax::
 
     -fw_cfg [name=]<item_name>,file=<path>
 
-Or
+Or::
 
     -fw_cfg [name=]<item_name>,string=<string>
 
 Since v5.1, QEMU allows some objects to generate fw_cfg-specific content,
 the content is then associated with a "file" item using the 'gen_id' option
-in the command line, using the following syntax:
+in the command line, using the following syntax::
 
     -object <generator-type>,id=<generated_id>,[generator-specific-options] \
     -fw_cfg [name=]<item_name>,gen_id=<generated_id>
@@ -241,24 +266,24 @@ See QEMU man page for more documentation.
 
 Using item_name with plain ASCII characters only is recommended.
 
-Item names beginning with "opt/" are reserved for users.  QEMU will
+Item names beginning with ``opt/`` are reserved for users.  QEMU will
 never create entries with such names unless explicitly ordered by the
 user.
 
 To avoid clashes among different users, it is strongly recommended
-that you use names beginning with opt/RFQDN/, where RFQDN is a reverse
+that you use names beginning with ``opt/RFQDN/``, where RFQDN is a reverse
 fully qualified domain name you control.  For instance, if SeaBIOS
-wanted to define additional names, the prefix "opt/org.seabios/" would
+wanted to define additional names, the prefix ``opt/org.seabios/`` would
 be appropriate.
 
-For historical reasons, "opt/ovmf/" is reserved for OVMF firmware.
+For historical reasons, ``opt/ovmf/`` is reserved for OVMF firmware.
 
-Prefix "opt/org.qemu/" is reserved for QEMU itself.
+Prefix ``opt/org.qemu/`` is reserved for QEMU itself.
 
-Use of names not beginning with "opt/" is potentially dangerous and
+Use of names not beginning with ``opt/`` is potentially dangerous and
 entirely unsupported.  QEMU will warn if you try.
 
-Use of names not beginning with "opt/" is tolerated with 'gen_id' (that
+Use of names not beginning with ``opt/`` is tolerated with 'gen_id' (that
 is, the warning is suppressed), but you must know exactly what you're
 doing.
 
diff --git docs/specs/index.rst docs/specs/index.rst
index e10684bf53..a58d9311cb 100644
--- docs/specs/index.rst
+++ docs/specs/index.rst
@@ -20,3 +20,4 @@ guest hardware that is specific to QEMU.
    acpi_nvdimm
    acpi_erst
    sev-guest-firmware
+   fw_cfg
-- 
2.36.1



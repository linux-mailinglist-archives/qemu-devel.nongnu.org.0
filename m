Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A046124AA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 19:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oopaa-000289-To; Sat, 29 Oct 2022 13:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oopaV-00026b-35; Sat, 29 Oct 2022 13:25:41 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oopaS-0004Xv-LK; Sat, 29 Oct 2022 13:25:38 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id B3631DA0C54;
 Sat, 29 Oct 2022 19:25:31 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 71BCB462074; Sat, 29 Oct 2022 19:25:31 +0200 (CEST)
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 virtio-fs@redhat.com, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] Fix some typos in documentation and comments
Date: Sat, 29 Oct 2022 19:25:15 +0200
Message-Id: <20221029172515.217264-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Most of them were found and fixed using codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

My focus was fixing typos which are relevant for the generated documentation.

codespell finds many more typos in source code, and adding it to the continuous
integration checks looks more and more like a good idea.

Stefan


 docs/devel/qapi-code-gen.rst        | 2 +-
 docs/devel/testing.rst              | 2 +-
 docs/system/arm/cpu-features.rst    | 2 +-
 docs/system/loongarch/loongson3.rst | 2 +-
 docs/tools/virtiofsd.rst            | 2 +-
 include/exec/memory.h               | 2 +-
 qapi/qom.json                       | 2 +-
 qemu-options.hx                     | 8 ++++----
 qga/qapi-schema.json                | 2 +-
 tests/qtest/libqtest.h              | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index cd9b544376..c4c04bf755 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1313,7 +1313,7 @@ Removing "unreachable" stuff like events that can't be triggered
 anymore, optional return or event data members that can't be sent
 anymore, and return or event data member (enumeration) values that
 can't be sent anymore makes no difference to clients, except for
-introspection.  The latter can conceivably confuse clients, so tread
+introspection.  The latter can conceivably confuse clients, so treat
 carefully.
 
 Incompatible changes include removing return and event data members.
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fbb98faabe..e10c47b5a7 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -99,7 +99,7 @@ successfully on various hosts. The following list shows some best practices:
 * If your test cases uses the blkdebug feature, use relative path to pass
   the config and image file paths in the command line as Windows absolute
   path contains the delimiter ":" which will confuse the blkdebug parser.
-* Use double quotes in your extra QEMU commmand line in your test cases
+* Use double quotes in your extra QEMU command line in your test cases
   instead of single quotes, as Windows does not drop single quotes when
   passing the command line to QEMU.
 * Windows opens a file in text mode by default, while a POSIX compliant
diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index c2c01ec7d2..00c444042f 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -433,7 +433,7 @@ additional constraints on the set of vector lengths supported by SME.
 SME User-mode Default Vector Length Property
 --------------------------------------------
 
-For qemu-aarch64, the cpu propery ``sme-default-vector-length=N`` is
+For qemu-aarch64, the cpu property ``sme-default-vector-length=N`` is
 defined to mirror the Linux kernel parameter file
 ``/proc/sys/abi/sme_default_vector_length``.  The default length, ``N``,
 is in units of bytes and must be between 16 and 8192.
diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
index 1bdab44e27..68113b6f5e 100644
--- a/docs/system/loongarch/loongson3.rst
+++ b/docs/system/loongarch/loongson3.rst
@@ -41,7 +41,7 @@ can be accessed by following steps.
 
   $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
       -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
-      -append "root=/dev/ram rdinit=/sbin/init consol e=ttyS0,115200" \
+      -append "root=/dev/ram rdinit=/sbin/init console e=ttyS0,115200" \
       --nographic
 
 Note: The running speed may be a little slow, as the performance of our
diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 5f5ac9dd56..995a754a7b 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -232,7 +232,7 @@ e.g.:
 
   ``:ok:server::security.:``
 
-  will pass 'securty.' xattr's in listxattr from the server
+  will pass 'security.' xattr's in listxattr from the server
   and ignore following rules.
 
   ``:ok:all:::``
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bfb1de8eea..a751c111bd 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1970,7 +1970,7 @@ void memory_region_clear_dirty_bitmap(MemoryRegion *mr, hwaddr start,
  * querying the same page multiple times, which is especially useful for
  * display updates where the scanlines often are not page aligned.
  *
- * The dirty bitmap region which gets copyed into the snapshot (and
+ * The dirty bitmap region which gets copied into the snapshot (and
  * cleared afterwards) can be larger than requested.  The boundaries
  * are rounded up/down so complete bitmap longs (covering 64 pages on
  * 64bit hosts) can be copied over into the bitmap snapshot.  Which
diff --git a/qapi/qom.json b/qapi/qom.json
index 80dd419b39..216b56a4e6 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -586,7 +586,7 @@
 #
 # @size: size of the memory region in bytes
 #
-# @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
+# @x-use-canonical-path-for-ramblock-id: if true, the canonical path is used
 #                                        for ramblock-id. Disable this for 4.0
 #                                        machine types or older to allow
 #                                        migration with newer QEMU versions.
diff --git a/qemu-options.hx b/qemu-options.hx
index eb38e5dc40..1141dc5e58 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1051,7 +1051,7 @@ SRST
     details on the external interface.
 
 ``-device isa-ipmi-kcs,bmc=id[,ioport=val][,irq=val]``
-    Add a KCS IPMI interafce on the ISA bus. This also adds a
+    Add a KCS IPMI interface on the ISA bus. This also adds a
     corresponding ACPI and SMBIOS entries, if appropriate.
 
     ``bmc=id``
@@ -1071,7 +1071,7 @@ SRST
     is 0xe4 and the default interrupt is 5.
 
 ``-device pci-ipmi-kcs,bmc=id``
-    Add a KCS IPMI interafce on the PCI bus.
+    Add a KCS IPMI interface on the PCI bus.
 
     ``bmc=id``
         The BMC to connect to, one of ipmi-bmc-sim or ipmi-bmc-extern above.
@@ -5248,7 +5248,7 @@ SRST
         read the colo-compare git log.
 
     ``-object cryptodev-backend-builtin,id=id[,queues=queues]``
-        Creates a cryptodev backend which executes crypto opreation from
+        Creates a cryptodev backend which executes crypto operation from
         the QEMU cipher APIS. The id parameter is a unique ID that will
         be used to reference this cryptodev backend from the
         ``virtio-crypto`` device. The queues parameter is optional,
@@ -5516,7 +5516,7 @@ SRST
                        file=/etc/qemu/vnc.allow
 
         Finally the ``/etc/qemu/vnc.allow`` file would contain the list
-        of x509 distingished names that are permitted access
+        of x509 distinguished names that are permitted access
 
         ::
 
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 026a56f76c..796434ed34 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -392,7 +392,7 @@
 ##
 # @guest-file-flush:
 #
-# Write file changes bufferred in userspace to disk/kernel buffers
+# Write file changes buffered in userspace to disk/kernel buffers
 #
 # @handle: filehandle returned by guest-file-open
 #
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 65c040e504..1a76bae326 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -727,7 +727,7 @@ bool qtest_has_device(const char *device);
  * qtest_qmp_device_add_qdict:
  * @qts: QTestState instance to operate on
  * @drv: Name of the device that should be added
- * @arguments: QDict with properties for the device to intialize
+ * @arguments: QDict with properties for the device to initialize
  *
  * Generic hot-plugging test via the device_add QMP command with properties
  * supplied in form of QDict. Use NULL for empty properties list.
-- 
2.30.2



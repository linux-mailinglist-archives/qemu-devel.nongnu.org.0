Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62372618433
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcxK-0006RX-3Y; Thu, 03 Nov 2022 12:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuR-0000oQ-Il; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuO-00084u-Cu; Thu, 03 Nov 2022 12:17:38 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MuUvS-1p7TGl2vSc-00rW9M; Thu, 03
 Nov 2022 17:17:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/10] Fix some typos in documentation and comments
Date: Thu,  3 Nov 2022 17:17:19 +0100
Message-Id: <20221103161727.4116147-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D9b5ajF9M53aqjinA1+kWnc9BZtwqX6MrsYcM5xXvgSp8B36vvx
 OTBrZuxt/buJniEQFoi3Vw5c47dHlCLeXzNuaKovIzxDf59hQFg5usCwHkyJRsn28Cgz/Ux
 bzKUK0ltXLD6GKy6ANwI4dMcxPM/kWx13kd0Hc/an63MS5vTCgGeFgtNW02xwVV27bDvrVK
 Bqq7r+UZUIMsTGWDFbs+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OEvA07iugHA=:zRSAN1oCFkgRK0Q5OGyNH/
 n4cRUyYAwARjyQ1U58bGizdaZOJDXHbjeEK1Cxh2/cLYtnnMwCgsWAdCes1qXx2KksHmO3Gn9
 9fs8Hi5NCHdlObNxTuQjsqER0fi8T8P+MpuPQWP+CxwSbCBh5+jhk7qm6s6/o7gso7WqQc4zY
 cM3kO/aojYaZLAYK7a4fLhTZy37lpapwcBmkk0kW/ISuzEoLn27QSWHP75orjlkw4JPRHbfMj
 WL9/d0nVmLCNPQvnBF8nhcaCHdrRbVUM3caqqJfnH8kVx1SyBg0G2jp+Mh/9qjpI5E1pwWK1M
 wy7LplFE3vKvKB6m1mssOQUD9nGUMA1XVNSM1CIgAE1lHef9CFPzx/nyxp9y2gHgumKZwVcY2
 mEMl/8YKOeeJ/egMcgIiIO2icG/TkqDDGbVA7eRPH16O7embvNsTl2c9BsBmB5YPAZ/Hlrrke
 1AWDylWQOVMrfULt46Pk6dMWrCR1GgFANRrwbBZMt3bpYxwgDBa0PZ+1p6B4VZyOJSK0HbmZ1
 YV2o0v1v+znHfhtaejqZfdcD+yS+qPxGaAENjRk+4dv1xftXPZUeeIPRLCEwthkuBQGnCqwav
 W27U93uGZpoR1Zi7AUZpEzVEnaevBcFCVqXMkXnotgwiUbt1IL9+7sKz3oJ3uUWkWGjVMJ0qA
 c356tS+VGQzmvwlii0qN88bQnP6Sr1RkH0fum9NPB0XLNwo4OeFoP710gJTWZdogHWKF+KQGA
 xFYylmkgeypzmprrMFrHJQ8d/tHQiE2EoGs8kYgldOF3HTqOL9nhVMBl/k8aFpUv01bZ+rnKF
 MkYNyRF
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil <sw@weilnetz.de>

Most of them were found and fixed using codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221030105944.311940-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/testing.rst              |  2 +-
 docs/system/arm/cpu-features.rst    |  2 +-
 docs/system/loongarch/loongson3.rst |  2 +-
 docs/tools/virtiofsd.rst            |  2 +-
 include/exec/memory.h               |  2 +-
 qapi/qom.json                       |  2 +-
 qemu-options.hx                     | 10 +++++-----
 qga/qapi-schema.json                |  2 +-
 tests/qtest/libqtest.h              |  2 +-
 9 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fbb98faabeed..e10c47b5a7ca 100644
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
index c2c01ec7d265..00c444042ff5 100644
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
index 1bdab44e2728..489ea20f8ff7 100644
--- a/docs/system/loongarch/loongson3.rst
+++ b/docs/system/loongarch/loongson3.rst
@@ -41,7 +41,7 @@ can be accessed by following steps.
 
   $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
       -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
-      -append "root=/dev/ram rdinit=/sbin/init consol e=ttyS0,115200" \
+      -append "root=/dev/ram rdinit=/sbin/init console=ttyS0,115200" \
       --nographic
 
 Note: The running speed may be a little slow, as the performance of our
diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 5f5ac9dd56a3..995a754a7bf9 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -232,7 +232,7 @@ e.g.:
 
   ``:ok:server::security.:``
 
-  will pass 'securty.' xattr's in listxattr from the server
+  will pass 'security.' xattr's in listxattr from the server
   and ignore following rules.
 
   ``:ok:all:::``
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bfb1de8eeae1..a751c111bd3d 100644
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
index 87fcad2423ae..4db956f07e6c 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -589,7 +589,7 @@
 #
 # @size: size of the memory region in bytes
 #
-# @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
+# @x-use-canonical-path-for-ramblock-id: if true, the canonical path is used
 #                                        for ramblock-id. Disable this for 4.0
 #                                        machine types or older to allow
 #                                        migration with newer QEMU versions.
diff --git a/qemu-options.hx b/qemu-options.hx
index ceee0ddc255d..525f9dc2f223 100644
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
@@ -5264,8 +5264,8 @@ SRST
         read the colo-compare git log.
 
     ``-object cryptodev-backend-builtin,id=id[,queues=queues]``
-        Creates a cryptodev backend which executes crypto opreation from
-        the QEMU cipher APIS. The id parameter is a unique ID that will
+        Creates a cryptodev backend which executes crypto operations from
+        the QEMU cipher APIs. The id parameter is a unique ID that will
         be used to reference this cryptodev backend from the
         ``virtio-crypto`` device. The queues parameter is optional,
         which specify the queue number of cryptodev backend, the default
@@ -5532,7 +5532,7 @@ SRST
                        file=/etc/qemu/vnc.allow
 
         Finally the ``/etc/qemu/vnc.allow`` file would contain the list
-        of x509 distingished names that are permitted access
+        of x509 distinguished names that are permitted access
 
         ::
 
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 026a56f76caf..796434ed346f 100644
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
index 91a5f7edd94d..fcf1c3c3b36f 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -736,7 +736,7 @@ bool qtest_has_device(const char *device);
  * qtest_qmp_device_add_qdict:
  * @qts: QTestState instance to operate on
  * @drv: Name of the device that should be added
- * @arguments: QDict with properties for the device to intialize
+ * @arguments: QDict with properties for the device to initialize
  *
  * Generic hot-plugging test via the device_add QMP command with properties
  * supplied in form of QDict. Use NULL for empty properties list.
-- 
2.37.3



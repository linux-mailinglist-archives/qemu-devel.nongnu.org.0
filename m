Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D861DDED
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDe-0008Fr-PX; Sat, 05 Nov 2022 15:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDb-0008DY-Cw; Sat, 05 Nov 2022 15:52:39 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDZ-0003aR-DK; Sat, 05 Nov 2022 15:52:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MNLZc-1oftfY28Hi-00OoP7; Sat, 05
 Nov 2022 20:52:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 2/7] Fix some typos in documentation and comments
Date: Sat,  5 Nov 2022 20:52:22 +0100
Message-Id: <20221105195227.354769-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jUoxG7KVms0lYRtN7gFTyP5WHtUVFb6qygmOdDAP7I6JtVNW64o
 sU5pA7544q+1VTmrAKFIcI3tJe4iklbvkcMl8DOd8xegIotJgCijqdwnrBiTGBCqVdWBf3Y
 CZxaqynA+YyBc0CBHUmcD9Q+TjY9MDlMqrr9+WsqnuVuJTCSlaumW2B3Rtgaiwhy+Ao3gYk
 jTlDdGmJBJuDA6kr51CMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ejuui6/e7cc=:6Ce9JTuYGAi6WD+WZ2hjSR
 j7xlANyNQ7fQaxBkicYHGgsWcvHlJ7DaDlioiaIz+uIZURbnwdBBkqEvQJQ+0GdRkTOTNHvZ3
 +C8V3jDtgHifI6vEnq0+QrVHKE5Gbl+7llNS8Rf1FI4b/GbgS4qTu9E6Js6D01x8SkC/QMUVa
 2w2uiJm/ldrole56vI4a3ETb5P/A5LK1ZbvAQ8w0Fbc1UCLVG5nW84oGhhjOdmPUH1zPs2YY+
 GUXJM0KZ52mSlJLEADBcE789uxuRfkYmEMFTFjJHysAhkvjE9SlAQj1rAXTozO1vwqe/j5yQT
 P67Ov+sR4LrPAt9dGGaGCwTgBxu7khRWbGlwGJSf3RBiDeECAY6O5MEsTLYynqpEkdbiipFbO
 5wZbJVS6wQSGVBkLQyaDFyOiKlKd5ePcuMuvBNSTDphpp2KyS1j6DXY4NFO5izgX96vfRf0Ib
 wpAywzZ/KUheGH+1S/SJZo/7qwKbQoL8UG2Va95jw0TSpDY4jJWUhza78Tv6Pxk0wlYwewzjV
 CaSoKTJQwgXzqRnV4P/uvYK4uieuUspC4du7djrSk+av6aGlMIbT4D4xRBu6+89oKZtzDUUUv
 8HnmBuwoOZGwTvyooRIXzBsWy2PtBERgjNlpLYZhZif5KpOx9LVXj1NW+HD6dXizJUDssXFQS
 poB+/p0k9hubKmCD+RPiaIn5QhM5yHvE8r5wHGCmG9i0X5m5KYAnKTi/yyouyH5bWvrA/yNJ0
 BGciF038WaBq5HIh11eNA0dRYgdIUBwruF46sqgf585qdDwp+a3dCbTsZoDTbaJT0MhxJBCM+
 Hzn0aHi
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
index 911d82afa5af..dbdf9c301b02 100644
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
@@ -5283,8 +5283,8 @@ SRST
         read the colo-compare git log.
 
     ``-object cryptodev-backend-builtin,id=id[,queues=queues]``
-        Creates a cryptodev backend which executes crypto opreation from
-        the QEMU cipher APIS. The id parameter is a unique ID that will
+        Creates a cryptodev backend which executes crypto operations from
+        the QEMU cipher APIs. The id parameter is a unique ID that will
         be used to reference this cryptodev backend from the
         ``virtio-crypto`` device. The queues parameter is optional,
         which specify the queue number of cryptodev backend, the default
@@ -5551,7 +5551,7 @@ SRST
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



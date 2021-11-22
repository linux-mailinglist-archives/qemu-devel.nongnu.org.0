Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030A459089
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:48:57 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAcq-0007a8-AH
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAYJ-0000rb-TL
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAYH-0004My-G4
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNoK1G6ZwH3KL6quBVXoqbFcwh5mySwR2msKBc4GpAk=;
 b=LLC9KBclC+n55MBSFSX2mlVdyBHts4tcYvs/vD4USzlf4652DrtSvqjGqA3rMm8RGqNqAs
 q/YC/sb/4+rIKaTglDtBIgkl50CP+TqJOFrPL6lNR5UZ0K65uYuH9bR0Fd1ZmHBL3sOmny
 2vNtEUkaB7pjBxPzUp2vX6E7hgZgYLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-shmI9Mz7MW-TnrAOJ8gf4Q-1; Mon, 22 Nov 2021 09:43:49 -0500
X-MC-Unique: shmI9Mz7MW-TnrAOJ8gf4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43A2210151E4;
 Mon, 22 Nov 2021 14:43:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D74A60C28;
 Mon, 22 Nov 2021 14:43:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 6/6] docs: Render binary names as monospaced text
Date: Mon, 22 Nov 2021 15:43:20 +0100
Message-Id: <20211122144320.29178-7-thuth@redhat.com>
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
References: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211118192744.64325-1-philmd@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst        |  8 ++++----
 docs/devel/build-system.rst            |  6 +++---
 docs/devel/multi-process.rst           |  6 +++---
 docs/devel/testing.rst                 |  8 ++++----
 docs/image-fuzzer.txt                  |  6 +++---
 docs/system/arm/orangepi.rst           |  2 +-
 docs/system/images.rst                 |  2 +-
 docs/system/qemu-block-drivers.rst.inc |  6 +++---
 docs/system/tls.rst                    |  2 +-
 docs/tools/qemu-img.rst                | 18 +++++++++---------
 docs/tools/qemu-nbd.rst                |  4 ++--
 docs/tools/qemu-storage-daemon.rst     |  7 ++++---
 docs/tools/virtiofsd.rst               |  4 ++--
 13 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 9d0d90c90d..d42c3341de 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -658,8 +658,8 @@ enforce that any failure to open the backing image (including if the
 backing file is missing or an incorrect format was specified) is an
 error when ``-u`` is not used.
 
-qemu-img amend to adjust backing file (removed in 6.1)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``qemu-img amend`` to adjust backing file (removed in 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The use of ``qemu-img amend`` to modify the name or format of a qcow2
 backing image was never fully documented or tested, and interferes
@@ -670,8 +670,8 @@ backing chain should be performed with ``qemu-img rebase -u`` either
 before or after the remaining changes being performed by amend, as
 appropriate.
 
-qemu-img backing file without format (removed in 6.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''
+``qemu-img`` backing file without format (removed in 6.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
 convert`` to create or modify an image that depends on a backing file
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7a83f5fc0d..431caba7aa 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -121,11 +121,11 @@ process for:
 
 1) executables, which include:
 
-   - Tools - qemu-img, qemu-nbd, qga (guest agent), etc
+   - Tools - ``qemu-img``, ``qemu-nbd``, ``qga`` (guest agent), etc
 
-   - System emulators - qemu-system-$ARCH
+   - System emulators - ``qemu-system-$ARCH``
 
-   - Userspace emulators - qemu-$ARCH
+   - Userspace emulators - ``qemu-$ARCH``
 
    - Unit tests
 
diff --git a/docs/devel/multi-process.rst b/docs/devel/multi-process.rst
index 5c857ff3b9..e4801751f2 100644
--- a/docs/devel/multi-process.rst
+++ b/docs/devel/multi-process.rst
@@ -187,9 +187,9 @@ desired, in which the emulation application should only be allowed to
 access the files or devices the VM it's running on behalf of can access.
 #### qemu-io model
 
-Qemu-io is a test harness used to test changes to the QEMU block backend
-object code. (e.g., the code that implements disk images for disk driver
-emulation) Qemu-io is not a device emulation application per se, but it
+``qemu-io`` is a test harness used to test changes to the QEMU block backend
+object code (e.g., the code that implements disk images for disk driver
+emulation). ``qemu-io`` is not a device emulation application per se, but it
 does compile the QEMU block objects into a separate binary from the main
 QEMU one. This could be useful for disk device emulation, since its
 emulation applications will need to include the QEMU block objects.
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 60c59023e5..755343c7dd 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -564,11 +564,11 @@ exploiting a QEMU security bug to compromise the host.
 QEMU binaries
 ~~~~~~~~~~~~~
 
-By default, qemu-system-x86_64 is searched in $PATH to run the guest. If there
-isn't one, or if it is older than 2.10, the test won't work. In this case,
+By default, ``qemu-system-x86_64`` is searched in $PATH to run the guest. If
+there isn't one, or if it is older than 2.10, the test won't work. In this case,
 provide the QEMU binary in env var: ``QEMU=/path/to/qemu-2.10+``.
 
-Likewise the path to qemu-img can be set in QEMU_IMG environment variable.
+Likewise the path to ``qemu-img`` can be set in QEMU_IMG environment variable.
 
 Make jobs
 ~~~~~~~~~
@@ -650,7 +650,7 @@ supported. To start the fuzzer, run
 
   tests/image-fuzzer/runner.py -c '[["qemu-img", "info", "$test_img"]]' /tmp/test qcow2
 
-Alternatively, some command different from "qemu-img info" can be tested, by
+Alternatively, some command different from ``qemu-img info`` can be tested, by
 changing the ``-c`` option.
 
 Integration tests using the Avocado Framework
diff --git a/docs/image-fuzzer.txt b/docs/image-fuzzer.txt
index 3e23ebec33..279cc8c807 100644
--- a/docs/image-fuzzer.txt
+++ b/docs/image-fuzzer.txt
@@ -51,10 +51,10 @@ assumes that core dumps will be generated in the current working directory.
 For comprehensive test results, please, set up your test environment
 properly.
 
-Paths to binaries under test (SUTs) qemu-img and qemu-io are retrieved from
-environment variables. If the environment check fails the runner will
+Paths to binaries under test (SUTs) ``qemu-img`` and ``qemu-io`` are retrieved
+from environment variables. If the environment check fails the runner will
 use SUTs installed in system paths.
-qemu-img is required for creation of backing files, so it's mandatory to set
+``qemu-img`` is required for creation of backing files, so it's mandatory to set
 the related environment variable if it's not installed in the system path.
 For details about environment variables see qemu-iotests/check.
 
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index c55694dd91..83c7445197 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -128,7 +128,7 @@ Alternatively, you can also choose to build you own image with buildroot
 using the orangepi_pc_defconfig. Also see https://buildroot.org for more information.
 
 When using an image as an SD card, it must be resized to a power of two. This can be
-done with the qemu-img command. It is recommended to only increase the image size
+done with the ``qemu-img`` command. It is recommended to only increase the image size
 instead of shrinking it to a power of two, to avoid loss of data. For example,
 to prepare a downloaded Armbian image, first extract it and then increase
 its size to one gigabyte as follows:
diff --git a/docs/system/images.rst b/docs/system/images.rst
index 3d9144e625..d000bd6b6f 100644
--- a/docs/system/images.rst
+++ b/docs/system/images.rst
@@ -20,7 +20,7 @@ where myimage.img is the disk image filename and mysize is its size in
 kilobytes. You can add an ``M`` suffix to give the size in megabytes and
 a ``G`` suffix for gigabytes.
 
-See the qemu-img invocation documentation for more information.
+See the ``qemu-img`` invocation documentation for more information.
 
 .. _disk_005fimages_005fsnapshot_005fmode:
 
diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index 16225710eb..e313784426 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -511,13 +511,13 @@ of an inet socket:
 
   |qemu_system| linux.img -hdb nbd+unix://?socket=/tmp/my_socket
 
-In this case, the block device must be exported using qemu-nbd:
+In this case, the block device must be exported using ``qemu-nbd``:
 
 .. parsed-literal::
 
   qemu-nbd --socket=/tmp/my_socket my_disk.qcow2
 
-The use of qemu-nbd allows sharing of a disk between several guests:
+The use of ``qemu-nbd`` allows sharing of a disk between several guests:
 
 .. parsed-literal::
 
@@ -530,7 +530,7 @@ and then you can use it with two guests:
   |qemu_system| linux1.img -hdb nbd+unix://?socket=/tmp/my_socket
   |qemu_system| linux2.img -hdb nbd+unix://?socket=/tmp/my_socket
 
-If the nbd-server uses named exports (supported since NBD 2.9.18, or with QEMU's
+If the ``nbd-server`` uses named exports (supported since NBD 2.9.18, or with QEMU's
 own embedded NBD server), you must specify an export name in the URI:
 
 .. parsed-literal::
diff --git a/docs/system/tls.rst b/docs/system/tls.rst
index b0973afe1b..1a04674362 100644
--- a/docs/system/tls.rst
+++ b/docs/system/tls.rst
@@ -311,7 +311,7 @@ containing one or more usernames and random keys::
    mkdir -m 0700 /tmp/keys
    psktool -u rich -p /tmp/keys/keys.psk
 
-TLS-enabled servers such as qemu-nbd can use this directory like so::
+TLS-enabled servers such as ``qemu-nbd`` can use this directory like so::
 
    qemu-nbd \
      -t -x / \
diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index c0a4443146..d663dd92bd 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -127,9 +127,9 @@ by the used format or see the format descriptions below for details.
 .. option:: -S SIZE
 
   Indicates the consecutive number of bytes that must contain only zeros
-  for qemu-img to create a sparse image during conversion. This value is rounded
-  down to the nearest 512 bytes. You may use the common size suffixes like
-  ``k`` for kilobytes.
+  for ``qemu-img`` to create a sparse image during conversion. This value is
+  rounded down to the nearest 512 bytes. You may use the common size suffixes
+  like ``k`` for kilobytes.
 
 .. option:: -t CACHE
 
@@ -431,7 +431,7 @@ Command description:
   suppressed from the destination image.
 
   *SPARSE_SIZE* indicates the consecutive number of bytes (defaults to 4k)
-  that must contain only zeros for qemu-img to create a sparse image during
+  that must contain only zeros for ``qemu-img`` to create a sparse image during
   conversion. If *SPARSE_SIZE* is 0, the source will not be scanned for
   unallocated or zero sectors, and the destination image will always be
   fully allocated.
@@ -447,7 +447,7 @@ Command description:
   If the ``-n`` option is specified, the target volume creation will be
   skipped. This is useful for formats such as ``rbd`` if the target
   volume has already been created with site specific options that cannot
-  be supplied through qemu-img.
+  be supplied through ``qemu-img``.
 
   Out of order writes can be enabled with ``-W`` to improve performance.
   This is only recommended for preallocated devices like host devices or other
@@ -472,7 +472,7 @@ Command description:
   If the option *BACKING_FILE* is specified, then the image will record
   only the differences from *BACKING_FILE*. No size needs to be specified in
   this case. *BACKING_FILE* will never be modified unless you use the
-  ``commit`` monitor command (or qemu-img commit).
+  ``commit`` monitor command (or ``qemu-img commit``).
 
   If a relative path name is given, the backing file is looked up relative to
   the directory containing *FILENAME*.
@@ -684,7 +684,7 @@ Command description:
 
   Safe mode
     This is the default mode and performs a real rebase operation. The
-    new backing file may differ from the old one and qemu-img rebase
+    new backing file may differ from the old one and ``qemu-img rebase``
     will take care of keeping the guest-visible content of *FILENAME*
     unchanged.
 
@@ -697,7 +697,7 @@ Command description:
     exists.
 
   Unsafe mode
-    qemu-img uses the unsafe mode if ``-u`` is specified. In this
+    ``qemu-img`` uses the unsafe mode if ``-u`` is specified. In this
     mode, only the backing file name and format of *FILENAME* is changed
     without any checks on the file contents. The user must take care of
     specifying the correct new backing file, or the guest-visible
@@ -735,7 +735,7 @@ Command description:
   sizes accordingly.  Failure to do so will result in data loss!
 
   When shrinking images, the ``--shrink`` option must be given. This informs
-  qemu-img that the user acknowledges all loss of data beyond the truncated
+  ``qemu-img`` that the user acknowledges all loss of data beyond the truncated
   image's end.
 
   After using this command to grow a disk image, you must use file system and
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 726cd18960..6031f96893 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -38,7 +38,7 @@ driver options if ``--image-opts`` is specified.
   supported. The common object types that it makes sense to define are the
   ``secret`` object, which is used to supply passwords and/or encryption
   keys, and the ``tls-creds`` object, which is used to supply TLS
-  credentials for the qemu-nbd server or client.
+  credentials for the ``qemu-nbd`` server or client.
 
 .. option:: -p, --port=PORT
 
@@ -238,7 +238,7 @@ daemon:
 Expose the guest-visible contents of a qcow2 file via a block device
 /dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
 partitions found within), then disconnect the device when done.
-Access to bind qemu-nbd to an /dev/nbd device generally requires root
+Access to bind ``qemu-nbd`` to a /dev/nbd device generally requires root
 privileges, and may also require the execution of ``modprobe nbd``
 to enable the kernel NBD client module.  *CAUTION*: Do not use
 this method to mount filesystems from an untrusted guest image - a
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index b8ef4486f1..3e5a9dc032 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -10,9 +10,10 @@ Synopsis
 Description
 -----------
 
-qemu-storage-daemon provides disk image functionality from QEMU, qemu-img, and
-qemu-nbd in a long-running process controlled via QMP commands without running
-a virtual machine. It can export disk images, run block job operations, and
+``qemu-storage-daemon`` provides disk image functionality from QEMU,
+``qemu-img``, and ``qemu-nbd`` in a long-running process controlled via QMP
+commands without running a virtual machine.
+It can export disk images, run block job operations, and
 perform other disk-related operations. The daemon is controlled via a QMP
 monitor and initial configuration from the command-line.
 
diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index cc31402830..07ac0be551 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -136,8 +136,8 @@ Extended attribute (xattr) mapping
 By default the name of xattr's used by the client are passed through to the server
 file system.  This can be a problem where either those xattr names are used
 by something on the server (e.g. selinux client/server confusion) or if the
-virtiofsd is running in a container with restricted privileges where it cannot
-access some attributes.
+``virtiofsd`` is running in a container with restricted privileges where it
+cannot access some attributes.
 
 Mapping syntax
 ~~~~~~~~~~~~~~
-- 
2.27.0



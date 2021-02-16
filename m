Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0370C31D0EF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:26:26 +0100 (CET)
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5zN-00068f-2u
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kN-0002oo-Tw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kJ-0004QN-Oo
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3PIZaHbZpFZMzcZkuR+BZJs5rBNI+lgmhFIGQKRghU=;
 b=GSvnxw+5gmZI7c0ZQGa/zLcu9vbWKlw3nF5iSdIIBDLOrp9oYUqIIl0/VM15hdrUN2NAVC
 AdmR8AZo4LOdgKHtL1wIuEA3ddO8oznVImVodk2Za6AugIjZIaDzBTR6pA3DGorZXOvmEj
 MRNpv5CD9QYK4yPZ+cdUaUy6qnKjCiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-2XaAmEcENxaZLW96bQ5QBQ-1; Tue, 16 Feb 2021 14:10:48 -0500
X-MC-Unique: 2XaAmEcENxaZLW96bQ5QBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA4E801965;
 Tue, 16 Feb 2021 19:10:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30A465C1B4;
 Tue, 16 Feb 2021 19:10:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] docs: update to show preferred boolean syntax for
 -chardev
Date: Tue, 16 Feb 2021 19:10:24 +0000
Message-Id: <20210216191027.595031-8-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/COLO-FT.txt                       |  8 ++++----
 docs/ccid.txt                          |  6 ++++--
 docs/colo-proxy.txt                    | 16 ++++++++--------
 docs/devel/writing-qmp-commands.txt    |  2 +-
 docs/interop/live-block-operations.rst |  4 ++--
 docs/interop/qmp-intro.txt             |  4 ++--
 docs/system/cpu-hotplug.rst            |  2 +-
 docs/system/s390x/3270.rst             |  2 +-
 docs/system/target-avr.rst             |  2 +-
 docs/tools/qemu-storage-daemon.rst     |  4 ++--
 scripts/qmp/qemu-ga-client             |  2 +-
 tests/test-char.c                      |  4 ++--
 12 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index bc5fb2a1bb..8874690e83 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -162,11 +162,11 @@ instance.
    -device piix3-usb-uhci -device usb-tablet -name primary \
    -netdev tap,id=hn0,vhost=off,helper=/usr/lib/qemu/qemu-bridge-helper \
    -device rtl8139,id=e0,netdev=hn0 \
-   -chardev socket,id=mirror0,host=0.0.0.0,port=9003,server,nowait \
-   -chardev socket,id=compare1,host=0.0.0.0,port=9004,server,wait \
-   -chardev socket,id=compare0,host=127.0.0.1,port=9001,server,nowait \
+   -chardev socket,id=mirror0,host=0.0.0.0,port=9003,server=on,wait=off \
+   -chardev socket,id=compare1,host=0.0.0.0,port=9004,server=on,wait=on \
+   -chardev socket,id=compare0,host=127.0.0.1,port=9001,server=on,wait=off \
    -chardev socket,id=compare0-0,host=127.0.0.1,port=9001 \
-   -chardev socket,id=compare_out,host=127.0.0.1,port=9005,server,nowait \
+   -chardev socket,id=compare_out,host=127.0.0.1,port=9005,server=on,wait=off \
    -chardev socket,id=compare_out0,host=127.0.0.1,port=9005 \
    -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0 \
    -object filter-redirector,netdev=hn0,id=redire0,queue=rx,indev=compare_out \
diff --git a/docs/ccid.txt b/docs/ccid.txt
index c7fda6d07d..c97fbd2de0 100644
--- a/docs/ccid.txt
+++ b/docs/ccid.txt
@@ -109,7 +109,8 @@ NSS.  Registration can be done from Firefox or the command line:
 
 on the host specify the ccid-card-passthru device with a suitable chardev:
 
-    qemu -chardev socket,server,host=0.0.0.0,port=2001,id=ccid,nowait -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
+    qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
+         -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
 
 on the client run vscclient, built when you built QEMU:
 
@@ -125,7 +126,8 @@ Follow instructions as per #4, except run QEMU and vscclient as follows:
 Run qemu as per #5, and run vscclient from the "fake-smartcard"
 directory as follows:
 
-    qemu -chardev socket,server,host=0.0.0.0,port=2001,id=ccid,nowait -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
+    qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
+         -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
     vscclient -e "db=\"sql:$PWD\" use_hw=no soft=(,Test,CAC,,id-cert,signing-cert,encryption-cert)" <qemu-host> 2001
 
 
diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
index fa1cef0278..1fc38aed1b 100644
--- a/docs/colo-proxy.txt
+++ b/docs/colo-proxy.txt
@@ -164,11 +164,11 @@ clearly describe the usage.
 Primary(ip:3.3.3.3):
 -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
 -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
--chardev socket,id=mirror0,host=3.3.3.3,port=9003,server,nowait
--chardev socket,id=compare1,host=3.3.3.3,port=9004,server,nowait
--chardev socket,id=compare0,host=3.3.3.3,port=9001,server,nowait
+-chardev socket,id=mirror0,host=3.3.3.3,port=9003,server=on,wait=off
+-chardev socket,id=compare1,host=3.3.3.3,port=9004,server=on,wait=off
+-chardev socket,id=compare0,host=3.3.3.3,port=9001,server=on,wait=off
 -chardev socket,id=compare0-0,host=3.3.3.3,port=9001
--chardev socket,id=compare_out,host=3.3.3.3,port=9005,server,nowait
+-chardev socket,id=compare_out,host=3.3.3.3,port=9005,server=on,wait=off
 -chardev socket,id=compare_out0,host=3.3.3.3,port=9005
 -object iothread,id=iothread1
 -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0
@@ -190,11 +190,11 @@ If you want to use virtio-net-pci or other driver with vnet_header:
 Primary(ip:3.3.3.3):
 -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
 -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
--chardev socket,id=mirror0,host=3.3.3.3,port=9003,server,nowait
--chardev socket,id=compare1,host=3.3.3.3,port=9004,server,nowait
--chardev socket,id=compare0,host=3.3.3.3,port=9001,server,nowait
+-chardev socket,id=mirror0,host=3.3.3.3,port=9003,server=on,wait=off
+-chardev socket,id=compare1,host=3.3.3.3,port=9004,server=on,wait=off
+-chardev socket,id=compare0,host=3.3.3.3,port=9001,server=on,wait=off
 -chardev socket,id=compare0-0,host=3.3.3.3,port=9001
--chardev socket,id=compare_out,host=3.3.3.3,port=9005,server,nowait
+-chardev socket,id=compare_out,host=3.3.3.3,port=9005,server=on,wait=off
 -chardev socket,id=compare_out0,host=3.3.3.3,port=9005
 -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0,vnet_hdr_support
 -object filter-redirector,netdev=hn0,id=redire0,queue=rx,indev=compare_out,vnet_hdr_support
diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 258e63bff5..b1e31d56c0 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -39,7 +39,7 @@ shown here.
 First, QEMU should be started like this:
 
 # qemu-system-TARGET [...] \
-    -chardev socket,id=qmp,port=4444,host=localhost,server \
+    -chardev socket,id=qmp,port=4444,host=localhost,server=on \
     -mon chardev=qmp,mode=control,pretty=on
 
 Then, in a different terminal:
diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index e13f5a21f8..1073b930dc 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -133,7 +133,7 @@ socket::
         -M q35 -nodefaults -m 512 \
         -blockdev node-name=node-A,driver=qcow2,file.driver=file,file.node-name=file,file.filename=./a.qcow2 \
         -device virtio-blk,drive=node-A,id=virtio0 \
-        -monitor stdio -qmp unix:/tmp/qmp-sock,server,nowait
+        -monitor stdio -qmp unix:/tmp/qmp-sock,server=on,wait=off
 
 The ``-blockdev`` command-line option, used above, is available from
 QEMU 2.9 onwards.  In the above invocation, notice the ``node-name``
@@ -698,7 +698,7 @@ it could be located elsewhere)::
         -M q35 -nodefaults -m 512 \
         -blockdev node-name=node-TargetDisk,driver=qcow2,file.driver=file,file.node-name=file,file.filename=./target-disk.qcow2 \
         -device virtio-blk,drive=node-TargetDisk,id=virtio0 \
-        -S -monitor stdio -qmp unix:./qmp-sock2,server,nowait \
+        -S -monitor stdio -qmp unix:./qmp-sock2,server=on,wait=off \
         -incoming tcp:localhost:6666
 
 Given the disk image chain on source QEMU::
diff --git a/docs/interop/qmp-intro.txt b/docs/interop/qmp-intro.txt
index 9d54a718b8..1c745a7af0 100644
--- a/docs/interop/qmp-intro.txt
+++ b/docs/interop/qmp-intro.txt
@@ -26,7 +26,7 @@ Usage
 You can use the -qmp option to enable QMP. For example, the following
 makes QMP available on localhost port 4444:
 
-$ qemu [...] -qmp tcp:localhost:4444,server,nowait
+$ qemu [...] -qmp tcp:localhost:4444,server=on,wait=off
 
 However, for more flexibility and to make use of more options, the -mon
 command-line option should be used. For instance, the following example
@@ -34,7 +34,7 @@ creates one HMP instance (human monitor) on stdio and one QMP instance
 on localhost port 4444:
 
 $ qemu [...] -chardev stdio,id=mon0 -mon chardev=mon0,mode=readline \
-             -chardev socket,id=mon1,host=localhost,port=4444,server,nowait \
+             -chardev socket,id=mon1,host=localhost,port=4444,server=on,wait=off \
              -mon chardev=mon1,mode=control,pretty=on
 
 Please, refer to QEMU's manpage for more information.
diff --git a/docs/system/cpu-hotplug.rst b/docs/system/cpu-hotplug.rst
index d0b06403f1..bd0663616e 100644
--- a/docs/system/cpu-hotplug.rst
+++ b/docs/system/cpu-hotplug.rst
@@ -14,7 +14,7 @@ vCPU hotplug
       $ qemu-system-x86_64 -display none -no-user-config -m 2048 \
           -nodefaults -monitor stdio -machine pc,accel=kvm,usb=off \
           -smp 1,maxcpus=2 -cpu IvyBridge-IBRS \
-          -qmp unix:/tmp/qmp-sock,server,nowait
+          -qmp unix:/tmp/qmp-sock,server=on,wait=off
 
 (2) Run 'qmp-shell' (located in the source tree, under: "scripts/qmp/)
     to connect to the just-launched QEMU::
diff --git a/docs/system/s390x/3270.rst b/docs/system/s390x/3270.rst
index 0554a70a9f..0e173b323f 100644
--- a/docs/system/s390x/3270.rst
+++ b/docs/system/s390x/3270.rst
@@ -24,7 +24,7 @@ Example configuration
 
 * Add a ``tn3270`` chardev and a ``x-terminal3270`` to the QEMU command line::
 
-   -chardev socket,id=ch0,host=0.0.0.0,port=2300,nowait,server,tn3270
+   -chardev socket,id=ch0,host=0.0.0.0,port=2300,wait=off,server=on,tn3270=on
    -device x-terminal3270,chardev=ch0,devno=fe.0.000a,id=terminal0
 
 * Start the guest. In the guest, use ``chccwdev -e 0.0.000a`` to enable
diff --git a/docs/system/target-avr.rst b/docs/system/target-avr.rst
index 25ab46ef05..03d5ab51c1 100644
--- a/docs/system/target-avr.rst
+++ b/docs/system/target-avr.rst
@@ -24,7 +24,7 @@ AVR cpu
 - Continuous non interrupted execution with serial output into telnet window::
 
    qemu-system-avr -M mega2560 -bios demo.elf -nographic \
-                   -serial tcp::5678,server,nowait
+                   -serial tcp::5678,server=on,wait=off
 
   and then in another shell::
 
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index f63627eaf6..c05b3d3811 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -69,7 +69,7 @@ Standard options:
   a description of character device properties. A common character device
   definition configures a UNIX domain socket::
 
-  --chardev socket,id=char1,path=/tmp/qmp.sock,server,nowait
+  --chardev socket,id=char1,path=/tmp/qmp.sock,server=on,wait=off
 
 .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
@@ -124,7 +124,7 @@ Launch the daemon with QMP monitor socket ``qmp.sock`` so clients can execute
 QMP commands::
 
   $ qemu-storage-daemon \
-      --chardev socket,path=qmp.sock,server,nowait,id=char1 \
+      --chardev socket,path=qmp.sock,server=on,wait=off,id=char1 \
       --monitor chardev=char1
 
 Export raw image file ``disk.img`` over NBD UNIX domain socket ``nbd.sock``::
diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index ce122984a9..348d85864c 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -11,7 +11,7 @@
 #
 # Start QEMU with:
 #
-# # qemu [...] -chardev socket,path=/tmp/qga.sock,server,nowait,id=qga0 \
+# # qemu [...] -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
 #   -device virtio-serial -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
 #
 # Run the script:
diff --git a/tests/test-char.c b/tests/test-char.c
index 469d25989c..755d54c15e 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -780,7 +780,7 @@ static void char_socket_server_test(gconstpointer opaque)
 
     g_setenv("QTEST_SILENT_ERRORS", "1", 1);
     /*
-     * We rely on config->addr containing "nowait", otherwise
+     * We rely on config->addr containing "wait=off", otherwise
      * qemu_chr_new() will block until a client connects. We
      * can't spawn our client thread though, because until
      * qemu_chr_new() returns we don't know what TCP port was
@@ -1114,7 +1114,7 @@ static void char_socket_server_two_clients_test(gconstpointer opaque)
 
     g_setenv("QTEST_SILENT_ERRORS", "1", 1);
     /*
-     * We rely on addr containing "nowait", otherwise
+     * We rely on addr containing "wait=off", otherwise
      * qemu_chr_new() will block until a client connects. We
      * can't spawn our client thread though, because until
      * qemu_chr_new() returns we don't know what TCP port was
-- 
2.29.2



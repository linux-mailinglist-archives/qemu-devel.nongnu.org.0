Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E5B319E
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 21:25:24 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9a9D-0005nB-32
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 15:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lukasstraub2@web.de>) id 1i9a4Z-0003ec-AE
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lukasstraub2@web.de>) id 1i9a4X-00017t-0z
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:20:35 -0400
Received: from mout.web.de ([212.227.17.12]:55825)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lukasstraub2@web.de>) id 1i9a4W-00017h-Nv
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1568575220;
 bh=XTji1Q1D6niQRYpoviBW/bANIkemiDMT704iPrFER84=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XGOEOE7a0sjxqrilOko7myOFxu5OqoBFn5H4URETS1qSoviXJv52HRr9Wa5HburK2
 xIj7UpdAR5Vibpft2LAqcnjfzf1A+f/fnV68wbBdDce6EBSftTqPKJ+8e33AoXJSXq
 /QzHhFPk1JlhY+xKK7bc+iBbWLAYmDej2SShUlSo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([88.130.61.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lu52Q-1iGgkc1oH8-011PUA; Sun, 15
 Sep 2019 21:20:20 +0200
Date: Sun, 15 Sep 2019 21:20:19 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <ff0563b90eb28856cc1bf04e04a99f74784e8efc.1568574479.git.lukasstraub2@web.de>
In-Reply-To: <cover.1568574478.git.lukasstraub2@web.de>
References: <cover.1568574478.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OrVg3zz4pJVCP92APcYt3fsLCilrTRgVZ5I2jnNhl1g+oGw2a+f
 6p86M22HbtMW+2TEU5wutO7JNX+k8ZJxm2CkjVGCEF6KSdlND6fX6lU7CSmtGTbGyVO+tux
 8MqghUjVsmN0mlthe36G+pVtkcV2Ua+JBpWpWnKU3ARyNfmULGGuupXrvXlEFVZ1ENrAEPv
 dWohqCJqVFPGiOSGNT/dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kxd5GXTcr1k=:1Y4nwjl45JI4FAjBmOT5zv
 0etU/gLP2Z/bp4nlYF+UWnzHYqgnXhpc9Fm+mFus33C/iLyf5iDbHJFzZne2XBkKzSP/wNs6c
 KBoy0SQiC67cWa8Hy9b11rFWdh1ROb2MDGMaNmFbKbr1xDt3poZPqs7tVBHm7IVM5a5s4Z81h
 mXaZnC78H5Gy+COKsYd28DKYVk28CPK6WymRIBVtbPlQ/K8UT/mdsfwyJ6xTYQRK1pFRMue0q
 1Mt3KWHjThbysGdrBZeOGegfC24LidWjNDHXj3ZlK05Us+n31OMybLOMejageNyoF3jxS1urs
 ZwOuGBbwsAHzS9LUbx2nHW1w//FthfZ3sZAsUcoGXGsU4ukopBOO//FnTNoYJhy9MVfhRn/ws
 leByflN8D2xdRX/WD2xRSc7BQwYu4IpRc0hgKqoWtiZKRfKmu/8fTBJ6pzujHQfgR9eA+zO93
 n+5VMrlWnyjejG0jvptOdAecXrP7ZR/M5GA/GsQsMdtrr7JKXgoU+UyBkY+Gi5Cb6mLxxc1Kq
 kVsPbwBs8fsV6cMHfYuPBNOILkY7G8CBpsGo56QcJtN60ppvrGtOhiGkbliJkdjfv00HKU1uN
 dsmXYcSMOZpS9lcFYqOAuNVE7zp5kdBCVgXczZAQWR8/NkTmXeEt1ERvpuRI3WiRzxDNl7tiB
 Z33QbAXQAYI41wq5g0Abr1ZpxhTELCTuGgXgqev76ykaqU9UYaSFcE0GY07CGt7re7mCkSqmK
 hBA4QWCbVLfuBrrMOuUFPjWTw+SfReGaysDjtBjcb3hBxhyyJTV0ZWbQdfidnBLVOwLZCS5fh
 bYotRrW3yhDZOp+ZvO5TCz/cOI+jPA3IZ9TLLLwaeSPXFbxcc0XgGeJgln4wQ5NtDtnhD2Kru
 V0P7z6ChjiQDDvzYzyZAJYW0fsRT/BVWnbehdZo/Y97ZtJz4y4QYc30ePMOIexC7FXz4Pe2M9
 5+mqE4VDJ7YdMTTAmsCDPDMk9049jYJplEGt35VXNSVrmpmiFfbiB/PyDAwhk1Sbf1Rdfomre
 B7ksRR0+T/RmBnKO85TTSbEbbl7ZZYSMn0FU2B5D2+X4eizSL75TlegaVynB5hLzLVH1vhIIe
 88D1hi7SQRFF9XvoPgiw/x0vWhEU/S6GnMqOQ5EKwdae4txZC/ml77as2tpiRdwIkiYsMjl4L
 Nm9wknWXr4g/XRy2NmY9uG6fhKsjA/pZ4Tw5BZKu7lDubjiHB4VnNM07KJhlVcyzmK/ZMh3X4
 D28plk+a8UKCT4IKlsch4MB6k6o1NdxiK6j7Mic9KmBjMueylrdtWimSpsEw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.12
Subject: [Qemu-devel] [PATCH v5 4/4] colo: Update Documentation for
 continuous replication
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
Cc: kwolf@redhat.com, Wen Congyang <wencongyang2@huawei.com>,
 Jason Wang <jasowang@redhat.com>, mreitz@redhat.com,
 Zhang Chen <chen.zhang@intel.com>, Xie Changlong <xiechanglong.d@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the qemu command-line and qmp commands for continuous replication

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 docs/COLO-FT.txt           | 212 +++++++++++++++++++++++++++----------
 docs/block-replication.txt |  28 +++--
 2 files changed, 173 insertions(+), 67 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index ad24680d13..e98c95ca2b 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -145,35 +145,65 @@ The diagram just shows the main qmp command, you can =
get the detail
 in test procedure.
=20
 =3D=3D Test procedure =3D=3D
-1. Startup qemu
-Primary:
-# qemu-system-x86_64 -accel kvm -m 2048 -smp 2 -qmp stdio -name primary \
-  -device piix3-usb-uhci -vnc :7 \
-  -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
-  -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
-  -drive if=3Dvirtio,id=3Dprimary-disk0,driver=3Dquorum,read-pattern=3Dfif=
o,vote-threshold=3D1,\
-         children.0.file.filename=3D1.raw,\
-         children.0.driver=3Draw -S
-Secondary:
-# qemu-system-x86_64 -accel kvm -m 2048 -smp 2 -qmp stdio -name secondary \
-  -device piix3-usb-uhci -vnc :7 \
-  -device usb-tablet -netdev tap,id=3Dhn0,vhost=3Doff \
-  -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dhn0 \
-  -drive if=3Dnone,id=3Dsecondary-disk0,file.filename=3D1.raw,driver=3Draw=
,node-name=3Dnode0 \
-  -drive if=3Dvirtio,id=3Dactive-disk0,driver=3Dreplication,mode=3Dseconda=
ry,\
-         file.driver=3Dqcow2,top-id=3Dactive-disk0,\
-         file.file.filename=3D/mnt/ramfs/active_disk.img,\
-         file.backing.driver=3Dqcow2,\
-         file.backing.file.filename=3D/mnt/ramfs/hidden_disk.img,\
-         file.backing.backing=3Dsecondary-disk0 \
-  -incoming tcp:0:8888
-
-2. On Secondary VM's QEMU monitor, issue command
+Note: Here we are running both instances on the same Machine for testing,
+change the IP Addresses if you want to run it on two Hosts
+
+=3D=3D Startup qemu =3D=3D
+1. Primary:
+# imagefolder=3D"/mnt/vms/colo-test"
+
+The disks for the primary and secondary need to be the same before startin=
g colo
+# cp --reflink=3Dauto $imagefolder/primary.qcow2 $imagefolder/primary-copy=
.qcow2
+
+# qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 512 -smp 1 -qmp =
stdio \
+   -vnc :0 -device piix3-usb-uhci -device usb-tablet -name primary \
+   -netdev tap,id=3Dhn0,vhost=3Doff,helper=3D/usr/lib/qemu/qemu-bridge-hel=
per \
+   -device rtl8139,id=3De0,netdev=3Dhn0 \
+   -chardev socket,id=3Dmirror0,host=3D127.0.0.1,port=3D9003,server,nowait=
 \
+   -chardev socket,id=3Dcompare1,host=3D127.0.0.1,port=3D9004,server,wait \
+   -chardev socket,id=3Dcompare0,host=3D127.0.0.1,port=3D9001,server,nowai=
t \
+   -chardev socket,id=3Dcompare0-0,host=3D127.0.0.1,port=3D9001 \
+   -chardev socket,id=3Dcompare_out,host=3D127.0.0.1,port=3D9005,server,no=
wait \
+   -chardev socket,id=3Dcompare_out0,host=3D127.0.0.1,port=3D9005 \
+   -object filter-mirror,id=3Dm0,netdev=3Dhn0,queue=3Dtx,outdev=3Dmirror0 \
+   -object filter-redirector,netdev=3Dhn0,id=3Dredire0,queue=3Drx,indev=3D=
compare_out \
+   -object filter-redirector,netdev=3Dhn0,id=3Dredire1,queue=3Drx,outdev=
=3Dcompare0 \
+   -object iothread,id=3Diothread1 \
+   -object colo-compare,id=3Dcomp0,primary_in=3Dcompare0-0,secondary_in=3D=
compare1,\
+outdev=3Dcompare_out0,iothread=3Diothread1 \
+   -drive if=3Dide,id=3Dcolo-disk0,driver=3Dquorum,read-pattern=3Dfifo,vot=
e-threshold=3D1,\
+children.0.file.filename=3D$imagefolder/primary.qcow2,children.0.driver=3D=
qcow2 -S
+
+2. Secondary:
+# imagefolder=3D"/mnt/vms/colo-test"
+
+# qemu-img create -f qcow2 $imagefolder/secondary-active.qcow2 10G
+
+# qemu-img create -f qcow2 $imagefolder/secondary-hidden.qcow2 10G
+
+# qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 512 -smp 1 -qmp =
stdio \
+   -vnc :1 -device piix3-usb-uhci -device usb-tablet -name secondary \
+   -netdev tap,id=3Dhn0,vhost=3Doff,helper=3D/usr/lib/qemu/qemu-bridge-hel=
per \
+   -device rtl8139,id=3De0,netdev=3Dhn0 \
+   -chardev socket,id=3Dred0,host=3D127.0.0.1,port=3D9003,reconnect=3D1 \
+   -chardev socket,id=3Dred1,host=3D127.0.0.1,port=3D9004,reconnect=3D1 \
+   -object filter-redirector,id=3Df1,netdev=3Dhn0,queue=3Dtx,indev=3Dred0 \
+   -object filter-redirector,id=3Df2,netdev=3Dhn0,queue=3Drx,outdev=3Dred1=
 \
+   -object filter-rewriter,id=3Drew0,netdev=3Dhn0,queue=3Dall \
+   -drive if=3Dnone,id=3Dparent0,file.filename=3D$imagefolder/primary-copy=
.qcow2,driver=3Dqcow2 \
+   -drive if=3Dnone,id=3Dchilds0,driver=3Dreplication,mode=3Dsecondary,fil=
e.driver=3Dqcow2,\
+top-id=3Dchilds0,file.file.filename=3D$imagefolder/secondary-active.qcow2,\
+file.backing.driver=3Dqcow2,file.backing.file.filename=3D$imagefolder/seco=
ndary-hidden.qcow2,\
+file.backing.backing=3Dparent0 \
+   -drive if=3Dide,id=3Dcolo-disk0,driver=3Dquorum,read-pattern=3Dfifo,vot=
e-threshold=3D1,\
+children.0=3Dchilds0 \
+   -incoming tcp:0:9998
+
+
+3. On Secondary VM's QEMU monitor, issue command
 {'execute':'qmp_capabilities'}
-{ 'execute': 'nbd-server-start',
-  'arguments': {'addr': {'type': 'inet', 'data': {'host': 'xx.xx.xx.xx', '=
port': '8889'} } }
-}
-{'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0', '=
writable': true } }
+{'execute': 'nbd-server-start', 'arguments': {'addr': {'type': 'inet', 'da=
ta': {'host': '127.0.0.1', 'port': '9999'} } } }
+{'execute': 'nbd-server-add', 'arguments': {'device': 'parent0', 'writable=
': true } }
=20
 Note:
   a. The qmp command nbd-server-start and nbd-server-add must be run
@@ -182,44 +212,112 @@ Note:
      same.
   c. It is better to put active disk and hidden disk in ramdisk.
=20
-3. On Primary VM's QEMU monitor, issue command:
+4. On Primary VM's QEMU monitor, issue command:
 {'execute':'qmp_capabilities'}
-{ 'execute': 'human-monitor-command',
-  'arguments': {'command-line': 'drive_add -n buddy driver=3Dreplication,m=
ode=3Dprimary,file.driver=3Dnbd,file.host=3Dxx.xx.xx.xx,file.port=3D8889,fi=
le.export=3Dsecondary-disk0,node-name=3Dnbd_client0'}}
-{ 'execute':'x-blockdev-change', 'arguments':{'parent': 'primary-disk0', '=
node': 'nbd_client0' } }
-{ 'execute': 'migrate-set-capabilities',
-      'arguments': {'capabilities': [ {'capability': 'x-colo', 'state': tr=
ue } ] } }
-{ 'execute': 'migrate', 'arguments': {'uri': 'tcp:xx.xx.xx.xx:8888' } }
+{'execute': 'human-monitor-command', 'arguments': {'command-line': 'drive_=
add -n buddy driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.hos=
t=3D127.0.0.1,file.port=3D9999,file.export=3Dparent0,node-name=3Dreplicatio=
n0'}}
+{'execute': 'x-blockdev-change', 'arguments':{'parent': 'colo-disk0', 'nod=
e': 'replication0' } }
+{'execute': 'migrate-set-capabilities', 'arguments': {'capabilities': [ {'=
capability': 'x-colo', 'state': true } ] } }
+{'execute': 'migrate', 'arguments': {'uri': 'tcp:127.0.0.1:9998' } }
=20
   Note:
   a. There should be only one NBD Client for each primary disk.
-  b. xx.xx.xx.xx is the secondary physical machine's hostname or IP
-  c. The qmp command line must be run after running qmp command line in
+  b. The qmp command line must be run after running qmp command line in
      secondary qemu.
=20
-4. After the above steps, you will see, whenever you make changes to PVM, =
SVM will be synced.
+5. After the above steps, you will see, whenever you make changes to PVM, =
SVM will be synced.
 You can issue command '{ "execute": "migrate-set-parameters" , "arguments"=
:{ "x-checkpoint-delay": 2000 } }'
-to change the checkpoint period time
+to change the idle checkpoint period time
+
+6. Failover test
+You can kill one of the VMs and Failover on the surviving VM:
+
+If you killed the Secondary, then follow "Primary Failover". After that,
+if you want to resume the replication, follow "Primary resume replication"
+
+If you killed the Primary, then follow "Secondary Failover". After that,
+if you want to resume the replication, follow "Secondary resume replicatio=
n"
+
+=3D=3D Primary Failover =3D=3D
+The Secondary died, resume on the Primary
+
+{'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'ch=
ild': 'children.1'} }
+{'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_=
del replication0' } }
+{'execute': 'object-del', 'arguments':{ 'id': 'comp0' } }
+{'execute': 'object-del', 'arguments':{ 'id': 'iothread1' } }
+{'execute': 'object-del', 'arguments':{ 'id': 'm0' } }
+{'execute': 'object-del', 'arguments':{ 'id': 'redire0' } }
+{'execute': 'object-del', 'arguments':{ 'id': 'redire1' } }
+{'execute': 'x-colo-lost-heartbeat' }
+
+=3D=3D Secondary Failover =3D=3D
+The Primary died, resume on the Secondary and prepare to become the new Pr=
imary
+
+{'execute': 'nbd-server-stop'}
+{'execute': 'x-colo-lost-heartbeat'}
+
+{'execute': 'object-del', 'arguments':{ 'id': 'f2' } }
+{'execute': 'object-del', 'arguments':{ 'id': 'f1' } }
+{'execute': 'chardev-remove', 'arguments':{ 'id': 'red1' } }
+{'execute': 'chardev-remove', 'arguments':{ 'id': 'red0' } }
+
+{'execute': 'chardev-add', 'arguments':{ 'id': 'mirror0', 'backend': {'typ=
e': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.0=
.1', 'port': '9003' } }, 'server': true } } } }
+{'execute': 'chardev-add', 'arguments':{ 'id': 'compare1', 'backend': {'ty=
pe': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.=
0.1', 'port': '9004' } }, 'server': true } } } }
+{'execute': 'chardev-add', 'arguments':{ 'id': 'compare0', 'backend': {'ty=
pe': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.0.=
0.1', 'port': '9001' } }, 'server': true } } } }
+{'execute': 'chardev-add', 'arguments':{ 'id': 'compare0-0', 'backend': {'=
type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127.=
0.0.1', 'port': '9001' } }, 'server': false } } } }
+{'execute': 'chardev-add', 'arguments':{ 'id': 'compare_out', 'backend': {=
'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '127=
.0.0.1', 'port': '9005' } }, 'server': true } } } }
+{'execute': 'chardev-add', 'arguments':{ 'id': 'compare_out0', 'backend': =
{'type': 'socket', 'data': {'addr': { 'type': 'inet', 'data': { 'host': '12=
7.0.0.1', 'port': '9005' } }, 'server': false } } } }
+
+=3D=3D Primary resume replication =3D=3D
+Resume replication after new Secondary is up.
+
+Start the new Secondary (Steps 2 and 3 above), then:
+{'execute': 'drive-mirror', 'arguments':{ 'device': 'colo-disk0', 'job-id'=
: 'resync', 'target': 'nbd://127.0.0.1:9999/parent0', 'mode': 'existing', '=
format': 'raw', 'sync': 'full'} }
+
+Wait until disk is synced, then:
+{'execute': 'stop'}
+{'execute': 'block-job-cancel', 'arguments':{ 'device': 'resync'} }
+
+{'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_=
add -n buddy driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.hos=
t=3D127.0.0.1,file.port=3D9999,file.export=3Dparent0,node-name=3Dreplicatio=
n0'}}
+{'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'no=
de': 'replication0' } }
+
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id':=
 'm0', 'props': { 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', '=
id': 'redire0', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compar=
e_out' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', '=
id': 'redire1', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compa=
re0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iot=
hread1' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': =
'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1',=
 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+
+{'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'=
capability': 'x-colo', 'state': true } ] } }
+{'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
+
+Note:
+If this Primary previously was a Secondary, then we need to insert the
+filters before the filter-rewriter by using the
+"'insert': 'before', 'position': 'rew0'" Options. See below.
+
+=3D=3D Secondary resume replication =3D=3D
+Become Primary and resume replication after new Secondary is up.
+
+Start the new Secondary (Steps 2 and 3 above, but with different image than
+primary-copy.qcow2 and different VNC port), then:
+{'execute': 'drive-mirror', 'arguments':{ 'device': 'colo-disk0', 'job-id'=
: 'resync', 'target': 'nbd://127.0.0.1:9999/parent0', 'mode': 'existing', '=
format': 'raw', 'sync': 'full'} }
+
+Wait until disk is synced, then:
+{'execute': 'stop'}
+{'execute': 'block-job-cancel', 'arguments':{ 'device': 'resync' } }
=20
-5. Failover test
-You can kill Primary VM and run 'x_colo_lost_heartbeat' in Secondary VM's
-monitor at the same time, then SVM will failover and client will not detec=
t this
-change.
+{'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_=
add -n buddy driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.hos=
t=3D127.0.0.1,file.port=3D9999,file.export=3Dparent0,node-name=3Dreplicatio=
n0'}}
+{'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'no=
de': 'replication0' } }
=20
-Before issuing '{ "execute": "x-colo-lost-heartbeat" }' command, we have to
-issue block related command to stop block replication.
-Primary:
-  Remove the nbd child from the quorum:
-  { 'execute': 'x-blockdev-change', 'arguments': {'parent': 'colo-disk0', =
'child': 'children.1'}}
-  { 'execute': 'human-monitor-command','arguments': {'command-line': 'driv=
e_del blk-buddy0'}}
-  Note: there is no qmp command to remove the blockdev now
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id':=
 'm0', 'props': { 'insert': 'before', 'position': 'id=3Drew0', 'netdev': 'h=
n0', 'queue': 'tx', 'outdev': 'mirror0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', '=
id': 'redire0', 'props': { 'insert': 'before', 'position': 'id=3Drew0', 'ne=
tdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', '=
id': 'redire1', 'props': { 'insert': 'before', 'position': 'id=3Drew0', 'ne=
tdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iot=
hread1' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': =
'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1',=
 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
=20
-Secondary:
-  The primary host is down, so we should do the following thing:
-  { 'execute': 'nbd-server-stop' }
+{'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'=
capability': 'x-colo', 'state': true } ] } }
+{'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
=20
 =3D=3D TODO =3D=3D
-1. Support continuous VM replication.
-2. Support shared storage.
-3. Develop the heartbeat part.
-4. Reduce checkpoint VM=E2=80=99s downtime while doing checkpoint.
+1. Support shared storage.
+2. Develop the heartbeat part.
+3. Reduce checkpoint VM=E2=80=99s downtime while doing checkpoint.
diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 6bde6737fb..108e9166a8 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -65,12 +65,12 @@ blocks that are already in QEMU.
              ^            ||                            .----------
              |            ||                            | Secondary
         1 Quorum          ||                            '----------
-         /      \         ||
-        /        \        ||
-   Primary    2 filter
-     disk         ^                                                       =
      virtio-blk
-                  |                                                       =
           ^
-                3 NBD  ------->  3 NBD                                    =
           |
+         /      \         ||                                              =
             virtio-blk
+        /        \        ||                                              =
                 ^
+   Primary    2 filter                                                    =
                 |
+     disk         ^                                                       =
            7 Quorum
+                  |                                                       =
             /
+                3 NBD  ------->  3 NBD                                    =
            /
                 client    ||     server                                   =
       2 filter
                           ||        ^                                     =
           ^
 --------.                 ||        |                                     =
           |
@@ -106,6 +106,10 @@ any state that would otherwise be lost by the speculat=
ive write-through
 of the NBD server into the secondary disk. So before block replication,
 the primary disk and secondary disk should contain the same data.
=20
+7) The secondary also has a quorum node, so after secondary failover it
+can become the new primary and continue replication.
+
+
 =3D=3D Failure Handling =3D=3D
 There are 7 internal errors when block replication is running:
 1. I/O error on primary disk
@@ -171,16 +175,18 @@ Primary:
      leading whitespace.
   5. The qmp command line must be run after running qmp command line in
      secondary qemu.
-  6. After failover we need remove children.1 (replication driver).
+  6. After primary failover we need remove children.1 (replication driver).
=20
 Secondary:
   -drive if=3Dnone,driver=3Draw,file.filename=3D1.raw,id=3Dcolo1 \
-  -drive if=3Dxxx,id=3Dtopxxx,driver=3Dreplication,mode=3Dsecondary,top-id=
=3Dtopxxx\
+  -drive if=3Dnone,id=3Dchilds1,driver=3Dreplication,mode=3Dsecondary,top-=
id=3Dchilds1
          file.file.filename=3Dactive_disk.qcow2,\
          file.driver=3Dqcow2,\
          file.backing.file.filename=3Dhidden_disk.qcow2,\
          file.backing.driver=3Dqcow2,\
          file.backing.backing=3Dcolo1
+  -drive if=3Dxxx,driver=3Dquorum,read-pattern=3Dfifo,id=3Dtop-disk1,\
+         vote-threshold=3D1,children.0=3Dchilds1
=20
   Then run qmp command in secondary qemu:
     { 'execute': 'nbd-server-start',
@@ -234,6 +240,8 @@ Secondary:
   The primary host is down, so we should do the following thing:
   { 'execute': 'nbd-server-stop' }
=20
+Promote Secondary to Primary:
+  see COLO-FT.txt
+
 TODO:
-1. Continuous block replication
-2. Shared disk
+1. Shared disk
--=20
2.20.1


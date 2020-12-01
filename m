Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3412CAD4A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:27:54 +0100 (CET)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCFd-00028V-9R
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCBN-0005Ps-R2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:30 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCBC-0000T6-Tt
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:29 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KF3SR164002;
 Tue, 1 Dec 2020 20:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=KCDAaiHdgp9I58kVBEZuqV5kAlD6FyYBt+wJnP7AfIU=;
 b=rT3A0ef89BA373aPcnXfCHcyibgs9umh2/3KgG0i0QodMS9fL43Y5E9zV7xComtIROfN
 B3BTOCgL4VJY61MSwW271i/PVTD0t2jNmn56r7Ona/Qyyx4Q/0pJGG2YPdPQxJIsSSYK
 u0iNjBdQCxTjyzZ9n1z4jlBm5mkbNQMGyZOL0Gt1A2pXIamZyNM0hTFUBJ7y03rWtBxa
 NUHkOYV7TXU0MP2jgoohT8V0codbvPJJnSF7s2dSQuMHStNWaYODrX3jxGx1CesserdB
 I0rlllPVIYvCUicvXdtGQz3kOBl1g3upuTrPc6o5r6z/MUNrBeOi5cTKqZifd3IPDLIF 2Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 353c2avsrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 20:23:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KGOhc115899;
 Tue, 1 Dec 2020 20:23:09 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35404nbshp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 20:23:09 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1KN7Fc031360;
 Tue, 1 Dec 2020 20:23:07 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 20:23:07 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 02/19] multi-process: add configure and usage information
Date: Tue,  1 Dec 2020 15:22:37 -0500
Message-Id: <cc6c74cba091d2735f0dbcba4b5fa28d8a780908.1606853298.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010122
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Adds documentation explaining the command-line arguments needed
to use multi-process. Also adds a python script that illustrates the
usage.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/multi-process.rst                        | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 tests/multiprocess/multiprocess-lsi53c895a.py | 92 +++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 docs/multi-process.rst
 create mode 100755 tests/multiprocess/multiprocess-lsi53c895a.py

diff --git a/docs/multi-process.rst b/docs/multi-process.rst
new file mode 100644
index 0000000..9a5fe5b
--- /dev/null
+++ b/docs/multi-process.rst
@@ -0,0 +1,66 @@
+Multi-process QEMU
+==================
+
+This document describes how to configure and use multi-process qemu.
+For the design document refer to docs/devel/qemu-multiprocess.
+
+1) Configuration
+----------------
+
+multi-process is enabled by default for targets that enable KVM
+
+
+2) Usage
+--------
+
+Multi-process QEMU requires an orchestrator to launch. Please refer to a
+light-weight python based orchestrator for mpqemu in
+scripts/mpqemu-launcher.py to lauch QEMU in multi-process mode.
+
+Following is a description of command-line used to launch mpqemu.
+
+* Orchestrator:
+
+  - The Orchestrator creates a unix socketpair
+
+  - It launches the remote process and passes one of the
+    sockets to it via command-line.
+
+  - It then launches QEMU and specifies the other socket as an option
+    to the Proxy device object
+
+* Remote Process:
+
+  - QEMU can enter remote process mode by using the "remote" machine
+    option.
+
+  - The orchestrator creates a "remote-object" with details about
+    the device and the file descriptor for the device
+
+  - The remaining options are no different from how one launches QEMU with
+    devices.
+
+  - Example command-line for the remote process is as follows:
+
+      /usr/bin/qemu-system-x86_64                                        \
+      -machine x-remote                                                  \
+      -device lsi53c895a,id=lsi0                                         \
+      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
+      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
+      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+
+* QEMU:
+
+  - Since parts of the RAM are shared between QEMU & remote process, a
+    memory-backend-memfd is required to facilitate this, as follows:
+
+    -object memory-backend-memfd,id=mem,size=2G
+
+  - A "x-pci-proxy-dev" device is created for each of the PCI devices emulated
+    in the remote process. A "socket" sub-option specifies the other end of
+    unix channel created by orchestrator. The "id" sub-option must be specified
+    and should be the same as the "id" specified for the remote PCI device
+
+  - Example commandline for QEMU is as follows:
+
+      -device x-pci-proxy-dev,id=lsi0,socket=3
diff --git a/MAINTAINERS b/MAINTAINERS
index 88a5a14..f615ad1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3136,6 +3136,7 @@ M: Jagannathan Raman <jag.raman@oracle.com>
 M: John G Johnson <john.g.johnson@oracle.com>
 S: Maintained
 F: docs/devel/multi-process.rst
+F: tests/multiprocess/multiprocess-lsi53c895a.py
 
 Build and test automation
 -------------------------
diff --git a/tests/multiprocess/multiprocess-lsi53c895a.py b/tests/multiprocess/multiprocess-lsi53c895a.py
new file mode 100755
index 0000000..bfe4f66
--- /dev/null
+++ b/tests/multiprocess/multiprocess-lsi53c895a.py
@@ -0,0 +1,92 @@
+#!/usr/bin/env python3
+
+import urllib.request
+import subprocess
+import argparse
+import socket
+import sys
+import os
+
+arch = os.uname()[4]
+proc_path = os.path.join(os.getcwd(), '..', '..', 'build', arch+'-softmmu',
+                         'qemu-system-'+arch)
+
+parser = argparse.ArgumentParser(description='Launcher for multi-process QEMU')
+parser.add_argument('--bin', required=False, help='location of QEMU binary',
+                    metavar='bin');
+args = parser.parse_args()
+
+if args.bin is not None:
+    proc_path = args.bin
+
+if not os.path.isfile(proc_path):
+    sys.exit('QEMU binary not found')
+
+kernel_path = os.path.join(os.getcwd(), 'vmlinuz')
+initrd_path = os.path.join(os.getcwd(), 'initrd')
+
+proxy_cmd = [ proc_path,                                                    \
+              '-name', 'Fedora', '-smp', '4', '-m', '2048', '-cpu', 'host', \
+              '-object', 'memory-backend-memfd,id=sysmem-file,size=2G',     \
+              '-numa', 'node,memdev=sysmem-file',                           \
+              '-kernel', kernel_path, '-initrd', initrd_path,               \
+              '-vnc', ':0',                                                 \
+              '-monitor', 'unix:/home/qemu-sock,server,nowait',             \
+            ]
+
+if arch == 'x86_64':
+    print('Downloading images for arch x86_64')
+    kernel_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
+                 'releases/33/Everything/x86_64/os/images/'          \
+                 'pxeboot/vmlinuz'
+    initrd_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
+                 'releases/33/Everything/x86_64/os/images/'          \
+                 'pxeboot/initrd.img'
+    proxy_cmd.append('-machine')
+    proxy_cmd.append('pc,accel=kvm')
+    proxy_cmd.append('-append')
+    proxy_cmd.append('rdinit=/bin/bash console=ttyS0 console=tty0')
+elif arch == 'aarch64':
+    print('Downloading images for arch aarch64')
+    kernel_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
+                 'releases/33/Everything/aarch64/os/images/'         \
+                 'pxeboot/vmlinuz'
+    initrd_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
+                 'releases/33/Everything/aarch64/os/images/'         \
+                 'pxeboot/initrd.img'
+    proxy_cmd.append('-machine')
+    proxy_cmd.append('virt,gic-version=3')
+    proxy_cmd.append('-accel')
+    proxy_cmd.append('kvm')
+    proxy_cmd.append('-append')
+    proxy_cmd.append('rdinit=/bin/bash')
+else:
+    sys.exit('Arch %s not tested' % arch)
+
+urllib.request.urlretrieve(kernel_url, kernel_path)
+urllib.request.urlretrieve(initrd_url, initrd_path)
+
+proxy, remote = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
+
+proxy_cmd.append('-device')
+proxy_cmd.append('x-pci-proxy-dev,id=lsi1,fd='+str(proxy.fileno()))
+
+remote_cmd = [ proc_path,                                                      \
+               '-machine', 'x-remote',                                         \
+               '-device', 'lsi53c895a,id=lsi1',                                \
+               '-object',                                                      \
+               'x-remote-object,id=robj1,devid=lsi1,fd='+str(remote.fileno()), \
+               '-display', 'none',                                             \
+               '-monitor', 'unix:/home/rem-sock,server,nowait',                \
+             ]
+
+pid = os.fork();
+
+if pid:
+    # In Proxy
+    print('Launching QEMU with Proxy object');
+    process = subprocess.Popen(proxy_cmd, pass_fds=[proxy.fileno()])
+else:
+    # In remote
+    print('Launching Remote process');
+    process = subprocess.Popen(remote_cmd, pass_fds=[remote.fileno(), 0, 1, 2])
-- 
1.8.3.1



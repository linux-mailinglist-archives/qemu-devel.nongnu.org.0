Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E260F20C341
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 19:18:42 +0200 (CEST)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpETR-0003rf-SI
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 13:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jpELg-00007q-E8
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 13:10:40 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jpELd-0007BR-WA
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 13:10:40 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05RH4OtZ157820;
 Sat, 27 Jun 2020 17:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=ezXrBDecdyhEbNw6sVUbJWXX77mydgDvHdKqtavWP0k=;
 b=duZW3cb6Y6GBpiZgBE8TZgtB4mHFR3W/bmNF7wxbFocogpWRwk/Popw+m/xPE32RBMWw
 xeDtr08lMsbUDmnNpqybK6jGPD7eoL4tJ1ClT+R2zQjEN2FQGD+UMnv6LC93PMhRg6v0
 9WoKp77CWoGJ1PdDx3R28q8+c7CUpVkueuvqRiJ4PBEhcpHiwVUbk4ImJBGERxh61XyS
 cS/t4q4ld/c4sPt6FQm5QIJZz1bfL5ov/1/Ejjq+BuIl2n2f1QTMd1pffuYwo68ZsXhO
 MdKxd+RlnIGces/l2DN02fqY36W3FwLfy25VSum9cdDyqIkVQhxbL4JbEs+i5ieSeSGg YQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 31wx2m9ay3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 27 Jun 2020 17:10:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05RH8Qpg102219;
 Sat, 27 Jun 2020 17:10:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 31wwx17sut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Jun 2020 17:10:31 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05RHAUtg024383;
 Sat, 27 Jun 2020 17:10:30 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 27 Jun 2020 10:10:30 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/21] multi-process: add configure and usage information
Date: Sat, 27 Jun 2020 10:09:43 -0700
Message-Id: <3624d64f8943aea7f9867c10159e15b42cac77ff.1593273671.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1593273671.git.elena.ufimtseva@oracle.com>
References: <cover.1593273671.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9665
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=1
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006270124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9665
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 impostorscore=0 cotscore=-2147483648 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006270123
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 13:10:09
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 MAINTAINERS                          |  2 +
 docs/multi-process.rst               | 71 ++++++++++++++++++++++++++++
 scripts/mpqemu-launcher-perf-mode.py | 67 ++++++++++++++++++++++++++
 scripts/mpqemu-launcher.py           | 47 ++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 docs/multi-process.rst
 create mode 100644 scripts/mpqemu-launcher-perf-mode.py
 create mode 100755 scripts/mpqemu-launcher.py

diff --git a/MAINTAINERS b/MAINTAINERS
index a65a5dd279..60c21d8210 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2959,6 +2959,8 @@ F: include/hw/pci/memory-sync.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: docs/devel/multi-process.rst
+F: scripts/mpqemu-launcher.py
+F: scripts/mpqemu-launcher-perf-mode.py
 
 Build and test automation
 -------------------------
diff --git a/docs/multi-process.rst b/docs/multi-process.rst
new file mode 100644
index 0000000000..0fa643a511
--- /dev/null
+++ b/docs/multi-process.rst
@@ -0,0 +1,71 @@
+Multi-process QEMU
+==================
+
+This document describes how to configure and use multi-process qemu.
+For the design document refer to docs/devel/qemu-multiprocess.
+
+1) Configuration
+----------------
+
+To enable support for multi-process add --enable-mpqemu
+to the list of options for the "configure" script.
+
+
+2) Usage
+--------
+
+Multi-process QEMU requires an orchestrator to launch. Please refer to a
+light-weight python based orchestrator for mpqemu in
+scripts/mpqemu-launcher.py to lauch QEMU in multi-process mode.
+
+Please refer to scripts/mpqemu-launcher-perf-mode.py for running the remote
+process in performance mode.
+
+As of now, we only support the emulation of lsi53c895a in a separate process.
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
+    option. The socket suboption specifies the channel in which the
+    remote process received messages
+
+  - The remaining options are no different from how one launches QEMU with
+    devices. The only other requirement is each PCI device must have a
+    unique ID specified to it. This is needed to pair remote device with the
+    Proxy object.
+
+  - Example command-line for the remote process is as follows:
+
+      /usr/bin/qemu-system-x86_64                                        \
+      -machine remote,socket=4                                           \
+      -device lsi53c895a,id=lsi0                                         \
+      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
+      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0
+
+* QEMU:
+
+  - Since parts of the RAM are shared between QEMU & remote process, a
+    memory-backend-memfd is required to facilitate this, as follows:
+
+    -object memory-backend-memfd,id=mem,size=2G
+
+  - A "pci-proxy-dev" device is created for each of the PCI devices emulated
+    in the remote process. A "socket" sub-option specifies the other end of
+    unix channel created by orchestrator. The "id" sub-option must be specified
+    and should be the same as the "id" specified for the remote PCI device
+
+  - Example commandline for QEMU is as follows:
+
+      -device pci-proxy-dev,id=lsi0,socket=3
diff --git a/scripts/mpqemu-launcher-perf-mode.py b/scripts/mpqemu-launcher-perf-mode.py
new file mode 100644
index 0000000000..583f65ca99
--- /dev/null
+++ b/scripts/mpqemu-launcher-perf-mode.py
@@ -0,0 +1,67 @@
+#!/usr/bin/env python3
+import socket
+import os
+import subprocess
+import time
+
+PROC_QEMU='/usr/bin/qemu-system-x86_64'
+
+proxy_1, remote_1 = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
+proxy_2, remote_2 = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
+
+remote_cmd_1 = [ PROC_QEMU,                                                    \
+                 '-machine', 'remote,socket='+str(remote_1.fileno()),          \
+                 '-device', 'lsi53c895a,id=lsi1',                              \
+                 '-drive', 'id=drive_image1,file=/test-1.qcow2',               \
+                 '-device', 'scsi-hd,id=drive1,drive=drive_image1,bus=lsi1.0,' \
+                                'scsi-id=0',                                   \
+                 '-nographic',                                                 \
+               ]
+
+remote_cmd_2 = [ PROC_QEMU,                                                    \
+                 '-machine', 'remote,socket='+str(remote_2.fileno()),          \
+                 '-device', 'lsi53c895a,id=lsi2',                              \
+                 '-drive', 'id=drive_image2,file=/test-2.qcow2',               \
+                 '-device', 'scsi-hd,id=drive2,drive=drive_image2,bus=lsi2.0,' \
+                                'scsi-id=0',                                   \
+                 '-nographic',                                                 \
+               ]
+
+proxy_cmd = [ PROC_QEMU,                                                       \
+              '-name', 'OL7.4',                                                \
+              '-machine', 'q35,accel=kvm',                                     \
+              '-smp', 'sockets=1,cores=1,threads=1',                           \
+              '-m', '2048',                                                    \
+              '-object', 'memory-backend-memfd,id=sysmem-file,size=2G',        \
+              '-numa', 'node,memdev=sysmem-file',                              \
+              '-device', 'virtio-scsi-pci,id=virtio_scsi_pci0',                \
+              '-drive', 'id=drive_image1,if=none,format=qcow2,'                \
+                            'file=/home/ol7-hdd-1.qcow2',                      \
+              '-device', 'scsi-hd,id=image1,drive=drive_image1,'               \
+                             'bus=virtio_scsi_pci0.0',                         \
+              '-boot', 'd',                                                    \
+              '-vnc', ':0',                                                    \
+              '-device', 'pci-proxy-dev,id=lsi1,fd='+str(proxy_1.fileno()),    \
+              '-device', 'pci-proxy-dev,id=lsi2,fd='+str(proxy_2.fileno()),    \
+            ]
+
+
+pid = os.fork();
+if pid == 0:
+    # In remote_1
+    print('Launching Remote process 1');
+    process = subprocess.Popen(remote_cmd_1, pass_fds=[remote_1.fileno()])
+    os._exit(0)
+
+
+pid = os.fork();
+if pid == 0:
+    # In remote_2
+    print('Launching Remote process 2');
+    process = subprocess.Popen(remote_cmd_2, pass_fds=[remote_2.fileno()])
+    os._exit(0)
+
+
+print('Launching Proxy process');
+process = subprocess.Popen(proxy_cmd, pass_fds=[proxy_1.fileno(),
+                           proxy_2.fileno()])
diff --git a/scripts/mpqemu-launcher.py b/scripts/mpqemu-launcher.py
new file mode 100755
index 0000000000..751b51eae7
--- /dev/null
+++ b/scripts/mpqemu-launcher.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+import socket
+import os
+import subprocess
+import time
+
+PROC_QEMU='/usr/bin/qemu-system-x86_64'
+
+proxy, remote = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
+
+remote_cmd = [ PROC_QEMU,                                                      \
+               '-machine', 'remote,socket='+str(remote.fileno()),              \
+               '-device', 'lsi53c895a,id=lsi1',                                \
+               '-drive', 'id=drive_image1,file=/build/ol7-nvme-test-1.qcow2',  \
+               '-device', 'scsi-hd,id=drive1,drive=drive_image1,bus=lsi1.0,'   \
+                              'scsi-id=0',                                     \
+               '-nographic',                                                   \
+             ]
+
+proxy_cmd = [ PROC_QEMU,                                                       \
+              '-name', 'OL7.4',                                                \
+              '-machine', 'q35,accel=kvm',                                     \
+              '-smp', 'sockets=1,cores=1,threads=1',                           \
+              '-m', '2048',                                                    \
+              '-object', 'memory-backend-memfd,id=sysmem-file,size=2G',        \
+              '-numa', 'node,memdev=sysmem-file',                              \
+              '-device', 'virtio-scsi-pci,id=virtio_scsi_pci0',                \
+              '-drive', 'id=drive_image1,if=none,format=qcow2,'                \
+                            'file=/home/ol7-hdd-1.qcow2',                      \
+              '-device', 'scsi-hd,id=image1,drive=drive_image1,'               \
+                             'bus=virtio_scsi_pci0.0',                         \
+              '-boot', 'd',                                                    \
+              '-vnc', ':0',                                                    \
+              '-device', 'pci-proxy-dev,id=lsi1,fd='+str(proxy.fileno()),      \
+            ]
+
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
+    process = subprocess.Popen(remote_cmd, pass_fds=[remote.fileno()])
-- 
2.25.GIT



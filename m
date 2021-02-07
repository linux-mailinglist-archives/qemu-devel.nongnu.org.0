Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A80A3125AF
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 17:01:06 +0100 (CET)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mUj-0001WZ-68
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 11:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPW-0006Dx-9A
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:42 -0500
Received: from mout.web.de ([217.72.192.78]:57101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPS-0006fP-NM
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1612713334;
 bh=NMMsVo6UP+tY4nzfzqtrt0Tm1mz0QhW032eIVQMYNaY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=n2attqH/cSwcr1LI+hHTT1gtS8KpMJjFqsFzDDQ08G/rxysYHJupkmaBrOaOSEsPb
 uUzUgtHDTmMhUbnQKTs35bCYVoMkWpWd5tIiPVEJPYVfUzIXPGvNe/+uKWsXQ4qHLq
 gJghWsPJmPfPLrXEQo6c6OTrvl1THAGZslqrakdk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.85]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVJNd-1lJbU11BPr-00SNMS; Sun, 07
 Feb 2021 16:55:34 +0100
Date: Sun, 7 Feb 2021 16:55:32 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/6] colo: Introduce high-level test suite
Message-ID: <df83132e654b8c16e2b4e5ca4a0221a45c30e30f.1612712637.git.lukasstraub2@web.de>
In-Reply-To: <cover.1612712637.git.lukasstraub2@web.de>
References: <cover.1612712637.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ut9NRGkDh/v/VkwablR6gp5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:kwSGCzgPugIMBQt6LOkvYiyVQJ8/uAGzRRPjGoZB33uD1+wPPEW
 ms5TdfDSHUQK/9ArYcs6jnB/epEIisGP29oKzRYZ6PIHRKQY/e9Cb5RJPePSBxDo0Zbr3AG
 ScyUxReTzzihG5usrZoa7vQcrb3xoL9vSwEFBBKQU1CvAU7EtOIr7fvoSJE831Ly3c3Pbav
 5Hu5M5dTLelmRIihE9h3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j5M2+WHhfI4=:kHW/oKkcuRgEhkRNbMUJQ3
 gk8zaNPmsHilQNr6aQYtHpTDQtke+L+CM7TVP9eOKLeuuoBSVaogyvLUaIglL6F6SGXi4z/hn
 wIlvVtdIQ5wtkiDFsZ4PSeBel6A+kidLAg4Q4iYGivJ0COQPElHfD6aAzq3upSJ6mBnw5ib/f
 LQM0t7PmOmBvsisTknpnHkSPez0yF3GKRSvoreioXc6mfmP3q3saoKvAWINiV1r71qnoFuc67
 b0GOdYzaWkLzitpF5340vnko7D/xTSsvPTi0bEyvvRZtNaXre3VxGoqoDss6XisF1Q/8UlLLE
 A9bUl46KMopJVk+G6+u1TTo59N1vstmlJx6yvrxnAJDqz+SxHwksWJNY8Ry/IvTub2ElPUC27
 WmdbjTUCYN99sAyzlq9kqJh9xUz8u9Q/fiV0XfJB1Hv0kfLl6iUlSpkGoAGimRutyUCE+8vMF
 irqql3psHR3i7vkpqHPYT8lR9LGL88jgL+2WwxJWDJsMclaDNHZFmHla+esJDaxLJE/EWL6Lg
 Vbf2SiJM1+sDm7SZZSxHBA7CBbWmVr2vY9cBjbyQ5c1jNEAzx3e/wFi8AsXozohS6O81w1HyQ
 C+0nrsp4FEzJcUSZvJ8xaq4pXg0UDgSXEI25mr1zdKlvOuUiZRwKLuJ3+4Qd0+MU7NJgO9+VK
 pseg8rUoYS4T/lBbnd72Xp+6lFjYic6HTwbopQxYoH3aUtR7lW17EXpN09MyIL6a5Ff2sBCJS
 /nL2qCO/dzJR0Ig0hvysKyPxcE9LcVfQW4ML5wazE7k4lPImj03GkselBgoXw1+9zR588KTNa
 G88DkcdumqO8uzU/vXQDJuaphz++0i9iZ1HbB1AwIZjsWNEGRtrzBN+D8EFHksqXq+aWN4qs7
 qgSefhm9/sDmNz5U+FJlWgP0QTp54RokXvPA411Qs=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ut9NRGkDh/v/VkwablR6gp5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add high-level test relying on the colo resource-agent to test
all failover cases while checking guest network connectivity.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 scripts/colo-resource-agent/crm_master   |  44 ++
 scripts/colo-resource-agent/crm_resource |  12 +
 tests/acceptance/colo.py                 | 654 +++++++++++++++++++++++
 3 files changed, 710 insertions(+)
 create mode 100755 scripts/colo-resource-agent/crm_master
 create mode 100755 scripts/colo-resource-agent/crm_resource
 create mode 100644 tests/acceptance/colo.py

diff --git a/scripts/colo-resource-agent/crm_master b/scripts/colo-resource=
-agent/crm_master
new file mode 100755
index 0000000000..886f523bda
--- /dev/null
+++ b/scripts/colo-resource-agent/crm_master
@@ -0,0 +1,44 @@
+#!/bin/bash
+
+# Fake crm_master for COLO testing
+#
+# Copyright (c) Lukas Straub <lukasstraub2@web.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+TMPDIR=3D"$HA_RSCTMP"
+score=3D0
+query=3D0
+
+OPTIND=3D1
+while getopts 'Qql:Dv:N:G' opt; do
+    case "$opt" in
+        Q|q)
+            # Noop
+        ;;
+        "l")
+            # Noop
+        ;;
+        "D")
+            score=3D0
+        ;;
+        "v")
+            score=3D$OPTARG
+        ;;
+        "N")
+            TMPDIR=3D"$COLO_TEST_REMOTE_TMP"
+        ;;
+        "G")
+            query=3D1
+        ;;
+    esac
+done
+
+if (( query )); then
+    cat "${TMPDIR}/master_score" || exit 1
+else
+    echo $score > "${TMPDIR}/master_score" || exit 1
+fi
+
+exit 0
diff --git a/scripts/colo-resource-agent/crm_resource b/scripts/colo-resour=
ce-agent/crm_resource
new file mode 100755
index 0000000000..ad69ff3c6b
--- /dev/null
+++ b/scripts/colo-resource-agent/crm_resource
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# Fake crm_resource for COLO testing
+#
+# Copyright (c) Lukas Straub <lukasstraub2@web.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+# Noop
+
+exit 0
diff --git a/tests/acceptance/colo.py b/tests/acceptance/colo.py
new file mode 100644
index 0000000000..2a0027f0c8
--- /dev/null
+++ b/tests/acceptance/colo.py
@@ -0,0 +1,654 @@
+# High-level test suite for qemu COLO testing all failover cases while che=
cking
+# guest network connectivity
+#
+# Copyright (c) Lukas Straub <lukasstraub2@web.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+# HOWTO:
+#
+# This test has the following parameters:
+# bridge_name: name of the bridge interface to connect qemu to
+# host_address: ip address of the bridge interface
+# guest_address: ip address that the guest gets from the dhcp server
+# bridge_helper: path to the brige helper
+#                (default: /usr/lib/qemu/qemu-bridge-helper)
+# install_cmd: command to run to install iperf3 and memtester in the guest
+#              (default: "sudo -n dnf -q -y install iperf3 memtester")
+#
+# To run the network tests, you have to specify the parameters.
+#
+# Example for running the colo tests:
+# make check-acceptance FEDORA_31_ARCHES=3D"x86_64" AVOCADO_TAGS=3D"-t col=
o \
+#  -p bridge_name=3Dbr0 -p host_address=3D192.168.220.1 \
+#  -p guest_address=3D192.168.220.222"
+#
+# The colo tests currently only use x86_64 test vm images. With the
+# FEDORA_31_ARCHES make variable as in the example, only the x86_64 images=
 will
+# be downloaded.
+#
+# If you're running the network tests as an unprivileged user, you need to=
 set
+# the suid bit on the bridge helper (chmod +s <bridge-helper>).
+#
+# The dhcp server should assign a static ip to the guest, else the test ma=
y be
+# unreliable. The Mac address for the guest is always 52:54:00:12:34:56.
+
+
+import sys
+import subprocess
+import shutil
+import os
+import signal
+import os.path
+import time
+import tempfile
+
+from avocado import skipUnless
+from avocado.utils import network
+from avocado.utils import vmimage
+from avocado.utils import cloudinit
+from avocado.utils import ssh
+from avocado.utils.path import find_command, CmdNotFoundError
+
+from avocado_qemu import Test, pick_default_qemu_bin, SOURCE_DIR
+from qemu.qmp import QEMUMonitorProtocol
+
+def iperf3_available():
+    try:
+        find_command("iperf3")
+    except CmdNotFoundError:
+        return False
+    return True
+
+class Host:
+
+    logdir =3D ""
+    tmpdir =3D ""
+    pid_file =3D ""
+    master_score_file =3D ""
+    qmp_sock =3D ""
+    image =3D ""
+    bridge_port =3D 0
+
+class ColoTest(Test):
+
+    # Constants
+    OCF_SUCCESS =3D 0
+    OCF_ERR_GENERIC =3D 1
+    OCF_ERR_ARGS =3D 2
+    OCF_ERR_UNIMPLEMENTED =3D 3
+    OCF_ERR_PERM =3D 4
+    OCF_ERR_INSTALLED =3D 5
+    OCF_ERR_CONFIGURED =3D 6
+    OCF_NOT_RUNNING =3D 7
+    OCF_RUNNING_MASTER =3D 8
+    OCF_FAILED_MASTER =3D 9
+
+    QEMU_OPTIONS =3D (" -display none -vga none -enable-kvm"
+                    " -smp 2 -cpu host -m 768"
+                    " -device e1000,mac=3D52:54:00:12:34:56,netdev=3Dhn0"
+                    " -device virtio-blk,drive=3Dcolo-disk0"
+                    " -device virtio-rng")
+
+    FEDORA_VERSION =3D "31"
+    IMAGE_CHECKSUM =3D "e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc0=
26954f3c5c27a0"
+
+    hosts =3D [ Host(), Host() ]
+    hang_qemu =3D False
+    checkpoint_failover =3D False
+    traffic_procs =3D []
+
+    def get_image(self, temp_dir):
+        try:
+            return vmimage.get(
+                "fedora", arch=3D"x86_64", version=3Dself.FEDORA_VERSION,
+                checksum=3Dself.IMAGE_CHECKSUM, algorithm=3D"sha256",
+                cache_dir=3Dself.cache_dirs[0],
+                snapshot_dir=3Dtemp_dir)
+        except:
+            self.cancel("Failed to download/prepare image")
+
+    @skipUnless(ssh.SSH_CLIENT_BINARY, "No SSH client available")
+    def setUp(self):
+        # Qemu and qemu-img binary
+        default_qemu_bin =3D pick_default_qemu_bin()
+        self.QEMU_BINARY =3D self.params.get("qemu_bin", default=3Ddefault=
_qemu_bin)
+
+        qemu_img =3D self.pick_qemu_util("qemu-img")
+        self.QEMU_IMG_BINARY =3D qemu_img
+        vmimage.QEMU_IMG =3D qemu_img
+
+        self.RESOURCE_AGENT =3D os.path.join(SOURCE_DIR,
+                                           "scripts/colo-resource-agent/co=
lo")
+        self.ADD_PATH =3D os.path.join(SOURCE_DIR, "scripts/colo-resource-=
agent")
+
+        # Logs
+        self.RA_LOG =3D os.path.join(self.outputdir, "resource-agent.log")
+        for n in range(2):
+            logdir =3D os.path.join(self.outputdir, "host%u" % n)
+            self.hosts[n].logdir =3D logdir
+            os.makedirs(logdir)
+
+        # Temporary directories
+        # We don't use self.workdir because of unix socket path length
+        # limitations
+        self.TMPDIR =3D tempfile.mkdtemp()
+        for n in range(2):
+            tmpdir =3D os.path.join(self.TMPDIR, "host%u" % n)
+            self.hosts[n].tmpdir =3D tmpdir
+            os.makedirs(tmpdir)
+
+        for n in range(2):
+            self.hosts[n].pid_file =3D \
+                os.path.join(self.hosts[n].tmpdir, "colo-test-qemu.pid")
+            self.hosts[n].master_score_file =3D \
+                os.path.join(self.hosts[n].tmpdir, "master_score")
+            self.hosts[n].qmp_sock =3D \
+                os.path.join(self.hosts[n].tmpdir, "my-qmp.sock")
+
+        # Network
+        self.BRIDGE_NAME =3D self.params.get("bridge_name")
+        if self.BRIDGE_NAME:
+            self.HOST_ADDRESS =3D self.params.get("host_address")
+            self.GUEST_ADDRESS =3D self.params.get("guest_address")
+            self.BRIDGE_HELPER =3D self.pick_qemu_util("qemu-bridge-helper=
")
+            self.SSH_PORT =3D 22
+        else:
+            # QEMU's hard coded usermode router address
+            self.HOST_ADDRESS =3D "10.0.2.2"
+            self.GUEST_ADDRESS =3D "127.0.0.1"
+            self.SSH_PORT =3D network.find_free_port(address=3D"127.0.0.1")
+            for n in range(2):
+                self.hosts[n].bridge_port =3D \
+                    network.find_free_port(address=3D"127.0.0.1")
+
+        self.CLOUDINIT_HOME_PORT =3D network.find_free_port()
+
+        # Find free port range
+        base_port =3D 1024
+        while True:
+            base_port =3D network.find_free_port(start_port=3Dbase_port,
+                                               address=3D"127.0.0.1")
+            if base_port =3D=3D None:
+                self.cancel("Failed to find a free port")
+            for n in range(base_port, base_port +4):
+                if n > 65535:
+                    break
+                if not network.is_port_free(n, "127.0.0.1"):
+                    break
+            else:
+                # for loop above didn't break
+                break
+
+        self.BASE_PORT =3D base_port
+
+        # Disk images
+        self.log.info("Downloading/preparing boot image")
+        for n in range(2):
+            self.hosts[n].image =3D self.get_image(self.hosts[n].tmpdir).p=
ath
+        self.CLOUDINIT_ISO =3D os.path.join(self.TMPDIR, "cloudinit.iso")
+
+        self.log.info("Preparing cloudinit image")
+        try:
+            cloudinit.iso(self.CLOUDINIT_ISO, self.name,
+                          username=3D"test", password=3D"password",
+                          phone_home_host=3Dself.HOST_ADDRESS,
+                          phone_home_port=3Dself.CLOUDINIT_HOME_PORT)
+        except Exception as e:
+            self.cancel("Failed to prepare cloudinit image")
+
+        self.QEMU_OPTIONS +=3D " -cdrom %s" % self.CLOUDINIT_ISO
+
+        # Network bridge
+        if not self.BRIDGE_NAME:
+            self.BRIDGE_PIDFILE =3D os.path.join(self.TMPDIR, "bridge.pid")
+            self.run_command(("'%s' -pidfile '%s'"
+                " -M none -display none -daemonize"
+                " -netdev user,id=3Dhost,hostfwd=3Dtcp:127.0.0.1:%s-:22"
+                " -netdev socket,id=3Dhost0,listen=3D127.0.0.1:%s"
+                " -netdev socket,id=3Dhost1,listen=3D127.0.0.1:%s"
+                " -netdev hubport,id=3Dhostport,hubid=3D0,netdev=3Dhost"
+                " -netdev hubport,id=3Dport0,hubid=3D0,netdev=3Dhost0"
+                " -netdev hubport,id=3Dport1,hubid=3D0,netdev=3Dhost1")
+                % (self.QEMU_BINARY, self.BRIDGE_PIDFILE, self.SSH_PORT,
+                   self.hosts[0].bridge_port, self.hosts[1].bridge_port), =
0)
+
+    def tearDown(self):
+        try:
+            pid =3D self.read_pidfile(self.BRIDGE_PIDFILE)
+            if pid and self.check_pid(pid):
+                os.kill(pid, signal.SIGKILL)
+        except Exception as e:
+            pass
+
+        for n in range(2):
+            try:
+                self.ra_stop(n)
+            except Exception as e:
+                pass
+
+        try:
+            self.ssh_close()
+        except Exception as e:
+            pass
+
+        for proc in self.traffic_procs:
+            try:
+                os.killpg(proc.pid, signal.SIGTERM)
+            except Exception as e:
+                pass
+
+        shutil.rmtree(self.TMPDIR)
+
+    def run_command(self, cmdline, expected_status, env=3DNone):
+        proc =3D subprocess.Popen(cmdline, shell=3DTrue, stdout=3Dsubproce=
ss.PIPE,
+                                stderr=3Dsubprocess.STDOUT,
+                                universal_newlines=3DTrue, env=3Denv)
+        stdout, stderr =3D proc.communicate()
+        if proc.returncode !=3D expected_status:
+            self.fail("command \"%s\" failed with code %s:\n%s"
+                           % (cmdline, proc.returncode, stdout))
+
+        return proc.returncode
+
+    def cat_line(self, path):
+        line=3D""
+        try:
+            fd =3D open(path, "r")
+            line =3D str.strip(fd.readline())
+            fd.close()
+        except:
+            pass
+        return line
+
+    def read_pidfile(self, pidfile):
+        try:
+            pid =3D int(self.cat_line(pidfile))
+        except ValueError:
+            return None
+        else:
+            return pid
+
+    def check_pid(self, pid):
+        try:
+            os.kill(pid, 0)
+        except OSError:
+            return False
+        else:
+            return True
+
+    def ssh_open(self):
+        self.ssh_conn =3D ssh.Session(self.GUEST_ADDRESS, self.SSH_PORT,
+                                    user=3D"test", password=3D"password")
+        self.ssh_conn.DEFAULT_OPTIONS +=3D (("UserKnownHostsFile", "/dev/n=
ull"),)
+        for i in range(10):
+            try:
+                if self.ssh_conn.connect():
+                    return
+            except Exception as e:
+                pass
+            time.sleep(4)
+        self.fail("sshd timeout")
+
+    def ssh_ping(self):
+        if self.ssh_conn.cmd("echo ping").stdout !=3D b"ping\n":
+            self.fail("ssh ping failed")
+
+    def ssh_close(self):
+        self.ssh_conn.quit()
+
+    def setup_base_env(self, host):
+        remotehost =3D (host +1) % 2
+        PATH =3D os.getenv("PATH", "")
+        env =3D { "PATH": "%s:%s" % (self.ADD_PATH, PATH),
+                "HA_LOGFILE": self.RA_LOG,
+                "OCF_RESOURCE_INSTANCE": "colo-test",
+                "OCF_RESKEY_CRM_meta_clone_max": "2",
+                "OCF_RESKEY_CRM_meta_notify": "true",
+                "OCF_RESKEY_CRM_meta_timeout": "30000",
+                "OCF_RESKEY_qemu_binary": self.QEMU_BINARY,
+                "OCF_RESKEY_qemu_img_binary": self.QEMU_IMG_BINARY,
+                "OCF_RESKEY_checkpoint_interval": "10000",
+                "OCF_RESKEY_base_port": str(self.BASE_PORT),
+                "OCF_RESKEY_debug": "2"}
+
+        env.update({"OCF_RESKEY_options":
+                        ("%s -qmp unix:%s,server,nowait"
+                         " -drive if=3Dnone,node-name=3Dparent0,file=3D'%s=
'")
+                        % (self.QEMU_OPTIONS, self.hosts[host].qmp_sock,
+                           self.hosts[host].image),
+                    "OCF_RESKEY_active_hidden_dir": self.hosts[host].tmpdi=
r,
+                    "OCF_RESKEY_listen_address": "127.0.0.%u" % (host +1),
+                    "OCF_RESKEY_log_dir": self.hosts[host].logdir,
+                    "OCF_RESKEY_CRM_meta_on_node": "127.0.0.%u" % (host +1=
),
+                    "HA_RSCTMP": self.hosts[host].tmpdir,
+                    "COLO_TEST_REMOTE_TMP": self.hosts[remotehost].tmpdir})
+
+        if self.BRIDGE_NAME:
+            env["OCF_RESKEY_options"] +=3D \
+                " -netdev bridge,id=3Dhn0,br=3D%s,helper=3D'%s'" \
+                % (self.BRIDGE_NAME, self.BRIDGE_HELPER)
+        else:
+            env["OCF_RESKEY_options"] +=3D \
+                " -netdev socket,id=3Dhn0,connect=3D127.0.0.1:%s" \
+                % self.hosts[host].bridge_port
+        return env
+
+    def ra_start(self, host):
+        env =3D self.setup_base_env(host)
+        self.run_command(self.RESOURCE_AGENT + " start", self.OCF_SUCCESS,=
 env)
+
+    def ra_stop(self, host):
+        env =3D self.setup_base_env(host)
+        self.run_command(self.RESOURCE_AGENT + " stop", self.OCF_SUCCESS, =
env)
+
+    def ra_monitor(self, host, expected_status):
+        env =3D self.setup_base_env(host)
+        self.run_command(self.RESOURCE_AGENT + " monitor", expected_status=
, env)
+
+    def ra_promote(self, host):
+        env =3D self.setup_base_env(host)
+        self.run_command(self.RESOURCE_AGENT + " promote", self.OCF_SUCCES=
S,env)
+
+    def ra_notify_start(self, host):
+        remotehost =3D (host +1) % 2
+        env =3D self.setup_base_env(host)
+
+        env.update({"OCF_RESKEY_CRM_meta_notify_type": "post",
+                    "OCF_RESKEY_CRM_meta_notify_operation": "start"})
+
+        env.update({"OCF_RESKEY_CRM_meta_notify_master_uname":
+                        "127.0.0.%u" % (host +1),
+                    "OCF_RESKEY_CRM_meta_notify_start_uname":
+                        "127.0.0.%u" % (remotehost +1)})
+
+        self.run_command(self.RESOURCE_AGENT + " notify", self.OCF_SUCCESS=
, env)
+
+    def ra_notify_stop(self, host):
+        remotehost =3D (host +1) % 2
+        env =3D self.setup_base_env(host)
+
+        env.update({"OCF_RESKEY_CRM_meta_notify_type": "pre",
+                    "OCF_RESKEY_CRM_meta_notify_operation": "stop"})
+
+        env.update({"OCF_RESKEY_CRM_meta_notify_master_uname":
+                        "127.0.0.%u" % (host +1),
+                    "OCF_RESKEY_CRM_meta_notify_stop_uname":
+                        "127.0.0.%u" % (remotehost +1)})
+
+        self.run_command(self.RESOURCE_AGENT + " notify", self.OCF_SUCCESS=
, env)
+
+    def get_pid(self, host):
+        return self.read_pidfile(self.hosts[host].pid_file)
+
+    def get_master_score(self, host):
+        return int(self.cat_line(self.hosts[host].master_score_file))
+
+    def kill_qemu_pre(self, host):
+        pid =3D self.get_pid(host)
+
+        if self.checkpoint_failover:
+            qmp_conn =3D QEMUMonitorProtocol(self.hosts[host].qmp_sock)
+            qmp_conn.settimeout(10)
+            qmp_conn.connect()
+            while True:
+                event =3D qmp_conn.pull_event(wait=3DTrue)
+                if event["event"] =3D=3D "STOP":
+                    break
+            qmp_conn.close()
+
+
+        if pid and self.check_pid(pid):
+            if self.hang_qemu:
+                os.kill(pid, signal.SIGSTOP)
+            else:
+                os.kill(pid, signal.SIGKILL)
+                while self.check_pid(pid):
+                    time.sleep(1)
+
+    def kill_qemu_post(self, host):
+        pid =3D self.get_pid(host)
+
+        if self.hang_qemu and pid and self.check_pid(pid):
+            os.kill(pid, signal.SIGKILL)
+            while self.check_pid(pid):
+                time.sleep(1)
+
+    def prepare_guest(self):
+        pass
+
+    def cycle_start(self, cycle):
+        pass
+
+    def active_section(self):
+        return False
+
+    def cycle_end(self, cycle):
+        pass
+
+    def check_connection(self):
+        self.ssh_ping()
+        for proc in self.traffic_procs:
+            if proc.poll() !=3D None:
+                self.fail("Traffic process died")
+
+    def _test_colo(self, loop=3D1):
+        loop =3D max(loop, 1)
+        self.log.info("Will put logs in %s" % self.outputdir)
+
+        for n in range(2):
+            self.ra_stop(n)
+
+        self.log.info("*** Startup ***")
+        for n in range(2):
+            self.ra_start(n)
+
+        for n in range(2):
+            self.ra_monitor(n, self.OCF_SUCCESS)
+
+        self.log.info("*** Promoting ***")
+        self.ra_promote(0)
+        cloudinit.wait_for_phone_home(("0.0.0.0", self.CLOUDINIT_HOME_PORT=
),
+                                      self.name)
+        self.ssh_open()
+        self.prepare_guest()
+
+        self.ra_notify_start(0)
+
+        while self.get_master_score(1) !=3D 100:
+            self.ra_monitor(0, self.OCF_RUNNING_MASTER)
+            self.ra_monitor(1, self.OCF_SUCCESS)
+            time.sleep(1)
+
+        self.log.info("*** Replication started ***")
+
+        self.check_connection()
+
+        primary =3D 0
+        secondary =3D 1
+
+        for n in range(loop):
+            self.cycle_start(n)
+            self.log.info("*** Secondary failover ***")
+            self.kill_qemu_pre(primary)
+            self.ra_notify_stop(secondary)
+            self.ra_monitor(secondary, self.OCF_SUCCESS)
+            self.ra_promote(secondary)
+            self.ra_monitor(secondary, self.OCF_RUNNING_MASTER)
+            self.kill_qemu_post(primary)
+
+            self.check_connection()
+
+            tmp =3D primary
+            primary =3D secondary
+            secondary =3D tmp
+
+            self.log.info("*** Secondary continue replication ***")
+            self.ra_start(secondary)
+            self.ra_notify_start(primary)
+
+            self.check_connection()
+
+            # Wait for resync
+            while self.get_master_score(secondary) !=3D 100:
+                self.ra_monitor(primary, self.OCF_RUNNING_MASTER)
+                self.ra_monitor(secondary, self.OCF_SUCCESS)
+                time.sleep(1)
+
+            self.log.info("*** Replication started ***")
+
+            self.check_connection()
+
+            if self.active_section():
+                break
+
+            self.log.info("*** Primary failover ***")
+            self.kill_qemu_pre(secondary)
+            self.ra_monitor(primary, self.OCF_RUNNING_MASTER)
+            self.ra_notify_stop(primary)
+            self.ra_monitor(primary, self.OCF_RUNNING_MASTER)
+            self.kill_qemu_post(secondary)
+
+            self.check_connection()
+
+            self.log.info("*** Primary continue replication ***")
+            self.ra_start(secondary)
+            self.ra_notify_start(primary)
+
+            self.check_connection()
+
+            # Wait for resync
+            while self.get_master_score(secondary) !=3D 100:
+                self.ra_monitor(primary, self.OCF_RUNNING_MASTER)
+                self.ra_monitor(secondary, self.OCF_SUCCESS)
+                time.sleep(1)
+
+            self.log.info("*** Replication started ***")
+
+            self.check_connection()
+
+            self.cycle_end(n)
+
+        self.ssh_close()
+
+        for n in range(2):
+            self.ra_stop(n)
+
+        for n in range(2):
+            self.ra_monitor(n, self.OCF_NOT_RUNNING)
+        self.log.info("*** all ok ***")
+
+
+class ColoQuickTest(ColoTest):
+    """
+    :avocado: tags=3Dcolo
+    :avocado: tags=3Dquick
+    :avocado: tags=3Darch:x86_64
+    """
+
+    timeout =3D 300
+
+    def cycle_end(self, cycle):
+        self.log.info("Testing with peer qemu hanging"
+                      " and failover during checkpoint")
+        self.hang_qemu =3D True
+
+    def test_quick(self):
+        self.checkpoint_failover =3D True
+        self.log.info("Testing with peer qemu crashing"
+                      " and failover during checkpoint")
+        self._test_colo(loop=3D2)
+
+
+class ColoNetworkTest(ColoTest):
+
+    def prepare_guest(self):
+        install_cmd =3D self.params.get("install_cmd", default=3D
+                                "sudo -n dnf -q -y install iperf3 memteste=
r")
+        self.ssh_conn.cmd(install_cmd)
+        # Use two instances to work around a bug in iperf3
+        self.ssh_conn.cmd("iperf3 -sD; iperf3 -sD -p 5202")
+
+    def _cycle_start(self, cycle):
+        pass
+
+    def cycle_start(self, cycle):
+        self._cycle_start(cycle)
+        tests =3D [("", "client-to-server tcp"), ("-R", "server-to-client =
tcp")]
+
+        self.log.info("Testing iperf %s" % tests[cycle % 2][1])
+        iperf_cmd =3D "iperf3 %s -t 60 -i 60 --connect-timeout 30000 -c %s=
" \
+                        % (tests[cycle % 2][0], self.GUEST_ADDRESS)
+        proc =3D subprocess.Popen("while %s && %s; do sleep 1; done >>'%s'=
 2>&1"
+                    % (iperf_cmd, iperf_cmd + " -p 5202",
+                    os.path.join(self.outputdir, "iperf.log")),
+                    shell=3DTrue, preexec_fn=3Dos.setsid, stdin=3Dsubproce=
ss.DEVNULL,
+                    stdout=3Dsubprocess.DEVNULL, stderr=3Dsubprocess.DEVNU=
LL)
+        self.traffic_procs.append(proc)
+        time.sleep(5) # Wait for iperf to get up to speed
+
+    def cycle_end(self, cycle):
+        for proc in self.traffic_procs:
+            try:
+                os.killpg(proc.pid, signal.SIGTERM)
+                proc.wait()
+            except Exception as e:
+                pass
+        self.traffic_procs.clear()
+        time.sleep(20)
+
+class ColoRealNetworkTest(ColoNetworkTest):
+    """
+    :avocado: tags=3Dcolo
+    :avocado: tags=3Dslow
+    :avocado: tags=3Dnetwork_test
+    :avocado: tags=3Darch:x86_64
+    """
+
+    timeout =3D 900
+
+    def active_section(self):
+        time.sleep(300)
+        return False
+
+    @skipUnless(iperf3_available(), "iperf3 not available")
+    def test_network(self):
+        if not self.BRIDGE_NAME:
+            self.cancel("bridge options not given, will skip network test")
+        self.log.info("Testing with peer qemu crashing and network load")
+        self._test_colo(loop=3D2)
+
+class ColoStressTest(ColoNetworkTest):
+    """
+    :avocado: tags=3Dcolo
+    :avocado: tags=3Dslow
+    :avocado: tags=3Dstress_test
+    :avocado: tags=3Darch:x86_64
+    """
+
+    timeout =3D 1800
+
+    def _cycle_start(self, cycle):
+        if cycle =3D=3D 4:
+            self.log.info("Stresstest with peer qemu hanging, network load"
+                          " and failover during checkpoint")
+            self.checkpoint_failover =3D True
+            self.hang_qemu =3D True
+        elif cycle =3D=3D 8:
+            self.log.info("Stresstest with peer qemu crashing and network =
load")
+            self.checkpoint_failover =3D False
+            self.hang_qemu =3D False
+        elif cycle =3D=3D 12:
+            self.log.info("Stresstest with peer qemu hanging and network l=
oad")
+            self.checkpoint_failover =3D False
+            self.hang_qemu =3D True
+
+    @skipUnless(iperf3_available(), "iperf3 not available")
+    def test_stress(self):
+        if not self.BRIDGE_NAME:
+            self.cancel("bridge options not given, will skip network test")
+        self.log.info("Stresstest with peer qemu crashing, network load"
+                      " and failover during checkpoint")
+        self.checkpoint_failover =3D True
+        self._test_colo(loop=3D16)
--
2.30.0


--Sig_/ut9NRGkDh/v/VkwablR6gp5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAgDXQACgkQNasLKJxd
slhfLA/+Puu1g0g+RoqxCCvdlt+Q1CmSZuEf8A4HOBLZDss9HH4FvvkMlSeX4Jex
3QGdXr6vvjd+uha6fLkw54zMbxHPIIwjJO8DkmsHJ+kACADwwmPiXtmOmjuqJPS2
hqo3896zXlHG3lTFCmpGi5092yxXdyWZW2yTMY2Jp6+Yqczce+dXGWegOxZ0Y36x
JPisYo61z2d9zDHSKItNgJRjRBB2hcYfhHc9xh5oFya8LXAqvyqA8FyziHs8x292
CDonP9rDqe39yZdMxDHELD/Z5Ij2V6CjhMmaWElLxE99m0yLopWEvl+CJ8gNnEde
a+Rxb3IZPjimL8uuPfjlLyUAbGZ3TK/OH5Xkde5Q2Kp6njBuWtiZV6+2MzFc2A1t
QPN6toFS/0+kGDOD1mO3TtewAc9pat1it9Y6YyxnJnyPeR/mhrVIBBcSXkQ51QHm
28llzLnaQCDiqqGg2uiuwd/jUn1g7oExpBwY1wMU+xu0Q3CcCpiyVNKBQxe0U2W/
arw0zhtG0rVsfWA+n+vu62qYfvF+e/EG8Qin1L9bUoRoVgYLEbd8yx3JyE5uKaWP
8QHCaJ3txCkLGWGl5YQxLN5+GvyOORBAZKgWti12ljKp0FbkR4f1UCHsUfuSId7A
irj7RKajJfDnM/5MBOxFDSlKTkahj8XjuBTH8ZsHad9dx4w1ww0=
=Va5x
-----END PGP SIGNATURE-----

--Sig_/ut9NRGkDh/v/VkwablR6gp5--


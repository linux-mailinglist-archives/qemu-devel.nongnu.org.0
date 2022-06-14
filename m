Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CD54A3E8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:55:14 +0200 (CEST)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vlx-0005F7-8I
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vho-0006nY-RP
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhl-0006P3-6Z
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655171452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wc1p5McrO0EkOOaR+59PgD/lpAVFzJuFX+2B9DTO/AQ=;
 b=NHxswxnHi/F68uSGJoWQ4iCXfdo3yWUK74kB4l63IhoyMyN+mH9SKk7/MTKyOMu9l1JkL/
 EO7qUH1FWJPM9P24ISPKVLOQ6urI8EjitJQJuLe7ZudISe1IpVwaFZtSsTCvOe4HRx0eLI
 uC3BcZFmejrpkJrylDZumFrA2w5ixjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-FeyvAI0SMRigxNjcZ2Clhg-1; Mon, 13 Jun 2022 21:50:48 -0400
X-MC-Unique: FeyvAI0SMRigxNjcZ2Clhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4570A101A54E;
 Tue, 14 Jun 2022 01:50:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8832026D07;
 Tue, 14 Jun 2022 01:50:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 5/5] tests/vm: switch centos.aarch64 to CentOS 8 Stream
Date: Mon, 13 Jun 2022 21:50:44 -0400
Message-Id: <20220614015044.2501806-6-jsnow@redhat.com>
In-Reply-To: <20220614015044.2501806-1-jsnow@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URI_DOTEDU=1.246 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch this test over to using a cloud image like the base CentOS8 VM
test, which helps make this script a bit simpler too.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/centos.aarch64 | 174 ++++++----------------------------------
 1 file changed, 26 insertions(+), 148 deletions(-)

diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index 96c450f8be5..022bf17f7bb 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -20,150 +20,42 @@ import time
 import traceback
 import aarch64vm
 
+
 DEFAULT_CONFIG = {
     'cpu'          : "max",
     'machine'      : "virt,gic-version=max",
-    'install_cmds' : "yum install -y make ninja-build git python3 gcc gcc-c++ flex bison, "\
-        "yum install -y glib2-devel perl pixman-devel zlib-devel, "\
-        "alternatives --set python /usr/bin/python3, "\
-        "sudo dnf config-manager "\
-        "--add-repo=https://download.docker.com/linux/centos/docker-ce.repo,"\
-        "sudo dnf install --nobest -y docker-ce.aarch64,"\
-        "systemctl enable docker",
+    'install_cmds' : (
+        "dnf config-manager --set-enabled powertools, "
+        "dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo, "
+        "dnf install -y make ninja-build git python38 gcc gcc-c++ flex bison "\
+            "glib2-devel perl pixman-devel zlib-devel docker-ce.aarch64, "
+        "systemctl enable docker, "
+    ),
+    # "--nobest" for dnf install of docker
+    # "alternatives --set python /usr/bin/python3, "
     # We increase beyond the default time since during boot
     # it can take some time (many seconds) to log into the VM.
     'ssh_timeout'  : 60,
 }
 
+
 class CentosAarch64VM(basevm.BaseVM):
-    name = "centos.aarch64"
+    name = "centos8s.aarch64"
     arch = "aarch64"
     login_prompt = "localhost login:"
     prompt = '[root@localhost ~]#'
-    image_name = "CentOS-8-aarch64-1905-dvd1.iso"
-    image_link = "http://mirrors.usc.edu/pub/linux/distributions/centos/8.0.1905/isos/aarch64/"
+    image_name = "CentOS-Stream-GenericCloud-8-20220125.1.aarch64.qcow2"
+    image_link = "https://cloud.centos.org/centos/8-stream/aarch64/images/"
     image_link += image_name
     BUILD_SCRIPT = """
         set -e;
         cd $(mktemp -d);
-        sudo chmod a+r /dev/vdb;
-        tar --checkpoint=.10 -xf /dev/vdb;
+        export SRC_ARCHIVE=/dev/vdb;
+        sudo chmod a+r $SRC_ARCHIVE;
+        tar -xf $SRC_ARCHIVE;
         ./configure {configure_opts};
         make --output-sync {target} -j{jobs} {verbose};
     """
-    def set_key_perm(self):
-        """Set permissions properly on certain files to allow
-           ssh access."""
-        self.console_wait_send(self.prompt,
-                               "/usr/sbin/restorecon -R -v /root/.ssh\n")
-        self.console_wait_send(self.prompt,
-                "/usr/sbin/restorecon -R -v "\
-                "/home/{}/.ssh\n".format(self._config["guest_user"]))
-
-    def create_kickstart(self):
-        """Generate the kickstart file used to generate the centos image."""
-        # Start with the template for the kickstart.
-        ks_file = self._source_path + "/tests/vm/centos-8-aarch64.ks"
-        subprocess.check_call("cp {} ./ks.cfg".format(ks_file), shell=True)
-        # Append the ssh keys to the kickstart file
-        # as the post processing phase of installation.
-        with open("ks.cfg", "a") as f:
-            # Add in the root pw and guest user.
-            rootpw = "rootpw --plaintext {}\n"
-            f.write(rootpw.format(self._config["root_pass"]))
-            add_user = "user --groups=wheel --name={} "\
-                       "--password={} --plaintext\n"
-            f.write(add_user.format(self._config["guest_user"],
-                                    self._config["guest_pass"]))
-            # Add the ssh keys.
-            f.write("%post --log=/root/ks-post.log\n")
-            f.write("mkdir -p /root/.ssh\n")
-            addkey = 'echo "{}" >> /root/.ssh/authorized_keys\n'
-            addkey_cmd = addkey.format(self._config["ssh_pub_key"])
-            f.write(addkey_cmd)
-            f.write('mkdir -p /home/{}/.ssh\n'.format(self._config["guest_user"]))
-            addkey = 'echo "{}" >> /home/{}/.ssh/authorized_keys\n'
-            addkey_cmd = addkey.format(self._config["ssh_pub_key"],
-                                       self._config["guest_user"])
-            f.write(addkey_cmd)
-            f.write("%end\n")
-        # Take our kickstart file and create an .iso from it.
-        # The .iso will be provided to qemu as we boot
-        # from the install dvd.
-        # Anaconda will recognize the label "OEMDRV" and will
-        # start the automated installation.
-        gen_iso_img = 'genisoimage -output ks.iso -volid "OEMDRV" ks.cfg'
-        subprocess.check_call(gen_iso_img, shell=True)
-
-    def wait_for_shutdown(self):
-        """We wait for qemu to shutdown the VM and exit.
-           While this happens we display the console view
-           for easier debugging."""
-        # The image creation is essentially done,
-        # so whether or not the wait is successful we want to
-        # wait for qemu to exit (the self.wait()) before we return.
-        try:
-            self.console_wait("reboot: Power down")
-        except Exception as e:
-            sys.stderr.write("Exception hit\n")
-            if isinstance(e, SystemExit) and e.code == 0:
-                return 0
-            traceback.print_exc()
-        finally:
-            self.wait()
-
-    def build_base_image(self, dest_img):
-        """Run through the centos installer to create
-           a base image with name dest_img."""
-        # We create the temp image, and only rename
-        # to destination when we are done.
-        img = dest_img + ".tmp"
-        # Create an empty image.
-        # We will provide this as the install destination.
-        qemu_img_create = "qemu-img create {} 50G".format(img)
-        subprocess.check_call(qemu_img_create, shell=True)
-
-        # Create our kickstart file to be fed to the installer.
-        self.create_kickstart()
-        # Boot the install dvd with the params as our ks.iso
-        os_img = self._download_with_cache(self.image_link)
-        dvd_iso = "centos-8-dvd.iso"
-        subprocess.check_call(["cp", "-f", os_img, dvd_iso])
-        extra_args = "-cdrom ks.iso"
-        extra_args += " -drive file={},if=none,id=drive1,cache=writeback"
-        extra_args += " -device virtio-blk,drive=drive1,bootindex=1"
-        extra_args = extra_args.format(dvd_iso).split(" ")
-        self.boot(img, extra_args=extra_args)
-        self.console_wait_send("change the selection", "\n")
-        # We seem to need to hit esc (chr(27)) twice to abort the
-        # media check, which takes a long time.
-        # Waiting a bit seems to be more reliable before hitting esc.
-        self.console_wait("Checking")
-        time.sleep(5)
-        self.console_wait_send("Checking", chr(27))
-        time.sleep(5)
-        self.console_wait_send("Checking", chr(27))
-        print("Found Checking")
-        # Give sufficient time for the installer to create the image.
-        self.console_init(timeout=7200)
-        self.wait_for_shutdown()
-        os.rename(img, dest_img)
-        print("Done with base image build: {}".format(dest_img))
-
-    def check_create_base_img(self, img_base, img_dest):
-        """Create a base image using the installer.
-           We will use the base image if it exists.
-           This helps cut down on install time in case we
-           need to restart image creation,
-           since the base image creation can take a long time."""
-        if not os.path.exists(img_base):
-            print("Generate new base image: {}".format(img_base))
-            self.build_base_image(img_base);
-        else:
-            print("Use existing base image: {}".format(img_base))
-        # Save a copy of the base image and copy it to dest.
-        # which we will use going forward.
-        subprocess.check_call(["cp", img_base, img_dest])
 
     def boot(self, img, extra_args=None):
         aarch64vm.create_flash_images(self._tmpdir, self._efi_aarch64)
@@ -185,42 +77,28 @@ class CentosAarch64VM(basevm.BaseVM):
         super(CentosAarch64VM, self).boot(img, extra_args=extra_args)
 
     def build_image(self, img):
+        cimg = self._download_with_cache(self.image_link)
         img_tmp = img + ".tmp"
-        self.check_create_base_img(img + ".base", img_tmp)
-
-        # Boot the new image for the first time to finish installation.
-        self.boot(img_tmp)
-        self.console_init()
-        self.console_wait_send(self.login_prompt, "root\n")
-        self.console_wait_send("Password:",
-                               "{}\n".format(self._config["root_pass"]))
-
-        self.set_key_perm()
-        self.console_wait_send(self.prompt, "rpm -q centos-release\n")
-        enable_adapter = "sed -i 's/ONBOOT=no/ONBOOT=yes/g'" \
-                         " /etc/sysconfig/network-scripts/ifcfg-enp0s1\n"
-        self.console_wait_send(self.prompt, enable_adapter)
-        self.console_wait_send(self.prompt, "ifup enp0s1\n")
-        self.console_wait_send(self.prompt,
-                               'echo "qemu  ALL=(ALL) NOPASSWD:ALL" | '\
-                               'sudo tee /etc/sudoers.d/qemu\n')
-        self.console_wait(self.prompt)
-
-        # Rest of the commands we issue through ssh.
+        subprocess.run(['cp', '-f', cimg, img_tmp])
+        self.exec_qemu_img("resize", img_tmp, "50G")
+        self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
         self.wait_ssh(wait_root=True)
+        self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
 
         # If the user chooses *not* to do the second phase,
         # then we will jump right to the graceful shutdown
         if self._config['install_cmds'] != "":
             install_cmds = self._config['install_cmds'].split(',')
             for cmd in install_cmds:
-                self.ssh_root(cmd)
+                self.ssh_root_check(cmd)
+
         self.ssh_root("poweroff")
-        self.wait_for_shutdown()
+        self.wait()
         os.rename(img_tmp, img)
         print("image creation complete: {}".format(img))
         return 0
 
+
 if __name__ == "__main__":
     defaults = aarch64vm.get_config_defaults(CentosAarch64VM, DEFAULT_CONFIG)
     sys.exit(basevm.main(CentosAarch64VM, defaults))
-- 
2.34.3



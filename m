Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F817628A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:24:27 +0100 (CET)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8pju-0002Wl-7V
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pfE-0002Y4-0Y
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pfC-0001D8-1H
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j8pfB-00019z-QY
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v4so960035wrs.8
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NkwU9mGQ3UXDblL8+agKWJfAotwiWnzLlTiheha46Qg=;
 b=cgYGwxUDDOlaLwK7L/lNp0RCQHf954KKY2n7ByHYHf3cLfTPLn3TTrLvMWk6oBwaZa
 AMFNt9R4dgviERnJGg1ZG7ftMomg9m/36ifzY13dq6yGQnzRsMYGXmLhTOTfA55WGguR
 s5pqzgP+suuvTcGPt7taRCA8OZtGd7fmmvg8ZqJ4qyKXbcFVw0eyqzTgfvpEDrX3okGd
 4Gv037Ski6l7MqgLPNFtwRle2aKQj4mnDu/mDP4YmYbzKJdm+OZ8YQg6A5CkFlaIuQCz
 Z2eR5Sn4fBNfa3gibb4MVN9javMHeJJzdkkiOUm7Zha+8yqLIOrr0QQbIiRtUoeQMJcs
 gTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NkwU9mGQ3UXDblL8+agKWJfAotwiWnzLlTiheha46Qg=;
 b=WXC3vJWLEKy4e6v7OIzs4P/a8NcTxFtsmr838Y0vIQTT5zDA5S41Uc4111ACvYUcIh
 yR41Xj82KHRge+OnVOcuNxyx+Z2Q4Pgq70w8SQth1faYzQblOs9S/3zW1PilteUaaHuU
 56ZCtOMJgbBIRMpQyPfkwfJvR5qYbA80YU6hNKVncFi4tjlhu6gKvgL9Z139qc2FONcb
 XsqxEnAhHBlSWSLm4l7gbJskrXl3HZ7nOP6ayaqlID/ZKnpYe5BJ45yUOt6k1FoxQwqA
 FeKBviJDhPm0FwYqngXnjkPtCjRI/xiD/ik4RiNVMCYf+39whPW0laAJxxAi6dvUTFRH
 PJ5Q==
X-Gm-Message-State: ANhLgQ2/vL7SBFG2MPDUX638GUM71nDdp8tesGDqg/38n629ruagR8tZ
 MyVrVG9dZJFDw/SLiYr4muzIcg==
X-Google-Smtp-Source: ADFU+vvzdZq17W06SLvam3jLAjqBV6Y8FZHdkcQwvgl4WQPS36f5cpz826ztk+407wDw9svnB+jMPQ==
X-Received: by 2002:adf:b601:: with SMTP id f1mr862408wre.103.1583173155707;
 Mon, 02 Mar 2020 10:19:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k7sm300866wmi.19.2020.03.02.10.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:19:10 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F35A61FF92;
 Mon,  2 Mar 2020 18:19:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/10] tests/vm: Added gen_cloud_init_iso() to basevm.py
Date: Mon,  2 Mar 2020 18:19:02 +0000
Message-Id: <20200302181907.32110-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302181907.32110-1-alex.bennee@linaro.org>
References: <20200302181907.32110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
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
Cc: Fam Zheng <fam@euphon.net>, Peter Puhov <peter.puhov@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

This method was located in both centos and ubuntu.i386.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200219163537.22098-6-robert.foley@linaro.org>
---
 tests/vm/basevm.py   | 40 ++++++++++++++++++++++++++++++++++++++++
 tests/vm/centos      | 33 +--------------------------------
 tests/vm/ubuntu.i386 | 37 +------------------------------------
 3 files changed, 42 insertions(+), 68 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 7f268922685..8400b0e07f6 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -345,6 +345,46 @@ class BaseVM(object):
     def qmp(self, *args, **kwargs):
         return self._guest.qmp(*args, **kwargs)
 
+    def gen_cloud_init_iso(self):
+        cidir = self._tmpdir
+        mdata = open(os.path.join(cidir, "meta-data"), "w")
+        name = self.name.replace(".","-")
+        mdata.writelines(["instance-id: {}-vm-0\n".format(name),
+                          "local-hostname: {}-guest\n".format(name)])
+        mdata.close()
+        udata = open(os.path.join(cidir, "user-data"), "w")
+        print("guest user:pw {}:{}".format(self._config['guest_user'],
+                                           self._config['guest_pass']))
+        udata.writelines(["#cloud-config\n",
+                          "chpasswd:\n",
+                          "  list: |\n",
+                          "    root:%s\n" % self._config['root_pass'],
+                          "    %s:%s\n" % (self._config['guest_user'],
+                                           self._config['guest_pass']),
+                          "  expire: False\n",
+                          "users:\n",
+                          "  - name: %s\n" % self._config['guest_user'],
+                          "    sudo: ALL=(ALL) NOPASSWD:ALL\n",
+                          "    ssh-authorized-keys:\n",
+                          "    - %s\n" % self._config['ssh_pub_key'],
+                          "  - name: root\n",
+                          "    ssh-authorized-keys:\n",
+                          "    - %s\n" % self._config['ssh_pub_key'],
+                          "locale: en_US.UTF-8\n"])
+        proxy = os.environ.get("http_proxy")
+        if not proxy is None:
+            udata.writelines(["apt:\n",
+                              "  proxy: %s" % proxy])
+        udata.close()
+        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso",
+                               "-volid", "cidata", "-joliet", "-rock",
+                               "user-data", "meta-data"],
+                               cwd=cidir,
+                               stdin=self._devnull, stdout=self._stdout,
+                               stderr=self._stdout)
+
+        return os.path.join(cidir, "cloud-init.iso")
+
 def parse_args(vmcls):
 
     def get_default_jobs():
diff --git a/tests/vm/centos b/tests/vm/centos
index a41ff109eb5..0ad4ecf4190 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -31,37 +31,6 @@ class CentosVM(basevm.BaseVM):
         make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
     """
 
-    def _gen_cloud_init_iso(self):
-        cidir = self._tmpdir
-        mdata = open(os.path.join(cidir, "meta-data"), "w")
-        mdata.writelines(["instance-id: centos-vm-0\n",
-                          "local-hostname: centos-guest\n"])
-        mdata.close()
-        udata = open(os.path.join(cidir, "user-data"), "w")
-        udata.writelines(["#cloud-config\n",
-                          "chpasswd:\n",
-                          "  list: |\n",
-                          "    root:%s\n" % self.ROOT_PASS,
-                          "    %s:%s\n" % (self.GUEST_USER, self.GUEST_PASS),
-                          "  expire: False\n",
-                          "users:\n",
-                          "  - name: %s\n" % self.GUEST_USER,
-                          "    sudo: ALL=(ALL) NOPASSWD:ALL\n",
-                          "    ssh-authorized-keys:\n",
-                          "    - %s\n" % basevm.SSH_PUB_KEY,
-                          "  - name: root\n",
-                          "    ssh-authorized-keys:\n",
-                          "    - %s\n" % basevm.SSH_PUB_KEY,
-                          "locale: en_US.UTF-8\n"])
-        udata.close()
-        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso",
-                               "-volid", "cidata", "-joliet", "-rock",
-                               "user-data", "meta-data"],
-                               cwd=cidir,
-                               stdin=self._devnull, stdout=self._stdout,
-                               stderr=self._stdout)
-        return os.path.join(cidir, "cloud-init.iso")
-
     def build_image(self, img):
         cimg = self._download_with_cache("https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1802.qcow2.xz")
         img_tmp = img + ".tmp"
@@ -69,7 +38,7 @@ class CentosVM(basevm.BaseVM):
         subprocess.check_call(["ln", "-f", cimg, img_tmp + ".xz"])
         subprocess.check_call(["xz", "--keep", "-dvf", img_tmp + ".xz"])
         self.exec_qemu_img("resize", img_tmp, "50G")
-        self.boot(img_tmp, extra_args = ["-cdrom", self._gen_cloud_init_iso()])
+        self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
         self.wait_ssh()
         self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
         self.ssh_root_check("yum update -y")
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 48e9cb1ad3d..3266038fbde 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -29,41 +29,6 @@ class UbuntuX86VM(basevm.BaseVM):
         make --output-sync {target} -j{jobs} {verbose};
     """
 
-    def _gen_cloud_init_iso(self):
-        cidir = self._tmpdir
-        mdata = open(os.path.join(cidir, "meta-data"), "w")
-        mdata.writelines(["instance-id: ubuntu-vm-0\n",
-                          "local-hostname: ubuntu-guest\n"])
-        mdata.close()
-        udata = open(os.path.join(cidir, "user-data"), "w")
-        udata.writelines(["#cloud-config\n",
-                          "chpasswd:\n",
-                          "  list: |\n",
-                          "    root:%s\n" % self.ROOT_PASS,
-                          "    %s:%s\n" % (self.GUEST_USER, self.GUEST_PASS),
-                          "  expire: False\n",
-                          "users:\n",
-                          "  - name: %s\n" % self.GUEST_USER,
-                          "    sudo: ALL=(ALL) NOPASSWD:ALL\n",
-                          "    ssh-authorized-keys:\n",
-                          "    - %s\n" % basevm.SSH_PUB_KEY,
-                          "  - name: root\n",
-                          "    ssh-authorized-keys:\n",
-                          "    - %s\n" % basevm.SSH_PUB_KEY,
-                          "locale: en_US.UTF-8\n"])
-        proxy = os.environ.get("http_proxy")
-        if not proxy is None:
-            udata.writelines(["apt:\n",
-                              "  proxy: %s" % proxy])
-        udata.close()
-        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso",
-                               "-volid", "cidata", "-joliet", "-rock",
-                               "user-data", "meta-data"],
-                               cwd=cidir,
-                               stdin=self._devnull, stdout=self._stdout,
-                               stderr=self._stdout)
-        return os.path.join(cidir, "cloud-init.iso")
-
     def build_image(self, img):
         cimg = self._download_with_cache(
             "https://cloud-images.ubuntu.com/releases/bionic/release-20191114/ubuntu-18.04-server-cloudimg-i386.img",
@@ -71,7 +36,7 @@ class UbuntuX86VM(basevm.BaseVM):
         img_tmp = img + ".tmp"
         subprocess.check_call(["cp", "-f", cimg, img_tmp])
         self.exec_qemu_img("resize", img_tmp, "50G")
-        self.boot(img_tmp, extra_args = ["-cdrom", self._gen_cloud_init_iso()])
+        self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
         self.wait_ssh()
         self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
         self.ssh_root_check("apt-get update")
-- 
2.20.1



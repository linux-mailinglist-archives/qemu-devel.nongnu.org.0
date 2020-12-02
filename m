Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E742CC93C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 22:59:42 +0100 (CET)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkaA0-0002nE-Ol
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 16:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kka8R-0001nz-S7
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 16:58:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kka8O-0002is-HT
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 16:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606946279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nleAs/yUGmBnMZlJr4lctlr9MERhHDmJc9bB1JR6IOY=;
 b=ZDkVomfVaI4Mnx+31b8pkBSt34AmAKW0E/TrY6/GnixGd4dmwM0/tUsxoBtbT/OiHg8nHk
 cOOSVuEnG+osUFXUdrhMC0MKCdGsat3DfxayTDoE/j953mOM+AelkunMNcT9LPOz+MXNyI
 daMq8Gt0VgGjRzBGLlHPiknU0rHRPc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-siJ3XRZBNH6Z8vTc-ZnF5w-1; Wed, 02 Dec 2020 16:57:56 -0500
X-MC-Unique: siJ3XRZBNH6Z8vTc-ZnF5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDEB01084423;
 Wed,  2 Dec 2020 21:57:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B13FC5C1B4;
 Wed,  2 Dec 2020 21:57:53 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
Date: Wed,  2 Dec 2020 16:57:47 -0500
Message-Id: <20201202215747.2719507-2-crosa@redhat.com>
In-Reply-To: <20201202215747.2719507-1-crosa@redhat.com>
References: <20201202215747.2719507-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently in use Fedora 31 has been moved out of the standard download
locations that are supported by the functionality provided by
avocado.utils.vmimage.  So right now, the boot_linux.py tests will get
canceled by not being able to find those specific images.

Ideally, this would be bumped to version 33.  But, I've found issues
with the aarch64 images, with various systemd services failing to
start.  So to keep all archs consistent, I've settled on 32.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 1da4a53d6a..0824de008e 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -42,13 +42,13 @@ class BootLinuxBase(Test):
         vmimage.QEMU_IMG = qemu_img
 
         self.log.info('Downloading/preparing boot image')
-        # Fedora 31 only provides ppc64le images
+        # Fedora 32 only provides ppc64le images
         image_arch = self.arch
         if image_arch == 'ppc64':
             image_arch = 'ppc64le'
         try:
             boot = vmimage.get(
-                'fedora', arch=image_arch, version='31',
+                'fedora', arch=image_arch, version='32',
                 checksum=self.chksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
@@ -111,7 +111,7 @@ class BootLinuxX8664(BootLinux):
     :avocado: tags=arch:x86_64
     """
 
-    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
+    chksum = '423a4ce32fa32c50c11e3d3ff392db97a762533b81bef9d00599de518a7469c8'
 
     def test_pc_i440fx_tcg(self):
         """
@@ -161,7 +161,7 @@ class BootLinuxAarch64(BootLinux):
     :avocado: tags=machine:gic-version=2
     """
 
-    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
+    chksum = 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967'
 
     def add_common_args(self):
         self.vm.add_args('-bios',
@@ -217,7 +217,7 @@ class BootLinuxPPC64(BootLinux):
     :avocado: tags=arch:ppc64
     """
 
-    chksum = '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'
+    chksum = 'dd989a078d641713c55720ba3e4320b204ade6954e2bfe4570c8058dc36e2e5d'
 
     def test_pseries_tcg(self):
         """
@@ -235,7 +235,7 @@ class BootLinuxS390X(BootLinux):
     :avocado: tags=arch:s390x
     """
 
-    chksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
+    chksum = '93e49b98fa016797a6864a95cbb7beaec86ffd61dbcd42a951158ae732dae1ec'
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
-- 
2.25.4



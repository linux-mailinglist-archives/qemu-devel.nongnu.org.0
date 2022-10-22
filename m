Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743E609966
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omibv-0004Ak-VK
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1omHui-0007ve-8p
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 13:04:00 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1omHug-0002Pz-8X
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 13:04:00 -0400
Received: by mail-oi1-x236.google.com with SMTP id g130so6595001oia.13
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g78qBcPXbaG4JbTKy3OkH49y1ulAP5teBr5pvmwrD4M=;
 b=O3dbouZk2GwD9QTIcnjwwMIfV6mGDj9xzwr8k41XYNDxYFuBPIKbeeMW5kEGdUN/1b
 ZTnLCmPjJpU280Q2tu7IlFFbYjoaqMqWnwilJJI+PI3vgHtReAtqYIX7k85BAIPM1yd1
 RsI9I3uOG92UKmnpUqFca01ES5FcibsjcbgyY5TxUpaj8LmCsGG24aejoaEDfMlbP/j2
 Wqq6tUGH3KhYNdHqEXusoDCTTzDPyE5uVvJc4XwRWETX9utDPgOYkd7a1k+MeX0GotEq
 rfbI2Al34R1Un/MhnUl00m+vNJNiuD4rC7FvbzPvFgG5Z5uFAjuHGJRzP8peg07fQUW+
 FuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g78qBcPXbaG4JbTKy3OkH49y1ulAP5teBr5pvmwrD4M=;
 b=4rWICq1KUIePIRMvFbnm/Sn2W+Jgo8DWN6SYl58txjBwEqzq5Gx377i+JPNLR/+fzr
 KzC0wqSh933qQV6eruEbS8nL/2WCHlMMOjN+2kr3gE7qP0lI0iJ6Oow6Ux4b26AFRKK8
 RG6EtqKnOTD96sp2A+LyjfT+McJBrDz1Dy+ikO89u8Vz+/ogijyD/0fV/x60Qid+6ojj
 eYd3l1Rj0F4EHZT1s4JGdrHGuKW+rcm4G/7r38bWPkuZF8759fQP0iJ3scuPLbd/ER3S
 KcoXck1L/qlbroaUtBVWsRPBQupfFe51St5r0zvMJgG4Kebq6EfimoloD/lRfxQm6dXD
 RBQQ==
X-Gm-Message-State: ACrzQf0c0WEjTYBDpCRZeheekqfJFgj1BsLk715haMIvZy86yfBTC1ay
 HHJgOsYeRmLgD1kUDQwDFYXHoXbEHKM=
X-Google-Smtp-Source: AMsMyM4Nrf3SdJBZA7O1KfI/5xt3R5ArPlLepZ1xD2n8JumktbGOqBSAabimA2FYgILVqdFGMUGZQA==
X-Received: by 2002:a05:6808:120f:b0:351:98b4:a86f with SMTP id
 a15-20020a056808120f00b0035198b4a86fmr26770199oil.189.1666458235991; 
 Sat, 22 Oct 2022 10:03:55 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a056830141800b006618f1fbb84sm2426722otp.80.2022.10.22.10.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 10:03:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
Date: Sat, 22 Oct 2022 14:03:50 -0300
Message-Id: <20221022170350.936685-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

'make check-avocado' will download any images that aren't present in the
cache via 'get-vm-images' in tests/Makefile.include. The target that
downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
download the image for each arch. Note that this command does not
support any argument to set the hash algorithm used and, based on the
avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
sha1 hash is stored in a Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
in the cache.

Back in QEMU, the LinuxDistro class defines the images it is going to
use in the KNOWN_DISTROS attribute. All images have the 'checksum'
attribute, defined using sha256, that will make avocado check if it has
the right asset in the cache. So this means that we're downloading a
sha1 image during check-avocado, then trying to fetch it using a sha256
hash.

This doesn't work. Avocado will match the provided checksum, a sha256
hash, with the sha1 hash from the existing CHECKSUM file for the asset,
and will re-download the image again. Avocado doesn't take into account
that we're using a different hash algorithm than the one used to fetch
the image via get-vm-image-fedora31 (in avocado: utils/asset.py,
self.find_asset_file() and fetch(self, timeout=None). The new download will
take into account the chosen hash algorithm, and subsequent avocado runs
will not re-download the image again because now it's comparing sha256 with
sha256.

All of this, of course, assuming that the system was able to re-download
the image before the avocado test timeouts. A more "fun" scenario
happens if the network is not fast enough to download the image during
the avocado timeout, the test will fail and the sha1 image will remain
in the cache. And the test will keep trying to re-fetch it, and will
keep failing with a timeout.

There's something to be said about avocado matching different sha
algorithms instead of re-calculating the hash with the chosen algorithm
during fetch(), especially considering that the CHECKSUM file contains
the name of the algorithm used. An avocado feature request [2] was
opened to see if this is a feasible change to do.

For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
immediately spares us at least one extra download for each Fedora 31
image that we're doing in all our CI runs.

[1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
[2] https://github.com/avocado-framework/avocado/issues/5496

Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/avocado_qemu/__init__.py | 30 ++++++++++++++++++--------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..68c42948a3 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -423,12 +423,24 @@ class LinuxDistro:
     Holds information of known distros.
     """
     #: A collection of known distros and their respective image checksum
+    #
+    # 'get-vm-image-fedora-31' target from Makefile.include will
+    # download the images using avocado default 'sha1' algorithm.
+    # This happens because the command line 'avocado vmimage get'
+    # from Makefile.include is not able to handle an extra --algorithm
+    # argument.
+    #
+    # To avoid a re-download of a recent image download due to a sha
+    # mismatch in the first test run, all Fedora 31 images are using
+    # 'sha1' instead of 'sha256'.
+    #
+    # FIXME: revisit this change if/when avocado learns to do CHECKSUM
+    # matches using different algorithms.
     KNOWN_DISTROS = {
         'fedora': {
             '31': {
                 'x86_64':
-                {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
-                              '8a309c2d46215d8fc026954f3c5c27a0'),
+                {'checksum': ('f62f8eabbf3687ea610c495bd59551a0025f99b7'),
                  'pxeboot_url': ('https://archives.fedoraproject.org/'
                                  'pub/archive/fedora/linux/releases/31/'
                                  'Everything/x86_64/os/images/pxeboot/'),
@@ -438,8 +450,7 @@ class LinuxDistro:
                                    'console=ttyS0,115200n8'),
                 },
                 'aarch64':
-                {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
-                              'd2af0ad0329383d5639c997fdf16fe49'),
+                {'checksum': ('39d1fe099cdecacae894480d421be57d18b4e854'),
                 'pxeboot_url': 'https://archives.fedoraproject.org/'
                                'pub/archive/fedora/linux/releases/31/'
                                'Everything/aarch64/os/images/pxeboot/',
@@ -450,11 +461,9 @@ class LinuxDistro:
                                   ' console=ttyAMA0'),
                 },
                 'ppc64':
-                {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
-                              '3f991c506f2cc390dc4efa2026ad2f58')},
+                {'checksum': ('9993dc28e7c49ceb52125f9513130dfe2ace026c')},
                 's390x':
-                {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
-                              '1e354f834d355069ca982fdcaf5a122d')},
+                {'checksum': ('455f017b82decf32f366e06e7a7d0f6da86f96a7')},
             },
             '32': {
                 'aarch64':
@@ -595,15 +604,18 @@ def download_boot(self):
         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
+        hash_algorithm = 'sha256'
         if self.distro.name == 'fedora':
             if image_arch == 'ppc64':
                 image_arch = 'ppc64le'
+            if self.distro.version == '31':
+                hash_algorithm = 'sha1'
 
         try:
             boot = vmimage.get(
                 self.distro.name, arch=image_arch, version=self.distro.version,
                 checksum=self.distro.checksum,
-                algorithm='sha256',
+                algorithm=hash_algorithm,
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
         except:
-- 
2.37.3



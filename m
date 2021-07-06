Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A467D3BD7A0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:19:52 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0kzP-0004Gv-KC
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0kxe-00024s-Ov
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0kxY-0007oV-3N
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625577475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njBhfYwuH1NBHBs9DZXYkWA0dgadP10WVKW92Z50E1Q=;
 b=JfIUEDCPfOsGO1b0Wht7z9L0HWn5qz1JQNbXZ6X/uBfoF1cnFsPSTRZcsV1rOpkSm5DRJO
 L0HlUgz0iTWK/tdsuGfbqV1sUMoRJyRN56PyY9gOjmNgY2zGfJBkauwvN8UQTWsVg6mH58
 6muR4ZEaO6uICZXoNfe8EaexZZo49ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-3XO-hEnrM5ioqqb2JYKxXQ-1; Tue, 06 Jul 2021 09:17:53 -0400
X-MC-Unique: 3XO-hEnrM5ioqqb2JYKxXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D3F800D62;
 Tue,  6 Jul 2021 13:17:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-159.ams2.redhat.com [10.36.113.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E971169CB8;
 Tue,  6 Jul 2021 13:17:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v5 2/4] Acceptance Tests: Add default kernel params and
 pxeboot url to the KNOWN_DISTROS collection
Date: Tue,  6 Jul 2021 15:17:27 +0200
Message-Id: <20210706131729.30749-3-eric.auger@redhat.com>
In-Reply-To: <20210706131729.30749-1-eric.auger@redhat.com>
References: <20210706131729.30749-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

When running LinuxTests we may need to run the guest with
custom params. It is practical to store the pxeboot URL
and the default kernel params so that the
tests just need to fetch those and augment the kernel params.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>

---

v4 -> v5:
- fixed some indentation issues (William)
- added William's R-b
---
 tests/acceptance/avocado_qemu/__init__.py | 53 ++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index af93cd63ea..ee354eb458 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -309,12 +309,51 @@ class LinuxDistro:
         'fedora': {
             '31': {
                 'x86_64':
-                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
+                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
+                'pxeboot_url': 'https://archives.fedoraproject.org/'
+                               'pub/archive/fedora/linux/releases/31/'
+                               'Everything/x86_64/os/images/pxeboot/',
+                'kernel_params': 'root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c'
+                                 ' ro no_timer_check net.ifnames=0'
+                                 ' console=tty1 console=ttyS0,115200n8'
+                },
+                'aarch64':
+                {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',
+                'pxeboot_url': 'https://archives.fedoraproject.org/'
+                               'pub/archive/fedora/linux/releases/31/'
+                               'Everything/aarch64/os/images/pxeboot/',
+                'kernel_params': 'root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7'
+                                 ' ro earlyprintk=pl011,0x9000000'
+                                 ' ignore_loglevel no_timer_check'
+                                 ' printk.time=1 rd_NO_PLYMOUTH'
+                                 ' console=ttyAMA0'
+                },
                 'ppc64':
                 {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
                 's390x':
                 {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
-            }
+            },
+            '32': {
+                'aarch64':
+                {'checksum': 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
+                'pxeboot_url': 'http://dl.fedoraproject.org/pub/fedora/linux/'
+                               'releases/32/Server/aarch64/os/images/pxeboot/',
+                'kernel_params': 'root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5'
+                                 ' ro no_timer_check net.ifnames=0'
+                                 ' console=tty1 console=ttyS0,115200n8',
+                },
+            },
+            '33': {
+                'aarch64':
+                {'checksum': 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
+                'pxeboot_url': 'http://dl.fedoraproject.org/pub/fedora/linux/'
+                               'releases/33/Server/aarch64/os/images/pxeboot/',
+                'kernel_params': 'root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a'
+                                 ' ro no_timer_check net.ifnames=0'
+                                 ' console=tty1 console=ttyS0,115200n8'
+                                 ' console=tty0',
+                 },
+            },
         }
     }
 
@@ -337,6 +376,16 @@ def checksum(self):
     def checksum(self, value):
         self._info['checksum'] = value
 
+    @property
+    def pxeboot_url(self):
+        """Gets the repository url where pxeboot files can be found"""
+        return self._info.get('pxeboot_url', None)
+
+    @property
+    def default_kernel_params(self):
+        """Gets the default kernel parameters"""
+        return self._info.get('kernel_params', None)
+
 
 class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
-- 
2.26.3



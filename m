Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF2C3C8A0F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:48:09 +0200 (CEST)
Received: from localhost ([::1]:58974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3izQ-0000pb-PA
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3itL-00087i-07
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3itJ-0000EJ-9y
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626284508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmhW3LlMTBjCp+U5c0yW3twxyGu+rY55zaa+Mo6PoiE=;
 b=JlCXdMYa+G9hmhDGlNfSSRot3xRd5siDUBFMJEk3sicTlr2rr2macHEfOHosQ3kb3Yh7fl
 hgOq5z850bXW4+Xt3aFfjSn+D18gkBcdV/8i76JwWK4rz5ZCKykR3K4PYsgIsAWHSYiqXG
 SHsJPYDuM+l2IWYkss/ovVeIyXN5j/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341--Ioq2nLWOWWKeVrPsF1QQA-1; Wed, 14 Jul 2021 13:41:47 -0400
X-MC-Unique: -Ioq2nLWOWWKeVrPsF1QQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753911018723;
 Wed, 14 Jul 2021 17:41:46 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B2E60CC4;
 Wed, 14 Jul 2021 17:41:37 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] tests/acceptance/virtio-gpu.py: provide kernel and initrd
 hashes
Date: Wed, 14 Jul 2021 13:40:51 -0400
Message-Id: <20210714174051.28164-7-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-1-crosa@redhat.com>
References: <20210714174051.28164-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By providing kernel and initrd hashes, the test guarantees the
integrity of the images used and avoids the warnings set by
fetch_asset() when hashes are lacking.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 0f84affe82..4acc1e6d5f 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -40,11 +40,13 @@ class VirtioGPUx86(Test):
         "/linux/releases/33/Everything/x86_64/os/images"
         "/pxeboot/vmlinuz"
     )
+    KERNEL_HASH = '1433cfe3f2ffaa44de4ecfb57ec25dc2399cdecf'
     INITRD_URL = (
         "https://archives.fedoraproject.org/pub/fedora"
         "/linux/releases/33/Everything/x86_64/os/images"
         "/pxeboot/initrd.img"
     )
+    INITRD_HASH = 'c828d68a027b53e5220536585efe03412332c2d9'
 
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(
@@ -61,8 +63,8 @@ def test_virtio_vga_virgl(self):
         # FIXME: should check presence of virtio, virgl etc
         self.require_accelerator('kvm')
 
-        kernel_path = self.fetch_asset(self.KERNEL_URL)
-        initrd_path = self.fetch_asset(self.INITRD_URL)
+        kernel_path = self.fetch_asset(self.KERNEL_URL, self.KERNEL_HASH)
+        initrd_path = self.fetch_asset(self.INITRD_URL, self.INITRD_HASH)
 
         self.vm.set_console()
         self.vm.add_args("-m", "2G")
@@ -100,8 +102,8 @@ def test_vhost_user_vga_virgl(self):
         if not vug:
             self.cancel("Could not find vhost-user-gpu")
 
-        kernel_path = self.fetch_asset(self.KERNEL_URL)
-        initrd_path = self.fetch_asset(self.INITRD_URL)
+        kernel_path = self.fetch_asset(self.KERNEL_URL, self.KERNEL_HASH)
+        initrd_path = self.fetch_asset(self.INITRD_URL, self.INITRD_HASH)
 
         # Create socketpair to connect proxy and remote processes
         qemu_sock, vug_sock = socket.socketpair(
-- 
2.31.1



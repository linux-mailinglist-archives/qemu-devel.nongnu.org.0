Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7423D05C9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:45:53 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zQv-00067W-14
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCD-0002E5-Qw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCB-0007lc-26
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626823838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wNhOnLisk61O861Fulhpt/Y1FDx/fXC0R+yM++j/3g=;
 b=fZcTC6Ws9Wr+plxQrkF7Zd7Jt0ZUumTcGN7/+5xaTKv5px9zQGcuLOIiM/ZNAtwl4mkxtJ
 /SvxR4OA3dGDls6hRUAD+F25xbZyVv1S347ubgVeHy1fn7BYYV8X7pc5vnKCVGci+cA+Sn
 aYOaBk3Vr06cAmArVDLKQDjxtDnjTng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-rR-Pe344N7KIviPJAixlFQ-1; Tue, 20 Jul 2021 19:30:37 -0400
X-MC-Unique: rR-Pe344N7KIviPJAixlFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90C4802C80;
 Tue, 20 Jul 2021 23:30:35 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2D61002F12;
 Tue, 20 Jul 2021 23:30:34 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/7] tests/acceptance/virtio-gpu.py: combine x86_64 arch tags
Date: Tue, 20 Jul 2021 19:30:13 -0400
Message-Id: <20210720233018.101541-3-crosa@redhat.com>
In-Reply-To: <20210720233018.101541-1-crosa@redhat.com>
References: <20210720233018.101541-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test class in question is x86_64 specific, so it's possible to set
the tags at the class level.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210714174051.28164-3-crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 42602a240a..729b99b2e5 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -30,6 +30,7 @@ def pick_default_vug_bin():
 class VirtioGPUx86(Test):
     """
     :avocado: tags=virtio-gpu
+    :avocado: tags=arch:x86_64
     """
 
     KERNEL_COMMON_COMMAND_LINE = "printk.time=0 "
@@ -54,7 +55,6 @@ def wait_for_console_pattern(self, success_message, vm=None):
 
     def test_virtio_vga_virgl(self):
         """
-        :avocado: tags=arch:x86_64
         :avocado: tags=device:virtio-vga
         :avocado: tags=cpu:host
         """
@@ -94,7 +94,6 @@ def test_virtio_vga_virgl(self):
 
     def test_vhost_user_vga_virgl(self):
         """
-        :avocado: tags=arch:x86_64
         :avocado: tags=device:vhost-user-vga
         :avocado: tags=cpu:host
         """
-- 
2.31.1



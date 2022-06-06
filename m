Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042F53E52F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:57:28 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEAZ-0002oi-4v
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr9-00029K-5V
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000YW-Od
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8L7JgI2F5oBbZ3TmKr5ty/PB+j+A2om4APNZtjbcNQU=;
 b=S2iBQOO8oHpmtb2C05QlMfP1zXTP8vHyj6W5RddmjA2Xb6F3cDkPvmIsYvVzAu3Qo+qUVk
 JqLPQVxoyzDICdHXd4bq8CsDex8Bjsjbq6ieAUv3a43V0J/DqSWVNDcIJFclDWLJzZ8YBj
 skvzj2W9fRH0RGxzuXI5/JFlcoZJqek=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-rsRQwwntPCi9fqoIAkuJwQ-1; Mon, 06 Jun 2022 10:37:15 -0400
X-MC-Unique: rsRQwwntPCi9fqoIAkuJwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so7822488wmj.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8L7JgI2F5oBbZ3TmKr5ty/PB+j+A2om4APNZtjbcNQU=;
 b=NkWBu8nldxF6/TZN2OC6wH6owTFAYvADekua0BoANpUADgg0WzZN7wZP4z2mrAgAhy
 8D5AuAkFx538tQIRHFGF4tdsY9lkC8WjDQhlEywbHBniuGsPvS7sGWZnyHSpqLze+7Wg
 Lr7mrzNLk2/KlVCb0vgr4WSY/lutmEnoUWl3NcIZcezkP0WEDBFwbG/KLVKoHDkWCbIC
 askDYUVXKiBA2IUNFKReGRQIAOnTg2FXxKaybR+sFKYjrbkmqYD5HJbuUAcfl6/Ucw7M
 fyyqciAKfZ1bTT9lJ6+jPGLgToLxeJI0oXAoNb+8gIZRnbo1KETSSUa4drEx3ZfxTMDT
 S4qg==
X-Gm-Message-State: AOAM530MqVeUn38MjHA5O1Uwto4AhsBK6wRUmEt5TySr5MEaN/kI/aE/
 bOlR8a+Wd3TXIIAlRhJQNdFhTlscSlxhlQdDeT9V/NnFQTiBnUb5u1xi7s1mXLm4+wk12z9PYwV
 dGgMcPwmA7zEtBJIgmoa72uuQy6axFgKu4NCJpDvwrg3ywoHDy2PLDKF0pDPbzuXnjkA=
X-Received: by 2002:adf:d1ca:0:b0:218:47c0:c4d2 with SMTP id
 b10-20020adfd1ca000000b0021847c0c4d2mr2017432wrd.639.1654526233763; 
 Mon, 06 Jun 2022 07:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEu2jNBALN6ezVTbKZjoeNpN7R+6cnXGbMiNigYCAX+g1Ts/Qnx5b/s/sm+sTBXnUyAYq3sw==
X-Received: by 2002:adf:d1ca:0:b0:218:47c0:c4d2 with SMTP id
 b10-20020adfd1ca000000b0021847c0c4d2mr2017393wrd.639.1654526233335; 
 Mon, 06 Jun 2022 07:37:13 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b00210288c55d0sm15501769wrp.52.2022.06.06.07.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 14/29] tests/avocado: add replay Linux test for Aarch64 machines
Date: Mon,  6 Jun 2022 16:36:29 +0200
Message-Id: <20220606143644.1151112-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds two tests for replaying Linux boot process
on Aarch64 platform.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <165364841373.688121.8868079200312201658.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/avocado/replay_linux.py | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 3bb1bc8816..40e4f6908e 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -13,6 +13,7 @@
 import time
 
 from avocado import skipUnless
+from avocado_qemu import BUILD_DIR
 from avocado.utils import cloudinit
 from avocado.utils import network
 from avocado.utils import vmimage
@@ -149,3 +150,42 @@ def test_pc_q35(self):
         :avocado: tags=machine:q35
         """
         self.run_rr(shift=3)
+
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+class ReplayLinuxAarch64(ReplayLinux):
+    """
+    :avocado: tags=accel:tcg
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    :avocado: tags=cpu:max
+    """
+
+    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
+
+    hdd = 'virtio-blk-device'
+    cd = 'virtio-blk-device'
+    bus = None
+
+    def get_common_args(self):
+        return ('-bios',
+                os.path.join(BUILD_DIR, 'pc-bios', 'edk2-aarch64-code.fd'),
+                "-cpu", "max,lpa2=off",
+                '-device', 'virtio-rng-pci,rng=rng0',
+                '-object', 'rng-builtin,id=rng0')
+
+    def test_virt_gicv2(self):
+        """
+        :avocado: tags=machine:gic-version=2
+        """
+
+        self.run_rr(shift=3,
+                    args=(*self.get_common_args(),
+                          "-machine", "virt,gic-version=2"))
+
+    def test_virt_gicv3(self):
+        """
+        :avocado: tags=machine:gic-version=3
+        """
+
+        self.run_rr(shift=3,
+                    args=(*self.get_common_args(),
-- 
2.36.1




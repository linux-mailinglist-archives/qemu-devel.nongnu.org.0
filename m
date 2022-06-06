Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD753E559
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:20:11 +0200 (CEST)
Received: from localhost ([::1]:54976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEWY-0004Sa-NM
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrz-0003gZ-34
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000Xo-JM
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fh/CmWAPDnDHWATVLpMVxiBBAmG9rkDP5JOt4C8luME=;
 b=Z6aH91MPsrj1zg1mGOZDj5wazMWHGIwmPqTMmT47ig5Sdc17MvO9OUZEG2tNhtQyJkTX0B
 1+yKfq8qJVHGCJQ+qzLC0D4C1PsdXwl8T0ZTOCbB+xkWXzN6skjGK3dKUFeG7ddI1B6Gdr
 iwf4HBuTpz1Sz+cdxh84yYGGnmY5/FE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-6OMvgc6FMpyznj2frmj5mA-1; Mon, 06 Jun 2022 10:37:11 -0400
X-MC-Unique: 6OMvgc6FMpyznj2frmj5mA-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay1-20020a05600c1e0100b0039c3a3fc6a4so4861935wmb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fh/CmWAPDnDHWATVLpMVxiBBAmG9rkDP5JOt4C8luME=;
 b=W2eV9CtbSz9JE7m2Tu+4NtYr+ESiH1Lp7dNt+RzNunTRkquTkxewmzCN25mjbSozJe
 /1PPe86u9giFeViy1OoNI+uGPnQwt0s/gPnrYqEX5c2YQQ4I4gX+a3jEuAzGdNm2ffTY
 hfTEwNUE2mSY7329HZuACSEgX1yAatLVxnhVU77km4dEVceo9L4mJoksZkQ4R2S21kDE
 bKrgYa8UDTh84lIgPrEteCklcrzmm+BvTF3W1MCdBBIy6bnER2UwYZVl8bgkLKl8k1lw
 9HhWaLD6CuGezs3sNCmcGIhrSKb/gA8fZIJAgARq7w0++M1UvGXRz0CdWI9bulTO0/Df
 D6cw==
X-Gm-Message-State: AOAM533UYgeRBKWb/V27snyps7OxAqbf6trrpfbDH9EHNyUTveQyNvFj
 gNraB3gSosUt3Kkd7PSnvZA3X/qcpjPLNl8Z7s3uJcFeueSvBQ8QfR/W+TX0j0vAhHYDxwa5DIZ
 JU2t87fxUIXDMwbJNuW00qapMFrMYiajOfXlQDyHKJC7s1anmIlJJk7n7OPOB7yoGrRM=
X-Received: by 2002:adf:e2c9:0:b0:20c:dbc2:a411 with SMTP id
 d9-20020adfe2c9000000b0020cdbc2a411mr21754744wrj.391.1654526229983; 
 Mon, 06 Jun 2022 07:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU5hmTksslLdjFtxmUVEwoytInUFFmdaWEbatammZ7+x7w6e96amBswk4NaisZaY6wVcA2Ng==
X-Received: by 2002:adf:e2c9:0:b0:20c:dbc2:a411 with SMTP id
 d9-20020adfe2c9000000b0020cdbc2a411mr21754709wrj.391.1654526229611; 
 Mon, 06 Jun 2022 07:37:09 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r63-20020a1c2b42000000b003971fc23185sm20643288wmr.20.2022.06.06.07.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 12/29] tests/avocado: update replay_linux test
Date: Mon,  6 Jun 2022 16:36:27 +0200
Message-Id: <20220606143644.1151112-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This patch updates replay_linux test to make it compatible with
new LinuxTest class.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <165364840253.688121.10404266209986316381.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/avocado/replay_linux.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 15953f9e49..1099b5647f 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -32,9 +32,16 @@ class ReplayLinux(LinuxTest):
     bus = 'ide'
 
     def setUp(self):
-        super(ReplayLinux, self).setUp()
+        # LinuxTest does many replay-incompatible things, but includes
+        # useful methods. Do not setup LinuxTest here and just
+        # call some functions.
+        super(LinuxTest, self).setUp()
+        self._set_distro()
         self.boot_path = self.download_boot()
-        self.cloudinit_path = self.prepare_cloudinit()
+        self.phone_server = cloudinit.PhoneHomeServer(('0.0.0.0', 0),
+                                                      self.name)
+        ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
+        self.cloudinit_path = self.prepare_cloudinit(ssh_pubkey)
 
     def vm_add_disk(self, vm, path, id, device):
         bus_string = ''
@@ -50,7 +57,9 @@ def launch_and_wait(self, record, args, shift):
         vm = self.get_vm()
         vm.add_args('-smp', '1')
         vm.add_args('-m', '1024')
-        vm.add_args('-object', 'filter-replay,id=replay,netdev=hub0port0')
+        vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                    '-device', 'virtio-net,netdev=vnet')
+        vm.add_args('-object', 'filter-replay,id=replay,netdev=vnet')
         if args:
             vm.add_args(*args)
         self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
@@ -75,8 +84,8 @@ def launch_and_wait(self, record, args, shift):
                                     stop_check=(lambda : not vm.is_running()))
         console_drainer.start()
         if record:
-            cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
-                                          self.name)
+            while not self.phone_server.instance_phoned_back:
+                self.phone_server.handle_request()
             vm.shutdown()
             logger.info('finished the recording with log size %s bytes'
                 % os.path.getsize(replay_path))
-- 
2.36.1




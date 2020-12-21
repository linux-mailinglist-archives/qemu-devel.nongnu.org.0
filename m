Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BA2DFC67
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:49:39 +0100 (CET)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLZC-0000yO-6K
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLV7-0005QJ-A2
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLV3-0003XU-Kv
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608558320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G82qgwCpQt/kqZyPE+ExwIhpZPrxCfodPJCygbB634c=;
 b=ewkgYM19GgGXQEK86pxjRBWTMrfM4Tv6NhVPJTBUCjK/E7VBAHWeABWCGI/aLiUlgZSdfB
 XspunwHKjJ19WujE2++J3IMBzpZUray7wQ+MBoELPmG6/88qqVvh84/FunBnvUs9CqLH4R
 auYW2UQ/5gQ2WRBUy+RAfxmTm5kaN1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Kc_vZdC8MhivI-SuTdWELQ-1; Mon, 21 Dec 2020 08:45:14 -0500
X-MC-Unique: Kc_vZdC8MhivI-SuTdWELQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68DDE107ACE6;
 Mon, 21 Dec 2020 13:45:13 +0000 (UTC)
Received: from thuth.com (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B94345D9CA;
 Mon, 21 Dec 2020 13:45:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/5] fuzz: Add more i386 configurations for fuzzing
Date: Mon, 21 Dec 2020 14:45:00 +0100
Message-Id: <20201221134504.764-2-thuth@redhat.com>
In-Reply-To: <20201221134504.764-1-thuth@redhat.com>
References: <20201221134504.764-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This adds configurations for fuzzing the following devices on oss-fuzz:

* vmxnet3
CC: Dmitry Fleytman <dmitry.fleytman@gmail.com>
* ne2k
* pcnet
* rtl8139
CC: Jason Wang <jasowang@redhat.com>
* eepro100
CC: Stefan Weil <sw@weilnetz.de>
* sdhci
CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
* ehci
* ohci
* ac97
* cs4231a
* es1370
* sb16
CC: Gerd Hoffmann <kraxel@redhat.com>
* megasas
CC: Hannes Reinecke <hare@suse.com>
* parallel
CC: Michael S. Tsirkin <mst@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20201123184352.242907-1-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 80 +++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index b4c5fefeca..fbc9779f7f 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -114,6 +114,86 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "pc-q35",
         .args = "-machine q35",
         .objects = "*",
+    },{
+        .name = "vmxnet3",
+        .args = "-machine q35 -nodefaults "
+        "-device vmxnet3,netdev=net0 -netdev user,id=net0",
+        .objects = "vmxnet3"
+    },{
+        .name = "ne2k_pci",
+        .args = "-machine q35 -nodefaults "
+        "-device ne2k_pci,netdev=net0 -netdev user,id=net0",
+        .objects = "ne2k*"
+    },{
+        .name = "pcnet",
+        .args = "-machine q35 -nodefaults "
+        "-device pcnet,netdev=net0 -netdev user,id=net0",
+        .objects = "pcnet"
+    },{
+        .name = "rtl8139",
+        .args = "-machine q35 -nodefaults "
+        "-device rtl8139,netdev=net0 -netdev user,id=net0",
+        .objects = "rtl8139"
+    },{
+        .name = "i82550",
+        .args = "-machine q35 -nodefaults "
+        "-device i82550,netdev=net0 -netdev user,id=net0",
+        .objects = "eepro*"
+    },{
+        .name = "sdhci-v3",
+        .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
+        "-device sd-card,drive=mydrive "
+        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
+        .objects = "sd*"
+    },{
+        .name = "ehci",
+        .args = "-machine q35 -nodefaults "
+        "-device ich9-usb-ehci1,bus=pcie.0,addr=1d.7,"
+        "multifunction=on,id=ich9-ehci-1 "
+        "-device ich9-usb-uhci1,bus=pcie.0,addr=1d.0,"
+        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=0 "
+        "-device ich9-usb-uhci2,bus=pcie.0,addr=1d.1,"
+        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=2 "
+        "-device ich9-usb-uhci3,bus=pcie.0,addr=1d.2,"
+        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=4 "
+        "-drive if=none,id=usbcdrom,media=cdrom "
+        "-device usb-tablet,bus=ich9-ehci-1.0,port=1,usb_version=1 "
+        "-device usb-storage,bus=ich9-ehci-1.0,port=2,drive=usbcdrom",
+        .objects = "*usb* *hci*",
+    },{
+        .name = "ohci",
+        .args = "-machine q35 -nodefaults  -device pci-ohci -device usb-kbd",
+        .objects = "*usb* *ohci*",
+    },{
+        .name = "megaraid",
+        .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
+        "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
+        .objects = "megasas*",
+    },{
+        .name = "ac97",
+        .args = "-machine q35 -nodefaults "
+        "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "ac97*",
+    },{
+        .name = "cs4231a",
+        .args = "-machine q35 -nodefaults "
+        "-device cs4231a,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "cs4231a* i8257*",
+    },{
+        .name = "es1370",
+        .args = "-machine q35 -nodefaults "
+        "-device es1370,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "es1370*",
+    },{
+        .name = "sb16",
+        .args = "-machine q35 -nodefaults "
+        "-device sb16,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "sb16* i8257*",
+    },{
+        .name = "parallel",
+        .args = "-machine q35 -nodefaults "
+        "-parallel file:/dev/null",
+        .objects = "parallel*",
     }
 };
 
-- 
2.27.0



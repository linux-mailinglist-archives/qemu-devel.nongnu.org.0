Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203C2494B7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 07:57:28 +0200 (CEST)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8H6F-0006ar-Gc
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 01:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8GwQ-0007lN-QZ
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:47:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55289
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8GwH-0006iA-NZ
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597816016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBGqP8EFZYGK8U5Mb1X88W+B9neqleFAVo0mDjdtZo8=;
 b=cxLMqOuxzBDAdogliKegtrmT7rH4FVaQp2rMHRbabnaLIA/Q50PzY7nbWgrV7rAgtZG/sb
 3hg1NtopjV8kqIjuwXYJVcTXSsYVwWC0mT7zRI663+4uFtkx4M8CNB/XLs0hfoRFf3esIC
 lpxsT9SPJ1U/RY1W0EYWoNJrPEAlPIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-EzwyMOUoN7uiaF0kxollQw-1; Wed, 19 Aug 2020 01:46:54 -0400
X-MC-Unique: EzwyMOUoN7uiaF0kxollQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB7A801ADD;
 Wed, 19 Aug 2020 05:46:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF4C57A1FA;
 Wed, 19 Aug 2020 05:46:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 87F5B1FCE8; Wed, 19 Aug 2020 07:46:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] docs: Add USB U2F key device documentation
Date: Wed, 19 Aug 2020 07:46:33 +0200
Message-Id: <20200819054644.30610-7-kraxel@redhat.com>
In-Reply-To: <20200819054644.30610-1-kraxel@redhat.com>
References: <20200819054644.30610-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 22:38:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: César Belley <cesar.belley@lse.epita.fr>

Add USB U2F key device documentation:
- USB U2F key device
- Building
- Using u2f-emulated
- Using u2f-passthru
- Libu2f-emu

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
Message-id: 20200812094135.20550-3-cesar.belley@lse.epita.fr
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/u2f.txt | 101 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 docs/u2f.txt

diff --git a/docs/u2f.txt b/docs/u2f.txt
new file mode 100644
index 000000000000..f60052882ec3
--- /dev/null
+++ b/docs/u2f.txt
@@ -0,0 +1,101 @@
+QEMU U2F Key Device Documentation.
+
+Contents
+1. USB U2F key device
+2. Building
+3. Using u2f-emulated
+4. Using u2f-passthru
+5. Libu2f-emu
+
+1. USB U2F key device
+
+U2F is an open authentication standard that enables relying parties
+exposed to the internet to offer a strong second factor option for end
+user authentication.
+
+The standard brings many advantages to both parties, client and server,
+allowing to reduce over-reliance on passwords, it increases authentication
+security and simplifies passwords.
+
+The second factor is materialized by a device implementing the U2F
+protocol. In case of a USB U2F security key, it is a USB HID device
+that implements the U2F protocol.
+
+In Qemu, the USB U2F key device offers a dedicated support of U2F, allowing
+guest USB FIDO/U2F security keys operating in two possible modes:
+pass-through and emulated.
+
+The pass-through mode consists of passing all requests made from the guest
+to the physical security key connected to the host machine and vice versa.
+In addition, the dedicated pass-through allows to have a U2F security key
+shared on several guests which is not possible with a simple host device
+assignment pass-through.
+
+The emulated mode consists of completely emulating the behavior of an
+U2F device through software part. Libu2f-emu is used for that.
+
+
+2. Building
+
+To ensure the build of the u2f-emulated device variant which depends
+on libu2f-emu: configuring and building:
+
+    ./configure --enable-u2f && make
+
+
+3. Using u2f-emulated
+
+To work, an emulated U2F device must have four elements:
+ * ec x509 certificate
+ * ec private key
+ * counter (four bytes value)
+ * 48 bytes of entropy (random bits)
+
+To use this type of device, this one has to be configured, and these
+four elements must be passed one way or another.
+
+Assuming that you have a working libu2f-emu installed on the host.
+There are three possible ways of configurations:
+ * ephemeral
+ * setup directory
+ * manual
+
+Ephemeral is the simplest way to configure, it lets the device generate
+all the elements it needs for a single use of the lifetime of the device.
+
+    qemu -usb -device u2f-emulated
+
+Setup directory allows to configure the device from a directory containing
+four files:
+ * certificate.pem: ec x509 certificate
+ * private-key.pem: ec private key
+ * counter: counter value
+ * entropy: 48 bytes of entropy
+
+    qemu -usb -device u2f-emulated,dir=$dir
+
+Manual allows to configure the device more finely by specifying each
+of the elements necessary for the device:
+ * cert
+ * priv
+ * counter
+ * entropy
+
+    qemu -usb -device u2f-emulated,cert=$DIR1/$FILE1,priv=$DIR2/$FILE2,counter=$DIR3/$FILE3,entropy=$DIR4/$FILE4
+
+
+4. Using u2f-passthru
+
+On the host specify the u2f-passthru device with a suitable hidraw:
+
+    qemu -usb -device u2f-passthru,hidraw=/dev/hidraw0
+
+
+5. Libu2f-emu
+
+The u2f-emulated device uses libu2f-emu for the U2F key emulation. Libu2f-emu
+implements completely the U2F protocol device part for all specified
+transport given by the FIDO Alliance.
+
+For more information about libu2f-emu see this page:
+https://github.com/MattGorko/libu2f-emu.
-- 
2.18.4



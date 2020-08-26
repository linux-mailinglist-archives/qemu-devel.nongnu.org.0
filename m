Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B08252CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:45:29 +0200 (CEST)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtrs-0000oP-Pn
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtpJ-0004fB-KI
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:42:49 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:47880
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtpG-00085N-O2
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:42:49 -0400
Received: from MattGorko-Laptop.home
 (lfbn-idf1-1-1395-83.w90-79.abo.wanadoo.fr [90.79.87.83])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 8CA25412C9;
 Wed, 26 Aug 2020 13:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1598442165; bh=mXjkHDuBA2Pelp7FvLqsvotpGAVI+Oj+eqQ5xB79ZVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e+qFHPF+ct+KgowQcnM03cBIJejo5jjvqi0aU69KphXhROqYxdfLd8IWSAQQscKUQ
 mcW6SMpwDaQ1PeG2iEmQpbSr1JtzvzF40ly914amkbASre1+MM6zhMiyVTjGO0M3/b
 jtmwbCrp2BhL1gXiiG5gK+GSFWuxp5Yk+763uiB4=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] docs: Add USB U2F key device documentation
Date: Wed, 26 Aug 2020 13:41:59 +0200
Message-Id: <20200826114209.28821-3-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
References: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 07:42:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add USB U2F key device documentation:
- USB U2F key device
- Building
- Using u2f-emulated
- Using u2f-passthru
- Libu2f-emu

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 docs/u2f.txt | 101 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 docs/u2f.txt

diff --git a/docs/u2f.txt b/docs/u2f.txt
new file mode 100644
index 0000000000..f60052882e
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
2.28.0



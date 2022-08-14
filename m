Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC859211A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 17:34:02 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNFcm-0008O4-LH
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 11:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1oNFbO-0006FH-8y
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 11:32:34 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:36110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1oNFbM-0003uj-MS
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 11:32:34 -0400
Received: from workstation5.fritz.box
 (ip-062-143-094-109.um16.pools.vodafone-ip.de [62.143.94.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id CFF2B3F0DE; 
 Sun, 14 Aug 2022 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660491148;
 bh=+wfeJV1pyBuwgHaqtb5hJNOUDeVZtoZJune6HwYKWog=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=ENkWlxpjY0sHYkSoZx7z9Ly7zBnhz6pl96wme88aTd5MrRRMX7fai/+SREMshcEaJ
 5zpOdgpzi1VDQAa9OuqRWcSuoZQqz7Qa87l/Cq4GXVJfZCC33q8fKBX+vEugb21xnM
 NDYqDmnFAUQY+ppO1v5YdXPrPlUPCly037ByGXT7hGaNi2u/Gstil85BWgBppgof3d
 vn7L/fQ9B7IB+xgwGAwuqQ1Vwt/3JGFPzzzebYzu9aENRQe/fpFChSvydpnqcmOewC
 SgKMnXVBtJ/cc8Q6oDCfk1fe1aZny6VrSSaoMLMU5E3LehI9hmdSjq27KBcy15xggI
 9HD3CJAynmZ+w==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v2 1/1] docs: pcie: describe PCIe option ROMs
Date: Sun, 14 Aug 2022 17:32:20 +0200
Message-Id: <20220814153220.2439468-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.120;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-canonical-0.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Provide a descriptions of the options that control the emulation of option
ROMS for PCIe devices.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	correct description of rombar property
	use romfile= to suppress option ROM loading
---
 docs/pcie.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..b60f189bd4 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -292,6 +292,34 @@ PCI-PCI Bridge slots can be used for legacy PCI host devices.
 If you can see the "Express Endpoint" capability in the
 output, then the device is indeed PCI Express.
 
+8. Option ROM
+=============
+PCIe devices may provide an option ROM. The following properties control the
+emulation of the option ROM:
+
+``rombar`` (default: ``1``)
+  For vfio-pci devices a vendor and product ID based denylist exists which
+  controls if an available option ROM shall be probed. The 'rombar' option
+  allows to override this setting. The value is used as follows:
+  0 = skip probing, 1 = force probing
+
+``romfile``
+  Defines the name of the file to be loaded as option ROM.
+  The file size may neither exceed 2 GiB nor ``romsize``.
+  Some devices like virtio-net-pci define a default file name.
+
+``romsize`` (default: ``-1``)
+  Specifies the size of the option ROM in bytes. The value must be either
+  ``-1`` or a power of two. ``-1`` signifies unlimited size.
+
+Some QEMU PCIe devices like virtio-net-pci use an option ROM by default. In the
+following example the option ROM of a virtio-net-pci device is disabled by
+specifying an empty ``romfile`` property. This is useful for architectures where
+QEMU does not supply an option ROM file.
+
+.. code-block:: console
+
+    -device virtio-net-pci,netdev=eth1,mq=on,romfile=
 
 7. Virtio devices
 =================
-- 
2.36.1



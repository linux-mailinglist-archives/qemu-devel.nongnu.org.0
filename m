Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4057B130
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 08:45:32 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3Sd-00046G-Bz
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 02:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1oE3QC-0002Ji-Us
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:43:01 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:50100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1oE3QA-0003bJ-QQ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:43:00 -0400
Received: from LT2ubnt.lan (ip-062-143-094-109.um16.pools.vodafone-ip.de
 [62.143.94.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D28C63F4DC; 
 Wed, 20 Jul 2022 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1658299372;
 bh=fnrgKT5trHij37NcBEBtRvd+H7Dr2g8467lLHW5g3TA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=ponYcvVnp3In08Kf8zQn/cLzci0jq8bl4NQs8fe9N/u2wnRDKQFiGcdD0eo76Mx8X
 5UnTZ+/cmybWoCvT88aN1K9V+jLD9PNWZXV6ANwNv8ENfF6zpyGXWPqmyncZ0767xF
 7ItcxAmzTG/nLyUDoE2UwSOjZyky4P9R5Khz7aGw2vgDjJXOd1KEGJyx6STAp6J+6E
 J5gdSHWXX0QYyVqwLrFJyaGquFqmfizolOdarWtp9iO7BAEgoBpA1OJpQn4YvKEMxk
 3jbQO4gJGsr8OymrdlFtPAY5XPflTC3JhMdAKxQ77zHdw+GyMnxU9D/mMM5WnltbRe
 eEQJ646F88pHg==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] docs: pcie: describe PCIe option ROMs
Date: Wed, 20 Jul 2022 08:42:34 +0200
Message-Id: <20220720064234.93576-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.121;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-canonical-1.canonical.com
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
 docs/pcie.txt | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..a22c1f69f7 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -292,6 +292,31 @@ PCI-PCI Bridge slots can be used for legacy PCI host devices.
 If you can see the "Express Endpoint" capability in the
 output, then the device is indeed PCI Express.
 
+8. Option ROM
+=============
+PCIe devices may provide an option ROM. The following properties control the
+emulation of the option ROM:
+
+``rombar`` (default: ``1``)
+  Specifies that an option ROM is available. If set to ``0``, no option ROM
+  is present.
+
+``romsize`` (default: ``-1``)
+  Specifies the size of the option ROM in bytes. The value must be either
+  ``-1`` or a power of two. ``-1`` signifies unlimited size.
+
+``romfile``
+  Defines the name of the file to be loaded as option ROM.
+  Some devices like virtio-net-pci define a default file name.
+  The file size may neither exceed 2 GiB nor ``romsize``.
+
+Some QEMU PCIe devices like virtio-net-pci use an option ROM by default. In the
+following example the option ROM of a virtio-net-pci device is disabled. This
+is useful for architectures where QEMU does not supply an option ROM file.
+
+.. code-block:: console
+
+    -device virtio-net-pci,netdev=eth1,mq=on,rombar=0
 
 7. Virtio devices
 =================
-- 
2.36.1



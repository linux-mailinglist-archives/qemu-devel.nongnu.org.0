Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE245495D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:56:10 +0100 (CET)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMM5-0003Uy-De
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnME3-0004nR-6H
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:51 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnME1-0000pV-Cv
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:50 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 624AF21EB7;
 Wed, 17 Nov 2021 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637160468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBsdMz226FRzvgeaZm+rQwc/P25DSmwFqWH2z4XEGQY=;
 b=dUbzycmYQkLmTewH5wPv2cxiDIZ4UXtD/OY00lrUx32XKdO0PhCXTiiMBLR1L8TsZ0u7hs
 geXd2rbe2ow8plJy62fvQkfVde4EAInrZmxjsKf7ih7z1JYx87XwAkK3q9UP6H0mZmqy53
 tKRA8nFt2Im6S8su5LRm+cME/fUKNFw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 5/5] docs/system: improve doc about preconfig
Date: Wed, 17 Nov 2021 15:47:03 +0100
Message-Id: <20211117144703.16305-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117144703.16305-1-damien.hedde@greensocs.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, edgar.iglesias@xilinx.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Separate -S / -preconfig sections and improve a bit the preconfig part.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 docs/system/managed-startup.rst | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/docs/system/managed-startup.rst b/docs/system/managed-startup.rst
index 9bcf98ea79..e1cdbb79b1 100644
--- a/docs/system/managed-startup.rst
+++ b/docs/system/managed-startup.rst
@@ -1,6 +1,9 @@
 Managed start up options
 ========================
 
+CPU Frezee start
+----------------
+
 In system mode emulation, it's possible to create a VM in a paused
 state using the ``-S`` command line option. In this state the machine
 is completely initialized according to command line options and ready
@@ -20,7 +23,12 @@ allowing VM code to run.
 
 However, at the ``-S`` pause point, it's impossible to configure options
 that affect initial VM creation (like: ``-smp``/``-m``/``-numa`` ...) or
-cold plug devices. The experimental ``--preconfig`` command line option
+cold plug devices.
+
+Preconfig (experimental)
+------------------------
+
+The experimental ``--preconfig`` command line option
 allows pausing QEMU before the initial VM creation, in a "preconfig" state,
 where additional queries and configuration can be performed via QMP
 before moving on to the resulting configuration startup. In the
@@ -32,4 +40,14 @@ machine, including but not limited to:
 - ``query-qmp-schema``
 - ``query-commands``
 - ``query-status``
+- ``query-machine-phase``
+- ``x-machine-init``
 - ``x-exit-preconfig``
+
+Some commands make QEMU to progress along the VM creation procedure:
+
+- ``x-machine-init`` initializes the machine. Devices can be added only after
+  this command has been issued.
+
+- ``x-exit-preconfig`` leaves the preconfig state. It can be issued at any time
+  during preconfig and it will finish the VM creation.
-- 
2.33.0



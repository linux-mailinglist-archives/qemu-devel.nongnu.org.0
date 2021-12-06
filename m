Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C04691B0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:42:36 +0100 (CET)
Received: from localhost ([::1]:53494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9Zz-00039f-Rf
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:42:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mu9Xw-0001iJ-MB
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:40:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mu9Xv-0007AO-6Z
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638780025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6wmyjEPEV935S0F/dSomDUwWGfNmsHA4u91jY1OpL20=;
 b=A7UN9kCiL8R5vXlQZw07x3Zm2ycgzIK3dlFutAGyQPV/rwBp/suxmc5BCYexkpexOEiWYa
 fW5K5JtfdP5ykGhaq/JublmD/ndVfzBBhPDR9KoBYLC/uAGbscLRzePFAoTE6lxd47KLnz
 nU5aO0BA9gjalaTVBnphcMnWQzRMXz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-51-bjZSTCW9Mb6rBUfmqj92yg-1; Mon, 06 Dec 2021 03:40:22 -0500
X-MC-Unique: bjZSTCW9Mb6rBUfmqj92yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B87DD102CB76;
 Mon,  6 Dec 2021 08:40:18 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08955C25D;
 Mon,  6 Dec 2021 08:40:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-7.0] i386: Deprecate the -no-hpet QEMU command line option
Date: Mon,  6 Dec 2021 09:40:12 +0100
Message-Id: <20211206084012.49277-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HPET setting has been turned into a machine property a while ago
already, so we should finally do the next step and deprecate the
legacy CLI option, too.
While we're at it, add a proper help text for the machine property, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 6 ++++++
 hw/i386/pc.c              | 2 ++
 qemu-options.hx           | 2 +-
 softmmu/vl.c              | 1 +
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 5693abb663..1dfe69aa6a 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -198,6 +198,12 @@ form is preferred.
 Using ``-drive if=none`` to configure the OTP device of the sifive_u
 RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
 
+``-no-hpet`` (since 7.0)
+''''''''''''''''''''''''
+
+The HPET setting has been turned into a machine property.
+Use ``-machine hpet=off`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc..0ab6e67afe 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1743,6 +1743,8 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
+    object_class_property_set_description(oc, "hpet",
+        "High precision event timer emulation");
 
     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..7b921fcbe3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2436,7 +2436,7 @@ DEF("no-hpet", 0, QEMU_OPTION_no_hpet,
     "-no-hpet        disable HPET\n", QEMU_ARCH_I386)
 SRST
 ``-no-hpet``
-    Disable HPET support.
+    Disable HPET support. Deprecated, use '-machine hpet=off' instead.
 ERST
 
 DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1367..471ed006eb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3418,6 +3418,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qdict_put_str(machine_opts_dict, "acpi", "off");
                 break;
             case QEMU_OPTION_no_hpet:
+                warn_report("-no-hpet is deprecated, use '-machine hpet=off' instead");
                 qdict_put_str(machine_opts_dict, "hpet", "off");
                 break;
             case QEMU_OPTION_no_reboot:
-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C9658C68
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pArPd-00027C-FU; Thu, 29 Dec 2022 06:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pArPb-000270-Qt
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 06:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pArPZ-0007d7-QB
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 06:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672314564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dgpZTGcvFMfKXYqy1GaXe5Qbls/Rjs4CnEqJV8VK78s=;
 b=TxNQcJbvgoZHLIVmqIW/tfMNrnPgXC+BEV3L3sckJddPw1py8QkAHXNGPFTXIgscWYzO56
 aKFAGNFSVOqhTPYFBl/Te33qi+cKnxCiO+AsuSrcOE5Q5paCtOf1sr/QeJqoOISbjOqRju
 /GDG+E/aQBOgQevnYuVnHNkGv6FN7Vw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-hYFDI8whM4SysMgU8WRnbQ-1; Thu, 29 Dec 2022 06:49:17 -0500
X-MC-Unique: hYFDI8whM4SysMgU8WRnbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96F50380673D
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 11:49:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A62D40AE1E9;
 Thu, 29 Dec 2022 11:49:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] i386: Deprecate the -no-hpet QEMU command line option
Date: Thu, 29 Dec 2022 12:49:13 +0100
Message-Id: <20221229114913.260400-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The HPET setting has been turned into a machine property a while ago
already, so we should finally do the next step and deprecate the
legacy CLI option, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Rebased to current version from master branch / adjusted version info
 - Dropped the descrpition in hw/i386/pc.c (already done via another patch)

 Note: The "hpet" property should now show up in the output of the
 "query-command-line-options" QMP command since commit 2f129fc107b4a, so
 it should be feasible for libvirt now to properly probe for the property .

 docs/about/deprecated.rst | 6 ++++++
 softmmu/vl.c              | 1 +
 qemu-options.hx           | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 93affe3669..2ae6a79b21 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -114,6 +114,12 @@ form is preferred.
 Using ``-drive if=none`` to configure the OTP device of the sifive_u
 RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
 
+``-no-hpet`` (since 8.0)
+''''''''''''''''''''''''
+
+The HPET setting has been turned into a machine property.
+Use ``-machine hpet=off`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 798e1dc933..9bd0e52d01 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3259,6 +3259,7 @@ void qemu_init(int argc, char **argv)
                 qdict_put_str(machine_opts_dict, "acpi", "off");
                 break;
             case QEMU_OPTION_no_hpet:
+                warn_report("-no-hpet is deprecated, use '-machine hpet=off' instead");
                 qdict_put_str(machine_opts_dict, "hpet", "off");
                 break;
             case QEMU_OPTION_no_reboot:
diff --git a/qemu-options.hx b/qemu-options.hx
index 7f99d15b23..a3adb4163e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2542,7 +2542,7 @@ DEF("no-hpet", 0, QEMU_OPTION_no_hpet,
     "-no-hpet        disable HPET\n", QEMU_ARCH_I386)
 SRST
 ``-no-hpet``
-    Disable HPET support.
+    Disable HPET support. Deprecated, use '-machine hpet=off' instead.
 ERST
 
 DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
-- 
2.31.1



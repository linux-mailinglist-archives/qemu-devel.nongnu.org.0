Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABE6628A4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:35:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEt6f-0008A7-RE; Mon, 09 Jan 2023 09:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEt6V-00086X-30
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEt6T-0008Rx-Fk
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673274380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqLP5gaf6pnthmni5Wz7RqNUWX0Yh9zj4McsYzHy9r0=;
 b=GsdeosbQ1sZ57DCVUkeIGKjmrAAxckyByMhQCmON0Ok8C41ZVJvQpgvE8Ch4rg+K7AwAQb
 YV7TD1Gbe9gM9L8o+IrVrHm4mdSyafk+KHfr4C68Zs5s+cjy35cpfSyArv10ZRiuY2IjLi
 tQ40v8B4P3pENXyIhMHXgJ0hUQjfOv4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-JhB9HFhvPGSkMwnXV-ZQ9Q-1; Mon, 09 Jan 2023 09:26:15 -0500
X-MC-Unique: JhB9HFhvPGSkMwnXV-ZQ9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F85B3811F2A;
 Mon,  9 Jan 2023 14:26:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376C74078903;
 Mon,  9 Jan 2023 14:26:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 11/15] i386: Deprecate the -no-hpet QEMU command line option
Date: Mon,  9 Jan 2023 15:26:00 +0100
Message-Id: <20230109142604.506940-3-thuth@redhat.com>
In-Reply-To: <20230109142604.506940-1-thuth@redhat.com>
References: <20230109142604.506940-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Message-Id: <20221229114913.260400-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ján Tomko <jtomko@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
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



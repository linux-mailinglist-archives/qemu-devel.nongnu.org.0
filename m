Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE665FCBC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi6J-0002bs-U5; Fri, 06 Jan 2023 03:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi6G-0002bE-VM
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi6F-0005Wf-ET
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqLP5gaf6pnthmni5Wz7RqNUWX0Yh9zj4McsYzHy9r0=;
 b=MJIatO/RiTBUnwvDokSWFWnYT5HOFyqBgm2c7G4ezeIYDaXvw4VlGLc39Oj7oVJqMIw4DV
 UJLAIl90cE9wKYFcnw24SIq+viPeEST2fye8QWOGed35aYcmDK5XjQTi62CwbJe5/oPlNe
 60TKwT/KxtuDuaZ9ryImJs59dVA8tGA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-Cp9H_u3nOW6MnJ3xP64W0w-1; Fri, 06 Jan 2023 03:29:11 -0500
X-MC-Unique: Cp9H_u3nOW6MnJ3xP64W0w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00DAC802C1D;
 Fri,  6 Jan 2023 08:29:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA418492B06;
 Fri,  6 Jan 2023 08:29:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 10/15] i386: Deprecate the -no-hpet QEMU command line option
Date: Fri,  6 Jan 2023 09:28:48 +0100
Message-Id: <20230106082853.31787-11-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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



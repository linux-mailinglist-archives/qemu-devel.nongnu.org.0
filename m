Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960E682A13
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:13:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndH-0002op-21; Tue, 31 Jan 2023 05:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002Jv-VD
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnck-0002Uj-8G
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdK/+AoDaGLQgehzH10GvHzz6+INd1sB5CAkEhxPE54=;
 b=W/Zcid+t4e7yl4vPZ6iACUHLLBEfp7qXn9oxzIP5VrLIEVgybOVErrVgKkxT+ZItLw7sbv
 qipjxV3QWFejBPBICEGZOA3EWr1BwGB1EXvkEi0ePjX5xoSLXXRchTmUY/0y5Z9WLOEmwO
 lYV0dqBw6GztfjfVPMKsAdVGhhIpc7Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-K-qOOsi2O1mTnMEm1IsPxg-1; Tue, 31 Jan 2023 05:12:14 -0500
X-MC-Unique: K-qOOsi2O1mTnMEm1IsPxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62F043C0218D;
 Tue, 31 Jan 2023 10:12:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A4D2C15BAE;
 Tue, 31 Jan 2023 10:12:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/27] hw/misc/sifive_u_otp: Remove the deprecated OTP config
 with '-drive if=none'
Date: Tue, 31 Jan 2023 11:11:42 +0100
Message-Id: <20230131101205.1499867-5-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

'-drive if=none' is meant for configuring back-end devices only, so this
got marked as deprecated in QEMU 6.2. Users should now only use the new
way with '-drive if=pflash' instead.

Message-Id: <20230112083921.887828-1-thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 6 ------
 docs/about/removed-features.rst | 7 +++++++
 hw/misc/sifive_u_otp.c          | 7 -------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 9f1bbc495d..3f4d678eb4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -87,12 +87,6 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
 However, short-form booleans are deprecated and full explicit ``arg_name=on``
 form is preferred.
 
-``-drive if=none`` for the sifive_u OTP device (since 6.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Using ``-drive if=none`` to configure the OTP device of the sifive_u
-RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
-
 ``-no-hpet`` (since 8.0)
 ''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 6c3aa5097f..a17d0554d6 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -422,6 +422,13 @@ the value is hexadecimal.  That is, '0x20M' should be written either as
 ``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel``
 respectively. The actual backend names should be used instead.
 
+``-drive if=none`` for the sifive_u OTP device (removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-drive if=pflash`` to configure the OTP device of the sifive_u
+RISC-V machine instead.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 6d7fdb040a..8965f5c22a 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -210,13 +210,6 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!dinfo) {
-        dinfo = drive_get(IF_NONE, 0, 0);
-        if (dinfo) {
-            warn_report("using \"-drive if=none\" for the OTP is deprecated, "
-                        "use \"-drive if=pflash\" instead.");
-        }
-    }
     if (dinfo) {
         int ret;
         uint64_t perm;
-- 
2.31.1



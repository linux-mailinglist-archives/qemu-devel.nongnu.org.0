Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EC42067A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:13:49 +0200 (CEST)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIAW-0002YV-2m
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mXI94-0001AS-Kh
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mXI8z-0003XD-4t
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633331530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Fydxiyn+n8+RrdmF8Le5uP2WgQDFiNV58KmWLoHDgM=;
 b=QESsh5FgG2bQmh/UbBa/vQ1lTtmROOY5j+g7/pGZOePyR3vTRH80TZndrbLksQ/z008JSc
 oluAmnAh0evhN/INR4e/Mwlim5w01LLawvqlZjl7DELyzJ8LKr/AD3V4t2IRY9Oa/wC/we
 OOQyOwFGK22Fb6fERy8JxS/ecR7kOG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-JM-d7tOaMS-AzSAS3gYchQ-1; Mon, 04 Oct 2021 03:12:09 -0400
X-MC-Unique: JM-d7tOaMS-AzSAS3gYchQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BDB519067F3;
 Mon,  4 Oct 2021 07:12:08 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 123BA60BF4;
 Mon,  4 Oct 2021 07:12:04 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: build-system: rename "default-configs" to "configs"
Date: Mon,  4 Oct 2021 09:12:03 +0200
Message-Id: <20211004071203.2092017-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 812b31d3f9 (configs: rename default-configs to configs and
reorganise, 2021-07-07) did the rename.

Reflect that update also in the documentation.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/build-system.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 0f636d620e..bfa5250802 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -250,7 +250,7 @@ Target-dependent emulator sourcesets:
   Each emulator also includes sources for files in the ``hw/`` and ``target/``
   subdirectories.  The subdirectory used for each emulator comes
   from the target's definition of ``TARGET_BASE_ARCH`` or (if missing)
-  ``TARGET_ARCH``, as found in ``default-configs/targets/*.mak``.
+  ``TARGET_ARCH``, as found in ``configs/targets/*.mak``.
 
   Each subdirectory in ``hw/`` adds one sourceset to the ``hw_arch`` dictionary,
   for example::
@@ -307,8 +307,8 @@ Utility sourcesets:
 The following files concur in the definition of which files are linked
 into each emulator:
 
-``default-configs/devices/*.mak``
-  The files under ``default-configs/devices/`` control the boards and devices
+``configs/devices/*.mak``
+  The files under ``configs/devices/`` control the boards and devices
   that are built into each QEMU system emulation targets. They merely contain
   a list of config variable definitions such as::
 
@@ -317,11 +317,11 @@ into each emulator:
     CONFIG_XLNX_VERSAL=y
 
 ``*/Kconfig``
-  These files are processed together with ``default-configs/devices/*.mak`` and
+  These files are processed together with ``configs/devices/*.mak`` and
   describe the dependencies between various features, subsystems and
   device models.  They are described in :ref:`kconfig`
 
-``default-configs/targets/*.mak``
+``configs/targets/*.mak``
   These files mostly define symbols that appear in the ``*-config-target.h``
   file for each emulator [#cfgtarget]_.  However, the ``TARGET_ARCH``
   and ``TARGET_BASE_ARCH`` will also be used to select the ``hw/`` and
@@ -460,7 +460,7 @@ Built by Meson:
   TARGET-NAME is again the name of a system or userspace emulator. The
   config-devices.mak file is automatically generated by make using the
   scripts/make_device_config.sh program, feeding it the
-  default-configs/$TARGET-NAME file as input.
+  configs/$TARGET-NAME file as input.
 
 ``config-host.h``, ``$TARGET-NAME/config-target.h``, ``$TARGET-NAME/config-devices.h``
   These files are used by source code to determine what features
-- 
2.31.1



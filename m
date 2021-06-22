Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72DA3B055F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:58:40 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfzE-0002Tp-0H
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfs8-0006gV-8l
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfs6-0000o4-F3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvLw3SbuvQA16tuo6Rds5lR1x2bQ+DzvIvDpSKIhSEY=;
 b=FPKJkr7YDBQGvspOoV4XWGYQaMFMJWUAI9rvDnrwrUUyN2AMfc8474lA0NOoTaB3DniN+h
 lOhGSjNvfsHPVRfhV09jvpZlZEU8kkt9nqemfZJy9uBS3HxP68Oy/QRO6opUJBD1aPHOgS
 uqgdWJ4XUaYX5/mNoUvoI3E1WLPPnUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Ql2xiLfwNdGH_p4JN7noQQ-1; Tue, 22 Jun 2021 08:51:16 -0400
X-MC-Unique: Ql2xiLfwNdGH_p4JN7noQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8E8F100C610
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:51:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C7805D9F0;
 Tue, 22 Jun 2021 12:51:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFEE81800840; Tue, 22 Jun 2021 14:51:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] modules: add documentation for module sourcesets
Date: Tue, 22 Jun 2021 14:51:07 +0200
Message-Id: <20210622125110.262843-2-kraxel@redhat.com>
In-Reply-To: <20210622125110.262843-1-kraxel@redhat.com>
References: <20210622125110.262843-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 docs/devel/build-system.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7ef36f42d0f5..fd1650442ecc 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -272,6 +272,23 @@ Target-dependent emulator sourcesets:
     target_arch += {'arm': arm_ss}
     target_softmmu_arch += {'arm': arm_softmmu_ss}
 
+Module sourcesets:
+  There are two dictionaries for modules: `modules` is used for
+  target-independent modules and `target_modules` is used for
+  target-dependent modules.  When modules are disabled the `module`
+  source sets are added to `softmmu_ss` and the `target_modules`
+  source sets are added to `specific_ss`.
+
+  Both dictionaries are nested.  One dictionary is created per
+  subdirectory, and these per-subdirectory dictionaries are added to
+  the toplevel dictionaries.  For example::
+
+    hw_display_modules = {}
+    qxl_ss = ss.source_set()
+    ...
+    hw_display_modules += { 'qxl': qxl_ss }
+    modules += { 'hw-display': hw_display_modules }
+
 Utility sourcesets:
   All binaries link with a static library `libqemuutil.a`.  This library
   is built from several sourcesets; most of them however host generated
-- 
2.31.1



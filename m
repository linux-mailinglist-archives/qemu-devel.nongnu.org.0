Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136C491098
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:18:42 +0100 (CET)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9XWa-0002PX-3u
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9XVK-0001gI-Kb
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9XVI-0001wv-24
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642447038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g1nYmCiMoqS9+/ICWXP2Jv6JUMNSIxgZ0DK7WrDV3Yg=;
 b=W7tWwT8tUIkEhQnfO6ZHbTbbXrDnwGenxmW2nQv89AhOVeIbL/KvIQXnRU2e9GBOAcSlIf
 7gXZl0z77DZVWG09+ww655bLK8FzqJxKerKtk30NUNrbpDCmQ/SRtVX10kgKRJXAmMaZpG
 kis9EfQkXVhA0ZyXazu91nzyPhPWAmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-_ClZFaU2PBqZguCafAdqrw-1; Mon, 17 Jan 2022 14:17:13 -0500
X-MC-Unique: _ClZFaU2PBqZguCafAdqrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9690C1083F64;
 Mon, 17 Jan 2022 19:17:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C2245DB81;
 Mon, 17 Jan 2022 19:16:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/pc_piix: Mark the machine types from version 1.4 to
 1.7 as deprecated
Date: Mon, 17 Jan 2022 20:16:39 +0100
Message-Id: <20220117191639.278497-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list of machine types grows larger and larger each release ... and
it is unlikely that many people still use the very old ones for live
migration. QEMU v1.7 has been released more than 8 years ago, so most
people should have updated their machines to a newer version in those
8 years at least once. Thus let's mark the very old 1.x machine types
as deprecated now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 8 ++++++++
 hw/i386/pc_piix.c         | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e21e07478f..652a4d43b6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -318,6 +318,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
 been implemented), so there is not much value added by this board. Use the
 ``ref405ep`` machine instead.
 
+``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+These old machine types are quite neglected nowadays and thus might have
+various pitfalls with regards to live migration. Use a newer machine type
+instead.
+
+
 Backend options
 ---------------
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d9b344248d..84f3633223 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -757,6 +757,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
     m->hw_version = "1.7.0";
     m->default_machine_opts = NULL;
     m->option_rom_has_mr = true;
+    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
     pcmc->smbios_defaults = false;
     pcmc->gigabyte_align = false;
-- 
2.27.0



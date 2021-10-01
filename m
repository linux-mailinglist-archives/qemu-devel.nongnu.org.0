Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A941ED45
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:22:32 +0200 (CEST)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWHYd-0004Hx-Jp
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWHW6-0001sn-Ut
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWHW5-0004bY-6A
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633090792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=up8VLH2SC1OBnMuEVn2fQuqpybOBoZUqysqzUYrph94=;
 b=YuZNX3CmqjfdSl+i5yImqMuNNXJewaVa5jVRC6GztIbECUhUP6UGInEt+7O6YDIIhhMRA+
 1tLu0oWmPl/x6G+RLH5aVZ4HItzzq4Nv9OoiEQDxanJ/G5rrVvJcUkKy7i7zm80EZqHHOX
 hDQiB0INknhJw/hIPUILQA2k2Z2nTpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-TmDHtylfPG-VlK-rIZtf-Q-1; Fri, 01 Oct 2021 08:19:49 -0400
X-MC-Unique: TmDHtylfPG-VlK-rIZtf-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ED9310B746B;
 Fri,  1 Oct 2021 12:19:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD2F5F4E0;
 Fri,  1 Oct 2021 12:19:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and the 405
 CPU models
Date: Fri,  1 Oct 2021 14:19:43 +0200
Message-Id: <20211001121943.1016447-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These machines need a firmware image called 'ppc405_rom.bin', and nobody
seems to have such a firmware image left for testing, so the machines are
currently unusable. There used to be support in U-Boot, but it has been
removed a couple of year ago already.
Thus let's mark these boards and the 405 CPU as deprecated now, so that we
could remove them in a couple of releases (unless somebody speaks up and
says that these are still usefull for them).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 15 +++++++++++++++
 hw/ppc/ppc405_boards.c    |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2f7db9a98d..27c03ef624 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
+PPC 405 CPU models (since 6.2)
+''''''''''''''''''''''''''''''
+
+The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
+
 
 QEMU API (QAPI) events
 ----------------------
@@ -258,6 +263,16 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
 machines. It can be easily replaced by the ``witherspoon-bmc`` or the
 ``romulus-bmc`` machines.
 
+``ref405ep`` and ``taihu`` machines (since 6.2)
+'''''''''''''''''''''''''''''''''''''''''''''''
+
+These machines need a firmware image called 'ppc405_rom.bin', and nobody seems
+to have a working copy of such a firmware image anymore. `Support in U-Boot
+<https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdfdba62c069>`__
+has been removed a couple of years ago, too, so it is very unlikely that
+anybody is still using this code at all.
+
+
 Backend options
 ---------------
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 972a7a4a3e..1578c0dac8 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -317,6 +317,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
     mc->init = ref405ep_init;
     mc->default_ram_size = 0x08000000;
     mc->default_ram_id = "ef405ep.ram";
+    mc->deprecation_reason = "ppc405 CPU is deprecated";
 }
 
 static const TypeInfo ref405ep_type = {
@@ -547,6 +548,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
     mc->init = taihu_405ep_init;
     mc->default_ram_size = 0x08000000;
     mc->default_ram_id = "taihu_405ep.ram";
+    mc->deprecation_reason = "ppc405 CPU is deprecated";
 }
 
 static const TypeInfo taihu_type = {
-- 
2.27.0



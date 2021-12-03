Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4F467BDA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 17:54:51 +0100 (CET)
Received: from localhost ([::1]:55006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtBpi-0004s4-Lq
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 11:54:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mtBkO-00005Y-F6
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 11:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mtBkM-0003Lm-2R
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 11:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638550157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Aa6Mqiar31w792bWI+2bdnxhd0jOzZtTDrBiC4cQ0g=;
 b=DrNHs+nFv2FEu+u7lx0sqncy9a5aL+i/LhOdLFhuvfCB7ojSDnUuA/4e76dr44rWa8x3Nv
 qPM0OoZPmwigGVpwwVx59ibj6dqgSaX/XKMGEqaPgHaAbFvrPvG1eWlY3nmdVSD6ix6FeP
 z9YxlPH8Evgt0iQwuVCOBy+ZexvyKeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-lcoOMnubPc-6K8Njb99p3Q-1; Fri, 03 Dec 2021 11:49:14 -0500
X-MC-Unique: lcoOMnubPc-6K8Njb99p3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B638042E1;
 Fri,  3 Dec 2021 16:49:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 214204ABAD;
 Fri,  3 Dec 2021 16:49:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH for-7.0] ppc: Mark the 'taihu' machine as deprecated
Date: Fri,  3 Dec 2021 17:49:04 +0100
Message-Id: <20211203164904.290954-2-thuth@redhat.com>
In-Reply-To: <20211203164904.290954-1-thuth@redhat.com>
References: <20211203164904.290954-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 christophe.leroy@csgroup.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
except for some external periphery. However, the periphery of the 'taihu'
machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
been implemented), so there is not much value added by this board. The users
can use the 'ref405ep' machine to test their PPC405 code instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 hw/ppc/ppc405_boards.c    | 1 +
 2 files changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff7488cb63..5693abb663 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -315,6 +315,15 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
 machines. It can be easily replaced by the ``witherspoon-bmc`` or the
 ``romulus-bmc`` machines.
 
+PPC 405 ``taihu`` machine (since 7.0)
+'''''''''''''''''''''''''''''''''''''
+
+The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
+except for some external periphery. However, the periphery of the ``taihu``
+machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
+been implemented), so there is not much value added by this board. Use the
+``ref405ep`` machine instead.
+
 Backend options
 ---------------
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 972a7a4a3e..ff6a6d26b4 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -547,6 +547,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
     mc->init = taihu_405ep_init;
     mc->default_ram_size = 0x08000000;
     mc->default_ram_id = "taihu_405ep.ram";
+    mc->deprecation_reason = "incomplete, use 'ref405ep' instead";
 }
 
 static const TypeInfo taihu_type = {
-- 
2.27.0



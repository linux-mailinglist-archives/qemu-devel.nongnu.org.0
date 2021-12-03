Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FA467BD5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 17:52:04 +0100 (CET)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtBn0-0001rm-Ni
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 11:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mtBkO-0008Ue-7h
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 11:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mtBkJ-0003LX-8i
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 11:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638550153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6Aa6Mqiar31w792bWI+2bdnxhd0jOzZtTDrBiC4cQ0g=;
 b=YXedhaPedYkMgK8S4Nm7C/FsYYniY5ZzzsYQdL4lbDti3UlJXPEq4T5t+nZsYHTVg7Gm5R
 jOg6W4YdjQna2OH/jgB5HU1y2DWnNNk6uuC8wo4kci9c2LG2AKiJ/s9K3Nsfie7v1aTmr9
 lC6nU2UvWySoe16+7CtkwnRQeQW7wsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-M572U5BPOmGU4AmacIYvLw-1; Fri, 03 Dec 2021 11:49:11 -0500
X-MC-Unique: M572U5BPOmGU4AmacIYvLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B51100E320;
 Fri,  3 Dec 2021 16:49:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7473694D8;
 Fri,  3 Dec 2021 16:49:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH for-7.0] ppc: Mark the 'taihu' machine as deprecated
Date: Fri,  3 Dec 2021 17:49:03 +0100
Message-Id: <20211203164904.290954-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



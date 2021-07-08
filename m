Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552183C16FC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:19:55 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wkk-0001Jq-BU
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1W9e-0000m4-EF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1W9a-0006oi-IX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625758888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zOBNpigpLnWP3O2v2w4cNMSZ5M4XQXyPjBmr4slvVT4=;
 b=GoaMeceZ9tAUmWSFIdo2XjhoUR4Ve/OLuAT9+QuIJ4lgLh5toow86kIVTpSPRlFErMMPBC
 9f7FFMd3MpBK4J6BPDC98iNaPbLRkUVXbRMyoMoylSdhX8gaNSfrRqqsPvTBIH1XkyLVyU
 z2dm72l2tguG0FKjD3cy2cczkFT6yHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-5qoRUsoOMaSybHtaPSzsCw-1; Thu, 08 Jul 2021 11:41:27 -0400
X-MC-Unique: 5qoRUsoOMaSybHtaPSzsCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90044A40CB
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:41:26 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A1A41970F;
 Thu,  8 Jul 2021 15:41:26 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] contrib: add udev qemu-guest-agent.rules
Date: Thu,  8 Jul 2021 11:40:33 -0400
Message-Id: <316d1414d0af33f22fff24d16ad953629e7416bb.1625758833.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fedora/RHEL and Debian have shipped an identical file for years.
This pairs with contrib/systemd/qemu-guest-agent.service

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 contrib/systemd/qemu-guest-agent.rules | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 contrib/systemd/qemu-guest-agent.rules

diff --git a/contrib/systemd/qemu-guest-agent.rules b/contrib/systemd/qemu-guest-agent.rules
new file mode 100644
index 0000000000..8a290abbd3
--- /dev/null
+++ b/contrib/systemd/qemu-guest-agent.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=="virtio-ports", ATTR{name}=="org.qemu.guest_agent.0", \
+  TAG+="systemd" ENV{SYSTEMD_WANTS}="qemu-guest-agent.service"
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F928F2C2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 14:55:30 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT2n3-0007GX-Kg
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 08:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kT2lM-0005aX-Sx
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 08:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kT2lK-0002fJ-07
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 08:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602766421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4dNclkqEicoKOn2WwV702+BoC79jqGlyW9fXc1mazY=;
 b=Y8uK5ksZFSzf2k6X/2bSNQl4hET5FeO4HRry+KNk2o5B41ugGAKlaFiVyKR9YalN9PNCiR
 67EHg0CYIby6YfM/5YlZ8LNexzc5NpzaFWh7urGo0ovYnzQOxl/nn51LMWTAyP6g3XvFlL
 AFw5AA7sz+4MOR6lTH8sA9D71ya3i1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-zwBua5tcPCuY_QZPUX8hCA-1; Thu, 15 Oct 2020 08:53:39 -0400
X-MC-Unique: zwBua5tcPCuY_QZPUX8hCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E54D58D5CA6
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 12:53:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A52C46EF68;
 Thu, 15 Oct 2020 12:53:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C10829D5A; Thu, 15 Oct 2020 14:53:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] chardev/spice: make qemu_chr_open_spice_port static
Date: Thu, 15 Oct 2020 14:53:18 +0200
Message-Id: <20201015125322.23648-5-kraxel@redhat.com>
In-Reply-To: <20201015125322.23648-1-kraxel@redhat.com>
References: <20201015125322.23648-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201014121120.13482-4-kraxel@redhat.com
---
 include/chardev/spice.h | 3 ---
 chardev/spice.c         | 8 ++++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/chardev/spice.h b/include/chardev/spice.h
index 99f26aedde54..1115502cdfbd 100644
--- a/include/chardev/spice.h
+++ b/include/chardev/spice.h
@@ -24,7 +24,4 @@ typedef struct SpiceChardev SpiceChardev;
 DECLARE_INSTANCE_CHECKER(SpiceChardev, SPICE_CHARDEV,
                          TYPE_CHARDEV_SPICE)
 
-void qemu_chr_open_spice_port(Chardev *chr, ChardevBackend *backend,
-                              bool *be_opened, Error **errp);
-
 #endif
diff --git a/chardev/spice.c b/chardev/spice.c
index bf7ea1e2940d..051c23a84f4c 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -296,10 +296,10 @@ static void qemu_chr_open_spice_vmc(Chardev *chr,
     chr_open(chr, type);
 }
 
-void qemu_chr_open_spice_port(Chardev *chr,
-                              ChardevBackend *backend,
-                              bool *be_opened,
-                              Error **errp)
+static void qemu_chr_open_spice_port(Chardev *chr,
+                                     ChardevBackend *backend,
+                                     bool *be_opened,
+                                     Error **errp)
 {
     ChardevSpicePort *spiceport = backend->u.spiceport.data;
     const char *name = spiceport->fqdn;
-- 
2.27.0



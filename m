Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637992957C4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 07:16:39 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVSxq-0000NG-BQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 01:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVSu9-0003mm-3U
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 01:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVStv-0003wJ-BB
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 01:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603343554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLDKr3bJJcW7BQ8I0BkGaifRf+4XyADj4mdQgXyXSzQ=;
 b=KUObFf4+d6+Wc0a/F+D4+ITAr+08/mKA+0E+AdxhPl8HymLykEmhVG7uHUNX521ItUTFoF
 H1QOgWNuGyVXqVb4pPIJeTdbUsGBU8yODRpAEqn9J2owLLBRwlRPWmjmo98RG8VDbawIVU
 RH/RdP7o3fGOzH9CyRRM9IIfXh2khjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-BTJxZpHPMHKX3CnfcQhyrg-1; Thu, 22 Oct 2020 01:12:32 -0400
X-MC-Unique: BTJxZpHPMHKX3CnfcQhyrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979BB1006CA3
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 05:12:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2D760C47;
 Thu, 22 Oct 2020 05:12:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F3762204A6; Thu, 22 Oct 2020 07:12:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] modules: add spice dependencies
Date: Thu, 22 Oct 2020 07:12:20 +0200
Message-Id: <20201022051223.6181-12-kraxel@redhat.com>
In-Reply-To: <20201022051223.6181-1-kraxel@redhat.com>
References: <20201022051223.6181-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 00:54:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20201019075224.14803-12-kraxel@redhat.com
---
 util/module.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/util/module.c b/util/module.c
index 0c0f258923dc..21237dcc24df 100644
--- a/util/module.c
+++ b/util/module.c
@@ -176,6 +176,11 @@ static const struct {
     const char *name;
     const char *dep;
 } module_deps[] = {
+    { "audio-spice",    "ui-spice-core" },
+    { "chardev-spice",  "ui-spice-core" },
+    { "hw-display-qxl", "ui-spice-core" },
+    { "ui-spice-app",   "ui-spice-core" },
+    { "ui-spice-app",   "chardev-spice" },
 };
 #endif
 
-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02929AD48
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:27:50 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXP0v-0000ZB-8W
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kXOuC-0002fP-K9
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kXOuA-00064C-Rt
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603804849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtGA4fB0Uh4M77L9aBmff1MO0jLsn+opE5vMzIZ6GWY=;
 b=NfmwQ0A9bFt+f+q+mAv5gE4vniL7lV89nBBhKoZ7r1znR7yhWmMkYQZvA42G5i6b2hZNUb
 2gr1G3QDj8EktUr3CaRsRr4/qNrf2C1z6+hPEmqykl7IU/Tbd6qkqjA9OxVP5T6FBqIxy4
 rIOCIXaLRi4lrRzoV8HMjyb1xbS0Jug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-pcZPuxuGPIyk4k6cvSy6AQ-1; Tue, 27 Oct 2020 09:20:48 -0400
X-MC-Unique: pcZPuxuGPIyk4k6cvSy6AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 387561084D6B
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 13:20:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-46.ams2.redhat.com
 [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 036691972B;
 Tue, 27 Oct 2020 13:20:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v2 07/16] Compress the two front page headings into
 one
Date: Tue, 27 Oct 2020 13:20:06 +0000
Message-Id: <20201027132015.621733-8-berrange@redhat.com>
In-Reply-To: <20201027132015.621733-1-berrange@redhat.com>
References: <20201027132015.621733-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current headings are repetative and waste vertical screen real
estate which could hold more useful content.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 index.html | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/index.html b/index.html
index 48304c8..4f01fe9 100644
--- a/index.html
+++ b/index.html
@@ -9,17 +9,13 @@ bxslider: True
 	<div id="header">
 		<div class="container">
 			<h1>QEMU</h1>
-			<span class="tag">the FAST! processor emulator</span>
+			<span class="tag">A generic and open source machine emulator and virtualizer</p>
 		</div>
 	</div>
 	
 <!-- Featured -->
 <div id="featured">
 	<div class="container">
-		<header>
-			<h2>What is QEMU?</h2>
-			<p>QEMU is a generic and open source machine emulator and virtualizer.</p>
-		</header>
 		<div class="row slider screenshots">
 			{% include screenshot.html %}
 		</div>
-- 
2.26.2



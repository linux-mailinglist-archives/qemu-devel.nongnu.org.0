Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6C4039EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:31:47 +0200 (CEST)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwjx-0002Pn-R6
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgg-0007xb-JL
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwge-0003ry-1g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCkcgora/0NL9ccAVo59R2XwJxeFjYxulCVQ/SXufBM=;
 b=NahxPjqg6tYRGM9gIZXXliSlQDEKXmXyb8sMGDIO99wIQ5ehPdhJzDsuT1GWdRH2uikYFd
 qxXwrNtHbasEiDNGRwSZLcXMt1x35ga5ndgmpfxDNMllqsaVT2KOq9jopTRKtYn/10p3Mz
 T6IyXQoqUwr+FW5JK035foy0lzbf4r4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527--yLSzC-ONnSPmo0RwLPHig-1; Wed, 08 Sep 2021 08:28:18 -0400
X-MC-Unique: -yLSzC-ONnSPmo0RwLPHig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD7C100C66D
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6353A60C04;
 Wed,  8 Sep 2021 12:28:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 1/6] Compress the two front page headings into one
Date: Wed,  8 Sep 2021 13:28:09 +0100
Message-Id: <20210908122814.707744-2-berrange@redhat.com>
In-Reply-To: <20210908122814.707744-1-berrange@redhat.com>
References: <20210908122814.707744-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
index e52868d..ad7624f 100644
--- a/index.html
+++ b/index.html
@@ -8,17 +8,13 @@ colorbox: True
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
 		<div class="row">
 			<section class="4u">
 				<div class="pennant">{% include screenshot.html offset=0 limit=1 %}</div>
-- 
2.31.1



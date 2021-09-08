Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD0403A02
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:37:31 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwpW-0008Fi-7W
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgn-0008EM-OE
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgl-0003ws-7b
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QY9rC3PcAWzbR5CPpueYu4zj9M6odjIyZstjoOaHu0w=;
 b=GE9WJvoy3J/VG99Qw768vowBr/km3Yo3dCxhsAJsGJrN6eWgfrZ3LFQLGdJ+aCI+hgYu54
 HWxM5ayVJ4Ua9+YtaKCwW6M4sEh16hqv+yaCeaSefE99Iiaq+i6eSE7JVQyWDLh4EdLILf
 rMHKaYqMM9XG8Lk3ZT+/9JMzxozgSVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-z4Gt5tkxO5qyKWeuPGlQbQ-1; Wed, 08 Sep 2021 08:28:22 -0400
X-MC-Unique: z4Gt5tkxO5qyKWeuPGlQbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11E601927804
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C29D60C04;
 Wed,  8 Sep 2021 12:28:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 3/6] Put a full SFC membership blurb in footer of
 every page
Date: Wed,  8 Sep 2021 13:28:11 +0100
Message-Id: <20210908122814.707744-4-berrange@redhat.com>
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 _includes/footer.html | 4 +++-
 assets/css/style.css  | 6 +++++-
 index.html            | 2 --
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/_includes/footer.html b/_includes/footer.html
index 6e1b247..411ff55 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -3,7 +3,6 @@
 		<ul class="style">
 			<li><a href="{{ relative_root }}/">Home</a></li>
 			<li><a href="{{ relative_root }}/download">Download</a></li>
-			<li><a href="{{ relative_root }}/conservancy/">Conservancy / Committee</a></li>
 			<li><a href="http://qemu-advent-calendar.org">QEMU advent calendar</a></li>
 		</ul>
 		<ul class="style">
@@ -27,6 +26,9 @@
 			<li><a href="https://xenproject.org">Xen</a></li>
 		</ul>
 	</div>
+	<div id="conservancy">
+		QEMU is a member of <a href="{{ relative_root }}/conservancy/">Software Freedom Conservancy</a>
+	</div>
 	<div id="licenses">
 		<a href="{{ relative_root }}/license.html">Website licenses</a>
 	</div>
diff --git a/assets/css/style.css b/assets/css/style.css
index 9daa18b..0b4e043 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -525,7 +525,7 @@
 		margin: 0
 	}
 
-	#licenses {
+	#licenses, #conservancy {
 		padding: 0em;
 		padding-left: 1em;
 		padding-right: 1em;
@@ -540,6 +540,10 @@
 		float: right;
 	}
 
+	#conservancy {
+		float: left;
+	}
+
 /*********************************************************************************/
 /* Featured                                                                      */
 /*********************************************************************************/
diff --git a/index.html b/index.html
index ad7624f..d72750c 100644
--- a/index.html
+++ b/index.html
@@ -58,8 +58,6 @@ $('.colorbox').on("click.random-namespace", function() {
 </script>
 
 		</div>
-		<hr>
-		<p>QEMU is a member of <a href="{{ relative_root }}/conservancy/">Software Freedom Conservancy</a>.</p>
 	</div>
 </div>
 
-- 
2.31.1



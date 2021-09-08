Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04294403A0A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:39:55 +0200 (CEST)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwrp-0003P9-UT
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgp-0008Fa-Jh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgn-0003yS-Ea
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xwa6ZWGtkxu8PcjPIsbEKu+ruKdCbDdEcL92WfVXJr8=;
 b=G7QZ1U96TNh4KmSuJ50a6caMeB91jyAB958MxOyl9B3N8TRh9nVEVyLTvIuUBGUYhlroKQ
 JsOyCG/WeU+QktWgFfzvJDwPEF5znq1Q4fdsp9jRNaApISi0ATYWddfo9GrlJBIPnTQob1
 1AS9kqRTUOMqMCnnHrVv57BwQKqcXPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-zUrbN8SHMfyAy7-pSreksg-1; Wed, 08 Sep 2021 08:28:26 -0400
X-MC-Unique: zUrbN8SHMfyAy7-pSreksg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA841927802
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:25 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E14EE60C04;
 Wed,  8 Sep 2021 12:28:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 6/6] Add link to "page source" for all pages
Date: Wed,  8 Sep 2021 13:28:14 +0100
Message-Id: <20210908122814.707744-7-berrange@redhat.com>
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

The link takes the user directly to the source markdown file in gitlab.
This gives them guidance as to what file should be editted to make
changes to the content. The link text is replaced by an icon in normal
rendering.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 _includes/footer.html       |   3 +++
 assets/css/style.css        |  13 +++++++++++--
 assets/images/edit-page.png | Bin 0 -> 4997 bytes
 3 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 assets/images/edit-page.png

diff --git a/_includes/footer.html b/_includes/footer.html
index 5adc569..1a0b960 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -9,6 +9,9 @@
 			<li><a href="https://xenproject.org">Xen</a></li>
 		</ul>
 	</div>
+	<div id="edit-page">
+		<a href="https://gitlab.com/qemu-project/qemu-web/-/blob/master/{{page.path}}">page source</a>
+	</div>
 	<div id="conservancy">
 		QEMU is a member of <a href="{{ relative_root }}/conservancy/">Software Freedom Conservancy</a>
 	</div>
diff --git a/assets/css/style.css b/assets/css/style.css
index 37bd333..88f7e85 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -533,7 +533,7 @@
 		padding-left: 1em;
 	}
 
-	#licenses, #conservancy {
+	#licenses, #conservancy, #edit-page {
 		padding: 0em;
 		padding-left: 1em;
 		padding-right: 1em;
@@ -544,7 +544,7 @@
 		margin-top: 1em;
 	}
 
-	#licenses {
+	#licenses, #edit-page {
 		float: right;
 	}
 
@@ -552,6 +552,15 @@
 		float: left;
 	}
 
+	#edit-page a {
+		overflow: hidden;
+		background: url(../images/edit-page.png);
+		display: inline-block;
+		width: 24px;
+		height: 24px;
+		padding-left: 24px;
+	}
+
 /*********************************************************************************/
 /* Featured                                                                      */
 /*********************************************************************************/
diff --git a/assets/images/edit-page.png b/assets/images/edit-page.png
new file mode 100644
index 0000000000000000000000000000000000000000..63fb4a4b1137a0a0b509dc38d3ecc687c55f6b5f
GIT binary patch
literal 4997
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
Us^(_S2gGA|bHaj3W`CRZUxr_T9{>OV

literal 0
HcmV?d00001

-- 
2.31.1



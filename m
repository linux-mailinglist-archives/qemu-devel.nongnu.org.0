Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D6403A19
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:44:09 +0200 (CEST)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwvw-0002ib-Q2
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgq-0008HS-Po
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgn-0003yX-FO
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADylx2g0aulK7LWneUJqd3o+kSVsKDuWqSL3Tuw9cFk=;
 b=A4eozLJlfzilFAG6Ygv9UgANItzRVc6Ib4djksjw5jYL9Cbiq1atg87HEzRupZDpABPqF8
 c/+dCgDOOzf7lMiG/RqlIjBCSSxd0qZlWErfOQe8ugXfeLpgxJDUEtePrknTZgb4NbeD4D
 rJgU+LiI2PELjL5c0UX5yxCFyRGB4z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-4fxTOd3-PcW0AhBfSKc2uw-1; Wed, 08 Sep 2021 08:28:25 -0400
X-MC-Unique: 4fxTOd3-PcW0AhBfSKc2uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D09100C663
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C1A60C4A;
 Wed,  8 Sep 2021 12:28:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 5/6] Simplify and restructure the page footer
Date: Wed,  8 Sep 2021 13:28:13 +0100
Message-Id: <20210908122814.707744-6-berrange@redhat.com>
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

The footer is not an effective place to locate frequently needed site
navigation links. Some of the links are already present in the top
navigation bar, while others are just one jump away on the subsequent
page in a fairly obvious place.

This removes all the local site navigation links from the footer and
leaves it as a place for external project links, along with the website
license and SFC information.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 _includes/footer.html        | 22 +++-------------------
 assets/css/style-desktop.css | 21 +--------------------
 assets/css/style-mobile.css  | 22 +---------------------
 assets/css/style.css         | 26 +++++++++++++++++---------
 4 files changed, 22 insertions(+), 69 deletions(-)

diff --git a/_includes/footer.html b/_includes/footer.html
index 6e5bef7..5adc569 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -1,24 +1,8 @@
 <div id="footer">
-	<div id="footer-inner">
+	<div id="external-links">
 		<ul class="style">
-			<li><a href="{{ relative_root }}/">Home</a></li>
-			<li><a href="{{ relative_root }}/download">Download</a></li>
-			<li><a href="http://qemu-advent-calendar.org">QEMU advent calendar</a></li>
-		</ul>
-		<ul class="style">
-			<li><a href="{{ relative_root }}/contribute">Contribute</a></li>
-			<li><a href="{{ relative_root }}/contribute/report-a-bug">Reporting a bug</a></li>
-			<li><a href="https://wiki.qemu.org/Documentation/GettingStartedDevelopers">New contributors</a></li>
-			<li><a href="https://wiki.qemu.org/Contribute/SubmitAPatch">Submitting a patch</a></li>
-			<li><a href="https://wiki.qemu.org/Contribute/FAQ">Contributor FAQ</a></li>
-		</ul>
-		<ul class="style">
-			<li><a href="{{ relative_root }}/documentation">Documentation</a></li>
-			<li><a href="https://www.qemu.org/docs/master/">Main docs</a></li>
-			<li><a href="https://wiki.qemu.org/Category:Developer_documentation">Developer docs</a></li>
-		</ul>
-		<ul class="style">
-			<li><a href="https://planet.virt-tools.org/">virt tools planet</a></li>
+			<li><a href="http://qemu-advent-calendar.org">Advent calendar</a></li>
+			<li><a href="https://planet.virt-tools.org/">Blog planet</a></li>
 			<li><a href="https://www.linux-kvm.org/">KVM</a></li>
 			<li><a href="http://libguestfs.org/">Libguestfs</a></li>
 			<li><a href="https://libvirt.org/">Libvirt</a></li>
diff --git a/assets/css/style-desktop.css b/assets/css/style-desktop.css
index 2beb58d..90a154d 100644
--- a/assets/css/style-desktop.css
+++ b/assets/css/style-desktop.css
@@ -104,26 +104,7 @@
 
 	#footer
 	{
-		padding: 1em 0em;
-	}
-
-	#footer-inner
-	{
-		width: 95%;
-		display: table;
-		margin: auto;
-	}
-
-	#footer ul
-	{
-		width: 25%;
-		display: table-cell;
-		padding-left: 2em;
-	}
-
-	#footer ul:first-child
-	{
-		padding-left: 0px;
+		clear: both;
 	}
 
 /*********************************************************************************/
diff --git a/assets/css/style-mobile.css b/assets/css/style-mobile.css
index 213a3fb..5c9d11b 100644
--- a/assets/css/style-mobile.css
+++ b/assets/css/style-mobile.css
@@ -242,7 +242,7 @@
 /* Columns                                                                       */
 /*********************************************************************************/
 
-	#main, #footer-inner
+	#main
 	{
 		margin-left: 0%;
 		width: 100%;
@@ -277,26 +277,6 @@
 		font-size: 1.6em;
 	}
 
-/*********************************************************************************/
-/* Footer                                                                        */
-/*********************************************************************************/
-
-	#footer
-	{
-		padding: 1em;
-	}
-
-	#footer ul
-	{
-		padding: 0.6em 0px;
-		border-top: 1px solid white;
-	}
-
-	#footer ul:first-child
-	{
-		border-top: 0px;
-	}
-
 /*********************************************************************************/
 /* Featured                                                                      */
 /*********************************************************************************/
diff --git a/assets/css/style.css b/assets/css/style.css
index 0b4e043..37bd333 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -504,9 +504,6 @@
 	#footer
 	{
 		position: relative;
-		clear: left;
-		background: #401200;
-		color: #FFF;
 	}
 
 	#footer a
@@ -516,13 +513,24 @@
 
 	#footer ul
 	{
-		vertical-align: top;
+		margin: 0em;
 	}
 
-	#footer ul, #footer ul > li
-	{
-		padding: 0;
-		margin: 0
+	#external-links {
+		padding: 0em;
+		padding-top: 0.3em;
+		padding-bottom: 0.3em;
+		background: #401200;
+		color: #FFF;
+		text-align: center;
+	}
+
+	#external-links li {
+		display: inline;
+	}
+
+	#external-links li a {
+		padding-left: 1em;
 	}
 
 	#licenses, #conservancy {
@@ -533,7 +541,7 @@
 		color: #401200;
 		background: #fff;
 		margin: 1em;
-		margin-top: 2em;
+		margin-top: 1em;
 	}
 
 	#licenses {
-- 
2.31.1



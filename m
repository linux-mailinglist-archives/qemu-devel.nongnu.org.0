Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686329AD34
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:24:35 +0100 (CET)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXOxm-0005MK-1N
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kXOts-0002B8-6L
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kXOtp-0005v9-U4
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603804829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BL7gmCgKBlCSyQFWEkHmJlJ29WDBhZXlsfjEkz5skYc=;
 b=iL66QsqKuD8uZ+l0K+EGJq4KagFRQRa1qzN9FJMOmffdrEasFrm4ZOH3OLIsyUMITsg1Ap
 c8UBTmKcRfW7+HIs4DL5apXF6Y2wqTA5R3ZxyuHiqalBHTrG/GrJm32tgO+roksI8MHqMb
 ji94Ot4Qdt+oMOxsF7e0jmzeqRazahg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-r0VNVqCxO4OHNGfDR2hDyA-1; Tue, 27 Oct 2020 09:20:26 -0400
X-MC-Unique: r0VNVqCxO4OHNGfDR2hDyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 571A69CC06
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 13:20:25 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-46.ams2.redhat.com
 [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8BC196FD;
 Tue, 27 Oct 2020 13:20:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v2 04/16] Make page header nav narrower
Date: Tue, 27 Oct 2020 13:20:03 +0000
Message-Id: <20201027132015.621733-5-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

When the browser window is narrow, but not yet switched into the mobile
layout, the page header nav will line wrap. This breaks layout
assumptions resulting in overlapping/obscured text.

This deals with the probem by reducing padding between the links, and
shortening "Documentation" to just "Docs".

This avoids the line wrapping, as well as making room for new links in
the future.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 _includes/nav.html           | 2 +-
 assets/css/style-desktop.css | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/_includes/nav.html b/_includes/nav.html
index 58b6c5a..c66ee92 100644
--- a/_includes/nav.html
+++ b/_includes/nav.html
@@ -6,7 +6,7 @@
 			</li><li {% if current[1] == 'download' %}class='current'{% endif %}><a href="{{ relative_root }}/download">Download</a>
 			</li><li {% if current[1] == 'support' %}class='current'{% endif %}><a href="{{ relative_root }}/support">Support</a>
 			</li><li {% if current[1] == 'contribute' %}class='current'{% endif %}><a href="{{ relative_root }}/contribute">Contribute</a>
-			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Documentation</a>
+			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Docs</a>
 			</li><li {% if current[1] == 'blog' %}class='current'{% endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
 		</ul>
 	</nav>
diff --git a/assets/css/style-desktop.css b/assets/css/style-desktop.css
index ce58fe2..b7e403a 100644
--- a/assets/css/style-desktop.css
+++ b/assets/css/style-desktop.css
@@ -237,13 +237,14 @@
 		{
 			text-align: right;
 			margin: 0;
+			padding: 0;
 		}
 
 		#nav > ul > li
 		{
 			display: inline-block;
 			margin: 0;
-			padding: 0.5em 2em 0.5em 0em;
+			padding: 0.5em 1em 0.5em 0em;
 			color: #FFF;
 			letter-spacing: 0.06em;
 			text-transform: uppercase;
-- 
2.26.2



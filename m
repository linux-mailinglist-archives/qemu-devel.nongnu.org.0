Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AB29AD5F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:33:19 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXP6E-00076X-11
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kXOuY-0003Uy-QP
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kXOuW-0006Ba-Rf
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603804871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuJJtV0HV0jY6SErlLiXm3h//eCym6wSfyPe0w/HlOE=;
 b=aPQdtIT2uURecB7Ze3JkqdSDwWRUFlrOjPu1ofhxp/D9wOSYoamQ+6NbNCIu5sv4no9px8
 VnKts6oZ4uL7DNUZBWjZnoE5UhGlf1nNtF2Th70b94uhyfmxw9qgobA83jtXwem8D4VFO2
 dzskwdmUc30GcIyAvKd+QLMpXLkT4oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-IC393AbQOhS1nj9Eult0WA-1; Tue, 27 Oct 2020 09:21:09 -0400
X-MC-Unique: IC393AbQOhS1nj9Eult0WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DACD610866C1
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 13:21:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-46.ams2.redhat.com
 [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 736191975E;
 Tue, 27 Oct 2020 13:21:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v2 12/16] Add recent blog posts to the front page
 featured content
Date: Tue, 27 Oct 2020 13:20:11 +0000
Message-Id: <20201027132015.621733-13-berrange@redhat.com>
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
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This makes it more likely that visitors will see and follow links to
interesting blogs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 assets/css/style.css |  5 +++++
 index.html           | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/assets/css/style.css b/assets/css/style.css
index 6308084..a9d5b90 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -627,6 +627,11 @@
 		display: block;
 		padding-bottom: 2em;
 	}
+ 
+	#quickstart ul.blogs > li
+	{
+		padding-bottom: 0.5em;
+	}
 
 	#quickstart ul > li > strong
 	{
diff --git a/index.html b/index.html
index be1d210..9b38037 100644
--- a/index.html
+++ b/index.html
@@ -35,6 +35,18 @@ bxslider: True
 			  <span><a href="https://wiki.qemu.org/Contribute/SubmitAPatch">Submitting a patch</a></span>
 			  <span><a href="https://wiki.qemu.org/Contribute/FAQ">Contributor FAQ</a></span>
 			</li>
+
+			<li><strong>Recent posts</strong>
+				<ul class="blogs">
+	{% for post in site.posts offset: 0 limit: 4 %}
+					<li><a href="{{ relative_root }}{{ post.url }}">{{ post.title }}</a><br>
+						<div class="posted">{{ post.date | date_to_string }}{%
+						  if post.last_modified_at %} (Updated {{ post.last_modified_at | date_to_string }}) {%
+						  endif %}{% if post.author %} &mdash; by {{ post.author }}{% endif %}
+					</li>
+	{% endfor %}
+				</ul>
+			</li>
 		</ul>
 	</div>
 </div>
-- 
2.26.2



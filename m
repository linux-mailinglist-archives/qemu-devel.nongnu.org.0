Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2864039F3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:34:25 +0200 (CEST)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwmW-0005dY-Ha
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgq-0008Gu-Fb
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgn-0003ya-FM
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BaPkBFSvrgZFKVIjWZyVK+8+nmODt6IB0q4UYncvjw=;
 b=J4dCqixBepmwkZArKQnjg31A6lVQDao4EcI8vJh/jEy0Fk9l2F5w87GEqtWS68kXT9Dqb4
 6NEVHKwHs/bDBdICQ12YYSN2n9dwe7dNaZjK8kIf3Dmuj89+uujtiXQXc1tNVJdCLzHiku
 lTH0VcQgtUE/fnxPoW17XvsPJHIm+6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-K17_BsuxP8OdWBNzdJ-rTg-1; Wed, 08 Sep 2021 08:28:24 -0400
X-MC-Unique: K17_BsuxP8OdWBNzdJ-rTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55BD5802C80
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B01760C04;
 Wed,  8 Sep 2021 12:28:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 4/6] Move wiki link from footer into the header navbar
Date: Wed,  8 Sep 2021 13:28:12 +0100
Message-Id: <20210908122814.707744-5-berrange@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The wiki is important enough that it should be presented more
prominently in the page header navbar, rather than the footer.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 _includes/footer.html | 1 -
 _includes/nav.html    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/_includes/footer.html b/_includes/footer.html
index 411ff55..6e5bef7 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -16,7 +16,6 @@
 			<li><a href="{{ relative_root }}/documentation">Documentation</a></li>
 			<li><a href="https://www.qemu.org/docs/master/">Main docs</a></li>
 			<li><a href="https://wiki.qemu.org/Category:Developer_documentation">Developer docs</a></li>
-			<li><a href="https://wiki.qemu.org/">Wiki</a></li>
 		</ul>
 		<ul class="style">
 			<li><a href="https://planet.virt-tools.org/">virt tools planet</a></li>
diff --git a/_includes/nav.html b/_includes/nav.html
index c66ee92..73b39b3 100644
--- a/_includes/nav.html
+++ b/_includes/nav.html
@@ -7,6 +7,7 @@
 			</li><li {% if current[1] == 'support' %}class='current'{% endif %}><a href="{{ relative_root }}/support">Support</a>
 			</li><li {% if current[1] == 'contribute' %}class='current'{% endif %}><a href="{{ relative_root }}/contribute">Contribute</a>
 			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Docs</a>
+			</li><li><a href="https://wiki.qemu.org">Wiki</a>
 			</li><li {% if current[1] == 'blog' %}class='current'{% endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
 		</ul>
 	</nav>
-- 
2.31.1



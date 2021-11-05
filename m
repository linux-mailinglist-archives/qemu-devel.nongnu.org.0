Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E044646A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:47:09 +0100 (CET)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizYi-0007Xx-DJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizMF-00087J-5x
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizMD-0002KE-1M
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636119252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uw8lNlRzeT0fJfa5Z4fBeynnvzDhYSxkV0pED0OyFlg=;
 b=jUZnIkw0R1+NhIt2RnSsA+XNoHHG3dTiVQ2Bge2sL2CAq2IHXMlOibgOnv64gsIzyD9AUf
 K58ju1JaeyKy6TePCXG+/b1H+bEjQ7TMfs15Olbq/nxOz3YeJP4T2PhDdQvlFpqBC4abuY
 I6yTxBmBLC3YQLx9cNfVDZZRpenQyqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-9qwC3zCeOfGMEhwER8Czbg-1; Fri, 05 Nov 2021 09:34:11 -0400
X-MC-Unique: 9qwC3zCeOfGMEhwER8Czbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED0BF112B8F9;
 Fri,  5 Nov 2021 13:34:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7A41037F3F;
 Fri,  5 Nov 2021 13:34:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] docs/sphinx: change default role to "any"
Date: Fri,  5 Nov 2021 17:32:22 +0400
Message-Id: <20211105133222.184722-12-marcandre.lureau@redhat.com>
In-Reply-To: <20211105133222.184722-1-marcandre.lureau@redhat.com>
References: <20211105133222.184722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This interprets single-backtick syntax in all of our Sphinx docs as a
cross-reference to *something*, including Python symbols.

From here on out, new uses of `backticks` will cause a build failure if
the target cannot be referenced.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20211004215238.1523082-4-jsnow@redhat.com>
---
 docs/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/conf.py b/docs/conf.py
index 3161b8b127c6..763e7d243448 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -85,6 +85,11 @@
 # The master toctree document.
 master_doc = 'index'
 
+# Interpret `single-backticks` to be a cross-reference to any kind of
+# referenceable object. Unresolvable or ambiguous references will emit a
+# warning at build time.
+default_role = 'any'
+
 # General information about the project.
 project = u'QEMU'
 copyright = u'2021, The QEMU Project Developers'
-- 
2.33.0.721.g106298f7f9



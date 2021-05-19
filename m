Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39953898A1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 23:33:51 +0200 (CEST)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljTp8-0007cW-W4
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 17:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljTne-00058g-DW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljTnc-0004Hv-T1
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621459935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3zSDjZzaY7lBk1gmHWlRgWOajaIswOp+9KZcamyQt4=;
 b=RVeYJFIYP4HsLJlrX+HxwALRpTwvTnmH44sQ0KDE71AcY/uimlLpDozwuWSS+yRvZ96E3P
 5Uu9SzxOiLn3r9mPGNfXSsqPc65If1gaKIXcSmkup5W80wsPi/C7lya7NqSMPyQy2LXaa2
 HH0MaelnfP6NhOHjniLGxec4admOhoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-Wg8l4je3MTSUSFJSiAsnOg-1; Wed, 19 May 2021 17:32:12 -0400
X-MC-Unique: Wg8l4je3MTSUSFJSiAsnOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 493FA180FD61;
 Wed, 19 May 2021 21:32:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41E191009962;
 Wed, 19 May 2021 21:32:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] Gitlab: Add "Feature Request" issue template.
Date: Wed, 19 May 2021 17:32:02 -0400
Message-Id: <20210519213202.3979359-3-jsnow@redhat.com>
In-Reply-To: <20210519213202.3979359-1-jsnow@redhat.com>
References: <20210519213202.3979359-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copied from Peter Krempa's libvirt template, feature.md.

CC: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab/issue_templates/feature_request.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 .gitlab/issue_templates/feature_request.md

diff --git a/.gitlab/issue_templates/feature_request.md b/.gitlab/issue_templates/feature_request.md
new file mode 100644
index 00000000000..26901ff00c4
--- /dev/null
+++ b/.gitlab/issue_templates/feature_request.md
@@ -0,0 +1,13 @@
+## Goal
+<!-- Describe the final result you want to achieve. Avoid design specifics. -->
+
+
+## Technical details
+<!-- Describe technical details, design specifics, suggestions, versions, etc. -->
+
+
+## Additional information
+
+
+<!-- The line below ensures that proper tags are added to the issue. Please do not remove it. -- >
+/label ~"kind::Feature Request"
-- 
2.30.2



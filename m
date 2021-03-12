Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614A33961B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:19:12 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmNT-0006BM-2j
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWO-0007kI-Vd
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWN-0000jq-2l
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3u9YRTJCNnnkPJFIhYEMaW1mD5nSFM7ktrkKODAAss=;
 b=DAGcd65ThBAG01bTX9/WJV8+2Z/ScB2G3EPV8yPpsHGgUD/ScG/G8vS7lRdR5oX+IwAFw0
 nU3RBOoeML9Eu925yM+M5LHl66Yknp8PDgM8m0FxybvBFLGrp5ieujgHiybFNye8wsvmNP
 ExEkqKGO2hS7W+sHwy/RCfwDWT9/x0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-rpAR-kYbMu2uUOMFkWbZvQ-1; Fri, 12 Mar 2021 12:24:13 -0500
X-MC-Unique: rpAR-kYbMu2uUOMFkWbZvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0FA1966320;
 Fri, 12 Mar 2021 17:24:12 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6F3319744;
 Fri, 12 Mar 2021 17:24:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 9/9] README: Add Documentation blurb
Date: Fri, 12 Mar 2021 18:23:56 +0100
Message-Id: <20210312172356.968219-10-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Add it in a prominent place: Right after figuring out what QEMU is,
users may wish to know how to use it more than they want to know how to
build their own version of it.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20201104193032.1319248-1-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 README.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/README.rst b/README.rst
index 91aa1e314c..a92c7394b7 100644
--- a/README.rst
+++ b/README.rst
@@ -31,6 +31,17 @@ QEMU as a whole is released under the GNU General Public License,
 version 2. For full licensing details, consult the LICENSE file.
 
 
+Documentation
+=============
+
+Documentation can be found hosted online at
+`<https://www.qemu.org/documentation/>`_. The documentation for the
+current development version that is available at
+`<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``
+folder in the source tree, and is built by `Sphinx
+<https://www.sphinx-doc.org/en/master/>_`.
+
+
 Building
 ========
 
-- 
2.27.0



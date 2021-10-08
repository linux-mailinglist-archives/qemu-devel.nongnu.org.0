Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B742736D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 00:10:05 +0200 (CEST)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYy44-0006Lr-Uz
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 18:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy0w-0007zr-AL
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy0u-0003Ke-U2
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633730808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypJfYuY21Vh2aPFoBDILN2UvMZykehiwMhY7Rt/uxFo=;
 b=axJGdqi7vUmCLRfJNCC5tc/VmG0L+HiExoEXJKgKQwpNwfM0Y5DltlluKTRFGTbHg/iZ4o
 pZ8N4GWWb2Us24HO0yPk4pKbWYSR2RKJkQAIlpncyAWwCfjAre6xWieysXn/ltRrsGWWDk
 DljolrxbdfroBPdOvxzPxuXfzGBr7W0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Z6LNec5INVOaVPDCmRmPRw-1; Fri, 08 Oct 2021 18:06:43 -0400
X-MC-Unique: Z6LNec5INVOaVPDCmRmPRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A6DE19067E4;
 Fri,  8 Oct 2021 22:06:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78F8A60C05;
 Fri,  8 Oct 2021 22:06:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] docs/sphinx: add static files to generated depfile
Date: Sat,  9 Oct 2021 02:06:16 +0400
Message-Id: <20211008220620.1488179-3-marcandre.lureau@redhat.com>
In-Reply-To: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
References: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/sphinx/depfile.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/sphinx/depfile.py b/docs/sphinx/depfile.py
index b6fb926df1..99539adb48 100644
--- a/docs/sphinx/depfile.py
+++ b/docs/sphinx/depfile.py
@@ -13,6 +13,7 @@
 import os
 import sphinx
 import sys
+from pathlib import Path
 
 __version__ = '1.0'
 
@@ -25,6 +26,10 @@ def get_infiles(env):
         if hasattr(mod, '__file__'):
             if mod.__file__:
                 yield mod.__file__
+    # this is perhaps going to include unused files:
+    for static_path in env.config.html_static_path:
+        for path in Path(static_path).rglob('*'):
+            yield str(path)
 
 
 def write_depfile(app, exception):
-- 
2.33.0.721.g106298f7f9



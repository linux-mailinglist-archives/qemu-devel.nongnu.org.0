Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D25483E07
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:25:00 +0100 (CET)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4f7r-0000kD-F3
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n4eXO-0001cK-Ca
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 02:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n4eXI-0006By-Kr
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 02:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641282430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QHNjoyWmkVOxoJY34VYOUgFZD4WQvmARWyZEhNx+vt8=;
 b=fLJJbl/D1TBv1H3HYQlOdfN9ucmg2JfWnKZ2d7KeCc7qDND8b2SUF3RJUBdclNDu0rP22p
 x6nfYlFKHwrFHuIr/xtDuDSYxutLfHWdInoyBLdg92iD3su7ob08T53K+aJ5ZFcHtA3nT4
 WWcgljKqG7PVR9Tp9XXhx4m8DaZHOTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-ZgYTTT9UPd6kWbxVvYrkLw-1; Tue, 04 Jan 2022 02:47:09 -0500
X-MC-Unique: ZgYTTT9UPd6kWbxVvYrkLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67C811014519
 for <qemu-devel@nongnu.org>; Tue,  4 Jan 2022 07:47:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A6EC7A23A;
 Tue,  4 Jan 2022 07:46:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/sphinx: fix compatibility with sphinx < 1.8
Date: Tue,  4 Jan 2022 11:46:49 +0400
Message-Id: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

SphinxDirective was added with sphinx 1.8 (2018-09-13).

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/sphinx/fakedbusdoc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
index a680b257547f..d2c507904654 100644
--- a/docs/sphinx/fakedbusdoc.py
+++ b/docs/sphinx/fakedbusdoc.py
@@ -7,12 +7,12 @@
 # Author: Marc-André Lureau <marcandre.lureau@redhat.com>
 """dbus-doc is a Sphinx extension that provides documentation from D-Bus XML."""
 
+from docutils.parsers.rst import Directive
 from sphinx.application import Sphinx
-from sphinx.util.docutils import SphinxDirective
 from typing import Any, Dict
 
 
-class FakeDBusDocDirective(SphinxDirective):
+class FakeDBusDocDirective(Directive):
     has_content = True
     required_arguments = 1
 
-- 
2.34.1.8.g35151cf07204



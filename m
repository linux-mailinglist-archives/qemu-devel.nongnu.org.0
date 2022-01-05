Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00548531D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:59:08 +0100 (CET)
Received: from localhost ([::1]:36484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55sh-00044N-7U
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55XN-0003uT-Oz
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55XL-0000Vt-D6
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZeYfRznQrRYCLpW4e32hg4pVFLoheJvDhlspFd5S90=;
 b=aG3FEBJMjVkjLFzgzgu9rL8sZGJTR/RYuiCAoD4ZHwPyAUgV2qies56Iv22dIAtkPcXjhM
 S3+QDSyl8DqzrxjaTXQBq1Rs9Af0OlxkZXZxxU8dSYdjZTrGKrKPBOjbPynvEJCrR064cy
 L2SHR1xLucKGY0eOyRZQUo/VTSJ722s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-oUTRAgFWMGq6_yfKYCWycg-1; Wed, 05 Jan 2022 07:36:59 -0500
X-MC-Unique: oUTRAgFWMGq6_yfKYCWycg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8FA585B663;
 Wed,  5 Jan 2022 12:36:58 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 060AC22DFC;
 Wed,  5 Jan 2022 12:36:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] docs/sphinx: fix compatibility with sphinx < 1.8
Date: Wed,  5 Jan 2022 13:36:10 +0100
Message-Id: <20220105123612.432038-7-thuth@redhat.com>
In-Reply-To: <20220105123612.432038-1-thuth@redhat.com>
References: <20220105123612.432038-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

SphinxDirective was added with sphinx 1.8 (2018-09-13).

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/sphinx/fakedbusdoc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
index a680b25754..d2c5079046 100644
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
2.27.0



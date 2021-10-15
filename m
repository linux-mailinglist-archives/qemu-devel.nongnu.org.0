Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115842EF44
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:05:03 +0200 (CEST)
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbL1K-0001tD-6I
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrW-00059e-Of
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrV-00059B-Aq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RNa0b8G+RfsrFgpCLYcyYaOsVybjY+pGTw1w2n2zok=;
 b=X31/oCJcPUOGlkF0sjHUSkh7OguWF0Ce8kiUzNwO0G1H2ymFszvO4o4K+8su7/fLyt7TmZ
 r4Sw456GPaFEyzZcdTzgMw6X/dmnh7yNUPY5KecBUTIFpdItHloeeT9sd0hK0O2g4D0DDe
 7yVGER2YDE1U1ZruKIajyuHcLzMhv90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-sUF4Prr-Mtar5U2puO3ylw-1; Fri, 15 Oct 2021 06:54:49 -0400
X-MC-Unique: sUF4Prr-Mtar5U2puO3ylw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C5C801ADB;
 Fri, 15 Oct 2021 10:54:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E95FB60583;
 Fri, 15 Oct 2021 10:54:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] docs/sphinx: set navigation_with_keys=True
Date: Fri, 15 Oct 2021 14:53:43 +0400
Message-Id: <20211015105344.152591-8-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Allow navigating to the previous/next page using the keyboard's left and
right arrows. I wish this would be the default, and that the themes
would provide more key navigation, but that doesn't seem on the roadmap.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/conf.py b/docs/conf.py
index edc2bf8fcb..f536483bc3 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -166,6 +166,7 @@
 if LooseVersion(sphinx_rtd_theme.__version__) >= LooseVersion("0.4.3"):
     html_theme_options = {
         "style_nav_header_background": "#802400",
+        "navigation_with_keys": True,
     }
 
 html_logo = os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")
-- 
2.33.0.721.g106298f7f9



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C0447C8C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:10:06 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0fG-0002qX-0y
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:10:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0YW-0008EI-H6
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0YU-0002Ob-Ao
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xpRJAHG8yNNa6bB1HoJUN6+5u1Fhoz4/fzXWVz4r9M=;
 b=YTiUVGFWCiG1SkETVKBN5UiRGpTIjUk+lEEhufrWHd/gwRS7/qjAeU1x9YMJLSSVYdOonA
 4iCc5g6JuttMHXg86A9OlHqYKGI1pDlMo+ggWOwpYmbNindn/a3dQGXftx7ndNZiA8sm6V
 e+xB1e5MSQVEb8RpMYEM7jIQSwTncR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-npyBuPhoN-q2G_wwcu634Q-1; Mon, 08 Nov 2021 04:03:04 -0500
X-MC-Unique: npyBuPhoN-q2G_wwcu634Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D2F15720;
 Mon,  8 Nov 2021 09:03:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D697860657;
 Mon,  8 Nov 2021 09:03:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/11] docs/sphinx: set navigation_with_keys=True
Date: Mon,  8 Nov 2021 13:01:51 +0400
Message-Id: <20211108090155.371357-8-marcandre.lureau@redhat.com>
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Allow navigating to the previous/next page using the keyboard's left and
right arrows. I wish this would be the default, and that the themes
would provide more key navigation, but that doesn't seem on the roadmap.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/conf.py b/docs/conf.py
index edc2bf8fcba7..f536483bc3d5 100644
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



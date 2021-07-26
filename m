Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F83D5847
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:08:51 +0200 (CEST)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yTa-0004zo-JA
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQz-0001Y5-07
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQx-0004hu-4A
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qy0oZja2KVfPVVVAqrXApW05fVhCV91tur2MjVWYjLA=;
 b=D8E7JbVA90NmY4WissYbu6wSxZlbceGeq+wkbTu5OqNVCnLST/LjP03fxLvUiA6+qw+yYA
 Oy5BfW5+cBsBElDmm53+MiXHmoAwtPJbiIOgqWkLQHYGUGkEjBNLoZOSElg+mNhoZDJYpw
 x2id3EOBsR7RSc3R6ffSRzURtJofm5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-JXSXUZBSO_62kdOjO6HM8A-1; Mon, 26 Jul 2021 07:06:03 -0400
X-MC-Unique: JXSXUZBSO_62kdOjO6HM8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 375F3C7402;
 Mon, 26 Jul 2021 11:06:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 631AE19D9B;
 Mon, 26 Jul 2021 11:05:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 593391800907; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] ui/egl-headless: Remove a check for CONFIG_OPENGL
Date: Mon, 26 Jul 2021 13:05:41 +0200
Message-Id: <20210726110544.1934386-4-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
References: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

ui/egl-headless is only built when CONFIG_OPENGL is defined because it
depends on CONFIG_OPENGL without condition. Remove a redundant
conditonal in ui/egl-headless.c

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210714055646.85952-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/egl-headless.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 75404e0e8700..a26a2520c496 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -214,6 +214,4 @@ static void register_egl(void)
 
 type_init(register_egl);
 
-#ifdef CONFIG_OPENGL
 module_dep("ui-opengl");
-#endif
-- 
2.31.1



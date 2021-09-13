Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F8408891
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:53:17 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPieK-0002rs-B3
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPic0-00007d-2X
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibv-00073t-40
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631526646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VY8nXdKF++rgEXHDxaP6rVmtKqQYPp8Al1wjhdpx6WE=;
 b=LX0IA6aI4UE21HKzWhN4fNBp4ww4P+TN1B5HpDOvz4SSXQ/kEhCtIPjN2EqxxHXevQ/J26
 K+a+HzkU5h0YsK3kRpfk6Mu3sNn6aId9R9RI+hQxQjKP8LEmugTCTZfB7X2rgF2eP+ec+O
 dSm12Y1c1EIse8J3yR14UcsJOJnfoIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-NZOCrbsYPsGZvamOStK9iw-1; Mon, 13 Sep 2021 05:50:44 -0400
X-MC-Unique: NZOCrbsYPsGZvamOStK9iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C27D7802947;
 Mon, 13 Sep 2021 09:50:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D63575C1D1;
 Mon, 13 Sep 2021 09:50:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7494B11385C3; Mon, 13 Sep 2021 11:50:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] qapi: Bury some unused code in class Indentation
Date: Mon, 13 Sep 2021 11:50:36 +0200
Message-Id: <20210913095038.3040776-4-armbru@redhat.com>
In-Reply-To: <20210913095038.3040776-1-armbru@redhat.com>
References: <20210913095038.3040776-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.__int__() has never been used.  Drop it.

.decrease() raises ArithmeticError when asked to decrease indentation
level below zero.  Nothing catches it.  It's a programming error.
Dumb down to assert.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210908045428.2689093-4-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 1d62c27fb7..489273574a 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -132,9 +132,6 @@ class Indentation:
     def __init__(self, initial: int = 0) -> None:
         self._level = initial
 
-    def __int__(self) -> int:
-        return self._level
-
     def __repr__(self) -> str:
         return "{}({:d})".format(type(self).__name__, self._level)
 
@@ -148,9 +145,7 @@ def increase(self, amount: int = 4) -> None:
 
     def decrease(self, amount: int = 4) -> None:
         """Decrease the indentation level by ``amount``, default 4."""
-        if self._level < amount:
-            raise ArithmeticError(
-                f"Can't remove {amount:d} spaces from {self!r}")
+        assert amount <= self._level
         self._level -= amount
 
 
-- 
2.31.1



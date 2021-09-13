Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FE40849E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 08:22:56 +0200 (CEST)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPfMl-0003xt-45
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 02:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPfLb-0003IR-SV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 02:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPfLY-0005Ux-7p
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 02:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631514098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EhDfy0By0Kx0tiyuLQ/xR3Rec2qtzYpENcpZ6S6te+s=;
 b=f/eVVhC6dFQ5PyD61iOyDzBzgtD8FUnzLG2epBpF2f6Mmx3C7IrjBZ/u98nvuaNGsJ4tOq
 o9hvKX5/Nb75umKOojzsMVg4DAYO6C1lqVLTawiDlQ2dZk2QK/djva7gL/2xJ/tmh6edsJ
 cfI9sLQ7380gLlZIO4SjzGDln9jcH4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-IbLLbGY-Op6rDNzFO_EGgw-1; Mon, 13 Sep 2021 02:21:36 -0400
X-MC-Unique: IbLLbGY-Op6rDNzFO_EGgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC73C802928;
 Mon, 13 Sep 2021 06:21:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFD045D6CF;
 Mon, 13 Sep 2021 06:21:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web v2 PATCH] Update the information about the required version
 of macOS
Date: Mon, 13 Sep 2021 08:21:26 +0200
Message-Id: <20210913062126.16946-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The versions that we specify for macOS are way too old already. Let's
rephrase this without specific version numbers, pointing the users
to the latest version instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Rephrased to be more in sync with docs/about/build-platforms.rst

 _download/macos.md | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/_download/macos.md b/_download/macos.md
index 06aa811..c55438a 100644
--- a/_download/macos.md
+++ b/_download/macos.md
@@ -6,5 +6,7 @@ QEMU can be installed from <strong>MacPorts</strong>:
 
 <pre>sudo port install qemu</pre>
 
-QEMU requires Mac OS X 10.5 or later, but it is recommended
-to use Mac OS X 10.7 or later.
+QEMU requires the the most recent macOS version that is currently available.
+Support for the previous version will be dropped two years after the current
+version has been released or when Apple drops support for it, whatever comes
+first.
-- 
2.27.0



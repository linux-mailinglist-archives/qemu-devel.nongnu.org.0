Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49E476463
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:14:04 +0100 (CET)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbb9-0001nS-CC
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbVp-0002se-5h
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbVn-0006Y9-1w
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mesINtvd0lv8322P/MWVgZ0RLQcS+d3KiFkmOJKEzCs=;
 b=ELGlU9fujkNG/xHE7suOed94gCZZblY6jZy/zCImvzawj4WWtoboRXPK1YDMAZRFtmvr4W
 iYV8Ak6aLddo4vbovf0Xt9JTzn9X3KJUJwRGkrNfQes9nAr+jl8uvDrc0KiNSP+YMgP0n7
 tQ4N4XzR/ILj1b+33azHIk7p7dVCQUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-3ZM0S2fbMe2NnmLqGXk4GQ-1; Wed, 15 Dec 2021 16:08:26 -0500
X-MC-Unique: 3ZM0S2fbMe2NnmLqGXk4GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0A11B2C985;
 Wed, 15 Dec 2021 21:08:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 397645F4E1;
 Wed, 15 Dec 2021 21:08:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 03/24] Update maintainer metadata
Date: Wed, 15 Dec 2021 16:06:13 -0500
Message-Id: <20211215210634.3779791-4-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm the primary author of this particular component; update the metadata
accordingly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/setup.cfg b/setup.cfg
index 9999bca..7cd8470 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -1,7 +1,9 @@
 [metadata]
 name = qemu.qmp
 version = file:VERSION
-maintainer = QEMU Developer Team
+author = John Snow
+author_email = jsnow@redhat.com
+maintainer = QEMU Project
 maintainer_email = qemu-devel@nongnu.org
 url = https://www.qemu.org/
 download_url = https://www.qemu.org/download/
-- 
2.31.1



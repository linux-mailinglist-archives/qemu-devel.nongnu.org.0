Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236933C1972
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:55:17 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZB6-0004tR-3Y
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Ywk-0002y8-5Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Ywd-00048S-8f
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R0kU7dBYgbS2aOOccld9O5h0LpQ1bCLt4qUKgILd0/k=;
 b=OTI44T7sw5CQux4j8UKj07w3AtFlYsd1ti+v8D2+sy0JC6rDG7nhSjq1hUMGB9HfGeSSeB
 vIh3jrkbzSK8jBBqiDPLUHMIX5zHkZFE92QYTI/oELf1VKUJoH4Qa3K5cDqAoo9SGG1JIe
 9EGXHgIh2h+/aS6Vyh6a0ZW9M7s42VE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-QldlE4cMM32gUTQyuRzZNw-1; Thu, 08 Jul 2021 14:40:17 -0400
X-MC-Unique: QldlE4cMM32gUTQyuRzZNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56AFDEC1A2
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:40:16 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22965D9FC;
 Thu,  8 Jul 2021 18:40:15 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Move qemu.sasl to contrib/
Date: Thu,  8 Jul 2021 14:39:57 -0400
Message-Id: <d1a1e265dd846de6ca40406300d91cecfba69ef8.1625769570.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not installed in any way, so seems like contrib/ material

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
Or should this be installed to /etc/sasl2 ?

 MAINTAINERS                    | 2 +-
 qemu.sasl => contrib/qemu.sasl | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename qemu.sasl => contrib/qemu.sasl (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e12e..2ec1c362f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2768,7 +2768,7 @@ F: tests/unit/test-crypto-*
 F: tests/bench/benchmark-crypto-*
 F: tests/unit/crypto-tls-*
 F: tests/unit/pkix_asn1_tab.c
-F: qemu.sasl
+F: contrib/qemu.sasl
 
 Coroutines
 M: Stefan Hajnoczi <stefanha@redhat.com>
diff --git a/qemu.sasl b/contrib/qemu.sasl
similarity index 100%
rename from qemu.sasl
rename to contrib/qemu.sasl
-- 
2.31.1



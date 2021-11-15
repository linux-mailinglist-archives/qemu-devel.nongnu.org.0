Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A537644FFB8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:06:36 +0100 (CET)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmX0d-00067V-Ex
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mmWxv-0003qH-Ly
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mmWxr-0007hG-VO
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636963423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1hG7n/r1GiDNSFCyZ3FG1n/n3z0qzhboVxkv306mww=;
 b=Ec9iIAAH5F2HG3IWTn4rKNMQ5INW5SyJdASt1wsgyK2/Xkpd7+1vYaGcpeDsX9ID9uzviL
 KqP2NQqJeip/o9dZ9f6ArVvkGVDvnJE4G22oxK/OHxlByDYLTg5U4/NSGvNFafc4wxZSjs
 NyxV7UYvHDB01gnsqzMQ69i50sryOOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-SKJaL07BPOOwdhLKmTHMFg-1; Mon, 15 Nov 2021 03:03:42 -0500
X-MC-Unique: SKJaL07BPOOwdhLKmTHMFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB9C1006AA1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:03:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCB5018A8F;
 Mon, 15 Nov 2021 08:03:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] vl: typo fix in a comment
Date: Mon, 15 Nov 2021 12:03:12 +0400
Message-Id: <20211115080312.64692-3-marcandre.lureau@redhat.com>
In-Reply-To: <20211115080312.64692-1-marcandre.lureau@redhat.com>
References: <20211115080312.64692-1-marcandre.lureau@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com, armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 385465fbeb6d..c584836c231e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1957,7 +1957,7 @@ static void qemu_create_early_backends(void)
     object_option_foreach_add(object_create_early);
 
     /* spice needs the timers to be initialized by this point */
-    /* spice must initialize before audio as it changes the default auiodev */
+    /* spice must initialize before audio as it changes the default audiodev */
     /* spice must initialize before chardevs (for spicevmc and spiceport) */
     qemu_spice.init();
 
-- 
2.33.0.721.g106298f7f9



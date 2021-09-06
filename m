Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D3401DB4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:41:12 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGkB-0006ns-Fj
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNGiw-0005sV-3P
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNGiu-0008Pq-Ig
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630942791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pw1OLeUjx5dQ8FgIh/sQ8h366t8hELvcoSaqQifC8i0=;
 b=QX3nlgrs23E4rh+7PNKcnOTbzILc8KMGLgLTwsg7CHZ5sXxJC781b+8cGhatNxdWFJKt9H
 /2t6vSPVO23wdZIDNhwCv3kfJBHReQj55K0M3qGwqU0WfBiCgYdC+Q9rSBe8qRh7gYpKJ1
 g3YzLYY15crwf3kVw/S5yFzxJChPX7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-6qkMlnMNM4S9Tg2A8Ykrag-1; Mon, 06 Sep 2021 11:39:49 -0400
X-MC-Unique: 6qkMlnMNM4S9Tg2A8Ykrag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2B45100C60B
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:39:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDA6310016F2;
 Mon,  6 Sep 2021 15:39:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson.build: Do not look for VNC-related libraries if
 have_system is not set
Date: Mon,  6 Sep 2021 17:39:39 +0200
Message-Id: <20210906153939.165567-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running "./configure --static --disable-system" there is currently
a warning if the static version of libpng is missing:

 WARNING: Static library 'png16' not found for dependency 'libpng', may not
 be statically linked

Since it does not make sense to look for the VNC-related libraries at all
when we're building without system emulator binaries, let's add a check
for have_system here to silence this warning.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 7e58e6279b..f07236d947 100644
--- a/meson.build
+++ b/meson.build
@@ -931,7 +931,7 @@ vnc = not_found
 png = not_found
 jpeg = not_found
 sasl = not_found
-if not get_option('vnc').disabled()
+if have_system and not get_option('vnc').disabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
-- 
2.27.0



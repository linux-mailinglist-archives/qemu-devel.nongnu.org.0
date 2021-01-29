Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3251308BD2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:45:58 +0100 (CET)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XqH-0005Dv-OF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XLV-0006DT-5L
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XLR-00081z-73
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gbi6B0K/FuSJi96fDmspZ/JcpueXhhF8FsKIc8ujvn0=;
 b=ewrReByvuBJOplZ0i9uznpq63OGnludMtPAFpCt9HyWrcJob9Lf9TVpjDeFWGZFuFYZaW/
 Vic6SMW/80b78bGaD+I6+GVuXPHUnOQNKCYBFAtRz+o12XIQccs6jpyJnxqJywZ3lIhT9A
 i3VirASiyHUK7ItyMBhH6Pr8i/AMTSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-HsCNG_VbM-O8eVYJaMuRkQ-1; Fri, 29 Jan 2021 12:14:01 -0500
X-MC-Unique: HsCNG_VbM-O8eVYJaMuRkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDF2318C8C01;
 Fri, 29 Jan 2021 17:13:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1485D705;
 Fri, 29 Jan 2021 17:13:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] crypto: Add spaces around operator
Date: Fri, 29 Jan 2021 17:10:59 +0000
Message-Id: <20210129171102.4109641-11-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com,
 shiliyang <shiliyang@huawei.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: shiliyang <shiliyang@huawei.com>

I am reading crypto related code, find some code style problems while
using checkpatch.pl to check crypto folder. Fix the error style
problems.

Signed-off-by: Liyang Shi <shiliyang@huawei.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/aes.c    | 4 ++--
 crypto/desrfb.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 56efc95196..af72ff7779 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1080,9 +1080,9 @@ int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
 
         rk = key->rd_key;
 
-        if (bits==128)
+        if (bits == 128)
                 key->rounds = 10;
-        else if (bits==192)
+        else if (bits == 192)
                 key->rounds = 12;
         else
                 key->rounds = 14;
diff --git a/crypto/desrfb.c b/crypto/desrfb.c
index 675847c93b..b2a105ebbc 100644
--- a/crypto/desrfb.c
+++ b/crypto/desrfb.c
@@ -93,7 +93,7 @@ void deskey(unsigned char *key, int edf)
                     }
                 for( j = 0; j < 24; j++ ) {
                         if( pcr[pc2[j]] ) kn[m] |= bigbyte[j];
-                        if( pcr[pc2[j+24]] ) kn[n] |= bigbyte[j];
+                        if( pcr[pc2[j + 24]] ) kn[n] |= bigbyte[j];
                         }
                 }
         cookey(kn);
-- 
2.29.2



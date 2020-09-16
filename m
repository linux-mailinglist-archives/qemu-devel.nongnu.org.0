Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE426C26D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 14:04:32 +0200 (CEST)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIWAp-0005Gh-IY
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 08:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIVuo-0006kp-KS
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIVum-00089U-Ld
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600256876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Xpj5Ja/hMrtC5TtCA7FriRu7OWDoU0v2ui+k7goVvEU=;
 b=DCLkZ3RWopVO6l0E5yUKwnsynm4U9geMWfRegy3uSj+wWrD44J+BBRyYkshL8GsPbl/yHq
 sfo+v+q2VF6EInfyHUQdy3ipNpQPz1lzmHS1EvUhd/3HLcwBjX7BlmxA5StUDQ24cMViTv
 pvt4+/0x+w7F9YGKw5RZORsdQHnZNKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-eBGothTEOMOR2Rs66g4oQg-1; Wed, 16 Sep 2020 07:47:51 -0400
X-MC-Unique: eBGothTEOMOR2Rs66g4oQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 601D180EFA4;
 Wed, 16 Sep 2020 11:47:50 +0000 (UTC)
Received: from thuth.com (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56DCA5DE86;
 Wed, 16 Sep 2020 11:47:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/24] meson: Disable test-char on msys2/mingw for fixing tests
 stuck
Date: Wed, 16 Sep 2020 13:47:17 +0200
Message-Id: <20200916114731.102080-11-thuth@redhat.com>
In-Reply-To: <20200916114731.102080-1-thuth@redhat.com>
References: <20200916114731.102080-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20200907200432.2418-3-luoyonggang@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index dae8a77df1..82342a2f97 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -195,8 +195,13 @@ if have_system
   # are not runnable under TSan due to a known issue.
   # https://github.com/google/sanitizers/issues/1116
   if 'CONFIG_TSAN' not in config_host
+    if 'CONFIG_POSIX' in config_host
+        tests += {
+          'test-char': ['socket-helpers.c', qom, io, chardev]
+        }
+    endif
+
     tests += {
-      'test-char': ['socket-helpers.c', qom, io, chardev],
       'test-qdev-global-props': [qom, hwcore, testqapi]
     }
   endif
-- 
2.18.2



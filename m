Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238125FA45
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 14:16:15 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFG4E-0003A5-99
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 08:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kFFzt-00040s-Ml
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:11:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kFFzr-0007un-NQ
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599480703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNZGqbsbfDwsTrMCxJJe8eJaJAvzaF7hs1fj1GhTtYs=;
 b=ZKk+CmGNRGOqXWvF8wrN1/SpwYUPVyp9ELrCpGM2EZDcneylmpJnrI57cv2DhdCJ5jsacK
 lg+W4GtQJkYU46HlwPdEjxAfIPwExkr+/bvbaYYh5Uz4Bt81LrWwjIwQ73klqAZ27drMCE
 cZid/pXgTPEX83mkIlFL9qb5CppHOlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-6yt0596yM5GWPlUZ9wSoOg-1; Mon, 07 Sep 2020 08:11:40 -0400
X-MC-Unique: 6yt0596yM5GWPlUZ9wSoOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C3E640C1;
 Mon,  7 Sep 2020 12:11:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A705C1BB;
 Mon,  7 Sep 2020 12:11:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/14] dockerfiles/debian-win64-cross: Download WHPX MinGW
 headers
Date: Mon,  7 Sep 2020 14:11:19 +0200
Message-Id: <20200907121127.136243-7-thuth@redhat.com>
In-Reply-To: <20200907121127.136243-1-thuth@redhat.com>
References: <20200907121127.136243-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 02:54:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To compile-test the WHPX accelerator, we need to download these system
headers first (they are unfortunately not part of any released and
packaged MinGW toolchain yet).

Idea taken from another patch by Stefan Weil.

Message-Id: <20200804170055.2851-12-thuth@redhat.com>
Message-Id: <20200823111757.72002-6-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/debian-win64-cross.docker | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-win64-cross.docker b/tests/docker/dockerfiles/debian-win64-cross.docker
index 2fc9cfcbc6..4cc4a3f365 100644
--- a/tests/docker/dockerfiles/debian-win64-cross.docker
+++ b/tests/docker/dockerfiles/debian-win64-cross.docker
@@ -32,7 +32,14 @@ RUN apt-get update && \
         mxe-$TARGET-w64-mingw32.shared-sdl2 \
         mxe-$TARGET-w64-mingw32.shared-sdl2-mixer \
         mxe-$TARGET-w64-mingw32.shared-sdl2-gfx \
-        mxe-$TARGET-w64-mingw32.shared-zlib
+        mxe-$TARGET-w64-mingw32.shared-zlib \
+        curl && \
+    curl -s -S -o /usr/lib/mxe/usr/x86_64-w64-mingw32.shared/include/WinHvEmulation.h \
+        "https://sourceforge.net/p/mingw-w64/mingw-w64/ci/master/tree/mingw-w64-headers/include/winhvemulation.h?format=raw" && \
+    curl -s -S -o /usr/lib/mxe/usr/x86_64-w64-mingw32.shared/include/WinHvPlatform.h \
+        "https://sourceforge.net/p/mingw-w64/mingw-w64/ci/master/tree/mingw-w64-headers/include/winhvplatform.h?format=raw" && \
+    curl -s -S -o /usr/lib/mxe/usr/x86_64-w64-mingw32.shared/include/winhvplatformdefs.h \
+        "https://sourceforge.net/p/mingw-w64/mingw-w64/ci/master/tree/mingw-w64-headers/include/winhvplatformdefs.h?format=raw"
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32.shared-
-- 
2.18.2



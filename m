Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADAE380942
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:14:50 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWiP-0006m3-Ap
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWa0-0000Lg-5r
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWZy-0007U8-Fy
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620993965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjZQMGPk0AYiuVr47VExOoPSbGm6xGFlVtgfifpj3k8=;
 b=KoqhCce6D/TAoA1EosveeH4xICRCpVVfIOCZDQoGnlhjsm20ZrkAttFJWCLb3f9f1L5AyZ
 VIECKnq6QrXgUGo7jiju8WE1sTca9ZNsA9HDenFpafPGaKqPWOFMXrCwcS/pc5n0zKCadS
 ZW+PZk787gTXzUN97HaBKcFOIriBRuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-0x6k3PngODOMIubwYFCfvg-1; Fri, 14 May 2021 08:06:04 -0400
X-MC-Unique: 0x6k3PngODOMIubwYFCfvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3D8818401;
 Fri, 14 May 2021 12:06:03 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443C219C59;
 Fri, 14 May 2021 12:05:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] configure: bump min required CLang to 6.0 / XCode
 10.0
Date: Fri, 14 May 2021 13:04:15 +0100
Message-Id: <20210514120415.1368922-13-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-1-berrange@redhat.com>
References: <20210514120415.1368922-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several distros have been dropped since the last time we bumped the
minimum required CLang version.

Per repology, currently shipping versions are:

             RHEL-8: 10.0.1
      Debian Buster: 7.0.1
 openSUSE Leap 15.2: 9.0.1
   Ubuntu LTS 18.04: 6.0.0
   Ubuntu LTS 20.04: 10.0.0
         FreeBSD 12: 8.0.1
          Fedora 33: 11.0.0
          Fedora 34: 11.1.0

With this list Ubuntu LTS 18.04 is the constraint at 6.0.0

An LLVM version of 6.0.0 corresponds to macOS XCode version of 10.0
which dates from Sept 2018.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index ac8520172a..67e5a267c2 100755
--- a/configure
+++ b/configure
@@ -2050,12 +2050,12 @@ fi
 cat > $TMPC << EOF
 #if defined(__clang_major__) && defined(__clang_minor__)
 # ifdef __apple_build_version__
-#  if __clang_major__ < 5 || (__clang_major__ == 5 && __clang_minor__ < 1)
-#   error You need at least XCode Clang v5.1 to compile QEMU
+#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
+#   error You need at least XCode Clang v10.0 to compile QEMU
 #  endif
 # else
-#  if __clang_major__ < 3 || (__clang_major__ == 3 && __clang_minor__ < 4)
-#   error You need at least Clang v3.4 to compile QEMU
+#  if __clang_major__ < 6 || (__clang_major__ == 6 && __clang_minor__ < 0)
+#   error You need at least Clang v6.0 to compile QEMU
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
@@ -2068,7 +2068,7 @@ cat > $TMPC << EOF
 int main (void) { return 0; }
 EOF
 if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.5 or Clang v3.4 (or XCode Clang v5.1)"
+    error_exit "You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)"
 fi
 
 # Accumulate -Wfoo and -Wno-bar separately.
-- 
2.31.1



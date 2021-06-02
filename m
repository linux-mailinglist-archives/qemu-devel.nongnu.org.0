Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD604398371
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:45:56 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLZb-0004Do-Qb
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQt-00011E-Bp
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQr-00045w-C7
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XoBnZ4etP6u0FFkHsbEemMviUFw8UHp7Kr8RygHgsI=;
 b=Kjb1rsgmWhLiwy/1OiIpSp5LTeyhTeso/1xcV/MawlzYAXmlEAFV/MgRykGJFmm0ldxpuT
 6JP+nwub5syLl5V0yaKfuTyh22b4/zE3f6PQp1o2EDIM27LgdMf0t2a5u2y2RvT6/ePveZ
 lwxagD6cgZ0kUNeaBhuZEnG8JtnANiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-N3L3pMgNMZyb4N1FuxF-0A-1; Wed, 02 Jun 2021 03:36:50 -0400
X-MC-Unique: N3L3pMgNMZyb4N1FuxF-0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45FE80362E;
 Wed,  2 Jun 2021 07:36:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 880BB5C730;
 Wed,  2 Jun 2021 07:36:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/17] configure: bump min required CLang to 6.0 / XCode 10.0
Date: Wed,  2 Jun 2021 09:36:06 +0200
Message-Id: <20210602073606.338994-18-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

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
Message-Id: <20210514120415.1368922-13-berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index da2e28a3c2..f0c8629dc6 100755
--- a/configure
+++ b/configure
@@ -2056,12 +2056,12 @@ fi
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
@@ -2074,7 +2074,7 @@ cat > $TMPC << EOF
 int main (void) { return 0; }
 EOF
 if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.5 or Clang v3.4 (or XCode Clang v5.1)"
+    error_exit "You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)"
 fi
 
 # Accumulate -Wfoo and -Wno-bar separately.
-- 
2.27.0



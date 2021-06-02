Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53C398382
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:47:33 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLbA-000082-5e
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQs-0000xl-Ep
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQp-00045M-At
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6nWBrJn2c4mWRZrgihTYrhJob0yuVP+PbzYuQcX83o=;
 b=GnsAoiBn0lh15Wj9BPEKFMasazeB2Rhn+D7nAywZt7FJ2bkmgoDE9MuUXWiUMUkTZt9cZv
 BS+LvgL2QPjV4CurOPQmUcLyrpx4btklH+jzak6uibP4wHjbOPRoyPII5k4nttEag1lNJ4
 4p545VCyuLjJUNQq8/CTFT6lGa1770g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-Ch8wnCZSObGCIBWR17GxmQ-1; Wed, 02 Jun 2021 03:36:49 -0400
X-MC-Unique: Ch8wnCZSObGCIBWR17GxmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 287361854E25;
 Wed,  2 Jun 2021 07:36:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEE5F5C648;
 Wed,  2 Jun 2021 07:36:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/17] configure: bump min required GCC to 7.5.0
Date: Wed,  2 Jun 2021 09:36:05 +0200
Message-Id: <20210602073606.338994-17-thuth@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
minimum required GCC version.

Per repology, currently shipping versions are:

             RHEL-8: 8.3.1
      Debian Buster: 8.3.0
 openSUSE Leap 15.2: 7.5.0
   Ubuntu LTS 18.04: 7.5.0
   Ubuntu LTS 20.04: 9.3.0
            FreeBSD: 10.3.0
          Fedora 33: 9.2.0
          Fedora 34: 11.0.1
            OpenBSD: 8.4.0
     macOS HomeBrew: 11.1.0

With this list Ubuntu LTS 18.04 / openSUSE Leap 15.2 are the
constraint at 7.5.0

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210514120415.1368922-12-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 9910df40af..da2e28a3c2 100755
--- a/configure
+++ b/configure
@@ -2065,8 +2065,8 @@ cat > $TMPC << EOF
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
-#  error You need at least GCC v4.8 to compile QEMU
+# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
+#  error You need at least GCC v7.5.0 to compile QEMU
 # endif
 #else
 # error You either need GCC or Clang to compiler QEMU
@@ -2074,7 +2074,7 @@ cat > $TMPC << EOF
 int main (void) { return 0; }
 EOF
 if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v4.8 or Clang v3.4 (or XCode Clang v5.1)"
+    error_exit "You need at least GCC v7.5 or Clang v3.4 (or XCode Clang v5.1)"
 fi
 
 # Accumulate -Wfoo and -Wno-bar separately.
-- 
2.27.0



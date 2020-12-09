Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B252F2D3F42
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:57:14 +0100 (CET)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwDh-0005oF-PG
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw6D-0005Oj-4E
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw67-0007QW-0l
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/LONfY0wLYM507v7mLDSvKiGE6HWwmxphGx6MMord0=;
 b=BVJan7JxvmGBPxTNfRcOuclzp6EpEf6rxilNzhGCAbaY0tYSPk3hY2qNpCvMSXzLSGgBSB
 sTH9drI+ugb1D8YTtpPynRfvXVLm4qz3lwB06mUftzPZ7gFtxnfcuZyA4H4weZm8IfIfwQ
 VPP8S6aD6KX49M+1SibxbRzlSDKBtd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-xbrQsPmkPPyt-09faMBt-Q-1; Wed, 09 Dec 2020 04:49:17 -0500
X-MC-Unique: xbrQsPmkPPyt-09faMBt-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97ABD1005513;
 Wed,  9 Dec 2020 09:49:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FF3F5C234;
 Wed,  9 Dec 2020 09:49:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/13] gitlab-ci: Update 'build-disabled' to cover all
 configurable options
Date: Wed,  9 Dec 2020 10:48:53 +0100
Message-Id: <20201209094856.17788-11-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add these missing options to the 'build-disabled' job:
  --disable-auth-pam             (commit 8953caf3cd38)
  --disable-gcrypt               (commit 91bfcdb01d48)
  --disable-keyring              (commit 54e7aac05624)
  --disable-libudev              (commit 5c53015a480b)
  --disable-opengl               (commit da076ffed6b9)
  --disable-sparse               (commit 03b4fe7de226)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[thuth: Dropped the unnecessary hunk with --disable-vhost-user-blk-server]
Message-Id: <20201108204535.2319870-7-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d2cd5d9386..8f72a2630d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -201,6 +201,7 @@ build-disabled:
     IMAGE: fedora
     CONFIGURE_ARGS:
       --disable-attr
+      --disable-auth-pam
       --disable-avx2
       --disable-bochs
       --disable-brlapi
@@ -213,15 +214,18 @@ build-disabled:
       --disable-curses
       --disable-dmg
       --disable-docs
+      --disable-gcrypt
       --disable-glusterfs
       --disable-gnutls
       --disable-gtk
       --disable-guest-agent
       --disable-iconv
+      --disable-keyring
       --disable-kvm
       --disable-libiscsi
       --disable-libpmem
       --disable-libssh
+      --disable-libudev
       --disable-libusb
       --disable-libxml2
       --disable-linux-aio
@@ -231,6 +235,7 @@ build-disabled:
       --disable-mpath
       --disable-nettle
       --disable-numa
+      --disable-opengl
       --disable-parallels
       --disable-pie
       --disable-qcow1
@@ -245,6 +250,7 @@ build-disabled:
       --disable-slirp
       --disable-smartcard
       --disable-snappy
+      --disable-sparse
       --disable-spice
       --disable-strip
       --disable-tpm
-- 
2.18.4



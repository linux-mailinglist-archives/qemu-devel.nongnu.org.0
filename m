Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5062F102D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:35:36 +0100 (CET)
Received: from localhost ([::1]:34914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuXw-0000qD-0x
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyuWm-0000QB-AO
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyuWj-0005TP-QZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610361260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PUiMZl4QLGgUnkalhqWWbfOGFVnmnbUtmAlVlZTERbE=;
 b=MTBS6y+x0KJLuYKMRXimzEDlfPHvrAv0yyT7aiMzHXLbtLYl9bjcMa8mKobJhCjvAYS5Tv
 hvClvu6BBWwDaw9as0pcKyTSTSH63iTM/OEpR0PoMW1kgsdAgcIm1iFXpEnyvfGHMOaKgG
 MkYZD/U2gN/i6ZBeKWD+OgoUK6pjlhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-hZ8S94viOiuHgoJJDdE5bQ-1; Mon, 11 Jan 2021 05:34:16 -0500
X-MC-Unique: hZ8S94viOiuHgoJJDdE5bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771C98145E0;
 Mon, 11 Jan 2021 10:34:15 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1BE65D9F6;
 Mon, 11 Jan 2021 10:34:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cirrus.yml: Replace the hard-coded python-sphinx version with
 the generic one
Date: Mon, 11 Jan 2021 11:34:10 +0100
Message-Id: <20210111103410.144797-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mingw-w64-x86_64-python-sphinx-2.3.1 package has been removed from
the server, so the windows_msys2_task is currently failing. Replace the
old version with the current generic one to fix the issue (the current
version seems to work fine now, too).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Successful run (with sphinx building the docs) can be seen here:
 https://cirrus-ci.com/task/6568987054047232

 .cirrus.yml | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 3907e036da..886addedd3 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -117,12 +117,8 @@ windows_msys2_task:
           mingw-w64-x86_64-curl \
           mingw-w64-x86_64-gnutls \
           mingw-w64-x86_64-libnfs \
+          mingw-w64-x86_64-python-sphinx
           "
-        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND `
-          https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz `
-          C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -U /c/tools/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz"
-        del C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
         C:\tools\msys64\usr\bin\bash.exe -lc "rm -rf /var/cache/pacman/pkg/*"
         cd C:\tools\msys64
         echo "Start archive"
-- 
2.27.0



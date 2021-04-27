Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF736CB60
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:57:27 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSth-000390-Oc
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lbSs0-0002dK-41
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lbSrw-0006F1-Ol
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619549735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYoS3syqQ8r5Cj5tAp0eLkquxTDuUBlbj3KdGrVx9EM=;
 b=b02+OmrZr8O9HV/KsqfnJazARNrz3Kcsdq0XpPlpLiQoFsNXO3OyIjxzzgjKVS/qm9uPT6
 CA4aEA8n73c4iOlx4v99jOqEgKrTPVvcvlY+tATIm2JKzDLd5bwaetC/FcC2UrDZK2Q5zX
 B8zvZ8Ru5toDgR1mQbXyhEOpLQQ1Oxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-1L0WvCRjOOqt0EZruiriwA-1; Tue, 27 Apr 2021 14:55:28 -0400
X-MC-Unique: 1L0WvCRjOOqt0EZruiriwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D914804030;
 Tue, 27 Apr 2021 18:55:27 +0000 (UTC)
Received: from thuth.com (ovpn-112-81.ams2.redhat.com [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6132D5C626;
 Tue, 27 Apr 2021 18:55:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH] cirrus.yml: Fix the MSYS2 task
Date: Tue, 27 Apr 2021 20:55:24 +0200
Message-Id: <20210427185524.281883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MSYS2 task in the Cirrus-CI is currently failing with error messages
like this:

 warning: database file for 'ucrt64' does not exist (use '-Sy' to download)
 :: Starting core system upgrade...
  there is nothing to do
 :: Starting full system upgrade...
 error: failed to prepare transaction (could not find database)

Seems like it can be fixed by switching to a newer release and by refreshing
the database one more time after changing the /etc/pacman.conf file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Here's a successful run after applying this patch:
 https://cirrus-ci.com/build/4918461810868224

 .cirrus.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f53c519447..f4bf49b704 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -67,7 +67,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
@@ -130,7 +130,7 @@ windows_msys2_task:
         taskkill /F /FI "MODULES eq msys-2.0.dll"
         tasklist
         C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Suu --overwrite=*"
+        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
         Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
         $start_time = Get-Date
 
-- 
2.27.0



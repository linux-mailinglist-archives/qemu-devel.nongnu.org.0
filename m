Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F075148779C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:29:24 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oN1-0006yn-Qb
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5oAE-0006Hk-TO
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5oAA-0000LF-RO
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641557765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bSavMfmMBQ6mnhxLaWHxczAmJyr/ikZ7HFUUxi0XBt8=;
 b=GzqyRt+nT7s7eld2q9794vtf0aos3xIqDYrZYsvQGPGqFNp6+XDtmRspmyx71uyDKXwHir
 U5ytppWNw/bEYaRLN1hDgudZN/MKREAZ8eoBf9mCbcWVtjzx1Jt7Cmf/bUg+fuZPcy5nlS
 P5hkeYu+Gp2A2XKkb6psoZa6l0TlO/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-XJ1N0PYAMT2NAbyqVPhQug-1; Fri, 07 Jan 2022 07:16:04 -0500
X-MC-Unique: XJ1N0PYAMT2NAbyqVPhQug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E31518460E5
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 12:16:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F8EE76108;
 Fri,  7 Jan 2022 12:15:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] configure: Silence warnings about missing roms/seabios
 directory
Date: Fri,  7 Jan 2022 13:15:40 +0100
Message-Id: <20220107121540.80895-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The configure script tries to always create a config.mak file
in the roms/seabios/ subdirectory. However, since commit
5dce7b8d8ce6 ("configure: remove DIRS"), this subdirectory is not
created anymore if the git submodule hasn't been checked out.
Thus let's properly check for the existance of the folder first
now to get rid of the warnings.

Fixes: 5dce7b8d8ce6 ("configure: remove DIRS")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index c798e48faf..51b13b273c 100755
--- a/configure
+++ b/configure
@@ -3773,8 +3773,8 @@ export target_list source_path use_containers cpu
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
-for rom in seabios; do
-    config_mak=roms/$rom/config.mak
+if test -d roms/seabios ; then
+    config_mak=roms/seabios/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
     echo "AS=$as" >> $config_mak
@@ -3786,7 +3786,7 @@ for rom in seabios; do
     echo "IASL=$iasl" >> $config_mak
     echo "LD=$ld" >> $config_mak
     echo "RANLIB=$ranlib" >> $config_mak
-done
+fi
 
 config_mak=pc-bios/optionrom/config.mak
 echo "# Automatically generated by configure - do not modify" > $config_mak
-- 
2.27.0



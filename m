Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E51D7308
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 10:34:38 +0200 (CEST)
Received: from localhost ([::1]:41658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jabEL-0005Ke-T7
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 04:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jabDA-0004HL-U4
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:33:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30787
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jabD9-0005v6-NY
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589790801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=xgGz94sVb4d0ezexUgevgjLRHz035twUg3/hSMAyx78=;
 b=FRxZTVMaEEazb4dTcXQbFKBimbCHxoLv8wkl15dhvisaSqzPX5C6ecaTrEzoBVnVBvv+fN
 beijL0G3yC/asLsnijiuqqLrhdmGy6ffHFreEmBZ2TqkGHkAC77XHnj85HZecSwgNHIRAg
 ViQM0LHicZMIEX5+c/5LJXOY9VkrvZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-xUC71YBxMbWxsr8k-0Yt4A-1; Mon, 18 May 2020 04:33:20 -0400
X-MC-Unique: xUC71YBxMbWxsr8k-0Yt4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CF57835B41;
 Mon, 18 May 2020 08:33:19 +0000 (UTC)
Received: from thuth.com (ovpn-112-182.ams2.redhat.com [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 629CA64441;
 Mon, 18 May 2020 08:33:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] travis.yml: Use clang++ in the Clang tests
Date: Mon, 18 May 2020 10:33:15 +0200
Message-Id: <20200518083316.25065-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Our configure script does not look for clang++ automatically, so we
should use --cxx=clang++ to make sure that we test our C++ code with
Clang, too. And while we're at it, also use --host-cc=clang here
to avoid that we use the normal "cc" as host C compiler.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 1ec8a7b465..564be50a3c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -205,14 +205,15 @@ jobs:
     # Test with Clang for compile portability (Travis uses clang-5.0)
     - name: "Clang (user)"
       env:
-        - CONFIG="--disable-system"
+        - CONFIG="--disable-system --host-cc=clang --cxx=clang++"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
 
     - name: "Clang (main-softmmu)"
       env:
-        - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS} "
+        - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS}
+                  --host-cc=clang --cxx=clang++"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
       compiler: clang
       before_script:
@@ -222,7 +223,8 @@ jobs:
 
     - name: "Clang (other-softmmu)"
       env:
-        - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
+        - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}
+                  --host-cc=clang --cxx=clang++"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
-- 
2.18.1



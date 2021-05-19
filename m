Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C1388D1C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:40:32 +0200 (CEST)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKYx-0001Qa-7q
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljKXJ-0000UK-Ir
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljKXH-0007JY-Fg
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621424326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4tHC9cW4sOIgmwu3FfEV145O9OPG3CwI6wjHrKIzqtw=;
 b=XgDJZA+ZCWbsNFVoWZb9i08VemZ9631E72UBxR31Ohhmh3a71A+ilyRlxGwPuWVVjU/uMa
 ObrjJZUevcH6Fv2qZXZmSyJb+jYrdJW4I6AOdDm6I11+AahyT+kOIcP/me7dlMmudAlM6J
 nNEUkgT0J5Oocn0YgJzgq1nBe3TKgzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-yLF4v8lxNCmaLjN6l4GGbw-1; Wed, 19 May 2021 07:38:44 -0400
X-MC-Unique: yLF4v8lxNCmaLjN6l4GGbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E84188015C6;
 Wed, 19 May 2021 11:38:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA20670137;
 Wed, 19 May 2021 11:38:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: Avoid error messages about missing *-config-*.h
 files
Date: Wed, 19 May 2021 13:38:40 +0200
Message-Id: <20210519113840.298174-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling with --disable-system there is a harmless yet still
annoying error message at the end of the "configure" step:

 sed: can't read *-config-devices.h: No such file or directory

When only building the tools or docs, without any emulator at all,
there is even an additional message about missing *-config-target.h
files.

Fix it by checking whether any of these files are available before
using them.

Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use ":>" instead of "touch" as suggested by Philippe

 configure | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 963e35b9a7..bf1c740494 100755
--- a/configure
+++ b/configure
@@ -6458,10 +6458,14 @@ fi
 
 # Create list of config switches that should be poisoned in common code...
 # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
-sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
-    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
-    *-config-devices.h *-config-target.h | \
-    sort -u > config-poison.h
+target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
+if test -n "$target_configs_h" ; then
+    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
+        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
+        $target_configs_h | sort -u > config-poison.h
+else
+    :> config-poison.h
+fi
 
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
-- 
2.27.0



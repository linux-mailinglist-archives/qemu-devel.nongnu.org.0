Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF7513B52
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 20:18:11 +0200 (CEST)
Received: from localhost ([::1]:60574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk8iP-0004Cj-JD
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 14:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nk8gE-0002Zi-A4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 14:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nk8g9-0004O2-Tv
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 14:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651169743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JfdnU0t80JXKpkVgIQj8u9e6kXeGymC/6js9qwnIl1I=;
 b=Ja+cJXiD+ao8rEH8lWf36kZNkf4zPNw21QY8I0y+khxksX+K/zl5I5b11i2UKHekpqpvR0
 TT66dkM5V+JVUjAuMvFChU0ZzJc0UGnzcUc6VfryshZPHpt2Q5T+XuTB5u2I1oZcGQLDlQ
 B4b7xI6RTKqQyJfar154flgt8sS5BGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-C0roAY-vNMOoWryszFneyA-1; Thu, 28 Apr 2022 14:15:41 -0400
X-MC-Unique: C0roAY-vNMOoWryszFneyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 640061014A66;
 Thu, 28 Apr 2022 18:15:41 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B92B37C55;
 Thu, 28 Apr 2022 18:15:27 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] configure: Add cross prefix for widl tool
Date: Thu, 28 Apr 2022 21:15:25 +0300
Message-Id: <20220428181525.300521-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mingw-w64-tool package in Fedora provides widl tool with a
cross prefix, so adds it automatically for cross builds.

WIDL env can be used to redefine the path to tool.
The same behavior as with windres.

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 59c43bea05..8b775492d0 100755
--- a/configure
+++ b/configure
@@ -415,6 +415,7 @@ ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
 smbd="$SMBD"
 strip="${STRIP-${cross_prefix}strip}"
+widl="${WIDL-${cross_prefix}widl}"
 windres="${WINDRES-${cross_prefix}windres}"
 pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
 query_pkg_config() {
@@ -2786,6 +2787,7 @@ if test "$skip_meson" = no; then
     echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
   fi
   echo "strip = [$(meson_quote $strip)]" >> $cross
+  echo "widl = [$(meson_quote $widl)]" >> $cross
   echo "windres = [$(meson_quote $windres)]" >> $cross
   if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
@@ -2907,6 +2909,7 @@ preserve_env PYTHON
 preserve_env SDL2_CONFIG
 preserve_env SMBD
 preserve_env STRIP
+preserve_env WIDL
 preserve_env WINDRES
 
 printf "exec" >>config.status
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E592A258B22
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 11:12:46 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD2LN-0004gT-Vz
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 05:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD2KI-0003B8-Hw
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD2KG-0006oa-GH
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598951495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kd76zrZSBhrtrv9l40KcQRV9zyPxef8ChsdSAadfHeU=;
 b=f8XVGEOlhikMG5r7aw+hg3VfQN5xqtKGQVHQKaZr/RgkBXlTgIq4bMIIPOC2SQqaP5yqxT
 9pxSJ6m6lGjVLR7+40sEJW9cnV5T4Dl4lL6q/JKJ7eejiCQa8U1/bdE4LK+YAlVjU9KExa
 zMhEPF+a7Nb/asVtme/NZNBOVychn3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-kMWK6rDzOoieqvg_c8nqFA-1; Tue, 01 Sep 2020 05:11:34 -0400
X-MC-Unique: kMWK6rDzOoieqvg_c8nqFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E3991074641
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 09:11:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C51160C04;
 Tue,  1 Sep 2020 09:11:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] meson: bump submodule to 0.55.1
Date: Tue,  1 Sep 2020 05:11:09 -0400
Message-Id: <20200901091132.29601-2-pbonzini@redhat.com>
In-Reply-To: <20200901091132.29601-1-pbonzini@redhat.com>
References: <20200901091132.29601-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version includes an important bugfix to avoid including unnecessary
-Wl,-rpath flags.  It also avoids the warnings on custom_targets with
more than one output.

Reported-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 meson     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 8dc981684b..f81900880a 100755
--- a/configure
+++ b/configure
@@ -2023,7 +2023,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.0; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.1; then
         meson=meson
     elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
         meson=git
diff --git a/meson b/meson
index d0c68dc115..68ed748f84 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit d0c68dc11507a47b9b85de508e023d9590d60565
+Subproject commit 68ed748f84f14c2d4e62dcbd123816e5898eb04c
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54045671ABF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6iD-0004Nf-9a; Wed, 18 Jan 2023 06:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i5-0004Kx-8Z
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i3-0007Vj-Ju
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBYroXzl8rNtZ74N7ZBiFy7BprfDFqkjIs8yBh/9ijE=;
 b=ZqHIkLRSHPQCAtem90CByRAHnau3uZ1814vYZmVFUxKJiepUXvnnEvSG96qj4IHeaQC6rF
 nBHeEgHUrKgq5wtjog/Q7XlIK6Xq28XFTC6QOwEyYcSCjbKKtubKxEaEhIy3UizZWMrTIg
 51ypCgg602hU6daQ8ofilh+8NWZqb4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-rtMs9j9zNdWmX7dOJGQmoA-1; Wed, 18 Jan 2023 06:34:23 -0500
X-MC-Unique: rtMs9j9zNdWmX7dOJGQmoA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F3AB100F905;
 Wed, 18 Jan 2023 11:34:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA22492B01;
 Wed, 18 Jan 2023 11:34:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/9] Makefile: allow 'make uninstall'
Date: Wed, 18 Jan 2023 12:34:11 +0100
Message-Id: <20230118113418.1650416-3-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

Meson supports an "uninstall", so we can easily allow it to work by
not suppressing the forwarding of it from Make to meson.

We originally suppressed this because Meson's 'uninstall' has a hole
in it: it will remove everything that is installed by a mechanism
meson knows about, but not things installed by "custom install
scripts", and there is no "custom uninstall script" mechanism.

For QEMU, though, the only thing that was being installed by a custom
install script was the LC_MESSAGES files handled by Meson's i18n
module, and that code was fixed in Meson commit 487d45c1e5bfff0fbdb4,
which is present in Meson 0.60.0 and later.  Since we already require
a Meson version newer than that, we're now safe to enable
'uninstall', as it will now correctly uninstall everything that was
installed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/109
Message-Id: <20230110151250.24434-1-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a48103cc8a..ce2f83a684 100644
--- a/Makefile
+++ b/Makefile
@@ -150,7 +150,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
 
-makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
+makefile-targets := build.ninja ctags TAGS cscope dist clean
 # "ninja -t targets" also lists all prerequisites.  If build system
 # files are marked as PHONY, however, Make will always try to execute
 # "ninja build.ninja".
-- 
2.31.1



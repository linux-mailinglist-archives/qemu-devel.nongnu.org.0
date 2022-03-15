Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACFB4D9A77
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:36:24 +0100 (CET)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5TT-0004kI-Et
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:36:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Es-0001w0-Dc
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Eq-00006j-Qg
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647343276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMos71vUp0zmKkr4Wk1mN1pAv4zyr5X108yKXEe+tb8=;
 b=QRAUffVv28q/uuenKntA8c8qf+GFxwhLl+0hGS/jA5NBjqr0T8gTzxpM+ZTDg7GRkxhspM
 vlDVaIYE5DBc5U+NVseGJyEOeRmvH6zyqowhexCDrlqg6sJ1Alf2pBxILkzN3AVkrGhO7l
 nehEBakVrAn39UAP/dJFy4iaV96IPPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-7G64___8M8SEfw64QRKtvw-1; Tue, 15 Mar 2022 07:21:13 -0400
X-MC-Unique: 7G64___8M8SEfw64QRKtvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4970899EC2;
 Tue, 15 Mar 2022 11:21:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E26DAC15D42;
 Tue, 15 Mar 2022 11:21:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] meson: Update to version 0.61.3
Date: Tue, 15 Mar 2022 12:20:52 +0100
Message-Id: <20220315112052.515467-9-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-1-thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson 0.61.3 contains an important fix which helps to see the
output of failed qemu-iotests on the console again:
https://gitlab.com/qemu-project/meson/-/commit/7534cf34f83b9c43

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220315093220.407895-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 meson     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 886000346a..8e3c41ff92 100755
--- a/configure
+++ b/configure
@@ -1286,7 +1286,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.3; then
         meson=meson
     elif test $git_submodules_action != 'ignore' ; then
         meson=git
diff --git a/meson b/meson
index 12f9f04ba0..5cf5575a7c 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
+Subproject commit 5cf5575a7c76746935dcd9a9e380803c85023c04
-- 
2.27.0



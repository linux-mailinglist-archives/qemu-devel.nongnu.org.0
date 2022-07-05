Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53949566895
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:51:17 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g9E-0002lu-Em
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fxE-00070s-3g
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fxB-00062X-VQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLwGLwZxnn+6zX9uqpPc5dqIsTCJGhsp/yCnEiJdqGA=;
 b=FPVjek0BFPkzREZIWuYBd4NNk6kMe+gLIuZQSM7KeAVeU1dYOrD6g7Xc9jn651bc8zkpnS
 qmIpLBzN15YVpRDnY9nRVn1Hfm+UHoRI7mbQST08bffoz0zmmU1a2/xwmSTfddPJ/5Iujx
 xl1hh+kLPjItESmU2vzwdysPPWo+4jI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624--zqa3QaYNtOi-BiALELGLw-1; Tue, 05 Jul 2022 06:38:42 -0400
X-MC-Unique: -zqa3QaYNtOi-BiALELGLw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2599029ABA16;
 Tue,  5 Jul 2022 10:38:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65845492C3B;
 Tue,  5 Jul 2022 10:38:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/14] meson.build: Require a recent version of libpng
Date: Tue,  5 Jul 2022 12:38:15 +0200
Message-Id: <20220705103816.608166-14-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to https://gitlab.com/qemu-project/qemu/-/issues/1080#note_998088246
QEMU does not compile with older versions of libpng, so we should check
for a good version in meson.build. According to repology.org, our supported
host target operating systems ship these versions:

             Fedora 35: 1.6.37
     CentOS 8 (RHEL-8): 1.6.34
             Debian 11: 1.6.37
    OpenSUSE Leap 15.3: 1.6.34
      Ubuntu LTS 20.04: 1.6.37
         FreeBSD Ports: 1.6.37
         NetBSD pkgsrc: 1.6.37
         OpenBSD Ports: 1.6.37
              Homebrew: 1.6.37
           MSYS2 mingw: 1.6.37

So it seem reasonable to require at least libpng version 1.6.34 for
our builds.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1080
Message-Id: <20220623174941.531196-1-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f34ae9a5f8..bc5569ace1 100644
--- a/meson.build
+++ b/meson.build
@@ -1209,7 +1209,7 @@ if gtkx11.found()
 endif
 png = not_found
 if get_option('png').allowed() and have_system
-   png = dependency('libpng', required: get_option('png'),
+   png = dependency('libpng', version: '>=1.6.34', required: get_option('png'),
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 vnc = not_found
-- 
2.31.1



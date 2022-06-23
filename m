Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B205584F2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 19:51:33 +0200 (CEST)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4QzM-0008Jo-4q
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 13:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4Qxm-00078d-8o
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4Qxi-00064x-FY
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656006589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7c6Nc+33jpRbsSRBQ3YO+LiLWzcTuFI4JLk8eCuDKyg=;
 b=eJya3+S+BN777EEv//BnUYfLi/CHX+x0D9B3BPMtKRB3NXmteXp61IXsr49GWxAAAAQXhn
 bwEcIudFU/Bum7rkxFzi2tkf0G45ZUyNNhLHtJZFOZcWahVHzcFBdZXApJhmDOUJXQp95R
 SLYbVTRxorM/DczH9v0Z79kjc3b+M70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-g_BUalupO6OEij5lkzyaDQ-1; Thu, 23 Jun 2022 13:49:45 -0400
X-MC-Unique: g_BUalupO6OEij5lkzyaDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85D6181D9CC;
 Thu, 23 Jun 2022 17:49:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D71F040C5BF;
 Thu, 23 Jun 2022 17:49:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 kraxel@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>
Subject: [PATCH] meson.build: Require a recent version of libpng
Date: Thu, 23 Jun 2022 19:49:41 +0200
Message-Id: <20220623174941.531196-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 094c4ce832..164ecb2fab 100644
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



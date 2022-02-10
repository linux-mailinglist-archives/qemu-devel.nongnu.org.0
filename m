Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB04B0CBE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:48:40 +0100 (CET)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7wF-0004pf-Nr
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7sP-0002Iu-Uf
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:44:41 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7sL-0007KD-Ou
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:44:40 -0500
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0291D2E0F0C
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:44:31 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 JfaVu3ethL-iUIWB4dw; Thu, 10 Feb 2022 14:44:30 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644493470; bh=AP4mBhv/GTqS6oIW60VLTkhD6faNFMbRPzjAXMjMx64=;
 h=Date:To:From:Subject:Message-ID:Cc;
 b=n2jM+Nxu3YXsO+Fy8rZNqsKJ8yzv0gNGLlfJBC/XdAmha0R+4JM6sfZRBYBO8KAmA
 qI6FonwAwwM113oKhhnsbJxknU4zOWdUXmmzwzQoDOGdqjOway/vV/vcNk4SonOy5b
 3ymQj/8PYNJ4u+OnfKyY4d0USRLNH1/I1rMDf3ek=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8101::1:28])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 1LiQvvZWCt-iUJSmxO9; Thu, 10 Feb 2022 14:44:30 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH] meson: put custom CFLAGS after default CFLAGS
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Feb 2022 14:44:30 +0300
Message-ID: <164449347000.2210159.3879447183273643758.stgit@dynamic-vpn.dhcp.yndx.net>
User-Agent: StGit/1.4.dev11+gd5bef96
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Flags passed to configure must be at the end to override defaults.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 meson.build |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 5f43355071..d94f3ee3e3 100644
--- a/meson.build
+++ b/meson.build
@@ -3293,13 +3293,13 @@ if targetos == 'windows'
     summary_info += {'Windows SDK':   config_host['WIN_SDK']}
   endif
 endif
-summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+summary_info += {'CFLAGS':            ' '.join(['-O' + get_option('optimization')]
+                                               + (get_option('debug') ? ['-g'] : [])
+                                               + get_option('c_args'))}
 if link_language == 'cpp'
-  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+  summary_info += {'CXXFLAGS':        ' '.join(['-O' + get_option('optimization')]
+                                               + (get_option('debug') ? ['-g'] : [])
+                                               + get_option('cpp_args'))}
 endif
 link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0



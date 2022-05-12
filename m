Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A95251A3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:52:55 +0200 (CEST)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB7W-0000JD-U6
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npB44-0005ya-7z
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npB42-00065b-Oh
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652370558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SKEHNJL7lCcL+gA2S/7xARkFW+2IQjWFZsjyDgbiPgE=;
 b=X4u/JaeSPQWtt2A5pSZ/Thvhs13D6qCS7HuCf/uAgu19QkxlfBFEo7oof2KEHp/XuH69g/
 rHXsvQcwyazAWzEAEKPiu8QLqHiZ9IGZ+eDXKK9y02ZiYq43di4jHOCtuaU5a6wRrOyvEx
 XHqdFMuAzcQi4YK7PBloXXNdlZWxGTs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-F5p5orHINzCzlhcomhs0og-1; Thu, 12 May 2022 11:49:10 -0400
X-MC-Unique: F5p5orHINzCzlhcomhs0og-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 378113C7B127;
 Thu, 12 May 2022 15:49:09 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212164010A1B;
 Thu, 12 May 2022 15:49:07 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH] qga-vss: Add auto generated headers to dependencies
Date: Thu, 12 May 2022 18:49:06 +0300
Message-Id: <20220512154906.331399-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/vss-win32/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 26c5dd6e0e..9483ccd3b8 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -7,7 +7,7 @@ link_args = cc.get_supported_link_arguments([
 
 qga_vss = shared_module(
   'qga-vss',
-  ['requester.cpp', 'provider.cpp', 'install.cpp'],
+  ['requester.cpp', 'provider.cpp', 'install.cpp', genh],
   name_prefix: '',
   cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
   link_args: link_args,
-- 
2.25.1


